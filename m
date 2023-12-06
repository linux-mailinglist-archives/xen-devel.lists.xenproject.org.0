Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8DB806D07
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 11:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649087.1013428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApd8-0005jK-R1; Wed, 06 Dec 2023 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649087.1013428; Wed, 06 Dec 2023 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApd8-0005gV-LS; Wed, 06 Dec 2023 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 649087;
 Wed, 06 Dec 2023 10:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rApd6-0005P8-IU
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:59:48 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917a1df6-9426-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 11:59:46 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso583898f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 02:59:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d500e000000b003335e67e574sm3128483wrt.78.2023.12.06.02.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 02:59:45 -0800 (PST)
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
X-Inumbo-ID: 917a1df6-9426-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701860386; x=1702465186; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQzh/kxGUddWCVZoEBZkMTbc+8tsnObi8hKwzMBGVLs=;
        b=M6460PYJoWbrheQolC4RFoN9P/v4QcSoG8DBQAsigZKwSX6Xr8nB4UaIgopIRK6ork
         +3RLQETBYatavG+MiWZdPPjZaofGE/X/8TQAnh79Gr0mFxf1nN1QyPEZOnd91CQZeRJR
         cBQY1v22XMeuhKZEAAvzzgl901IE21dKm/q08PXIAqAFSgxhxFFyXUhCySJHVlqWeNC4
         fDVQuPcUm0v9kglbEhr4peLmA2X+uKCbvfeWK4hceXVeBkwSpiDJNGlj+GINT/KkclfI
         PNZJ/Z2LAlTgylwp5wqU/+jCEwjTG13wKG60Lkj8gokVormah8x9cMcPg2yjV5tT255h
         bHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860386; x=1702465186;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQzh/kxGUddWCVZoEBZkMTbc+8tsnObi8hKwzMBGVLs=;
        b=o2rM5VBoMYAbchiAVnHnIlLzWGamAbOteLgKUNrhtGOWP81VIx0n+qK9xk3ZBH91Sq
         JKTDQDlp8td7IP+sZH8RablEmfRD/Qckrq6Oig/FTa1ftDLBPVIIlzMByS8+FTOR42su
         BunnP6jlkkbzXl5MRqIS97jSh1FJ8AjEpdoMWE2Yx1C2KcHN/jgkfVjBmI+1K0TpKvV6
         iFhIn2LgEdHPnN+4pFSU6b6untsZMXpzM3HEznX8mTEgdogK2PaN8jp/i2iCTYu1mb9L
         uasstHedHqdw0xclrm+eB3HC5wcl/om1e2Q/TW9fXTDUKRv8CY856215sWVmTuImBZd1
         YckQ==
X-Gm-Message-State: AOJu0Yx4B6u1Fnzxb84okttdHtYSa3C0w08YeToCmH4axVvJfJ9y8F3n
	1pfoDBDphFrHy+ji637uP8RI
X-Google-Smtp-Source: AGHT+IGyZ33jlUkPxViD/67EWyw7B79AGxXiIPkSRaqEpOnr3iUC6WneacxN69W15RRxjfEvtQuyEg==
X-Received: by 2002:adf:fe8a:0:b0:333:2fd2:4aff with SMTP id l10-20020adffe8a000000b003332fd24affmr292524wrr.123.1701860386139;
        Wed, 06 Dec 2023 02:59:46 -0800 (PST)
Message-ID: <8ec8031a-65bb-4b1b-8964-8c457e04b4b4@suse.com>
Date: Wed, 6 Dec 2023 11:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Minios-devel <minios-devel@lists.xenproject.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH mini-os] x86: fix building with Clang
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

It doesn't understand -fno-reorder-blocks. Whether without that option
the resulting binary is actually functional I can't tell, though.

For $(cc-option ...) to be usable in arch.mk, at least CC needs setting
earlier in Config.mk. Move up the entire "Set tools" section.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Observed with Clang7, but then checked option (un)availability with
godbolt.org.

