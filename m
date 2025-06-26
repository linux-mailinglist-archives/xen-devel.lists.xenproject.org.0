Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D3AEA1A3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026602.1401775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo4q-0006Aq-3y; Thu, 26 Jun 2025 14:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026602.1401775; Thu, 26 Jun 2025 14:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo4q-00067G-18; Thu, 26 Jun 2025 14:59:48 +0000
Received: by outflank-mailman (input) for mailman id 1026602;
 Thu, 26 Jun 2025 14:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUo4o-000677-NS
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:59:46 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32aa3df8-529e-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:59:45 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1073324f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:59:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8851337sm7129468b3a.126.2025.06.26.07.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:59:44 -0700 (PDT)
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
X-Inumbo-ID: 32aa3df8-529e-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750949985; x=1751554785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NDCHXjNU/JPLNa8tmrdUtGPpjR/p3lLSltJO3ThCpsg=;
        b=V0C8WdMwWtxVcw0rfJoA7k+WMHZI8SJ785gTb2r8u2y8Cx4Dzc8RuPyqeGq0XNOylP
         YPuGm7JSTYpAReiQWrhjxzafFGd8GDpNsRifc+/6psTz9BZD5+yLvS+kWwgda3csoK3s
         eUVsyy91RV5wAzlplK0b3AN5IDhMtSUZGebVcAVEVbf4dzDvRxLdLoM9A0XvnONAS+iM
         pj66O/j2MQqSnZe2Hog+TkptbQnkkT/U2x3ykUmy7rNq2bhh9gPfrLYu5+KS6l0ncpxs
         /dSvfhwI5rpIzQdC61E2D+b8vnJRGgRwvM7LAcNjeUS1Bre1AaAI5XDgm22MKH4Udvnk
         yt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949985; x=1751554785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDCHXjNU/JPLNa8tmrdUtGPpjR/p3lLSltJO3ThCpsg=;
        b=WeJ/UYnA+ukxSxTXg/UCgUbOO6vQyOB7mtKZtHitB/rNUPjTFbZfCsIF8Q4iA7sbMS
         EIkKWnknSS9D+74X+0KEVcBymPvnMQk+yZHknVqUuPeYVanMd1kevN1pY0GLq864uTst
         h6+Vp8lqyzXbjf1sdAeX7ikG+8xk3pAft4IbTE3Z2LZKKQRr35KesyRcp3JD3aRuBqMy
         DodagM0A0topPe2lsCoCbTUVFWaVXYf7FCosmzl/tR4KF4gfp2/31thjSuM99PHKC5rY
         HQd62ZbGmkpdaRgJHQnY+ZZwRtfA3i7SvkIOYMslSHNZHBRepAAs1HONuvnVnZoHff5l
         Y35g==
X-Forwarded-Encrypted: i=1; AJvYcCUmf16x5PcyXXCQVVpWjIG/STLKI8fV6nycSsRfIH9o+mtxklmSLmKlONVErI2PzLXuz7zNjfGRFag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHmNEA3d5++0qfW8nuhjEH64IK8U9atV5qpiziky1mG+PtWJGr
	HFM86NaCeHDHG/QnUKg51kK9Z2T5QR6pWMdHlT59BmmMKTvtFWt/HSYr3F+6TiYiJQ==
X-Gm-Gg: ASbGnctfxNuozQPc/566SSEbWAmPeiHARAinojmnN8gbFa3yq5POoEXVcIg0Q9w9Q0o
	lpZca0ZeQ2zQ0K585EhKZMmcx6VS0Wqp2EKwN7HloroW41GFGUdIa2XA0shhn6SYf2YpjMzFNtQ
	Vxw/tlr1OnF7sv5AVl9mOiKFG8lc7qMvnPpnz52PU+7YEG79X3pKXwwM/fXf5WSEjYRw5Eryzqd
	65iNeG55OXj0t9wdNoawfTuShr/qsjqN/duyNFhjwYPVZNe2mWls0vMkjh9J+hff0MuO9Xv47+W
	xvv7ZqbJvRNHonfrsYoH9gRdY4tCa+nDQPz5dQP4lZTOnFI7h4LeaFFBfZmQXaR6Aja3R+wq5G3
	9Eou+ghBELsruCQRU5bTCDAyawUrXx0PSjW+dMw8kEW+S7qE=
X-Google-Smtp-Source: AGHT+IFd4XfXXZOF6D9gtbQvB9AsQbqD8qUAugkWk0UKLfW8JiZSsFftN3hkt2VZ+mhySFymXqcLdw==
X-Received: by 2002:a5d:64e1:0:b0:3a5:8e0e:108b with SMTP id ffacd0b85a97d-3a6ed5dbf79mr7250087f8f.21.1750949985123;
        Thu, 26 Jun 2025 07:59:45 -0700 (PDT)
Message-ID: <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
Date: Thu, 26 Jun 2025 16:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -61,8 +61,28 @@ struct p2m_domain {
>  typedef enum {
>      p2m_invalid = 0,    /* Nothing mapped here */
>      p2m_ram_rw,         /* Normal read/write domain RAM */
> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */

As indicated before - this type should be added when the special handling that
it requires is also introduced.

> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */

What's the _dev suffix indicating here?

Jan

