Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C38D51E6
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732959.1139035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhZ-0004ya-Gm; Thu, 30 May 2024 18:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732959.1139035; Thu, 30 May 2024 18:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhZ-0004tc-Ay; Thu, 30 May 2024 18:40:37 +0000
Received: by outflank-mailman (input) for mailman id 732959;
 Thu, 30 May 2024 18:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCkhX-0004ea-TO
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 18:40:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 195f3364-1eb4-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 20:40:34 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so94041966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 11:40:34 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e6f02d29sm4086666b.14.2024.05.30.11.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 11:40:32 -0700 (PDT)
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
X-Inumbo-ID: 195f3364-1eb4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717094433; x=1717699233; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuATIEzMZcMO0sma4DN6PPyKFK9rWyN48A84jE2N8B4=;
        b=dVMD198jeziMqpU+HVNRBi0zdyMUDQ/QNvF11a0Pi/xmoTFpXHcy13BZdMwjToKyP/
         ITiJ9AxlN3Beub9z4ZMv384DzTuqls09lAFw5ydb8vawHnrk/ct6ZPjK+Y71iM7BgN1j
         hB5SrCLNCtgFCdvbupmH1tF4orj7znBaEUaRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094433; x=1717699233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuATIEzMZcMO0sma4DN6PPyKFK9rWyN48A84jE2N8B4=;
        b=H37o9fCFKDHEuRErTBIhpDKDrNQhukbW3UWe3zUrSCjMTfEfmvNgp6JTaw3GfADMqi
         SrOfrTqa343BhA8zW52pBB0ME1Fcj+tdZ4yavdwdrvnEq8QPgTwxhb/D05KDDGwT/MQT
         VLPvjClc+uBBrCJd0xNFtaE8qjUYR3uEdWa8FJj37LvQV9aBJVw7tQX4tgqBGQgPWGB9
         Ad449JJxiH6MVS/cqYBAArLI+hMlkICEk4Fo/1AfI91A7r5EHbuwx8GZLR5GhOF6v8bU
         Hd1lgEi+yEEMvqXyli8UsoCCLnCmdQ0LvAd9xJ6uHbnFespUWA9Ova5+cJMVt/8/ux0x
         SbPw==
X-Gm-Message-State: AOJu0YzxupP51+uTbcgrPBEYTWOU/q7WtqYbyNpo4Nsk3c6EzrFBDRc8
	1f809OjIZWUW2lNE2mZQGrNHsoDn1qEXips5mzdyBIDlivtrPC8JsgUl6T6rKC+5NLPvP1KrCzY
	T
X-Google-Smtp-Source: AGHT+IHI7hSinh5KOPtR5MaVfNKKi6KsCTPQWGoxfcps63uJaoA2hCPyH6LCOpUNr5QWhTyaxvVRbw==
X-Received: by 2002:a17:906:7f8e:b0:a62:a63c:18f0 with SMTP id a640c23a62f3a-a65e8d12070mr192357266b.1.1717094433363;
        Thu, 30 May 2024 11:40:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/2] arch/irq: Centralise no_irq_type
Date: Thu, 30 May 2024 19:40:27 +0100
Message-Id: <20240530184027.44609-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530184027.44609-1-andrew.cooper3@citrix.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Having no_irq_type defined per arch, but using common callbacks is a mess, and
particualrly hard to bootstrap a new architecture with.

Now that the ack()/end() hooks have been exported suitably, move the
definition of no_irq_type into common/irq.c, and into .rodata for good
measure.

No functional change, but a whole lot less tangled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

Oleksii: For RISC-V, you should only need to provide a irq_ack_none() stub now.
---
 xen/arch/arm/irq.c    | 10 ----------
 xen/arch/ppc/stubs.c  |  9 ---------
 xen/arch/x86/irq.c    |  9 ---------
 xen/common/irq.c      | 13 +++++++++++++
 xen/include/xen/irq.h |  2 +-
 5 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7138f9e7c283..e5fb26a3de2d 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -45,16 +45,6 @@ void irq_end_none(struct irq_desc *irq)
     gic_hw_ops->gic_host_irq_type->end(irq);
 }
 
-hw_irq_controller no_irq_type = {
-    .typename = "none",
-    .startup = irq_startup_none,
-    .shutdown = irq_shutdown_none,
-    .enable = irq_enable_none,
-    .disable = irq_disable_none,
-    .ack = irq_ack_none,
-    .end = irq_end_none
-};
-
 static irq_desc_t irq_desc[NR_IRQS];
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 4e03428e071a..923f0e7b2095 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -139,15 +139,6 @@ void irq_ack_none(struct irq_desc *desc)
     BUG_ON("unimplemented");
 }
 
-hw_irq_controller no_irq_type = {
-    .typename = "none",
-    .startup = irq_startup_none,
-    .shutdown = irq_shutdown_none,
-    .enable = irq_enable_none,
-    .disable = irq_disable_none,
-    .ack = irq_ack_none,
-};
-
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index cfd7a08479d2..e36e06deaa68 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -472,15 +472,6 @@ void cf_check irq_ack_none(struct irq_desc *desc)
     ack_bad_irq(desc->irq);
 }
 
-hw_irq_controller no_irq_type = {
-    "none",
-    irq_startup_none,
-    irq_shutdown_none,
-    irq_enable_none,
-    irq_disable_none,
-    irq_ack_none,
-};
-
 static vmask_t *irq_get_used_vector_mask(int irq)
 {
     vmask_t *ret = NULL;
diff --git a/xen/common/irq.c b/xen/common/irq.c
index 7225b4637486..29729349a6f2 100644
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -3,6 +3,19 @@
 
 DEFINE_PER_CPU(const struct cpu_user_regs *, irq_regs);
 
+const hw_irq_controller no_irq_type = {
+    .typename  = "none",
+    .startup   = irq_startup_none,
+    .shutdown  = irq_shutdown_none,
+    .enable    = irq_enable_none,
+    .disable   = irq_disable_none,
+    .ack       = irq_ack_none,
+
+#ifdef irq_end_none /* Hook is optional per arch */
+    .end       = irq_end_none,
+#endif
+};
+
 int init_one_irq_desc(struct irq_desc *desc)
 {
     int err;
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index b71f65db8621..327cd2217c7e 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -122,7 +122,7 @@ extern int request_irq(unsigned int irq, unsigned int irqflags,
                void (*handler)(int irq, void *dev_id),
                const char *devname, void *dev_id);
 
-extern hw_irq_controller no_irq_type;
+extern const hw_irq_controller no_irq_type;
 void cf_check no_action(int cpl, void *dev_id);
 unsigned int cf_check irq_startup_none(struct irq_desc *desc);
 void cf_check irq_actor_none(struct irq_desc *desc);
-- 
2.30.2