With Clang5 there's further breakage, due to apparently deliberate de-
referencing of NULL in lib/xmalloc.c (poor man's BUG(), as it looks).
The compiler's -Wnull-dereference causes a warning to be issued there,
converted to an error by -Werror. Question is whether building with
Clang5 is supposed to work.

--- a/Config.mk
+++ b/Config.mk
@@ -86,6 +86,33 @@ TARGET_ARCH_DIR := arch/$(TARGET_ARCH_FA
 export TARGET_ARCH_DIR
 export TARGET_ARCH_FAM
 
+# Set tools
+AS         = $(CROSS_COMPILE)as
+LD         = $(CROSS_COMPILE)ld
+ifeq ($(clang),y)
+CC         = $(CROSS_COMPILE)clang
+LD_LTO     = $(CROSS_COMPILE)llvm-ld
+else
+CC         = $(CROSS_COMPILE)gcc
+LD_LTO     = $(CROSS_COMPILE)ld
+endif
+CPP        = $(CC) -E
+AR         = $(CROSS_COMPILE)ar
+RANLIB     = $(CROSS_COMPILE)ranlib
+NM         = $(CROSS_COMPILE)nm
+STRIP      = $(CROSS_COMPILE)strip
+OBJCOPY    = $(CROSS_COMPILE)objcopy
+OBJDUMP    = $(CROSS_COMPILE)objdump
+SIZEUTIL   = $(CROSS_COMPILE)size
+
+# Allow git to be wrappered in the environment
+GIT        ?= git
+
+INSTALL      = install
+INSTALL_DIR  = $(INSTALL) -d -m0755 -p
+INSTALL_DATA = $(INSTALL) -m0644 -p
+INSTALL_PROG = $(INSTALL) -m0755 -p
+
 # This is used for architecture specific links.
 # This can be overwritten from arch specific rules.
 ARCH_LINKS =
@@ -119,33 +147,6 @@ DEF_CPPFLAGS += -isystem $(LWIPDIR)/src/
 DEF_CPPFLAGS += -isystem $(LWIPDIR)/src/include/ipv4
 endif
 
-# Set tools
-AS         = $(CROSS_COMPILE)as
-LD         = $(CROSS_COMPILE)ld
-ifeq ($(clang),y)
-CC         = $(CROSS_COMPILE)clang
-LD_LTO     = $(CROSS_COMPILE)llvm-ld
-else
-CC         = $(CROSS_COMPILE)gcc
-LD_LTO     = $(CROSS_COMPILE)ld
-endif
-CPP        = $(CC) -E
-AR         = $(CROSS_COMPILE)ar
-RANLIB     = $(CROSS_COMPILE)ranlib
-NM         = $(CROSS_COMPILE)nm
-STRIP      = $(CROSS_COMPILE)strip
-OBJCOPY    = $(CROSS_COMPILE)objcopy
-OBJDUMP    = $(CROSS_COMPILE)objdump
-SIZEUTIL   = $(CROSS_COMPILE)size
-
-# Allow git to be wrappered in the environment
-GIT        ?= git
-
-INSTALL      = install
-INSTALL_DIR  = $(INSTALL) -d -m0755 -p
-INSTALL_DATA = $(INSTALL) -m0644 -p
-INSTALL_PROG = $(INSTALL) -m0755 -p
-
 BOOT_DIR ?= /boot
 
 SOCKET_LIBS =
--- a/arch/x86/arch.mk
+++ b/arch/x86/arch.mk
@@ -14,7 +14,8 @@ EXTRA_SRC += arch/$(EXTRA_INC)
 endif
 
 ifeq ($(MINIOS_TARGET_ARCH),x86_64)
-ARCH_CFLAGS := -m64 -mno-red-zone -fno-reorder-blocks
+ARCH_CFLAGS := -m64 -mno-red-zone
+ARCH_CFLAGS += $(call cc-option,$(CC),-fno-reorder-blocks)
 ARCH_CFLAGS += -fno-asynchronous-unwind-tables
 ARCH_ASFLAGS := -m64
 ARCH_LDFLAGS := -m elf_x86_64

