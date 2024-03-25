Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32C889818
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697631.1088578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogcB-0006fM-1e; Mon, 25 Mar 2024 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697631.1088578; Mon, 25 Mar 2024 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogcA-0006dr-Ur; Mon, 25 Mar 2024 09:27:34 +0000
Received: by outflank-mailman (input) for mailman id 697631;
 Mon, 25 Mar 2024 09:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rogc9-0006di-HG
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:27:33 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7b5a8db-ea89-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 10:27:31 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so5045717a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:27:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v17-20020aa7d9d1000000b00569aed32c32sm2786770eds.75.2024.03.25.02.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:27:30 -0700 (PDT)
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
X-Inumbo-ID: e7b5a8db-ea89-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711358851; x=1711963651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5v05DNnxs6PLE79qJAwhDX8JtgpYeGz+J8/mIxNXFI=;
        b=MFwjzeAN+pk/aM1kBDBLfRm8VVd9W09IzAlnK6ffmp+Q1R2YEaVxyQsCRgJxXUW8yM
         +Gj7xmML+0MZwg6dHH9izDvaFQyIcXSrs8tBUB5UYt/ICOWBWSRmn+x9pAbuN8kOeztw
         tEDrJ5DKXc7gED+hvvNgPyQIzCB2bu++8dPJm32YBHv6qNm1FvBx69jsLlRIfGTB5lpw
         VH0kjqgqhLjglB6t5yxC1iIHUqlkwwd0eLyqIM7OkN1mwh2Dlrxzg4s5zPGKsrAsNW13
         XXbD5CSvJeTugFMkJm3p4mzAzTCihKJuUN4BWlVTxQJ3cz5PxaSNJr6HO4aDuaJztUAf
         rYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358851; x=1711963651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5v05DNnxs6PLE79qJAwhDX8JtgpYeGz+J8/mIxNXFI=;
        b=sazFy+TAhExWeB7B6U4OnwlTXQ6IHhKgSFGYql4v537mVD3+/SqJInYILoOBtqYAAA
         kX4y0dkHvsSC3ZHgDU//XK2bYGAKXXqmi+B0dUIaFP+yaLsgEcxHDK68XQ4NmV99HIJh
         fa3w7GfCoFgRFO2h8aBbs2Sgt+dOPVve/T1OVFbZhBg6GH1JMVLVOjWaMzmlu4yDWO5A
         AI+rW9ZDzneCK0B54ZaRQoRpaVBHZOssH+6YbD8aSTw4tDVzVnfjfA2oIedwJZrc+JAg
         0V1p8lZRUrqFCgfk64puZy48vbBe8asTTx+mzhtM35hlZtKlxI41TqO8+hI1N19P5lWr
         L8lg==
X-Forwarded-Encrypted: i=1; AJvYcCWepX8ROZvoQYBpdSU0Ozk8pMSp8JE9XS4sF5QDUzt7SgJKoT6t3uRb4z1D+JDBrXWCEIFQWQ7gtYnL8qB+o32QTmTVxiV0pE+s54pJ08o=
X-Gm-Message-State: AOJu0YxBOKyyoCO+GfZYva9YmG2N74T3T1Br8DWN+7kvEUTeD26iKXxl
	EYkO+cVz7sPe+68Jrw/BTOdxZGJhIu7d0e4FZa46D4saCZKoBB57MsD3Mwf8QQ==
X-Google-Smtp-Source: AGHT+IHvMZtZuTL0Y7mjYyTzcbjiT0EUH8mHymiXHH2eqXMZgcb6Gn2Suh2Wx12+kleHh3Ry1hHpeA==
X-Received: by 2002:a50:c316:0:b0:56b:b0aa:5103 with SMTP id a22-20020a50c316000000b0056bb0aa5103mr3886006edb.5.1711358851093;
        Mon, 25 Mar 2024 02:27:31 -0700 (PDT)
Message-ID: <e013539a-b199-4e0f-90c7-835c9774fe17@suse.com>
Date: Mon, 25 Mar 2024 10:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/11] xen/page_alloc: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <ead692e7a9f7f21ae54448073af8b64a40f2ddfe.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <ead692e7a9f7f21ae54448073af8b64a40f2ddfe.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,7 +150,7 @@
>  #include <asm/paging.h>
>  #else
>  #define p2m_pod_offline_or_broken_hit(pg) 0

Seeing this in context: Does Misra also have a rule demanding evaluation
of macro arguments?

> -#define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
> +#define p2m_pod_offline_or_broken_replace(pg) BUG_ON((pg) != NULL)

Or easier

#define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg)

?

Jan



