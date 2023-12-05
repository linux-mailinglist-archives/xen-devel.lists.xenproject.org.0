Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8FC80569A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647905.1011633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVt9-0007Yo-RZ; Tue, 05 Dec 2023 13:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647905.1011633; Tue, 05 Dec 2023 13:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVt9-0007XO-O3; Tue, 05 Dec 2023 13:55:03 +0000
Received: by outflank-mailman (input) for mailman id 647905;
 Tue, 05 Dec 2023 13:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVt8-0007XG-Um
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:55:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e27f9118-9375-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 14:55:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09d62b70so28551275e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:55:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b004083729fc14sm22479702wmg.20.2023.12.05.05.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:55:00 -0800 (PST)
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
X-Inumbo-ID: e27f9118-9375-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701784501; x=1702389301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUkHute28QJ0yx9fsSEsxddF0ft/WA9qp8dCCGt8ke8=;
        b=MqNJOe/mqIMOg+fiDs4+IbZgmIf2LnyV5Dk9RTDTsWOkHwNw+u4p9bd2IvLdQtfc1/
         vNSSgo1Sdt7Dx5wjpfgHwe8DLxH2hc+OyJwHgSz8Zq9oIiPpF08THpnxjYfgbspvkCLG
         Uf9PvwKI3zKBEokMM2s1olN9Dt6XaagO01J8wSTcIUbWisESILNAJO4S8elUm530O+Kf
         sa0GXBc/XrGeHU5r04Uof5lu0qrh/gxbzf2atAizWzoRFJEcmbGmWO7tOX1F5rsOdcje
         8nxDm/6Uyd/c9OaPboZz+Eorsd2aDQmeFEHMz4aTXwfc8IxAQLy9HhcptkzoEwfqNfGH
         FY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784501; x=1702389301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUkHute28QJ0yx9fsSEsxddF0ft/WA9qp8dCCGt8ke8=;
        b=QBZuGGgSJH4XvwBLrmigRMHsf8UDdYKSHW7xkLdBd/BO5QbmEcrKPBntp4dTJT0UCF
         fWJPkrKTsf+wxeO4/WE1jO/M2jbnDhQ2iKdxMSG1VqX4/x6u/vgPhVZep8oXFDY10c5B
         YB9kPv66MQv9xelNkmFKG/lzdp3/LLk+9zCbvqzF9IHlkje1T6ToO9WAkwSbEgScvXpU
         P/wx6eGIeQzdsRG5H89RIGq9z+/ztmWi9mlbUTFP5gz3i/FK6mDiKdA5/uoIcOuOrQSo
         RHBtCBcU01tnuNBMK+Am6eOvJ1kDhd81CI/1pDYrh4BhMzACKiPFzsCf6+zMzvr91HO7
         afSg==
X-Gm-Message-State: AOJu0Ywt2FuPXZbOv8fhmjscM5APYnw4hphXiYE48dU6K+paQitONgEi
	K8wCVGrCTIYQS23V8mw078Pl
X-Google-Smtp-Source: AGHT+IGsYm97j5so8SuU4BQV9k19EbY/+ovfpnGH6474N6Jtk3zn80qeErCDnBEcGY0B4bl4PxqafQ==
X-Received: by 2002:a05:600c:4d1e:b0:40c:c1a:cfac with SMTP id u30-20020a05600c4d1e00b0040c0c1acfacmr290011wmp.158.1701784501131;
        Tue, 05 Dec 2023 05:55:01 -0800 (PST)
Message-ID: <8aa1ae99-5bc3-4165-90eb-e522769d4de3@suse.com>
Date: Tue, 5 Dec 2023 14:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
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
In-Reply-To: <20231205100756.18920-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 11:07, Juergen Gross wrote:
> @@ -15,67 +7,126 @@
>  #include <asm/byteorder.h>
>  #endif
>  
> -#define get_unaligned(p) (*(p))
> -#define put_unaligned(val, p) (*(p) = (val))
> +/*
> + * This is the most generic implementation of unaligned accesses
> + * and should work almost anywhere.
> + */
> +
> +#define __get_unaligned_t(type, ptr) ({						\
> +	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
> +	__pptr->x;								\
> +})
> +
> +#define __put_unaligned_t(type, val, ptr) do {					\
> +	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
> +	__pptr->x = (val);							\
> +} while (0)

Please can we avoid gaining new (even double) leading underscore symbols,
especially when they're in helper (i.e. not intended to be used directly)
constructs? No reason to introduce further issues wrt Misra adoption.

> +#define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
> +#define put_unaligned(val, ptr) __put_unaligned_t(typeof(*(ptr)), (val), (ptr))

May I ask to omit excess parentheses where possible?

> +static inline u16 get_unaligned_le16(const void *p)
> +{
> +	return le16_to_cpu(__get_unaligned_t(__le16, p));
> +}
> +
> +static inline u32 get_unaligned_le32(const void *p)
> +{
> +	return le32_to_cpu(__get_unaligned_t(__le32, p));
> +}
> +
> +static inline u64 get_unaligned_le64(const void *p)
> +{
> +	return le64_to_cpu(__get_unaligned_t(__le64, p));
> +}
> +
> +static inline void put_unaligned_le16(u16 val, void *p)
> +{
> +	__put_unaligned_t(__le16, cpu_to_le16(val), p);
> +}
> +
> +static inline void put_unaligned_le32(u32 val, void *p)
> +{
> +	__put_unaligned_t(__le32, cpu_to_le32(val), p);
> +}
> +
> +static inline void put_unaligned_le64(u64 val, void *p)
> +{
> +	__put_unaligned_t(__le64, cpu_to_le64(val), p);
> +}
> +
> +static inline u16 get_unaligned_be16(const void *p)
> +{
> +	return be16_to_cpu(__get_unaligned_t(__be16, p));
> +}
> +
> +static inline u32 get_unaligned_be32(const void *p)
> +{
> +	return be32_to_cpu(__get_unaligned_t(__be32, p));
> +}
>  
> -static inline uint16_t get_unaligned_be16(const void *p)
> +static inline u64 get_unaligned_be64(const void *p)
>  {
> -	return be16_to_cpup(p);
> +	return be64_to_cpu(__get_unaligned_t(__be64, p));
>  }
>  
> -static inline void put_unaligned_be16(uint16_t val, void *p)
> +static inline void put_unaligned_be16(u16 val, void *p)
>  {
> -	*(__force __be16*)p = cpu_to_be16(val);
> +	__put_unaligned_t(__be16, cpu_to_be16(val), p);
>  }
>  
> -static inline uint32_t get_unaligned_be32(const void *p)
> +static inline void put_unaligned_be32(u32 val, void *p)
>  {
> -	return be32_to_cpup(p);
> +	__put_unaligned_t(__be32, cpu_to_be32(val), p);
>  }
>  
> -static inline void put_unaligned_be32(uint32_t val, void *p)
> +static inline void put_unaligned_be64(u64 val, void *p)
>  {
> -	*(__force __be32*)p = cpu_to_be32(val);
> +	__put_unaligned_t(__be64, cpu_to_be64(val), p);
>  }
>  
> -static inline uint64_t get_unaligned_be64(const void *p)
> +static inline u32 __get_unaligned_be24(const u8 *p)

Here and below - do you foresee use of these 24-bit helpers? They weren't
there before, and the description also doesn't justify their introduction.

Jan

