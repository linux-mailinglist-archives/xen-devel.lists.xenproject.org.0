Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F9808A3F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649917.1015037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFFD-0007tD-9y; Thu, 07 Dec 2023 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649917.1015037; Thu, 07 Dec 2023 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFFD-0007pw-7J; Thu, 07 Dec 2023 14:20:51 +0000
Received: by outflank-mailman (input) for mailman id 649917;
 Thu, 07 Dec 2023 14:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFFB-0007pn-NY
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:20:49 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d16fc517-950b-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:20:48 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso13897265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:20:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0040b40468c98sm2088870wmq.10.2023.12.07.06.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:20:48 -0800 (PST)
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
X-Inumbo-ID: d16fc517-950b-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701958848; x=1702563648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1PGSH+lXEYRF3W9CKhFKnWtpiSu2ZouxCZ9nvCJQ18=;
        b=QrsUnszb7voXA7/f3oYQUQnrzKP+Tb2eGxfZaZPsBQZlQ9yqH0OB4tdgXDEgSAFMpo
         CbLdOCKA0tvaz1R9h6EnClLezs2H2CP+WH9YhBeBSgaDik/x6H5Ma2PsfYuwe9EraP6F
         KmbA/EaEVxN10Gf8p/h+ZmIuw3bOcRD3Dm2kp/ugXIFvKXlxctJz7iSQjGGY3jkSnhcI
         hCS1MbBhlKeTs8nXFO+41cpVjIo/TkqxJdWFEgfgXFOysVqWxRboKlsDI00+12ZOLg7n
         A9w8H3jGj9CyGOhTXYO5WB+vE9Ww/R0M0BRxVrp+fmFdAZJXT5ZbkMr/vNmVTWaGzGGm
         aRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958848; x=1702563648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1PGSH+lXEYRF3W9CKhFKnWtpiSu2ZouxCZ9nvCJQ18=;
        b=Nr3rIeCxGpcyiJakJ6OND7d0bXxzjjoBDxEVfEPPtPW/YKg+U/5SjohLOUWvy7DEUe
         8+DBcP2YrhP860IYpYsLQ9abJnThmrz+Mik0+KTWKEIamQ6JcAsnia2bPBkmKOkCAQoA
         6bqrM9f0ltrR0JHQGc7K3G2TtHxTjfsCwDKymKM1fXS1Kxlip1kLRLzur6FM35onwsY6
         fZuyeWX3SWkpqwXOk7cXtM606XPCzQ67+fZ6E/OnoyOaxsBDz7LLITLwxtyQKVLAkhY1
         LbnAFN74fbfuY8CKrswisG0PlCU045b3C0OCT/zthYdQbi4VBoMkWAUHOX3NDyosaSzw
         w60Q==
X-Gm-Message-State: AOJu0Yx6asWbScullH78NdZtTyzzxRDoWomzyShi2Y+HdlHrCNo3IPv3
	mqIM4OX8OH4f+nKU7Jg95aOM
X-Google-Smtp-Source: AGHT+IEl4+UjkayVOK6AX8vyYP3nswneNI4IvJjM8hidzcEOezcyTrq0bwr1e2Cy3P6NiugWHP+jMQ==
X-Received: by 2002:a05:600c:1553:b0:40b:5e1d:83a6 with SMTP id f19-20020a05600c155300b0040b5e1d83a6mr1512519wmg.58.1701958848216;
        Thu, 07 Dec 2023 06:20:48 -0800 (PST)
Message-ID: <9f894049-ce44-41a4-b470-a27b7b46f26d@suse.com>
Date: Thu, 7 Dec 2023 15:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: introduce asm/guest_atomics.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <48ecbc771d3870eee86dd11a19f0dd9029e93c01.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <48ecbc771d3870eee86dd11a19f0dd9029e93c01.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/guest_atomics.h
> @@ -0,0 +1,48 @@
> +#ifndef __ASM_RISCV_GUEST_ATOMICS_H
> +#define __ASM_RISCV_GUEST_ATOMICS_H
> +
> +/*
> + * TODO: implement guest atomics
> + */

Along with this, wouldn't it be better to have e.g. ASSERT_UNREACHABLE()
in the unimplemented functions?

Jan

> +#define guest_testop(name)                                                  \
> +static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
> +{                                                                           \
> +    (void) d;                                                               \
> +    (void) nr;                                                              \
> +    (void) p;                                                               \
> +                                                                            \
> +    return 0;                                                               \
> +}
> +
> +#define guest_bitop(name)                                                   \
> +static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
> +{                                                                           \
> +    (void) d;                                                               \
> +    (void) nr;                                                              \
> +    (void) p;                                                               \
> +}
> +
> +guest_bitop(set_bit)
> +guest_bitop(clear_bit)
> +guest_bitop(change_bit)
> +
> +#undef guest_bitop
> +
> +guest_testop(test_and_set_bit)
> +guest_testop(test_and_clear_bit)
> +guest_testop(test_and_change_bit)
> +
> +#undef guest_testop
> +
> +#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
> +
> +#endif /* __ASM_RISCV_GUEST_ATOMICS_H */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


