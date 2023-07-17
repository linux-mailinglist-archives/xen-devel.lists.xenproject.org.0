Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55794755CAD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564174.881464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXu-0005YB-Vp; Mon, 17 Jul 2023 07:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564174.881464; Mon, 17 Jul 2023 07:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXu-0005Qr-Qx; Mon, 17 Jul 2023 07:21:26 +0000
Received: by outflank-mailman (input) for mailman id 564174;
 Mon, 17 Jul 2023 07:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXt-0005A9-IH
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:25 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 888e111e-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:23 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fdb856482fso1593739e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:23 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:21 -0700 (PDT)
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
X-Inumbo-ID: 888e111e-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578482; x=1692170482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTfecuZmrRJwBVogB5ezh0l17VaUmLGIInWmzQbInCM=;
        b=U1NSUyiVi6jtMu3mg8RQU/en91jHmETszTobKfYoQmXczC1bl4tr9TwuZRHjsGsFkr
         v/1XmKo9NAkqovtQrqvO/e0YV70HUEDMGhWf1F30cpHGmUauCSnzIZLSaJBzdc0K33p3
         n5HQSF+3nTpRxoyx9sSWrrZpESUs6UMoLdzqt7LT6V5zR0XBBbsP2PWfSF7wH7yMPNNr
         p2P7SqALo0IJVZAQF8SYeBOLEoTDyXLKOXh1tpERWErEn/uJM+t6oEqG0YHPPKPsn4e7
         c2f4an7A8WnHzpxRJspn62Ux++SVEfrJRfuZSQQPtyadwDFiX6tJxzx72b2FI0lYQflF
         7bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578482; x=1692170482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTfecuZmrRJwBVogB5ezh0l17VaUmLGIInWmzQbInCM=;
        b=G+9QdqgkyzK5DAfvmazZ5Ca64S8k08qxIFIFKWwsIuoy8NcpjigNbxLP14+ljt+TvH
         7MaiL/ul1meT8qnOHuHShxvKBIO5aMeJOOX7jX3a+82tBAmoXFA2DqMixQh7ekY18AX2
         GyV7pHrOHkerA0saIWfjo2PRD/JHZ93JxR8qty3Ha/dnVzQdJ97AxtOT7xDvJSc2nz8M
         a9JAZndcklunmEuB8hnNFcfixnD1JX44H6xOQ342OR6n1zUb6jPpnOeP+nqKn4KUkbuJ
         cr72EdoTLEgLV97yETTpsxzE7yotmdXEnR3EMg9c3e3Na4b6ByKnfOFfL96zirGile+g
         vS9A==
X-Gm-Message-State: ABy/qLZauEUK6ok1j77FY5PX0Y2He7w+oWKahRvXhaykZtIs/KfNrKuk
	c79PnqseV5ewHYSefz7S/P0Mz7YYQcaMQ7Pmflw=
X-Google-Smtp-Source: APBJJlGS7Quup9l3ju/k3iUE/XW1VXwPVottBcHg+Om5+3MgG1Z2JfOJLGZfHQWUWvfP+7Tf3LpjMg==
X-Received: by 2002:a05:6512:3a89:b0:4fb:89e2:fc27 with SMTP id q9-20020a0565123a8900b004fb89e2fc27mr9113874lfu.54.1689578482395;
        Mon, 17 Jul 2023 00:21:22 -0700 (PDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v10 02/24] xen/arm: add TEE teardown to arch_domain_teardown()
Date: Mon, 17 Jul 2023 09:20:45 +0200
Message-Id: <20230717072107.753304-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a progress state for tee_domain_teardown() to be called from
arch_domain_teardown(). tee_domain_teardown() calls the new callback
domain_teardown() in struct tee_mediator_ops.

Note that the OP-TEE mediator should be updated in a future patch to use
the new teardown facility, that is not done here.

Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>

v9 -> v10

- Swapped Andrews tags in the commit message
- Added Bertand's tag
- Removed the erroneous unconditional break switch statement in
  arch_domain_teardown()
- Updated commit message to note that the OP-TEE mediator also should
  use the new teardown facility.
---
 xen/arch/arm/domain.c              | 35 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/tee/tee.h |  7 ++++++
 xen/arch/arm/tee/optee.c           |  6 +++++
 xen/arch/arm/tee/tee.c             |  8 +++++++
 4 files changed, 56 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 15d9709a97d2..3ae86ca620a4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -795,6 +795,41 @@ fail:
 
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


