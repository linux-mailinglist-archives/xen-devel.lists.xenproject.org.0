Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KjFGHIO+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DF4D8E57
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301478.1575763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYri-0003kF-N3; Wed, 06 May 2026 09:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301478.1575763; Wed, 06 May 2026 09:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYri-0003i8-Jy; Wed, 06 May 2026 09:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1301478;
 Wed, 06 May 2026 09:48:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKYrg-0003hx-NV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:48:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYrg-00HCqb-48
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:48:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb0e67-5cb7-0a2a0a5109dd-0a2a4502875e-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:48:24 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb0e67-af86-0a2a45020019-d155da32d4ed-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:48:24 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b9382e59c0eso981838166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:48:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55f30a2cfsm61872266b.57.2026.05.06.02.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:48:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778060903; x=1778665703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoE8x6AZyFV8b4Hk8uB8r7cxZqKnUgwsB6f57Kd4bDY=;
        b=PSXuSEhqdo9mS2z3fCo4o66dQ04w4zznKnVR1gJfBCpFSm17wJm3stmBqGExYFP1rq
         XwSVPofVgWlXcz9ss219d5u50a/R9V81nbKz8JRM+N/Jd89wNJ3yFXhGHDNuXwrqQ04G
         RG8/spK8YK23uAiDN/+fJQfwSgFH1xbsuKHuOgMuxlRVgD9h8fIR+gj/s/RB/f+yhirh
         TWo3luOpvApBMQxOzLH29hS9jACeRdvR3d3+z9nqKlZL9N3Gw4yq/ySCqFeIjOg/l8Od
         2KZHFoMHgRMgwLNT5e1y8keY40KRItlixidZL3qWd7tuSSirhxHIvbBZwbBFqToYu1j2
         aEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060903; x=1778665703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoE8x6AZyFV8b4Hk8uB8r7cxZqKnUgwsB6f57Kd4bDY=;
        b=Jxtau/hE/r/zjlSCo8GxdSjvrsjy+ltHl07lEnwZ0uAAhnH3Jk0pujI1n4PixsDhJU
         lcVtWXJ/UxkzP5FXwnZyPTdOjB+UcwS2Pshwk/f+ZigiFj5mxiuqXcbih0sVtkaWfBPh
         0o7dQmo5F2ogSOsZheBVaszpgevyIrBLXToH4Z0jlA98fHWHXs/lUGRlRoRue9jQ/Ugo
         shqMWSyYZXEourhseno8oGhPSPZ4Xo8Zr9z+4LC+M9yl2P5v5MZFRpr8szpuz6clO/pC
         yX8aUUXlbdLkEKunT0empBGo536a8V0sSpYcaMYdAsYQz2U7J+s8bpmZwSwW24z6COD8
         kwPg==
X-Gm-Message-State: AOJu0YxAiq6uIg32FNiUA3DadV7DKP8NAaaTMIk9rBDFIKhPmymCICTL
	qBQOV5LNDY6YQlq83yJ+PcvG8QpVKclNcGtrP8QxQw0JHPGy3oB9xugo
X-Gm-Gg: AeBDievSZtuAtnoCffoOPow+O2hq41vBS2SfDT/xU6QRlLmN1J9Xda0vZR/sEkywKkT
	mbdurhPG2ozWmfLQV1Ehc/InE0XFW/xPjfoU1AqOuWaVVVbgJ0aqjkSwvFdM+MJeTzX3yS7WXqJ
	9/IZkz+RZzjP32nXqXHHMGPVmT3yAbLa7DxsYJ5JRs1Rpmo3PfzFfe1J0A7DIZ5DoWV4ThPKFB9
	AhT7sgkcMHkD0Eh2DOLwbPDNI3ygiQw0Fzve2wf5Psmk1w6hKWqIm6y3R0CTMTyVSxZ7Ad066Jq
	WbMNqlS4iMnZLxzHR+za5NYuuiKSHciF0wRwQ0QdO831AlP+nRb+s8mDaxL3y2tFCxg5queBo6t
	Kkuljwd9Ioo1T8H3iho+eq2ITC2P9qzWrNGVXKhveE4NDVvhvfP4WK6EZmR1WpU0GDknpZdTkAX
	cI3hbII4KOrIv1CVdaIekv9lgS38DO6O67vpC0JDyaNAHQcCfvxxZo/0jIpNOhY7EgLgvBmhPXr
	iGcSlPM+YunUg==
X-Received: by 2002:a17:906:fe42:b0:b9d:2fce:308b with SMTP id a640c23a62f3a-bc56d80c34fmr115713166b.30.1778060903344;
        Wed, 06 May 2026 02:48:23 -0700 (PDT)
