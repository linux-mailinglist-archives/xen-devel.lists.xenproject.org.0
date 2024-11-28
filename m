Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845909DB5D6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845252.1260709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbvZ-0007pz-Oo; Thu, 28 Nov 2024 10:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845252.1260709; Thu, 28 Nov 2024 10:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbvZ-0007nm-LZ; Thu, 28 Nov 2024 10:39:17 +0000
Received: by outflank-mailman (input) for mailman id 845252;
 Thu, 28 Nov 2024 10:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGbvX-0007ne-IL
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:39:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02035db4-ad75-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 11:39:13 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a742481aso5767875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:39:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f32589sm17928185e9.28.2024.11.28.02.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 02:39:12 -0800 (PST)
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
X-Inumbo-ID: 02035db4-ad75-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyMDM1ZGI0LWFkNzUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzkwMzUzLjAxNDg0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732790352; x=1733395152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8EqF2JxotVkoS9ms/T/52D679DisI4q5VE+kIpwmYqY=;
        b=W9X2f5b1g9NGTK+aQmGrFAT/vIFqWrj5xbGsoRIWhavhKeGMjYN26TVLCbbDPjZW7T
         rtcn3VtiMUX/yzEk5++tQyEKQRL6a3xt8qyet710j6L8I6gU62IfKXUFp2DPYXWnYw1F
         O+gIPf51sGL5PVOT9w9oRjB/CZKwSlR4pDbxdqkqhTXXouuKXkFV0gIFxzzpAuQkffzq
         h6dCRzFDO5/SusM3WI1lTxi8WahHpVsIgPQceid81+ASruHjhhPJOZVrZmjaiW7k45XF
         OQZGpvTdhj228SyH2b8hEF1g2/M3HT1sH8jxeQb/c0ghFKD7m6u9LAyQgG8Fftu98l7z
         zQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790352; x=1733395152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EqF2JxotVkoS9ms/T/52D679DisI4q5VE+kIpwmYqY=;
        b=fIq7O6nH/Po3ok2IzadU4n56Pm5tRYXzWEtS8ncdAPB83xZ6EfRG7KxgvMN5zlPmRK
         ptb3XkDQYDzz4ekoefxlReiEhNtzgL4gtXUq+bT/NSFLE4r+5gKQW5nSpe1sM1vY2X3w
         yWPLUZP3CSdkC0+HAbNtsU1a0x6jmUBf//Y4A6/gI2KPDipiXEk0ZJ6yGLUdy1UIpOIW
         zMEknkRmqkqMnOVwXPmEWQumuSL1jSfdTIbbq2fhrQDRlf/xF49ayCYhgbsfRsoc6tLE
         wvjXYtuj0oSpAEP6SGHtU2oElQm1SGm5bFAuGRuKdcmBF9lmTREXEfUyHykTa7lqO6rf
         qj1A==
X-Forwarded-Encrypted: i=1; AJvYcCVkuskdTfnJETOUKqxYpiMZINdoXsml2yoeO4ouMV7rH+3+Y5T4aQen987Nk1lR4Dmhi02e3euidzo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqTkqL2jgxySO9tH/2T5Ij/YNl2kzFwqZhvHpT7Ez1jFcbFY4n
	uJ0Tel0WzKzDTZKxDtqw69L8iJ4VS/HUFSWWr+IW2CvFCjNuvLR8xDCkCL7DEg==
X-Gm-Gg: ASbGncsrvo2ZR/dylcmnZ2q/FUpPAiGMa+fzaOOEJTXbSLe96Wf2YI17iq1tvCo4SgK
	8SgJS5Bo54j/05+l5l/DSLLrFVBsnmKs57H9omtr7lczcfGqJ6kHNewiUi9kQgonACKRzsFbFMs
	gt0wyMqtPn85TiS8d1cmab9/Dc36s4PSjqji1hNE7TTPYJpfGU/uUfwGO2h0F4OoRXbsUdjHYMx
	gbqLfxY53qcZ3ssNqK9s/Z3rKGenNFf14Xza9UpZEfWoj1ccuc42Biu48nFPn/+JdlYkgMuOSof
	b5J0qt1dqBgTFZiNBcHQEBhYBtaqm2NNfmY=
X-Google-Smtp-Source: AGHT+IFE/ovFP5yEZ33EZTFQxXfQxQSLNpTRNsyGINWOkCFy5bwXIm6IPhFWs16w6jRpcA9+WMlA3A==
X-Received: by 2002:a05:600c:154d:b0:434:a555:d0d with SMTP id 5b1f17b1804b1-434a9e0e21dmr54714745e9.29.1732790352326;
        Thu, 28 Nov 2024 02:39:12 -0800 (PST)
Message-ID: <3f660598-d18b-42f6-a134-097f64f47253@suse.com>
Date: Thu, 28 Nov 2024 11:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241119141329.44221-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 15:13, Carlo Nonato wrote:
> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2024, Minerva Systems SRL
> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__

This certainly wants LLC in the identifier, and likely also XEN.

Jan

