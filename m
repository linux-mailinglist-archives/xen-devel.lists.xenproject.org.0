Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B38CF48C0
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 16:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195538.1513469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmyo-0000cb-Uo; Mon, 05 Jan 2026 15:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195538.1513469; Mon, 05 Jan 2026 15:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmyo-0000b6-Ry; Mon, 05 Jan 2026 15:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1195538;
 Mon, 05 Jan 2026 15:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcmyo-0000b0-6Q
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 15:58:50 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd0c708-ea4f-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 16:58:48 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so4619f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 07:58:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca56a16sm203047f8f.30.2026.01.05.07.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:58:47 -0800 (PST)
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
X-Inumbo-ID: 6bd0c708-ea4f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767628727; x=1768233527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJeUUtyiAVCWOJ2rKsQ6Joxu1RVPYWrNIDpmQK9/v3Q=;
        b=XUD4UXjZ20pkeZrEEtVO2z2AafOV2ZlrgZbvXTLc74e+YnOQEqVbVzfpxDoF2FGa8+
         XgphE5jGURBtz9zFn9svHKbG+a9ubWs3tJf4EqWrAzTHzKZC+iHJILoaRRnhwMKNUjca
         b8sv49jx8WI1bHor3o0Xkn19bjQdgAh1Lxwwh17JzQbQjrDYjPjwK7odeGtu0V9mdTCb
         vXBDpcnG1qacyKmrVGzOVsgRypekcsxKHA8FHnA1adMum/H/Gl57lt/HNgg7/0T0FEhx
         38ylNwN+vEH9TK9yWOrWQ3Ai9fHXD+WOww2jas3G6frNuQSYQzufDIJNj+nT6rRwEICo
         lXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628727; x=1768233527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJeUUtyiAVCWOJ2rKsQ6Joxu1RVPYWrNIDpmQK9/v3Q=;
        b=JazWcO8AC2t4Wbw83X32MhfoP3z1FWOzU7FSK5J929FZm1EAIOvRVZRYmy/vECZC7I
         JovBoYDIyoAK4qQEeBUXLLgX1CW035ShknhOmymcqPlSxhDvZ9CeBkG6pZXrOZeq6bHc
         sFdWrkrufYTfO4JxyUXwCd+2075c2mJcY9Gxo6ih2knKK8j7IoV4qHgWrF0GWN3tnJvj
         pFBT94AlPCOx5ZdNV/AoYT/CXkJONkAR8Y7aMF0TbrzWAXNJfSiurrCX+KT91J67HfI4
         7bKLi4v8fOhDEkXQqNmadTDPkGz/z3VEDPhCGkxi+z/4GxoTZuhmmhnwoENHFkvMtqM2
         IwBA==
X-Forwarded-Encrypted: i=1; AJvYcCUJVG7s4lGghb0AdnGXGIsMSP3L43CxtHBTqlq7F2fBU0yYKLEx7+Zg/0CqI6K4JnfpNLq3vOFQJwA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNWNPJK/YUoKTycXrNHgMO/EuzdKDigZ0vr1bJzUd30lta5IJF
	6FvOtfPzQDrVGtG5JCtCuEUfUHNeBRCfW1Os4a/s/r5TSjRycbxrfBfR9kSz1vDmfA==
X-Gm-Gg: AY/fxX6mfJJH6YM+pTd4BNZjRo6VhnVG0/famlBX4JxA+YPfAFFi5YPqH231j5VmN4y
	728aaxZJOuHJmQ8y++IsM1W7UbSu0F4ehSZFbTsZ4roQE4Sy/4wm12bwA5gSwPUC0z1QwLyuYNr
	WBhVsrH5XW+JFg4NtmSk7Dd5bFDVCtU/FBfOaTlbCcHWp5lZooXkiZldzuCrKx3H6v3i+UVuMtg
	fdhW6gYb5Lv4xV9MigfDt9XbLxFUen9hPaRaSoSzl1/1KMZjFPyct/FEE/1ueW3eWALKom3mg/K
	02+Z4c0g1UdFRcFo3cbViUzA2P3c9VpmSVAiNVamTVL9DJ/OGIgB9NYXpJQtAyByQYrvADEmp74
	5ZkqysOB+0ypa6Euzs2+BzYXU+w0wyF2W2zPr1KF+VMSqabCMGiEuDCSuRKHO+vF2TnUllGlMB1
	xxZzVtMpwtjEVoYmkKi/ViW5Y+bwCiVw4XHZHoaF7uA5Ktdj6oWAM2k9RSb5uLoQf8p6XVxHgHL
	v/1m3t1k4c0PA==
X-Google-Smtp-Source: AGHT+IEtDyX4uAU/t5XLwiFiB80ihOQKxUjWyn75kkNXoVXRHp3k9k1S4XPfVeuQj74iceG1xb9RAw==
X-Received: by 2002:a05:6000:430c:b0:430:f68f:ee96 with SMTP id ffacd0b85a97d-432bca4ab6cmr221478f8f.36.1767628727533;
        Mon, 05 Jan 2026 07:58:47 -0800 (PST)
Message-ID: <673f05ca-39d7-4219-86bc-044a84e46699@suse.com>
Date: Mon, 5 Jan 2026 16:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: Avoid using .byte for instructions where safe to
 do so
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135427.188440-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:54, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -1,9 +1,5 @@
>  #include <asm/page-bits.h>
>  
> -.macro clzero
> -    .byte 0x0f, 0x01, 0xfc
> -.endm

This can't go away yet, as it became known to gas only in 2.26.

> --- a/xen/arch/x86/include/asm/prot-key.h
> +++ b/xen/arch/x86/include/asm/prot-key.h
> @@ -19,16 +19,14 @@ static inline uint32_t rdpkru(void)
>  {
>      uint32_t pkru;
>  
> -    asm volatile ( ".byte 0x0f,0x01,0xee"
> -                   : "=a" (pkru) : "c" (0) : "dx" );
> +    asm volatile ( "rdpkru" : "=a" (pkru) : "c" (0) : "dx" );
>  
>      return pkru;
>  }
>  
>  static inline void wrpkru(uint32_t pkru)
>  {
> -    asm volatile ( ".byte 0x0f,0x01,0xef"
> -                   :: "a" (pkru), "d" (0), "c" (0) );
> +    asm volatile ( "wrpkru" :: "a" (pkru), "d" (0), "c" (0) );
>  }

Same for both of these.

Jan

