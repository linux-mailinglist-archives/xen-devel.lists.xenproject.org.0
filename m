Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FBA75EFE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931897.1334080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8vC-0000GY-Jq; Mon, 31 Mar 2025 06:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931897.1334080; Mon, 31 Mar 2025 06:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8vC-0000E7-H6; Mon, 31 Mar 2025 06:46:58 +0000
Received: by outflank-mailman (input) for mailman id 931897;
 Mon, 31 Mar 2025 06:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8vA-0000Di-VR
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:46:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef360c46-0dfb-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 08:46:55 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso25699065e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:46:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e37bsm10565683f8f.61.2025.03.30.23.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:46:54 -0700 (PDT)
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
X-Inumbo-ID: ef360c46-0dfb-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743403614; x=1744008414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ehwFcAsqVMOJZx11zbJywtnnmyP6DSezDyHrjyTxKps=;
        b=VFfKFjI/QYcitvdrwW8qzfWVKcT080/NQVxf28Lx+5M5qqBiaz+yRmgQ5Cg25BeIPw
         ucbanBf+Q/9dePaldS9pC3m9l2/iggkFZdt5l3O8heY1ffCau2Lo5hh3FNX3ZcNoJNPL
         pvOyPL87fYOJ4EYaXayS48rWTyzCQTzYfYY6CtI0wmRkaCDCub3V3JMt2Ud8oGaFXfIY
         H5vouuMuwv+RORxSUxVaNtWbE/VOgiFX5ZvnPEiDm65/EAAuI6tCUY50fBTHMxogX17+
         bQyosfhbf3g03pMVT+kL/YxAMk9xSEMGGjD6gNWKeIVWt+nfuQX4d9lqpA6C3/6Sjcxy
         hjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403614; x=1744008414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehwFcAsqVMOJZx11zbJywtnnmyP6DSezDyHrjyTxKps=;
        b=XGaO4gSCoF+viZ9yjO12bjqikpZjhDcVfvvSv0GzWAH2aBvJBF+MG4Z+CuDtEvQIvA
         3SZjjg1XczckIupDXa0hDYBfd3B3wpOPBieTFv+KRDu5Po4GEjmwMizLkquZy7pjuGma
         AgO981b6OsaVKPF8Sh7NsenMN6rhmqJNHx8tfhlE/ek9OXhGOMORVEZa+xpHvO1PUyK+
         ZamLKFV5d3loj5q32J/WllG2I+LyjyR0AvGl2VbbgRKshvBJzkx+4dPH6RMdc+4LzUI1
         C5pPWD2e1OjWQk3uhuz7gI4ojpbDx5pLnJ0maH4twIZzA0MVS50lzrZY5ah1o34dfbkn
         xbvw==
X-Forwarded-Encrypted: i=1; AJvYcCU7AH3utlOM/7ffStudTFiFLKoRVpSJidPrKaoIGs+FnaK/R97mhdFtMihlhrWzVTR0+mEqf2UOV9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJu2QOQujSAIug+8/eY9mNpKDqB+wowXQsAxgVSeC0R7zN6kaM
	CB/xbjUawaQtq+RH0vZ8+e/yf4Uiv0zKkeugHNllJ6/fVzJxU6DO3eKPA4AlzA==
X-Gm-Gg: ASbGncuYAZPZhvfeBvM7NXBWlOniGTJ/+6q7KLNQqWFcsaCQ/dTRv5n7UvZlZy+1Dsf
	8fkBE6cPT94tELsxEdWQwqS0tdJWQkOterjucOWXzStTqlCZHkkc4fm8dzaZnzrC9KhZxQyUD4i
	0WzxHz6JyZKqejdUp8vMeZxoO6M8qu2RAfdP+XXvErY9NmjG8U5DSiTZRyBuQ7bhv2FiQS2PDld
	ybbQ62pi9TiDp0pU2lT4W/MTJkRG5ZwrnxvBn+5XDzCDmVJGMcb/67Nk2LmZz86MYVOfua81iWQ
	e8WqKGolBD/2Ut9sLUDtKkQOvjqn0TYmyETfdM9p4JOyCQ2BJ4SytYLjA5//2BrnZVKfKbZ9tHp
	rpZ22D1zaekHlLsqwDqhvJL4rS4tNGQ==
X-Google-Smtp-Source: AGHT+IHw+jzX/A9VxxQkVl8RWk6xEr+EvH1bzIdiNBVPrtr9+XapotSCwGQzC8z+FbcRSqnkWY29hw==
X-Received: by 2002:a05:600c:548c:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43db61d3924mr71711185e9.12.1743403614556;
        Sun, 30 Mar 2025 23:46:54 -0700 (PDT)
Message-ID: <11cc0427-cf12-4086-b2b5-19d96bdcb327@suse.com>
Date: Mon, 31 Mar 2025 08:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Fix blowfish build in 64bit-clean environments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328173637.892960-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328173637.892960-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 18:36, Andrew Cooper wrote:
> In a 64bit-clean environment, blowfish fails:
> 
>   make[6]: Leaving directory
>   '/builddir/build/BUILD/xen-4.19.1/tools/tests/x86_emulator'
>   In file included from /usr/include/features.h:535,
>                    from /usr/include/bits/libc-header-start.h:33,
>                    from /usr/include/stdint.h:26,
>                    from
>   /usr/lib/gcc/x86_64-xenserver-linux/12/include/stdint.h:9,
>                    from blowfish.c:18:
>   /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such
>   file or directory
>       7 | # include <gnu/stubs-32.h>
>         |           ^~~~~~~~~~~~~~~~
>   compilation terminated.
>   make[6]: *** [testcase.mk:15: blowfish.bin] Error 1
> 
> because of lack of glibc-i386-devel or equivelent.  It's non-fatal, but
> reduces the content in test_x86_emulator, which we do care about running.
> 
> Instead, convert all emulator testcases to being freestanding builds, resuing
> the tools/firmware/include/ headers.
> 
> This in turn requires making firmware's stdint.h compatible with 64bit builds.
> We now have compiler types for every standard type we use.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



