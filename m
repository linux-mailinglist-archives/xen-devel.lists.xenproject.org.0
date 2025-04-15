Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D2A8A1EA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954088.1348437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hfK-0005NM-7j; Tue, 15 Apr 2025 14:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954088.1348437; Tue, 15 Apr 2025 14:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hfK-0005Lu-4F; Tue, 15 Apr 2025 14:53:34 +0000
Received: by outflank-mailman (input) for mailman id 954088;
 Tue, 15 Apr 2025 14:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4hfH-0005Lo-Tl
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:53:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62980ce9-1a09-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 16:53:26 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so45315945e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:53:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecf30sm213376605e9.1.2025.04.15.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:53:25 -0700 (PDT)
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
X-Inumbo-ID: 62980ce9-1a09-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744728805; x=1745333605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VxTL5ahFjodUKC8R5m8kCjr9a/u0Ub/bMVEGvmgGta4=;
        b=Wd3KXaH1F+UXHMABfnO+Saj4vrc+7aUrrniaEpdaBe8mt0SHN+UZpm04IaUhLuwQUY
         kU2pWoRNP/40tN3ZhTNgPGxye3X+kN0dlWG0zzxUY+0MTfIlx6NrssHSiZrVDPt7l5vP
         GNhM0qFaWtYgvMfF0+UTmJqQLUG8U9U3YLq/o1LVgvMVGf2ucJUsoUt6WanmPIPspXgA
         U2BTo9C4WsTxY9I/jwd0BgaHxES2hV69rfyPbr/Dg2wDkVsOlITixhnFCdTZj732MFE4
         O1nBin7tzAStOURhH4vUgx42lEV83CvFgSDlklhlHGBQcRuAP17ADkWrCclY4DIEb68s
         TjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728805; x=1745333605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxTL5ahFjodUKC8R5m8kCjr9a/u0Ub/bMVEGvmgGta4=;
        b=bLkebNFCEBSdHfAZg5catT91ideo3J/T8DUG1Ey88z49ZNu+uor8bdYtjZ+7W2oZK3
         BsbFlqT/aYjDaZv7fiGbS0xjJdw3NlVPIiRV/4dwx8c2ySAYnUZfZAaetEWpOMiirv1s
         gT/8pPaNz6FpMjK3XSLzvOz7rE71/JnCQQc6ji7WvFbuHI23dix2ThEd2rCCNq29RVgl
         7kEPRPRkDRjtQqoSx+jMOXNUvC/Wdp4YHKgFdIPQmdP4O/8MwRlNdEgjc38JoTJaaNp1
         s5kWAKzCItcBtaaSWKI5VPA/bLzTANMDPLT9YFBEmsgw359cNUXsj8BNutFwYBeozhFV
         FPRw==
X-Forwarded-Encrypted: i=1; AJvYcCVnm30MPlhxahTY1an0/ABNj/P/MR6rMizat+71Upx1avExSlK1+/Fu5cns79ZSKYHMfOcNk4rsZPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO8WrmtcfzhtBFyZxSNOxVyRtgbEvfXWOV/9tbxZTQtvnkrOcG
	JGAJrcivfGZBB7vepLmBuZHqd5Xg2fbXjRYlBrLh+v1XrERLx+1/9DdA7ggODw==
X-Gm-Gg: ASbGncsP9sndK2s7oaO13kCJnuazYX9SNMwWLyFbsa1MSqBzIvwQYhpt0I9hgFT7CB6
	XvlzzdyO2fq7d5IdQsLZDOR5IlhgxEQWEoN/fxFFdvibiKI1Isoyrb1A/k70o1PaOHduS/m2Jp1
	AQgRnl7XnbyC0zZ+YO7ruNKWZj4x1NyKJAIZvWz4lnhCgq9yRCQdcRHmoiAAkN0YXAJhM7DCXvX
	e98fH7Q7bEOXGtK5Qk/BkSYJCqAkE4J0A6UXCkRihrURn8eCeNf0/sBOEVXX2nj83bC0j0N7vwY
	ylo5f4vFJKKZ9LE4wU/Jtvyl3+/hEL4B9tSccFZ7k6QoSRfem3nkaxv+BVd4r5J6+GqtsVKQoLM
	SNttswvYUism191BG7UULtwIEMQ==
X-Google-Smtp-Source: AGHT+IFVisCDi2qkFyGGskQ89q+mxPF0gMAnirstlzPDS2tZNaBpmHmEVb+bOCW7sL3mTRoHY2scvw==
X-Received: by 2002:a05:600c:6a16:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43f415d29a7mr103087385e9.14.1744728805500;
        Tue, 15 Apr 2025 07:53:25 -0700 (PDT)
Message-ID: <3426df1b-938a-4d20-a533-dd6695473db0@suse.com>
Date: Tue, 15 Apr 2025 16:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -14,12 +14,68 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/macros.h>
> +#include <xen/spinlock.h>
>  #include <xen/xmalloc.h>
>  
>  #include <asm/imsic.h>
>  
>  static struct imsic_config imsic_cfg;
>  
> +#define imsic_csr_set(c, v)     \
> +do {                            \
> +    csr_write(CSR_SISELECT, c); \
> +    csr_set(CSR_SIREG, v);      \
> +} while (0)
> +
> +#define imsic_csr_clear(c, v)   \
> +do {                            \
> +    csr_write(CSR_SISELECT, c); \
> +    csr_clear(CSR_SIREG, v);    \
> +} while (0)

Coming back to these (the later patch adds one more here): How expensive are
these CSR writes? IOW would it perhaps make sense to maintain a local cache
of the last written SISELECT value, to avoid writing the same one again if
the same windowed register needs accessing twice in a row?

Jan

