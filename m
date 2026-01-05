Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC99CF494D
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195561.1513490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn6g-0003MW-Vh; Mon, 05 Jan 2026 16:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195561.1513490; Mon, 05 Jan 2026 16:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn6g-0003JU-Sf; Mon, 05 Jan 2026 16:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1195561;
 Mon, 05 Jan 2026 16:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcn6f-0003JL-A5
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:06:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea6a2ba-ea50-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:06:56 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso14149f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:06:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca27642sm272556f8f.2.2026.01.05.08.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:06:55 -0800 (PST)
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
X-Inumbo-ID: 8ea6a2ba-ea50-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767629215; x=1768234015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGlrI54Jpek/rSowiORoNmjYuKtXANePipxG9zcj3oM=;
        b=CMKhP/HudYiTPpdchMiLT+oIxbNlPwk7U4TW4PIuUOkboi2umR/oJDJrX0EXpbeNwr
         QMP2PxZS404hlPnlg4y5YDlbqNOcdUoE1RjapQBDMtcPlbsLOWqnIMNCGdjWl9/HjKE9
         D/SNxvby4bn6aQ0U0UbKMAcDk9ULOAY/eWGGLir0A2pLeCUNQZvb+amNAemNcxz4RlKL
         JxvLoGvutfB3FMJBaFq8x7apQolTzczYWESkFpU2LelrHgz6jmJF/4gK7PmC2DkL6k6K
         QRMJG8djGRbfVkpR1MrbxBUJt4ft1+J4vzGe83fiKigEQsXMxhT5Se2dlUIxnZCrXGiN
         ABfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629215; x=1768234015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGlrI54Jpek/rSowiORoNmjYuKtXANePipxG9zcj3oM=;
        b=lkmkRK9TLS03aMuHICC1gDND8zkfEoeI5zuvJJ3tXi0De3Bb5hipiOwzPM5yTtQ1GN
         WCcZXKwsuqC9863Yf3khtHkGLRN4DLrynv+jJdLLVH8b3zLE11jxqwQr8vJU3G8Vdr76
         NUeOWW8JG2q4nn/re8DW50aqoq/TolgWDGY3h9FkGiEKbNi7YqfX4YOV3yvbcK8R+6Wm
         yxeLfqXyyrDustAGJ1854jrx322TB9tk1R/efw6qB+uYreW2y74FO8VFGl54k3ijrg/y
         uJge1KUy9ws/2UujrpR2GUMxjskalUO5YiIJpXbaMgepU/44ZfF+aQVhxNu562GC/IFs
         zIaA==
X-Forwarded-Encrypted: i=1; AJvYcCVNPwBKRTuKTzo380jW/i4+D1JSCPspUhsWvi3gicIgxqRBTk21N1P/C40T68a7ImFFhrN9Gngo5ME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyimZ5LyVhosj2iM/+atm++wS4UaLp616yQyUBqYLnEjvxPApoI
	zGh6hOQLCRy5rhZd/eBcvIXOFrSP61LR0T+ElZzv8WVy9T1vAL2Ykyu2zOyHNfWlEg==
X-Gm-Gg: AY/fxX7TpksbRjOU3ZOeFY8G3kYSTZLuAAaWaOnStQ/JWalNRVvAxxMVVEmxky3jTgh
	u6UwWMSIXOroHU3/8oBlDdSSLlRR+24vJXynCEH+Xzf60WaPKwH587lofpWw94sknov/fnEPoFM
	Seb8mGr4JsYnqbfOKcNlFm1cvom0RX1XgSbKjXtWi53MhqcNDf0L3oVXA8CoYhYRJAy6FrHKqoi
	bbbVmV7khvvHj1UaJxHOkEtU0oyV0APtuxw2a3F6tx3dTuui14vmO3f/ZOMdJzlSpx4lCo21afz
	TK0p4AEEwvgnD9LEISb8hCd6VStnkXkDNneAhVqmQlAxheKxghMg8GWdGkL/RejQI7Zju57BED6
	e8ql0zjEiNFC3TNh0Jbu1DgrgOIkpYEKPoPr+lhkNqnLrShQXSd9VgFfExtQs6JTy5qIpQVLXXa
	N3OGQjULLWdVKbiY3UIB6500ErjfEv4xKye6ZuCBxdQoahEQdJm2IOrnHrvmCgdDnLHPcGRIZku
	aA/eZeHrifg8A==
X-Google-Smtp-Source: AGHT+IGFfr0Yetmy9/JYr/+D5ObT+TNNb1rKadgfIZXzQZ2ANuAnk/yulEdVhcwfa1Lu7E+R2+fsbA==
X-Received: by 2002:a5d:5846:0:b0:432:86dd:f449 with SMTP id ffacd0b85a97d-432bc97d4e5mr359612f8f.0.1767629215454;
        Mon, 05 Jan 2026 08:06:55 -0800 (PST)
Message-ID: <4a59e889-37f1-4dc3-8c7f-71ef47e8483d@suse.com>
Date: Mon, 5 Jan 2026 17:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen: Fix endian handling in muldiv64.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135050.188191-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:50, Andrew Cooper wrote:
> WORDS_BIGENDIAN is a QEMU-ism.  In the very dim and distant past, we had a
> fork of QEMU living in xen.git which wired WORDS_BIGENDIAN in the userspace
> part of the build, but nothing ever wired it up in the hypervisor build.

Perhaps the assumption was that big-endian targets would #define WORDS_BIGENDIAN
in their asm/config.h?

> Fixes: 86d5da49a6f7 ("[HVM] Support multiple HVM time device models coming soon.")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I'm not sure that this wants backporting, seeing as we have no big-endian
> architectures at all.  Otherwse, 4.20 and older can't rely on the existence of
> __LITTLE_ENDIAN on older toolchains.

This not being active breakage, I think we can omit the backporting here.

Jan

