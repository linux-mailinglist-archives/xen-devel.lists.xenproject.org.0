Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6787D33C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693989.1082705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwo-0006HA-9o; Fri, 15 Mar 2024 18:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693989.1082705; Fri, 15 Mar 2024 18:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwo-0006Bm-19; Fri, 15 Mar 2024 18:06:26 +0000
Received: by outflank-mailman (input) for mailman id 693989;
 Fri, 15 Mar 2024 18:06:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwm-0005yW-QW
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:24 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbfdf0a6-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:24 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d46d729d89so32931091fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:22 -0700 (PDT)
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
X-Inumbo-ID: bbfdf0a6-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525982; x=1711130782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3qDdX1fVf6ELC4xrUOmJazs4+QxaTvpRVXWbmDV/+I=;
        b=c244gl9HMfi2AY0bRn4d9pTaDtknWsPEtcrkhQO7Kxu4V1P+rXA2Zo6TZBzhJ3SG68
         4NW8LNFwV/GedA4gAoRHVeI3aDWoGFtw14lmUvMnCTiYQNa+TmMvj9dthMPCOtUMZV4S
         UHZ0BdWnDlyxkUNr4xuNQdUgHRw5PPolB58ohR226T6r5XKNGQB9i4MX00dzlbn+qkkf
         x6Ymk52t6l+ps3IEKUZ2jp0TZXlF1EIQET0fPzPViL0ZSLkb4UqQYIiwJ3gyhu3KcMoC
         w2PjbJfgiONwQLejK9iUqlr2dhWSirRHJDrhljrEqPs7NBCLPPlTZkld1rQJiAYidZOy
         nwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525982; x=1711130782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3qDdX1fVf6ELC4xrUOmJazs4+QxaTvpRVXWbmDV/+I=;
        b=I1B5jhDOCDIYJQKvOrqM0grPJJm+qGaQCEB1yTiZFL/pXbjreHJumNmL1CK3CuwYGv
         Bc6d9HqKoHb2nZdBKPM3VMDpSp1FGLuFhzt9Ykwzk+FblInoP/ggkVDfxZ5Pc1HUe6JZ
         H8CJKSYdndqyKCu9go7xjUNhRDEwOs+mP8HeumqWckxGtYzjY8V1bYEKlxy6/5FJqjjD
         NDCVSQ9O9M9VCS2LlTLwX72H0VjC/tvkVbT+PzHGKP9H4nqFVgplD1l6vIq93dkDVH2Y
         CmLE2ujjtrIBunBAmVDTBQQkbUfdQ7IvOZjraqx44RMMEdsJZHkRxV7IDyeVAbTsH4yG
         RNNA==
X-Gm-Message-State: AOJu0YwB3ctPuurQy88X9kWi4leseTDNgRZRlf+N7cPODKjkXo3JU7pW
	5V6qoszLMyiRNGXWJERq02c1TzsPxKrUEqX8io6NCqAOSUfYRJM+oSgtxBkxMIQ=
X-Google-Smtp-Source: AGHT+IHeNIXc4RZKYxoGE93x76137GYbYkx6boDJJaNuddaxGW6N1RgI0MJTtn6sDj0oCFFiEOV5OQ==
X-Received: by 2002:a2e:be8f:0:b0:2d3:ba98:473 with SMTP id a15-20020a2ebe8f000000b002d3ba980473mr3172986ljr.19.1710525982507;
        Fri, 15 Mar 2024 11:06:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 03/20] xen/riscv: introduce extenstion support check by compiler
Date: Fri, 15 Mar 2024 19:05:59 +0100
Message-ID: <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, RISC-V requires two extensions: _zbb and _zihintpause.

This patch introduces a compiler check to check if these extensions
are supported.
Additionally, it introduces the riscv/booting.txt file, which contains
information about the extensions that should be supported by the platform.

In the future, a feature will be introduced to check whether an extension
is supported at runtime.
However, this feature requires functionality for parsing device tree
source (DTS), which is not yet available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - new patch for this patch series
---
 docs/misc/riscv/booting.txt | 16 ++++++++++++++++
 xen/arch/riscv/arch.mk      | 10 ++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 docs/misc/riscv/booting.txt

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
new file mode 100644
index 0000000000..cb4d79f12c
--- /dev/null
+++ b/docs/misc/riscv/booting.txt
@@ -0,0 +1,16 @@
+System requirements
+===================
+
+The following extensions are expected to be supported by a system on which
+Xen is run:
+- Zbb:
+  RISC-V doesn't have a CLZ instruction in the base ISA.
+  As a consequence, __builtin_ffs() emits a library call to ffs() on GCC,
+  or a de Bruijn sequence on Clang.
+  Zbb extension adds a CLZ instruction, after which __builtin_ffs() emits
+  a very simple sequence.
+  The similar issue occurs with other __builtin_<bitop>, so it is needed to
+  provide a generic version of bitops in RISC-V bitops.h
+- Zihintpause:
+  On a system that doesn't have this extension, cpu_relax() should be
+  implemented properly.
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 8403f96b6f..da6f8c82eb 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -3,16 +3,22 @@
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
+riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
+riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
 riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
 riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
+extensions := $(call as-insn,$(CC) $(riscv-abi-y) -march=$(riscv-march-y)_zbb,"",_zbb) \
+              $(call as-insn,$(CC) $(riscv-abi-y) -march=$(riscv-march-y)_zihintpause,"pause",_zihintpause)
+
+extensions := $(subst $(space),,$(extensions))
+
 # Note that -mcmodel=medany is used so that Xen can be mapped
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += $(riscv-abi-y) -march=$(riscv-march-y)$(extensions) -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
-- 
2.43.0


