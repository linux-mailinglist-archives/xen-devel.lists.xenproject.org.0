Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD389B8CB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701780.1096269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjfe-0005tY-Pn; Mon, 08 Apr 2024 07:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701780.1096269; Mon, 08 Apr 2024 07:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjfe-0005qZ-Mo; Mon, 08 Apr 2024 07:44:02 +0000
Received: by outflank-mailman (input) for mailman id 701780;
 Mon, 08 Apr 2024 07:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjfc-0005qT-U5
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:44:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c25ccdbc-f57b-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 09:43:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4164e7bd4c3so8203175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:43:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b0034599eca6c9sm2637907wrq.41.2024.04.08.00.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:43:58 -0700 (PDT)
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
X-Inumbo-ID: c25ccdbc-f57b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712562238; x=1713167038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPXl71g8joPxci5PlTCRc+jtdwshfl3J0xUrwNxMLxY=;
        b=OaeOEgN8lR72T0z/Mk9u0A69A9DzvKuv3xhhtoA0EEB9rx25XZmhvONRcyiph3CNX2
         epdj+KtexpmqR71tT+lzqGgDglh+d8mUGz4p2Th/ZBcotritHoeBvgoy864VT8kyWSj1
         UMS2yFNbsvQSJnOCkZY02MJggLcn6xipOiBhw8f0qttkTT6vL3IpoP24vz3wRmQVAldI
         2RZFMJwkMl61MYRbGlfBMpdsTQccAprixOCk3ZRFCeAROzfIVz6Xtokya7ojxIhEZIoW
         hVIsQhbl1+vzaRnTLjjS/Q8vBb+SWqKOITWZCnmgqBMxxc3EwwPTSSR970SQSHl7Z6AZ
         WEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562238; x=1713167038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPXl71g8joPxci5PlTCRc+jtdwshfl3J0xUrwNxMLxY=;
        b=Tr9QzZgzdbyYYvPmRX5P7U8RlUDqxbv3SuebYgju23JZPm4o36U20YQZ8Lb73bdqm8
         6gS55uHpKZfWGfgcagYhN3tOYtCVapRfgVtKYouxrwqXo9WWk0N3L8WrCfI6vLIxgM/F
         9J1wpbtWTvrQh3ghWNaSoOkLPx5FwoJdSxieruPDo5nQw/8RG1xHQTuZb25JdhqBZII7
         YtV2R6tB84yhu4cvq08TMnIxG9k/hsfTg7CmXBBUMftvHQNNF58a4nRCadTx26uq2J3t
         NNzAYMXhG3quMqHzEUfKTRfxRVwdK7bPsNDrdTN6SylClH6xkZ6WEWYni5/4qFBsbBC/
         JEug==
X-Forwarded-Encrypted: i=1; AJvYcCVtUnmajP3PX+j6bNqRTfcUusHAc73EOfr7a8utLTMIqYFV27b72LtrXv4BpriseQCb6GJi17m7k2srPC4lH1dB0bqISgTiPGSMgikVaMU=
X-Gm-Message-State: AOJu0Yxsm8qdlzX/VcB9o+6qIcJb+iwVq61z/w4hTQmsPgfWfMRrbcEU
	X+Mz5QzJKD52yGunpPVvE4dgywjzks4MgsmKIidlehGOr2DUtlingZthyLZLlQ==
X-Google-Smtp-Source: AGHT+IEyErlVKa4W0ya0Sc5Wq++lv3i5FvJocOvOnmDPqOQacnYUmqjkLwwhgSiJi/90/URCqzfhhw==
X-Received: by 2002:a05:600c:358f:b0:415:4853:f722 with SMTP id p15-20020a05600c358f00b004154853f722mr5911567wmq.10.1712562238290;
        Mon, 08 Apr 2024 00:43:58 -0700 (PDT)
Message-ID: <dfa9e320-266a-49aa-8d90-5e0c63ab1db6@suse.com>
Date: Mon, 8 Apr 2024 09:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/9] x86/irq: tidy switch statement and address
 MISRA violation
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <d1bdd54b6751a047626b0271fff882484f98ea1a.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d1bdd54b6751a047626b0271fff882484f98ea1a.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> Remove unneded blank lines between switch clauses.

NAK for this part again.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2882,7 +2882,7 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p)
>  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>                                int type, struct msi_info *msi)
>  {
> -    int irq, pirq, ret;
> +    int irq = -1, pirq, ret;
>  
>      ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
>  
> @@ -2892,12 +2892,10 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>          if ( !msi->table_base )
>              msi->entry_nr = 1;
>          irq = index;
> -        if ( irq == -1 )
> -        {
> +        fallthrough;
>      case MAP_PIRQ_TYPE_MULTI_MSI:
> +        if( type == MAP_PIRQ_TYPE_MULTI_MSI || irq == -1 )
>              irq = create_irq(NUMA_NO_NODE, true);

It may seem small, but this extra comparison already is duplication I'd rather
see avoided. At the very least though you want to clarify in the description
whether the compiler manages to eliminate it again.

> -        }
> -
>          if ( irq < nr_irqs_gsi || irq >= nr_irqs )

Why would the blank line above here need removing?

Jan

