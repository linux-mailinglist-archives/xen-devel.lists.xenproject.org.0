Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316179DFDD6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846487.1261651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI38z-0003M6-1f; Mon, 02 Dec 2024 09:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846487.1261651; Mon, 02 Dec 2024 09:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI38y-0003Kd-VD; Mon, 02 Dec 2024 09:55:04 +0000
Received: by outflank-mailman (input) for mailman id 846487;
 Mon, 02 Dec 2024 09:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI38x-0003KX-By
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:55:03 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1b726b-b093-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:54:59 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa545dc7105so640074666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:54:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e63b8sm494046266b.123.2024.12.02.01.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:54:58 -0800 (PST)
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
X-Inumbo-ID: 7e1b726b-b093-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdlMWI3MjZiLWIwOTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMzMjk5LjYwMjIwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733133299; x=1733738099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZK2qZfdEmLMjT4c1bLV/XnCJB4xOa3Dj0kZfp4EIfU=;
        b=DqTcuUnVWYFT/bGEdy+A4U5JyudVc47rfXKvvMiLNHp4aY7xasLreJgMdu5zHSxEHk
         Hb0CORRp0ZYfP+udX5raUCrpMKJ/ZfdezyRUPFseNdc1m+8jHz7MizOHlriE7pwYkhNl
         Rl9Vbp7ki+9w+uMQHtAc1jOWzluGMMl9n+qK0BdlUiqDxLlqygtwdo5FjuEGBocFROJ+
         ZuuX+jof9XDhAxrIpHpbY1MlV8+XF52WGz3F3KLWHR43uI3KE6MjofyleKqZWBHXdx4m
         lw5f6T53PtHgYmJ1YU8ub0HtmUqdZK0/G0zRvvfNkJ5zzUz1q7uf7zHTPjAJ80UH8RqB
         vQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133299; x=1733738099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZK2qZfdEmLMjT4c1bLV/XnCJB4xOa3Dj0kZfp4EIfU=;
        b=lxGm+gM8sHphMB55tKhpm3RtsDsgpHqTXg14sELx7thwOa51nJ9vwTp1igMRe/0Vfe
         gJ8IgRzhtqlSLXEiMLacJqrQKMPB4P6ViPwuaMAnjiQrIn5u6QpwnzJX4iNHDPD385dU
         jVu/LuRkybiKt7nOCC/6tIjNnQt9mqx32zYRuX7gdsnIOzIbImefxSDm4Lah3lKAUCYj
         0Mo+k2NIkH33hArJxdUe4Ei8ldzVPtvVh79EFWeKaz3//xeHs6qBXdWo10XJJvyyDh5S
         1g825YO9gDXBk5NoUYpLoCL/itfQY0XI4okeUPSEDo1rrvuHuqcPWZ2/kfRxorFQf4+o
         Umyg==
X-Forwarded-Encrypted: i=1; AJvYcCXTt11JA1LcNcJgRIJRHdVcTEZxicySeMw9RexbFREq4UZMP4jp03r8rVMsQrdJtW2RmRyHnJtxdbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd6h14WC2BGkyF7lRJpR0/l7nVJpMxF2hftF5WTLahB3hKJ7H1
	RHqTPSPy0n0jQOMVJBVhBnUsF2g2H4dR923SXPSIf0h6Uca9SqEhJfL8SxVczBIiK5opswYjYMg
	=
X-Gm-Gg: ASbGncuBjjHbBxuDG0gFzP5dfKZ0rGhZmuAhO+Si18/NnyC/hZCunDiQJgsa/OOWWEd
	l3+AJ9gXG/aCma7ihatVsNj+T7NaO8LHHHgC5Uq9ojSmDY9rtlSLc1aUQTfE75B948yeuH/gbYV
	0a9L1yatf3BtAthJrFmxJHTy/611AMD+FsjOtJbwt5TC2KGwrrjA/IGb2LRGlSaAjsyagbo06W/
	V+NjWgQ/ANgSsnANE3zLgG+XB8io9vcMQPZw/qHW8jWtvCBz/0AD5joxtw9phVuJvBBH5XQaEV6
	rhd2w203Jsvegq4c6aJidvt+/n/Ptovxhqo=
X-Google-Smtp-Source: AGHT+IHXo7HZ9Y+0GIFiPZxjMQeKw9kOm5Oy6FYJ8yS/lGo+P0pDukWKbfw9we7f558liDlA89y8Dg==
X-Received: by 2002:a17:906:3147:b0:a99:5f16:3539 with SMTP id a640c23a62f3a-aa580b3188emr1782042766b.0.1733133299031;
        Mon, 02 Dec 2024 01:54:59 -0800 (PST)
Message-ID: <7ca79382-251c-403a-9d1c-9afd778bb203@suse.com>
Date: Mon, 2 Dec 2024 10:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
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
In-Reply-To: <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 18:52, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +#include <xen/err.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/rangeset.h> /* required for asm/setup.h */
> 
> Should asm/setup.h just be changed?

Why would it need changing (and why's that #include needed)? It has a
proper forward decl of the struct tag, and I can't see why it would need
anything else.

Jan

