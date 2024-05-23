Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09D8CD835
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728738.1133779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB7k-0006k3-Rh; Thu, 23 May 2024 16:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728738.1133779; Thu, 23 May 2024 16:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB7k-0006gu-Oi; Thu, 23 May 2024 16:17:00 +0000
Received: by outflank-mailman (input) for mailman id 728738;
 Thu, 23 May 2024 16:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAB7i-0006dc-IC
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 16:16:58 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e517f8-191f-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 18:16:58 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52389c1308dso8013337e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:16:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a178a9f0fsm1952966966b.69.2024.05.23.09.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 09:16:57 -0700 (PDT)
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
X-Inumbo-ID: e0e517f8-191f-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716481017; x=1717085817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr7oOaeYh+MMHlLzzIuDgYAR3uYP8TI+UYhioPNjceU=;
        b=gpm5kyGpGWrj64R+ASNYOcpNojg9XTleOGqpDqR3KPPPRmJ3B8XeeuoY2Qx6PBmOpb
         XWRG+8PG8T1lfs9s2SAiGMdxUNXDP7Gl7WQwLMizAZxiMW2afhkWyMxAFG6Jk9Fejjqu
         JoO1HaURZHnR0uvYHQ9Y7F+qekAxutIbKX66TJluXB5Jhv3epSe/Si5dkKfSVbdS5MLs
         HTt7QmFgBwlsnxdvsvDd5dfqwPFlvq+3Apr10VSr2WQAeraApFqHrMIyAEa9qfCuUH1L
         p6k5s3BN8LUFIDv+c0F12l+bSgSHvhx6d5vlomxWd0Y8jZAldipfa8iByuAg8mQrS5wO
         hDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716481017; x=1717085817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sr7oOaeYh+MMHlLzzIuDgYAR3uYP8TI+UYhioPNjceU=;
        b=XtCdWLEv/WDF9fvnFGy2XHzFig2XU4copK7Gqcngm0SF9WgqLnvcrEXaDlRbMX7S9e
         Mf4oZNbhIOWS4wfTWfZU+8r29Vh9mR+Hp+GnWNJkOaer67v+v9WyyBR4P+kOoKXYmV9M
         WNSSVeqXaFU9NIDXI3CUVAm5B17BxH0HVJGlCzZp/tsaVOvo9wCLUCT7k3xv47wrgVG9
         EHAhXOLPVQ+isFyoMAPsxcIbUU0SUCFapsDlLMipi6d/wc/qRa1zR4vw32vPH2dT1Fra
         uUCgsYbf1zVm5/wrB3h9YV1Ec/ifGWl6R/hELbUnt8vkEXjiyjTDVAyfP0QalZasjwem
         uvsg==
X-Forwarded-Encrypted: i=1; AJvYcCUq7E26NVzAoQDrNamyRQFjbhuYAW8IRLipnncHT9BvUKLCk6o4sMISLNQ94MvAG0QbpWzuXlgAPha0AaAF6I+HmW4UX742vJDvw62MorE=
X-Gm-Message-State: AOJu0YxW64brvhnpf1JJcmtf7OrhnJYUDC3jfQJobnKwRWMful8s6UYp
	EE5cJB9E0O01ds3vym62EOcB+WoQCziERyF7EHwn5QCV2cb7s7Y0nGX5VvpsR9R4gBqS88Z/e9I
	=
X-Google-Smtp-Source: AGHT+IEhMtptW6zv3AOsQhx2YiwWpvX3psi4zc+9IikG0k6N0qlQRtLl6h6mumkSM93/RqpjXLxTeg==
X-Received: by 2002:a05:6512:304d:b0:51d:3fe4:c3cc with SMTP id 2adb3069b0e04-526baa662ddmr4252546e87.0.1716481017595;
        Thu, 23 May 2024 09:16:57 -0700 (PDT)
Message-ID: <9e6803c6-3d83-4e5c-a7bd-b8b844eec66d@suse.com>
Date: Thu, 23 May 2024 18:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/cpuid: Fix handling of XSAVE dynamic leaves
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> First, if XSAVE is available in hardware but not visible to the guest, the
> dynamic leaves shouldn't be filled in.
> 
> Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
> host/guest state automatically, but there is provision for "host only" bits to
> be set, so the implications are still accurate.
> 
> Introduce xstate_compressed_size() to mirror the uncompressed one.  Cross
> check it at boot.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Irrespective ...

> v3:
>  * Adjust commit message about !XSAVE guests
>  * Rebase over boot time cross check
>  * Use raw policy

... it should probably have occurred to me earlier on to ask: Why raw policy?
Isn't the host one the more appropriate one to use for any kind of internal
decisions?

Jan

