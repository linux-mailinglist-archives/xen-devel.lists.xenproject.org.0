Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B28B51FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 09:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713867.1114747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1L6R-0002jy-FJ; Mon, 29 Apr 2024 07:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713867.1114747; Mon, 29 Apr 2024 07:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1L6R-0002iK-AT; Mon, 29 Apr 2024 07:07:07 +0000
Received: by outflank-mailman (input) for mailman id 713867;
 Mon, 29 Apr 2024 07:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1L6P-0002hv-Lo
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 07:07:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a28408-05f7-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 09:07:03 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so28736535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 00:07:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b00418a9961c47sm40357620wmq.47.2024.04.29.00.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 00:07:02 -0700 (PDT)
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
X-Inumbo-ID: 14a28408-05f7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714374423; x=1714979223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOHubGpgYAyYAkcXWF/rMyS0mFgSXKAO+i8xOwjQPpc=;
        b=fLhUXbE+UIsR+u9CEHcJvNV7C6vSJI9jII9xJxI3YxCeq9vVoTFQtI35KHVTh32six
         U1ju5y+qiyzX2Ov0P0QLVQ3/+O7UjXja+Lc+KAJqdczBwt5jpvBxxqxJB/ErAbZ7kzAJ
         qNWfIO77U3oHxF67Lt1epLGBKCuwZFXeZFGCFWWDqWd9yBJ8xpyoBYinYZvsOmmxeMHO
         AWnhiVo0PBTQ5jtwbRRXE33wi/vCIIWqa+gSvOxYA5+b1L1ts6YXJ2uwo1MkMYzlOG/5
         TvpjrGypjK4R64Egq+12MdB9BQ0QLWmlogbESuN/I3FcqqnwIGfM5k5K1h5cZm7c/VI6
         DfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714374423; x=1714979223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOHubGpgYAyYAkcXWF/rMyS0mFgSXKAO+i8xOwjQPpc=;
        b=l7ov6sWgQZBMPzszmQCIS5gaooBw6kqSinqP8f+ez9daeUStnpC9xRcaC+XKMk+Ju4
         6xcjbIYyRaqZmKUDR4Ww0qmS5ibviuR8Z9XAEF1lv3RxHnQEXV64vsDXNncTnUVfMVJH
         5uk/Y64zHaiUHXIG1kpF5xTrO+znGYyd2l0AEaANnQiIu62JA+EKdRW672Y+epgI/ZXm
         +wSy55vPnbjYIMlOaovYWE2omWTkJT0VoR7tnAQpzRsalVPsCfTXsC5HTdtj9ot2iCvu
         kl8CgJOI4WkbKgibnqZ0nvTTpTwx/Wyci4GiVurt9fTwmeEWhTLzuzTPki7a0h0+AyNo
         JBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2DxQ25xDXg3EW0DFBneABXeHavdTIq9s41Z2BSSYQzq/RMozi9saR1KO0ZAg2Rcc9i5KpWTZBQ2+hmIMlXRecXuySKw45qjVY4qdVbvk=
X-Gm-Message-State: AOJu0YxaYv0S9/Xc/8iNHkX+l74QbFTNgOzbC9ZtpKD3N+IybgqUQ/Hh
	acsD2Ma2bncgdn8VlNFeAaAI9bjzqgd7h1SEBDdCBNQl2sjY4QRNVirRk7LY4g==
X-Google-Smtp-Source: AGHT+IF33YBjnFT2I06Tghr1/q34iaZZo/O+iUfMmbY/DSSk7Qt4ZU2awTjudUiHFgZ/t2DF7GLkOw==
X-Received: by 2002:a05:600c:450b:b0:41b:f30a:41f1 with SMTP id t11-20020a05600c450b00b0041bf30a41f1mr3789437wmo.7.1714374422870;
        Mon, 29 Apr 2024 00:07:02 -0700 (PDT)
Message-ID: <fd3efb33-6611-4c6e-a2b6-fe47f655c0fe@suse.com>
Date: Mon, 29 Apr 2024 09:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/p2m: Add braces for better code clarity
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <90082c0aa2047edf5764840f1903d1797ca4b902.1714322424.git.w1benny@gmail.com>
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
In-Reply-To: <90082c0aa2047edf5764840f1903d1797ca4b902.1714322424.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2024 18:52, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Where did Stefano's R-b go?

Jan

