Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BD950423
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 13:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776167.1186314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdq24-0007MQ-WC; Tue, 13 Aug 2024 11:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776167.1186314; Tue, 13 Aug 2024 11:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdq24-0007Jg-Sq; Tue, 13 Aug 2024 11:49:44 +0000
Received: by outflank-mailman (input) for mailman id 776167;
 Tue, 13 Aug 2024 11:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdq23-0007JY-DU
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 11:49:43 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2024c93b-596a-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 13:49:41 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so6159637a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 04:49:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e3basm63498266b.164.2024.08.13.04.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 04:49:40 -0700 (PDT)
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
X-Inumbo-ID: 2024c93b-596a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723549781; x=1724154581; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+hkf4y+gpixNGnjs6JeKccrNDQA3i4qzSsHd16s5Lpg=;
        b=Uu1qq+Aqh3+IsFEo33s5ZyfmGo769d6/FsgfyjGN7s7lrzLedq4TN6onTX0SQZzxw5
         e+M6WoJamJrFgjhNxpgdqMoCxYyCyNNjB5eQ/EKEIKmJM5Q/JZKQJxoLAlIUOjtLL+gt
         rDpME7q+WE/Mt6VoNwrO/QzfXiINW1ONzfZz0u/TxnUniSEPXHYFdcXnUpEEYtdxIQmw
         XUPn14K3PeKCY5Tau/f1eNZrnFjtnjTz98vKBWgSPtu+WNpGPOVCzU3uqeeqK0kP6qu7
         /jfcWWj6v07R9yCmqf0cvcYcHuP3E2/xR9r0cTEZ1uGE9oOgVFwYNJckVKlLcth7wOJN
         lYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723549781; x=1724154581;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hkf4y+gpixNGnjs6JeKccrNDQA3i4qzSsHd16s5Lpg=;
        b=lBAeGoD1+/9uTO/WA3unqXcC1D84S2r8q2cMQqtR0bTEECjqNYcDHsBskO9Qvlwks8
         7Om0JtztfhurImAzqXdndRUaP2oti2B4m6CQn6zxL8MJfbWET4vTNq9vr+HSQOyXIOh/
         cYUD4ykA++DFwyr1UCEuXjcTtSqUCvQLGlYHzuz0H+JEb19U4Myp7BJ1grnHRCusn3AY
         Czb3EmlEC8lgm6osbFp5UNOcgnqtnnUYxFL25SwFyySg09Hbo8rFKyufDUWPyfN890Wg
         U/wDGngAvsgjDyAbjE6YbShHt/Nrr7DulbXX8lsT/0qxkkCTiN0yI4nRh1FRNES0pcyI
         m9Cg==
X-Gm-Message-State: AOJu0YzMpj4oDNrBZdYSGIKgX/Qnkv1ijWDbslrhjLZ/ay3LLQ/c0MTu
	iglx0zA4mNJ/DzI5tc3lekfw7uZVc6N79DwLeLeg7zxvdJa7fEztPdVP7HhBYmvE1Cb1UnHEOI8
	=
X-Google-Smtp-Source: AGHT+IFS4/5paSEhcDIDoSpuyx6/P2Ua++MbMsbnTk8oRa+7TrYJwRu8qOms77yo1eS/J7hRjwpGXA==
X-Received: by 2002:a17:907:9801:b0:a7a:ab8a:386 with SMTP id a640c23a62f3a-a80ed2d496bmr222874166b.63.1723549780563;
        Tue, 13 Aug 2024 04:49:40 -0700 (PDT)
Message-ID: <5b097aa2-7ced-4971-bd6e-96618bb6f2df@suse.com>
Date: Tue, 13 Aug 2024 13:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm: correct FIXADDR_TOP
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
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

While reviewing a RISC-V patch cloning the Arm code, I noticed an
off-by-1 here: FIX_PMAP_{BEGIN,END} being an inclusive range and
FIX_LAST being the same as FIX_PMAP_END, FIXADDR_TOP cannot derive from
FIX_LAST alone, or else the BUG_ON() in virt_to_fix() would trigger if
FIX_PMAP_END ended up being used.

While touching this area also add a check for fixmap and boot FDT area
to not only not overlap, but to have at least one (unmapped) page in
between.

Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Adjust FIXADDR_TOP instead. Add BUILD_BUG_ON() as suggested by
    Michal.

--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -18,7 +18,7 @@
 #define FIX_LAST FIX_PMAP_END
 
 #define FIXADDR_START FIXMAP_ADDR(0)
-#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
+#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
 
 #ifndef __ASSEMBLY__
 
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -128,6 +128,12 @@ static void __init __maybe_unused build_
 
 #undef CHECK_SAME_SLOT
 #undef CHECK_DIFFERENT_SLOT
+
+    /*
+     * Fixmaps must not overlap with boot FDT mapping area. Make sure there's
+     * at least one guard page in between.
+     */
+    BUILD_BUG_ON(FIXADDR_TOP >= BOOT_FDT_VIRT_START);
 }
 
 lpae_t __init pte_of_xenaddr(vaddr_t va)

