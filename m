Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C8826A0D5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 10:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI6Hv-0005Qr-Bm; Tue, 15 Sep 2020 08:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI6Ht-0005Ql-Ab
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 08:26:05 +0000
X-Inumbo-ID: d93e2fd8-6877-4841-94dc-a32ff0a1b7a8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d93e2fd8-6877-4841-94dc-a32ff0a1b7a8;
 Tue, 15 Sep 2020 08:26:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CEF60AC26;
 Tue, 15 Sep 2020 08:26:18 +0000 (UTC)
Subject: Re: [PATCH v3] x86/HVM: more consistently set I/O completion
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
Message-ID: <940134ca-9917-7260-679a-a14ac4e5d099@suse.com>
Date: Tue, 15 Sep 2020 10:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.08.2020 09:09, Jan Beulich wrote:
> Doing this just in hvm_emulate_one_insn() is not enough.
> hvm_ud_intercept() and hvm_emulate_one_vm_event() can get invoked for
> insns requiring one or more continuations, and at least in principle
> hvm_emulate_one_mmio() could, too. Without proper setting of the field,
> handle_hvm_io_completion() will do nothing completion-wise, and in
> particular the missing re-invocation of the insn emulation paths will
> lead to emulation caching not getting disabled in due course, causing
> the ASSERT() in {svm,vmx}_vmenter_helper() to trigger.
> 
> Reported-by: Don Slutz <don.slutz@gmail.com>
> 
> Similar considerations go for the clearing of vio->mmio_access, which
> gets moved as well.
> 
> Additionally all updating of vio->mmio_* now gets done dependent upon
> the new completion value, rather than hvm_ioreq_needs_completion()'s
> return value. This is because it is the completion chosen which controls
> what path will be taken when handling the completion, not the simple
> boolean return value. In particular, PIO completion doesn't involve
> going through the insn emulator, and hence emulator state ought to get
> cleared early (or it won't get cleared at all).
> 
> The new logic, besides allowing for a caller override for the
> continuation type to be set (for VMX real mode emulation), will also
> avoid setting an MMIO completion when a simpler PIO one will do. This
> is a minor optimization only as a side effect - the behavior is strictly
> needed at least for hvm_ud_intercept(), as only memory accesses can
> successfully complete through handle_mmio(). Care of course needs to be
> taken to correctly deal with "mixed" insns (doing both MMIO and PIO at
> the same time, i.e. INS/OUTS). For this, hvmemul_validate() now latches
> whether the insn being emulated is a memory access, as this information
> is no longer easily available at the point where we want to consume it.
> 
> Note that the presence of non-NULL .validate fields in the two ops
> structures in hvm_emulate_one_mmio() was really necessary even before
> the changes here: Without this, passing non-NULL as middle argument to
> hvm_emulate_init_once() is meaningless.
> 
> The restrictions on when the #UD intercept gets actually enabled are why
> it was decided that this is not a security issue:
> - the "hvm_fep" option to enable its use is a debugging option only,
> - for the cross-vendor case is considered experimental, even if
>   unfortunately SUPPORT.md doesn't have an explicit statement about
>   this.
> The other two affected functions are
> - hvm_emulate_one_vm_event(), used for introspection,
> - hvm_emulate_one_mmio(), used for Dom0 only,
> which aren't qualifying this as needing an XSA either.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Don Slutz <don.slutz@gmail.com>
> ---
> v3: Add comment ahead of _hvm_emulate_one(). Add parentheses in a
>     conditional expr. Justify why this does not need an XSA.
> v2: Make updating of vio->mmio_* fields fully driven by the new
>     completion value.
> ---
> I further think that the entire tail of _hvm_emulate_one() (everything
> past the code changed/added there by this patch) wants skipping in case
> a completion is needed, at the very least for the mmio and realmode
> cases, where we know we'll come back here.

Does one of the two of you have an opinion on this aspect?

Jan

