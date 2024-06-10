Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE10901B6F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736905.1143006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYul-0003BV-Sn; Mon, 10 Jun 2024 06:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736905.1143006; Mon, 10 Jun 2024 06:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYul-000366-Lq; Mon, 10 Jun 2024 06:53:59 +0000
Received: by outflank-mailman (input) for mailman id 736905;
 Mon, 10 Jun 2024 06:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYuj-0002SJ-VW
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35603f96-26f6-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 08:53:57 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so594629866b.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:57 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:55 -0700 (PDT)
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
X-Inumbo-ID: 35603f96-26f6-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002436; x=1718607236; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VXeaEelKJYpG/6TyRv7n3Wpu8YGpUrR2rYBr36fFWI=;
        b=kTAnCAJnx9Thdpc0FXS2PUhrwcnsDYMb++DlD1CTsZu1OdpH4LM+3bxURpQTdgodMN
         Hn5TQr67piXzgCrOk94ZFY+ISeEZLUA/3JvSSG2XhuNn7jfnnvsl/Fd1Bxt/BU4MXxG7
         MACov1toSd84WvSEwzbWqwqrpO1HhqXWCfM6mr1jQKPiloxamLFibrvsUBm6yUtnhD+l
         kBvXLMXYfCSw7qhDPK8dKV6NtQNR7ssv0/ggeDlPqYDiA3t3nVc8EBWjiGU72A/eO2SD
         wsewUFmPnI9uJr8VMMpfo6d3A1ZvvS5XPcttbpHjRL45lNqRpdXP2515ByZ//ldPgvd9
         1bLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002436; x=1718607236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VXeaEelKJYpG/6TyRv7n3Wpu8YGpUrR2rYBr36fFWI=;
        b=k8gX/POf27nSrWfIALZwdwOWuMoYmloplDpxoPL6nhPnyxjvvANpl3shSqn20Sbb6U
         e0wDFWjiWITvcLkEcwiEAT9ZeMroTiwZ2IqSG1Pn5cZFJMe+NlXf1XOq5qn031q3wIuz
         Yp45ONf/FhrYp4jn7DQmdYyO9vAphkuQn7+VvVcvJrdb03M1r3dnj1GxvTjeDcdTZxLT
         zKLkCBztCVsn1pWymdrUgVav23bxYuWT7c2TEqsrL+WVcCCgCLAqk9de4O4K7NVUJBMY
         WryySP7/Nc7Huu3DcpcaAB8x4sY4QllgpmERTuvD/1Uo0QGFpoBnAFEgWnQ9+TLdLOgn
         aHNA==
X-Gm-Message-State: AOJu0YwegWssKE/fimCyT99Et9lvNoRaVyMHX6W+hSzSqV7lX6n2WRvk
	62bDzyVj8PogkBPuiwcjxwvf2D+moLNJDC49axxwpmcluHnFK8Rc68G/ZlPblXySqwCkp20hP3l
	MZ4Q=
X-Google-Smtp-Source: AGHT+IHNPbpnRBW3v3XVGITo/4pgqQeNlf8GqFQc2TOpQHtSgwbVAgzIPb6eK/wrE0lBSuIW9tPH6g==
X-Received: by 2002:a17:906:ca0f:b0:a6f:1d50:bf1e with SMTP id a640c23a62f3a-a6f1d50c0a1mr115826066b.43.1718002436462;
        Sun, 09 Jun 2024 23:53:56 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v6 6/7] xen/arm: add and call tee_free_domain_ctx()
Date: Mon, 10 Jun 2024 08:53:42 +0200
Message-Id: <20240610065343.2594943-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tee_free_domain_ctx() to the TEE mediator framework.
tee_free_domain_ctx() is called from arch_domain_destroy() to allow late
freeing of the d->arch.tee context. This will simplify access to
d->arch.tee for domains retrieved with rcu_lock_domain_by_id().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/domain.c              | 1 +
 xen/arch/arm/include/asm/tee/tee.h | 6 ++++++
 xen/arch/arm/tee/tee.c             | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8bde2f730dfb..7cfcefd27944 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -843,6 +843,7 @@ int arch_domain_teardown(struct domain *d)
 
 void arch_domain_destroy(struct domain *d)
 {
+    tee_free_domain_ctx(d);
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
      */
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 6bc13da885b6..0169fd746bcd 100644
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
 void init_tee_secondary(void);
+void tee_free_domain_ctx(struct domain *d);
 
 #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
@@ -113,6 +115,10 @@ static inline void init_tee_secondary(void)
 {
 }
 
+static inline void tee_free_domain_ctx(struct domain *d)
+{
+}
+
 #endif  /* CONFIG_TEE */
 
 #endif /* __ARCH_ARM_TEE_TEE_H__ */
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 9fd1d7495b2e..b1cae16c17a1 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -102,6 +102,12 @@ void __init init_tee_secondary(void)
         cur_mediator->ops->init_secondary();
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


