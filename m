Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4D938F0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761861.1171915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVs5V-0001em-DQ; Mon, 22 Jul 2024 12:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761861.1171915; Mon, 22 Jul 2024 12:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVs5V-0001cq-A5; Mon, 22 Jul 2024 12:24:21 +0000
Received: by outflank-mailman (input) for mailman id 761861;
 Mon, 22 Jul 2024 12:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVs5T-0001ck-7d
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:24:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f8f188-4825-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:24:18 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso391666466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:24:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785e07sm416966066b.38.2024.07.22.05.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:24:17 -0700 (PDT)
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
X-Inumbo-ID: 50f8f188-4825-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721651058; x=1722255858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jdyvCYgVUhL7JLk69HLz/tzI3ek6aeHibTJbGk/n0L4=;
        b=SuW9eUZYtGH1InXEaZhRDy2zGjClpCY5J3FXf3jlHT1fmw0PAQRuyUEUiKOcBMqOQA
         X8OXl748f1ON4GAHiv8/G4jnVIu4YRotNpz1T7zanzIM47+Dp8kB49OPcZ1OdsEn3AGu
         qO1M/QE+cSxYYb2j+bFCOWpZa6fcX/48Cd/iC4PTxu2kXM51RFrXzSNecKJlZfI0CjNX
         o80VY/2ECaF0O0vh4gEVskFViO87zoCq/+HXg+d7WxSladBXJifVoGD+AKrnEAnZyHDm
         bIzAsyGO4ls8IbtuYG5Swlh+9w5ErZrZ/mNDwbyUd2DXjyanDGY6M1ZSUA6pn85pt94K
         Pp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721651058; x=1722255858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdyvCYgVUhL7JLk69HLz/tzI3ek6aeHibTJbGk/n0L4=;
        b=aBOTrvee5y6rdaJFcd3zmN0CwOejhzBOg1b7Erv/Lty1mSvu+XGRzWe9id4SU2ssqW
         JLlOco9uPxZmmjM9qsXS/Qo/MWc2kyE93cuj+iP39YgGDqv/vgQeUcEkeOI45qpO7bMr
         LtzLu0hKSkerQTEGMmXBGeyx7jXBEP3/YAx71yIDMwHhVXlCCAtWAkBx6iTswBzMUnpx
         caIDKaN2zWvj+KhpLZvM97hxEtF5MphpFzqFZrMOBTSRRrvzVi586I1xpJpFjAnt38/n
         wd+37GjKxczWPHkrAW3xUCn0VakRA4uVycm5ZLX1X59dl2VKYbKEnpm/YAuy7LT2C66t
         s/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUwwIwscoNGhZIe6svtG6+040kzAWprtr7W/bALN1aJDCTLrW8Wy8qqZdFNHUxG76dwR7P37IBzwlaHpdOC/B2h6Rg3CcgKrK5kkVE9L70=
X-Gm-Message-State: AOJu0YzKwZYefov/OsLrUlFcrVr8zOJEzm4hzfCj9SD4SPM5yg0rhtDs
	ui2Lz3168p8OsrT4T+/zcqKcA5Nv5snvyuLxpWTqJKulvjnooGwdSGgiYVDEXQ==
X-Google-Smtp-Source: AGHT+IGaZ2K+Wrj0Haah4EjShbTPdqKRrild+LOIcVNPQ2e2f9C6N+3QzIlFx5YUDI9odY0hVpw1EQ==
X-Received: by 2002:a17:907:7f0c:b0:a7a:83f8:cfcf with SMTP id a640c23a62f3a-a7a83f8dc14mr3900566b.35.1721651057634;
        Mon, 22 Jul 2024 05:24:17 -0700 (PDT)
Message-ID: <9013e512-2710-4492-8e60-8f25ba32bbe6@suse.com>
Date: Mon, 22 Jul 2024 14:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240722112752.4981-1-tamas@tklengyel.com>
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
In-Reply-To: <20240722112752.4981-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 13:27, Tamas K Lengyel wrote:
> This target enables integration into oss-fuzz. Changing invalid input return
> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
> build.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> v3: don't include libfuzzer-harness in target 'all' as it requires specific cc

With this, how is it going to be built at all? Only by invoking the special
target "manually" as it seems? Which sets this up for easy bit-rotting. I
wonder what others think here ...

Jan

