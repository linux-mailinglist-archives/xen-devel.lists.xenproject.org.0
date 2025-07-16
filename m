Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D511FB07350
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 12:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045065.1415122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubzMm-00056n-DC; Wed, 16 Jul 2025 10:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045065.1415122; Wed, 16 Jul 2025 10:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubzMm-00053j-AY; Wed, 16 Jul 2025 10:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1045065;
 Wed, 16 Jul 2025 10:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubzMl-00053d-7j
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 10:27:59 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5d703d-622f-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 12:27:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so46973435e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 03:27:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4323ee2sm120249895ad.138.2025.07.16.03.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 03:27:56 -0700 (PDT)
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
X-Inumbo-ID: 8a5d703d-622f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752661677; x=1753266477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IT9UdHco8EvE328Js+NjxTF9nMhZR/PHllP//xshk84=;
        b=OhROSEDLRKArKCNAgxoTvspcyA+OaZFjDNfv0udDO1ATyIO2SLbzwJSPaFlPUSUBZH
         S9EG++UW+BcZ5Y8e9PynjaB8t7a6qqhQUCbUzyQq4bnVcZexGbyF8DV+/SpK0is6b6BQ
         /bzz834a6W0YxM9ggVKdgEdyGoQys+Q9Gahme0ek1vFZsKPnbO/kL/yIRaieTs+2seLE
         oA7lVmWWSrp2/an08A8hMEeMmIGHz1hOr1UwGUMOgIT0+6hFN1wprL6jPvK7EP/7ufG5
         U+4J/YTGSkn6pm0/9UAHzCziPlBrjHic+rcdxTaR9/twlN5I5MdhNEWEtPCFak/ggd5b
         b3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661677; x=1753266477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT9UdHco8EvE328Js+NjxTF9nMhZR/PHllP//xshk84=;
        b=okBNp00iGB9WAD1JkaU7hsOVdM98lnNGj3Y6B6qsyH2y95AXH53qCuoU3yu7UGBK+N
         RAwoyvLHUMtuR1cqCMrkDhVr0Lgd/nVg7YD3Vkb5U18P7VD1p+NVMw0khpJNPQutpjPL
         NtEzgbSq6lWCGyNBYN/+fG4qgT/CzMnlwkUsb1zBHujogW8ELb742LjJxXYzeG7BVZMD
         sUS5hzPbbBFxVfCd4+2eacB52OvPTAUjiYT2FOFORvJHtKT3twYnDx+zoir9bax4Ltvd
         7accporaGXz+GQxwIGugboTus68JdqZoKvIMcyBV25MVi2DEPkW1Vtr6XXBMw6dJHXiu
         dsQg==
X-Forwarded-Encrypted: i=1; AJvYcCVt7Srq3LJ3yoFswsY7LmfGspvD3VEG4SwatUKeyW+HY7/nI9RwyGqG1zvZPMWGKOJClZ1q2DVPd0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxo27kMouV/ZsAualvEtuPpi2dwCR8XgLCdBlwcAgPnFLfIAOtG
	kHh4/RVnyeXHi6s64+H6aE5Ht2ZNde54FXGEhrcC+g3V1T4ED/60PfpzDcYw18A1eA==
X-Gm-Gg: ASbGncuKPXHyNanGqwk5LGmQ/IQRdmndJstIe5NMVCBmoJ71SSx40QoGZJHv/asBHKb
	cTnSO/Ndf5v3hKX9ojYtmCKF4jjce02tWr7cZ+Kiw2Ep7SxyvwNkP145r/kmXhU1HuzPSS5jksW
	jPRT2HVwW6/1r9bKoM8Ft7eNylIBDivadj/kErpwHwUwThRAX9la5WJUqtfW5lUX5MjYWOQ3DY5
	Z+DRQsMzi/4A9pAecYbUAUMJAa+kA2Ttp1KdpwL3XcOlLjeH4xIzw1Dwl3NOGuFyIiZN3T1YDdM
	ZR1NtHUHy27IVlH5pS2McFfr8maUQFlrQarR3QF5DKYDIOmYJMT35pK6dHamuxOQmrQwOmTE43G
	2XSrpoTjd0Tk0wM2nLgzcwAs4+JOb7OL0eu+IPBEI7kNofv4W0eEkcad0Gd5X0DTzVunNhUYpjf
	ruQ5Is3n4=
X-Google-Smtp-Source: AGHT+IFKOBu4vlFLWlxI8yB2dXPHqDkcch+rSTVYsG71WQyXy1ieN2tOC8aiPKaNNMAst3CPQrVnQg==
X-Received: by 2002:a05:6000:41ea:b0:3a5:2c18:b181 with SMTP id ffacd0b85a97d-3b60e54bb64mr1659751f8f.53.1752661676855;
        Wed, 16 Jul 2025 03:27:56 -0700 (PDT)
