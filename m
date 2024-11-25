Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0C9D8A2E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842931.1258597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbqL-0002Qb-2N; Mon, 25 Nov 2024 16:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842931.1258597; Mon, 25 Nov 2024 16:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbqK-0002PB-VV; Mon, 25 Nov 2024 16:21:44 +0000
Received: by outflank-mailman (input) for mailman id 842931;
 Mon, 25 Nov 2024 16:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFbqJ-0002P3-GA
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:21:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a46e467-ab49-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:21:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a1833367so4654815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 08:21:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349b70aa23sm74285045e9.14.2024.11.25.08.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:21:40 -0800 (PST)
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
X-Inumbo-ID: 5a46e467-ab49-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVhNDZlNDY3LWFiNDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUxNzAwLjkyODgxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732551700; x=1733156500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jKoh8DZ5i15BHU7/k/txJ5V1zxpriWLfDBvd90F2WOU=;
        b=Mc+fWzJPdjtZBWgi/ne54xrDNUvp3zBhEDnGQqa3ONnB3z3Ln/XWeBQOJw3bz1ALR/
         WWecCW5VNzDFTKnHA3EUy16jL81S0/+z49rDVXtLLnW/VL/pL6mOywmglVLuYwJYMzU+
         4DW5Q0++xAiFoaX7UAitmPC/mGFSSnLZxsuaIfxrnMO2HtMHSzHHhbO3mJ/+zwpGUQDv
         XfQpVPwdWag3JnX/a6e3JjgvtlThaBssAIYt3klnhRTl6hGNqA3uthie7zRC6glmYBAQ
         sVSiogOUY0+lZFfPGxNd12N/AGBj0jnqAGfy2KHrd+Ahzy9/cI/Qw3USG21L9h4A7K4/
         V6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551700; x=1733156500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKoh8DZ5i15BHU7/k/txJ5V1zxpriWLfDBvd90F2WOU=;
        b=opoB0B39JOBlLxT6HE6DuA7QuebPfWtTfJLTVlIjW1SLF8IfWbrmUcjo3byIykw0/4
         x1a/fHJOxroFsOU2ptQAttJA8yUnaIZK84RqItMu+SZFgmZM9gTat6zxB0jjxpzJxDGn
         sn0xa4fapejEeRrltTgjwJwle3y2z6NMpPdLqidSGmCDmEgS6i2OsN1+/8NA2PiTBUTe
         tRfr03qEGDXTd3x5clhE39gijIfhTNQtw2evOF2Nmtf9E/5jQa6hSn21Ee2l50Hw6kwt
         Hb54DkgNjKibjPCviEv5ZyCtU+owZ8nbQdFTsxUIts1vzooMfitFb/Rmvm6Iq48A0gWa
         HJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9sSlbbuP57BTUDuk2IK8ahsH42NmN2V/O0wKhVBf6NcL3SDop83loKczcDwx4kiZav44bPfkrGT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxolJHxrBdKlqKwbuoE4u9Tfae+FPdHw4O8EMTY7em4YLo/6W/L
	cRH995yDXiw+QhxcwtwmOXk1L6MAjgKl55nHtjGVkj397BPKuIzRnZ87xrBHmA==
X-Gm-Gg: ASbGncuvWRHe43SKBrhT7iWYIadIztvXqSGiSOo7pbVktWDHpcXO+dziWnq3+OUloX/
	U6A163om/aXzEqNMQJos0dtKx1V2pEJo9jrbD5jFOC8ZaPLQ0JiU16xRszUIXxi0ws9dLPIwE6U
	jMfOuz8/BxS052CW1FnoLNalpJDYhZ2n3HtV6INblQLY0z+0HFkNcuujzpAXmW2byj+sljw8qQT
	1va96cICRHzinGsJI61f0vxCiitAR1Igi2bskB+H31pBPrZeF01oJ4ae7cDHzgslEnatxVVSy9R
	VP0jz93WR9+kW60GKvkk4vxDQfZeeec55bQ=
X-Google-Smtp-Source: AGHT+IF8hT2oKN3QS+7m/RM8wXkyyesduYrfzUrCrctwmC1xpbZ0qWXqo4pCu+3Uh162MTKvxoPjCg==
X-Received: by 2002:a7b:cc9a:0:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434a33dbae2mr11145595e9.15.1732551700375;
        Mon, 25 Nov 2024 08:21:40 -0800 (PST)
Message-ID: <d2243aaf-d2f7-4975-a6e5-1db81414a509@suse.com>
Date: Mon, 25 Nov 2024 17:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-2-luca.fancellu@arm.com>
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
In-Reply-To: <20241119085806.805142-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 09:58, Luca Fancellu wrote:
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -5,12 +5,19 @@
>   * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
>   * latter is used when loading livepatches and the former for everything else.
>   */
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> +#ifndef __XEN_VMAP_H__
>  #define __XEN_VMAP_H__
>  
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * MPU systems won't have HAS_VMAP enabled, but will provide implementation
> + * only for some of the functions of this module. So hide the definition for
> + * some of these function to systems where !HAS_VMAP
> + */
> +#ifdef CONFIG_HAS_VMAP

What you're hiding are declarations, not definitions. While this may feel like
splitting hair, the question really is: Do the declarations actually need
hiding? IOW won't it suffice to have the definitions unavailable? While this
would mean that wrong uses are flagged only when linking, we do such all the
time when we expect e.g. DCE to remove actual uses of respective identifiers.

Jan

