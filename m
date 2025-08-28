Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB3B3961F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097747.1451965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXZR-0007U0-4G; Thu, 28 Aug 2025 08:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097747.1451965; Thu, 28 Aug 2025 08:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXZR-0007ST-1M; Thu, 28 Aug 2025 08:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1097747;
 Thu, 28 Aug 2025 08:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urXZP-0007SL-Gd
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:01:19 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd22b88-83e5-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 10:01:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134609so848414a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 01:01:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cb4370f23sm2811705a12.38.2025.08.28.01.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 01:01:16 -0700 (PDT)
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
X-Inumbo-ID: 2cd22b88-83e5-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756368077; x=1756972877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lue0KBH1Y1XLRRUJLm28J7POfbn3BL1GZPFnlMT/oEM=;
        b=c5q+CEpwcEesQNXtYZOEi+UDXq8vczAIai++ryMZAIWbrRjxqpv5imguRTnxxVuHE+
         xrAgl/yv9ENMMsEpdjSzEHjn6alSHPWemsyz5ApoYTXhRxzVqvyIXsm0zfcu3W7WQqUj
         DSy9Xmq/AcQq3udwL6F2WvYJTtc6piItCEt31nCmqhawcAqkWlJO/G8QHFJSwxspcjGW
         tHZEWv9bPqzCaPV91lgstWmWFVJw3L3Ih1wftSVxCWbYKT5hPRnTHSXx2hLZNh1a+ECj
         n4vEYBdHskdu+2BKpHdXiv+rNBY8/RBPozZwFqAfNSyBKv0on1bt9+4tnFHqGjbW2kIp
         9JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756368077; x=1756972877;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lue0KBH1Y1XLRRUJLm28J7POfbn3BL1GZPFnlMT/oEM=;
        b=RsypcuuDpiBz5LYj4DMS+518HNz6CZOpRY1AOm5O9a2yfgvZZHYGbj/D1S36bAUZAo
         LOjk1ag9/U7rLQauBi9kBDHvPjb7ZGpG7xKzVrtG8b4W6w4sjUFb4Kgu2XykTX6c+HGC
         COCJkyGUJxDn/iHelRE3JhRDBRgVhMyjZ/emZrc0n3Uzay8IbZEkPkWq/nblgnttJIUN
         sGWA5j5iy4f5gwT3jbH5ZyN0KYG4px65uSjJnHf8soPkK+af3aKH+vq6WWvJ6pwdcMnK
         GoswrWh0uSBXAuEyjZbD6nU7Mb1+hCiW3y1LNsPkVDfoOF8Y5rF+yUk4NYAmf0V8uqQ3
         +PTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnxuKL8ggTYZCMKjDvCvRrxSkp1QssoerBN8eQnWSrtO9fyis4DMCcZ1dNFqy95w6iGvEI1z3Rk1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqW1KoMhwFwd3FzO4sqQeL0zUZYuy0ivyAUBQk4jBAHTl9yK/y
	Q5XZm2tyTfwkHi7BmvQU+gHLi0YKt+YJx/n4AHu3l9hJ+J64mOyT7QqRatKiR+WP/A==
X-Gm-Gg: ASbGncuxg9gZyvSzalPHy2hmYivWHC4rf0zZSx9unFEv4fBe3pyLCCGvItwxHsdwjvs
	LuKjx7TdJJIwuPotUISLe/72P5ZUYEmoo9O8pNxuYv2w4Hi3SSRhMVP5LXvHlf+vKS/g5HDKOMx
	gXTVuzb1iEHRzrxPXaMFzcGlRDW9ZV5UjKozWdPxxUtI2XdeKzAaRPFCal805KCpW1i+l+j+6SJ
	ZqgOehFDJW8ImOW/H5HjnzyJgIkp7wDPA7h6KPOVZzEnb+WzBjoY5eynOm4mXaMQ26sV0Q0cMFA
	7HZEPHArXWcNBJQuKjifTofgAWN5Pj8LdjL2/G4PMEgMc1fLjBzRaAuJjQSzJis8gd0SpJYuWJd
	A1OjEC4x/uN1x767Pgjfw8lKEy1kq1I7t1hWqN/0LK9+8AMXfsiflME0lWnaMKVJUsFIom+NrNR
	d4J+eVXILBBw7CPtXEDwuMj7x6PnFX
