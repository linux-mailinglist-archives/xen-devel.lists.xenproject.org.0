Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A1BE1ED3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144151.1477606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IRV-0006V9-P3; Thu, 16 Oct 2025 07:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144151.1477606; Thu, 16 Oct 2025 07:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IRV-0006TC-LW; Thu, 16 Oct 2025 07:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1144151;
 Thu, 16 Oct 2025 07:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IRU-0006T6-F1
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:30:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe34333c-aa61-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:30:30 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710022571cso2727995e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:30:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711435b06fsm11512315e9.0.2025.10.16.00.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:30:29 -0700 (PDT)
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
X-Inumbo-ID: fe34333c-aa61-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760599830; x=1761204630; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGiqDHGvF3cGFRnNQq0q8BH7zVglVFVrYPwnHO8ixSE=;
        b=U9gOp7aKgvFGaydZRyNNCkywwCvkYGxW8Cld1H5/dVwcmIaZX+J+AKkTYZ2ktSdd1J
         3Xv4e3ShoV2ZCwzOo/x9LIOLFgwMkastvwKPApRVJhX1V9jiAa5bG9ovQcxpPMcJ3D7i
         jJIcySq1ENoBV98ntBm6Yy+dH+/sUvrmJAiG2GBtFA6Pbi4KkUA86i7z8WSF8nXRbbhk
         h2a/o3K5MEJb8UbrIvt+iRu+4Tg+KPjo0FeEmaQVEGy028o8itnr44i3o1gIl6NJu3PF
         BC35W3wahaJ9JiQruIspshCqcoSHf+2Gh+VxRA2mfCa2AXvjIcry1e6CG3RxBNvApktH
         o30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599830; x=1761204630;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGiqDHGvF3cGFRnNQq0q8BH7zVglVFVrYPwnHO8ixSE=;
        b=sF2UMfsOkfR4BJkBjEiNY4F2BkjzWtUi4hgUpEJ+y4gHhylZ/Bosy8QkkO5JR7j2S6
         Zc1SJ3+1p2FQOi7SXJ4U44bNG2j7ZMX4KD1cCa1eq2I9NbOCSAbVNJhSSgvjWpjNgH7O
         1IRjSHJE+rbkYT20wOdI/KQxQlcYvev/9uZuCd09bJ8dLJeI2mQgdT5ryINCCSy3hKOV
         aqzBDO4PYy7cmKcYnpPIbMNrPPEF96sud+oqkZRVeHmWiv+leEar0WQxgUgmb+FTs6AE
         l5sUtfbrH+sVFagkIFG8dolNhy4R1ufJNQlTfY6FqG7/FFzvXx4wlgDvNBA1pHNG7pp6
         8knA==
X-Gm-Message-State: AOJu0YxOGq9Znt1u8UG7HI+6qoDjcx+6RhKkBARcajE7dB+76isASdVv
	MDjJHPsBxV3tB2FzybVqEepYCsdpqsUMWLFf4toT+Kup/4FgjbdOb/diZ3s/Ec+vCjkQ7JidlOZ
	06kE=
X-Gm-Gg: ASbGncsPpGe4ZOQo14rOu6GoD4oNbYIcTyUZeJMkT7g+dSV83qBmt/zvWrz1CC5dVKn
	Gtb0AGUaAJ8Bim1Q2Bjhe90nyEWoNpqkD9HvHduYCPm7b19p8XLGGSEFBp52a4CFBtRbd90QXiY
	VumgOBbYNX+XYUbaUZPeRhB/J1Ty6Qq9daY1OkKFXucH8yylv8k0uDFg3Lg4naXCGRV4meivbsq
	ScYvCjicuMORtB2ObStBoEmSuqF6G854d5TQA29MFA0KVo5tRaWkd+8airkpqsFCG2gFs2lWl2o
	W8QNvDHZNMYwB+obCnsX2k1HHW/Ie+JY1vfkKc5A6NCRT6aXxjxF8oZgJFQwLTyfOIiWg47jYBi
	NACBMnAI42Do298g659igJCza+Ja3JfWTaA6OpykOMpkirhmCyr0eB2P1t+ITaKi1m7JCNEVhL8
	eBfVQkRf3BlWdFA6/yv4TI6risKVcdHu15SKJXUmD0kH4YOONTJuUPeNzjhIBU
X-Google-Smtp-Source: AGHT+IGBZcvuH+dTkQFR/qGM+HC6rs7Sbf2TlTaW6Btnsa59HTSpYufalZR3bBaSV99SxV7WKEwrEQ==
X-Received: by 2002:a05:600c:4ec8:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-46fa9b08d79mr257159785e9.32.1760599829681;
        Thu, 16 Oct 2025 00:30:29 -0700 (PDT)
Message-ID: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Date: Thu, 16 Oct 2025 09:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21 00/10] x86/HPET: broadcast IRQ and other improvements
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

While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
helped quite a bit, nested interrupts could still occur. First and foremost
as a result from IRQ migration (where we don't have any control over the
vectors chosen). Hence besides reducing the number of IRQs that can be raised
(first two patches) and possibly the number of invocations of
handle_hpet_broadcast() from the IRQ handler (optional patch 4), the main
goal here is to eliminate the potential for nested IRQs (patch 3). These
patches are imo 4.21 candidates (with patch 4 being questionable altogether;
see there). Patches 5 and onwards likely aren't important enough anymore at
this point of the release cycle, even if those with a Fixes: tag would likely
end up being backported later on.

The one related thing I haven't been able to find a viable solution for is
the elimination of the cpumask_t local variable in handle_hpet_broadcast().
That'll get in the way of possible future increases of the NR_CPUS upper
bound: Much like right now a single level of nesting is already too much,
if the limit was doubled even a single IRQ would end up consuming too much
stack space (together with cpumask_raise_softirq() also having such a
variable). Yet further doubling would not allow any such stack variables
anymore.

01: limit channel changes
02: disable unused channels
03: use single, global, low-priority vector for broadcast IRQ
04: ignore "stale" IRQs
05: avoid indirect call to event handler
06: make another channel flags update atomic
07: move legacy tick IRQ count adjustment
08: shrink IRQ-descriptor locked region in set_channel_irq_affinity()
09: reduce hpet_next_event() call sites
10: don't use hardcoded 0 for "long timeout"

Jan

