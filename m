Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2E295125
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 18:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10118.26724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVHMs-0002NS-Si; Wed, 21 Oct 2020 16:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10118.26724; Wed, 21 Oct 2020 16:53:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVHMs-0002N3-PF; Wed, 21 Oct 2020 16:53:42 +0000
Received: by outflank-mailman (input) for mailman id 10118;
 Wed, 21 Oct 2020 16:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVHMr-0002My-Uy
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:53:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8675a79f-4375-439e-86e0-7001351bea17;
 Wed, 21 Oct 2020 16:53:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVHMr-0002My-Uy
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:53:42 +0000
X-Inumbo-ID: 8675a79f-4375-439e-86e0-7001351bea17
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8675a79f-4375-439e-86e0-7001351bea17;
	Wed, 21 Oct 2020 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603299220;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pGLUYrgKfbt27QziQs8IU9vQTxO7MYaXgcxQoQKaQgI=;
  b=IJCj2TjkjeBARGp0LZHpY7wjM8bloYvyKe1L/StFEnlUqL4emnpo07UF
   K1kuygdILVVMumfi/oZv9bL9c8x8LFSAxduMbIqBsXuFmSMRr8laqPh71
   qnpPZN9sLaVL6lpTKyOI1hXTfzkhEJoBkzRyvzUwLY0RMTbXxFTuiPi57
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xwtpIL3xebimPrSkhT64oPOtMbqNU22vaZVVDEEbYF5vua5ZBvjXlYkV/Hq4M03rkOG/kkRD6V
 SX96RV4KWkVIPXtQrpdhE0vPJPcqnixZtBayMYa4vXuZ6j8we9ZdfKbg/hChtkkZcHDV1T8Z09
 iB4JeCaSe/NeVnJUaI4t9wjZXX/88cmWhyCRmPNFc3S5F+8K2E2SwdCL+XxgDFSN4GNV4+ycg+
 JWxXo4xqTbAqha2gj3QWKXm8HJonWY16C4i+5U8nBNpDwWgQmge1ScyBIkiiSNRjdR8GB0Wo/b
 UnI=
X-SBRS: 2.5
X-MesageID: 29833932
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29833932"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201021130708.12249-1-andrew.cooper3@citrix.com>
 <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
 <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
 <cd2bdd84-4b78-7f19-81a2-ffd358cb3b13@citrix.com>
Message-ID: <72c9dfbd-3ace-ee66-51a6-9490cdf5ffc9@citrix.com>
Date: Wed, 21 Oct 2020 17:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cd2bdd84-4b78-7f19-81a2-ffd358cb3b13@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 16:55, Andrew Cooper wrote:
> On 21/10/2020 16:39, Andrew Cooper wrote:
>>>> @@ -4051,27 +4057,28 @@ long do_mmu_update(
>>>>                          break;
>>>>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>>>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>>>> -                    if ( !rc && pt_owner->arch.pv.xpti )
>>>> +                    /* Paging structure maybe changed.  Flush linear range. */
>>>> +                    if ( !rc )
>>>>                      {
>>>> -                        bool local_in_use = false;
>>>> +                        bool local_in_use = mfn_eq(
>>>> +                            pagetable_get_mfn(curr->arch.guest_table), mfn);
>>>>  
>>>> -                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
>>>> -                                    mfn) )
>>>> -                        {
>>>> -                            local_in_use = true;
>>>> -                            get_cpu_info()->root_pgt_changed = true;
>>>> -                        }
>>>> +                        flush_flags_all |= FLUSH_TLB;
>>>> +
>>>> +                        if ( local_in_use )
>>>> +                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;
>>> Aiui here (and in the code consuming the flags) you build upon
>>> flush_flags_local, when not zero, always being a superset of
>>> flush_flags_all. I think this is a trap to fall into when later
>>> wanting to change this code, but as per below this won't hold
>>> anymore anyway, I think. Hence here I think you want to set
>>> FLUSH_TLB unconditionally, and above for L3 and L2 you want to
>>> set it in both variables. Or, if I'm wrong below, a comment to
>>> that effect may help people avoid falling into this trap.
>>>
>>> An alternative would be to have
>>>
>>>     flush_flags_local |= (flush_flags_all & FLUSH_TLB);
>>>
>>> before doing the actual flush.
> Also, what I forgot to say in the previous reply, this is still buggy if
> hypothetically speaking FLUSH_CACHE had managed to be accumulated in
> flush_flags_all.
>
> You cannot have general accumulation logic, a special case for local,
> and any catch-all logic like that, because the only correct way to do
> the catch-all logic will clobber the special case for local.

I'm going to try a 3rd time with flush_flags and local_may_skip which
defaults to GLOBAL|ROOT_PGTBL, and may get clobbered.

This seems like it might be a less fragile way of expressing the
optimisation.

~Andrew

