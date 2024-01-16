Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EDC82F293
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667900.1039575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmbm-00028U-OB; Tue, 16 Jan 2024 16:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667900.1039575; Tue, 16 Jan 2024 16:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmbm-00026m-LB; Tue, 16 Jan 2024 16:48:14 +0000
Received: by outflank-mailman (input) for mailman id 667900;
 Tue, 16 Jan 2024 16:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPmbl-00026f-Bg
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:48:13 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08450ca0-b48f-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 17:48:10 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd1ca52f31so116906931fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:48:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a42-20020a02942d000000b0046e0e9912e1sm3084180jai.69.2024.01.16.08.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 08:48:09 -0800 (PST)
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
X-Inumbo-ID: 08450ca0-b48f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705423690; x=1706028490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pGlmAJZl9SvF2jmwQO8TaHaxg2x/corVtqdAgPzVDE=;
        b=ZQalvQtxIREivdFF88XWumwe/GgnMwi0SUsdAmww8Uw9UKOwep/jTDy/Xifm2pRJtO
         Wq59BojnSvnHXRxbVaw5Xq7lCsJcABNXRHWB69U62sGZ9SrxU+ga3gIBq7HKeNDlfsWP
         TTA6UJzyj171Xpnhdtu6x/tdJDsAA9Q+y+oQTaUDCFvLmr9SQQPLgbkbA64rggea0lwA
         9DUOb+g0JtZ5f1QDOTd9s6lRAzOeEVEcxmMXrLpZJxc6GGJcVrEBoDu1CoEE8dk8eoZ8
         Lf9N21OlCZYNmAg2V0tePHmc3uSHz4VbJWmVHb+HpUAwzZmJPsYquxOPN79Lcm1kNN2T
         mK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423690; x=1706028490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pGlmAJZl9SvF2jmwQO8TaHaxg2x/corVtqdAgPzVDE=;
        b=Qrogm4IZACyzg/+qELYhRloxvgzUAUbNzFTRjXj5U79GconT2kUfFmfSNPuOJJVEDM
         FzNJI6sDxt4UcJPWIOsOS5YXIaLyg9USoQEQkPlJkOwp9qjzrdbgvFfwgQ72qyZbYVb4
         2EyslIW8Nmf9GUGJookzD2kcZtI+/PU/r5ec00AccP31MX9mLt7zCTpS1Sm+G7no/kic
         lnbbiaHBhSI/uT5Yrpp77xpiRweP0q2Rjm232Vgf8EiswCchjhnR26yqKKw/+BWbrH0w
         GwRKc9W2LCLWML2pawXR0Tr1SdJu0mBBkqlQ49rWemI3bf6OopZSmW/TXW3WrQ6aWIuk
         sxbQ==
X-Gm-Message-State: AOJu0YyPURy/y5IwHoOrCi2WKfot6VD/QTh1hgTIIo2WlBcS9Xqxovgf
	jnVSXEZa8hwgZy5EyAzhI1hYxGwISlso
X-Google-Smtp-Source: AGHT+IG8QfhtGIEfyfzLkikIWAJIQOYr+TocF5AkYZ4QW1b+4kO9VeAFuhgJbpxuaX7VBTPFZ81mtw==
X-Received: by 2002:a2e:9e93:0:b0:2cc:5cf8:13d with SMTP id f19-20020a2e9e93000000b002cc5cf8013dmr3095308ljk.102.1705423690329;
        Tue, 16 Jan 2024 08:48:10 -0800 (PST)
Message-ID: <5e74a501-2824-42af-804b-47b515aa9bcf@suse.com>
Date: Tue, 16 Jan 2024 17:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release management plan
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <08a2f9bdd7ba1f9e1e8e67fdb48420ee89223b01.camel@gmail.com>
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
In-Reply-To: <08a2f9bdd7ba1f9e1e8e67fdb48420ee89223b01.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(reducing Cc list)

On 16.01.2024 17:32, Oleksii wrote:
> Please reply with items you would like to see in 4.19 so that people
> know what is happening and prioritize accordingly.
> You're welcome to provide a description and use cases of the feature
> you're working on.

The "annotate entry points with type and size" series including as many
as possible follow-ups on the x86 and Arm side, ideally bringing both
architectures fully in shape for the new model.

On x86,
- among smaller scope ISA extension work we probably want to make
  sure AVX10.1 is going to be usable by guests (patches already posted),
- "x86: memcpy() / memset() (non-)ERMS flavors plus fallout"

There's likely more, but let's go with this for now.

Jan

