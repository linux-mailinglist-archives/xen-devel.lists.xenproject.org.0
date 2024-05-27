Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BC8D001A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730710.1135864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZXW-0000ie-Mk; Mon, 27 May 2024 12:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730710.1135864; Mon, 27 May 2024 12:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZXW-0000h8-KB; Mon, 27 May 2024 12:33:22 +0000
Received: by outflank-mailman (input) for mailman id 730710;
 Mon, 27 May 2024 12:33:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBZXV-0000h2-2e
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:33:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8af4c5-1c25-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 14:33:19 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57863e2846aso2297066a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:33:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c8176e1sm482254366b.8.2024.05.27.05.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:33:18 -0700 (PDT)
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
X-Inumbo-ID: 4c8af4c5-1c25-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716813199; x=1717417999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyh2Q8fs8dzasn3zI/WdkZ9hhYD4APQT0yrKwptzCVo=;
        b=Pv92bRCUc7YG/Qnl2wipwYIMxA6P4Iykf1devqibdhHGvXDoTttEGORwve0WATddJ9
         7n6JrFVW0x18KFR79fa98lypsOmieBbksA96lB1JkwEo+z0CKVr/Z6n8fYfsi6WIHuBc
         7WzvUOvLGR5NvcqlWF6HPzEymU8K/zf+0E5BQvmeDUPSFl6wzTP+kjdQrQpHqXG6Wq8h
         73RnWAk5sgf+7or82zdXHQeuv+0XvP/DXRvoE5AptUa8E0Hgz2m3BzQn35Y+ZcdCoDi0
         xkL34CmIvH8uX1zrysj0o0PlrG4vp29+VgNloga94JkT0f1NQQk+e5IC9mQJQuwWwIkz
         qYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813199; x=1717417999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyh2Q8fs8dzasn3zI/WdkZ9hhYD4APQT0yrKwptzCVo=;
        b=BX3CPidKouKggzCKicTpIWE6oMsY73QeTTyAvVwy0qkFPzzUn6DG3LADyDHgoMKumd
         wmrXxWJ5ia7LfiqpL7a46RRImpyWlhBHeqo4W5Xh5bsqCxNcMUFYRH1P3iDh6gr3fO0y
         HNLqYbGwut5sWDuJK5aCBNWe3XI0APhYITGlzDnSGXKMIUq7+2uRvrrpCvvCsnDoWSb9
         AtHYMjV3WxrzZYdI2os0xlAYiMZLN2P0+O7xRsKkbbSlw+0yIJtA+1zgjcnJp+1i5uJf
         AqOIFLRSc+pFL8IsbBV/gMdZefQCZ+REMixqGUPd3VON7d9xn5D4TCq/WzJdBmhAXDhK
         BAMg==
X-Forwarded-Encrypted: i=1; AJvYcCXtaGD4mEDzlZCbKkQ9kk3N/WqO02xTNU8gdZIw2mYj1t7X4ivhwjxcasde3qfUGXbFTWt0hO4bkmACVoeWu2MiLr0z7/adtV0aGeNGXm8=
X-Gm-Message-State: AOJu0YwfHlh6G5ogaYhZ6z6CUiKUN8m0Eu9OqM+QK4s/Qfnw+eITHfDw
	zoilvXIpotjbRYxrnXDOftq7kaNee89oaO0wFxL70d3478PB/arVfDTd82phdg==
X-Google-Smtp-Source: AGHT+IHx4QXo/coC8rMzpNCwsnazGNaMQgCvYDG/UlkwNDbXD9Cr9KkmGq+Ze5GhV27GKipmzOX02w==
X-Received: by 2002:a17:906:478c:b0:a5a:7a1:5d9c with SMTP id a640c23a62f3a-a6265146984mr647600566b.62.1716813198980;
        Mon, 27 May 2024 05:33:18 -0700 (PDT)
Message-ID: <1f885616-3c14-4a80-bc83-8cf712a02d8f@suse.com>
Date: Mon, 27 May 2024 14:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> Perform constant-folding unconditionally, rather than having it implemented
> inconsistency between architectures.
> 
> Confirm the expected behaviour with compile time and boot time tests.
> 
> For non-constant inputs, use arch_ffs() if provided but fall back to
> generic_ffsl() if not.  In particular, RISC-V doesn't have a builtin that
> works in all configurations.
> 
> For x86, rename ffs() to arch_ffs() and adjust the prototype.
> 
> For PPC, __builtin_ctz() is 1/3 of the size of size of the transform to
> generic_fls().  Drop the definition entirely.  ARM too benefits in the general
> case by using __builtin_ctz(), but less dramatically because it using
> optimised asm().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



