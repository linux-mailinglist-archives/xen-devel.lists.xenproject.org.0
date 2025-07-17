Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B819B09526
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047337.1417802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUXw-0000rj-IS; Thu, 17 Jul 2025 19:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047337.1417802; Thu, 17 Jul 2025 19:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUXw-0000pd-Fj; Thu, 17 Jul 2025 19:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1047337;
 Thu, 17 Jul 2025 19:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucUXv-0000pX-NW
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:45:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b005d9e-6346-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 21:45:34 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45629703011so10525025e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 12:45:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8ab7a1sm60191355e9.34.2025.07.17.12.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 12:45:33 -0700 (PDT)
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
X-Inumbo-ID: 9b005d9e-6346-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752781534; x=1753386334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YkmCEask6Q/ztOI8Ilbb4ECZUOd7IZEnczdpMWlD9Uw=;
        b=lKh69zha4IDvsPD0FqhG2ytTHp2JawE2t951UDsoPx4kTPOwB+1Cz2fB5TVdv94Av+
         Gy8UkTfjYMcmvnTe2eM9Fw0oz6t0CJF50VvpTS2tjDc6w9KoiikB/Od+ElZLoUoT+rKM
         nFf2+MTjoShGdHEmDEAcB5omyUbTAzyYki840=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752781534; x=1753386334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkmCEask6Q/ztOI8Ilbb4ECZUOd7IZEnczdpMWlD9Uw=;
        b=VqazrQh1oBaC5sK44RrTqDXT3HCSW65YjjmR7IEq9qB2Rqu9zj23W1CDBbL4P2PFJx
         ykFB4ZW449mqrwibFiH3EvyDvBRzbBix/rYFP1Vc0o2WxebOr2cdXOSpwQ+t79K1qkVD
         MAa6C6eIOCHhHzadKb9+dPI8xsiH6Xnncn52lLqtGTA0SO59xzczdtkTBikY9HvFeBny
         9TnZSAu9KiNaS95MT7rhAEZL0n6S2mMWDn89i21AZX1tvE/58HkkwyIGqpf01bXxGBtR
         4tDXlE8QWyp7ETcL7B7IKrg7tAj5N0IJG3JM6HCkLfE8W9CaekRionOgqR81ZtvKsc6D
         e5PA==
X-Forwarded-Encrypted: i=1; AJvYcCUyaRKFF5PlHvBKMJA/9UPh/ZI3NEplIOS1R020T1ubyAEMjtwCZvoEZEq8WhX1CNaZGnn7pAEYKHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY0rdFlR8h/h3STcl+FCTE/ljvch+go1ChCSrSryRdOD0EzTeh
	tpcjySW/2F5hQcxxtNOMgj1xD8kJQrEdu0T5ET4Zol9ndnexqYux6VF1vCsOykft5Bg=
X-Gm-Gg: ASbGncu2kDszHCZT3X8aQSeHxKIIUNq4tgdIJ5Od9Z5L7rOb6yzfRcO7ne4xkPcJ6Zx
	XhYtIR7GyKOHjxm7aYQJMoUDdfd+1xgUqtIjEKqJg5ngVR4jWTSAeCJz8IEcsVNkQ1bsw3Z3NgD
	i0rkit0TIirlbyzFDgdUL5zR/TtnRvGfBB7rZP2ZmOosq2ztIZ4hkurrKnHD2+OI6G2NAMESGvu
	b53z33HqyOxYFfu9LAPMdTk13TRKq2VavP8sZKJ/+pvbD1DKoZkNOtMgBjk3Y2KYlxoZDdjeuOw
	AUWsQKGH/5c+stDe31MLBAxdFZqJ9fcTH6X7Nd+VzCrvdkrr6278RgiEgqRmifOxq9beMKBfYgd
	s5/wcgS0BRsqRwUd7m1cjicUEPwsT3G1YvuiuaWsupHy3k6EVxAlgbTX4AwDsALWE3Zcj
X-Google-Smtp-Source: AGHT+IFrzXJRbKoWSjgAPEZmJv1Gth5SJUvzQfoYlxykLDX5jhgP1/t5htZdZZlfC7Wwf4Y/+Sexiw==
X-Received: by 2002:a05:6000:2dc9:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b60dd95cd5mr6819784f8f.35.1752781534310;
        Thu, 17 Jul 2025 12:45:34 -0700 (PDT)