X-Google-Smtp-Source: AGHT+IEEkzUIVR5gietJORlBXuAwfbw5wQ1jOvEdeQRy3RajdzRjUC5dsLLi/i/lwILVaoIzv3Ig+Q==
X-Received: by 2002:a05:6402:26d3:b0:61c:7f7e:1e with SMTP id 4fb4d7f45d1cf-61c7f7e2182mr9313559a12.22.1756368076570;
        Thu, 28 Aug 2025 01:01:16 -0700 (PDT)
Message-ID: <f0a6a30d-251b-4836-a374-e358a174a356@suse.com>
Date: Thu, 28 Aug 2025 10:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hvmloader: fix SMBIOS table length checks
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1753869323.git.w1benny@gmail.com>
 <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
 <89400b8f-0acf-49c6-979a-ecf608ec00d4@suse.com>
Content-Language: en-US
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
In-Reply-To: <89400b8f-0acf-49c6-979a-ecf608ec00d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 09:03, Jan Beulich wrote:
> On 30.07.2025 11:56, Petr Beneš wrote:
>> --- a/tools/firmware/hvmloader/smbios_types.h
>> +++ b/tools/firmware/hvmloader/smbios_types.h
>> @@ -90,13 +90,13 @@ struct smbios_type_2 {
>>      uint8_t product_name_str;
>>      uint8_t version_str;
>>      uint8_t serial_number_str;
>> -    uint8_t asset_tag_str;
>> -    uint8_t feature_flags;
>> -    uint8_t location_in_chassis_str;
>> -    uint16_t chassis_handle;
>> -    uint8_t board_type;
>> -    uint8_t contained_handle_count;
>> -    uint16_t contained_handles[];
>> +    uint8_t asset_tag_str;                  /* Optional */
>> +    uint8_t feature_flags;                  /* Optional */
>> +    uint8_t location_in_chassis_str;        /* Optional */
>> +    uint16_t chassis_handle;                /* Optional */
>> +    uint8_t board_type;                     /* Optional */
>> +    uint8_t contained_handle_count;         /* Optional */
>> +    uint16_t contained_handles[];           /* Optional */
>>  } __attribute__ ((packed));
>>  
>>  /* System Enclosure - Contained Elements */
>> @@ -118,12 +118,12 @@ struct smbios_type_3 {
>>      uint8_t power_supply_state;
>>      uint8_t thermal_state;
>>      uint8_t security_status;
>> -    uint32_t oem_specific;
>> -    uint8_t height;
>> -    uint8_t number_of_power_cords;
>> -    uint8_t contained_element_count;
>> -    uint8_t contained_element_length;
>> -    struct smbios_contained_element contained_elements[];
>> +    uint32_t oem_specific;                  /* Optional */
>> +    uint8_t height;                         /* Optional */
>> +    uint8_t number_of_power_cords;          /* Optional */
>> +    uint8_t contained_element_count;        /* Optional */
>> +    uint8_t contained_element_length;       /* Optional */
>> +    struct smbios_contained_element contained_elements[]; /* Optional */
>>  } __attribute__ ((packed));
>>  
>>  /* SMBIOS type 4 - Processor Information */
>> @@ -252,9 +252,9 @@ struct smbios_type_39 {
>>      uint8_t revision_level_str;
>>      uint16_t max_capacity;
>>      uint16_t characteristics;
>> -    uint16_t input_voltage_probe_handle;
>> -    uint16_t cooling_device_handle;
>> -    uint16_t input_current_probe_handle;
>> +    uint16_t input_voltage_probe_handle;    /* Optional */
>> +    uint16_t cooling_device_handle;         /* Optional */
>> +    uint16_t input_current_probe_handle;    /* Optional */
>>  } __attribute__ ((packed));
>>  
>>  /* SMBIOS type 127 -- End-of-table */
> 
> I regret now that I didn't look more closely before offering my ack. May I
> ask where these "Optional" (and also the ones in patch 3) are taken from?
> While looking at Teddy's patch to bump the version to 2.6 I considered it
> necessary to check whether other adjustments (fields becoming non-optional
> for example) would be required, and to my surprise and couldn't find proof
> of any of the above being optional in 2.4.

I take this back. This is written down in the spec, just not as clearly and
uniformly as one might wish.

Jan

