Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747C81B373
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658759.1028101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGDY-00040x-Mn; Thu, 21 Dec 2023 10:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658759.1028101; Thu, 21 Dec 2023 10:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGDY-0003yH-JM; Thu, 21 Dec 2023 10:23:52 +0000
Received: by outflank-mailman (input) for mailman id 658759;
 Thu, 21 Dec 2023 10:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGGDX-0003x3-LW
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:23:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0891f3b5-9feb-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 11:23:50 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3367a304091so544142f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:23:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4d82000000b003366224319csm1695716wru.53.2023.12.21.02.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:23:49 -0800 (PST)
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
X-Inumbo-ID: 0891f3b5-9feb-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703154230; x=1703759030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rll7w/ylB4mbAaGMLCIq8LJO2ulEQT9zrPbAbxvdH1U=;
        b=bcPxgdIIQMXKzKii6R9wYC3y56HUSpKk8jgftlRbW+9sHTGBK26KCNTcNjxvm5F2y9
         FfjMbgrZI+wpQEAET7p5+6n/bOaaLs9/i78i7CNVIHFOfdK4NqxQ4ZgRhFA2jwiT9EY4
         BM7C5jAu9HoDDns9AuhCE4uKhp/OGzCkEfy04pAAEVsBqzEscP7O2VnBTi2aPv+lOt/2
         t0w8D3LlpMmGKXarKoAqQ7k4qPZPQkgLNkxOfj6/UJEN6mUyAW4CHz2SC3Pare6+gxjn
         vo+khB7POeF1iRnbWNALxVkHWf23rcavwKteFMM/cTzLTW06ct8K0JJS3Nm5R4q3xAUE
         ISBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154230; x=1703759030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rll7w/ylB4mbAaGMLCIq8LJO2ulEQT9zrPbAbxvdH1U=;
        b=t966D9vZT9XINSDcPrtn6dmvtq+zgHWVcIVWnoaOQ5hZ8oGB/23tjTKKN3l8qW5Pgn
         AN+YiBXTJMBq0e1+sTwiQJQjTZLnxt66jRZDoKc8MGWJtuRbv7cchpkN00yQUXfMVuNi
         uLBknZAXfcvZDzjFCA9IUm80U+2JugrUtc+CMM/+B8oiRJucWBeoMm9ZDt+4yIZPW4E0
         pGYfjwYvseUEQZ/3dPeLy0m0Z1o7ttlIaLvV6yA8k37WdR2yZU/QgZ+bNHkcofuuhNyn
         OXL3AZh5EQOGza1OQ95tFGLhOBLd6MkrQrt4V8wMtTJSH3mmZEZpfEtsRGjpK8M6tApI
         SEvQ==
X-Gm-Message-State: AOJu0Yw9/+jjgOj3WZIFb9A5/IMHNT+hSlMw1HKluEenOYlkRQFTgd0+
	CKTu/UzJatjhpN6WKAOe57xb
X-Google-Smtp-Source: AGHT+IH5JnK1c0pnKaywxvQsSFdWNoCh0tDDllemFK2B8Z4xRo0G8/4l3DOYM55esruvF6dNWoXP1A==
X-Received: by 2002:a05:6000:18cd:b0:336:841c:c358 with SMTP id w13-20020a05600018cd00b00336841cc358mr368017wrq.155.1703154230089;
        Thu, 21 Dec 2023 02:23:50 -0800 (PST)
Message-ID: <c4c1d007-1c38-495d-9f1c-ee7e679f57ce@suse.com>
Date: Thu, 21 Dec 2023 11:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/iommu: add CHANGELOG entry for hwdom setup time
 improvements
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20231220134346.22430-1-roger.pau@citrix.com>
 <20231221101244.25650-1-roger.pau@citrix.com>
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
In-Reply-To: <20231221101244.25650-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 11:12, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5ee5d41fc933..52484c047bd1 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>   - Changed flexible array definitions in public I/O interface headers to not
>     use "1" as the number of array elements.
> + - On x86:
> +   - Reduce IOMMU setup time for hardware domain.
>  
>  ### Added
>   - On x86:

I'm a little puzzled: Isn't this more like patch 7/6 of the v4 series
(or possibly patch 5.5/6), which hasn't gone in yet?

Jan

