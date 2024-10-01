Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F998C207
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808320.1220228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf83-000335-UQ; Tue, 01 Oct 2024 15:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808320.1220228; Tue, 01 Oct 2024 15:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svf83-00030P-RS; Tue, 01 Oct 2024 15:49:35 +0000
Received: by outflank-mailman (input) for mailman id 808320;
 Tue, 01 Oct 2024 15:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svf82-0002yz-Dn
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:49:34 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0346f60-800c-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:49:32 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so3530279a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:49:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248abf5sm6356806a12.77.2024.10.01.08.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:49:31 -0700 (PDT)
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
X-Inumbo-ID: c0346f60-800c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727797772; x=1728402572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RFIZ8Z4CFYIEZ+qNDXiCK8ID3k/lwBX2+rAOICZEhGU=;
        b=DHuxBMurw7VNCRWJwS2HaOl0s4OiKPCTFRlWSIYQwksOJs7j0X5L02qfDrS6m4CNB3
         gTLOP5RnS+dH3MQZGYiCu4RCUGOYgaBABr1bFv4bWZel4c6oK7gdiWxrkqSj683rP/LA
         fsuxushutF3QnkFt5oB8356mCVD7IC6LuH2Zl6PrHzOHL2WkbGoYLJhA496VDshzLFWc
         UYuRjG/aovPLfe2OmVfU4lx0iREkqO70/gr1HE8+n8guApWS3fTjgdXgSktFCwK550Fo
         p5kn6z62bcPKWgwjXoQDb858lJ1fHWHgDZpz9vRNdkXiruPHA60JREzRUIpEDRUL550l
         OyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727797772; x=1728402572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFIZ8Z4CFYIEZ+qNDXiCK8ID3k/lwBX2+rAOICZEhGU=;
        b=Ir4jAHGIN2fViDdlijdU+XBGwb6WXKnU4e3BKzoMRM2m4cgVSGep87t608uVjY0h2f
         tQcSDuIz+F+nUA7SVt4iL3MJtGwIKm/mFZoWknKvZIWQUdg+kDoKwGJqI9jJsi5h/w1t
         JT+TFdbw9hqzDy/OF8pCzUdsXCU+vYtedVemcbNtmb6c+PHolFmcd/NRwhzQiIffnDIv
         EiY2qO5ZkuSMciSNTVOfc0ZVcaGZMQb4yhsdF8RvwnM0AR+rJBzCxQAu1JJfi/IglD+7
         DwZ6VdFUP4cfoyvVpWxiiZ+s4b3Fix3fGjCkbPewVO1DU5wajY59PlsqnRCS78i6x5Ac
         ONZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoE4QbeqO3S2J9hGmBujV9sE5iwVMTVDBoh3RIGPTGm6eJaumIq5eUCmnoPAt5BUtnrBvgiZObpVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+A/GREn5uujxtOwB76sC7yeqh6xIll7f6KbAJhKmyIyKkaEuF
	KRvqAKapC9P4tsD2KPW+c73iPhG/79souo2+JFIL9qKoaebekutseZMYkgPrEA==
X-Google-Smtp-Source: AGHT+IGpz/g1G8ffCXHjZgrPz9VLwu1/4htEdHpKEEmfU1acSzDYI6EUjgCM3DbkMfOSWyFVOFfAgg==
X-Received: by 2002:a50:85c3:0:b0:5c8:7696:79f1 with SMTP id 4fb4d7f45d1cf-5c8826084e5mr11379963a12.33.1727797772023;
        Tue, 01 Oct 2024 08:49:32 -0700 (PDT)
Message-ID: <178b61bc-d3e5-4c9d-a8c0-88363911bc8f@suse.com>
Date: Tue, 1 Oct 2024 17:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: register Xen's load address as a boot
 module
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
 <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:08, Oleksii Kurochko wrote:
> @@ -26,6 +27,8 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>  void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
> +    struct bootmodule *xen_bootmodule;

With just the uses below this can be pointer-to-const. Question of course
is whether you already know of further uses.

> @@ -44,6 +47,13 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>                "Please check your bootloader.\n",
>                dtb_addr, BOOT_FDT_VIRT_SIZE);
>  
> +    /* Register Xen's load address as a boot module. */
> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
> +                                     virt_to_maddr(_start),
> +                                     (paddr_t)(_end - _start), false);

There's no real need for the cast, is there? Plus if anything, it would be
more to size_t than to paddr_t.

Jan

