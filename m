Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A747F8B0315
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711169.1110938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWyB-0001LB-JE; Wed, 24 Apr 2024 07:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711169.1110938; Wed, 24 Apr 2024 07:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWyB-0001Ja-G2; Wed, 24 Apr 2024 07:23:07 +0000
Received: by outflank-mailman (input) for mailman id 711169;
 Wed, 24 Apr 2024 07:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWy9-0001JP-LG
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:23:05 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce86552-020b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:23:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so2651915f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:23:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b7-20020adff907000000b0034b3394f0e1sm5896840wrr.10.2024.04.24.00.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:23:02 -0700 (PDT)
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
X-Inumbo-ID: 7ce86552-020b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943383; x=1714548183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXj9ij93UfOVIuQNJp0HSrxSpaB1WyARb2HDAKq/r5U=;
        b=JAmaGdnbtwDqEhj1/wWLgbmql+Mf8nxcAvIe61ESqq2ZXmuKGUpThEWoQy4+hYd0Kx
         xlYcq6892sQ15PmMA5IgC2kXHQsMTB5Pj6PKdQGMAGz/FZhublaKXR5BW3o6bDwvJYv9
         Qtolas1HrOrd0EFZHgsx4W6iQj2X5ARj235rk5Hoqq8MH7iRnm2lMG40BRJj6nsa+nxn
         7ugvYkOgau3mzJEkR4+JSrHiDHh4lOnhTToyPxqj6FXkqKv0GrnYcF11KLibM7ss+q3Z
         1jqf0ONtVtB2GKUNUu0/IRhsVcYYK4+Bc1ggkSx9hGzNpG2lxiHaRrl2AzuLdQuAsLzD
         7pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943383; x=1714548183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXj9ij93UfOVIuQNJp0HSrxSpaB1WyARb2HDAKq/r5U=;
        b=dxNLEqC+IjXt5r/HAsOIm2zIoiAtOvma6cK21hK0U3R1C+061rK8dY/Oh5TM35gf13
         p7U6FRkR3/4f9RXTvLxzK7ldMSDV4nYsip6880EALsi8tIhI8aQtJ/Xo49F41UlZYyGn
         yfOOEO+om317raN0gZDojDc+MDnFqbHGYRW9JUMnAeCqCxLwu8nMKVcfMKraPJO1nrLy
         r/n8/TeaMYubuTSw/6A3jraAljPp0uA37jfhLmk21ktwrMt/xmpweJ2tNcRAmRsWrfmL
         QY5+G0LL/4JD6YnFfoMzlLfQtZDJe6XL8g2/dnImh/i1XfoHHcFjHZ/7SdjkvK1VRWNJ
         1Sig==
X-Forwarded-Encrypted: i=1; AJvYcCWDmiwqkP/1Covyj35zdJCJswCBPvxyKX4ZugrPA2sLyWw9K6Hws9LFxeLqjLJTBPGoIECgWhELI/fafAlQU0VYyBAcPx1B1RThtDXQrmc=
X-Gm-Message-State: AOJu0YwGZE7pSSP8bvJjEiovy2apxdri2iZ45LVIB5Upk/9ZaNuNFZ13
	fM7s6FL48B0Xb8zoFzg7cLKH1l1OjPzi0dZpPKLHI1Tvg+IXYtWuD+A38xrOMw==
X-Google-Smtp-Source: AGHT+IETP0NXuYBFJyPjsrUv5vszT6JbIuB4chl02hd+FvcmHWc4Ex6R8Qc9DkYFvbLvvObP2HieYg==
X-Received: by 2002:a5d:525c:0:b0:34a:beb3:f6dc with SMTP id k28-20020a5d525c000000b0034abeb3f6dcmr1379622wrc.2.1713943383184;
        Wed, 24 Apr 2024 00:23:03 -0700 (PDT)
Message-ID: <509a6c09-85e7-4854-b7dc-116cde022b26@suse.com>
Date: Wed, 24 Apr 2024 09:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/10] drivers: char: address violation of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <a5e4472b91398b7f9e802ea82c8435fa8ad27066.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <a5e4472b91398b7f9e802ea82c8435fa8ad27066.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -48,8 +48,9 @@
>  /* System configuration register */
>  #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
>  
> -#define omap_read(uart, off)       readl((uart)->regs + (off<<REG_SHIFT))
> -#define omap_write(uart, off, val) writel((val), (uart)->regs + (off<<REG_SHIFT))
> +#define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
> +#define omap_write(uart, off, val) writel((val), (uart)->regs + \

Would have been nice to drop the excess parentheses at the same time.

Jan

