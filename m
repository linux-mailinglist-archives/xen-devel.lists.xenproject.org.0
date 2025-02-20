Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D86A3E2D6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894057.1302923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb7-0005rw-8l; Thu, 20 Feb 2025 17:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894057.1302923; Thu, 20 Feb 2025 17:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb7-0005o5-4C; Thu, 20 Feb 2025 17:44:29 +0000
Received: by outflank-mailman (input) for mailman id 894057;
 Thu, 20 Feb 2025 17:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAb4-0003tj-Oh
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:26 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fa0638-efb2-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 18:44:26 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so638001e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:26 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54619e7bc2esm1600904e87.244.2025.02.20.09.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:24 -0800 (PST)
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
X-Inumbo-ID: 53fa0638-efb2-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073466; x=1740678266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfTE4xLgX/dOLMTD+d3nRIgvQgv9cL+Smevhi13SZIg=;
        b=FFw3b8Sd8PTIP50nzlfZXlAe5+1tdabxvtmfv7Cbhe8fzUU55stqyYMQS5NHijlRWk
         RuNOmIRWYCy0w/mM3m0aUjlwu1qfahPNqFS2CbAgC6/0KDznHN5Bq4lb5QWE2NfxlE+W
         exHcr7NhvBFrrmYb7sDHco8ygH/xGOVYbjEmbmHO2irbh64X9yhfhZRDx3vDYPWg424v
         APRggCNeUBeejXO6WKc4KCQHhHcHMCSZzp1DAd1JMORsYeK8cQnGx95AmTBbiHv4GMTL
         D4s3ePhL+DmYkoEjc5FVYTJ0jzaukjzdbtJ2OTDsJVKnMnoTjQF4wWAzHRHNiukcdKn+
         0yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073466; x=1740678266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfTE4xLgX/dOLMTD+d3nRIgvQgv9cL+Smevhi13SZIg=;
        b=fTyBGDBVOthtel5cSOLOi0rjAOJtVl7YW2kP5IyZT22H782NWXPBGrGXDpntS751a9
         awntEYIEhEm8Jyvd8jv8xH3SSqkr6fsq4lhd/YvMRuwHYJSHCtN1FB5+ViORWv7oUA4l
         0QvfaDvpEUl/MQTnk4PP+KHDgg5TJpjyqbLHuIOp0VyzJwVpX94FYnAcURcQ957Pp550
         ut6oJanPpmvE096vf6z1jc/rLBva3BqN7sKqwVJdlBMQbVorkv3lHAjVXA3k7W9nleeo
         nga78M0bTz+WUBagR8l4pba/y7INXtCkC/e4GPXxiMm3+TjpsBgY2gWIzXx+GOuYC+y4
         NL1Q==
X-Gm-Message-State: AOJu0YwcKcjyfWGKxiw4vPlP7dHFjqvit7VidF22mwJ0312P3hmgGW9o
	hmrIcdATFzL3YgBflDoxyFIepg+ZRGBM9+mc4jAKVRDkpG7TnxNFfrns2Q==
X-Gm-Gg: ASbGncvT/lqDRt8GR75Q61RSrz+2fRMmYIw26SYGLh3jpUYlyRnIAk2Osz7IjquP9/V
	rf7ufFKtjd6yVyqsakM9+bgzJ1eZxP4sKCy+oYjVIdwlc/Zs1jDlDj2GHG25OKRD0aHDeLFx6st
	Xb90vFwRdSeV7t8JUuFFJe00V+tKWUq/Dmup0MMQ34U+VHb6yOjo79CWcg4Am7TXDHRrIWOkVGW
	syEyLlGPNzZCBP9yH6/1qukkAZqUxCK7HxJ2sJsLcc9g7p/rTcHngw9RH1zTrExNAJW9cfeX5H9
	nlBSN3voivFXXFA6
X-Google-Smtp-Source: AGHT+IFS9azdP4yjyl+lTGHngETcXp7QTofqYfYAR9N7GVeT8XwiyiU/hko02X75HvvPdjNYvUHTfQ==
X-Received: by 2002:a05:6512:b06:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-547241d9e06mr1651669e87.12.1740073465547;
        Thu, 20 Feb 2025 09:44:25 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.21 v7 3/4] xen/riscv: make zbb as mandatory
Date: Thu, 20 Feb 2025 18:44:14 +0100
Message-ID: <611e289e357a26490b95b2aa93d7288c77787171.1740071755.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740071755.git.oleksii.kurochko@gmail.com>
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to riscv/booting.txt, it is expected that Zbb should be supported.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
 - new patch.
---
 xen/arch/riscv/arch.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 3034da76cb..236ea7c8a6 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,7 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei
+riscv-march-y += _zicsr_zifencei_zbb
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
@@ -25,13 +25,10 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
-zbb-insn := "andn t0$(comma)t0$(comma)t0"
-$(call check-extension,zbb)
-
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zbb) $(zihintpause)
+extensions := $(zihintpause)
 
 extensions := $(subst $(space),,$(extensions))
 
-- 
2.48.1


