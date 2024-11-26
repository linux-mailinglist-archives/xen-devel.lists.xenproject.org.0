Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AC29D95D5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843559.1259187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtAG-00063V-O9; Tue, 26 Nov 2024 10:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843559.1259187; Tue, 26 Nov 2024 10:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtAG-00061A-LO; Tue, 26 Nov 2024 10:51:28 +0000
Received: by outflank-mailman (input) for mailman id 843559;
 Tue, 26 Nov 2024 10:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFtAF-00060y-Hl
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:51:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff1efc5-abe4-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 11:51:22 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so6492936a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 02:51:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b5b764asm579331466b.175.2024.11.26.02.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 02:51:21 -0800 (PST)
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
X-Inumbo-ID: 5ff1efc5-abe4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmZjFlZmM1LWFiZTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE4MjgyLjQyNDgyMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732618282; x=1733223082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bI7FLaEX5KDcnaIiBRihvj3CEO0x6mpnyDfr7/6Z4S4=;
        b=OqYoNsc2XdMV+rl3psLLZWQBXVGUK0cnrIVsRvKzv86wrpIsKakgxb6bU/dKZGzBqj
         o+jsfNZ5hSnNpy/zi0UDm+CsmkSyLOIBuAWIqzFxPPc6UJzwgkcm6+sgBWvq0alPK0xk
         HxrvyQ2sz3rH6Zm/K4icnXloynW1w3viZxYC7DXlAKJzW0yYJN0xOlZTwGXCxp0qyWAR
         hVi+KG4MwURZzr6LO3IN1W+TsHhDFYDxwWm89l26Qfxn2Suqfo5V6RxmdA4ZXUzmf2/4
         382A1tKYlhs+jcXx0yehH7EQapy0vK2ujwuNDMEHd+/uwYV1jyAq2/UKMg3rHO4n5B+9
         Zmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732618282; x=1733223082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bI7FLaEX5KDcnaIiBRihvj3CEO0x6mpnyDfr7/6Z4S4=;
        b=xNNoj3xF9YwVcVGRmEYbROVvTyJQ79PY8fnlJ+s13vgOWMUhgoJET73E00Ak6gt2un
         33efxBDiaSr1DQoLzIZfMFpNvivPXhXua2bBNiG5yjLijmzKAwXG9GIOE2omSmGtpAb4
         hPJ22bcpPqoZN4L+IvqGWmSpFR4lVo4/3PNGpIJMA0Q4edpWSspPivyan9JslVj165bs
         zI8FHG5MPwBvu5WtimZbz3PIlnSjV/w25sJkk4fROhX6hoIZQ2Iihltedj6kNyahjsqo
         v8J5Mp3Jzfl++FG6mOMFgcv/m9R6oIoYjbMQofUwjlyw6mz7fhO9IPuuqTCGnVAwHYnv
         bMUg==
X-Gm-Message-State: AOJu0YyieW4VsfOrgR7ox1fHAOyCJjHlWlmHCZ8rH4SK9AQUIywp8/uH
	qBKmBmJVIXzGh6u9hEg6qhIi8egDbto0PxmQNSK81rDO+oH3G7RhS8CyqGWfWA==
X-Gm-Gg: ASbGnctVX/EB+sasZOAa4c4bivO3XWKQO2c3C0AG3rDIqLfHsy9bFRGjw6h7M90Ts71
	pB6sDVrKMZgPzjKmFUz77M6AnmWB+M7Z80XE35AEHg8E2sz9JQuSjfoTstyArmt5UJFCCHU+NvV
	SATeix2sj2ehAYW1+PyT+Wsea8+bL1sNtLAtr0rt+iTgN+Ntalz0yOpOBDrnDYOH5EE5SNYqB5n
	62dpGXDn6+f9PPBZtce3iqugvKQX6fUBF/41bd2w8FuBZ+30Fcm4P3kx08Rta/BWPHDJJmoXc1O
	Gajx7l6YinAZKFqIFV8Y+e/mNyFKe0fZbtc=
X-Google-Smtp-Source: AGHT+IHi8MIGSVzEQSUxROtObNOlximwFyj4XmMqi1jodq9D9t4SpVzvYaqKJwMTiR9ecHAnR7WNpg==
X-Received: by 2002:a17:907:1b27:b0:a9e:c267:78c5 with SMTP id a640c23a62f3a-aa509c00bc8mr1724534266b.55.1732618281887;
        Tue, 26 Nov 2024 02:51:21 -0800 (PST)
Message-ID: <4ba83d42-4f92-4488-bead-04c65eb94408@suse.com>
Date: Tue, 26 Nov 2024 11:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86: Add architectural LBR declarations
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -304,6 +304,17 @@

Please note this comment around line 250:

/*
 * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
 */

You want to ...

>  #define MSR_IA32_LASTINTFROMIP		0x000001dd
>  #define MSR_IA32_LASTINTTOIP		0x000001de
>  
> +/* Architectural LBR state MSRs */
> +#define MSR_IA32_LASTBRANCH_CTL		0x000014ce
> +#define  LASTBRANCH_CTL_LBREN		(1<<0) /* Enable LBR recording */
> +#define  LASTBRANCH_CTL_VALID		_AC(0x7f000f, ULL)
> +#define MSR_IA32_LASTBRANCH_DEPTH	0x000014cf
> +#define MSR_IA32_LER_INFO		0x000001e0
> +#define MSR_IA32_LASTBRANCH_0_INFO	0x00001200
> +#define MSR_IA32_LASTBRANCH_0_FROM_IP	0x00001500
> +#define MSR_IA32_LASTBRANCH_0_TO_IP	0x00001600
> +#define MAX_MSR_ARCH_LASTBRANCH_FROM_TO	64

... move your addition up, omit the IA32 infixes, format according to how
other entries there are formatted, and sort numerically (implying these
can't all stay together).

Jan


