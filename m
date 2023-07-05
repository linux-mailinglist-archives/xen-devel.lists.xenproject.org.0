Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F17480F6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558882.873377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyuw-000688-4o; Wed, 05 Jul 2023 09:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558882.873377; Wed, 05 Jul 2023 09:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyuw-00065G-22; Wed, 05 Jul 2023 09:35:22 +0000
Received: by outflank-mailman (input) for mailman id 558882;
 Wed, 05 Jul 2023 09:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyuu-0005bC-MI
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:20 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4121ccd7-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:18 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so1938751fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:18 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:17 -0700 (PDT)
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
X-Inumbo-ID: 4121ccd7-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549718; x=1691141718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ope1qDQvv3JfY3UstaYChJhi8PznZe74QQXVc0GdGf0=;
        b=yQRvRdMBEFY/hypIbPRrBs1HNR6BgT+uFRC3j4vCbpwZKfhBFNukSX/z4O8CuiX79M
         cKPEGVUUkcn2T1j+EbmgUH19JAJm7b0mMnka6IJnxQrsdzpnzfKMVj1X2qULH7bNni+t
         P3LALB7miE0ci6w4elxbWD4ycyvuYlbA1LvOeiCy3yPRy7m9/aZOVdB0KaMgKf2j6Stv
         CE15TA6SHQPsNCzMNEr6ziFf4+QWPr2tLTss/bdTnF7QuKo8viJS+IE4KKvBYQzDPZWy
         qegMdHx3ZbAF+Aarkdn1rd/99jl79WaZosFsx/ZFOcqUnPgOuocWdyXoRlcGSNKGLyzd
         K4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549718; x=1691141718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ope1qDQvv3JfY3UstaYChJhi8PznZe74QQXVc0GdGf0=;
        b=Nj2OjRadSMQ+H1dsAzgvB0oY19Hcx2zkjksr62e6J0vpJ6BfZvGoKlqeYJN+OL3nCU
         WXkzDCHtFGlehnoF72AdsgHS++2ZhOWLEj08hynb0DD6P3x/rVQ6jThljfitZb6++r5M
         tP3bMYpnVUz3EfEZVBUYeX1pnxJ9Mli2fWulOrDlp8Y9Jx3LPjQXBUo4A9r6MS2ln6MX
         KqX36sL/QDtdUiyzXh7yzKmb1EHs444qvEAF6NRyhOPu+ztsLKnn9vHW3NYCGF54Thk0
         qO1Y17xtpgoZ0vVl3iBXPC3Th2B2UZHwGDOY7YHzY3ltoC560sPHvv8CCRScOmxDg19D
         MVNQ==
X-Gm-Message-State: ABy/qLZwctYKcwnFkieH6JnU2213WVd/qeeJgC2xcnbnI/98IgmlHZeg
	Q1aFR9cV/82d8zKRYPEORWZiFZt3aarQ++h3Dg8=
X-Google-Smtp-Source: APBJJlFUO0g/R6+68G1F19Zc1rsGwbxz5DkB4z9w6ruFa/qeFCAUCb3VSNCVeNO3kT8pSD6WhwSixg==
X-Received: by 2002:a2e:a17a:0:b0:2b6:dc84:b93e with SMTP id u26-20020a2ea17a000000b002b6dc84b93emr8292683ljl.21.1688549718034;
        Wed, 05 Jul 2023 02:35:18 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to arch_domain_teardown()
Date: Wed,  5 Jul 2023 11:34:11 +0200
Message-Id: <20230705093433.2514898-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a progress state for tee_domain_teardown() to be called from
arch_domain_teardown(). tee_domain_teardown() calls the new callback
domain_teardown() in struct tee_mediator_ops.

An empty domain_teardown() callback is added to the OP-TEE mediator.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/domain.c              | 36 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/tee/tee.h |  7 ++++++
 xen/arch/arm/tee/optee.c           |  6 +++++
 xen/arch/arm/tee/tee.c             |  8 +++++++
 4 files changed, 57 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 15d9709a97d2..18171decdc66 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -795,6 +795,42 @@ fail:
 
 int arch_domain_teardown(struct domain *d)
 {
+    int ret = 0;
+
+    BUG_ON(!d->is_dying);
+
+    /* See domain_teardown() for an explanation of all of this magic. */
+    switch ( d->teardown.arch_val )
+    {
+#define PROGRESS(x)                             \
+        d->teardown.arch_val = PROG_ ## x;      \
+        fallthrough;                            \
+    case PROG_ ## x
+
+        enum {
+            PROG_none,
+            PROG_tee,
+            PROG_done,
+        };
+
+    case PROG_none:
+        BUILD_BUG_ON(PROG_none != 0);
+
+    PROGRESS(tee):
+        ret = tee_domain_teardown(d);
+        if ( ret )
+            return ret;
+        break;
+
+    PROGRESS(done):
+        break;
+
+#undef PROGRESS
+
+    default:
+        BUG();
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index f483986385c8..da324467e130 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -34,6 +34,7 @@ struct tee_mediator_ops {
      * guest and create own structures for the new domain.
      */
     int (*domain_init)(struct domain *d);
+    int (*domain_teardown)(struct domain *d);
 
     /*
      * Called during domain destruction to relinquish resources used
@@ -62,6 +63,7 @@ struct tee_mediator_desc {
 
 bool tee_handle_call(struct cpu_user_regs *regs);
 int tee_domain_init(struct domain *d, uint16_t tee_type);
+int tee_domain_teardown(struct domain *d);
 int tee_relinquish_resources(struct domain *d);
 uint16_t tee_get_type(void);
 
@@ -93,6 +95,11 @@ static inline int tee_relinquish_resources(struct domain *d)
     return 0;
 }
 
+static inline int tee_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 static inline uint16_t tee_get_type(void)
 {
     return XEN_DOMCTL_CONFIG_TEE_NONE;
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 301d205a36c5..c91bd7d5ac25 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -268,6 +268,11 @@ static int optee_domain_init(struct domain *d)
     return 0;
 }
 
+static int optee_domain_teardown(struct domain *d)
+{
+    return 0;
+}
+
 static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
 {
     return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
@@ -1732,6 +1737,7 @@ static const struct tee_mediator_ops optee_ops =
 {
     .probe = optee_probe,
     .domain_init = optee_domain_init,
+    .domain_teardown = optee_domain_teardown,
     .relinquish_resources = optee_relinquish_resources,
     .handle_call = optee_handle_call,
 };
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 3964a8a5cddf..ddd17506a9ff 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -52,6 +52,14 @@ int tee_domain_init(struct domain *d, uint16_t tee_type)
     return cur_mediator->ops->domain_init(d);
 }
 
+int tee_domain_teardown(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->ops->domain_teardown(d);
+}
+
 int tee_relinquish_resources(struct domain *d)
 {
     if ( !cur_mediator )
-- 
2.34.1


