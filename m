Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC43CDA062
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192705.1511835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-0000xC-LR; Tue, 23 Dec 2025 17:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192705.1511835; Tue, 23 Dec 2025 17:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-0000ta-EH; Tue, 23 Dec 2025 17:02:12 +0000
Received: by outflank-mailman (input) for mailman id 1192705;
 Tue, 23 Dec 2025 17:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vY5ly-0000rH-NJ
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:02:10 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e775447-e021-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 18:02:09 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so979261366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:02:09 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1306260566b.42.2025.12.23.09.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:08 -0800 (PST)
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
X-Inumbo-ID: 1e775447-e021-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766509329; x=1767114129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S95KJYi4jIB1ArhFJq9VOfQamAB3y8b+WB2+NeoNQsg=;
        b=D6aw+pG0j8x6elEPVh0rp33t/TZUqrCSxRj86XqkkIYlrqAdFnaMH1pUXBY0NdJbpI
         JrsRKDmOvnezLRUOS0rXwwMhzBgs2ZYZ4Z1RMDCmgPsCxIuAiw0pQob+q9DS6c+aEqBW
         patnWSGf0fCr9d1i+MigsVMKOPLilUrqQQNTJnKqm/Ti8yYhkynb/pvljcfSHXMGVfZq
         aX+VW3mc2XDtavEx4eA/v3aZQPW+6ftCFlK85VueuEqwCysEtnXT9G4Vu69Y7yF20r8Y
         6P5oSjL3h3seDDMy8CH9ss6uyQomjhnK2HF4oAfZZ12Is0CS+EgkyxNf+AAwulFzDTwN
         e/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509329; x=1767114129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S95KJYi4jIB1ArhFJq9VOfQamAB3y8b+WB2+NeoNQsg=;
        b=qZ0hpZkdjT0MwjGG/S0BeXRRpfNeEN+GC1Fl5PKwqkbjQzIcZQRUnBt5TWlTCzWhk5
         0mJsE71TOwyGU0XCHnPRbMT/XWscvgzggeqVS76dqCCO3KIKzoEr7Hn+HTKDJYOmsGJj
         Jj0bmqxfxrI1qkrwehZnU6+btlHLN4lxBGooTFEES5PANeBFAk4jAPuF9AuteNe+0VvE
         vTCqv/uosqkcQ1fiN/4Zg91pg3M+CVT9IBAc+tjwwYrKld3S+I1TBBB9OPXs/7IRYYew
         7hNtFr/D9/o+3AcQlvReAnS2XXiAfc6sxw+bxV4qu8Sulbvth2zcxlICohPstqShPxCN
         ss0g==
X-Gm-Message-State: AOJu0YzDMvTgOfYay8YEVPaL+Zk3a88/BUQ3p6Pj/sCXyoIvnoktlZQa
	fkQApRPh41tDOXcmsIO1bfxoa8KT2f5J5P8KfPZoSj2zZx58K6EkHxh1DXLjRA==
X-Gm-Gg: AY/fxX7fbSLpqhSP84TBON2f4viCFwcTLR2gXXhDddxUytczqVhNIsWwwA2v0SpWChc
	F5Bh5Qmirjplhe0HznRA9hKBp7iHyLvczEPZPagBU9YLFKxFIx4A4C7M9Fc7GCe7QY5oFiVHKZZ
	TKcsiZiy5Je2gVjCnFdqBcqUOqOTxpGVQ1XygSjrYrPomJKGXXB/4ZWm+HeudNMnzLYanYL2fWX
	aulvFQIh8YUoAu/tRc0IPA6qL/5Mi0Aqnt5ySjN4tin6npzqwtBOnq6JRCODLkrFlzNlPPn7JAf
	LfV+e3Or4ePDADBxSFf0+GksS6ZYD7ycVonGtw70J3ZA2WXLBBdJv1hXeAtf1Acl5XmNHmSHT0Q
	NX74hlVRlw81/E9ScSsqsWXxTJUv84yS/WGKWT4zsENMyoy5NbfjRhce8KRG7CYbWOHKHrykiED
	JOqaz2ZdVu89iuZ31oDk/6tbYWwjcUkvLM27OoWZ7QBeUaBCQw52Uk+PM=
X-Google-Smtp-Source: AGHT+IGpGaRAzqQ1l6lcLkd3EgAivjDFotE6e8nL5bz+/5hixOWejp5H7cVVzYJVmdmv5kDkCCMIsw==
X-Received: by 2002:a17:907:70d7:b0:b80:1403:764c with SMTP id a640c23a62f3a-b80205e6bd3mr1400852366b.24.1766509329133;
        Tue, 23 Dec 2025 09:02:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
Date: Tue, 23 Dec 2025 18:01:56 +0100
Message-ID: <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766504313.git.oleksii.kurochko@gmail.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
exceeds one page, which requires allocating two pages and led to the
introduction of MAX_PAGES_PER_VCPU.

To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
pointer to struct vgic_irq.
As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
CONFIG_NEW_VGIC=y).

Since the private_irqs member is now a pointer, vcpu_vgic_init() and
vcpu_vgic_free() are updated to allocate and free private_irqs instance.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Change in v4:
 - Add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
Changes in v3:
 - Make private_irqs member as pointer to vgic_irq in struct vgic_cpu
   of new_vgic instead of vgic member of arch_vcpu.
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/include/asm/new_vgic.h | 2 +-
 xen/arch/arm/vgic/vgic-init.c       | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 1e762138939f..6f7af0e02b2b 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -155,7 +155,7 @@ struct vgic_dist {
 };
 
 struct vgic_cpu {
-    struct vgic_irq private_irqs[VGIC_NR_PRIVATE_IRQS];
+    struct vgic_irq *private_irqs;
 
     struct list_head ap_list_head;
     spinlock_t ap_list_lock;    /* Protects the ap_list */
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index aef526f2e717..4eb49d922492 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -202,6 +202,11 @@ int vcpu_vgic_init(struct vcpu *v)
 {
     int ret = 0;
 
+    v->arch.vgic.private_irqs =
+        xzalloc_array(struct vgic_irq, VGIC_NR_PRIVATE_IRQS);
+    if ( !v->arch.vgic.private_irqs )
+        return -ENOMEM;
+
     vgic_vcpu_early_init(v);
 
     if ( gic_hw_version() == GIC_V2 )
@@ -244,6 +249,8 @@ void vcpu_vgic_free(struct vcpu *v)
     struct vgic_cpu *vgic_cpu = &v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
+
+    XFREE(v->arch.vgic.private_irqs);
 }
 
 /*
-- 
2.52.0


