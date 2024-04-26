Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E6C8B3B32
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712928.1113834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NQ4-0007ri-97; Fri, 26 Apr 2024 15:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712928.1113834; Fri, 26 Apr 2024 15:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NQ4-0007pK-5f; Fri, 26 Apr 2024 15:23:24 +0000
Received: by outflank-mailman (input) for mailman id 712928;
 Fri, 26 Apr 2024 15:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mvt6=L7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s0NQ2-0007ou-Au
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:23:22 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e60a2e-03e0-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:23:20 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51b09c3a111so3188895e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:23:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f17-20020a17090660d100b00a587236e646sm5119948ejk.174.2024.04.26.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 08:23:18 -0700 (PDT)
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
X-Inumbo-ID: e9e60a2e-03e0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714145000; x=1714749800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V22gP2pvDYFnwIOuSYvkYUyVE54XbbjG3Emc8WQZkU8=;
        b=VucHo0G57H8mBTJC5rb5N0eFN9MntiXbTHiUKatTKBR5fYJwWpYpPJquwjsVj25b2s
         y17zoibYWRmVbWmkR/O/OQbYS95pxOkVM/u2lZ35aHB4kbfBjLZH44tPZc4C328k0bcA
         4CxiUcVJ82urYKervSYfhqHjSld7iDnPzxrrs0QT/INcpMU7jGBwPtzN15mSQKqr8lEx
         4nm8Mo2leXE4DrEgpq4j8OrdBz5Pujd1mUmBy0O1uMSXPU90PBH2N4I117a2dR3lNL6p
         Vp/0PEEtK5pAInQ6rRQJGiH7cDV73goeVrbmaPXydJW3aUDnb8TbV5V4gRLwcu3EnT3p
         9Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145000; x=1714749800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V22gP2pvDYFnwIOuSYvkYUyVE54XbbjG3Emc8WQZkU8=;
        b=J+C5XhhyqV2NAMPZK5BuGyK8SB7TcoREeKDqlGq/9ZKJLb6BbzG/UYKCEq92DeIJ2G
         8aGZjvd45s9PDez4z+jPC7Y0DFPD3jkro4cV+q9AYvRbFWCKgD2uUTwSn47fg9EHe6+2
         ht5tyIEGblR6EVcnDYuHaKi8TKiRASzC3yzrXyOF+8258xyke9CG02/6xX8epVVx7QM0
         G+k6Ll61QJwFWlb5uyQwfC81V70QBymLtTRf4RkXxrsduAeIHYKGl7Sib6PeHSCaNj0R
         AC9xpejNyWybVuI9qZp5kpYtzTftgVwrd2FJmT9wa5na5ksQD/5CaD6pQgMMnn0LOMrn
         OH6Q==
X-Gm-Message-State: AOJu0YxT6S91LKzw9XgyK3r+nauWeDdtuW7fDRGm1LDrfB22B9HBN9zZ
	qaQ35N3RKGNdBfFE/QS/85WIvguW8XobbC7Ako6waVdicMWUlkXO2MqMIA==
X-Google-Smtp-Source: AGHT+IFWZjc5RfiNVABR/yWormGTljR4ie145up6Zof5AVf4R3W/UQsr0eWEwccHs5oxNfOqAMB/Ig==
X-Received: by 2002:ac2:4908:0:b0:518:c959:8be with SMTP id n8-20020ac24908000000b00518c95908bemr2029873lfi.58.1714144999230;
        Fri, 26 Apr 2024 08:23:19 -0700 (PDT)
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
Subject: [PATCH v1] xen/riscv: improve check-extension() macro
Date: Fri, 26 Apr 2024 17:23:15 +0200
Message-ID: <6f37ce6b115b682118a8332b2a81b49358c88587.1714144943.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, the check-extension() macro has 1 argument instead of 2.
This change helps to reduce redundancy around usage of extensions
name (in the case of the zbb extension, the name was used 3 times).

To implement this, a new variable was introduced:
  <extension name>-insn
which represents the instruction support that is being checked.

Additionally, zbb-insn is updated to use $(comma) instead of ",".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/arch.mk | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index dd242c91d1..17827c302c 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -13,12 +13,21 @@ riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
 
 # check-extension: Check whether extenstion is supported by a compiler and
 #                  an assembler.
-# Usage: $(call check-extension,extension_name,"instr")
-check-extension = $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(2),_$(1))
-
-zbb-insn := "andn t0, t0, t0"
-zbb := $(call check-extension,zbb,$(zbb-insn))
-zihintpause := $(call check-extension,zihintpause,"pause")
+# Usage: $(call check-extension,extension_name).
+#        it should be defined variable with following name:
+#          <extension name>-insn := "insn"
+#        which represents an instruction of extension support of which is
+#        going to be checked.
+define check-extension =
+$(eval $(1) := \
+	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
+endef
+
+zbb-insn := "andn t0$(comma)t0$(comma)t0"
+$(call check-extension,zbb)
+
+zihintpause-insn := "pause"
+$(call check-extension,zihintpause)
 
 extensions := $(zbb) $(zihintpause)
 
-- 
2.44.0


