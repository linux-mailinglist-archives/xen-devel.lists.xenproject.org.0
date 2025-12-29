Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D3CE63C7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 09:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193920.1512418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8Vq-0004DI-6p; Mon, 29 Dec 2025 08:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193920.1512418; Mon, 29 Dec 2025 08:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8Vq-0004AX-48; Mon, 29 Dec 2025 08:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1193920;
 Mon, 29 Dec 2025 08:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1va8Vo-0004AR-PO
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 08:21:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed1c76a-e48f-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 09:21:54 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47755de027eso52216995e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 00:21:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm60601733f8f.5.2025.12.29.00.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 00:21:53 -0800 (PST)
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
X-Inumbo-ID: 6ed1c76a-e48f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766996513; x=1767601313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hytBz7VzpljCGb3OHq8gb/mWkNkwb/OUDvrC1jucXss=;
        b=Z3J+eqihll1HVpv7CDN7B0MMzo06F1uapADpLNo2nBHT7+HCPjVNtOtVLWuMThIhbr
         TQ+5/1GGuX641synQMDUYZZ7lS6H905deAuZ5lKch6V/WjNJUW7lvQCp4oKi7tRULjR9
         OA+r5YuNct+M1R+KkS7lL5ek1pMjBWSK66zvK1P5AXpq/JlRfyPbuUBpJLXmBqpSWGOn
         M7ZLCFDHa3Md/vjq9nKX8t/eKRSbN6msoVkDpk4L6k7G34/YMN89I7U8Z5LP5yz4rmnj
         dvsivrDBqcC2OdbbTwMpS2CIH2V+KZvLSd3CCJbUKUcgIwml539DtVOdnowxa4x7u/tu
         HT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766996513; x=1767601313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hytBz7VzpljCGb3OHq8gb/mWkNkwb/OUDvrC1jucXss=;
        b=wTtCV8OCeqW/gIwB2lf9uMCyYMG7BLLYEiO4vBb02TtC4hqyhqfTbQS4T6nV3NcWyy
         x8E04xwjqvq73upmsUFawL5hRB+WgjD9odmwd2S2htTEWv6VZTMHllFw3Vz0PRcjgPya
         tE3agjZedp5oSBpT+7XvlD5qLsQdMP5YqCqboqVfu4SWU/SXgrWoVHPynVXEPOBdnuzu
         vxSFFr2+5q+iIJUby68Kp5lHbLYr9vB5QCiK8SVmUH4PmVohm2wW2x5iJlLEVGihrip8
         JoKMm3lLoGC3o+MvDDrmVNgcgKqMnq7xwFM+cLV9x4QprcoKmw2XsHccQdnvV5wIZf74
         5adA==
X-Forwarded-Encrypted: i=1; AJvYcCW0xOPA8kSwFQf2hmzsImtnlgPgoSa6X+xmUlTnC7BFxM46GVhW/Ca/raiScFjjoFOGxr190/yS/+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaZEYQQnZtdk1FTizNDBRrRVvcESz6P40QBixzEwt6yf/yTZT1
	ZuRdj7zFnHBrWZgbxoPf9ngtNjmFEOqyyxfCME9V+P95zZW595zCo7pJXNFtdKUgTg==
X-Gm-Gg: AY/fxX5ov9jsz1EbPurwECfGCxeVIrNyVW3WSycrfh0fmJIB4ir0ZbGI1aQRiKL2mPA
	zSPPN4k7knKO/AsA5rJWLCCOXHWpXG04Zo8lvbI/Cy4knE/Uij2mAPqiPy3Ss2BndZOEL9E0RmE
	qV/qHqrQcBnjTrhsZcmZcH8/nbq+M1mSEG3+eDHSDc404fjD+e5LxDAHK3zq36SKF7LgmLSx/89
	ydrRDxfE8+Odl/bB9UgT0pSioEDs+e33ZFxzbQi82I5kVwj0mXa56ujvCPksqabyU+L5cUtScqH
	ecDAkY0zah4uFj99YiPh27UkXur26UAy+f5Y2aLo5oqwUcDdyS92nFYLqXFnT6YxetVJaCYNo3N
	ErOubc4pvmf/yBbyruuV1/9fdEqCJ0n07Zgno+MNpvxkBXU2M2g0Q5rRc7J2yN0LnCv6KgqdaCt
	+abOw0VW8HYfeq5gQ7lmrXXyc9JGqgGubvlnKt6HxA08Kd1O5YlRcDZNG6Qr99k42kjoLYJRIvr
	AM=
X-Google-Smtp-Source: AGHT+IHIM0An+Rx3y22ipPqUB0hQNSemKQ8/qOroB2rLHU3HB0Ev9wNCNLiFCKQywRk2xWhNOCsgAw==
X-Received: by 2002:a05:600c:828c:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47d19598e86mr264051965e9.36.1766996513465;
        Mon, 29 Dec 2025 00:21:53 -0800 (PST)
Message-ID: <7d439b75-801b-406d-98e0-29c207e1c1ba@suse.com>
Date: Mon, 29 Dec 2025 09:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
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
In-Reply-To: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.12.2025 13:49, Teddy Astie wrote:
> Under SEV, the pagetables needs to be post-processed to add the C-bit
> (to make the mapping encrypted). The guest is expected to query the C-bit
> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
> now triggers #VC instead. The guest would need to setup a IDT very early
> and instead use the early-GHCB protocol to emulate CPUID, which is
> complicated.

But isn't this going to be needed for plain HVM anyway?

> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>  #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>  #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
>                                     /* P->M making the 3 level tree obsolete? */
> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that requires */
> +                                   /* use of GHCB. */

Naming-wise, do we really want to tie this to AMD (and hence exclude other
vendors, or require yet another bit to be allocated later)?

Jan

