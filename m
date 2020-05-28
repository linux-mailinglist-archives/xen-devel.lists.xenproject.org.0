Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AA1E6165
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 14:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeHzB-0005aJ-Da; Thu, 28 May 2020 12:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeHzA-0005aE-Iz
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 12:50:12 +0000
X-Inumbo-ID: c423aa72-a0e1-11ea-a7c5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c423aa72-a0e1-11ea-a7c5-12813bfff9fa;
 Thu, 28 May 2020 12:50:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A44EBAA35;
 Thu, 28 May 2020 12:50:09 +0000 (UTC)
Subject: Re: [PATCH v2 06/14] x86/shstk: Create shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
Date: Thu, 28 May 2020 14:50:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-7-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 21:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -769,6 +769,30 @@ void load_system_tables(void)
>  	tss->rsp1 = 0x8600111111111111ul;
>  	tss->rsp2 = 0x8600111111111111ul;
>  
> +	/* Set up the shadow stack IST. */
> +	if (cpu_has_xen_shstk) {
> +		volatile uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
> +
> +		/*
> +		 * Used entries must point at the supervisor stack token.
> +		 * Unused entries are poisoned.
> +		 *
> +		 * This IST Table may be live, and the NMI/#MC entries must
> +		 * remain valid on every instruction boundary, hence the
> +		 * volatile qualifier.
> +		 */

Move this comment ahead of what it comments on, as we usually have it?

> +		ist_ssp[0] = 0x8600111111111111ul;
> +		ist_ssp[IST_MCE] = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
> +		ist_ssp[IST_NMI] = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
> +		ist_ssp[IST_DB]	 = stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
> +		ist_ssp[IST_DF]	 = stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;

Strictly speaking you want to introduce

#define IST_SHSTK_SLOT 0

next to PRIMARY_SHSTK_SLOT and use

		ist_ssp[IST_MCE] = stack_top + (IST_SHSTK_SLOT * PAGE_SIZE) +
                                               (IST_MCE * IST_SHSTK_SIZE) - 8;

etc here. It's getting longish, so I'm not going to insist. But if you
go this route, then please also below / elsewhere.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5994,12 +5994,33 @@ void memguard_unguard_range(void *p, unsigned long l)
>  
>  #endif
>  
> +static void write_sss_token(unsigned long *ptr)
> +{
> +    /*
> +     * A supervisor shadow stack token is its own linear address, with the
> +     * busy bit (0) clear.
> +     */
> +    *ptr = (unsigned long)ptr;
> +}
> +
>  void memguard_guard_stack(void *p)
>  {
> -    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
> +    /* IST Shadow stacks.  4x 1k in stack page 0. */
> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
> +    {
> +        write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
> +        write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
> +        write_sss_token(p + (IST_DB  * IST_SHSTK_SIZE) - 8);
> +        write_sss_token(p + (IST_DF  * IST_SHSTK_SIZE) - 8);

Up to now two successive memguard_guard_stack() were working fine. This
will be no longer the case, just as an observation.

> +    }
> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);

As already hinted at in reply to the previous patch, I think this wants
to remain _PAGE_NONE when we don't use CET-SS.

> +    /* Primary Shadow Stack.  1x 4k in stack page 5. */
>      p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
> -    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
> +        write_sss_token(p + PAGE_SIZE - 8);
> +
> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
>  }
>  
>  void memguard_unguard_stack(void *p)

Would this function perhaps better zap the tokens?

Jan

