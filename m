Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7970AB3947F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097620.1451880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWfP-0003DP-6C; Thu, 28 Aug 2025 07:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097620.1451880; Thu, 28 Aug 2025 07:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWfP-0003Be-3H; Thu, 28 Aug 2025 07:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1097620;
 Thu, 28 Aug 2025 07:03:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWfN-0003B2-Md
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:03:25 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1653d881-83dd-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 09:03:23 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78f5df4so92349466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:03:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe73cf6d76sm902478566b.83.2025.08.28.00.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:03:22 -0700 (PDT)
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
X-Inumbo-ID: 1653d881-83dd-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756364603; x=1756969403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cQTCE7Z5MB0ik/FmGzrhyVCKK4u+nY66QEhYyl/fWEw=;
        b=apaV/EGYadqnoAbCq4UjE9jQefotkHZFAYsmjjH/vW2tkTJURmYXc/7XZpsgDtRzUp
         gn9jcWYLM0+8LCJh/D5QKgC31UFKqQx0Cmo9FrlukzU/hrZsd7yY3h8YdgJ/vbfIjvkR
         XEKSjd0vS+ghpZYxfi3x+28PPZruTRHKhwiC2Eu0HeYUPY4X3f/Z9ZP5njHXu78whzTL
         IQNbOcm/H3B+Zaniz05QNPrBY78jOKYoVtmplsxW8YaBGudMuRNl0M0Nn8BocFZ3Re7R
         Hyu69qyvTT/ORbTFdrwVR023rvcHArWdpKDEFCQb1rb61qsm6dUTBiR47DPhuM3kw/v2
         IT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756364603; x=1756969403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQTCE7Z5MB0ik/FmGzrhyVCKK4u+nY66QEhYyl/fWEw=;
        b=QIFuqBsOhaEF+CbY827s813xh6TO+p4BEhRDUy/I040lWCIV7BD5q9n3ga1U5KsAUx
         B1FN3GGHKqrbOxB4EG+w/fRsZxtPntXc86OxIu+8rqOYkFToK/qLTAfUt4KWQUNU28gn
         /PAwNcoq0la944JDB+fU6K5vCQQJ6outfxqoyVlFETf8MBRDyf9/r1MqIOKMsITG9ARk
         25qeIN5cY61Yuc/Z1DTviXeJvi6VHknR94g5MiKmg2doIfXFMxDJ1i1owG7/pTzQfipK
         6ZGCr+lUhYzt+G4p1VQqURyiUUJqk4VcNBCSyRl36rwUk0Wbj+0PNnROO/ra1q6M1zv7
         8rBw==
X-Forwarded-Encrypted: i=1; AJvYcCWQbrZny4ehlrwmKPmb1Xu9c4GtalfS/NwkA/1E3l7xLXh3RTNJjD74CpClXyC/FivnAA/i0fwxvt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkvwhkzZpJDhwGka8a/DotMkB7Wk8COJ02i0QN8R2FQ+A+ZlRg
	5OqacOrV1JjJoBvh8O4EbHaxCJ7aqQuYvTLs9+y1g0pGI2qJ4UslnHpRgOU27GjA7A==
X-Gm-Gg: ASbGncsJqiB+Z/qrZs/pB1uIPav19ZBzTe9uZ+hPsfEXKESBN5ALloJdSKEzZ3JUdtL
	3NLKb0a/G69QjI2+qzC2BExUx2SkamLqbAjfErv6rLZulr0RR9ilAg+EXloKFdHTLeXhanmgvAn
	97zQxf1aRmwtldeUMWqm76tAZoPRBskz/yabGh+v4I1zTEOb5nUac6pp3fSjEE3SwusM1/uUtsu
	RaoBxr4RaQlYx+zo6l9R472yfGWqUufpHao1XjMJOkRgGBMgk+Iq9Vk/R7IB9ufavQZtAowkHzx
	faz1NCXRL9DmvKrNANGT1CvxEMeLL4A5rcya9C1qLgDFeS6NXeOdVgFRSW3PDRKfZbJXBqc2vXL
	/+qYTWtM1xyWXjWa5wkfhEg6lnyfQ719j12e1ky9QzLWwZYefT6dfeMu8t/vTMh3h/Yuij/IJpc
	lLA0p6gd5600YDnHi5fQ==
