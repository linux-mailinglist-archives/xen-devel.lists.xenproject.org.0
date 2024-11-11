Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4279C3B68
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833460.1248615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAR6c-0002ud-OG; Mon, 11 Nov 2024 09:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833460.1248615; Mon, 11 Nov 2024 09:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAR6c-0002sp-LA; Mon, 11 Nov 2024 09:53:10 +0000
Received: by outflank-mailman (input) for mailman id 833460;
 Mon, 11 Nov 2024 09:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAR6b-0002se-UA
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:53:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe9537a-a012-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:53:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314b316495so34809015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:53:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053047dsm169058675e9.3.2024.11.11.01.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:53:05 -0800 (PST)
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
X-Inumbo-ID: bfe9537a-a012-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJmZTk1MzdhLWEwMTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE4Nzg2LjMzNzAxOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731318786; x=1731923586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w59a/tK6LcOwygBO059wCUTDX8yCzfcL3FLuCwZGN6g=;
        b=e5sAbYKDFWlTMfGmTJ5EmGn4aiVCrZcyGRdQEdyzVa4iSpKJKfbNdD5r3+Zr3pxlt5
         OYwwEUJfAeV7ICWHuLvHt+/6hxtLnDLGMgvTT9WuG/2Xm69p3wuYjB9cMauuU/ZCpUOI
         JX/kd5tG6vX1u8y1FCx0ZFQXjiijIgs0+Uuui1YFwgTD5w5KmeTP1XPa1liuxbq6ntGv
         FDRTHZ8NPil576+KAT/iooUtRqbTiynwSpLcYub/0D3UeQ0y+EGtR75SwJKGOqS2h8qJ
         RRxxyibkWnmJ4dheUpSxhGNqCy3HEoXMn/wPAglHa7w1Q5iu+OwnQKrHyNIx6882cs9G
         7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318786; x=1731923586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w59a/tK6LcOwygBO059wCUTDX8yCzfcL3FLuCwZGN6g=;
        b=S8VCzWq+H1dFaVHj+d0CU7WQOzhc0UHY4dwxrjNYWdBVaGZsAzzUh7WWcxfnxBXBYo
         uzdtTaBxYKkrYrck+DQuMgVYWd2gLmaotPlh0OqSe24Jc8DkDtA52WfbQQUlKgejPDha
         WtrdAE3FYQyeqLdPjj+ihtLxAsO1JNx2oPlOmk6M5m52AJRUMr96CqX9U8SIxRHX0VPb
         ZO3bglY4k6ATvUdt0KKV8rhmi9Y2H1ftLN4VMLZT81VvqLWjQO7tbr9BqTTLHJMq7X/8
         ZLqfFoFojtJTUw0ekH4gCkXHk4m+WTrDYvpP28GFPoJ56cGPWE5XepPGGfxhOae66Fwx
         QwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxUkLfl1HmmElUov9T54OHUhu8kHP7dU4tHCLezu2P5F/6D4WV/qGkynHDqwgaWOyqKzRfjJ86VC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9RcZuZ5yIlFhUWRs9BrLwiCiRmOyUs6YOzse/YOuNNlsk4VkA
	MGbypRGgZiUlnrvW8gnErcPuHDv998oh+m4WcnWJU6PxXCNqDz24sr3pUOnRbtI39zUs1mbbZOY
	=
X-Google-Smtp-Source: AGHT+IEdwkHnPofLCeqyph5h4CPUQSL4UB1SgCZhGM8shWa0jpw9n78rnIa2z5bDSsmC7oKRBofHzg==
X-Received: by 2002:a05:600c:138a:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-432b750274fmr90951495e9.11.1731318785685;
        Mon, 11 Nov 2024 01:53:05 -0800 (PST)
Message-ID: <9466b184-0ea4-4c2a-acf7-ab85edd56a57@suse.com>
Date: Mon, 11 Nov 2024 10:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/2] x86/hvm: introduce config option for stdvga
 emulation
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <53b0d5552c128630e476c77b54b8983fe02e0e1c.1730887415.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <53b0d5552c128630e476c77b54b8983fe02e0e1c.1730887415.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 11:16, Sergiy Kibrik wrote:
> Introduce config option X86_HVM_STDVGA and make stdvga emulation driver
> configurable so it can be disabled on systems that don't need it.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

FTAOD - largely the same comments as for patch 1 apply here.

Jan

