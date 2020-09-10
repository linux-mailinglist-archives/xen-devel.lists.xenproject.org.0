Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F722264885
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGO1I-0008IZ-TH; Thu, 10 Sep 2020 14:57:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGO1G-0008IU-Jn
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:57:50 +0000
X-Inumbo-ID: 1da8f317-bc86-4939-aba2-67e73715acd1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1da8f317-bc86-4939-aba2-67e73715acd1;
 Thu, 10 Sep 2020 14:57:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57D67B1D7;
 Thu, 10 Sep 2020 14:58:04 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/pv: Optimise prefetching in svm_load_segs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b014b917-f6ca-bbc0-22f6-14993aa84c8d@suse.com>
Date: Thu, 10 Sep 2020 16:57:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909095920.25495-4-andrew.cooper3@citrix.com>
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

On 09.09.2020 11:59, Andrew Cooper wrote:
> Split into two functions.  Passing a load of zeros in results in somewhat poor
> register scheduling in __context_switch().

I'm afraid I don't understand why this would be, no matter that
I trust you having observed this being the case: The registers
used for passing parameters are all call-clobbered anyway, so
the compiler can't use them for anything across the call. And
it would look pretty poor code generation wise if the XORs to
clear them (which effectively have no latency at all) would be
scheduled far ahead of the call, especially when there's better
use for the registers. The observation wasn't possibly from
before your recent dropping of two of the parameters, when they
couldn't all be passed in registers (albeit even then it would
be odd, as the change then should merely have lead to a slightly
smaller stack frame of the function)?

> Update the prefetching comment to note that the main point is the TLB fill.
> 
> Reorder the writes in svm_load_segs() to access the VMCB fields in ascending
> order, which gets better next-line prefetch behaviour out of hardware.  Update
> the prefetch instruction to match.
> 
> The net delta is:
> 
>   add/remove: 1/0 grow/shrink: 0/2 up/down: 38/-39 (-1)
>   Function                                     old     new   delta
>   svm_load_segs_prefetch                         -      38     +38
>   __context_switch                             967     951     -16
>   svm_load_segs                                291     268     -23

A net win of 1 byte ;-)

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1520,6 +1520,19 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
>  }
>  
>  #ifdef CONFIG_PV
> +void svm_load_segs_prefetch(void)
> +{
> +    struct vmcb_struct *vmcb = this_cpu(host_vmcb_va);

const?

> +    if ( vmcb )
> +        /*
> +         * The main reason for this prefetch is for the TLB fill.  Use the
> +         * opporunity to fetch the lowest address used, to get the best
> +         * behaviour out of hardwares next-line prefetcher.

Nit: "opportunity" and "hardware's" ?

I'm not opposed to the change, but before giving my R-b I'd like to
understand the register scheduling background a little better.

Jan

