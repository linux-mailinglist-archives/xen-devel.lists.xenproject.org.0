Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DA1E87F1
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 21:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jekmo-0000Uj-Hl; Fri, 29 May 2020 19:35:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jekmn-0000UZ-4F
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 19:35:21 +0000
X-Inumbo-ID: 87dcf336-a1e3-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87dcf336-a1e3-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 19:35:20 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:42118
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jekmj-000WiI-Lp (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 20:35:17 +0100
Subject: Re: [PATCH v2 06/14] x86/shstk: Create shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-7-andrew.cooper3@citrix.com>
 <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
Date: Fri, 29 May 2020 20:35:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 28/05/2020 13:50, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -769,6 +769,30 @@ void load_system_tables(void)
>>  	tss->rsp1 = 0x8600111111111111ul;
>>  	tss->rsp2 = 0x8600111111111111ul;
>>  
>> +	/* Set up the shadow stack IST. */
>> +	if (cpu_has_xen_shstk) {
>> +		volatile uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
>> +
>> +		/*
>> +		 * Used entries must point at the supervisor stack token.
>> +		 * Unused entries are poisoned.
>> +		 *
>> +		 * This IST Table may be live, and the NMI/#MC entries must
>> +		 * remain valid on every instruction boundary, hence the
>> +		 * volatile qualifier.
>> +		 */
> Move this comment ahead of what it comments on, as we usually have it?
>
>> +		ist_ssp[0] = 0x8600111111111111ul;
>> +		ist_ssp[IST_MCE] = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
>> +		ist_ssp[IST_NMI] = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
>> +		ist_ssp[IST_DB]	 = stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
>> +		ist_ssp[IST_DF]	 = stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;
> Strictly speaking you want to introduce
>
> #define IST_SHSTK_SLOT 0
>
> next to PRIMARY_SHSTK_SLOT and use
>
> 		ist_ssp[IST_MCE] = stack_top + (IST_SHSTK_SLOT * PAGE_SIZE) +
>                                                (IST_MCE * IST_SHSTK_SIZE) - 8;
>
> etc here. It's getting longish, so I'm not going to insist. But if you
> go this route, then please also below / elsewhere.

Actually no.  I've got a much better idea, based on how Linux does the
same, but it's definitely 4.15 material at this point.

>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5994,12 +5994,33 @@ void memguard_unguard_range(void *p, unsigned long l)
>>  
>>  #endif
>>  
>> +static void write_sss_token(unsigned long *ptr)
>> +{
>> +    /*
>> +     * A supervisor shadow stack token is its own linear address, with the
>> +     * busy bit (0) clear.
>> +     */
>> +    *ptr = (unsigned long)ptr;
>> +}
>> +
>>  void memguard_guard_stack(void *p)
>>  {
>> -    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>> +    /* IST Shadow stacks.  4x 1k in stack page 0. */
>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>> +    {
>> +        write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
>> +        write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
>> +        write_sss_token(p + (IST_DB  * IST_SHSTK_SIZE) - 8);
>> +        write_sss_token(p + (IST_DF  * IST_SHSTK_SIZE) - 8);
> Up to now two successive memguard_guard_stack() were working fine. This
> will be no longer the case, just as an observation.

I don't think that matters.

>
>> +    }
>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
> As already hinted at in reply to the previous patch, I think this wants
> to remain _PAGE_NONE when we don't use CET-SS.

The commit message discussed why that is not an option (currently), and
why I don't consider it a good idea to make possible.

>> +    /* Primary Shadow Stack.  1x 4k in stack page 5. */
>>      p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
>> -    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>> +        write_sss_token(p + PAGE_SIZE - 8);
>> +
>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
>>  }
>>  
>>  void memguard_unguard_stack(void *p)
> Would this function perhaps better zap the tokens?

Why?  We don't zap any other stack contents, and let the regular page
scrubbing clean it.

~Andrew