Message-ID: <147a32f5-f7ef-4013-b050-4e019bd1f09b@citrix.com>
Date: Thu, 17 Jul 2025 20:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <3e3df60f-be4f-451c-aeb9-12a8d490cdc2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3e3df60f-be4f-451c-aeb9-12a8d490cdc2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 9:31 am, Jan Beulich wrote:
> On 16.07.2025 19:31, Andrew Cooper wrote:
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1051,64 +1051,32 @@ static void setup_APIC_timer(void)
>>      local_irq_restore(flags);
>>  }
>>  
>> -#define DEADLINE_MODEL_MATCH(m, fr) \
>> -    { .vendor = X86_VENDOR_INTEL, .family = 6, .model = (m), \
>> -      .feature = X86_FEATURE_TSC_DEADLINE, \
>> -      .driver_data = (void *)(unsigned long)(fr) }
>> +static const struct x86_cpu_id __initconst deadline_match[] = {
>> +    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x2, 0x3a), /* EP */
>> +    X86_MATCH_VFMS(INTEL_HASWELL_X,   0x4, 0x0f), /* EX */
>>  
>> -static unsigned int __init hsx_deadline_rev(void)
>> -{
>> -    switch ( boot_cpu_data.x86_mask )
>> -    {
>> -    case 0x02: return 0x3a; /* EP */
>> -    case 0x04: return 0x0f; /* EX */
>> -    }
>> +    X86_MATCH_VFM (INTEL_BROADWELL_X,      0x0b000020),
>>  
>> -    return ~0U;
>> -}
>> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x2, 0x00000011),
>> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x3, 0x0700000e),
>> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x4, 0x0f00000c),
>> +    X86_MATCH_VFMS(INTEL_BROADWELL_D, 0x5, 0x0e000003),
> Hmm, actually - why are Broadwell and ...
>
>> -static unsigned int __init bdx_deadline_rev(void)
>> -{
>> -    switch ( boot_cpu_data.x86_mask )
>> -    {
>> -    case 0x02: return 0x00000011;
>> -    case 0x03: return 0x0700000e;
>> -    case 0x04: return 0x0f00000c;
>> -    case 0x05: return 0x0e000003;
>> -    }
>> +    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x3, 0x01000136),
>> +    X86_MATCH_VFMS(INTEL_SKYLAKE_X,   0x4, 0x02000014),
> ... Skylake each split ...
>
>> -    return ~0U;
>> -}
>> +    X86_MATCH_VFM (INTEL_HASWELL,          0x22),
>> +    X86_MATCH_VFM (INTEL_HASWELL_L,        0x20),
>> +    X86_MATCH_VFM (INTEL_HASWELL_G,        0x17),
>>  
>> -static unsigned int __init skx_deadline_rev(void)
>> -{
>> -    switch ( boot_cpu_data.x86_mask )
>> -    {
>> -    case 0x00 ... 0x02: return ~0U;
>> -    case 0x03: return 0x01000136;
>> -    case 0x04: return 0x02000014;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static const struct x86_cpu_id __initconstrel deadline_match[] = {
>> -    DEADLINE_MODEL_MATCH(0x3c, 0x22),             /* Haswell */
>> -    DEADLINE_MODEL_MATCH(0x3f, hsx_deadline_rev), /* Haswell EP/EX */
>> -    DEADLINE_MODEL_MATCH(0x45, 0x20),             /* Haswell D */
>> -    DEADLINE_MODEL_MATCH(0x46, 0x17),             /* Haswell H */
>> +    X86_MATCH_VFM (INTEL_BROADWELL,        0x25),
>> +    X86_MATCH_VFM (INTEL_BROADWELL_G,      0x17),
> ... into disjoint groups (continuing ...
>
>> -    DEADLINE_MODEL_MATCH(0x3d, 0x25),             /* Broadwell */
>> -    DEADLINE_MODEL_MATCH(0x47, 0x17),             /* Broadwell H */
>> -    DEADLINE_MODEL_MATCH(0x4f, 0x0b000020),       /* Broadwell EP/EX */
>> -    DEADLINE_MODEL_MATCH(0x56, bdx_deadline_rev), /* Broadwell D */
>> +    X86_MATCH_VFM (INTEL_SKYLAKE_L,        0xb2),
>> +    X86_MATCH_VFM (INTEL_SKYLAKE,          0xb2),
> ... here)? The patch already isn't overly straightforward to review without
> that.

The layout comes from Linux (I was mostly checking that I hadn't broken
anything), although I took the opportunity to optimise the table by
dropping useless rows.

I can't find any way of getting the diff to read nicely.  My normal
trick of reordering with a function doesn't work, although it turns out
that removing the blank lines and moving it into check_deadline_errata()
does render nicely.  I'll do that in v2.

~Andrew

