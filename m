Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053395697B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 13:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779573.1189282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0jL-0008TM-F4; Mon, 19 Aug 2024 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779573.1189282; Mon, 19 Aug 2024 11:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0jL-0008QX-CJ; Mon, 19 Aug 2024 11:39:23 +0000
Received: by outflank-mailman (input) for mailman id 779573;
 Mon, 19 Aug 2024 11:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg0jJ-0008QR-8k
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 11:39:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abfe080d-5e1f-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 13:39:19 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so5508591e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 04:39:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838d023dsm619746966b.64.2024.08.19.04.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 04:39:18 -0700 (PDT)
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
X-Inumbo-ID: abfe080d-5e1f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724067559; x=1724672359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=74M02xVp+Xc+oxJDi9RbzCA2XfqS0Zn9U0wGl/0+2Mw=;
        b=YdeoLogfinY8pbMzp5o8X4pqlmEOzmdttnQELUmfJzXioWKcSf5pw62A+Hu8rew3QG
         plvYeV1L8hhVWvkL2L3oEVxD5gw+ntotYK+ovwJ162r2Ft+6Y+MTE/DQm4POthy09rsc
         fAtqdx3WESYXfOwZeChngcXq/kZRXaz3y5ek4NBses+AJoLiIws1kCX5UlDAFNM4C7NE
         +L/bjIpyhgQjgyT3PHO/XhdvCmOl6sOsJ8udVur6DiW/BXIzuYUIgrJU7iqQi7zYAKKj
         JteL2re0dtKtiViMkT05L9ea1MlZ9KEmhdlIImvu75eXdqQ0KU5Kj2f4iznF9wQKvBjf
         QKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067559; x=1724672359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74M02xVp+Xc+oxJDi9RbzCA2XfqS0Zn9U0wGl/0+2Mw=;
        b=rOfyRwhARfu/JECv3J9sjN2ftVUFKra0XcaW97YePN+Nt3BGSqxAheL+RG+AhNlFTq
         rz0NEBVou5B9X9hCx93GbzxSsKZx8F9JF0uuXCiEfDFrmXroVjGKRMyZeh60ciF1yiVK
         DmeVxbGoJ/S/m4bMHCvXK3k+oDabsaY5j+Vy/0av4UE3YRPgTWuEOPN5P4Jg+IEShDhn
         N0ALo2DC/vkitPiaeetRGBNYPyLo3bOyNPQi4qmHb8dj8P6Alt/D9gd1yPp5QeizATCg
         MW1b7BHHwo84FqzBs9ztJ5O4dhFirTy70MT4lHGOigcDfNncn4mlDhItYYhiSkn8lmQz
         AZmg==
X-Gm-Message-State: AOJu0YypELLC9pdZ+1xcLuOS4rlh8KE+ilTfi8NhoZUx0JMkvbxVo6o3
	sZ9Ibb3aKw7eYL+RGtKtlEB5PYk7G9DEvI9VLd6iqnP44GDNy74S3QxaZGw3wg==
X-Google-Smtp-Source: AGHT+IE45SmaVY5uuiJfX9e4OG7Cr/E0xeWeH0UhRI9v97dRPk3jKrhRHCRY4/yl0L5nKA8MiLObkw==
X-Received: by 2002:a05:6512:684:b0:52f:cd03:a84a with SMTP id 2adb3069b0e04-5331c6dbd0fmr8645101e87.39.1724067558725;
        Mon, 19 Aug 2024 04:39:18 -0700 (PDT)
Message-ID: <ff48fff8-a659-4e63-8e1f-2385a936ad61@suse.com>
Date: Mon, 19 Aug 2024 13:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
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
In-Reply-To: <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Guys,

On 19.08.2024 11:45, Ayan Kumar Halder wrote:
> On 16/08/2024 17:40, Julien Grall wrote:
>> On 14/08/2024 13:33, Ayan Kumar Halder wrote:

mind me asking why I continue to be on the To: list of this communication
between the two of you?

Jan

