Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC9AF0C4C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030309.1403961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrhC-000593-QD; Wed, 02 Jul 2025 07:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030309.1403961; Wed, 02 Jul 2025 07:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrhC-00056G-Mk; Wed, 02 Jul 2025 07:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1030309;
 Wed, 02 Jul 2025 07:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWrhB-00056A-RX
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:15:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 622ee018-5714-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 09:15:50 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453749af004so35161955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 00:15:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c70c4086csm5430035ad.216.2025.07.02.00.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:15:49 -0700 (PDT)
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
X-Inumbo-ID: 622ee018-5714-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751440550; x=1752045350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2KHYvTI8oUUQaNB2RGZY6jPEXYSSgTgp1d8tcIudTo8=;
        b=JA/g9Nfd8Fy72ZNLrcuQife1MN7Rc6M1gnGVFkkYxu2643ItykjfWmDqoTdVL0yNFE
         /gV7K+CptOOgbnDloFbiw20zdYMC/FmVcTy7c5YA7stO1qUNsgfICzMgCa24uD8HZ4g2
         rtMPxWLnHlKwtH4HGgXbWqBIvJowv9C/+7elMoIuXSgCpDn7RkymGpSmApR5MpPn2RUt
         tyHQN3QviTv4k9ULIy5uwGspBA593wcVBwp2S8SoyNWsRr+go749bROUUozQqpeiMo1q
         G/YoXGKpuU0vM9dZjyqvbb27s8zLtnqi9cMbRuRvbblxK38Y1wCq8X8oUyDL01J3A7OT
         /Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440550; x=1752045350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KHYvTI8oUUQaNB2RGZY6jPEXYSSgTgp1d8tcIudTo8=;
        b=XjBFKN96Uhc8AKDGlQvXj1E8SONTDoLK4rfvsP75ykuGsB83seHKrlcVTbJxXg8Hpu
         6ERS2P3qs1dp755cyAx8hEwWQmVm6NUIxxfDW4jD6se0Mj1jKVcSiInXWjnsOR4jhe+i
         vtTSJZjSjYdLKHFmX/MsfxzMTfNs/uHBsWD/DFOXXuvazErXoCfzBWHs1QSh4RMpkocp
         4q4a7GzE3yJc1bOVnbmKlAAT36X43/PAO0rcdt+JeMhuvWGRUPw7MD8bgrx9LVRYtH4l
         1at+fK8M/65L5mZycxfE2E2LRvD7adPS2M3efcYPb22f/t32wCXuXxYQfk5uxkc0FOzl
         GuMg==
X-Forwarded-Encrypted: i=1; AJvYcCUX9Uz6EjVqVU1CJ2PVQIJ9Qzorli3zormlJHfgFOiEn3C5ay/LS9aaQoHfuhky6x+2UMZ5PBWeuDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3FWzZSd4Ku+iHkFOKuIWUyCQMOHcMq65ldDdNpKbgRVCboHJA
	ompy+mZjoIRf8kRQnTjBuL8z3dykdXZA6avfFXexuuSL7YfGQwaWaFV5SNcCFEelGDVByHHmSV7
	Dy7M=
X-Gm-Gg: ASbGncv+VUOiqr6+dJF7BzIiJ2zKmUjxlHPY5VwmgaTHfW+Rwpl82jtSSjvhWDWJY2R
	0dVNDaVqr7PXoFab98fe7HmS9yB5CcNQDCNT/jGpXiuoxEtOJJ/3tHg5LunzI+rR4QfWZfeDohW
	UtJinrsxkwqWrvSrPFwDGwviGtOYisToCCwsvidnS9NS4yFZqdFCzHvlrHTrs7jVIgsCMdECXiL
	F4qEHFLwlboHEN/RAeDPE89k+CNjdR3em8ayRLnRQeVPEH/7amQw3lK6cEhkKf0TqNsbjmMq3ql
	9TPbzXLvoGXQEwz1pN+3j9TbLIq5KVL1NuRPxYsaVwYvW8iyJfoLzSbiBPbNl6U3ljlACTB3F5g
	gWGd5/jw1FN9znznPfvUeGHEqSpZcaKBJbYGhIPZr+K0DME4=
X-Google-Smtp-Source: AGHT+IFvyKx+5GXO7wEwvrvIKE8BkuweBgx8r8URkFBz2hEkny//JDY3FWOItLfY6TDm9kQY0hN1uA==
X-Received: by 2002:a05:6000:43d4:20b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3b20067a807mr700372f8f.39.1751440550128;
        Wed, 02 Jul 2025 00:15:50 -0700 (PDT)
