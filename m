Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD714C8612D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 18:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172142.1497243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwOg-0008VM-Jh; Tue, 25 Nov 2025 17:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172142.1497243; Tue, 25 Nov 2025 17:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwOg-0008TL-GV; Tue, 25 Nov 2025 17:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1172142;
 Tue, 25 Nov 2025 17:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNwOe-0008TF-Lz
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 17:00:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 313b9b16-ca20-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 18:00:06 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so33621935e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 09:00:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3602d1sm269676755e9.5.2025.11.25.09.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 09:00:05 -0800 (PST)
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
X-Inumbo-ID: 313b9b16-ca20-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764090006; x=1764694806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4nez9HRrs80jtw84vGF0oUAMT5LpCL7Hdz2ZsccvtfA=;
        b=gdWpA4fCTw00TKGLjPw2i10hJcNeCYa6k8DeulFO1q7O4IKFIUN2E4s7ZgulFcJdqe
         C840RsNoLwP4GYRJvKaDpVyihNuw8fPVFMH7gRV2/Bi3g8eKiW8ATn8jNRZZX6SEfZ85
         qqn18UCqOSlwRlvkbXPla0pJy1b7JdF9e6pmuB4iDhA0qpmIYqATB7MwA6SD13zKKr1B
         bHdpIk202qjUAo0y+qMw5yn+7vj2WJ8fp4+l1wRb0pHN0mw5wrnKFyvMvLOtpX5scXbH
         rUooX2EImirareERNZpj77O8pPXZv+hLG1a6vrCYRXv5Yp1YKOuxjLjeIbn3W0ZlE5UP
         uFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090006; x=1764694806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nez9HRrs80jtw84vGF0oUAMT5LpCL7Hdz2ZsccvtfA=;
        b=u61Ea8ME4Kqpu8U5aoN9xUX2xnk61HON0wqja2yvuS/mn5IB3DQULa8vtkP5/aYNyv
         95tT8pHJPQ4xWtsPHPWTIs28rdksScRie5RvMoOhcPzxIo5K7WN8FzREbPYEJgXkRT+2
         pX7kqHtOosFrGa4/cAr6Is8LGd7ASacyuse/vnC3EukxYdFFwiuBLcSg/9rnjQBccFD6
         bYjPJyJdrcE7KCA+O59JzHCX+emxtnWh83uEGBGHlWBoZpCZoJvEkKvOoz6K8SDxoqG4
         sParG1zHAYnUvz3PFcw4GxARRN7qii2r4vIfnNWiF866MWPLgY+/NOcOsEcTrDVgCnDE
         muRw==
X-Forwarded-Encrypted: i=1; AJvYcCVTSKS47nqPf16uop9LVscPGyWoeDlesYQ3ETLM58Ns7ZTw0wt1eUwbfnIQj5UmWuHPLQDFAI+hGts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFzfVqXO7fsYtiUyNtN1RpMHpY+V8/BnK6fZBgWbF+LPDd54fA
	hRK9r3YuEjazP9j9xoA/Zb64L4ycNG924MRvH5okmXEXebs1e9dsRtzA4bmHDVYrpw==
X-Gm-Gg: ASbGncumocx7weyeVoIu9KBnQBT/wsOGJ+QyCiaSz6tq7N23UfjZ9fHBERKtvqJmSHu
	ZS8x4fe27SKWlQBCxR/Dxft1aGFHAfw7p7X/17max0dXt3m5RY4YMLPMZO5j6u6AaJwYxDMb6Cd
	kvSiZw+LZWgAOqrgzSqu2xZW1B37gjmf3mxPRu11rs88GhEwQrHvMyHj+SJjDYEKXL52YBa+irF
	M+vL1V9CmXxr9nCO8LmYyGrZSijy4LzeUowf4zJQ+Dh4ntRmUyIVHvYlds0lck7qHG+fgCMSh44
	IivvsNPOJOKt6xOBGeZxpIuxp+/e+iTj4feq06g4ywTO6R//lsSgoYPl+JOTmPS7O8748wFOJRf
	X0TfFEkDylHUCOFUw04wLe5371LIw6ex8BjtcORL0ZdCUTKLDy7oyJ2drrQM6bOmSjFXs/TepKm
	uBlOEz5DX7lajyyXxpHnhr00UdIhJJeDdRWWcizbNRB1hWySIyudsArPxvi0lbVM33rPk/ArIGT
	+w=
X-Google-Smtp-Source: AGHT+IFFqqx8CGSIk0bO8RvVtRtR6HoWmSSYX3barC0w6Fozh0+j12F4fUXiwHzXaoVksBeaChiBFg==
X-Received: by 2002:a05:600c:474d:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47904b290bcmr33560915e9.32.1764090005730;
        Tue, 25 Nov 2025 09:00:05 -0800 (PST)
Message-ID: <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
Date: Tue, 25 Nov 2025 18:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-21-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-21-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -29,7 +29,7 @@ config X86
>  	select HAS_PCI_MSI
>  	select HAS_PIRQ
>  	select HAS_SCHED_GRANULARITY
> -	imply HAS_SOFT_RESET
> +	select HAS_SOFT_RESET if MGMT_HYPERCALLS

Why would you undo an "imply", when really we should use it more? One of its
purposes is so that you can add "depends on MGMT_HYPERCALLS" there, and it
then won't be auto-enabled if that dependency isn't fulfilled.

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,7 +55,7 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE) && defined(CONFIG_MGMT_HYPERCALLS)

This line is too long now.

> @@ -299,7 +299,9 @@ hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
>  #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +#ifdef CONFIG_MGMT_HYPERCALLS

Why not combine with the existing #if?

Jan

