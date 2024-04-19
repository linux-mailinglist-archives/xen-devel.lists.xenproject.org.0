Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF78AACC9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708953.1108180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlSA-0004CX-KC; Fri, 19 Apr 2024 10:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708953.1108180; Fri, 19 Apr 2024 10:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlSA-0004A3-HI; Fri, 19 Apr 2024 10:26:46 +0000
Received: by outflank-mailman (input) for mailman id 708953;
 Fri, 19 Apr 2024 10:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txqa=LY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxlS9-00049x-8y
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:26:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50521ee5-fe37-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:26:42 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a55602507a9so219321066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:26:42 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 w25-20020a1709064a1900b00a524dda47c0sm2035012eju.143.2024.04.19.03.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:26:40 -0700 (PDT)
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
X-Inumbo-ID: 50521ee5-fe37-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713522401; x=1714127201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2KY1qHGzDqORwSMEQGEHWKQ/in6IbRIqlg3NOshudc=;
        b=NrT8BLz5sf34Fiz5N5N38MndqP+NydnwWSqSL1NZ3cwFn0co+VgktPe58XbZq64yBo
         6n8Es2w/OLu68GLlMP6pCM12bQitaU7ukBBbyg1oMRknUYcwckpvDQT5Sb4Frbgwbqar
         SVjuFhUWQqbpq/oVoOgVIJmXkObwe3et0HfdVIfrG17IM6Hl247NiAZkKl6855WqZnln
         xFWX7dp0NP5dMfn4C+keApArIuIxpoBuBXDnojiitKMd6BCAy8kRA1ICPA2LpBGlLwgE
         212Xp7lyf6dGgQEVBo/vJHQNUz9nlrixO4QwUSw5YVfx4B67J4oCg4+0ZEts7t7APhTS
         bD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713522401; x=1714127201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2KY1qHGzDqORwSMEQGEHWKQ/in6IbRIqlg3NOshudc=;
        b=D+ier0wvct4cJcd8QrO0L58VRSHD+Gm/wfkwTU7x6D3T/PaMGa2cZadLVLooSzJ9l0
         Z1+HLj4Dy8YB1MYRzaRrPK8FCFzPqRcE/vb/ITSKpq4fi6Z6DerQ/zx/rqtj7YyA/PIU
         c0X6kyOoifthCkihfqddZVWARIYPca50KZkHuRa0yVedNvGWbEDvtMnO96hji9FHcGiF
         Q8ovoXbU8WwzC0FMD7J4NKD5fdCRSZ5xNuiTCYXfgyFdjHm5O0dDJUGeBBByUgeeeJGi
         F7+iUu4ffsBQ2q303IaCC+vRCKpMpKkLiKL9anGahSBvSuTaxNGSgDi98Hf7qO37g3xS
         VuPQ==
X-Gm-Message-State: AOJu0YwWuON7lxb77nAZLHO8l/ZUcnD5byN6QBXoiuYUgZhKqJKJJx+T
	SHNXznsGPKord27EbY8jr6DHwJOmxulbIeD0r12/aXDkrbf7+2E9TsdTcQ==
X-Google-Smtp-Source: AGHT+IF+aolcmplTUv3+r7EDIVG5FRlwdxRGeH3w4Tl837WNPZ55z2u5A97WPOAzeKsEGf07JDg9JQ==
X-Received: by 2002:a17:906:b092:b0:a55:387b:ef07 with SMTP id x18-20020a170906b09200b00a55387bef07mr1229304ejy.13.1713522401013;
        Fri, 19 Apr 2024 03:26:41 -0700 (PDT)
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
Subject: [PATCH v2] xen/riscv: check whether the assembler has Zbb extension support
Date: Fri, 19 Apr 2024 12:26:35 +0200
Message-ID: <750fa79aecfae43031cbcda2b2f91248199d0794.1713522163.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the argument of the as-insn for the Zbb case to verify that
Zbb is supported not only by a compiler, but also by an assembler.

Also, check_extenstion(ext_name, "insn") helper macro is introduced
to check whether extension is supported by a compiler and an assembler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/arch.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 53f3575e7d..a3d7d97ab6 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
 
-zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
-zihintpause := $(call as-insn, \
-                      $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)
+# check_extension: Check whether extenstion is supported by a compiler and
+#                  an assembler.
+# Usage: $(call check_extension,extension_name,"instr")
+check_extension = $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(2),_$(1))
+
+zbb_insn := "andn t0, t0, t0"
+zbb := $(call check_extension,zbb,$(zbb_insn))
+zihintpause := $(call check_extension,zihintpause,"pause")
 
 extensions := $(zbb) $(zihintpause)
 
-- 
2.44.0


