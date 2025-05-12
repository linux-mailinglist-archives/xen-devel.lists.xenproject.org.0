Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D72AB3A19
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981514.1367909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETqX-0001o9-Os; Mon, 12 May 2025 14:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981514.1367909; Mon, 12 May 2025 14:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETqX-0001lw-MH; Mon, 12 May 2025 14:09:33 +0000
Received: by outflank-mailman (input) for mailman id 981514;
 Mon, 12 May 2025 14:09:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uETqW-0001lq-8P
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:09:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e966dc-2f3a-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:09:30 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad257009e81so159531266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:09:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198505fdsm617151266b.168.2025.05.12.07.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:09:29 -0700 (PDT)
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
X-Inumbo-ID: b8e966dc-2f3a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747058970; x=1747663770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zouBe1hKJ+wNHpNuXJcq0KUvEJkKnc5aDdoaZSgHJ84=;
        b=J/9mwooGrBs0MHoQVCVkhCzN01n6pkA8HbkN9i/vYHWoYI6M5LFfvSAkl7YK7RRKHs
         Xa2Ti3Q6YZv7zusOhgZticacq93dNbhbBflVL6p3WfuzpihRHOvkPeSNrQbq4A+DyacJ
         H2ZmvPswRMp5zAe05IRdvFvWVc/V7mzliat0DMz3jBUbFOO0Zsi9fJ9/rPScGjJAHhtY
         9bwpo5aBjHEQSi4UH5dLodInG2xVW++vmVJ4ysuQL7wXjntdFKi0STowv03hJYb968rw
         03RO1lWYc6cPkbuamesD1ga1Y8xBPGfojfUifK61wynXx3yrHn8YXH4E4B3nvGiN6Kbn
         aebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058970; x=1747663770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zouBe1hKJ+wNHpNuXJcq0KUvEJkKnc5aDdoaZSgHJ84=;
        b=NXcLLq0kgdW7U2qk6upDhzQTKSuIJ9a8W+tWnpKkxqDl0mTEa95SmaAMXvXHpJ2Dxv
         FfeTeOq8DA4NI2ifz2/1NjJNAxPC3ARI65R+xcEOUwAgmlnPoBfp+Bmc6C4RBLv2xx2G
         XMo/BGJd2yXSK0hTepFmEuMYV/M34WbKdI8TKNyp/mAvFgFjQ++3BW84J4cdc44PsGUa
         Wx8mpAG54e0LO71JDQPhUcnjQbNfGXdJXHr0TRrA8Dn6mzBSrwH1GeG2EC/7Rka1mpRM
         hS76JYmnZrw6Mn4SVXw6Hb2sDtPUp9SKnfmv7V2VLd7nNJ0z/Z2RQbegBTz8yZeutrdp
         eywQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa201ZkFpizNweqnLyEdrK6zy76L0TELkgqAeqfJYSYqq81+dHQRh1kb2tvcMem+Q/m+r+ItYiTQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5ayMmPF4lAqX9GpCao4noLcmiMaVz0E+4L+v78xWL4YXSAsHu
	6E7GU7GlHvzfd5CAiZfxCHurHm1mhPuNWMspdiPzdzMB0rVDXH7Xo2AfwrJeMVh2EVIaoz2njhc
	=
X-Gm-Gg: ASbGncs1N4HpB5sZQ+tc9ErBJPo/AsF+CI63zsfdsEb2x2Dl/Qkj+EC5OpN2JoQ+cNM
	gH+JQBBrHQqdj7TO+zfDxxzmAJckq4OSPqjnBcLBQqTVz9Ca0Z11eOU0TF4K0f98HuZfTRPJiFr
	Pc2qm+n2z1uhT9yxuF70ARv9CukdoVCbDW7Eckz05llrRy/gQRnYgX/bV7X5+QuIuFPM2Pcns+s
	z8KKMgUUfdOEvkb6gRPBPKDvSmYYT7OX5du+Si4+82JQS8GV1LutyDFBzMrBa8+y9LidyuCKEfq
	/426ILptIwsBi7paT761GmB9VUpmE3X9wQLUBsp29KGeKyOmiDPWnebB+uEaKYX8zkSoVTZ0eq3
	rAsQYQsMLAdBGqpHhzS3gvTEhSQnBGF9yxEUm
X-Google-Smtp-Source: AGHT+IHadKJX9nJXfl5J887yW6e/hPewvrqQ/Pkd6Wxu+xOWdJbTUengzEU//H43pRYTwWpGseRusg==
X-Received: by 2002:a17:907:7b08:b0:ad2:2ff9:c912 with SMTP id a640c23a62f3a-ad22ff9dfebmr975288066b.17.1747058969947;
        Mon, 12 May 2025 07:09:29 -0700 (PDT)
Message-ID: <81a5182a-19aa-437d-b575-f3d8e45e4ca9@suse.com>
Date: Mon, 12 May 2025 16:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU
 caches
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-2-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> The implementation of MMUEXT_FLUSH_CACHE is bogus, as it doesn't account to
> flush the cache of any previous pCPU where the current vCPU might have run,
> and hence is likely to not work as expected.
> 
> Fix this by resorting to use the same logic as MMUEXT_FLUSH_CACHE_GLOBAL,
> which will be correct in all cases.
> 
> Fixes: 534ffcb416bb ("Fix WBINVD by adding a new hypercall.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Alternatively, the hypercall could be made correct by keeping track of the
> pCPUs the vCPU has run on since the last cache flush.  That's however more
> work.  See later in the series.

Since, as iirc you indicated elsewhere, there's no actual user of this sub-op,
doing as you do here is likely good enough. Just one concern:

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3805,14 +3805,11 @@ long do_mmuext_op(
>              break;
>  
>          case MMUEXT_FLUSH_CACHE:
> -            if ( unlikely(currd != pg_owner) )
> -                rc = -EPERM;
> -            else if ( unlikely(!cache_flush_permitted(currd)) )
> -                rc = -EACCES;

This error code will change to ...

> -            else
> -                wbinvd();
> -            break;
> -
> +            /*
> +             * Dirty pCPU caches where the current vCPU has been scheduled are
> +             * not tracked, and hence we need to resort to a global cache
> +             * flush for correctness.
> +             */
>          case MMUEXT_FLUSH_CACHE_GLOBAL:
>              if ( unlikely(currd != pg_owner) )
>                  rc = -EPERM;

... -EINVAL (sitting out of context). If we accept any error code change here,
I think it wants to be the other way around, as EINVAL isn't quite appropriate
to signal !cache_flush_permitted() to the caller. With that extra adjustment:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

