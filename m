Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8466726F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476126.738134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwuE-0001WH-8Y; Thu, 12 Jan 2023 12:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476126.738134; Thu, 12 Jan 2023 12:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwuE-0001Tj-5q; Thu, 12 Jan 2023 12:42:06 +0000
Received: by outflank-mailman (input) for mailman id 476126;
 Thu, 12 Jan 2023 12:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgwW=5J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pFwuD-0001TW-6u
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:42:05 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 844231d1-9276-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 13:42:04 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id v6so1432346ejg.6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 04:42:04 -0800 (PST)
Received: from [192.168.1.93] (adsl-211.37.6.0.tellas.gr. [37.6.0.211])
 by smtp.gmail.com with ESMTPSA id
 lb25-20020a170907785900b007c00323cc23sm7412168ejc.27.2023.01.12.04.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:42:03 -0800 (PST)
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
X-Inumbo-ID: 844231d1-9276-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzEU3EbHAD/6VGyAoPP7dH3w4Ub3KtjPw7ftvjmLQG8=;
        b=Z4PwmN8YlYegibwxRAtmfuNDbreknXyS0sAdpFuhAHazPjMQlAREdv9GT4fVQgkFid
         jfQ5eGtGS0eGFmI8Y5j8l6+waWhcO0xBd5+enJS9SefGd1vffTxZXriNkcBG7vC51vFK
         USsZ1jBcXOMT6AM9CsdDogh/S3djMsYZEpCrnTte77zAca30LZciGhyeh9tFCoF2cO7s
         4vqYtrggs1rYju2CiOXDfpdA+ypP4zccj7CuwNL2XWeCEE8i30jaY851lkEWi1xoiU59
         ZKtm5uN1veaShHkEljfKs7js5YYmd/l890BO7+dg1VPo4CZ7Tf3bkxhWh25QWX221XB1
         4/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzEU3EbHAD/6VGyAoPP7dH3w4Ub3KtjPw7ftvjmLQG8=;
        b=0fWJlhWY3Nc4Gpg6FORYpDLiGhhxS9JE/dVp/VGjW0pJdwTY8qQ8YRO2hdqALD1VXy
         05yt6PtV8Ju9u24Bk+hTkNSio7l7Q6H6vQkLOPEceiThxWin9QitZ5kuKKIi2cBx+iKW
         tHZngQYyLTjkor87WjVaoAZQWdqD404vIGoruWT+T5a2Y7R78GN85FPT86Kszte/qMOL
         QkYGMWcS9G4t1JpD/skR3sRYWqAp4ad5Pfo1uAydEX5dDmGmOQbx8X2yrdktuAPPdp/i
         PzbCkbt+oaoYMLQo6MJab5qLB8p9oOtkfgTsXcgXmlv3RzdieLiYUbbVSaNFaRFMEpAr
         d50g==
X-Gm-Message-State: AFqh2koGynFlg2lFYSWt/y8iyib1kPl8ILp1Rsr8EaEGWhac6QQhdm32
	VYOJxopIAURaE8Hck7uYhW4=
X-Google-Smtp-Source: AMrXdXtw+Y4PHPVT8RHEy5KBfbeevUJNjxyjGcweIMGMhyHA8gbCWsTFuIqC9siCC8Kefq704EUoHQ==
X-Received: by 2002:a17:906:39d8:b0:847:410:ecff with SMTP id i24-20020a17090639d800b008470410ecffmr58815369eje.16.1673527323793;
        Thu, 12 Jan 2023 04:42:03 -0800 (PST)
Message-ID: <2f5699a7-83c0-68c8-3303-c77d443f3fe7@gmail.com>
Date: Thu, 12 Jan 2023 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/8] x86/iommu: the code addressing CVE-2011-1898 is
 VT-d specific
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-6-burzalodowa@gmail.com>
 <a71e7cc5-3f86-0397-613f-a796a0309d42@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <a71e7cc5-3f86-0397-613f-a796a0309d42@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/23 14:01, Jan Beulich wrote:
> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>> The variable untrusted_msi indicates whether the system is vulnerable to
>> CVE-2011-1898. This vulnerablity is VT-d specific.
> 
> As per the reply by Andrew to v1, this vulnerability is generic to intremap-
> incapable or intremap-disabled configurations. You want to say so. In turn
> I wonder whether instead of the changes you're making you wouldn't want to
> move the definition of the variable to xen/drivers/passthrough/x86/iommu.c.
> A useful further step might be to guard its definition (not necessarily
> its declaration; see replies to earlier patches) by CONFIG_PV instead (of
> course I understand that's largely orthogonal to your series here, yet it
> would fit easily with moving the definition).

Sure I can do that.

> 
>> --- a/xen/arch/x86/include/asm/iommu.h
>> +++ b/xen/arch/x86/include/asm/iommu.h
>> @@ -127,7 +127,9 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
>>                              unsigned int flag);
>>   void iommu_identity_map_teardown(struct domain *d);
>>   
>> +#ifdef CONFIG_INTEL_IOMMU
>>   extern bool untrusted_msi;
>> +#endif
> 
> As per above / earlier comments I don't think this part is needed in any
> event.
> 
>> --- a/xen/arch/x86/pv/hypercall.c
>> +++ b/xen/arch/x86/pv/hypercall.c
>> @@ -193,8 +193,10 @@ void pv_ring1_init_hypercall_page(void *p)
>>   
>>   void do_entry_int82(struct cpu_user_regs *regs)
>>   {
>> +#ifdef CONFIG_INTEL_IOMMU
>>       if ( unlikely(untrusted_msi) )
>>           check_for_unexpected_msi((uint8_t)regs->entry_vector);
>> +#endif
>>   
>>       _pv_hypercall(regs, true /* compat */);
>>   }
>> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
>> index ae01285181..8f2fb36770 100644
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -406,11 +406,13 @@ ENTRY(int80_direct_trap)
>>   .Lint80_cr3_okay:
>>           sti
>>   
>> +#ifdef CONFIG_INTEL_IOMMU
>>           cmpb  $0,untrusted_msi(%rip)
>>   UNLIKELY_START(ne, msi_check)
>>           movl  $0x80,%edi
>>           call  check_for_unexpected_msi
>>   UNLIKELY_END(msi_check)
>> +#endif
>>   
>>           movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
>>   
> 

-- 
Xenia

