Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6E92CE93
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756707.1165417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTyQ-0001dk-7Q; Wed, 10 Jul 2024 09:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756707.1165417; Wed, 10 Jul 2024 09:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTyQ-0001b1-3y; Wed, 10 Jul 2024 09:50:54 +0000
Received: by outflank-mailman (input) for mailman id 756707;
 Wed, 10 Jul 2024 09:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRTyP-0001av-5a
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:50:53 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e43e5ee7-3ea1-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 11:50:51 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so64144691fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 02:50:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43967844sm3423825b3a.98.2024.07.10.02.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 02:50:50 -0700 (PDT)
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
X-Inumbo-ID: e43e5ee7-3ea1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720605051; x=1721209851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4fYlfeOEJ+BgYnppUstjw7978oNMdiuhy0G2qxMwtq0=;
        b=MUpDMmqzV5YmkJ/Ghrv068oE98o5eVLsh+A53sqXSxhTxjO6EPtjOwKNmbPBBuwDdD
         C9cCaC0kKpq3pKPJrgTrNPZbiibWhrp0cxVYsBV6j9r5geFkvT2P42L17bWkw6Kgm0A8
         vGiMfV/D0prKaNcnJts2AA1J+5IwXTHIiWYco98kUstNhmuMswvWgB6g/Yibgl5Bw2Z+
         Vbs0Wzri2W3CuGz2IO2zaIuTW6hhMB/o5aw7N8c6mVQHq/5sPfTRrVdIf3OdeVbbWLr3
         D3SHp6xjo+R3BhXBNOlBShBkH2lR1e4qi8YdsAu4tHbCkCKm8p6nAOdG9cu74M2+TcKa
         mo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720605051; x=1721209851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fYlfeOEJ+BgYnppUstjw7978oNMdiuhy0G2qxMwtq0=;
        b=tAs7+iMjpPlcWFEj0GpnUbLH1TNzRwr+5EBVFBWykIWFZi6yDVmZ/5rcdRt9c5jI6e
         yWnxPOOgNm+dluce8g6GFpd3/kxb1AN+9xihr/7yErwEyVVsiFB0jUEtzIlOCmmjEHx6
         /KGSxK6LWJgkXbufI7+nyDuozWHe74mWZukfUpRBSQ0yVeOpYpiN+AAqIaylChc5FFpB
         2CU/QElkQdfxbB8Hxjdi8JbDhVrOEnqD/9/22Y3APvhan1Ebtc5pwHka+oYxFl7xMaxd
         j5pSi0wHwYFKC3t3b7kkzgRHx7vVU460r+RdSpzD1Fjp+YWP1SGdFG5fWwIJojpAs4KG
         vC9w==
X-Forwarded-Encrypted: i=1; AJvYcCVVKGq2r/uldMR2oZjIqk40IMe/Cy8QC8I9FC2JxWcGyIU6o2EvSS62FTiiqwG44RICRMsJ0ZBcDTEtM9yPNkUMMLvFwWSUrS++0qiVKLk=
X-Gm-Message-State: AOJu0Yw8bZmMVz6wkJO52UCU4Lb94wQ+piEnhM1zS4ULU+tMNA7QMHNI
	xbxJ0Rwri5CGueENR+I+fBrmEiLQkPSmmaREewqQ+YgSbhpVe5LSMHo4PUZNZg==
X-Google-Smtp-Source: AGHT+IHRL4vo6oSGditJaPmmM9hLQjP1glfP9/Jg9hf1z4p1O6YpGHWrtZaSQSeXTyPzy2qHKmxuWQ==
X-Received: by 2002:a2e:9687:0:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2eeb31890b9mr29838241fa.39.1720605050631;
        Wed, 10 Jul 2024 02:50:50 -0700 (PDT)
Message-ID: <35049d21-b08c-4382-8a71-4430c7f209cf@suse.com>
Date: Wed, 10 Jul 2024 11:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] xen/riscv: introduce trap_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <83b9053330e4dae38e926c99f47d0ef11d9dd31d.1719918148.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <83b9053330e4dae38e926c99f47d0ef11d9dd31d.1719918148.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:23, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -12,6 +12,18 @@
>  #include <asm/riscv_encoding.h>
>  #include <asm/traps.h>
>  
> +/*
> + * Initialize the trap handling.
> + *
> + * The function is called after MMU is enabled.
> + */
> +void trap_init(void)

It may be deliberate that this isn't __init, but for the present needs it
certainly could be. This is the kind of thing that imo want saying in the
description (which sadly once again is entirely empty).

Jan

