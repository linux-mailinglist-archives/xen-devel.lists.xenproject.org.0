Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887E83180A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 12:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668712.1041096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQAz-0008K1-Is; Thu, 18 Jan 2024 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668712.1041096; Thu, 18 Jan 2024 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQAz-0008Hc-Fc; Thu, 18 Jan 2024 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 668712;
 Thu, 18 Jan 2024 11:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQQAy-0008HS-0S
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 11:03:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2acaeead-b5f1-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 12:03:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e775695c6so34569615e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 03:03:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm29427703wmq.47.2024.01.18.03.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:03:09 -0800 (PST)
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
X-Inumbo-ID: 2acaeead-b5f1-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705575790; x=1706180590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpp6kPELiW382nvJzMf/yJnYrHcRJyqBYUwBSZPXJyE=;
        b=V/ycx/2an6jDR8zI1HQE15vWU9hsCp8j87XQZ/OPAOfIL3aiR74psyBawNnElqyajj
         kDetT/qj5DmhlUU1nIB9QyRL4H2NapvOmThvW/KJfniBmrQ604eU9Z62mA+aJElog//3
         cjdDHgLCVeruiPLP1MkJ5Ti0oNg9OdU7iM3Of7sLRDwEB2pCIwInbT59pI4fpvkYtGYw
         ykxIjW4TJs5n2lHxMmZ6oByaIvqcDqcOo1fJn5qKKurgMFbIIvdlyYXVAzfu4sscdKeg
         4wFSnX7iZtyXBYZVQsAv7db5OE7C5krcJKb8i/e+lbAuPdRs4jf2GMw3Qxx98dyO9wNr
         my7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705575790; x=1706180590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpp6kPELiW382nvJzMf/yJnYrHcRJyqBYUwBSZPXJyE=;
        b=xQiiwEkoYBTkCVsxURxZM66cEzVbCQ4EIO7LAZonUFG+nQCUNSvpWpDEALdsfY1zJu
         jdaG24ejDKSvsRrBKvql23491wkSiIyrhK9lGDN7r8vH5N+dclah+lFcfEPj8iMAKALY
         CWp7YmhT9piF4w8Mc0LU5meQYzTRGB77c5bprGcM6H7yXY3Ej4i0wH+7Gv8s1CNVKlOf
         0qxVdAGL0RcmcPzUChM/abZvIl8iAOB1ejRywRBRAXU7T3skGt7wF36mp3MuHi6Oxt+h
         tpySKAjXG3l2QKRBwnd9nNlSarAnNnMyUUNahbEKSgkEoBJPlTB9wpv1BN8EJUQe7zA+
         orZg==
X-Gm-Message-State: AOJu0YwW4a0+6ynedTCLa1O3uz9TNfxlsj8n16RrWCRh+KmV/f7fn0d3
	9ILlRfz3Hn59BcpYxAyXr7h6ex5qdDMQvpnYaq6QJqWlw1M4fkPInFc6vBzxSg==
X-Google-Smtp-Source: AGHT+IHs/DFcCtimizrkdFiFwB8G7tno7dMf8UBxvbSlg1aK7WYDMCTEbrYZCIG3VBa7MMUxdBr5wg==
X-Received: by 2002:a05:600c:295:b0:40e:6cf9:506e with SMTP id 21-20020a05600c029500b0040e6cf9506emr456602wmk.96.1705575790130;
        Thu, 18 Jan 2024 03:03:10 -0800 (PST)
Message-ID: <f6e13ad0-5401-41f7-9f3b-ef8f1bf9c1df@suse.com>
Date: Thu, 18 Jan 2024 12:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> +#define _ASM_GENERIC_BITOPS_BITS_H_
> +
> +#define BITOP_BITS_PER_WORD     32
> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
> +#define BITS_PER_BYTE           8

Btw, I can't spot a use of BITS_PER_BYTE. Why do you add it? And if
it really needed adding, it surely wouldn't belong here.

Jan