Message-ID: <bec36dbf-5df2-4756-a81d-7938e8d58104@gmail.com>
Date: Wed, 6 May 2026 11:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] xen/dom0less: rename kernel_zimage_probe() to
 kernel_image_probe()
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <d87dd4f04e3f0d421485091cf434a088f6693641.1777303844.git.oleksii.kurochko@gmail.com>
 <EA0D6439-CA9E-450A-80BA-442A7C8F0A28@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <EA0D6439-CA9E-450A-80BA-442A7C8F0A28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778060904-83D67161-83155A11/10/73395122804
X-purgate-type: spam
X-purgate-size: 4561
X-Rspamd-Queue-Id: C99DF4D8E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 4/29/26 12:59 PM, Luca Fancellu wrote:
> Hi Oleksii,
> 
>>
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 9395b5af8745..a5554714cd7b 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -101,8 +101,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>>      paddr_t load_addr;
>>
>> #ifdef CONFIG_HAS_DOMAIN_TYPE
>> -    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>> -        return mem->bank[0].start + info->zimage.text_offset;
>> +    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
>> +        return mem->bank[0].start + info->image.text_offset;
>> #endif
>>
>>      /*
>> @@ -111,19 +111,19 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>>       * and above 32MiB. Load it as high as possible within these
>>       * constraints, while also avoiding the DTB.
>>       */
>> -    if ( info->zimage.start == 0 )
>> +    if ( info->image.start == 0 )
>>      {
>>          paddr_t load_end;
>>
>>          load_end = mem->bank[0].start + mem->bank[0].size;
>>          load_end = MIN(mem->bank[0].start + MB(128), load_end);
>>
>> -        load_addr = load_end - info->zimage.len;
>> +        load_addr = load_end - info->image.len;
>>          /* Align to 2MB */
>>          load_addr &= ~((2 << 20) - 1);
>>      }
>>      else
>> -        load_addr = info->zimage.start;
>> +        load_addr = info->image.start;
>>
>>      return load_addr;
>> }
>> @@ -131,8 +131,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>> static void __init kernel_zimage_load(struct kernel_info *info)
>> {
>>      paddr_t load_addr = kernel_zimage_place(info);
>> -    paddr_t paddr = info->zimage.kernel_addr;
>> -    paddr_t len = info->zimage.len;
>> +    paddr_t paddr = info->image.kernel_addr;
>> +    paddr_t len = info->image.len;
>>      void *kernel;
>>      int rc;
>>
>> @@ -215,7 +215,7 @@ int __init kernel_uimage_probe(struct kernel_info *info,
>>          return -EOPNOTSUPP;
>>      }
>>
>> -    info->zimage.start = be32_to_cpu(uimage.load);
>> +    info->image.start = be32_to_cpu(uimage.load);
>>      info->entry = be32_to_cpu(uimage.ep);
>>
>>      /*
>> @@ -224,20 +224,20 @@ int __init kernel_uimage_probe(struct kernel_info *info,
>>       * independent image. That means Xen is free to load such an image at
>>       * any valid address.
>>       */
>> -    if ( info->zimage.start == 0 )
>> +    if ( info->image.start == 0 )
>>          printk(XENLOG_INFO
>>                 "No load address provided. Xen will decide where to load it.\n");
>>      else
>>          printk(XENLOG_INFO
>>                 "Provided load address: %"PRIpaddr" and entry address: %"PRIpaddr"\n",
>> -               info->zimage.start, info->entry);
>> +               info->image.start, info->entry);
>>
>>      /*
>>       * If the image supports position independent execution, then user cannot
>>       * provide an entry point as Xen will load such an image at any appropriate
>>       * memory address. Thus, we need to return error.
>>       */
>> -    if ( (info->zimage.start == 0) && (info->entry != 0) )
>> +    if ( (info->image.start == 0) && (info->entry != 0) )
>>      {
>>          printk(XENLOG_ERR
>>                 "Entry point cannot be non zero for PIE image.\n");
>> @@ -257,13 +257,13 @@ int __init kernel_uimage_probe(struct kernel_info *info,
>>          if ( rc )
>>              return rc;
>>
>> -        info->zimage.kernel_addr = mod->start;
>> -        info->zimage.len = mod->size;
>> +        info->image.kernel_addr = mod->start;
>> +        info->image.len = mod->size;
>>      }
>>      else
>>      {
>> -        info->zimage.kernel_addr = addr + sizeof(uimage);
>> -        info->zimage.len = len;
>> +        info->image.kernel_addr = addr + sizeof(uimage);
>> +        info->image.len = len;
>>      }
>>
>>      info->load = kernel_zimage_load;
>> @@ -289,7 +289,7 @@ int __init kernel_uimage_probe(struct kernel_info *info,
>>       * Thus, Xen uses uimage.load attribute to determine the load address and
>>       * zimage.text_offset is ignored.
> 
> Should we update the comment as well?
> 
> Also in here:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/xen/fdt-kernel.h;h=4d0467bb396a9cf317954fd511469e7f56d67844;hb=refs/heads/staging#l111

Agree, it should be updated. I'll do that in the next version.

Thanks.

~ Oleksii

