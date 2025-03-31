Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5BA7625F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932132.1334340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAZO-0004qH-Qm; Mon, 31 Mar 2025 08:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932132.1334340; Mon, 31 Mar 2025 08:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAZO-0004ns-O6; Mon, 31 Mar 2025 08:32:34 +0000
Received: by outflank-mailman (input) for mailman id 932132;
 Mon, 31 Mar 2025 08:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzAZN-0004lf-2K
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:32:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaccd875-0e0a-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:32:22 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3594583f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 01:32:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658b7bsm10498203f8f.20.2025.03.31.01.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 01:32:21 -0700 (PDT)
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
X-Inumbo-ID: aaccd875-0e0a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743409942; x=1744014742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/b/Cs611Mh6/gXDl87oYUcMNL7Lf8HGsE13sxc3pGO0=;
        b=C3LVilVpJ8zb3D/kNTfFSQzEc5zdcdGejT79NLK75F660zgrt3t+jWB/p3vZtBnyCy
         Ua23QjU3FA0AQqedZ/SZFAhtkqVox5ilINYYGAw4y+GC0HgWTp1vmWi/lseyWDp4Y16M
         8jGMhVe3IWuEJRcEWwcmlISY9I4Erc1oDwLjhYowETQ6K5OSkU9VrZG4sfRTm5mgEfCv
         vVm6XwcheuseHIubnKxn9oPnMtLCgsfktT+euQoqyJ/WopE9+QGxRBevlN65bYgA2Xqm
         hDUhK6FvYXkq4bnjCYliX+2XsASYYOUTe3c/4oktOznBD05/grFesGLgrbawmXt/eP4N
         eKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409942; x=1744014742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b/Cs611Mh6/gXDl87oYUcMNL7Lf8HGsE13sxc3pGO0=;
        b=TM7uNFAI06MBpqyRxxqVV9OxerCe8yGVuLk9XUImmREfWgAD/D36JT1dMFmYZsGaK+
         rWS7iqiiY/0++Df5c57ZZi4GRUgk8u09kK5cVdrQDFdl2lzuSJ0YBA8pBw7Dfi4Wosy3
         g5X1+LgdbC8/8/E7JsbEJ0kYuQ644bYdh+jgmk6sVnKi+2BQN4CVf4foWZYFgbaFgSAT
         WkEXRHk3TtMAnNEso1pe47LbX4BVMuNgUjGWJFftkyowpOOYKi71hytDfVF+FJLL3QzP
         JAISODwitmlPF5VF4ly/uhIllNeM1XDs+ZT0NnPcXtc4hFOaoj0XgPMO/C79ZQFfuUnb
         6yag==
X-Forwarded-Encrypted: i=1; AJvYcCXb4+0PQz12LuLL+uzvCjTx3aA/M0pb45T1UQKR/MioQte9aZUSKhHG74s+aaIs+zFhJG01KbXh+p0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHIxa6riL9f3Cmt5m/XZMc8xajxVCf4BSJd9juVuzIgI3FJ30E
	13tf3QUsNudek4ho3NO57atsjZx/WtqlXB75v/GfWisXeXmO54lySXRToR0nGg==
X-Gm-Gg: ASbGncsEO1Xrkx/GLsAoZN5rzzymU7w9mjY4/hjFqngtlXuZIwZlA+w9AyJ9S/2nBjF
	brBchUNY7z90L8fyIMeZpTphAK8TBW0xBu9sigh85NzuvKx2QZrQzje38LRheeBhsBW8axs/VwT
	vk7VhOFEsNjolBrejAwnJjUjRtkHuGKGI0wbdFuJTShywgezUMIPVjgyyaTFbZXet/9slxvwFIH
	7UuzCCKTbodkdYCSkrrdXDOkRXpgrKA6rIDtuhmOpHFamkvQgW7393dldKs8AlDqueAbGDQAvdH
	xizar2Hx/jIM7S5ZHH47I0PkDnz2yEMSEK7V/T4Du0Fnd08JmHDVlTckdlSX8fpjAra4EoINxDL
	RBMtdWXIKajrzIkc62EcDNqZ9kIpJDA==
X-Google-Smtp-Source: AGHT+IHEAG5Lz7hGdnH6CpVBaiFFM+WWs8LDkpKYznIA05U4jqWrGKPcf3vVORlDHdxFbetrhsH2tw==
X-Received: by 2002:a5d:47c3:0:b0:39c:e0e:b191 with SMTP id ffacd0b85a97d-39c120c8e0amr4979564f8f.7.1743409942227;
        Mon, 31 Mar 2025 01:32:22 -0700 (PDT)
Message-ID: <c79d76e2-3e6d-4c2a-a240-ee36daa559e0@suse.com>
Date: Mon, 31 Mar 2025 10:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] xen: Implement common byte{order,swap}.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> From: Lin Liu <lin.liu@citrix.com>
> 
> The current swab??() infrastructure is unecesserily complicated, and can be
> repated entirely with compiler builtins.
> 
> All supported compilers provide __BYTE_ORDER__ and __builtin_bswap??().
> 
> Nothing in Xen cares about the values of __{BIG,LITTLE}_ENDIAN; just that one
> of them is defined.  Therefore, centralise their definitions in xen/config.h

And even if we cared somewhere, __ORDER_{BIG,LITTLE}_ENDIAN__ supply them
just fine.

> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits taken care of:

> --- /dev/null
> +++ b/xen/include/xen/byteorder.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef XEN_BYTEORDER_H
> +#define XEN_BYTEORDER_H
> +
> +#include <xen/byteswap.h>
> +#include <xen/types.h>

It's stdint.h that's needed here, not types.h?

> +#if defined(__LITTLE_ENDIAN)
> +
> +# define cpu_to_le64(x) (uint64_t)(x)
> +# define le64_to_cpu(x) (uint64_t)(x)
> +# define cpu_to_le32(x) (uint32_t)(x)
> +# define le32_to_cpu(x) (uint32_t)(x)
> +# define cpu_to_le16(x) (uint16_t)(x)
> +# define le16_to_cpu(x) (uint16_t)(x)

(Not just) for Misra these all need another pair of parentheses around the
entire expressions.

> +# define cpu_to_be64(x) bswap64(x)
> +# define be64_to_cpu(x) bswap64(x)
> +# define cpu_to_be32(x) bswap32(x)
> +# define be32_to_cpu(x) bswap32(x)
> +# define cpu_to_be16(x) bswap16(x)
> +# define be16_to_cpu(x) bswap16(x)
> +
> +#elif defined(__BIG_ENDIAN)
> +
> +# define cpu_to_le64(x) bswap64(x)
> +# define le64_to_cpu(x) bswap64(x)
> +# define cpu_to_le32(x) bswap32(x)
> +# define le32_to_cpu(x) bswap32(x)
> +# define cpu_to_le16(x) bswap16(x)
> +# define le16_to_cpu(x) bswap16(x)
> +
> +# define cpu_to_be64(x) (uint64_t)(x)
> +# define be64_to_cpu(x) (uint64_t)(x)
> +# define cpu_to_be32(x) (uint32_t)(x)
> +# define be32_to_cpu(x) (uint32_t)(x)
> +# define cpu_to_be16(x) (uint16_t)(x)
> +# define be16_to_cpu(x) (uint16_t)(x)

Same here, even if Eclair likely wouldn't spot this right now.

Jan

