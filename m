Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0029645AB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785859.1195374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjem9-0006Dz-0v; Thu, 29 Aug 2024 13:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785859.1195374; Thu, 29 Aug 2024 13:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjem8-0006Bl-TW; Thu, 29 Aug 2024 13:01:20 +0000
Received: by outflank-mailman (input) for mailman id 785859;
 Thu, 29 Aug 2024 13:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjem6-0006Be-No
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:01:18 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1453067-6606-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:01:07 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so53684966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 06:01:07 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb072sm76925166b.28.2024.08.29.06.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:01:04 -0700 (PDT)
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
X-Inumbo-ID: c1453067-6606-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724936467; x=1725541267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=stLVbPvXbVnwp8iTE2RucsKVwjH1zhKeuvAiDK/3dj4=;
        b=Scwo0i5t3XARQFpuyuW+rnDhnme34lB5cnX7IsTOGSdSRn6hr6+nnBUP1jPSlU38dW
         Sof7eAadQqbowhNV6diPITyUmo3n1vo4w62VtbTLJ1JU02WcuenT0/FgArHFtzfF9dwq
         JWv0gz7ucayxBE4JS/90H9cvUlAO66X8vLftQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724936467; x=1725541267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stLVbPvXbVnwp8iTE2RucsKVwjH1zhKeuvAiDK/3dj4=;
        b=Of8vbRjS9ZF5Z/bvl+EvKFIWrc74JowcPAnzT3bbTeBqs7IL3C5EKP8A8ysW9Y0UWs
         QU+j0RPI9gXeuJRXjrm/1jTgK1qqv6A4+WoYBUklVoHn4gXdqVZ4NIzZVHlYmjcTW1Eh
         52OC5fXnw9yO4LDNapea0PMp6j8HBGz+4SVI2aj+yNsn3lqMzFBFMScTCaWNGvF7xBLP
         vPNeu83JUSCTRwCwHWcEaHDpeqINE9vqxxr0U6BefYDglPP33BqvnsLoRg21FXa6G/EE
         74Ej4yNfPfpnTouUs5ms/ZSMGsso6Pm+nPuE2+zejvNC+jlef7AXeAtXGYHbVE2VExPR
         D6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXAzvtRWgjiRsD0euZj6sHTshusRPT3jAt8y9ekxBpUBxyEe3LrT2J7wKV7rh0XUL41tRZYIevZtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqtQkbsMLKYrO+YL4JTdxzNe/J2phES9SSi2OYReLFBwdagB1R
	fDRPOd7R3KsQuEZrOZ7vDQQiCb623gQzChJ6UQuDUNjgDn6CT8tltlKsU+rpfm4=
X-Google-Smtp-Source: AGHT+IFr8NkGSolvS7hqqXM4NarDjOcnTMyHcyXFyzdutqatxwSKTI9GGEZRx9FkTfz4gI7ZAcvZAQ==
X-Received: by 2002:a17:907:9482:b0:a86:700f:93c1 with SMTP id a640c23a62f3a-a897face4cfmr235517266b.60.1724936464963;
        Thu, 29 Aug 2024 06:01:04 -0700 (PDT)
Message-ID: <26a0e465-bc48-489a-ac7a-5455b131fab4@citrix.com>
Date: Thu, 29 Aug 2024 14:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20240828113044.35541-1-roger.pau@citrix.com>
 <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
 <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>
 <Zs8gAuc5qoVsVkQe@macbook.local>
 <a5b4ca69-96ea-46d6-ab0d-2be4fd1d9d99@citrix.com>
 <ZtAjv6hdbPTZ1dGI@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZtAjv6hdbPTZ1dGI@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 8:31 am, Roger Pau Monné wrote:
> On Wed, Aug 28, 2024 at 07:57:39PM +0100, Andrew Cooper wrote:
>> On 28/08/2024 2:02 pm, Roger Pau Monné wrote:
>>> On Wed, Aug 28, 2024 at 12:51:23PM +0100, Andrew Cooper wrote:
>>>> On 28/08/2024 12:50 pm, Jan Beulich wrote:
>>>>> On 28.08.2024 13:30, Roger Pau Monne wrote:
>>>>>> Move the logic that disables SMAP so it's only performed when building a PV
>>>>>> dom0, PVH dom0 builder doesn't require disabling SMAP.
>>>>>>
>>>>>> The fixes tag is to account for the wrong usage of cpu_has_smap in
>>>>>> create_dom0(), it should instead have used
>>>>>> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
>>>>>> only.
>>>>>>
>>>>>> While there also make cr4_pv32_mask __ro_after_init.
>>>>>>
>>>>>> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>> preferably with ...
>>>>>
>>>>>> @@ -1051,6 +1051,34 @@ out:
>>>>>>      return rc;
>>>>>>  }
>>>>>>  
>>>>>> +int __init dom0_construct_pv(struct domain *d,
>>>>>> +                             const module_t *image,
>>>>>> +                             unsigned long image_headroom,
>>>>>> +                             module_t *initrd,
>>>>>> +                             const char *cmdline)
>>>>>> +{
>>>>>> +    int rc;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
>>>>>> +     * construct_dom0().  This saves a large number of corner cases
>>>>> ... the final 's' dropped here and ...
>>>>>
>>>>>> +     * interactions with copy_from_user().
>>
>> Actually, even with this adjustment the comment is still wonky.
>>
>> The point is that we're clearing SMAP so we *don't* need to rewrite
>> construct_dom0() in terms of copy_{to,from}_user().
>>
>> I've adjusted it.
> It did seem weird to me, I've assumed the wording was meaning to imply
> that SMAP was disabled so that construct_dom0() didn't need to use
> copy_from_user().
>
> The comment you added seems fine to me, however there's a typo I
> think:
>
>     /*
>      * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
>      * prevents us needing to write rewrite construct_dom0() in terms of
>                               ^ extra?
>      * copy_{to,from}_user().
>      */
>
> We can fix at some later point when modifying this.

Urgh, sorry.

Luckily, I've got just the patch to do this in...

~Andrew

