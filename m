Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389AB465589
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236182.409665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUQV-0001zi-DO; Wed, 01 Dec 2021 18:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236182.409665; Wed, 01 Dec 2021 18:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUQV-0001xv-AG; Wed, 01 Dec 2021 18:33:55 +0000
Received: by outflank-mailman (input) for mailman id 236182;
 Wed, 01 Dec 2021 18:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msUQT-0001xp-N5
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:33:53 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0eeecd-52d5-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 19:33:52 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50694)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msUQQ-0011V0-gr (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 18:33:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 087E71FD7A;
 Wed,  1 Dec 2021 18:33:50 +0000 (GMT)
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
X-Inumbo-ID: 3b0eeecd-52d5-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <639244eb-074a-ef90-3bbb-747ac65fa6b7@srcf.net>
Date: Wed, 1 Dec 2021 18:33:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
 <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] x86/shadow: defer/avoid paging_mfn_is_dirty()
 invocation
In-Reply-To: <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 10:35, Jan Beulich wrote:
> paging_mfn_is_dirty() is moderately expensive, so avoid its use unless
> its result might actually change anything. This means moving the
> surrounding if() down below all other checks that can result in clearing
> _PAGE_RW from sflags, in order to then check whether _PAGE_RW is
> actually still set there before calling the function.
>
> While moving the block of code, fold two if()s and make a few style
> adjustments.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Perhaps the dirty-VRAM piece also wants moving down a little, such
>      that all three "level == 1" conditionals can be folded?

TBH, lots of the layout looks dubious, but I'm not sure how worthwhile
micro-optimising it is.  This particular rearrangement is surely
unmeasurable.

Fixing the (mis)use of mfn_valid() in the logdirty infrastructure will
gain a far larger improvement, because that's dropping a fair number of
lfence's from multiple paths, but it's still the case that anything here
is rare-to-non-existent in production workloads, and vastly dominated by
the VMExit cost even when migrating shadow VMs.

>
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -604,23 +604,6 @@ _sh_propagate(struct vcpu *v,
>                    && !(gflags & _PAGE_DIRTY)) )
>          sflags &= ~_PAGE_RW;
>  
> -    // shadow_mode_log_dirty support
> -    //
> -    // Only allow the guest write access to a page a) on a demand fault,
> -    // or b) if the page is already marked as dirty.
> -    //
> -    // (We handle log-dirty entirely inside the shadow code, without using the
> -    // p2m_ram_logdirty p2m type: only HAP uses that.)
> -    if ( unlikely((level == 1) && shadow_mode_log_dirty(d)) )
> -    {
> -        if ( mfn_valid(target_mfn) ) {
> -            if ( ft & FETCH_TYPE_WRITE )
> -                paging_mark_dirty(d, target_mfn);
> -            else if ( !paging_mfn_is_dirty(d, target_mfn) )
> -                sflags &= ~_PAGE_RW;
> -        }
> -    }
> -
>  #ifdef CONFIG_HVM
>      if ( unlikely(level == 1) && is_hvm_domain(d) )
>      {
> @@ -661,6 +644,25 @@ _sh_propagate(struct vcpu *v,
>                    ) )
>          sflags &= ~_PAGE_RW;
>  
> +    /*
> +     * shadow_mode_log_dirty support
> +     *
> +     * Only allow the guest write access to a page a) on a demand fault,
> +     * or b) if the page is already marked as dirty.
> +     *
> +     * (We handle log-dirty entirely inside the shadow code, without using the
> +     * p2m_ram_logdirty p2m type: only HAP uses that.)
> +     */
> +    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) &&
> +         mfn_valid(target_mfn) )
> +    {
> +        if ( ft & FETCH_TYPE_WRITE )
> +            paging_mark_dirty(d, target_mfn);
> +        else if ( (sflags & _PAGE_RW) &&
> +                  !paging_mfn_is_dirty(d, target_mfn) )
> +            sflags &= ~_PAGE_RW;

This is almost crying out for a logdirty_test_and_maybe_set() helper,
because the decent of the logdirty trie is common between the two, but
as this would be the only user, probably not worth it.

However, the more I look at the logdirty logic, the more it is clear
that all the mfn_valid() tests should change to MFN_INVALID, and the
result will be far more efficient.

~Andrew

> +    }
> +
>      // PV guests in 64-bit mode use two different page tables for user vs
>      // supervisor permissions, making the guest's _PAGE_USER bit irrelevant.
>      // It is always shadowed as present...
>
>


