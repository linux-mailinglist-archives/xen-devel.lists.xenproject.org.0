Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766008AB0B1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709119.1108374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxp9j-0004sp-LJ; Fri, 19 Apr 2024 14:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709119.1108374; Fri, 19 Apr 2024 14:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxp9j-0004pi-Ie; Fri, 19 Apr 2024 14:23:59 +0000
Received: by outflank-mailman (input) for mailman id 709119;
 Fri, 19 Apr 2024 14:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txqa=LY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxp9i-0004oC-4s
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:23:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75383294-fe58-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 16:23:57 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516d2600569so2687301e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:23:57 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z4-20020ac24f84000000b00513d244005asm725847lfs.199.2024.04.19.07.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 07:23:55 -0700 (PDT)
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
X-Inumbo-ID: 75383294-fe58-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713536636; x=1714141436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvE04hK1QhYzx30yo+rpGP6awpQxcr4JZMIWUrH45M0=;
        b=VEVcgNr3cvTaqL3E4PJjkZPuz0G0T8xsIGuIsiUn7oqQrmqOsA91kG/dogi2C0mkAH
         P0FQgWNTFlp2v40uVOY0Njlps3hqCHda94osdIxkNGK1KeIpt+xO8mWPdNa/6+4t5fON
         t+b4EFpHt3w4SOD44Pdwfw47+0ml+KdJvMXcllr74R3D6mWaIIahXbXyLTOebBLu5qbr
         Qc49wBpGR+Dan9pZNSZcsAJK1e0O9U2WyHtya0RXtN4lHpl8ovhVbRO38TMrVvRJJ0yZ
         WtfpLUiK0fLuzSaY9ZwQD1Z2n9bWxgn2T9ULtPgvmVxhRMTZJfrK2e6r9ad0vbF1g1Fr
         4AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713536636; x=1714141436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvE04hK1QhYzx30yo+rpGP6awpQxcr4JZMIWUrH45M0=;
        b=U3w1gGKOQVoLk4DoDFiWqqdZaRWZ7et5qcw702nkTlIvMIP5gNe/lPWnPSilg7vRdN
         Om98sXHDt9eCXFYlYSI4B4rnnsaQfWoUgKwH83Nl2HmRHx6deS4gCV7x2eXNdFAxGHjU
         H8YQZSwuOD/NOk4bnoF7Vr1ormQe/8K0CCEbpfcRg5VjqDzxwwlFhbSLpSsF4icJ1hV1
         +/2iOhMPURHHVvkotEhf2FuE2NFf+F5IiXZfNxhxCFblQbaoL5o1vh6he5B7dyPL+Isb
         LNUKUHWBqnMKKs3hnU1NPhXBeHk2iU+HBdJbTE6+nObYrvH6FbiADFpBDVpUqbA0Trqv
         iIYw==
X-Gm-Message-State: AOJu0Yw5+/KLrkBJtXR9Rhr8tO5WJbQVEYJrmCb6zzqHpHWGI7+IcFxi
	gzD9GI/nnDaYLY8GOb3lE6I4v0LjPDQDFUO2kndjwASzuZ1yTt6JAzpoxw==
X-Google-Smtp-Source: AGHT+IEEvH4dYfTcbMlGk0kZFT2F92pKHd04k/inXJR/mV8qO8O0RGMIT96AWGZ6a5i2N/gB5GQpSA==
X-Received: by 2002:ac2:57ca:0:b0:518:e8a4:9266 with SMTP id k10-20020ac257ca000000b00518e8a49266mr1563939lfo.14.1713536636111;
        Fri, 19 Apr 2024 07:23:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/riscv: check whether the assembler has Zbb extension support
Date: Fri, 19 Apr 2024 16:23:53 +0200
Message-ID: <95441782d1920f219d63dee1c82c7df68424d374.1713523124.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the argument of the as-insn for the Zbb case to verify that
Zbb is supported not only by a compiler, but also by an assembler.

Also, check-extenstion(ext_name, "insn") helper macro is introduced
to check whether extension is supported by a compiler and an assembler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - code style fixes: use "-" insteaf of "_" for names.
 - update the commit message.
---
Changes in V2:
 - introduce check_extenstion to abstract a check of if extenstion is
   supported or not.
 - update the commit message.
---
 xen/arch/riscv/arch.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 53f3575e7d..dd242c91d1 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
 
-zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
-zihintpause := $(call as-insn, \
-                      $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)
+# check-extension: Check whether extenstion is supported by a compiler and
+#                  an assembler.
+# Usage: $(call check-extension,extension_name,"instr")
+check-extension = $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(2),_$(1))
+
+zbb-insn := "andn t0, t0, t0"
+zbb := $(call check-extension,zbb,$(zbb-insn))
+zihintpause := $(call check-extension,zihintpause,"pause")
 
 extensions := $(zbb) $(zihintpause)
 
-- 
2.44.0


