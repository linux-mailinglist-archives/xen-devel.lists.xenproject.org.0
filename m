Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F9AE5ABB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022988.1398922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqV-0005ey-M0; Tue, 24 Jun 2025 04:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022988.1398922; Tue, 24 Jun 2025 04:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqV-0005Y3-D6; Tue, 24 Jun 2025 04:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1022988;
 Tue, 24 Jun 2025 04:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTum8-0006IZ-Oh
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:48 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4084eed8-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:56:48 +0200 (CEST)
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
X-Inumbo-ID: 4084eed8-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737407; x=1750996607;
	bh=5yXPb6SqgHIQ4PIoB8k8GBXcIv2K6UWy6GJUDsY9e8g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SYKGEdQ5sWCwPY6yPcDMhM+HBEIdbuJpsGuY1gSC5qpUJMqIPkoUdzIRKnJX92uNP
	 MtKjJZhD31QHJnIrXD3+gq0mUqzI+lntp6G9A7J+8LQoLloHKNR4y7nHbaF3gKskyH
	 eDP/biNweisrUTzDLZiOuR8GTlCbzMJ45wL7RNwjbVI67aLTi0eQGRNbTIe6tAnIUY
	 TUn/rRdBOC42Dlj6R7FwM6X4Ce4djcKH1za6o7mWN1Z4LtGpc8jF1BNmUzkFiJ6XOP
	 N0rING2hWudN/qmy8gMJy/8U/pUYjJRLFySPmXhXYLpxr0eAG86XD/v/3CDftMAoCF
	 PlFQw/m8y4cUQ==
Date: Tue, 24 Jun 2025 03:56:43 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
Message-ID: <20250624035443.344099-13-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b341b04a459a662589cb5e9b9a7be4c7a9828afd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Define an architecture-independent location for describing domain emulation
flags.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Original code: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v=
1-6-c5d36b31d66c@ford.com/
---
 xen/arch/x86/include/asm/domain.h | 23 ++++++++++++-----------
 xen/include/xen/domain-emu.h      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 11 deletions(-)
 create mode 100644 xen/include/xen/domain-emu.h

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index eafd5cfc903d..c6bc83b4abe0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -3,6 +3,7 @@
=20
 #include <xen/mm.h>
 #include <xen/radix-tree.h>
+#include <xen/domain-emu.h>
 #include <asm/hvm/vcpu.h>
 #include <asm/hvm/domain.h>
 #include <asm/e820.h>
@@ -458,16 +459,16 @@ struct arch_domain
 } __cacheline_aligned;
=20
 #ifdef CONFIG_HVM
-#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
-#define X86_EMU_HPET     XEN_X86_EMU_HPET
-#define X86_EMU_PM       XEN_X86_EMU_PM
-#define X86_EMU_RTC      XEN_X86_EMU_RTC
-#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
-#define X86_EMU_PIC      XEN_X86_EMU_PIC
-#define X86_EMU_VGA      XEN_X86_EMU_VGA
-#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
-#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
-#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
+#define X86_EMU_LAPIC    DOMAIN_EMU_LAPIC
+#define X86_EMU_HPET     DOMAIN_EMU_HPET
+#define X86_EMU_PM       DOMAIN_EMU_PM
+#define X86_EMU_RTC      DOMAIN_EMU_RTC
+#define X86_EMU_IOAPIC   DOMAIN_EMU_IOAPIC
+#define X86_EMU_PIC      DOMAIN_EMU_PIC
+#define X86_EMU_VGA      DOMAIN_EMU_VGA
+#define X86_EMU_IOMMU    DOMAIN_EMU_IOMMU
+#define X86_EMU_USE_PIRQ DOMAIN_EMU_PIRQ
+#define X86_EMU_VPCI     DOMAIN_EMU_PCI
 #else
 #define X86_EMU_LAPIC    0
 #define X86_EMU_HPET     0
@@ -481,7 +482,7 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
=20
-#define X86_EMU_PIT     XEN_X86_EMU_PIT
+#define X86_EMU_PIT     DOMAIN_EMU_PIT
=20
 /* This must match XEN_X86_EMU_ALL in xen.h */
 #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
diff --git a/xen/include/xen/domain-emu.h b/xen/include/xen/domain-emu.h
new file mode 100644
index 000000000000..410963ff480c
--- /dev/null
+++ b/xen/include/xen/domain-emu.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_DOMAIN_EMU_H
+#define XEN_DOMAIN_EMU_H
+
+/*
+ * Domain emulation flags.
+ */
+#define DOMAIN_EMU_LAPIC            (1U << 0)
+#define DOMAIN_EMU_HPET             (1U << 1)
+#define DOMAIN_EMU_PM               (1U << 2)
+#define DOMAIN_EMU_RTC              (1U << 3)
+#define DOMAIN_EMU_IOAPIC           (1U << 4)
+#define DOMAIN_EMU_PIC              (1U << 5)
+#define DOMAIN_EMU_VGA              (1U << 6)
+#define DOMAIN_EMU_IOMMU            (1U << 7)
+#define DOMAIN_EMU_PIT              (1U << 8)
+#define DOMAIN_EMU_PIRQ             (1U << 9)
+#define DOMAIN_EMU_PCI              (1U << 10)
+
+#endif /* XEN_DOMAIN_EMU_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1



