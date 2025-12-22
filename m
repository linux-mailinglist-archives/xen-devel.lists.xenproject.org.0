Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB94CD6B09
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192197.1511543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixS-0004mS-PF; Mon, 22 Dec 2025 16:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192197.1511543; Mon, 22 Dec 2025 16:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixS-0004l0-LZ; Mon, 22 Dec 2025 16:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1192197;
 Mon, 22 Dec 2025 16:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXixR-0004ka-2s
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:40:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec247116-df54-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 17:40:28 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so743609566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:40:28 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm1137038366b.60.2025.12.22.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:40:26 -0800 (PST)
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
X-Inumbo-ID: ec247116-df54-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421627; x=1767026427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBzbL79dzEewzumfeW1aHAle0AWKV3qUQkn9X5gzvdw=;
        b=EMBIou2n5XbjU2BDfVCAxAKBREjsIkAQQK+9fzbe8O+RQ7QCqnzKwUw+2bOwsU1V+Z
         DTBPoRvLjmpGy8yaQ3grV4Z2J1fi6q45QaGndOeMTKrBoZZ8Ulz6c7b51ky6QHj5vsoI
         pzuM7MOjoHNcCz3Xw2oJ4nwwk81+2vVywaUvE93PQT0hpxJuZIfiw242VVunwzlXMlAn
         y9jE505LtMoAVPyyIKkAgt6zunlo9PgujNm56usT70JfUWh8I/ZKuKp7nD9QPs/4qnHb
         YI51m9He+bSJqFe01VpJrsh5DFafy8g3CCmbeyEzVJZtlZZ2ZXDzd4FPazfydcgk/aNL
         RAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421627; x=1767026427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBzbL79dzEewzumfeW1aHAle0AWKV3qUQkn9X5gzvdw=;
        b=CCq/6TMsfS10xnxE1KJZKYE7yvAPGgwrJkpKLiXcR/j3yTdS6FyAeFibywuW/I/jzj
         zl+hIhRc/2Pq/dafbc/fqBbQfjljwdHro73sO0eiLqOrwGMhiIKQq7+vj7u7BCG7ecE4
         rf2CZ7lLM4czUm8tdJU++1TjI0RJ1qx9/eO3DpA309wjGD/DDXZRZyDU2zaoxPco3U9q
         12q8EcYu0FhIlLGykxzA9QFHqf1Kxd3jS1f0qFm17Fz05xJtpk3tPWE2GugCYNUA1FK3
         P4nh8WNqkKwtLJgkJbUk0X2+yXYR77U/umTb0qLqCp8+CUnDqLkQpYn63gHaweIwqlKN
         Tv0Q==
X-Gm-Message-State: AOJu0YwiBCvkJ/z7br0eXliPNbnz1rzzpFtyfptRgxXg3xwoTLkm7pBC
	fJw4J/TdBn7HsSKZeMuTXCKoAy2UYLYyj2OVwMnIYazY5NIeoX00IGv8WnCf4w==
X-Gm-Gg: AY/fxX4ejjBaTEAlxBQ7V6w78MmAdmE58Vmm+ocOLnWfwwN+jIQtisRFbbNYlf49RoJ
	lfn34HSC40RP/9vxeox7SG9YafrXhwpId/U6Q31njIA6OoN4dBrP73TbqKOWERIZzLPpr0aGdUF
	RrEI+T4AYupRjB6E4H3CRf0J02n8eeZaSih0mKS8llLm/3FX/5KhshK/hDQKG9VJqZkK0OYsBT9
	jIRuuVpRGDQJLoELAn9tEi4J8EENHHfSQjtzHBwYTkuv/Ez1gYVt9EfTomM33skLDv12WwQ4mk8
	cGLWBC36LnllX98YSibeHKxgoJIAN0VLMDyjJVgumXQruabuJQWDqNCPXgZ9/wHrmxJ2KhYTOAn
	nPPQm7do6PJYuPFFI+M2G4ZLFq8wDEx+PKCTTXVAO3PwilZOKlMCN3wiAfoCJ+tb0yA8YFfsOMV
	2/1dwz0pRuuQx/aSiaXXJuuQKAq+/el3b11afnRqVEnOBxmzhBscNriGq9WbtzTf1ywQ==
X-Google-Smtp-Source: AGHT+IFEzGPLG1+jRiEN6PRfsExU8DVuAmTIc9Y2B/6ZnI/dQWkqj88d9A4vO26H3fYF7+wTXmK1EA==
X-Received: by 2002:a17:906:730f:b0:b73:9937:e96b with SMTP id a640c23a62f3a-b8037183903mr1276035266b.52.1766421627295;
        Mon, 22 Dec 2025 08:40:27 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/4] xen/arm: optimize the size of struct vcpu
Date: Mon, 22 Dec 2025 17:40:12 +0100
Message-ID: <7cad22bb0aa95eed7f9710024356110b4443f554.1766404618.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766404618.git.oleksii.kurochko@gmail.com>
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
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


