Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DED97E95B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801818.1211834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfxI-0004yt-Hz; Mon, 23 Sep 2024 10:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801818.1211834; Mon, 23 Sep 2024 10:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfxI-0004xM-FL; Mon, 23 Sep 2024 10:06:08 +0000
Received: by outflank-mailman (input) for mailman id 801818;
 Mon, 23 Sep 2024 10:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssfxG-0004xC-QH
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:06:06 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71d2be17-7993-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:06:04 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4418754e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:06:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89dfcsm9916503a12.69.2024.09.23.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:06:04 -0700 (PDT)
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
X-Inumbo-ID: 71d2be17-7993-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727085964; x=1727690764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hU7zp90CNYS59mWZQBfgBsfx4MEpreczx2PT5k16ZQI=;
        b=IcEwWA1vHZf3tN9efxFJv3HIb423l2g8+UL+x1h9fY91ZvpAQ9I6PpXWm6J5YawLy0
         TPnxRYL8h2iM20VcTGT2CrtR6HxYUrNw2nHuoYvDOn36u13lqRlioDvo6xU7f57qoazJ
         ZgTJGBYiivFaZSkAzb+Od5MED4LDlYCITwFvwFxdHqgTBJ2ZqQmaykpyM6bodxt57X0d
         ZKwUUf7SlFstgWPl+V8LOVq6q/CpG/JxqpBE19eng8LJXk0cVWFBvVE8zODii0kILyOW
         IlEPWrkVcOUa9LUfO+AALmIUCNDFCH3kOlVmMBdKB2T+CHNMC/oyGTRWuWgnMJgY7KZV
         PopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085964; x=1727690764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU7zp90CNYS59mWZQBfgBsfx4MEpreczx2PT5k16ZQI=;
        b=HMkANJjHE4cWxoh3k3GK1FBr4h/ZHich7cMHaO/u5DGFub6zXT0C6oFUZjIwK+aTFW
         yAdW1MX8hQlY/WEzFfDJgW2p/GvGM++ndZjU0VFXNxp/57YHEFZesRoCXkhVxsMdbpZp
         oMG3Tnjd5pxsR4olWWiISue0i9+nMSxIKKnpmbaZpz2YlO017XRCH2l++A/soQA3nvqW
         s26lY0WxT3tEYidimO2GZACCNjL4uok39kSuB6Hxsm4Ov4wxRi+YZOP5ZplM6DRoh0mM
         xxftKEUgm1/JNYHKFQvilkAriujpFXvrvpbJTNncfZ/WxgxyXWXrS0eqJftoRr0GgqVh
         rp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLDDBWRnvLpHqa4fbeKtacSDB99888U393imjoN7Bz5lbVQXR23b4HxsTUbvSU5iSmgcV4BEx6wWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO+98gGHp0TDyPvKxnsDk8RGAi5BCGbPN9ZJSeenrpn1n8x9hK
	mJmTFDqyJqDUzQRgWGqzK3vdTSvPZdFTzTngNPvZD6dCY9dv5t/fiWVWoDH83A==
X-Google-Smtp-Source: AGHT+IFdZPKopy165CLDtLHh0qG1mxaoX9UNmAFFimMaj+r2EZ1d9oJxp4zfJedsUy0Y5xtrLg9gIA==
X-Received: by 2002:a05:6512:3da4:b0:536:561c:a0cb with SMTP id 2adb3069b0e04-536ad1649bemr5644564e87.18.1727085964261;
        Mon, 23 Sep 2024 03:06:04 -0700 (PDT)
Message-ID: <6b1ec425-a5f7-4c77-865e-2a244961e00c@suse.com>
Date: Mon, 23 Sep 2024 12:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen: define ACPI and DT device info sections
 macros
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
 <c7670e45-30dd-4cba-a226-a5130412a96c@raptorengineering.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c7670e45-30dd-4cba-a226-a5130412a96c@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 23:05, Shawn Anastasio wrote:
> On 9/17/24 11:15 AM, Oleksii Kurochko wrote:
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -114,6 +114,21 @@
>>  
>>  /* List of constructs other than *_SECTIONS in alphabetical order. */
>>  
>> +#define USE_DECL_SECTION(x) DECL_SECTION(x)
>> +
>> +#define NOUSE_DECL_SECTION(x) x :
>> +
>> +#ifdef CONFIG_ACPI
>> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
>> +    DECL_SECTION_MACROS_NAME(secname) {                     \
>> +      _asdevice = .;                                        \
>> +      *(secname)                                            \
>> +      _aedevice = .;                                        \
>> +    } :text
>> +#else
>> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
>> +#endif /* CONFIG_ACPI */
> 
> This works, but is there a reason you didn't just define the actual
> entries themselves in the macro, like is done for most of the other
> macros in this file (including BUFRAMES right below this)? Something
> like:
> 
> #define ADEV_INFO     \
>     _asdevice = .;    \
>     *(secname)        \
>     _aedevice = .;    \
> 
> Parameterizing the section name seems pointless since there are other
> parts of the code that rely on them, and parameterizing the macro for
> declaring a section adds unnecessary boilerplate for non-ppc/x86
> architectures (the NOUSE_DECL_SECTION no-op).
> 
>> +
>>  #define BUGFRAMES                               \
>>      __start_bug_frames_0 = .;                   \
>>      *(.bug_frames.0)                            \
>> @@ -131,6 +146,17 @@
>>      *(.bug_frames.3)                            \
>>      __stop_bug_frames_3 = .;
>>  
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +#define DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
>> +    DECL_SECTION_MACROS_NAME(secname) {                     \
>> +      _sdevice = .;                                         \
>> +      *(secname)                                            \
>> +      _edevice = .;                                         \
>> +    } :text
>> +#else
>> +#define DECL_DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
>> +#endif /* CONFIG_HAS_DEVICE_TREE */
> 
> Ditto. Also, if you go with the approach I mentioned, then you wouldn't
> need to guard these on CONFIG_HAS_DEVICE_TREE/CONFIG_ACPI since that
> would be done in the linker scripts themselves.

+1

Jan