Message-ID: <9357cd00-3557-46ff-9a74-ae44c298bc47@suse.com>
Date: Wed, 16 Jul 2025 12:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1752533080.git.w1benny@gmail.com>
 <9494aa56929b5cb443b9cccb0e671510071b4aab.1752533080.git.w1benny@gmail.com>
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
In-Reply-To: <9494aa56929b5cb443b9cccb0e671510071b4aab.1752533080.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 00:49, Petr Beneš wrote:
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -47,6 +47,8 @@ static void
>  smbios_pt_init(void);
>  static void*
>  get_smbios_pt_struct(uint8_t type, uint32_t *length_out);
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size);

This new helper function isn't mentioned at all in the description. Its
connection to the purpose of the change also is unclear to me. Should
its introduction have been a separate change? And then here only the
length checks be adjusted? (I wouldn't insist on splitting, but the
description at least wants to reflect this addition and in particular
its purpose.)

> @@ -154,6 +156,25 @@ get_smbios_pt_struct(uint8_t type, uint32_t *length_out)
>      return NULL;
>  }
>  
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size)
> +{
> +    struct smbios_structure_header *header = start;
> +
> +    void *pts;
> +    uint32_t length;

Nit: Excess blank line in the middle of declarations.

> @@ -381,16 +402,11 @@ smbios_type_0_init(void *start, const char *xen_version,
>      struct smbios_type_0 *p = start;
>      static const char *smbios_release_date = __SMBIOS_DATE__;
>      const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void* next;

Nit: Misplaced *.

> @@ -440,16 +456,11 @@ smbios_type_1_init(void *start, const char *xen_version,
>      char uuid_str[37];
>      struct smbios_type_1 *p = start;
>      const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void* next;

Again.

> @@ -499,25 +510,27 @@ smbios_type_2_init(void *start)
>      struct smbios_type_2 *p = start;
>      const char *s;
>      uint8_t *ptr;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>      unsigned int counter = 0;
>  
> -    pts = get_smbios_pt_struct(2, &length);
> -    if ( pts != NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle = SMBIOS_HANDLE_TYPE2;
> +    /*
> +     * Specification says Type 2 table has length of at least 08h,
> +     * which corresponds with "Asset Tag" field offset.
> +     */

This comment looks to be entirely unrelated to the code which follows.
What is this about? Did you mean to ...

> +    next = smbios_pt_copy(start, 2, SMBIOS_HANDLE_TYPE2, sizeof(*p));

... replace the sizeof() here, using offsetof() instead?

This applies elsewhere as well. Interestingly for type 39 you do use
offsetof(). Actually, for type 0 the descrpition also says "at least",
without that being reflected in the code.

> +    if ( next != start )
> +    {
>          /* Set current chassis handle if present */
> -        if ( p->header.length > 13 )
> +        if ( p->header.length >= offsetof(struct smbios_type_2, board_type) )

Comment and code don't fit together, unless one goes check that board_type
is the field immediately following chassis_handle.

>          {
> -            ptr = ((uint8_t*)start) + 11;            
> +            ptr = ((uint8_t*)start) + offsetof(struct smbios_type_2,
> +                                               chassis_handle);

The cast can also be dropped at the same time.

>              if ( *((uint16_t*)ptr) != 0 )
>                  *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;

Why not switch to p->chassis_handle, without any use of "ptr"? Yet then I
fear I don't really understand what is being done here. Why would an
arbitrary non-zero value be overwritten with a fixed value?

> @@ -946,20 +949,14 @@ smbios_type_32_init(void *start)
>  static void *
>  smbios_type_39_init(void *start)
>  {
> -    struct smbios_type_39 *p = start;
> -    void *pts;
> -    uint32_t length;
> -
> -    pts = get_smbios_pt_struct(39, &length);
> -    if ( pts != NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle = SMBIOS_HANDLE_TYPE39;
> -        return start + length;
> -    }
> +    /*
> +     * Specification says Type 39 table has length of at least 10h,
> +     * which corresponds with "Input Voltage Probe Handle" offset.
> +     */
>  
> -    /* Only present when passed in */
> -    return start;
> +    return smbios_pt_copy(start, 39, SMBIOS_HANDLE_TYPE39,
> +                          offsetof(struct smbios_type_39,
> +                                   input_voltage_probe_handle));
>  }

The other comment may want retaining, though.

> --- a/tools/firmware/hvmloader/smbios_types.h
> +++ b/tools/firmware/hvmloader/smbios_types.h
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

Why not also mark other optional fields as such?

Jan

