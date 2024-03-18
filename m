Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C487EBAF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 16:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694785.1083914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEb3-000331-LZ; Mon, 18 Mar 2024 15:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694785.1083914; Mon, 18 Mar 2024 15:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEb3-00030X-IM; Mon, 18 Mar 2024 15:08:17 +0000
Received: by outflank-mailman (input) for mailman id 694785;
 Mon, 18 Mar 2024 15:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmEb2-00030R-DO
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:08:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58602026-e539-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 16:08:15 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46ba1a05e0so163788866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:08:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wp12-20020a170907060c00b00a3edb758561sm4913932ejb.129.2024.03.18.08.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:08:14 -0700 (PDT)
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
X-Inumbo-ID: 58602026-e539-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710774495; x=1711379295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKtRfYSXNNAlTQU1Ws/fz9PhPefaepws8tQvjzXo16s=;
        b=K6Gb19d/lQfAL2eKBGb7mqunc77+qhFrL63PuxLPckNzqjxVoQXBu+FGg0ILh6RSdh
         CKNvpvop1o7GLXn9JWcxKpQ9PjKDLla3B2twYq3qgrxysjdfDQ8FBwHKEJWDkXyaGSez
         LeA7/fqVS1XqWuJX/LBO5dAdYmJvHke3ueraZP8wEbB2XVY4lbnaqtQoVzxevG1uuEmz
         3ZqGu3GAfnToE8C6lg5j+BYNFc0qVJBu78r/+1GYQYL/p00uq8O9UHxFmZnTGwa2IBwG
         n47b3K9rWrn3aSZxKEqGeYcvQpB9S/XqqFMWK+gGDC8m3Wm8slJHT6eapVBu5mrDKNiW
         jUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774495; x=1711379295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKtRfYSXNNAlTQU1Ws/fz9PhPefaepws8tQvjzXo16s=;
        b=BFGA4Oidx9jE7JyFXXjQ2Dgz7+ij5Ql5AZDEdP4tk9/MJKkyUhoAudQ3auNL/SlRXb
         PojucBf/I5lCFWBJl98J4bUtH0ERuDTIoLIW1acDMd8JIL4rJxaRUIFwZbzeoT13E0pS
         rze6fpBLiqp9zulTX87YsexjIdNijHN8645j4mmXC8SzSzdoSUQvdP2mfZzKfZ//VSDt
         X+qUYHBVhTSF0eOGBP9DHNgZP45Em6wFxcl5xvyU7FVKQ4kX7ZDw7+rbgdOyMq/B4V1A
         q+MEtin9NQANpql+XguA95ziWvWFFo5nuBCpKfoEj/BWOo5ZGZHLxfzXwaVi+wHeP2Bk
         yy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUph24uF80n+ZFacrOvZ7PscoOk8Y1Hvz01rqUOluUesf8rIcP2vH7ftzqQCurLXhAYkgVRi2WQmkujgHghZZ9S7owo9s6IpmWNoZsGdcA=
X-Gm-Message-State: AOJu0YzIUx942nN8WRHirQna+YtNPkmkb3PFNsOeuNfrgqfWYk6ltOfe
	wR3yCZdmadC5fr/pr0AxsgiKNjZGj254rd190k2IiYYEXVnCm0kGbAFNp92B/A==
X-Google-Smtp-Source: AGHT+IE2zyrJe63RcGMDR0+QvWtLCTgkXo5f8mPkntft/qoFsOluGjNp13cidXafBeda2TiKeEa5fQ==
X-Received: by 2002:a17:906:dc43:b0:a45:5bc1:ac35 with SMTP id yz3-20020a170906dc4300b00a455bc1ac35mr7797792ejb.30.1710774494980;
        Mon, 18 Mar 2024 08:08:14 -0700 (PDT)
Message-ID: <37b4410d-8fc5-40c3-bff8-49eaae2298c4@suse.com>
Date: Mon, 18 Mar 2024 16:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-12-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -8,16 +8,16 @@
>  #include <asm/system.h>
>  #include <asm/spinlock.h>
>  
> -#define SPINLOCK_CPU_BITS  12
> +#define SPINLOCK_CPU_BITS  16
>  
>  #ifdef CONFIG_DEBUG_LOCKS
>  union lock_debug {
> -    uint16_t val;
> -#define LOCK_DEBUG_INITVAL 0xffff
> +    uint32_t val;
> +#define LOCK_DEBUG_INITVAL 0xffffffff

With this #define I can see the desire for using a fixed width type for "val".
However, ...

>      struct {
> -        uint16_t cpu:SPINLOCK_CPU_BITS;
> -#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
> -        uint16_t :LOCK_DEBUG_PAD_BITS;
> +        uint32_t cpu:SPINLOCK_CPU_BITS;
> +#define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
> +        uint32_t :LOCK_DEBUG_PAD_BITS;

.. "unsigned int" ought to be fine for both of these.

Jan

