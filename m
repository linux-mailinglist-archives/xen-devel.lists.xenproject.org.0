Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB2C6E0D3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165747.1492438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfjl-0001ni-Sc; Wed, 19 Nov 2025 10:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165747.1492438; Wed, 19 Nov 2025 10:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfjl-0001l3-PK; Wed, 19 Nov 2025 10:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1165747;
 Wed, 19 Nov 2025 10:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLfjl-0001kx-14
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:48:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49763fc2-c535-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 11:48:30 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so900510366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:48:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73783ef841sm1211542066b.46.2025.11.19.02.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:48:29 -0800 (PST)
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
X-Inumbo-ID: 49763fc2-c535-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549310; x=1764154110; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLGEmdvkhlxZaIiBvk+4EcXTetBTuqQsxNhCoxttbh0=;
        b=Kdyz+VWmXIlxzTCJC1TMWI4KVB83/YjDfgOkeile7Vuk/AzkbFQvYuNd4yTFqcp9os
         APkd92AkV/KgbPatWd6lDU1iRkQAxX3+oakZxEq6+Y0LBdfgfz3wgIlO8Hb1psWwcvTA
         Q9FpDdbrf+2nRUEckZUrV3xtRA7MM1aLjhhfXKwwntJTghqWnZV9yIIKoUl0xBe8ec/2
         NdQwr8WLIbmDCTy9QNsVd2dpS1p18yPO1/vfDqV9p9aPsyvIuVo/qWTqgn3uXwHShSN2
         I7fAZDRqFWClBzNmLC+ccaKsvA/dPKKIadyxMIvqLBfse1oWz8dII3vU3ejQCO2t8rJN
         8mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549310; x=1764154110;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLGEmdvkhlxZaIiBvk+4EcXTetBTuqQsxNhCoxttbh0=;
        b=h2jFuMSTnqI0N7mU8gEqz5N02IO5rzUFO9Kzr8vjrjljIBT8GSEnfLDqwbvZktcmY1
         v+Zk8QWzlRpazIymq/v0ai7gf+mzpwTeAndyJzyzvD+DfeySJdy0KqnUbx2v1G75SEJm
         Dg02yWELBpz51dtxgjkmOXJTOn2oAmRu97au5kB2UfvbO1zf2a02ZyT4PVDfRnc1I56m
         H31M21FJq29f1N3Z82hII44MIP65oW1qtTbPHn6/NVYrx6+npOAPjYqGwTseX0ZV9G/E
         IQKnmRuaJ7+2pj3ERXLQZnIHiVtiyl9DwjqRV/yra1KhoECEaSiUSGssbp0aqIgw96fp
         IL0w==
X-Gm-Message-State: AOJu0YxIUdo0NzkwZVGtT1+9E84ZhQMS9GIANG7M1otZfU3XPw0b7ung
	zrg8eqTwmte9pltL05rQ1QnjjXcSPDHLo+FFbhoXQU0SWVR0So77LFw1U6PPvaEDQWyQ8mJHsy4
	hloc=
X-Gm-Gg: ASbGncsA+sR3S2AXUMeJdKvmgQSB7WJfske6ts1vjwoOeajV4Vb0hxgoI5cwAyXlJQZ
	rbSZ2vTurjcqqYi/tQioFPl6GKRGqjeLudPJxXRzAJWikQaViQ3Wmxcyoc7QYdjNaOSDHCQT8eH
	FBPDmMlhyhSgo2FmUWcOKZMWVx7cSjTRA0Np9IuE8JPtYLaLxFQbuXgdeDx+76aUC9KfQzGizqR
	fvYpSWxWn3MQrbRCxOtr5x+VwyrJTjvvCqGA6s+9e8f1B/UGOY2z/zEv+ECRx8ZXMyMJEdMw40E
	WIZ/v1QEyM0yylJOC9Qrj1Z/MXEG+AmOAVhGnplnHURO0Ym43mP1Xj9aPPp85aKJG8daDgL6V2M
	7ge/HvRwdspoAJTxHczoDtRiPADfd4bzH3fvaS5tcQQIrnKPbAhCQ4tD1+swrGf+ULCzcous0P8
	0YO/kxUu92RVipSWMmIGNaVq0dVxEzAhlYU/oB8YOykR5CFnbUYFudVn06Lvq4noEnyjxlZGdq/
	+Q=
X-Google-Smtp-Source: AGHT+IGHUkMfRX7SiWA9Eh6EUJeXj5S3wnn+8Bmf/wGh1H4J5+scxZxqgxihQQaZR4OwXfUNRCuAqQ==
X-Received: by 2002:a17:906:9fc1:b0:b73:885b:7554 with SMTP id a640c23a62f3a-b73885b857fmr1413292466b.45.1763549310098;
        Wed, 19 Nov 2025 02:48:30 -0800 (PST)
Message-ID: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
Date: Wed, 19 Nov 2025 11:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86: direct APIC vector adjustments
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The setting up of such vectors really is a boot-time-only thing. vPMU also
doesn't need any vector when it's no in use anyway (which is the default).

1: guest: move allocation of Xen upcall vector to init code
2: MCE: restrict allocation of thermal and CMCI vector to BSP
3: IRQ: direct-APIC-vector setting is now init-only
4: vPMU: don't statically reserve the interrupt vector

Jan

