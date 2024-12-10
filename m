Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729F9EADFE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852018.1265949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxXL-00019T-LX; Tue, 10 Dec 2024 10:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852018.1265949; Tue, 10 Dec 2024 10:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxXL-00017R-I4; Tue, 10 Dec 2024 10:32:15 +0000
Received: by outflank-mailman (input) for mailman id 852018;
 Tue, 10 Dec 2024 10:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKxXJ-00017J-MJ
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:32:13 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 047e52df-b6e2-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 11:32:12 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43618283d48so1628475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 02:32:12 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386257de681sm15319206f8f.30.2024.12.10.02.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 02:32:11 -0800 (PST)
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
X-Inumbo-ID: 047e52df-b6e2-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733826732; x=1734431532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wrsaL8lPzdJBljcZkobWdtbfzHFiATXp4JkNcdUAd8A=;
        b=KtczgWFzdwh1tmQNcDNKsahViWV/OChoAci9zSkZlaTxNGuZa+54Hz1JZnF15ksPTj
         FIUi+s+POxq/QjcPEwUlueizc6QBTfZ83M+u6QFLjvAXFdUDbRcLBWD1U0EflM6myPka
         JHzuxS6/RX7zhGA4w3dAmuR7HhGZB8TvXOPSbjU94aNJvCQQPp82HIItzM79mEQ3SOAr
         kt1u5VAwchf9GGjHUSBXO6fBcvKQioaKXw2v3umuAxdre43zJ7wJKBDf1GgikWui+Cff
         VtYScG1O5uIZvoL5UAB5JKAnTGI/nCHuia/RLLUXA1YXlPshbBWflXF2P9CeYX/D3+NR
         +6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733826732; x=1734431532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrsaL8lPzdJBljcZkobWdtbfzHFiATXp4JkNcdUAd8A=;
        b=SosWicGWISqn63EQ7pP+S+zOwbVv9pmdZTJ9Gi8pF/o3LfE6StC9bCS9KcrbZeTOms
         78vTWC4FllhekMskZq3dL8xvp+FPf/qJijenK8EoKHDmibxAOASqyqcr7T0Jdd/QrJVg
         iBMqBdI0y7uOX9h8Lf2ynKnuWUgZD/k8y+oRUk/K/OXfkugYdz4uD/IJZgjU4okyrsC7
         ygCt2Pj7Vo+ffl2bxiYfUyLAN8rIPsucVkShQFnZUh8K3BukB35pRa6SrUEzirwrXCuS
         qgdbykFKPk/Zdo4iu0pJc2fHuIM/c1d4EB327vHbtdMOYIeKmUvhFDOMUi1bcWWh89gX
         p/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp3ceda5Je0nKkYip34KM+FggYE1eUeBdjPljfmC0jZw0SPbLpFpVT/HdnjkYnG5+fYk3xpOrMNyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0/TbiXOEzHZrwawrJEZyMVT01vPsDfJ0cEngNfxeOah07UDzZ
	Fd/aVoOll30JEXbKj21Fb0Cb7bxPGJD48YtQyQrX9WuAs943J4sz29eX8ahD2w==
X-Gm-Gg: ASbGncvlEeLgj/0CRd0d8LKL4CrWUZQ33ggjsdjZG6JXqjRFDPADErI/k2rDg0raLfT
	Rd5JbyqPHsOvB3C2t2Wlab199s+Cqlt5y22M3hLLWoKZeqv/xokV8GLRSS4v2+TeCKMZeuaseCZ
	E6fdWdnC8fLHubjAfJfkxP0TGDfJVr23tkV1lNNpwbKUUwi2D58OWTBGR/WD9GIjVN6T9woz6xB
	+xIK0tWrsIj7lo3m//q1SilPyzF+0tkIHbrTxHBLwxsynHh9aK7ik5dEj1oL79gaNBQ8VK7HRPe
	DHaXs9y/kssgdn1V2hZe502v+e9+7UOyZ5dWfEolzCWR3nHuf4DKc1+IFgqkFPjb7i1PcQBozM0
	UafQ3Nn9HsA==
X-Google-Smtp-Source: AGHT+IHqTWTgBSfA6rJVH6up5w7JiHh4p33WXWoKym+rcgwNTN/gnpuH43b/xfXQFyBcLrIbn4gVoQ==
X-Received: by 2002:a05:6000:1ac9:b0:385:e429:e59e with SMTP id ffacd0b85a97d-3862b3e5ffcmr10879417f8f.52.1733826732178;
        Tue, 10 Dec 2024 02:32:12 -0800 (PST)
Message-ID: <7f74b7a9-1869-4efa-a213-04d56ba48fb1@suse.com>
Date: Tue, 10 Dec 2024 11:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/boot: Use header to allows inclusion of public
 xen.h header
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241122093358.478774-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.11.2024 10:33, Frediano Ziglio wrote:
> This allows to include other headers and avoid duplicated declarations.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Again it's left unclear what the purpose / goal is.

> --- /dev/null
> +++ b/xen/arch/x86/include/boot/public/xen.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* This header allows the inclusion of public xen.h */
> +
> +#ifndef BOOT__PUBLIC__XEN_H
> +#define BOOT__PUBLIC__XEN_H
> +
> +#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ != 1
> +#error Unexpected defines
> +#endif

What is this to guard against? We're in the Xen tree, building Xen.

> +#include <xen/types.h>
> +
> +#ifdef __i386__
> +
> +# define __XEN_TOOLS__ 1
> +# undef __XEN__
> +# include <public/arch-x86/xen.h>
> +# define __XEN__ 1
> +# undef __XEN_TOOLS__

Why would __XEN__ need un-defining and __XEN_TOOLS__ (seemingly wrongly)
need defining? (As an aside, I don't think the expansion of either macro
really matters. IOW I don#t see the need for the two 1-s.)

Jan

