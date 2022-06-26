Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B344855B0E6
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356071.584082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orp-0008Rs-FK; Sun, 26 Jun 2022 09:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356071.584082; Sun, 26 Jun 2022 09:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orp-0008Ps-CR; Sun, 26 Jun 2022 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 356071;
 Sun, 26 Jun 2022 09:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cB6r=XB=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1o5Oro-0008Pg-JA
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 09:47:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b43fd0-f535-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 11:47:43 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id pk21so13245534ejb.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:41 -0700 (PDT)
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
X-Inumbo-ID: 05b43fd0-f535-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8y1YigI7ttxs3tTld6DKvzpRpRRmju3jx/o0m9Wy9os=;
        b=pCD3TQyytOn6s8CgipMMRlMe8ipJcM/lIt7qDuGLUPIXeg+yWx4ZdloptdUVNTKaDd
         sIqtC44UFMxDUCcPpiTrv/DTyFcxvk14BVhRcpSdhEXoaf908w64RBTvxNgIDr4RrQ+A
         qDHr74I4ghmr96AdkqiCMd+wk7vx9jqomIqAHyHMSFhdEvknJijiil+FPfF99ISYxHqD
         dxrbvGTN3OF/WlTnvJ/82NPHYogw5Rh3UyRYTonV0et257btT/LL3q1q00H1Vb6HENGr
         B58hlzz3kx3m7E0zYwSsRIvtuKla1CQeAPPct1v6EAPf4hH3zdy3eMn4TTSbjKGM1GgT
         gqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8y1YigI7ttxs3tTld6DKvzpRpRRmju3jx/o0m9Wy9os=;
        b=k6A3N3CZoC7bUtV3EClLFpfGIJjPUs/3XJj+jh938e1yEudPIcSKraRB0dNvFCauJi
         1hZbWxvGLy6oUluWEhUc8GZv2f1n+6E5TS8XYYSD1nFHKAK/b87C9bJqiAehPLX6Tpc4
         j0K5VkHVRxSWNq1FPiahUb46MbR3r0DZ4++F3gIf2zZHUkvI2TMwoea3FEDsU66C2I6J
         HB9gQC/xKeOW7kCrSDpOkf390K1DVY4/kK2wt8w5URhcnFCs2uzCXGrd45ID3iYSrGZ5
         hA6KTYt4rmqiQySra7YEnh/eir0TneYzRi1XZODI7R3Be0xM7RFG72WE7AulY+Th4u3E
         FMag==
X-Gm-Message-State: AJIora9hEx/r1iCVzd2wXYkJDydFkBw9xWVxV+nBI3TbcAKPD+bhcXsZ
	OCpRMudY9iUua+Ladw4DviE=
X-Google-Smtp-Source: AGRyM1v6iTzO4uMHp2vLzEWX53KPy01bIP+vC0hI0N/lRCRouLltezCBvCVoffSlli5cWMnSFE53BA==
X-Received: by 2002:a17:907:968a:b0:722:e508:fc15 with SMTP id hd10-20020a170907968a00b00722e508fc15mr7614907ejc.188.1656236861608;
        Sun, 26 Jun 2022 02:47:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
Date: Sun, 26 Jun 2022 11:46:55 +0200
Message-Id: <20220626094656.15673-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only user of xen_set_pci_link_route() is
xen_piix_pci_write_config_client() which implements PIIX-specific logic in
the xen namespace. This makes xen-hvm depend on PIIX which could be
avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
order to do this, xen_set_pci_link_route() needs to be stubbable which
this patch addresses.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c       | 7 ++++++-
 include/hw/xen/xen.h        | 1 +
 include/hw/xen/xen_common.h | 6 ------
 stubs/xen-hw-stub.c         | 5 +++++
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 0731f70410..204fda7949 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -161,11 +161,16 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
         }
         v &= 0xf;
         if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA, v);
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
         }
     }
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
+}
+
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     /* If vector is 0, the msi is remapped into a pirq, passed as
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 0f9962b1c1..13bffaef53 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -21,6 +21,7 @@ extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
+int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
 void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 179741ff79..77ce17d8a4 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -316,12 +316,6 @@ static inline int xen_set_pci_intx_level(domid_t domid, uint16_t segment,
                                              device, intx, level);
 }
 
-static inline int xen_set_pci_link_route(domid_t domid, uint8_t link,
-                                         uint8_t irq)
-{
-    return xendevicemodel_set_pci_link_route(xen_dmod, domid, link, irq);
-}
-
 static inline int xen_inject_msi(domid_t domid, uint64_t msi_addr,
                                  uint32_t msi_data)
 {
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 15f3921a76..743967623f 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -23,6 +23,11 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
 {
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return -1;
+}
+
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
 {
 }
-- 
2.36.1