X-Google-Smtp-Source: AGHT+IGeuWhApvaa9bBlYP3r1M2X2GFsYve3L/UKBlUrxplwTR5jVoM1tpuASK0PObkm9xlbqXbgrQ==
X-Received: by 2002:a17:907:3c91:b0:ae0:c355:2140 with SMTP id a640c23a62f3a-afe295c0d96mr2132240166b.45.1756364602926;
        Thu, 28 Aug 2025 00:03:22 -0700 (PDT)
Message-ID: <89400b8f-0acf-49c6-979a-ecf608ec00d4@suse.com>
Date: Thu, 28 Aug 2025 09:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1753869323.git.w1benny@gmail.com>
 <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
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
In-Reply-To: <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 11:56, Petr Beneš wrote:
> --- a/tools/firmware/hvmloader/smbios_types.h
> +++ b/tools/firmware/hvmloader/smbios_types.h
> @@ -90,13 +90,13 @@ struct smbios_type_2 {
>      uint8_t product_name_str;
>      uint8_t version_str;
>      uint8_t serial_number_str;
> -    uint8_t asset_tag_str;
> -    uint8_t feature_flags;
> -    uint8_t location_in_chassis_str;
> -    uint16_t chassis_handle;
> -    uint8_t board_type;
> -    uint8_t contained_handle_count;
> -    uint16_t contained_handles[];
> +    uint8_t asset_tag_str;                  /* Optional */
> +    uint8_t feature_flags;                  /* Optional */
> +    uint8_t location_in_chassis_str;        /* Optional */
> +    uint16_t chassis_handle;                /* Optional */
> +    uint8_t board_type;                     /* Optional */
> +    uint8_t contained_handle_count;         /* Optional */
> +    uint16_t contained_handles[];           /* Optional */
>  } __attribute__ ((packed));
>  
>  /* System Enclosure - Contained Elements */
> @@ -118,12 +118,12 @@ struct smbios_type_3 {
>      uint8_t power_supply_state;
>      uint8_t thermal_state;
>      uint8_t security_status;
> -    uint32_t oem_specific;
> -    uint8_t height;
> -    uint8_t number_of_power_cords;
> -    uint8_t contained_element_count;
> -    uint8_t contained_element_length;
> -    struct smbios_contained_element contained_elements[];
> +    uint32_t oem_specific;                  /* Optional */
> +    uint8_t height;                         /* Optional */
> +    uint8_t number_of_power_cords;          /* Optional */
> +    uint8_t contained_element_count;        /* Optional */
> +    uint8_t contained_element_length;       /* Optional */
> +    struct smbios_contained_element contained_elements[]; /* Optional */
>  } __attribute__ ((packed));
>  
>  /* SMBIOS type 4 - Processor Information */
> @@ -252,9 +252,9 @@ struct smbios_type_39 {
>      uint8_t revision_level_str;
>      uint16_t max_capacity;
>      uint16_t characteristics;
> -    uint16_t input_voltage_probe_handle;
> -    uint16_t cooling_device_handle;
> -    uint16_t input_current_probe_handle;
> +    uint16_t input_voltage_probe_handle;    /* Optional */
> +    uint16_t cooling_device_handle;         /* Optional */
> +    uint16_t input_current_probe_handle;    /* Optional */
>  } __attribute__ ((packed));
>  
>  /* SMBIOS type 127 -- End-of-table */

I regret now that I didn't look more closely before offering my ack. May I
ask where these "Optional" (and also the ones in patch 3) are taken from?
While looking at Teddy's patch to bump the version to 2.6 I considered it
necessary to check whether other adjustments (fields becoming non-optional
for example) would be required, and to my surprise and couldn't find proof
of any of the above being optional in 2.4.

Jan

