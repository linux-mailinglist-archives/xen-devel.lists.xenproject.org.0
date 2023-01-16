Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC7766C5D3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478831.742261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS4H-0003QT-0O; Mon, 16 Jan 2023 16:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478831.742261; Mon, 16 Jan 2023 16:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS4G-0003Na-T3; Mon, 16 Jan 2023 16:10:40 +0000
Received: by outflank-mailman (input) for mailman id 478831;
 Mon, 16 Jan 2023 16:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGc4=5N=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pHS4F-0003NU-D8
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:10:39 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fba73af-95b8-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 17:10:37 +0100 (CET)
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140]
 helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pHS49-00Ec49-Pd;
 Mon, 16 Jan 2023 11:10:33 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4fba73af-95b8-11ed-91b6-6bf2151ebd3b
Subject: Re: [PATCH] x86/paravirt: merge activate_mm and dup_mmap callbacks
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20230112152132.4399-1-jgross@suse.com>
 <3fcb5078-852e-0886-c084-7fb0cfa5b757@csail.mit.edu>
 <27d08d32-1a17-0959-203f-39e769f555d1@suse.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <6a8e25eb-758d-8ad6-23c1-5fea7dab3b09@csail.mit.edu>
Date: Mon, 16 Jan 2023 08:10:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <27d08d32-1a17-0959-203f-39e769f555d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/15/23 10:43 PM, Juergen Gross wrote:
> On 16.01.23 05:27, Srivatsa S. Bhat wrote:
>>
>> Hi Juergen,
>>
>> On 1/12/23 7:21 AM, Juergen Gross wrote:
>>> The two paravirt callbacks .mmu.activate_mm and .mmu.dup_mmap are
>>> sharing the same implementations in all cases: for Xen PV guests they
>>> are pinning the PGD of the new mm_struct, and for all other cases
>>> they are a NOP.
>>>
>>
>> I was expecting that the duplicated functions xen_activate_mm() and
>> xen_dup_mmap() would be merged into a common one, and that both
>> .mmu.activate_mm and .mmu.dup_mmap callbacks would be mapped to that
>> common implementation for Xen PV.
>>
>>> So merge them to a common callback .mmu.enter_mmap (in contrast to the
>>> corresponding already existing .mmu.exit_mmap).
>>>
>>
>> Instead, this patch seems to be merging the callbacks themselves...
>>
>> I see that's not an issue right now since there is no other actual
>> user for these callbacks. But are we sure that merging the callbacks
>> just because the current user (Xen PV) has the same implementation for
>> both is a good idea? The callbacks are invoked at distinct points from
>> fork/exec, so wouldn't it be valuable to retain that distinction in
>> semantics in the callbacks as well?
>>
>> However, if you believe that two separate callbacks are not really
>> required here (because there is no significant difference in what they
>> mean, rather than because their callback implementations happen to be
>> the same right now), then could you please expand on this and call it
>> out in the commit message, please?
> 
> Would you be fine with:
> 
>   In the end both callbacks are meant to register an address space with the
>   underlying hypervisor, so there needs to be only a single callback for that
>   purpose.
> 

Sure, that looks good. Thank you!
 
Regards,
Srivatsa
VMware Photon OS

