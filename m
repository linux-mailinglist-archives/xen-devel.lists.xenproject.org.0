Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A9993ECD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812675.1225470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3vZ-0007F8-Qx; Tue, 08 Oct 2024 06:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812675.1225470; Tue, 08 Oct 2024 06:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3vZ-0007BC-OE; Tue, 08 Oct 2024 06:42:37 +0000
Received: by outflank-mailman (input) for mailman id 812675;
 Tue, 08 Oct 2024 06:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3vZ-00072S-17
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:42:37 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809a7335-8540-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 08:42:35 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so6523903a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 23:42:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05bc44esm3974555a12.43.2024.10.07.23.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 23:42:34 -0700 (PDT)
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
X-Inumbo-ID: 809a7335-8540-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728369755; x=1728974555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/hxtuxb9JkMDKnwDTXq5dj+ldZwiMY8RptUFXBhqgpY=;
        b=WEdkXSNXJdWHRyq+QyT4uwLmOE80hRWJ4z2JS8RcyB+30iVyERX5awnbAoffr1YP6p
         ePF55OIbFWGeVrIFasFrHZVO0ayiv6J3HOV1Q3VjMLKHJyR28MZ3dB6C83XUTHoI+o+n
         YmoQtSdMgzX7lkqIrODAnouYm+NmlZkZAnH0JAD8bnviCCjW1XFlWXBycRK1HrjsJn+K
         T0OTRSpetHnv02QjlrRFpFOEj8XNMSFSLEaB5VauO4VXJIkyQlkS5FFeT9dnPuX7KSPT
         oYDf7etv90LWfi5AyohmnQeKQ+tPDX4fHZh/vv/KEzTGQ/D8D/1ZgDsdz2ywojFc0uMl
         hGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728369755; x=1728974555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hxtuxb9JkMDKnwDTXq5dj+ldZwiMY8RptUFXBhqgpY=;
        b=c08uI9VfM0FqgJx0uZDQ5Q71vdgvDheToi7Rd7Up4Ykcfg9xuos8cKJO7ErRJMiwzO
         RCwgbrBIj3Orlg/YLx+ke+GDM75QQ6DvK9cw/U9xh2C2TWwQ9B6BSBQMFVlhWBVAiD5y
         jTI8QVWe7PWrMTocyMNuClBTe8Svd/7ay/ZecZBJlGJNJU5rpyqYjvCb1WJeT9Yioc/R
         hxPWSNEjh4dyNN9S8b1Q60IaYRnmK05kp1fdLygjzJOmM72K4ElHO3Mh7enHpkxGDp26
         5TQKR5N+npSY5O0Afa2266DlunbWlRETJGuPovP19QRoKhB3/AWCPeTpFxp7GFWJlzcM
         ZvKA==
X-Forwarded-Encrypted: i=1; AJvYcCXOzGxpGqv8MT+QQoZkEfVYA8p3zbDb+BLuEcnrIGZpAOH753cRz+gM9u8+YP3MwlT00yU7+7QlDiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKUDCp3SDeVDt+C/cAVmYOMqL7W8Xyk/lsqmgdbtRccnNATSbw
	zJnqHKxjlWnQ6FHYCekHT7NO9FEAMT1U1zhQHnSOPNkKc2OOCSAvA5Y/2hToow==
X-Google-Smtp-Source: AGHT+IF54CV73JjL/aV7Ubza8ImbstDWWxLwlBjZWaeYsfUI2kkGesXJ3obVksSqNU/hmJ7+K7YvEg==
X-Received: by 2002:a05:6402:4401:b0:5bf:c8:78a with SMTP id 4fb4d7f45d1cf-5c8d2e260d4mr15100712a12.17.1728369754936;
        Mon, 07 Oct 2024 23:42:34 -0700 (PDT)
Message-ID: <543a0931-e0a8-40be-98f9-fcb4e228a80b@suse.com>
Date: Tue, 8 Oct 2024 08:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/44] x86/boot: move cmdline to boot info
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-4-dpsmith@apertussolutions.com>
 <304c8c42-cfb7-4b0b-aaa7-8c673f9f2fa6@amd.com>
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
In-Reply-To: <304c8c42-cfb7-4b0b-aaa7-8c673f9f2fa6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 20:09, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Transition Xen's command line to being held in struct boot_info.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
> 
>>   #endif /* __XEN_X86_BOOTINFO_H__ */
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index aafc098ca268..0921f296075f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -274,6 +274,8 @@ static int __init cf_check parse_acpi_param(const char *s)
>>   }
>>   custom_param("acpi", parse_acpi_param);
>>   
>> +static const char *cmdline_cook(const char *p, const char *loader_name);
> 
> Is there a reason not to move cmdline_cook() (and loader_is_grub2()) 
> earlier to avoid this forward declaration?

At a guess: To limit churn?

Jan

