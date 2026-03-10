Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB/vBINSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3F255649
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250580.1548092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jJ-0006pp-8E; Tue, 10 Mar 2026 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250580.1548092; Tue, 10 Mar 2026 17:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jJ-0006nv-2N; Tue, 10 Mar 2026 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1250580;
 Tue, 10 Mar 2026 17:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aP-0001QA-Ad
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9cd1f6e-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:35 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48534e9076fso20624205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:35 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:34 -0700 (PDT)
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
X-Inumbo-ID: e9cd1f6e-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162575; x=1773767375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOghi8Ll3/sbazIkniNGMCKDlS8jGFlMwoa4Be1UqI8=;
        b=UbWt7u0RbG1GgtM3j559JPupxy1TArRkDuM+GgCbVhjHKbkkcBjdwxW2b4W9B2+QvK
         eqaxXJBH0A1vAsD6j0pMQ1e2IqZgeZtNLBEufiqwDPi66RcyZt1FS/dBWj5aENgzVeA/
         hKhxfaBYPJTNrZnvnBrurAyRkeEKuIQenhlr+u9yv7JK+S9ye2BaJVNEQ/NK09CKTJqL
         bDkwrgar/6SyGmMdJBFvV/q7UyBlMtn7RMBvTRzq6gasAooR/bQ51wMm/QVJLw84O3q2
         szl7eS0sMNFlyoFMv4yLju+Ff5DvF1eynOku5uXRljp7KM9SUZQACVFVZkh8ud82sJ1v
         OD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162575; x=1773767375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eOghi8Ll3/sbazIkniNGMCKDlS8jGFlMwoa4Be1UqI8=;
        b=sL6JhzYNCRQJDZDctajYEuwYwweXgVElFuKvlBuBk30GroBzr08FveM8ZbVGMZmydJ
         4l6BwNG47O4zJ4MtKUsRPrbBDKXky0Ffpk/qu5R2Ah9agH3p5eOd/MzdPxNGNnC/TCGu
         RrmRy50rP/HMHl7VfxFUT1FqjSL7lmqo+NbhCjIU4IxkR3fi33tKK06/8AxWmY26GV1c
         I2+RquOqjuFvrEEilb2Px59PccygPEnxr7a1f4o7VKb8IzPG38+BI0jjipfZ+F+WrUoD
         ztZ4WscwOylx+AKUs9BYYM6cGJgfE7iv16WFT+SlREK1MmdYzh7Jb6MiGl7f+yw67i6K
         B6ig==
X-Gm-Message-State: AOJu0YyJBxFViZuWXn+ab9PXplj8EnUZ+S0Bep3BhGYehbpLLL2rLu0I
	pdInlx2h+j6jLOsJ2gHv8uGFdJRwlvwQ8ltoZK3PP3yNYDt+obx8qAvLTjGI7KB6
X-Gm-Gg: ATEYQzzkmswMZa7ZJDLZIL1/0KbrIwDvqHjX1JRCJRW0Zx548Ng48E4l8C6imuXEqtj
	wKDlZwWXDqTDb7JuuKTabUOyVUNJleDf+pktykjeCA8XDLw3P2t3rYH9x4MwG1B2Mw2/teN5Oh9
	frYRTwrl0yK6Pq3yymtcjjUwgvWZuKgxAFyNpyfDARyJYSkisRnKvCdrmN5XjNd+6l6D9U64QM5
	7wahKNXv/fAQFQ495bc7PCJ06TnhEn0q/zs6PV8apwjqauw6RYBbs4Eh63rXOBUMcNReVNnXYtB
	2hO6bkxIDzSDRqDUCIF/og/dRRMDM/bsp/Gqqg3BC8h/TZvt1JaLTR832NBfYdMBk2VwbPzWDUP
	qcnK7tJlSv7NfdynZ0gJNBH2/XmrrIflrQCrfeiYd3m3KHwmpJAc6hV6I7lNBqs4YvII1qHM3iV
	0Vcbor96QRCC4xDRPoaa/0SRfi2HS0Fbm3WGRvqs2EPUcge0MRoi0C7z8mrlWjsOSRAw==
X-Received: by 2002:a05:600c:4752:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-4852697721cmr266702515e9.29.1773162574476;
        Tue, 10 Mar 2026 10:09:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 21/27] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Tue, 10 Mar 2026 18:08:54 +0100
Message-ID: <61311834fef7cf8a736a8fa972b6461bbfd46e6d.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B1E3F255649
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c           |  3 +++
 xen/arch/riscv/include/asm/intc.h |  4 ++++
 xen/arch/riscv/intc.c             | 40 +++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 560b21b16ffb..1c08ba7396ea 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -300,6 +300,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     d->arch.next_phandle = GUEST_PHANDLE_LAST + 1;
 
     return rc;
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 45d41e191e30..fb4188b96a75 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -13,6 +13,7 @@ enum intc_version {
 };
 
 struct cpu_user_regs;
+struct domain;
 struct dt_device_node;
 struct irq_desc;
 struct kernel_info;
@@ -96,4 +97,7 @@ void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
 int intc_make_domu_dt_node(const struct kernel_info *kinfo);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index a91dbc5e997c..88ce658a4de0 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -87,3 +88,42 @@ int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
     return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
                                                          irq_ranges);
 }
+
+int __init domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk("vintc (ver:%d) isn't implemented\n", ver);
+        break;
+    }
+
+    if ( !ret )
+        d->arch.vintc->info = intc_hw_ops->info;
+
+    return ret;
+}
+
+void __init domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
+    {
+    case INTC_APLIC:
+        domain_vaplic_deinit(d);
+        break;
+
+    default:
+        printk("vintc (ver:%d) isn't implemented\n", ver);
+        break;
+    }
+
+}
-- 
2.53.0


