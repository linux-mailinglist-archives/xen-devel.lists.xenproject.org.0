Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F5AE3765
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022106.1397824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbxR-0006wh-CM; Mon, 23 Jun 2025 07:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022106.1397824; Mon, 23 Jun 2025 07:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbxR-0006uE-94; Mon, 23 Jun 2025 07:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1022106;
 Mon, 23 Jun 2025 07:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbxP-0006u8-Vg
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:51:11 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4274aa4-5006-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 09:51:10 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so2294023f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:51:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f12427b7sm6135694a12.40.2025.06.23.00.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:51:09 -0700 (PDT)
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
X-Inumbo-ID: d4274aa4-5006-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750665070; x=1751269870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZHgxBpXcEMvVWNTABkZuLYDSb3cu+uGVt7hzEMxwUs=;
        b=Vll0KrIKknplmvDCY7Fn2FVV1cYMdOkDZJxy2vySHgrCc5DUDy550GOe1p0aN3quYr
         rnYeXISy6TE6kb+7xTGVQi2aR/GEMKQ25g4NJemfwnHecjq/Im/1HtMrN8hMjw4t0ajc
         16avx5SVGNiOaWrTEO+jAdfcNgkd8OVbomcoemaIjn7Ntvhlc2iwEeRCAI4osd9sUE6g
         gzSq0YQ+ZB1ZtcQVw4D2K10FFwZjBxPuIgQwhEFeVmUycaIauKVzj8qUcoqp+X66vc23
         0Sr6iJehUSkBCOmY8VhhdtAvoOAAxmknk/oDDtGciMrLoT+CEmVKsp3Y/wnHuMHPFZyP
         L4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665070; x=1751269870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZHgxBpXcEMvVWNTABkZuLYDSb3cu+uGVt7hzEMxwUs=;
        b=Blet5nmCdDjDHztt4PnGuucZvyD8KUCac5mk0FqEAr9xVbm6Mt2zgCXqtHCM+ULzzO
         1J/hHJFmnJ0/59dJkoay0U5RQ3PSVa+9afDyhheUBUjS/BNgTwGsd7wSBr5eNws3YmjZ
         /ZwatkruEcNc//kFEYvbeT0FGc3M/g8a72m8oVWsDD/s38gRJB5s7M0Z9+Eb5eyez4u2
         T/zOHDl19pS3OEQGBcws+yP/z7gPIWhbE2Yro9/jy3skjs1HK+akzr+UXX0v3m0a9Pqt
         Kgnaa/S18bL3zItjFY8+4Aw8aGNyh2guCGjCx7sGDR+H9yl0VIt0aQEig2g6AewO9XZN
         F1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUXQFt8lE6YGxCGnSJ9UvlMY8DosIe36zZ5qvSmK2q8ng884j+yiI3NMKNSQlt4gJkxQLCBY+9h2/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXTN+UnYFQYxF/JvKTADaVa8KbNZs0oWB/5x+1nUGWD8/j2G+o
	eNIT++CYjhYvee5yHxjC4SQmUqJGL7n93yB2z1IiXiI6renOA+c6UWYVKTckrjFrrw==
X-Gm-Gg: ASbGncvaMMNmS9YB7RkpqLWYAopp3NMRhu57lDCX9MeoAA2kLPXsy93fpuLsN7f1wpa
	/ccDd/81rm3cq9AByTc/BwMlcfQ2Hg7EdYH2TboHAUzimWmUTS1zECpwcJt8Pnyk9L2K0EKUGEX
	0/0u1RPstOqTR8CXKlBOrTGeZDf9QiuePlRI1gG6nsp8kWwv0u0wayxwP3WLWWOepPxvhgbi1Gs
	QSwSAHS2s4ZwDg1Vo3HcQ5CjTvdjvcoUuaDgHBa1XR3ITNsW7juDZrQzjEG2//elL+UcbzcYLej
	+7LN2cgBF6qesS3oO9CUgw2UL0Ho9CnLl5iAyd14tcJGazf1Lyf1m7FsznlLiuD5l5UtSxTBAf5
	ZS89Jtdu7BNdtWj2t0umjj1pnXFEpq8kl7TDPHAWKjHtJsnk=
X-Google-Smtp-Source: AGHT+IGUoTC5etA49PQl/efxrUmJsHjWn6kFCyERT1AKGQldkEL3aQH+SSXWKrQ02NvuEjwijtc+7w==
X-Received: by 2002:a05:6000:387:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6d12d90cbmr10202286f8f.28.1750665070285;
        Mon, 23 Jun 2025 00:51:10 -0700 (PDT)
Message-ID: <45b33975-be79-40eb-a860-ca3eb71443b0@suse.com>
Date: Mon, 23 Jun 2025 09:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: fix header guard generation for asm-generic
 headers
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2025 11:58, Nicola Vetrini wrote:
> Dashes were wrongly not translated into underscores, thus generating
> an unexpected guard identifier.
> 
> Fixes: ee79f378311b ("xen: add header guards to generated asm generic headers")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/scripts/Makefile.asm-generic | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
> index b0828018080d..f6850758c54b 100644
> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  quiet_cmd_wrap = WRAP    $@
>        cmd_wrap = \
>  	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
> -	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \

Aiui the other argument also needs to change, to '___'. While some tr implementations
may cope, the spec is quite clear:

"When the -d option is not specified:

    Each input character found in the array specified by string1 shall be replaced by the character in the same relative position in the array specified by string2. When the array specified by string2 is shorter that the one specified by string1, the results are unspecified."

Easy enough to adjust while committing, I suppose.

Jan

