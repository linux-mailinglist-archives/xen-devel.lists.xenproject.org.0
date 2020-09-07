Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CA25F479
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 10:02:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFC5v-0006V1-Ap; Mon, 07 Sep 2020 08:01:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFC5u-0006Uw-Dm
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 08:01:42 +0000
X-Inumbo-ID: 04e741fa-8397-4351-8848-ae525fa2c43c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04e741fa-8397-4351-8848-ae525fa2c43c;
 Mon, 07 Sep 2020 08:01:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A5EDAEE5;
 Mon,  7 Sep 2020 08:01:41 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] x86/pv: Rewrite segment context switching from
 scratch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
References: <20200904135209.29226-1-andrew.cooper3@citrix.com>
 <20200904135209.29226-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fbb109f-c29f-a61c-9a2e-cfa2e6891c3d@suse.com>
Date: Mon, 7 Sep 2020 10:01:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904135209.29226-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 04.09.2020 15:52, Andrew Cooper wrote:
> There are multiple bugs with the existing implementation.
> 
> On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
> segment base, which is a problem for 64bit code which typically expects to use
> a NUL %fs/%gs selector.
> 
> On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
> selector which faults, the fixup logic loads NUL, and the guest is entered at
> the failsafe callback with the stale base.
> 
> Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
> 32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
> with a stale base.
> 
> Both of these corner cases manifest as state corruption in the final vcpu.
> However, damage is limited to to 64bit code expecting to use Thread Local
> Storage with a base pointer of 0, which doesn't occur by default.
> 
> The context switch logic is extremely complicated, and is attempting to
> optimise away loading a NUL selector (which is fast), or writing a 64bit base
> of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
> userspace, which manifests as userspace state corruption as far as Linux is
> concerned.
> 
> Always restore all selector and base state, in all cases.
> 
> Leave a large comment explaining hardware behaviour, and the new ABI
> expectations.  Update the comments in the public headers.
> 
> Drop all "segment preloading" to handle the AMD corner case.  It was never
> anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
> bases are unconditionally written for 64bit PV guests.  In load_segments(),
> store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
> and not used in a way which impacts speculative safety.
> 
> Reported-by: Andy Lutomirski <luto@kernel.org>
> Reported-by: Sarah Newman <srn@prgmr.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andy Lutomirski <luto@kernel.org>
> CC: Sarah Newman <srn@prgmr.com>
> 
> v2:
>  * Some save_segments() content pulled out into an earlier patch.
>  * Extra fix in arch_set_info_guest() due to the new ABI adjustments.

Oh, yes, of course.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

