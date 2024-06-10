Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4E2901B73
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736904.1143001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYul-000368-Hz; Mon, 10 Jun 2024 06:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736904.1143001; Mon, 10 Jun 2024 06:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYul-00033v-BJ; Mon, 10 Jun 2024 06:53:59 +0000
Received: by outflank-mailman (input) for mailman id 736904;
 Mon, 10 Jun 2024 06:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYuj-0001oX-J5
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34a79980-26f6-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 08:53:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so528756866b.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:56 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:54 -0700 (PDT)
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
X-Inumbo-ID: 34a79980-26f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002435; x=1718607235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0XZWV38zo7fRMFW2k6millPwbwyTFNlIqQWXfkZcoE=;
        b=wm3NVcf0cwmsKRDHMpzk0pUjs8pRNsKotohsW5zAUtAxPqcjiweXaPjV15z2nk83Dn
         1qe7DYXdaGjoyVZW+UzaKiufbfdrDI5LNPOHPsXhb1k8qDHBisLhPMHi0No75/eizajk
         Fq4Nz1G6LT+UXrGT1Jf5NOk6jtu0tun/5PObGi/fUJE8eGrOfEYocrSrj7dIUD4zvuGX
         RTlQW/pyQossoInGJS4gvs71Bhc4XmWN1kBru3mBbGTb5FYtqtsncnIDBgrIC3hwPWNe
         u7aADhnSGB6vWvFmaHFSZgy+tRPffv2PaLfk0DSp+Z+IqDo8lF3gN2Jma00mEBRmZZBr
         jnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002435; x=1718607235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0XZWV38zo7fRMFW2k6millPwbwyTFNlIqQWXfkZcoE=;
        b=NCfN7gDrafE5mYqYlrA+BE7VSyzLsQyVBuWHz0ICbsDsPNBkOMi+Ah1PJA5skvfKVs
         k0uDNyFCX3FtMOln7FNy+rV6kJ4h1ZU4ZNrJcspLF2+kBofxVU4jemyHbVqWwC/rzwli
         fcT6gNw+DfZHxZ7D/Abln4/pZB1kO65b/griFFv35XyGGbMW/L9eGtPrs4BA/yocSvFv
         je2USAZHaHnuxlOu1O40sHZnsfpiFheK39/Mb6HOUA0MS8ZWIg5hiaDMK/7YecDEx6L2
         IZvbKRNsh+SgNHKMf0OMaaSSE98+NgOcc0qir/5XcDYBAu2xo5PcXR7bcj+RiSqJBa4y
         D0Jw==
X-Gm-Message-State: AOJu0YykQRm73cX6ALs4b44yrUbgH9utKduQ6bftTZGoTIRcbixWS6eX
	HIuUFqHU8PTPNM2wIodF/90+tCVNjQ98XFF0wBVr0SpYABCScGlqo7/4MEyJAdQ3KEM2HCYXuH3
	I744=
X-Google-Smtp-Source: AGHT+IFrqovL90KjjtIWH7ELqoOBQ3DlSigv3se5/sV3vqUZIu9PEL+pc5diOLHr+PJK6s+8Xzun2Q==
X-Received: by 2002:a17:906:29d5:b0:a6f:1b40:82ab with SMTP id a640c23a62f3a-a6f1b408397mr163610266b.76.1718002434843;
        Sun, 09 Jun 2024 23:53:54 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 5/7] xen/arm: add and call init_tee_secondary()
Date: Mon, 10 Jun 2024 08:53:41 +0200
Message-Id: <20240610065343.2594943-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add init_tee_secondary() to the TEE mediator framework and call it from
start_secondary() late enough that per-cpu interrupts can be configured
on CPUs as they are initialized. This is needed in later patches.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v5->v6:
- Rename init_tee_interrupt() to init_tee_secondary() as requested
---
 xen/arch/arm/include/asm/tee/tee.h | 8 ++++++++
 xen/arch/arm/smpboot.c             | 2 ++
 xen/arch/arm/tee/tee.c             | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index da324467e130..6bc13da885b6 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -28,6 +28,9 @@ struct tee_mediator_ops {
      */
     bool (*probe)(void);
 
+    /* Initialize secondary CPUs */
+    void (*init_secondary)(void);
+
     /*
      * Called during domain construction if toolstack requests to enable
      * TEE support so mediator can inform TEE about new
@@ -66,6 +69,7 @@ int tee_domain_init(struct domain *d, uint16_t tee_type);
 int tee_domain_teardown(struct domain *d);
 int tee_relinquish_resources(struct domain *d);
 uint16_t tee_get_type(void);
+void init_tee_secondary(void);
 
 #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
@@ -105,6 +109,10 @@ static inline uint16_t tee_get_type(void)
     return XEN_DOMCTL_CONFIG_TEE_NONE;
 }
 
+static inline void init_tee_secondary(void)
+{
+}
+
 #endif  /* CONFIG_TEE */
 
 #endif /* __ARCH_ARM_TEE_TEE_H__ */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 93a10d7721b4..04e363088d60 100644
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
+    init_tee_secondary();
 
     local_abort_enable();
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index ddd17506a9ff..9fd1d7495b2e 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -96,6 +96,12 @@ static int __init tee_init(void)
 
 __initcall(tee_init);
 
+void __init init_tee_secondary(void)
+{
+    if ( cur_mediator && cur_mediator->ops->init_secondary )
+        cur_mediator->ops->init_secondary();
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


