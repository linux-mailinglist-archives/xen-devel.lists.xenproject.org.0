Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D555BF0C87
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146117.1478587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnso-0001zt-G5; Mon, 20 Oct 2025 11:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146117.1478587; Mon, 20 Oct 2025 11:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnso-0001yT-Cd; Mon, 20 Oct 2025 11:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1146117;
 Mon, 20 Oct 2025 11:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnsm-0001y1-Pl
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:16:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492af9b8-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:16:55 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-421851bca51so3444032f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:16:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9853sm14798435f8f.33.2025.10.20.04.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:16:54 -0700 (PDT)
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
X-Inumbo-ID: 492af9b8-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959015; x=1761563815; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/ONRLBiwb0u95emNu2vHO0/vhT8ppXOZWSNVX9TF64=;
        b=F4cP3X0/mhR8GaXlyi1tMoqWVdT6q002INQrryn3FNKC3QLZ19KTVSOURmHmcgDZAw
         1zEKY7/7RYlNneQB9/0IuT+hqA1z9PjQFJtnAC+hWzKos9pcoJfnKNFJfZR1zKLyf+C+
         7L+oOvYLUtw+mcMVdoTp8ggQA5yUw91GJcTz2MwGhKSp4VHNwvPLfCzQ0PoOTKgR2ng4
         a2+/wU6GuOm6I9nWDHsSfnvdJP+LC7XsFrBtsabD68pWLfhj6vqvZBC64o7yx2CLZ/z1
         MrNVHaTcGTty+pK40Pq5SGVeRPHheRseuqz+hO761WxDwjnL294mEkGm250h7JtFcp9H
         47+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959015; x=1761563815;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/ONRLBiwb0u95emNu2vHO0/vhT8ppXOZWSNVX9TF64=;
        b=N0i53aEfVyqFB2ETVSAbn+GCa6UAsKx2JkdQnsKfLaEPGo3LYjnASZ5v6YrHZiEI1F
         LHRcqJC+3mgtmKxbbRtgamkRKx0XNCqfHZzo/N4b/j3CZuRZ3mgYPUXVWFbrBmbIufDP
         Ub7s/EWebQktT6+o00ZeyOzmvbv41gU5SDBLBR39RzcYBicmi+ZK+U4Vi/e98q06SG82
         /1yiKAV+Oc6FOT9A/EoZACkGv3rWXTqPiaPMI97Citwb9NrxA1Uv0aZFsHeLkD3ylZqJ
         R8gyBjJTZpextiUCsnGbjlduEcQ6PZFuYEUvMCvVUc3f5enXGpk7Vcl3V7d2t3tB8pmU
         rzAw==
X-Gm-Message-State: AOJu0Ywe/ZCP0ahmKPhyzr6XQbw9Sy8YGSUkqOGr3cyT5+Po63iw1Ljh
	vgJgxI5eeWHsW/V5fXPlw7ksUW/TTNYdoovjnZJBdXIrjDDRpToeY5EoZz/9Oeke8KfCZlL6wsN
	15zw=
X-Gm-Gg: ASbGncuc++GaB3nOFLxqA10D4plkr9xpl+CVJtqQKB5kI7hlAjOT7nHJ8mcuRLAUUHa
	qMk4lotuMrh98I4B+x17JlRPpGU7DLHceIn+gss7WryVEgPlxRsdcjkgg9fthzmN7WKA/mmcLHl
	klEUHA7esCHoVDLmCB5D6aR75CSJTLXnExjiOb5iy7SedPfqxtHhaK7Qg8ZcSbLQHIWqK3CnjrZ
	Pfu7mLAieDXtKt1S2QFuihywKo6+aOVYxIpnT5aLQ7KcoCAZPpmzVD2tBAew0g+AzKAVLu8m68B
	zLqWRU77DNABwjE8lUMencFMiUAJG1ailDZ6liwpL3PrJK8n/NLN0HlKQkphrbkUp7kR7kkAIui
	c40iwj9h/ruWW50ZxNe+/p5vgVGJXSG4b4+SQ6YUXxlPC+V5rbhz6grnUSddittWFjYhWte2nQo
	v4YzJOysOXyxhv1XA4sXIIeJpqCDeG9FQ+LOXSSXLN7v4QtVClEjb/OOD6XY0q1uXr5SfnBCh3G
	QLcaXwdlw==
X-Google-Smtp-Source: AGHT+IGfIi0s58MFq1cn1p5UIr2UK3jbBCI/HtaK+nSxNqB7TP83BfhJrGoGZWTD/hMinp0+RJy05g==
X-Received: by 2002:a5d:64e4:0:b0:3ec:dd26:6405 with SMTP id ffacd0b85a97d-42704d900edmr9264192f8f.26.1760959014761;
        Mon, 20 Oct 2025 04:16:54 -0700 (PDT)
Message-ID: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Date: Mon, 20 Oct 2025 13:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.21 0/9] x86/HPET: broadcast IRQ and other
 improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
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
as a result of IRQ migration (where we don't have any control over the vectors
chosen). Hence besides reducing the number of IRQs that can be raised (first
patch), the main goal here is to eliminate the potential for nested IRQs
(patch 2). These patches are imo 4.21 candidates. Patches 3 and onwards likely
aren't important enough anymore at this point of the release cycle, even if
those with a Fixes: tag may end up being backported later on.

v2 has 3 patches dropped and 2 new ones introduced, plus in particular a fair
bit of rework of the "main" patch. See individual patches for details.

1: disable unused channels
2: use single, global, low-priority vector for broadcast IRQ
3: replace handle_hpet_broadcast()'s on-stack cpumask_t
4: avoid indirect call to event handler
5: make another channel flags update atomic
6: move legacy tick IRQ count adjustment
7: reduce hpet_next_event() call sites
8: don't use hardcoded 0 for "long timeout"
9: simplify "expire" check a little in reprogram_hpet_evt_channel()

Jan

