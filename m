Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0D979B3B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799155.1209005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5NB-00028a-BS; Mon, 16 Sep 2024 06:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799155.1209005; Mon, 16 Sep 2024 06:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5NB-00026E-8o; Mon, 16 Sep 2024 06:38:09 +0000
Received: by outflank-mailman (input) for mailman id 799155;
 Mon, 16 Sep 2024 06:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVQn=QO=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sq5N9-00024X-Gn
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:38:07 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39813f4c-73f6-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:38:04 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 010AC33F91;
 Mon, 16 Sep 2024 02:38:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id ED30C33F90;
 Mon, 16 Sep 2024 02:38:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9DCB133F8D;
 Mon, 16 Sep 2024 02:38:01 -0400 (EDT)
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
X-Inumbo-ID: 39813f4c-73f6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Pc93Ofa4duSKar6RnV4L/gfmAdC0j6rgyDYYjLa169c=; b=YQMf
	StBLCUlLDJ9N2gRne3HV9wc+j2M59erEaH/00ELS+DA+qONMhYROni+zi0RpVSME
	AJ4BI3SfcWRs2171cTwCMSj6yUfM8S/Mbn3euO+6j7bWLR0X0Dmh20EO76nml6jw
	jW86RtlAqR4841/vNdwvJnXB3UFjheX51YEMFVM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
Date: Mon, 16 Sep 2024 09:37:57 +0300
Message-Id: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 386D126A-73F6-11EF-A49D-9B0F950A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Introduce config option X86_PMTIMER so that pmtimer driver can be disable=
d on
systems that don't need it.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig               |  9 +++++++++
 xen/arch/x86/hvm/Makefile          |  2 +-
 xen/arch/x86/include/asm/acpi.h    |  5 +++++
 xen/arch/x86/include/asm/hvm/vpt.h | 10 ++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 62f0b5e0f4..0a762be14e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -385,6 +385,15 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config X86_PMTIMER
+	bool "ACPI PM timer emulation support" if EXPERT
+	default y
+	depends on HVM
+	help
+	  Build pmtimer driver that emulates ACPI PM timer for HVM guests.
+
+	  If unsure, say Y.
+
 endmenu
=20
 source "common/Kconfig"
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..321241f0bf 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y +=3D irq.o
 obj-y +=3D monitor.o
 obj-y +=3D mtrr.o
 obj-y +=3D nestedhvm.o
-obj-y +=3D pmtimer.o
+obj-$(CONFIG_X86_PMTIMER) +=3D pmtimer.o
 obj-y +=3D quirks.o
 obj-y +=3D rtc.o
 obj-y +=3D save.o
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/a=
cpi.h
index 217819dd61..8d92014ae9 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
 /* Incremented whenever we transition through S3. Value is 1 during boot=
. */
 extern uint32_t system_reset_counter;
=20
+#ifdef CONFIG_X86_PMTIMER
 void hvm_acpi_power_button(struct domain *d);
 void hvm_acpi_sleep_button(struct domain *d);
+#else
+static inline void hvm_acpi_power_button(struct domain *d) {}
+static inline void hvm_acpi_sleep_button(struct domain *d) {}
+#endif
=20
 /* suspend/resume */
 void save_rest_processor_state(void);
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/as=
m/hvm/vpt.h
index 0b92b28625..333b346068 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -187,10 +187,20 @@ void rtc_deinit(struct domain *d);
 void rtc_reset(struct domain *d);
 void rtc_update_clock(struct domain *d);
=20
+#ifdef CONFIG_X86_PMTIMER
 void pmtimer_init(struct vcpu *v);
 void pmtimer_deinit(struct domain *d);
 void pmtimer_reset(struct domain *d);
 int pmtimer_change_ioport(struct domain *d, uint64_t version);
+#else
+static inline void pmtimer_init(struct vcpu *v) {}
+static inline void pmtimer_deinit(struct domain *d) {}
+static inline void pmtimer_reset(struct domain *d) {}
+static inline int pmtimer_change_ioport(struct domain *d, uint64_t versi=
on)
+{
+    return -ENODEV;
+}
+#endif
=20
 void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
--=20
2.25.1


