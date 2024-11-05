Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E172B9BD1D6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 17:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830453.1245458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8M9K-0003Op-Fq; Tue, 05 Nov 2024 16:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830453.1245458; Tue, 05 Nov 2024 16:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8M9K-0003Lz-Ch; Tue, 05 Nov 2024 16:11:22 +0000
Received: by outflank-mailman (input) for mailman id 830453;
 Tue, 05 Nov 2024 16:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8M9J-0003Lt-Oc
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 16:11:21 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969d6e2b-9b90-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 17:11:18 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso4764125f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 08:11:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d2bsm16562852f8f.16.2024.11.05.08.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 08:11:16 -0800 (PST)
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
X-Inumbo-ID: 969d6e2b-9b90-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2OWQ2ZTJiLTliOTAtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODIzMDc4LjMzOTY2MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730823077; x=1731427877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dDsZTdwLNXN9sK7w64+EFMk90/IQssB/kItDBouGE8=;
        b=Ybr7hhBGWWPSe6GjwYy5D71LKTKdKYF17iVLWPAdd5IEhvSWxoM5ef6p9GOnaxLjQd
         8iakog5UKY22y5qKmbYjydJc6tSDwaWOB7kDcUkFWoC5S19i5dctO2Y475nTccR/rzV4
         jN6v8KO5njAxrF1177elSzaOM06t3ibJ9Qm1Duie9XGYHRZjVw5CwwlXRF5fF1MJFVvx
         Ejtfx8/vWarjwjAdmp3peBsOd9k82SKnpWLwW1VU36WqCOvYccQ93ZjNTlB9SFh268UP
         wfnAF+AXXjhOxtOg5cxSc2n6rjicD6qoSQpPBs10zDJIAKduSnZdyrjCPLUpjUxBno5Z
         YULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823077; x=1731427877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dDsZTdwLNXN9sK7w64+EFMk90/IQssB/kItDBouGE8=;
        b=Stw7gNJgSw0q80hQIx+yEVcY5TvDe85SppMbYMpxpwv7l8L3QlFksuvi1b9RDXm4iq
         Ax79+Fo+bxPfxsUaBfRLv1CXLwKjXRwAwY8SCFmlBk2Kx2WwxFejUpNBWvL+CIif/YOi
         NNtzsYwTZJzhhViHFqRxgk66gRKahWajNZelGVYij8/kpQ0WNi0iGc7ROKNAoFhlNLSP
         XdCrTgP80Z4mSyaLbXdlvfZjjJqFaO7v7JK6HHo1ZYhB6qsazeGlAvM+d+mc3yRYPjdn
         uPc3Go6ixxf991h0dozJlm0NOC6SOi4I359OPdGSyARIrgVrPKSnwKGqN8akC7SV62tK
         2SUg==
X-Forwarded-Encrypted: i=1; AJvYcCU0pTTDq2WB7IwsEryjyGQuqH4WCoK3FWP+MPUvyJvwQugFBCw/Gc9ekB0F4bFE0G9vmP/gF8jrryw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1eejHZdBC6itVEnpVVGoRKAuiUPKBrpqwDfKbSSjgkCNxH0Kd
	8qV2MeuJVhDDmwItWf/iIlp0WZiQSXLy51gazgY4b12nXRogFAcyfdUqRnK/Iw==
X-Google-Smtp-Source: AGHT+IE0XplQRd+P4IfMFg/eN9Rek4zC/Ie6f3dkRtddD7kPbZnaQ9LZihiUgpw6j+y46jNPKxulFg==
X-Received: by 2002:a5d:64cb:0:b0:37d:51b7:5e08 with SMTP id ffacd0b85a97d-381c7a5ce0bmr15081500f8f.18.1730823077089;
        Tue, 05 Nov 2024 08:11:17 -0800 (PST)
Message-ID: <f14094fb-1312-42aa-b903-06f140c485b5@suse.com>
Date: Tue, 5 Nov 2024 17:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/13] xen: add cache coloring allocator for domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-10-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241025095014.42376-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 11:50, Carlo Nonato wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
>  enough. Setting this to a high value may cause boot failure, particularly if
>  the NMI watchdog is also enabled.
>  
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is available only when LLC coloring support is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +because its allocation policy is by definition incompatible with the generic
> +one. Since the Xen heap systems is not colored yet, we need to support the
> +coexistence of the two allocators for now. This parameter, which is optional
> +and for expert only, it's used to set the amount of memory reserved to the
> +buddy allocator.

Like for the options in patch 1, here I think you also want to make explicit
the dependency on CONFIG_LLC_COLORING.

> @@ -1945,6 +1960,155 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are grouped by LLC color in lists which are globally referred to as the
> + * color heap. Lists are populated in end_boot_allocator().
> + * After initialization there will be N lists where N is the number of
> + * available colors on the platform.
> + */
> +static struct page_list_head *__ro_after_init _color_heap;
> +#define color_heap(color) (&_color_heap[color])
> +
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_LLC_COLORING
> +#define domain_num_llc_colors(d) (d)->num_llc_colors
> +#define domain_llc_color(d, i)   (d)->llc_colors[i]

I'm uncertain whether Misra would insist on an outer pair of parentheses for
both of these.

Jan

