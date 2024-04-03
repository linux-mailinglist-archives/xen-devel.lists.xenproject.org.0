Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D5896BFE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700395.1093470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjD-0007x9-IB; Wed, 03 Apr 2024 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700395.1093470; Wed, 03 Apr 2024 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjD-0007no-Bj; Wed, 03 Apr 2024 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 700395;
 Wed, 03 Apr 2024 10:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjB-0007Ql-Do
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:21 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c61738ff-f1a3-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:20:20 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516a01c8490so677188e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:18 -0700 (PDT)
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
X-Inumbo-ID: c61738ff-f1a3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139619; x=1712744419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FQPLinh42qBu2cwjojE0/Q7kzGHHOUunECIcZ8FxJQ=;
        b=IYVv9/UppsE02zIZ4rfnGZZ1gQ2UMYrWynFyNgZAuypbpfzEFxNnY1eDIzyPSiyPTR
         ljd2hH8ydaX9RQ1muvoW8sOvIvTY20kEOo3I4x4uNX/RJdN3eTpUgUBowpY3WrGOH+ze
         /O4rlHbc+FLT4ODd+Lox5sxjxc1uXdj45Xl/WotrFZ/OQ/TkiJAIoHlq75O2nqDB8MKD
         ZD9RNc660DdkrxW8DV4PRF+sX5usn4DfpnT75LVYOpfDAmUZ21wXuCKVWFb3jWbWYPxA
         f64+WQrrNwcvJ1+ueOYbBgt/ryeT3rKGc0I2C5xRNnDb75fXQQFIGH5jY/3h1b0f6HVb
         zOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139619; x=1712744419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FQPLinh42qBu2cwjojE0/Q7kzGHHOUunECIcZ8FxJQ=;
        b=T+pZQrgqIkAy1CZ6+OR7R0Tpxz3miST5ouzMC9MT8+6jUVr+Dyibt5kQOpw10TD5BJ
         olFEzeQiBGKJA+k3PBpGfbCzw1tpVMySdNpj80FcyDNAy+NKyBLr1rpvkUzvcFpZAUea
         0pw8frICU3HzEYH6jlGHY7u8RmqVhGn1+wktYpKSO2+huU5XxEaXUM2Q7WtCiyZySsz1
         bqH+jaHd9sF+kgi9T0Jf1vlUCZz5TuCpRoIbE8dMydfDnmd6CqZMFyZ+vkpZ5md2AfSx
         3RR0PB1o+cPjatjR7gouIb+eBxOXWXqeXE9TFDK3oYK/1cySqx87Q3wrKCJDsW1cwqrY
         ZSDA==
X-Gm-Message-State: AOJu0Yxww/YLAZh9+pdefp+uW81CRcd7NmGyhv5hNcJ59uz5zQkwB2a0
	4S/XW87dlaBrgnha87nK7ZmGZUpCPQ6x/wxpsHmvicl+CZlFvKQTlDNkzCSU
X-Google-Smtp-Source: AGHT+IGv2Pse/vPGNf359mWOmsa4ZLmAKALU1CvLKVSk8jScd4QR201tE4WVGs5K3Bzm3qHbHt/zwQ==
X-Received: by 2002:ac2:505c:0:b0:513:d442:223b with SMTP id a28-20020ac2505c000000b00513d442223bmr751273lfm.30.1712139618854;
        Wed, 03 Apr 2024 03:20:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 03/19] xen/riscv: introduce extenstion support check by compiler
Date: Wed,  3 Apr 2024 12:19:56 +0200
Message-ID: <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
 - add variables for each extension separately.
 - create variable for abi and compilation flags to not repeat the same in several
   places.
 - update architectures to use generic implementations
---
Changes in V6:
 - new patch for this patch series
---
 docs/misc/riscv/booting.txt | 16 ++++++++++++++++
 xen/arch/riscv/arch.mk      | 15 +++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
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
index 8403f96b6f..24a7461bcc 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -3,16 +3,27 @@
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
+riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
+riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
 riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
 riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
+riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
+
+zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
+zihintpause := $(call as-insn,\
+               $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)
+
+extensions := $(zbb) $(zihintpause)
+
+extensions := $(subst $(space),,$(extensions))
+
 # Note that -mcmodel=medany is used so that Xen can be mapped
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += $(riscv-generic-flags)$(extensions) -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
-- 
2.43.0


