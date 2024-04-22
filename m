Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5118ACF26
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 16:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709981.1109046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryuUs-0007Hp-OQ; Mon, 22 Apr 2024 14:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709981.1109046; Mon, 22 Apr 2024 14:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryuUs-0007G3-Kb; Mon, 22 Apr 2024 14:18:18 +0000
Received: by outflank-mailman (input) for mailman id 709981;
 Mon, 22 Apr 2024 14:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryuUr-0007Fx-4a
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 14:18:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286c27eb-00b3-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 16:18:15 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41aa15ae26dso214135e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 07:18:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d434b000000b0034a2d0b9a4fsm11048239wrr.17.2024.04.22.07.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 07:18:14 -0700 (PDT)
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
X-Inumbo-ID: 286c27eb-00b3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713795494; x=1714400294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLPqa2i3hO0E3rsnz5yPTdb7z2QTjpI0ZBayqgyuVO4=;
        b=TsVeD0aUljts3dALYT4ZMLOIi1xMgTMqyINRkkS1c6yaV596c/Faa/lc+aoOvMutcM
         iTXBnLO1N4TQVl4N0BNMiume6BI7q5iS6P7T+1pPY333PKxeyV1zO4vS6XSOXPkXO4K+
         eukZfdp/AzyNNi8ZQDYe9srmHTXnHuCPjBtIBjz5HsO3UX0X722CUcWufcIzkm/aRJ2j
         dFVZTZ52ynTrmFe6hcm8Sfpq7YuWoC7McQ4V71nQImjO8CBMqjdCewTzma3lIaMSeSMI
         KUge9BKrdnKNrhbLQ3Lvmf9CZixxfUMAtX29nQkpbAerqXm5IaMNcypXNMJBsrHSbJ9+
         0tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713795494; x=1714400294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLPqa2i3hO0E3rsnz5yPTdb7z2QTjpI0ZBayqgyuVO4=;
        b=jJYQmq55Op75QMU5jzXoXD9/TsIjV7SjUOm2/l8CW5Bf73Yq5lkkGgHzWaX1q8b1sJ
         l4xGcZbqze/F79pDxxXQJhe+rCxf7GkbQUjNHqDLa65ISjI4SxVw+u8mQDvldST9sFna
         dgZcz5Yo1fimWAlc65Yk0qQzlR+Z+uCdPlJtCYlgqTFbahGkkgm4ifkZ7ggU+D/w4Dze
         vYnXoL8lIHBB73M+sX2fUB7TD1zfphg9Q90avwAA2zTpRO8iET6HaVrJUdqfF0zejBxJ
         Q23Sm6q6OP708Y2dm1G8kurCgleylndPeOPcP3U5EcPsyNRrBo1hzANKlsErp6CrhATE
         ePJw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ykz7DLK5got404pqiPf14XTiCusl2nbJLqhjysuEmMvHzNCTDKwd+7rQ2cEDRbAuSeI2ZiyE6/VgkolgImnxSJK5k5SjcM+ec1jZz7g=
X-Gm-Message-State: AOJu0YyobB7owUE5v/n5mTH6VjW7pvo+IqAH/OXy1I5F25w7jwjpbpuz
	tEH8op7HoEcWTcj/MHHXFW4yv4GGH+0eryCbRxLd31HqTouuCXEwEc/+8DhIzQ==
X-Google-Smtp-Source: AGHT+IF1ABDz5VnC4dgXZVRrWymS9cR8CGNdm03LW/ge5FX1/G085LkqKSXNo4fj3Eu/0tzbydns9A==
X-Received: by 2002:a5d:4a81:0:b0:343:e52a:f51e with SMTP id o1-20020a5d4a81000000b00343e52af51emr5772627wrq.47.1713795494341;
        Mon, 22 Apr 2024 07:18:14 -0700 (PDT)
Message-ID: <9600cd58-3530-4037-bf3c-aa6038b18fa5@suse.com>
Date: Mon, 22 Apr 2024 16:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86: Refactor microcode_update() hypercall with
 flags
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240416091546.11622-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 11:15, Fouad Hilly wrote:
> Refactor microcode_update() hypercall by adding flags field.
> Introduce XENPF_microcode_update2 hypercall to handle flags field.
> struct xenpf_microcode_update updated to have uint32_t flags at
> the end of the sturcture.
> 
> [v2]
> 1- Update message description to highlight interface change.
> 2- Removed extra empty lines.
> 3- removed unnecessary define.
> 4- Corrected long lines.
> 5- Removed ternary operator.
> 6- Introduced static ucode_update_flags, which will be used later to determine local ucode_force_flag.

Non-style comments on v1 have remained un-addressed. Specifically, to
give an example, while 1 says you now highlight the interface change,
the request was to explain why changing an existing structure is okay
(hint: it likely isn't, as the structure size changes for compat [aka
32-bit] callers).

I'm not going to give the same comments again; I'll rather expect you to
respond to them by either adjustments to the patch (or its description),
or by verbal replies.

Jan

