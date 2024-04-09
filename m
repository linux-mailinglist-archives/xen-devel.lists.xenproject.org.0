Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A899689D3AE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 10:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702177.1097044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru6P1-00024Z-2J; Tue, 09 Apr 2024 08:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702177.1097044; Tue, 09 Apr 2024 08:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru6P0-000232-V9; Tue, 09 Apr 2024 08:00:22 +0000
Received: by outflank-mailman (input) for mailman id 702177;
 Tue, 09 Apr 2024 08:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDp6=LO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ru6Oz-00022w-7s
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 08:00:21 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3556270b-f647-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 10:00:19 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so6287315e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 01:00:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 t23-20020ac243b7000000b005134b126f0asm1473559lfl.110.2024.04.09.01.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 01:00:17 -0700 (PDT)
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
X-Inumbo-ID: 3556270b-f647-11ee-843a-3f19d20e7db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712649618; x=1713254418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcxNNAojuzG2gOvWHpoiddDVeCZsTLXWqyHvk5fToAw=;
        b=GZBvlE1bM+L6vMB0zE9hxQ00u7RAQYCqpyy7fKamAUc1rjbbLiKykivZL5lGt+6Il4
         spqqVkL5Syrxx+W4CVt9A/6j2rIGqFpbA7v7JjFrl3NnLqWF2zRWbiF2z7Cd/i9pCf8+
         1XKYvngvt3ggySfR6/efHTmf6pYE0zpYVTqdh1rwXqTgQ16KT2rDidcUrXiqvqfmNizp
         Wm7oBVA9dqPHX4nQKohlCE/Ad7Pybg1EB9R8QtaBM5ipEiIfuyMezKGaKaHbV8sGVj+f
         xuNT3kHuZeqybBRblwXKibMl1wb3gVm0gZUhB87p08xGo2GjUs4joqbSKXekjAAg0AFi
         gKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712649618; x=1713254418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcxNNAojuzG2gOvWHpoiddDVeCZsTLXWqyHvk5fToAw=;
        b=gCMSh4h5ZlGhjj8abwdM/irlTNo6l3yJZixTyu1pXkUSEQqKezsBWX2p2y9YcKcEFc
         gm+uJ/FyKyXiq0yaldNv+Bb+5+DmCD31MW75RkEO1Zc2krnqwnzZKFCkdvpxDYNuuC4b
         CEucoT8T3oQhrusU/V57qOrFCH/uFKdGq1rdkbL83pEVtr5TiSdEuSWCP/5JEe2AnZd/
         A51ISa4HCOL5Q/xqMf+Yba7coBVshVCf+d2IFzDwzNnNzQlc3mvfNbLs0EAKdkmRl/rj
         CTgyBIjPyXKdwD0jZAH7bLdqwtiuBTWUciI0P3DyKbkLZODBxDjhmSSfQ8MMf7uvAyst
         o/sA==
X-Gm-Message-State: AOJu0YxRL2ihF1YUK6eGtgdrNR/EyzI6+nIPTB7Z20LWwjRn9T4BTZfb
	K9tk3oABD9ELaFei/YdvNHxe3h0FHeILopR6kxpw5Mkzw6dRzQvoig0zXwoZ
X-Google-Smtp-Source: AGHT+IF0A3fsa1a4GGlNE04oi+vd/QVZ8UmhKYc1QNcrRwkkTofuSLA8gxXrwh+wzdyX50WXo1LMlw==
X-Received: by 2002:a05:6512:2525:b0:515:fc44:b3f7 with SMTP id be37-20020a056512252500b00515fc44b3f7mr10784169lfb.24.1712649618012;
        Tue, 09 Apr 2024 01:00:18 -0700 (PDT)
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
Subject: [PATCH] xen/riscv: check whether the assembler has Zbb extension support
Date: Tue,  9 Apr 2024 10:00:14 +0200
Message-ID: <10816604a8625b5052f134e54c406fb4e7b6c898.1712649614.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the argument of the as-insn for the Zbb case to verify that
Zbb is supported not only by a compiler, but also by an assembler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/arch.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 53f3575e7d..6c53953acb 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,7 +11,8 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
 
-zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
+zbb_insn := "andn t0, t0, t0"
+zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,${zbb_insn},_zbb)
 zihintpause := $(call as-insn, \
                       $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)
 
-- 
2.44.0


