Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939B9D217C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839736.1255519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJSV-0005hQ-8i; Tue, 19 Nov 2024 08:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839736.1255519; Tue, 19 Nov 2024 08:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJSV-0005f6-5x; Tue, 19 Nov 2024 08:19:39 +0000
Received: by outflank-mailman (input) for mailman id 839736;
 Tue, 19 Nov 2024 08:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDJSU-0005eY-1I
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:19:38 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02bdd818-a64f-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 09:19:35 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3822ba3cdbcso2505728f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 00:19:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3823ef846a5sm7761042f8f.102.2024.11.19.00.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 00:19:34 -0800 (PST)
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
X-Inumbo-ID: 02bdd818-a64f-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyYmRkODE4LWE2NGYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDA0Mzc1LjIzMzYwMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732004374; x=1732609174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RBsY1TbxZuvaiB0t8n7d6lGWnHlwuOOKyEZpoz0jQyo=;
        b=Z/32KrSzFcN+aX5NPoeXHEgPKN8k0QXuXmuUposO04J8ZrnAl4b4Wap8Fgyn4of58v
         OmgK9/9b/KbdKPQ0k7RlqZAzYsQLFQ8mfI+Wd1VKopqJJqfnKhHZkkt5RMhoHyKfc+iT
         ojXTRXBgnGPWyd4fEzDxMkQ8Ji8nAzeNicNZLt4jyrLZINzpAnqV6v8RaDmvZMjugZKw
         8QD0Q41eRM/PxhJIKBbxtyBa5OGDy4crqN8GIodf7yvnkx4zQ7dBeSMIkbC1BbDh37Ap
         +ENQ4K6E4r9NcsGmhnNLqMl8y85mO+e44qFwRT7+Zc/sMQ8ZpuU6NeWv12ISUzBXjQMz
         UFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004374; x=1732609174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBsY1TbxZuvaiB0t8n7d6lGWnHlwuOOKyEZpoz0jQyo=;
        b=YTfYT1lmC3GCP0yl+42xa3FQWDnNKmGNBqkbth8ckbie9fQtwooHfNVQ1shKwpyzMa
         mfbN6z5DdmRMAiCCjBB5y3FyaSqZJe1wUmokI6zG2yzTeLHH/lvXtWkNDi7POLSKir7B
         QJ9eibLyNwBjYfSf1rwfTznqs5edevDvELCvrqwrL4/LVAcac31+eXbMVAu2tqhnpxlO
         3pWcdoC6Oc3x3XOeZ/NXxAGr95kvOvZZ4JAV/n0AOTQIAb7leNXi4Pw96wzLXmsOdFsx
         evW1wX5eK288127MkH8eIigsDia1PAR96WsBAUFR+6CDH5MbXDTCr8PQLhg+sqqfkQia
         No7g==
X-Forwarded-Encrypted: i=1; AJvYcCWTD4OId5fmhtS2mSnOx1VkdBnTEGLB154uocMyeRWwjogKLTv6h8h1arvyFzMtPAznYIFQNGS/ISw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaXVKKFlLM3mBV46ljXDET3DLfsTBdKf70ackcCVLAiUsjVD10
	D4tVCR5OX4khrLws4jkkkgkPu7J1BFm25W/aGoXd588ew+Xo/enrDHk/iKMpYw==
X-Google-Smtp-Source: AGHT+IGPug8mFXyz0bm8HSCDTLGQlBsdxbji7I2BX0/PgnxRZVT0SuYwqnJiRTMJdnimgLBjoRADlA==
X-Received: by 2002:a5d:584b:0:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-3822590f2c3mr10247718f8f.19.1732004374558;
        Tue, 19 Nov 2024 00:19:34 -0800 (PST)
Message-ID: <88c486f9-c2f1-44ed-a415-1a1dc3f156b4@suse.com>
Date: Tue, 19 Nov 2024 09:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Introduce boot-helpers.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241118171809.2447714-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241118171809.2447714-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 18:18, Andrew Cooper wrote:
> Eclair complains that neither reloc_trampoline{32,64}() can see their
> declarations.
> 
> reloc_trampoline32() needs to become asmlinkage, while reloc_trampoline64()
> needs declaring properly in a way that both efi-boot.h and reloc-trampoline.c
> can see.
> 
> Introduce boot-helpers.h for the purpose.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/boot-helpers.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Declarations for helper functions compiled for both 32bit and 64bit.
> + *
> + * The 32bit forms are called only from assembly, so no declaration is provide
> + * here.
> + */

How certain are you/we that what is said in the 2nd paragraph will remain
as a pattern?

Also, nit: s/provide/provided/?

Jan

