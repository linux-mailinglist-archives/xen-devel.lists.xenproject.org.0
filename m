Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2281A2E9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658149.1027208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyio-0005oR-Q6; Wed, 20 Dec 2023 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658149.1027208; Wed, 20 Dec 2023 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyio-0005mL-N4; Wed, 20 Dec 2023 15:42:58 +0000
Received: by outflank-mailman (input) for mailman id 658149;
 Wed, 20 Dec 2023 15:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WYL=H7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFyin-0005mF-7r
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 15:42:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71df13f0-9f4e-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 16:42:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d3ae326f6so1664485e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 07:42:56 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b003366796301csm8799563wrv.0.2023.12.20.07.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 07:42:55 -0800 (PST)
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
X-Inumbo-ID: 71df13f0-9f4e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703086976; x=1703691776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64WBGZWiJKEp674HGMAdtReoW+IDdvsy/JmBxKP6SRE=;
        b=QfxhUq+g7fQ7rFMCqoP1bCQQZ3EjClNx2UbvEf8XxoiMIzx3HvsQ4fRQF0Zzz2BaGE
         ttCGIRJlRSyooSiF6txU5pzRUizU7g4H+AGfVdbPtATAaAT9PK0n56I+0BggqBJoBR+l
         1WLxCKsomtuIUGzck720R91wdUlHnb5m+CbHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703086976; x=1703691776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64WBGZWiJKEp674HGMAdtReoW+IDdvsy/JmBxKP6SRE=;
        b=akProc6FREFSCGlyHS1a/ZgatS5UUY8Yb6gbCfJaafqMx+wroaOZ+jDhlrhJt+h9rK
         yp1Imf/E1NYmWnQvFLHiskhq1OKBxLRVKXQBa/Msrzb8q4U/O7ge06LK9wFHL3S4s8oh
         0WpdfA77431CYy77MPQk52M+YWyl5uI+J//LG3Wjz6xvj27zP4p7lJJTdYjtAvXLWUW7
         RoqiQfUtGKRJm81R1MLN3jkcWmTAwdCAxPHKhwd1Mg2FvklGrGGuSrvOdGp2hQD9Pql8
         TWd7SAYkfPGWfobHNygbvisKwC/1Sd8nMbDDWgaU8JWr/kYVXZiS3HOEuVcHjmOi4hZe
         ZAuw==
X-Gm-Message-State: AOJu0YxXf+y8tcwATjm8JsJKpAL8KHkg88JG5QHP8JlWEAvtP4euMHih
	408Qi4TebWB2hYMzep0Es2GPew==
X-Google-Smtp-Source: AGHT+IH07wwr4yLltXYqfV9zBVGJeS42WaFw+5AdKD5JjECXwVSjBvFxERtBceLkxN6ll9cNZSI8Tw==
X-Received: by 2002:a5d:630c:0:b0:336:7dcd:a1e3 with SMTP id i12-20020a5d630c000000b003367dcda1e3mr512721wru.141.1703086975710;
        Wed, 20 Dec 2023 07:42:55 -0800 (PST)
Message-ID: <00b19784-00bb-494d-bfc0-f0deaa0c1e08@citrix.com>
Date: Wed, 20 Dec 2023 15:42:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: extend CPU errata #1474 affected models
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20231220142218.22850-1-roger.pau@citrix.com>
 <ffb3445f-fd50-4746-9f70-272ea52271ec@citrix.com> <ZYMD_qukgCutWXRI@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZYMD_qukgCutWXRI@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2023 3:10 pm, Roger Pau Monné wrote:
> On Wed, Dec 20, 2023 at 02:46:43PM +0000, Andrew Cooper wrote:
>> On 20/12/2023 2:22 pm, Roger Pau Monne wrote:
>>> Errata #1474 does also affect models from family 17h ranges 00-2Fh, so the
>>> errata now covers all the models released under Family 17h (Zen, Zen+ and
>>> Zen2).
>> Perhaps "has now been extended to cover models from ..." ?
>>
>>> Additionally extend the workaround to Family 18h (Hygon), since it's based on
>>> the Zen architecture and very likely affected.
>>>
>>> Rename all the zen2 related symbols to plain zen, since the errata doesn't
>>> exclusively affect Zen2 anymore.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Thanks for doing this.
>>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I was going to suggest linking to an example revision guide but I see
>> the AMD website is still broken.
>>
>>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>>> index 0f305312ff2a..099646dc3994 100644
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -54,7 +54,7 @@ bool __read_mostly amd_acpi_c1e_quirk;
>>>  bool __ro_after_init amd_legacy_ssbd;
>>>  bool __initdata amd_virt_spec_ctrl;
>>>  
>>> -static bool __read_mostly zen2_c6_disabled;
>>> +static bool __read_mostly zen_c6_disabled;
>> amd_1474_c6_disable ?
> Maybe just fam17h_c6_disabled, since the main usage of that variable
> is to force calling fam17_disable_c6().
>
>> That's about as general as I can make it, without losing precision.
>>
>>
>>>  
>>>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>>>  				 unsigned int *hi)
>>> @@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
>>>  		       val & chickenbit ? "chickenbit" : "microcode");
>>>  }
>>>  
>>> -static void cf_check zen2_disable_c6(void *arg)
>>> +static void cf_check zen_disable_c6(void *arg)
>> fam17_disable_c6() ?  I know Hygon is 0x18 but it's also reasonably well
>> know to be the same uarch.
>>
>> This particular algorithm is good for all Fam17 uarches, irrespective of
>> #1474, even if they happen to be the same set of CPUs in practice.
> Yeah, I was about to use fam17h prefix, but that wouldn't cover Hygon.
> I we are fine with it I can send an adjusted v2 using fam17h prefix.

I think we're fine calling it fam17.  Happy to do that consistently.

~Andrew

