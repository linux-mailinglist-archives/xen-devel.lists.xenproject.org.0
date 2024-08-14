Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5169514BF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 08:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776753.1186913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se7dT-0005lI-Uk; Wed, 14 Aug 2024 06:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776753.1186913; Wed, 14 Aug 2024 06:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se7dT-0005jb-QI; Wed, 14 Aug 2024 06:37:31 +0000
Received: by outflank-mailman (input) for mailman id 776753;
 Wed, 14 Aug 2024 06:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se7dS-0005jV-9m
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 06:37:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acae42a6-5a07-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 08:37:28 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so751014166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 23:37:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4973dsm134998066b.20.2024.08.13.23.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 23:37:27 -0700 (PDT)
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
X-Inumbo-ID: acae42a6-5a07-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723617448; x=1724222248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DYwiFc8GFPvY8am+eVOY7srueHTmaEp6Q+sfVsPVAlA=;
        b=H87gqGOXYLgYpo1dMwZ+fPL8l8EXQByW/iPFsoU198k8sNFK0Ftu5Z0vZ3qLLhQnUJ
         7uPtlZ4n3zCSfh4dsip4O8SdJaf2s7akGkx5exOHMrw2eCYIQGFBbfTnqfvdA+d/qbNk
         2KJfBJVNCEH/LMZHuz/GhW/Oq8mstdCCquvFGvoLOrLKeaL7jmJJEB4qMtrDLisdXct3
         ParBublyLG/xk8crX/PUvR+fNLMT2mC+2OSqfakbCfzH69xfwhBVU96YuXa4xNEzufJ6
         jW9eriEULprsLZ+YwnG/SOuIVOfB0rN5B6UZkBeBA/S9lWxCGDIg475pQlKN6A0n63Ed
         la/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723617448; x=1724222248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYwiFc8GFPvY8am+eVOY7srueHTmaEp6Q+sfVsPVAlA=;
        b=p0JmtJC0zDilWwFM0dH9GA3lU298pP9+jINeUTqlMiWezCoCLEsT+wa+vqukGYT8N+
         2N9ap+cg6ja5hUqrBJ1o5xXKPqILZkPlQuo2I7U4STIcHEGEy0eX9HIRCeCHHKBUTuLw
         j0WFs8RUQB3vvEFuqHsbRIpSd9nKL8JhXh/j+PvvRA8MDlXTWNR8Dxp0DyJTInbtaed/
         miGxQXzmoTMbDLrP5OXeEUZM57LDLSx/BhKzJfYnBDtEuZpuedEJZqT4CQWtxaO0oH11
         7fUS64YX3EaY6sL1Zfv2l49r/HfO88R6SwPgKvNLOH9AzQetEkITekNeNQ7Vm9HiLzTP
         3E1Q==
X-Gm-Message-State: AOJu0YwO+rjF/eVR3AZjF1IsW2zZJj6USkVEk6CZ6UfHbRCQ+zPKWBS3
	XIGw6nONAnTF1aczB7HOfsHqSifriau88Ndpno/xHR6F2HYGlm7OyQWa8zLSeg==
X-Google-Smtp-Source: AGHT+IHK4ClJ3B4G+KqNKlofXJTD62WhkuoidqH90c5X5tlwwwXgJNEodaIEPyL7bvBCZYjksVZCdw==
X-Received: by 2002:a17:907:1b19:b0:a7a:a7b8:adae with SMTP id a640c23a62f3a-a8366c1e778mr131227966b.4.1723617447447;
        Tue, 13 Aug 2024 23:37:27 -0700 (PDT)
Message-ID: <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
Date: Wed, 14 Aug 2024 08:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240813171356.46760-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2024 19:13, Ayan Kumar Halder wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Introduced CONFIG_VMAP which is selected by the architectures that use
> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
> 
> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
> with new memory attributes. Since this is highly dependent on virtual
> address translation, we choose to fold VMAP in MMU system.
> 
> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
> only support in MMU system on ARM architecture. And ALTERNATIVE now
> depends on VMAP.
> 
> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.

While I'm not an Arm expert and hence I'm likely missing aspects, I question
the one (Spectre-BHB) vulnerability there to be sufficient to draw a
conclusion towards the usefulness of branch hardening. I would advise
against encoding such a connection in the Kconfig dependencies.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -1,6 +1,7 @@
>  config X86_64
>  	def_bool y
>  	select 64BIT
> +	select HAS_VMAP
>  
>  config X86
>  	def_bool y
> @@ -31,6 +32,7 @@ config X86
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> +	select HAS_VMAP

Why in two places? Also please respect alphabetic sorting here (if this
hunk is kept, which may be the more consistent approach) ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -77,6 +77,9 @@ config HAS_PIRQ
>  config HAS_PMAP
>  	bool
>  
> +config HAS_VMAP
> +	bool
> +
>  config HAS_SCHED_GRANULARITY
>  	bool

... and here.

Jan

