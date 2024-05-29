Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D68D2E1B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731500.1137064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhN-0004aJ-RO; Wed, 29 May 2024 07:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731500.1137064; Wed, 29 May 2024 07:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhN-0004Xs-MU; Wed, 29 May 2024 07:26:13 +0000
Received: by outflank-mailman (input) for mailman id 731500;
 Wed, 29 May 2024 07:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhM-0003Qb-Ar
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:12 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b97cdd2f-1d8c-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 09:26:11 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52ae14e78e5so352601e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:09 -0700 (PDT)
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
X-Inumbo-ID: b97cdd2f-1d8c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967571; x=1717572371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqcaM/22lmEA4Im1sZdSJGF9/Zga7zG5i6aY5+pENkc=;
        b=JoqR5twlnKnlx641Z91rxxU7T2zsze1jbWPyq7jV7bIcw8vMuN6wJR7Q3SoSsE4Y1Q
         xdzm6RUEM/vpArvjzXs7plobqRFoJ26zqQQ6Kbcn+e1NARTno2gd6YPczuNFYxvsWCpJ
         2fvYGpX0AoOlqatB4YnI+w54CeDVmCCJ1LZo8oiMuuj+GklOb/nJhbD5aWdEjNXKAJ/N
         ioHdR53nLpu0+kjZh+pCe8o5HnJk3vPj59hGIgM8cG43lU/3mUWNH/pyIIzhGHrV3PsY
         X7pUgi/komKUFXjbQR8Iwpt2IQxeUp+RoSkLnya1PpFEke9SXqXfwVk7l+FfRtWt4DMV
         Rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967571; x=1717572371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqcaM/22lmEA4Im1sZdSJGF9/Zga7zG5i6aY5+pENkc=;
        b=v2A/XgjRNFAKdaaFu6kZlF40djo64q5chEUGkphmnxh+hD31caEXmCIbEYrLMu1hIa
         PltF7hUaIBJCWkXC9vQTXaX6te3JtSkYfpf2lVD5vEKScjN7P6qEVmYOS8Ki/3Enyom5
         J675lGnu6pSkA/lVkTw8DjIfnB6awx4GAoD0Uz1/mZ3mnwGP2IVwlO6rnU8O2GzGaPU9
         de3PrtDZ/yGXScTFHsVzltu/M73J9JrtiB50VNA8+GzrDbcr2N8Zb5cUX9U2qFGnAoat
         RUvIiPxBa/0LaTqMDXFMYWL3AZ74BybhC0q0mNGEXxw93+ASDI4W+FY6hHncC0JB3v8K
         z+GQ==
X-Gm-Message-State: AOJu0YxdRXJ9dwOFy18PpGS3BGs8K4Agd+W2v8luHbtLe9UfK58fuNsi
	NZwtfkg9WoVKDzKRKN36v08y5PgR6a0FeWfBJiQMaB8wib0at0ifkk0Wlny9pbu1Ij9DdW9fRO7
	IRfo=
X-Google-Smtp-Source: AGHT+IHk4ObidGwCD812vZGe+Z1dmGa50LEp02UVipqGGD3NRtyQPamoN4Tga8ZC5srPW8Wo0VdLlA==
X-Received: by 2002:a05:6512:eaa:b0:51c:d6c9:e9a3 with SMTP id 2adb3069b0e04-52964aba890mr10135809e87.17.1716967570797;
        Wed, 29 May 2024 00:26:10 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v5 5/7] xen/arm: add and call init_tee_interrupt()
Date: Wed, 29 May 2024 09:25:57 +0200
Message-Id: <20240529072559.2486986-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add init_tee_interrupt() to the TEE mediator framework and call it from
start_secondary() late enough that per-cpu interrupts can be configured
on CPUs as they are initialized. This is needed in later patches.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/include/asm/tee/tee.h | 8 ++++++++
 xen/arch/arm/smpboot.c             | 2 ++
 xen/arch/arm/tee/tee.c             | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index da324467e130..eda8a8aa38f2 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -28,6 +28,9 @@ struct tee_mediator_ops {
      */
     bool (*probe)(void);
 
+    /* Initialize eventual interrupt handlers on the secondary CPUs */
+    void (*init_interrupt)(void);
+
     /*
      * Called during domain construction if toolstack requests to enable
      * TEE support so mediator can inform TEE about new
@@ -66,6 +69,7 @@ int tee_domain_init(struct domain *d, uint16_t tee_type);
 int tee_domain_teardown(struct domain *d);
 int tee_relinquish_resources(struct domain *d);
 uint16_t tee_get_type(void);
+void init_tee_interrupt(void);
 
 #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
@@ -105,6 +109,10 @@ static inline uint16_t tee_get_type(void)
     return XEN_DOMCTL_CONFIG_TEE_NONE;
 }
 
+static inline void init_tee_interrupt(void)
+{
+}
+
 #endif  /* CONFIG_TEE */
 
 #endif /* __ARCH_ARM_TEE_TEE_H__ */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 93a10d7721b4..e1c1e20efd98 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -29,6 +29,7 @@
 #include <asm/procinfo.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/tee/tee.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
@@ -401,6 +402,7 @@ void asmlinkage start_secondary(void)
      */
     init_maintenance_interrupt();
     init_timer_interrupt();
+    init_tee_interrupt();
 
     local_abort_enable();
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index ddd17506a9ff..8117fd55123e 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -96,6 +96,12 @@ static int __init tee_init(void)
 
 __initcall(tee_init);
 
+void __init init_tee_interrupt(void)
+{
+    if ( cur_mediator && cur_mediator->ops->init_interrupt)
+        cur_mediator->ops->init_interrupt();
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


