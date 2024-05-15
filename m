Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6D8C6A16
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722545.1126620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7H2N-00084X-1K; Wed, 15 May 2024 15:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722545.1126620; Wed, 15 May 2024 15:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7H2M-00081N-UN; Wed, 15 May 2024 15:59:26 +0000
Received: by outflank-mailman (input) for mailman id 722545;
 Wed, 15 May 2024 15:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7H2L-0007zS-FM
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:59:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e02180-12d4-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:59:23 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso197825266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:59:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17870sm871813566b.216.2024.05.15.08.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:59:22 -0700 (PDT)
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
X-Inumbo-ID: 18e02180-12d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715788763; x=1716393563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCcAy8OcZ4luyl8LZClZRMMbTK0tl1r5Psh2m0WNWzU=;
        b=hDntHQUWKoDVEpNqGKjAzParQoDKoxLrijO4C2KsiMzDzNBndS8Cgps9tPFfCJZEQA
         EaKVxc3kP8j7eip6O4mn3Wj9ep9z8OYZRyGUpqC5mqdybDDcICtRCpdrf0zlqV1Sb4Ml
         qtYTBVXs5qzuAt8hkMVymkk8Bi1obqP/dhJlrEq+0+PgXmJ1QU3zhbWFSmGC5kqr29Qu
         lTNf6/gqiVZeFjd4xYF6vez+T2f9H7x2YIvP1KKsIROam8P8CxefIUV37cS6VtO2Z3bn
         erUd3Pv8NeeYrKvCREoVBgjDAbw/uxVufEHXDBEuDYNRtTci5jlg9lJyj8SRWUQ7+kRU
         UncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715788763; x=1716393563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCcAy8OcZ4luyl8LZClZRMMbTK0tl1r5Psh2m0WNWzU=;
        b=NL/XZBsYxrLBX2+N7YLZicZ9C2EjgZOoXTaGMKCUTgf96CliWghZtyjBKNkZRHFflT
         Zc9wDerhCFTSBcDgC+ikVgA0OU3sUNzB5jCXh+OSnugUte7OLL1Vn4g78Fgc3rAY5XGD
         O7clzvejH6AbQThDnWv/ZBz14v6/DysBmLtv5XvkR3GHWcZNldZ8llT3jXbbJH/tR+yJ
         7Oe5kJ2vMzEyAkNq4l5TUto4xzjstKBQ4K2ryc+47h4ZEw4KXtd4rFNrbLTEmcO823Ct
         9vRACYupRgXtbEpM1ExnCRtya/VM2JN44dXBsGYSfZCqkgkZ1V69BPQbBaFXQhbCcqYH
         Z/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUrqh25GXsJgwEEzw9plksAP0TeL3KTRtLhjc7tH3ugGbD6AoIZnhbQj8pYsM99DZT6hMBCjBGkOs+e/hKA6Uvh2XzEeK3wDQsQGD+n9SE=
X-Gm-Message-State: AOJu0Yz4HMTddnYRHcoe3jdyvISdNckqSH1dJLM/Dq7yo4iMnnhNDeST
	CJWthW1vmA7W3YnZaV1ni7c0agHPyGZ3CSGLXZZh+Fr5FmYdaU1RzzC6cuOJcA==
X-Google-Smtp-Source: AGHT+IFZonrQnUx4F9nz1NYGj3AeOvBlLeQ69rctvJVQJz2D3ovvy0l1M+pBwBk1YlQCjM9mqS4xVw==
X-Received: by 2002:a17:907:980d:b0:a5a:5496:3c76 with SMTP id a640c23a62f3a-a5a54963cdfmr1092765466b.6.1715788762767;
        Wed, 15 May 2024 08:59:22 -0700 (PDT)
Message-ID: <e3e75469-c356-4a02-a3aa-a9f3d277fdb1@suse.com>
Date: Wed, 15 May 2024 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 13/19] x86/setup: Do not create valid mappings
 when directmap=no
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-14-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-14-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Create empty mappings in the second e820 pass. Also, destroy existing
> direct map mappings created in the first pass.
> 
> To make xenheap pages visible in guests, it is necessary to create empty
> L3 tables in the direct map even when directmap=no, since guest cr3s
> copy idle domain's L4 entries, which means they will share mappings in
> the direct map if we pre-populate idle domain's L4 entries and L3
> tables. A helper is introduced for this.

Hmm. On one hand this may reduce memory consumption some, when large
ranges of MFNs aren't allocated as Xen heap pages. Otoh this increases
memory needs when Xen heap pages actually need mapping. I wonder whether
the (presumably less intrusive) change of merely altering permissions
from PAGE_HYPERVISOR to _PAGE_NONE|MAP_SMALL_PAGES wouldn't be better.

> Also, after the direct map is actually gone, we need to stop updating
> the direct map in update_xen_mappings().

What is this about? You only alter setup.c here.

Jan