Message-ID: <8143b492-6e3a-48bb-b564-52b2623a78f7@suse.com>
Date: Wed, 2 Jul 2025 09:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Anton Belousov <blsvntn@outlook.com>, xen-devel@lists.xenproject.org
References: <cover.1751412735.git.w1benny@gmail.com>
 <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
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
In-Reply-To: <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 01:45, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>

This isn't in line with the first S-o-b, nor with the fact that in the cover
letter you say this was previously submitted (and hence authored?) by Anton.

> SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection
> by malware using WMI-queries. New tables can be mapped to memory from binary
> file specified in "smbios_firmware" parameter of domain configuration.

Who or what says these are "necessary"? Also, to have at least a basic
understanding without consulting the spec (and without reading the patch in
its entirety), mentioning what the numbers actually stand for would be helpful,
I think. This way the connection to "necessary" or maybe merely "desirable"
would likely also be easier to make.

> @@ -700,6 +724,66 @@ smbios_type_4_init(
>      return start+1;
>  }
>  
> +/* Type 7 -- Cache Information */
> +static void *
> +smbios_type_7_init(void *start)
> +{
> +    struct smbios_type_7 *p = start;
> +

Nit: What use is this blank line?

> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(7, &length);
> +    if ( pts != NULL && length >= sizeof(struct smbios_type_7) )
> +    {
> +        memcpy(start, pts, length);
> +        p->header.handle = SMBIOS_HANDLE_TYPE7;
> +        return start + length;
> +    }
> +
> +    return start;
> +}
> +
> +/* Type 8 -- Port Connector Information */
> +static void *
> +smbios_type_8_init(void *start)
> +{
> +    struct smbios_type_8 *p = start;
> +
> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(8, &length);
> +    if ( pts != NULL && length >= sizeof(struct smbios_type_8) )
> +    {
> +        memcpy(start, pts, length);
> +        p->header.handle = SMBIOS_HANDLE_TYPE8;
> +        return start + length;
> +    }
> +
> +    return start;
> +}
> +
> +/* Type 9 -- System Slots */
> +static void *
> +smbios_type_9_init(void *start)
> +{
> +    struct smbios_type_9 *p = start;
> +
> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(9, &length);
> +    if ( pts != NULL && length >= sizeof(struct smbios_type_9) )
> +    {
> +        memcpy(start, pts, length);
> +        p->header.handle = SMBIOS_HANDLE_TYPE9;
> +        return start + length;
> +    }
> +
> +    return start;
> +}

These all look largely identical with one another, and they also look to
match smbios_type_39_init(). Surely we could do with less redundancy by
having some common helper dealing with "Only present when passed in" cases,
as smbios_type_39_init() states it in a comment.

> @@ -780,7 +864,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
>  {
>      char buf[16];
>      struct smbios_type_17 *p = start;
> -    
> +
>      memset(p, 0, sizeof(*p));
>  
>      p->header.type = 17;
> @@ -815,7 +899,7 @@ static void *
>  smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
>  {
>      struct smbios_type_19 *p = start;
> -    
> +
>      memset(p, 0, sizeof(*p));
>  
>      p->header.type = 19;

These two hunks look like they belong in patch 1. They're entirely unrelated
here (i.e. not even adjacent to code being touched).

> @@ -232,6 +270,45 @@ struct smbios_type_22 {
>      uint32_t oem_specific;
>  } __attribute__ ((packed));
>  
> +/* SMBIOS type 26 - Voltage Probe */
> +struct smbios_type_26 {
> +    struct smbios_structure_header header;
> +    uint8_t description_str;
> +    uint8_t location_and_status;
> +    uint16_t maximum_value;
> +    uint16_t minimum_value;
> +    uint16_t resolution;
> +    uint16_t tolerance;
> +    uint16_t accuracy;
> +    uint32_t oem_defined;
> +    uint16_t nominal_value;     // Optional

Nit: We don't use C++ style comments in Xen.

> @@ -252,9 +329,9 @@ struct smbios_type_39 {
>      uint8_t revision_level_str;
>      uint16_t max_capacity;
>      uint16_t characteristics;
> -    uint16_t input_voltage_probe_handle;
> -    uint16_t cooling_device_handle;
> -    uint16_t input_current_probe_handle;
> +    uint16_t input_voltage_probe_handle;    // Optional
> +    uint16_t cooling_device_handle;         // Optional
> +    uint16_t input_current_probe_handle;    // Optional
>  } __attribute__ ((packed));

This again looks like an unrelated change. I don't mind it living here, but
such wants mentioning in the description. Then again this may better be done
in patch 2, to accompany the size checks (where it matters from what offset
onwards fields are optional).

Jan

