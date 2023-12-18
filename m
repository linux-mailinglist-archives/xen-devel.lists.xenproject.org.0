Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34200817535
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656150.1024162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFXj-0006q6-SF; Mon, 18 Dec 2023 15:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656150.1024162; Mon, 18 Dec 2023 15:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFXj-0006nF-O9; Mon, 18 Dec 2023 15:28:31 +0000
Received: by outflank-mailman (input) for mailman id 656150;
 Mon, 18 Dec 2023 15:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFFXi-0006n9-1b
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:28:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1754843e-9dba-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:28:27 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d190044c5so12110645e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:28:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh15-20020a05600c3d0f00b0040b4ccdcffbsm43708967wmb.2.2023.12.18.07.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:28:27 -0800 (PST)
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
X-Inumbo-ID: 1754843e-9dba-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702913307; x=1703518107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bb538l1cplwls0pdfdQNLvJxmZ7uqWXDjusq2ozBKH4=;
        b=RcK4SEJoyJvDQDDcIVA0Z5sjhL5yLgdo/VOlwyqX6TqD+x9v5P02oCulic9yL0eBGm
         Kg1LaGSEp/WwDQ3zcVMiR/5jicgIqSsdOOU4p/Y2x6429UC8AU13pl/E5v826ThsETel
         BRvMIs55HrdFosfKSZLmJTTnkw2j1c5fUhbVm9ve33+eCTyFvkI38+dJEnEyWhPn+rnZ
         J+UCTbJwMlS5UHxjhvIwxT7oj0fpkJWHVaYtThto90pb4hPuzxcJipFiQsFAsiXGF8qc
         GfcXkIMXLn29DtY8tMR5lR/5ntbVk2MdyB8mHqKKKXlLbnWcHgJPU9c8JjDKRu+/PLBI
         6HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913307; x=1703518107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bb538l1cplwls0pdfdQNLvJxmZ7uqWXDjusq2ozBKH4=;
        b=kzaB5lICP5zX5dxJO9oAh/+HPBn3LpVUXwVaYUQEIMaWlChNYoVqH7SgRUNkVfIFDh
         /TCNnQQ5QL7EYaNaldskUItKlkujpvCRc+t6g8cJ19iU6l3C0W6v+2T9m04PWKxATi+Z
         CYly8tcp7k0/anmxmWUnTjLl7el6iSWdzJPAtOCwSxCqSt3AHupq3+x5F0xdQm9JT2fp
         Y9Pf5YQn/y7QHJZeWE6VekP8QDCWyGvHcg+132Syg3VwLzWCKzyeFrPzY74a35LX7nR0
         VgsmkQXdRTvbufBfEsMr0/c/GiAxTWFcv61JXopKGu2dg/RMHAcr6waU1hfxEZQ31we5
         qHjQ==
X-Gm-Message-State: AOJu0Yz0kTBB1JLdZh3Bb09V5k/qxEOj5IZu+n71BtJkNgCA1dKc0l4D
	tQJ6tSO3hTYxX/NiYEIpT84K
X-Google-Smtp-Source: AGHT+IEAEmo0dhkWwsh9aNAsZNTJCMWpyvHDWf04ZfaD8lBkYAbQpNWy2/f/hV4olVZHY8E56lwTFA==
X-Received: by 2002:a05:600c:1c90:b0:401:b6f6:d8fd with SMTP id k16-20020a05600c1c9000b00401b6f6d8fdmr7925546wms.6.1702913307260;
        Mon, 18 Dec 2023 07:28:27 -0800 (PST)
Message-ID: <a092425b-3537-4639-aa80-f3a42fa2a94b@suse.com>
Date: Mon, 18 Dec 2023 16:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/39] xen/riscv: enable full Xen build
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <c56be97d180b996d431eb97e7b0a23ac28798996.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c56be97d180b996d431eb97e7b0a23ac28798996.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/riscv/configs/tiny64_defconfig
> +++ b/xen/arch/riscv/configs/tiny64_defconfig
> @@ -24,7 +24,6 @@
>  # CONFIG_COVERAGE is not set
>  # CONFIG_UBSAN is not set
>  # CONFIG_NEEDS_LIBELF is not set
> -
>  CONFIG_RISCV_64=y
>  CONFIG_DEBUG=y
>  CONFIG_DEBUG_INFO=y

... this unrelated (and perhaps even unhelpful) change dropped.

Jan

