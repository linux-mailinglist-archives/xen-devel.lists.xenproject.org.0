Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA398D2E1C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731501.1137079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhR-0005AW-57; Wed, 29 May 2024 07:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731501.1137079; Wed, 29 May 2024 07:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhR-00056q-15; Wed, 29 May 2024 07:26:17 +0000
Received: by outflank-mailman (input) for mailman id 731501;
 Wed, 29 May 2024 07:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhP-0002xp-7I
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:15 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b99d04ef-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:26:11 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-529682e013dso2045289e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:11 -0700 (PDT)
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
X-Inumbo-ID: b99d04ef-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967572; x=1717572372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px3daIYvC5d3ihWRjkhDysb/DJOq/aAiZUJCtozW1Ns=;
        b=LA4eHj7skT1HsI4uWzgRhfNAZo7SnBYMQNsx5agvJ7gwsb2J/Vqw42wt77K1J+G4Bu
         fgONsnWw+w7ftjUdfSChH4wqXHGy6q8CPGPkbPi0ii0QtZytxVMWQjHzHnvvkwT1nj2+
         reBb9PO4UmgZIkwW2o4psRdg2RbrrtdAVfeA+AkNyhygb8Kp2y3+31xb3pXAAuFeKpgO
         IQB8/V4DdYcmXNC5SvTGTYbWWj92TPPhjJraWf0FdyPWBZE/gnZuYpiN4UY6MxdzvuwW
         tPH0wt8WmvT5f+Vyv5HzGOebGqARxyT53TU9oXaO/r3yL6SZVdHWNkRNsJwwJ40fqOzl
         pQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967572; x=1717572372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px3daIYvC5d3ihWRjkhDysb/DJOq/aAiZUJCtozW1Ns=;
        b=uImUovKYjA4c/TLcB5obFRmLO9XJ0nqEpPD9VkoSCzJ3P5XA8P5w3xZSq3HTy2WqsG
         KywJnvLrho4EEpP/tyHBCOIxjJnNDl4KsWAvZaNs8JvpcYZAIo8QLpGJWg+OLI9Lk9qB
         M65OPS2PjkpG5G3elhYipK7RbBkf1ilmwUn2LT1wITmLCT61XxHhOnvXfK/akkgzZKFz
         Yq7Gk/pXBNUkOtUUwdH9cd85cRbJSak0CDJSWoCFiiPfy5D/XRGspY9jNJlL9q63A763
         XNuktXSCKwF/jSI3XxHzkPRls4UyuEydkShzqSWzN0wfHxpbCwFy4UR18Ywwof6cbwLA
         ADOg==
X-Gm-Message-State: AOJu0Yy3LtSophNl45IhMU0Iz941RBumdL3G1DijDCpWFwjG/QEeGEmg
	oOrqh/bd9q1o+6tAFqSH2/MDlY1+4IJAarIEVRriWRiWJQZFi6Z4SCnHHqkrr/fl+nKS5WPeReF
	1ICA=
X-Google-Smtp-Source: AGHT+IHZbnpYtnOOu1mZzARWcnHwDkNNpf8A2L3wrm68sMOOMmvSDs1EjYrgF4UQT+PbkcE6gf4Tyg==
X-Received: by 2002:ac2:5dd3:0:b0:521:a96:bf15 with SMTP id 2adb3069b0e04-52965198d34mr8322912e87.38.1716967572307;
        Wed, 29 May 2024 00:26:12 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v5 6/7] xen/arm: add and call tee_free_domain_ctx()
Date: Wed, 29 May 2024 09:25:58 +0200
Message-Id: <20240529072559.2486986-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tee_free_domain_ctx() to the TEE mediator framework.
tee_free_domain_ctx() is called from arch_domain_destroy() to allow late
freeing of the d->arch.tee context. This will simplify access to
d->arch.tee for domains retrieved with rcu_lock_domain_by_id().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/domain.c              | 1 +
 xen/arch/arm/include/asm/tee/tee.h | 6 ++++++
 xen/arch/arm/tee/tee.c             | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 34cbfe699a68..61e46a157ccc 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -837,6 +837,7 @@ int arch_domain_teardown(struct domain *d)
 
 void arch_domain_destroy(struct domain *d)
 {
+    tee_free_domain_ctx(d);
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
      */
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index eda8a8aa38f2..2e99a38184be 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -38,6 +38,7 @@ struct tee_mediator_ops {
      */
     int (*domain_init)(struct domain *d);
     int (*domain_teardown)(struct domain *d);
+    void (*free_domain_ctx)(struct domain *d);
 
     /*
      * Called during domain destruction to relinquish resources used
@@ -70,6 +71,7 @@ int tee_domain_teardown(struct domain *d);
 int tee_relinquish_resources(struct domain *d);
 uint16_t tee_get_type(void);
 void init_tee_interrupt(void);
+void tee_free_domain_ctx(struct domain *d);
 
 #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
@@ -113,6 +115,10 @@ static inline void init_tee_interrupt(void)
 {
 }
 
+static inline void tee_free_domain_ctx(struct domain *d)
+{
+}
+
 #endif  /* CONFIG_TEE */
 
 #endif /* __ARCH_ARM_TEE_TEE_H__ */
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8117fd55123e..cb65f187f51f 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -102,6 +102,12 @@ void __init init_tee_interrupt(void)
         cur_mediator->ops->init_interrupt();
 }
 
+void tee_free_domain_ctx(struct domain *d)
+{
+    if ( cur_mediator && cur_mediator->ops->free_domain_ctx)
+        cur_mediator->ops->free_domain_ctx(d);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


