Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632C976507
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 10:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797081.1206882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofdh-0007sq-IE; Thu, 12 Sep 2024 08:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797081.1206882; Thu, 12 Sep 2024 08:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofdh-0007qI-FJ; Thu, 12 Sep 2024 08:57:21 +0000
Received: by outflank-mailman (input) for mailman id 797081;
 Thu, 12 Sep 2024 08:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pgu6=QK=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sofdg-0007qC-9R
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 08:57:20 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c2cc99-70e5-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 10:57:17 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id F08272DDBC;
 Thu, 12 Sep 2024 04:57:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E8A9B2DDBB;
 Thu, 12 Sep 2024 04:57:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9DD2F2DDBA;
 Thu, 12 Sep 2024 04:57:11 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 00c2cc99-70e5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=ZHA30HlSsY3otp1pQ8KheiuwXPlu2pqZCOBUBPNjrDo=; b=Imgd
	dSiMJwQU2H2UG93MBu/l880QoN3zybBqsNMMIHYqx/yiCNNyX860TwiRmAaUiIzj
	ugAaryxnME6sZWuLkFJnlvqHqwxbIIlwDG1nFTZDUUpu7GNee2RkJdGvJyGfuSAc
	S7GeilNNjgo0f2du+JT2OXgjkxnQ/6+FEEHwDoM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/hvm: make stdvga support optional
Date: Thu, 12 Sep 2024 11:57:09 +0300
Message-Id: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 FFB46E50-70E4-11EF-A4EE-9B0F950A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Introduce config option X86_STDVGA so that stdvga driver can be disabled =
on
systems that don't need it.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig              | 10 ++++++++++
 xen/arch/x86/hvm/Makefile         |  2 +-
 xen/arch/x86/include/asm/hvm/io.h |  5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 62f0b5e0f4..2ba25e6906 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -385,6 +385,16 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config X86_STDVGA
+	bool "Standard VGA card emulation support" if EXPERT
+	default y
+	depends on HVM
+	help
+	  Build stdvga driver that emulates standard VGA card with VESA BIOS
+          Extensions for HVM guests.
+
+	  If unsure, say Y.
+
 endmenu
=20
 source "common/Kconfig"
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..4d1f8e00eb 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -22,7 +22,7 @@ obj-y +=3D pmtimer.o
 obj-y +=3D quirks.o
 obj-y +=3D rtc.o
 obj-y +=3D save.o
-obj-y +=3D stdvga.o
+obj-$(CONFIG_X86_STDVGA) +=3D stdvga.o
 obj-y +=3D vioapic.o
 obj-y +=3D vlapic.o
 obj-y +=3D vm_event.o
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm=
/hvm/io.h
index 24d1b6134f..9b8d4f6b7a 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -128,8 +128,13 @@ struct hvm_hw_stdvga {
     spinlock_t lock;
 };
=20
+#ifdef CONFIG_X86_STDVGA
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
+#else
+static inline void stdvga_init(struct domain *d) {}
+static inline void stdvga_deinit(struct domain *d) {}
+#endif
=20
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
=20
--=20
2.25.1


