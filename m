Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CA818D7F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 18:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657063.1025720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdZ6-0002U2-QD; Tue, 19 Dec 2023 17:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657063.1025720; Tue, 19 Dec 2023 17:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdZ6-0002NJ-Mv; Tue, 19 Dec 2023 17:07:32 +0000
Received: by outflank-mailman (input) for mailman id 657063;
 Tue, 19 Dec 2023 17:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFdZ5-0002Kn-1K
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 17:07:31 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a9c9b1-9e91-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 18:07:30 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3367632ce7bso472143f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 09:07:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g16-20020adfa490000000b00336781b4915sm156557wrb.43.2023.12.19.09.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 09:07:29 -0800 (PST)
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
X-Inumbo-ID: 17a9c9b1-9e91-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703005649; x=1703610449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxS7tCfJ+1Cxjb1/uT78QsL4rUltdTWWWPBpZVxHDTY=;
        b=J+MQ7zAabT3Bn4n+E6nWsvBpNikzjiZIwmMRZFhtI+3SVi4jDKLg3ky8i9QSVdmhJl
         5EbRGNhWxeyHGyTrHM78wKb0Z7VMCEGWtgw1a0mbkhcOd82zX/vhc3XR63bEZ5n0V56U
         FPE/G4oQZLXZXRDb4ZuEdBR78lBh8fKFihu0cHLVK3IKHxapsQQW6ybDyvbtOPClebEj
         YaahU2sQRGw5SOiu4gx9dnjGdKvkx8ErVxrapzp1aMKcWP28sorG8SFjsHBIV3WQYB0e
         TwA/q5s4pXrFQZKML2hYn7p696DQtp8FjGF0myA9oyGnMNWBnKjp4nzpPFbWVsQgHsOj
         ujmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005649; x=1703610449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxS7tCfJ+1Cxjb1/uT78QsL4rUltdTWWWPBpZVxHDTY=;
        b=UPtjL+j1w86lgzccYInOFF4HcmcTq5ZEMCsgUm6a4puWvG8SXQwIh329e7Cu31rSqJ
         NyYJqKnrJ11d8SnFI68rIOjIDZQocWL6X+h9EqweU1tTSP+SFqwxJxnkxYMafEnKBwyp
         CDo7UKBoowZ0A283huNsRarKphkLSqkdaWRZ+cEfHrHy2b2yO9DZf8l/QPiw9xJSLlIL
         8iQrV2fJU1SHsWuGiggmaivbweG96RgzuvTV5T/gWf7Qa0U3Tt/AIBTVgEE0Y58M58gb
         F48ccGEFe+UmRwoWSdSHrYFQDxQVV6xr8Oje42V+BR4h9mV51UzW/9R4NJ31n11yaB9t
         0jHA==
X-Gm-Message-State: AOJu0Yw+53Pg9bpo2car5tVlRJ3Df9586sqpp8vIk1g8SJcuKJnY+DXy
	lNsVYjjzKTSdbkP+wAGKvKcGrMKnl8KUDye+ayvZ
X-Google-Smtp-Source: AGHT+IHVOX+tq25z6o8s8eKkRi2A9qI/FKJBd+hqG/0LfdLkCA9/VPjYq/YGlI6bFpertfI+mLsvcA==
X-Received: by 2002:adf:ec8a:0:b0:336:62f7:2304 with SMTP id z10-20020adfec8a000000b0033662f72304mr3280641wrn.49.1703005649604;
        Tue, 19 Dec 2023 09:07:29 -0800 (PST)
Message-ID: <5c43ff2a-567d-4aad-8406-99adaf07332d@suse.com>
Date: Tue, 19 Dec 2023 18:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/asm-generic: Introduce generic static-shmem.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <ea548f9c6cefff54dadf83446d4f5c721281f247.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <ea548f9c6cefff54dadf83446d4f5c721281f247.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:43, Shawn Anastasio wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/static-shmem.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +
> +#ifndef __ASM_GENERIC_STATIC_SHMEM_H__
> +#define __ASM_GENERIC_STATIC_SHMEM_H__
> +
> +static inline int process_shm_node(const void *fdt, int node,
> +                                   uint32_t address_cells, uint32_t size_cells)
> +{
> +    return -EINVAL;
> +}

This talking of fdt and cells doesn't look very generic to me, I'm
afraid. Plus if such a header was introduced, I'd kind of expect it
to also be used by Arm's !CONFIG_STATIC_SHM section - no need to
duplicate anything.

Jan


