Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA926819DAB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657684.1026705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuRx-0002Vm-64; Wed, 20 Dec 2023 11:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657684.1026705; Wed, 20 Dec 2023 11:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuRx-0002TF-3O; Wed, 20 Dec 2023 11:09:17 +0000
Received: by outflank-mailman (input) for mailman id 657684;
 Wed, 20 Dec 2023 11:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFuRv-0002T9-PJ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:09:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35332ab3-9f28-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 12:09:13 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso2835332f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:09:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020adff952000000b0033609b71825sm31281099wrr.35.2023.12.20.03.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:09:12 -0800 (PST)
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
X-Inumbo-ID: 35332ab3-9f28-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703070553; x=1703675353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZUB8qZCGPyGMZuEML8wcA4ZoiV5N2qqWfjAd/vcVuU=;
        b=OCcMAu1rr8XJroYEm2jNLZPwm+6tdBbe2fkZMbrzviBJX1Irp8En4j8QzyZ5e1v12C
         GW+sM9hc3SVkHFmDgSNMJDEvFWhKJ0BhU7cq/1RGDaRaxzORPS9brQsNyXMbXVG0iEhG
         YC4uoKVpBJDtHM7XBtnzllbROoc1JtcpELvLlpzmZAPbF0oqEmYmtm3a5a79IRT3MZDe
         d5bo96h36PTQdgdsESzmG1ERDblYNnodDe9PZ3R4xTWy+pARFnO3XGNqkSTbcKZwa+1U
         0XN+Csc4wMpY4grYEdC4RfVQth2H0DnDiovTkSg6jOC0438DvyW9KNXHAT6gDBcSYS+Z
         hNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070553; x=1703675353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZUB8qZCGPyGMZuEML8wcA4ZoiV5N2qqWfjAd/vcVuU=;
        b=p7xy+4GKcTHUJkJ8uApBuWnGKDx/LhL5xnd4v62EDrhpCLGR0UVSLT/dwaRCWRGxn/
         5Jr4PhTIZMUkYjHvlrue/1Qwej4x8NCGw1xGkUNLQMEWljKMDyK0NrJ9Sxlx7Y3ZHqh6
         EQfgVblz1+rEiWSjb8SHB31W8F8HGSTlC4uVp3CucSKuzhR10P9NCyI8/pLTpuiqpsq+
         TBDEBFAJwUeW6B0NpM9ewG5PUfG7ILLsdis5wKbtoGqZY8Bm/GKoUNr9G1o9D7v7iMBG
         y6NjBqYhWxAaw5O6s4oKrSkkVF23h9byrdjGxGiT1e9/OZ2csPFtT8bG1u5wVSEtg8aZ
         y+8g==
X-Gm-Message-State: AOJu0YyT4YhBY1u502cWVyMW9bRUC118iN+jlC0WHCS5kb+/NhSU5LmY
	9v4LJTM/oS7PT6Iyg/2svI6fnBk+ZnAt+5VZQYD9
X-Google-Smtp-Source: AGHT+IHQ9KuPQPVxEjLaTylOvEnF8oERT1vmsQ8YSzYdRtDXrGR6QHpQbnapx6m0HZ0le2vJ3AnKYg==
X-Received: by 2002:a5d:4579:0:b0:336:8030:213b with SMTP id a25-20020a5d4579000000b003368030213bmr3065wrc.142.1703070553150;
        Wed, 20 Dec 2023 03:09:13 -0800 (PST)
Message-ID: <3fa1db69-adcc-4d1f-9e8a-e2300393210b@suse.com>
Date: Wed, 20 Dec 2023 12:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/asm-generic: Introduce generic setup.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:43, Shawn Anastasio wrote:
> Introduce setup.h to asm-generic based off of ARM's to define all
> stubs necessary to compile bootfdt.c
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/ppc/include/asm/Makefile |   1 +
>  xen/arch/ppc/include/asm/setup.h  |   6 --
>  xen/include/asm-generic/setup.h   | 148 ++++++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+), 6 deletions(-)
>  delete mode 100644 xen/arch/ppc/include/asm/setup.h
>  create mode 100644 xen/include/asm-generic/setup.h
> 
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index a711cfa856..7167661f86 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -6,5 +6,6 @@ generic-y += iocap.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> +generic-y += setup.h
>  generic-y += static-shmem.h
>  generic-y += vm_event.h

Looking at patch 5, you undo this there. Why introduce it in the first place
then? And why leave a stale (unused) file around there?

Jan

