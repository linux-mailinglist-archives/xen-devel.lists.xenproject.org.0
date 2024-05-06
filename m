Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704E8BCD48
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717593.1119954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3x2Q-0005GC-Ic; Mon, 06 May 2024 12:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717593.1119954; Mon, 06 May 2024 12:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3x2Q-0005Dp-FK; Mon, 06 May 2024 12:01:46 +0000
Received: by outflank-mailman (input) for mailman id 717593;
 Mon, 06 May 2024 12:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3x2O-0005Dj-UD
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:01:44 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67506f42-0ba0-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 14:01:42 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e8so11004215e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:01:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e14-20020adfe38e000000b0034eba48cd17sm5804009wrm.117.2024.05.06.05.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:01:42 -0700 (PDT)
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
X-Inumbo-ID: 67506f42-0ba0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714996902; x=1715601702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wn9f2TTvLG3kyrz8hnqjPXnNRo322gO541SYHGNn/VU=;
        b=OuyQ+16KWlo0qX/z+RMJkfqE5EfW6hXJWr7ZOon929dM0Cgv++5Md9Hq9ABT1sFs7T
         jZ4rkA080+0G4dyVVPL+7Fg+IEqTgNLmO4dfy3M0m0JFhKrCL9fuO+S7sfErb3pnvY8T
         jwUYkFfOQjdzHZX4iINNHgkrtWhf1ZGciwAaJjhb2u1nO4F49gIx9rBcydxmsBCrXPyv
         I+ACQ1XGbBCj3Si9KIu7S50xNBDDraRu6ppfQR3UtaL8dzRlyZJv84NS+vOQfO19NS2N
         LNCKOf0aYoa9ZBPGF9lmnHhZCmZg2gi6ScqUmHkN1J+jdgbiBhG6nV9cbaqvquaK8hYr
         tooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714996902; x=1715601702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wn9f2TTvLG3kyrz8hnqjPXnNRo322gO541SYHGNn/VU=;
        b=XfYW4FNIgCDS9P+jue1OTn8QYJG1geSkMcR+7tmf7nozcVAnSg1raLW6Hv6zSwr5i/
         2Jt9+iLKHFCHZ2jGHIP4AbeGeX9RE6sKtzV8avTiUuIv0UOwnPAZKQThxdXQA+YLjK7J
         VWTLvCPiAW+OA6DPTYjuqiuc4d8GN9gfSTsc6GvvmYsaHGSM+/L/QMNU6Z4l6RQOtgVe
         k14eM41cCtm9SbFquFk1gCJGTWT9ra6catckP0DqjVXYjcJgL+43zu50YtBZ2nPAppoi
         l2ff7MXvm3mnsneITlebIIArmzVp1FTOK7OE2lnrz8jorT5gmdGyPsrFGKN3ovpn3c3N
         H9wg==
X-Forwarded-Encrypted: i=1; AJvYcCUaxvB8G+jxBSdoMOFkUqztCPzq10acvAdZlk1SgV8fQLyvzUP8jOmgUgQ0XGUqmX/UBSAGwFvfJ7F9AcNuX0I/uv7f1Ik4utp7qYyGpfc=
X-Gm-Message-State: AOJu0Yy3zgYO+uG6rEiS5Xc3s+V5MzURPQd7WV+4hbV4tw5w+x+W/79I
	CwxTdPCRC8mChxgFTbZR/1D0e5YWb7T+Qx/Npdk8jT2mY1XgMv8Q1/IxpJ3kGw==
X-Google-Smtp-Source: AGHT+IHbcN2efsltGEzBrytA6ECwgsHScr6/ca0HcKPzaGq9thQFa7/O+xzlLQEFc8o5DTWGOaUNxw==
X-Received: by 2002:a5d:4f09:0:b0:34d:8c1f:3194 with SMTP id c9-20020a5d4f09000000b0034d8c1f3194mr6694080wru.35.1714996902417;
        Mon, 06 May 2024 05:01:42 -0700 (PDT)
Message-ID: <8fbd50df-6c9a-4177-8001-39c0f15e715e@suse.com>
Date: Mon, 6 May 2024 14:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/13] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-5-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> Add a command line parameter to allow the user to set the coloring
> configuration for Dom0.
> A common configuration syntax for cache colors is introduced and
> documented.
> Take the opportunity to also add:
>  - default configuration notion.
>  - function to check well-formed configurations.
> 
> Direct mapping Dom0 isn't possible when coloring is enabled, so
> CDF_directmap flag is removed when creating it.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> v8:
> - added bound check on dom0_num_colors
> - default colors array set just once
> v7:
> - parse_color_config() doesn't accept leading/trailing commas anymore
> - removed alloc_colors() helper
> v6:
> - moved domain_llc_coloring_free() in this patch

... I'm having trouble seeing why this was done: Dom0 isn't ever cleaned up
after, is it?

Jan

