Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51204007F7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 00:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178521.324606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHz2-0003dB-Qs; Fri, 03 Sep 2021 22:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178521.324606; Fri, 03 Sep 2021 22:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHz2-0003aO-La; Fri, 03 Sep 2021 22:48:28 +0000
Received: by outflank-mailman (input) for mailman id 178521;
 Fri, 03 Sep 2021 22:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mMHz1-0003BT-KI
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 22:48:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc5df30c-29ca-4894-a89b-066a0aa2911f;
 Fri, 03 Sep 2021 22:48:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 119826101A;
 Fri,  3 Sep 2021 22:48:26 +0000 (UTC)
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
X-Inumbo-ID: fc5df30c-29ca-4894-a89b-066a0aa2911f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630709306;
	bh=jT3rD3kg3gdlzCnptl4+hGg4HVNl2HPkKyI+a61ElnA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aEtBse5+IXOr4g/JSLovXb6l/if47EWlzriShx6CzKz1NLZ+t56xxxYeSpGo/eclf
	 +Ky9yqiR2uB7b3KcjClz9JJA6/AIjHR1Y9TpRfF5I/j0QnB9Wnv2LDYYQ07MykpjqP
	 NPpfrwDMfNyTafG+SdN5FcLiYoAI9FdEN87CroTBhBXnlMdH0ii77mU8tPQHhQ/PGU
	 jd+2O5d1+irmcLfvOW0ud187rgh37TxyavhudmVzpgCVSHEH/uav4GeQc8FCMUVeyn
	 uL9G4v8TGebawV2191LY7dhq48tX1LLBUCQJmFOHlnUNtnwSjRKHlhBeAr5KX0QY6+
	 nkaieVjWOMvDQ==
Date: Fri, 3 Sep 2021 15:48:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/7] xen/arm: Use sanitize values for p2m
In-Reply-To: <dbc702844a4322db69a1b0a56ab57be66f4d6174.1629897306.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2109031527070.26072@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <dbc702844a4322db69a1b0a56ab57be66f4d6174.1629897306.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Aug 2021, Bertrand Marquis wrote:
> Replace the code in p2m trying to find a sane value for the VMID size
> supported and the PAR to use. We are now using the boot cpuinfo as the
> values there are sanitized during boot and the value for those
> parameters is now the safest possible value on the system.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3: drop arm32 mention in commmit message
> Changes in v2:
>  - use system_cpuinfo
> ---
>  xen/arch/arm/p2m.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index eff9a105e7..41b6430c30 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2045,31 +2045,21 @@ void __init setup_virt_paging(void)
>          [7] = { 0 }  /* Invalid */
>      };
>  
> -    unsigned int i, cpu;
> +    unsigned int i;
>      unsigned int pa_range = 0x10; /* Larger than any possible value */
> -    bool vmid_8_bit = false;
> -
> -    for_each_online_cpu ( cpu )
> -    {
> -        const struct cpuinfo_arm *info = &cpu_data[cpu];
>  
> -        /*
> -         * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> -         * with IPA bits == PA bits, compare against "pabits".
> -         */
> -        if ( pa_range_info[info->mm64.pa_range].pabits < p2m_ipa_bits )
> -            p2m_ipa_bits = pa_range_info[info->mm64.pa_range].pabits;
> -
> -        /* Set a flag if the current cpu does not support 16 bit VMIDs. */
> -        if ( info->mm64.vmid_bits != MM64_VMID_16_BITS_SUPPORT )
> -            vmid_8_bit = true;
> -    }
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
>  
>      /*
> -     * If the flag is not set then it means all CPUs support 16-bit
> -     * VMIDs.
> +     * cpu info sanitization made sure we support 16bits VMID only if all
> +     * cores are supporting it.
>       */
> -    if ( !vmid_8_bit )
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>          max_vmid = MAX_VMID_16_BIT;
>  
>      /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
> -- 
> 2.17.1
> 

