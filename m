Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F134CD5A4F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 11:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192027.1511393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdOk-0004f2-09; Mon, 22 Dec 2025 10:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192027.1511393; Mon, 22 Dec 2025 10:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdOj-0004cr-Sm; Mon, 22 Dec 2025 10:44:17 +0000
Received: by outflank-mailman (input) for mailman id 1192027;
 Mon, 22 Dec 2025 10:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXdOi-0004cl-IS
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 10:44:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285bce78-df23-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 11:44:14 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477770019e4so32828705e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 02:44:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3ac5409sm91542085e9.15.2025.12.22.02.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 02:44:13 -0800 (PST)
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
X-Inumbo-ID: 285bce78-df23-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766400254; x=1767005054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YEl4NTplPsoOXXXkGSP9wfMuOcwX8N0nGF7mYuPNQtA=;
        b=CC23UTnlUy76yVoC0KdE/MatqFsCWmrQmvk1CljdbTVxn62BwEKg2o3F0QyweVF8ua
         ovIsDjF62JH3Cng1UuJH7EFqQpJMkpuZ6/6BOzZeTDQbcL0vXbwdwyFaef+Gxjzqs8D2
         WqED8inTnNw5UOLaS+Gk3tqQ2vWK7Vvh5Yv0twUSnrbTejhIC/1nWJcNSesWWaqZSRnv
         1uYz84b66we4iT3cgXs/uO0bmTA48zwwtQNH8IsbWdd73oNC6ovCjbUFzzzBsMGGkEnL
         X8qRp3vzqNV3RhYaGrx4/L0jh1XCtVdus6t0oSEb7CbJFJQdBxnU4Hs73NLhRDH6dF0I
         fuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766400254; x=1767005054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEl4NTplPsoOXXXkGSP9wfMuOcwX8N0nGF7mYuPNQtA=;
        b=UtA8HPYJLMjlGz7R+rin2o9DqliR8GIGvDa/0x1yNC3Av3iKicEjWknXgeOGKvQXUg
         +/iQ3GyEzd5+V1xf9z1dT5dBpv2Q6I+NtOAfGyCyzXAb9DmSMEVIOwhCPSbK+i9rB9AN
         JXYFn6e8t6GGvsdjLe3davGaLzrBqN1PBKR/5zbS5RqL9OCO4Upb1XIOFftDkNig2M25
         PgtwX7urNDoPTSp2vqp31K1mNaRrrnotFHMJoa9JcwWHKM+F7nA8TZ1kmtle66JYYS6f
         BwhNBN85bGopsvWKm9OV1OObK4Q1VvLjNBipH59i5+LthCS4PjLQswMhvZ9AYy5g7k/I
         XrMA==
X-Forwarded-Encrypted: i=1; AJvYcCUbh/UgLYKEkYd5FR15JmQg/4o57+qG9LwpYyi7p+hGNTgSDT383sXMYrt3TZkOoF4ZfrKp10mS0j4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkqAg6nD0xgAc90GP4ZUZv3C8oBvTDoZZE/cbURz5p4argZNcj
	X05/tFhQ/4HhdZgD7UIsWtfR4Ma2ZJcgqtfxZBxsxLj96WjmihCh+Aky/Mm2s6iA1v1IPYZVoTa
	lLHA=
X-Gm-Gg: AY/fxX7jygBse4rVKU4+aLWAw+x/pd8Da4rU+3jfJ8Xv/3vBL0y4d/Bnsywo6P9Unhe
	7xBFxT7gjaecCF0eqnTEdQOa1MkCl9IAUbIzmoJTWUNxchirOt9Hp03QJTS1oHF0QtYJaZOzIuh
	S68guVK/82VQMp0fTbpIbdWT9jFikIcvgetb7+lMhmZm7r4RhcjywhOIAVE0RPr6Fr4IUkfxADA
	B1AyQrAiIYZX6IQq2EmfKZdpQt61xHlmyn6EIdKPbj49emwVwzG3J+0eglR0fru587twib4z20N
	LkhYMmO0lIWaJNgsdBg3Ku5Y1MwNyi4l3wqES3pQz40UyoFtL8ynbjfiX65lCHUrHUKS1LnO9uT
	jlj3B3Q8Y5mWvn6P/3tq3Yz6fz9Lnp3RobGJEB579hPDfx8821iPrFR3EJ0JEo1znTHW5ktndV7
	cd/c6XI4iCZBw1y7Oen56wY6kg/Kp/9bepgQuhd4W1lnkPd4TsF2nPAzKhQe7T3gT2qE2Y+F4z5
	lCtVAF6u6zoCQ==
X-Google-Smtp-Source: AGHT+IHfQNASd2Xp3b1gNmW4F+7Y4OV24Kyzy/9a7G8jlIHIF1cnol61Wm30kox/wu7RZ+2qxrG6kQ==
X-Received: by 2002:a05:600c:4e49:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47d195911b8mr95350835e9.30.1766400253764;
        Mon, 22 Dec 2025 02:44:13 -0800 (PST)
Message-ID: <f68c37a6-a3d7-4426-a702-82412fd6361c@suse.com>
Date: Mon, 22 Dec 2025 11:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xenpm: Don't build outside of x86
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>
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
In-Reply-To: <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2025 16:42, Teddy Astie wrote:
> xenpm doesn't provide any interesting usable features outside of x86,
> skip building it if we are not x86.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  CHANGELOG.md        | 3 +++
>  tools/misc/Makefile | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)

Arm being what is mainly affected, I think you may have wanted to Cc Arm folks,
for them to ack this (alongside Anthony).

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>       2011 onwards.
>  
> + - Removed xenpm on non-x86 platforms as it doesn't actually provide anything
> +   useful outside of x86.

Maybe add the word "tool" for those who don't recognize "xenpm" at the first
glance?

Jan

