Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544B6B1B5FC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070503.1434113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIOA-0005O0-CO; Tue, 05 Aug 2025 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070503.1434113; Tue, 05 Aug 2025 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIOA-0005LH-9f; Tue, 05 Aug 2025 14:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1070503;
 Tue, 05 Aug 2025 14:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujIO9-0005LB-Jk
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:11:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17c0e2b6-7206-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 16:11:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af90fd52147so826662466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af938aa8275sm681260066b.57.2025.08.05.07.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:11:33 -0700 (PDT)
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
X-Inumbo-ID: 17c0e2b6-7206-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754403094; x=1755007894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=308JmNKh9I95opCsIuS+/LFa6fh+/A/hosRgyyYhwQY=;
        b=fkBHKfS/7w+Zkgp28AHFLYi2OOI3bHvoKOh+8HYFaUX7xnfwc2k1pI8WX0B3rjYTxn
         sefYgCvxNkc6IHZXWOF4P3cv0Io+YHhyxlDLi7HQGELfoS4+LfchpQmr3uzO4VR//lgl
         V1Y0IICbcvFznEFl3h1fSDlJiY6kr+ZVlxtHaJb4pmMxpt0vgmRiyRtZifNniDzcZGTZ
         5GNXahU+k439gWcIqWnNtu2s85lGw+XAJFRgvr3H8pHKJfMDXJ2DZWMdyO8xhvMOedw8
         m47IKtmkscE6HV6wiPqvCTFxkqRziDI8HF7LOVVacopIWmNbbPTn07/w2S+OPlzEI8bT
         rCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403094; x=1755007894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=308JmNKh9I95opCsIuS+/LFa6fh+/A/hosRgyyYhwQY=;
        b=KcmE2J+SyC4DspUU61kLsrjj9xCtt3UACRT6HQLUl7JzPVQ6gQvl0Zr3c/GUXN7nxo
         /HTSYOFWFV1fkU0cCCnBzk1eFQ2a3CraHtQotLxgMD3cYXPT0eQ/UorKGbE0t/onPggJ
         UrxQKCSSKO0Vlmja9Sm6auQBdwBYajocAbOZRFqzJUzvRHBAbRGLjd+SEtWyxZr2NwdR
         AR/rCyKbIbaUKkROBlgrwAr/LuRhFd56KMr8A9hjqMBomd7h2bZradjhOsCjEe+gHUYb
         bZkrXPDcIf7Mdr7g51Uyk6Troh5tWZu1NNMtprZA2Ex4h/B9rzRuxRX7mo2OCIs5W2Gw
         CyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3WHY1F7Hfmd6EkaFdkPsP/yFPzP6Slk+QamO9iF2vao8dlajz6ngZPr5PEkLiV+aeXkCfgNVTzHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAv6/9YnBvcJhUedcUKMdvJJjBiFyPb7GL4cRigMJukEX/AEwp
	GTsTQdgdHqkjJ96xNtM4ewsJuBw7hfMlda1Cxhg7z0CNiboRcTNAEAINQUH6n3tWYg==
X-Gm-Gg: ASbGncsoVU2+2qSVyg7QRkuXLTUKMfDYbUM0lrqcRsfK0EitU9yWRC+oogZIJZRkyGg
	O4idJuYmJXcNa2b0XBKwpMFUusSoAwBo+l0PfZwpJJlH+kb6l1V/+WTll0JgpY6aUeETRdN8uRT
	mk6LdR5lJeKsu4lYDLYlxZkDACYsDVVu5AdzoKozDmzX7jGc0J1mO8QKJedBFwqJ/su6feSfN02
	gNszT8DgAwboRGcwnMM9vsrw+8lw3nCQ5UxSfg9mT2Q7kVU4mr1BxDEurPE5SrhscYmh4UGfmsg
	0IsomxQ2fCjGCqpkdkeFJJo482KDA7hcF7qBuligi3U6dNj7kkftiPgXS7CoEoiS2vlgOCdchnq
	wMMcwMZjJACPMiAHaDx/QKcty8xaIIyH1dFsCe5ZTxACfCJoBrCtY+3mprmEmspFQq/GPEt3B1q
	ZuXVzbY1Y=
X-Google-Smtp-Source: AGHT+IFwmw2aFrY33IWenT8bQb6R641n1RMI3z98zQmrwS8Ym1kTVHA10sZ8OAJK9cdT5w9iDfXs/w==
X-Received: by 2002:a17:907:3d05:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-af940181f8amr1325941866b.37.1754403093642;
        Tue, 05 Aug 2025 07:11:33 -0700 (PDT)
Message-ID: <eb865048-ec3a-479e-a552-b19fc57b6786@suse.com>
Date: Tue, 5 Aug 2025 16:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] xen/riscv: introduce
 page_{get,set}_xenheap_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <5aa3beb7fc0b7fc7f4d6d07ae25f37d44fc38858.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5aa3beb7fc0b7fc7f4d6d07ae25f37d44fc38858.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -12,6 +12,7 @@
>  #include <xen/sections.h>
>  #include <xen/types.h>
>  
> +#include <asm/cmpxchg.h>
>  #include <asm/page.h>
>  #include <asm/page-bits.h>
>  
> @@ -247,9 +248,17 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>  #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>  
> -/* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> -#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
> + /* 9-bit count of uses of this frame as its current type. */

Nit: Stray blank at start of line.

> +#define PGT_count_mask    PG_mask(0x3FF, 10)

A 9-bit count corresponds to a mask of 0x1ff, doesn't it? With 0x3ff the count
can spill over the type.

Jan

