Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593FA5F702
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912269.1318575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj2B-0006uu-Sf; Thu, 13 Mar 2025 13:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912269.1318575; Thu, 13 Mar 2025 13:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj2B-0006sU-Ph; Thu, 13 Mar 2025 13:55:39 +0000
Received: by outflank-mailman (input) for mailman id 912269;
 Thu, 13 Mar 2025 13:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsj2A-0006sM-H5
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:55:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d788b571-0012-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:55:37 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso8899975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:55:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b6d3csm21145695e9.11.2025.03.13.06.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:55:35 -0700 (PDT)
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
X-Inumbo-ID: d788b571-0012-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741874137; x=1742478937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5qdZYmy9cJ905wD0Otv7PRiJxoIoH9X0sUdlDkKSKcA=;
        b=fhZYsQeNbipVfcJMoQYXsfNriBLktsJSsJXRc8FSTkzO3Wda+TXYXCUe8dyBrhoOyR
         elNYzk//HzHxGoj5f+R4RnrmFZSTXEPSgb95zCtTaXlbPqMjK+//JjvLOVQ9QqmUaIUs
         m1jisQ3lr61PGw2wj4l3UAHirRALogZsOyJle6c3dkMxkK0FxncicSBStA+HOI2vy2YA
         CjnHKfO1qpshur0ZorXqX8lUZBGA7XOZhkvwkUrarn90NoJCUYgf9s/s6AoS3COzot00
         p+z/yuA8ZQ+cH7ooEIMIbACn0iH3VkYkyn6gV6R+xPmIY1GNqXyXLYKoybn8IVxv6WS8
         u+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874137; x=1742478937;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qdZYmy9cJ905wD0Otv7PRiJxoIoH9X0sUdlDkKSKcA=;
        b=XZfVKvJtxaZWeVDCh9S1jMddRdHzf5ApJ13jMDkVHVDA1IZBgwWbI95NxvsSYqyJgs
         BLP6NbjA3Cf3qJS+g4UVpqO+YrP4GLldIftKctlL8JEFypNl7Uyk1xYgQz8Jb7SSw+lB
         v92XZMr5zWlc0xWDt7fnZbSMivBipm+q0bWjku2YcE3wqjfEnyBCvE3eUQcoUvyhzlVt
         OoUs6bCAE0x1n4O62MDyxB++/r/TJ1sIrw0FSceWZ5nFY4ytfzR8BNDsgKTEt4KI+oiF
         /kAfMq/ySOF5yA9qblzJAM9250WSLpdP5GclPWumQdq4u9oDy91yGMhb3vzd/GEbNqrP
         /dYg==
X-Gm-Message-State: AOJu0Yzw+zinMM1gWUlqeqaxwNC3ads2D3wsJ6BlHvv3XRxuFcTm9hi/
	leKz8kZzwcU9DmREPkB5+GFmMDqIsGXHVCyFkdKZxuJ8KOIAcdnZTVYB5mQeNy2Q/tFqmfJO1rk
	=
X-Gm-Gg: ASbGncsflgdYcJfLidEP+J0lYMhyUkwjK9tDBUCiyLakJ5vroUD+d56MDmU614matxD
	lheM2vUsAg3ZrCQfNpoZ+nhVK0zsy9V5PUOSfF/bq898AMZLvEZg7wSkI5X0p4iCFOmKOUaguSz
	m9ZDGIzcNAGiVKMBBZJ0eY+K4DI9Q9eD9SC8PZDVFcLIOGsvKomDrRWbQh7jLGSkf7C/V9XWnJF
	W+IhZ7NlZ4enX6yON61hhxBAoCIVERYoYpAEalzUJY8lZtjN7+J/YfTHdJmkpZclxQ5BSdioCyh
	sg60uGQ+t2KNm+dNBUMha4FAEIk9xoBX7beJP0RlJdBdBklXdC//lHgLiL0PcnlMDbtOjD0lwJ6
	caxCRPIXDS5w4Iccp2u+djjPsgAcemg==
X-Google-Smtp-Source: AGHT+IHhEpSmsnzbUqc8RQP8V5pcX6okwHwgBUU+FJpFGEJcjrYYAu9mN1ftQYelsGnh7gexHqulnQ==
X-Received: by 2002:a05:600c:198d:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43cfdbe4493mr132230475e9.6.1741874136880;
        Thu, 13 Mar 2025 06:55:36 -0700 (PDT)
Message-ID: <d0521cf8-dc85-4b31-9850-2bb94c560fc5@suse.com>
Date: Thu, 13 Mar 2025 14:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] symbols: centralize and re-arrange $(all_symbols)
 calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
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
In-Reply-To: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For one there's no need for each architecture to have the same logic.
Move to the root Makefile, also to calculate just once.

And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
LIVEPATCH, which may be useful in (at least) debugging.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Likely syms-warn-dup-y wants to follow suit; it doesn't even have an Arm
counterpart right now.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -460,6 +460,10 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/buil
 
 ALL_LIBS-y                := lib/lib.a
 
+all-symbols-y :=
+all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
+all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
+
 include $(srctree)/arch/$(SRCARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
@@ -612,7 +616,8 @@ $(TARGET): outputmakefile asm-generic FO
 	$(Q)$(MAKE) $(build)=include all
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
-	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
+	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' \
+	            'ALL_LIBS=$(ALL_LIBS-y)' 'all_symbols=$(all-symbols-y)' $@
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -81,15 +81,6 @@ ifneq ($(CONFIG_DTB_FILE),"")
 obj-y += dtb.o
 endif
 
-ifdef CONFIG_LIVEPATCH
-all_symbols = --all-symbols
-ifdef CONFIG_FAST_SYMBOL_LOOKUP
-all_symbols = --all-symbols --sort-by-name
-endif
-else
-all_symbols =
-endif
-
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 ifeq ($(CONFIG_ARM_64),y)
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -111,15 +111,6 @@ notes_phdrs = --notes
 endif
 endif
 
-ifdef CONFIG_LIVEPATCH
-all_symbols = --all-symbols
-ifdef CONFIG_FAST_SYMBOL_LOOKUP
-all_symbols = --all-symbols --sort-by-name
-endif
-else
-all_symbols =
-endif
-
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup


