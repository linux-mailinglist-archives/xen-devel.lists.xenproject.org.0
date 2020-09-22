Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2627481E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmyp-00005F-Uh; Tue, 22 Sep 2020 18:25:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmyo-0008V0-8B
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:30 +0000
X-Inumbo-ID: c7901009-ebb4-44f8-b1cf-cae236d7e6f0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7901009-ebb4-44f8-b1cf-cae236d7e6f0;
 Tue, 22 Sep 2020 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PemkBKNb12MmUWwvMUvbxamV4GWuBXt6jS2JXhDGXTk=;
 b=hYCmON/zDE6l+ByI/2O7yFcVHlZhZaDKqrl/BASrxffZxK1HOtP3QPxl
 ajAT9A5R3z9pTCIE1K7d3shS/W+XQPPlEcQIxIHgzUXZpw6PPABauH4CD
 zWrjC0U/c9LSVOOw+rjiOl9aZlr2zA++3qDyhzMvYNrwGchbHZjFDyJuw Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 61Ih/vUJm8RMzRKh9tGGFkyDlwBvALt8VM8HwJ25XC0I2Mfj/iGvmvCvdSzK6qEyRpmFGxLKvu
 APpU7qvVFNJg9qv3boln7BCSwMDx2BRVCCBJgXJo2xxMw+NVSzoYC6BamfTz/FCM845vDUkDu6
 FnhoSi7oz05nzCK6+sMpVrDOY5HpcjI4ddoIOJvgbcmEBlVmxpmfDf64oYx1QY5HXDpBmQiLt1
 YQDlwkIAWvmqEIY3+y8qeY3Ne0WQOi7O8tLyQPT6FSxzhXcVZWt98qForqhGinjmog9rIinaW0
 Pwk=
X-SBRS: 2.7
X-MesageID: 27631639
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27631639"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v2 01/11] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
Date: Tue, 22 Sep 2020 19:24:34 +0100
Message-ID: <20200922182444.12350-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

New architectures shouldn't be forced to implement no-op stubs for unused
functionality.

Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and provide
compatibility logic in xen/mm.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/Kconfig     | 1 +
 xen/common/Kconfig       | 3 +++
 xen/include/asm-arm/mm.h | 8 --------
 xen/include/xen/mm.h     | 9 +++++++++
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a636a4bb1e..e7644a0a9d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
 	select ARCH_SUPPORTS_INT128
+	select ARCH_ACQUIRE_RESOURCE
 	select COMPAT
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 15e3b79ff5..593459ea6e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,6 +22,9 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config ARCH_ACQUIRE_RESOURCE
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index f8ba49b118..0b7de3102e 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -358,14 +358,6 @@ static inline void put_page_and_type(struct page_info *page)
 
 void clear_and_clean_page(struct page_info *page);
 
-static inline
-int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
-                          unsigned long frame, unsigned int nr_frames,
-                          xen_pfn_t mfn_list[])
-{
-    return -EOPNOTSUPP;
-}
-
 unsigned int arch_get_dma_bitsize(void);
 
 #endif /*  __ARCH_ARM_MM__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 4536a62940..26a4a3d350 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -685,4 +685,13 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
+#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
+static inline int arch_acquire_resource(
+    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
+    unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    return -EOPNOTSUPP;
+}
+#endif /* !CONFIG_ARCH_ACQUIRE_RESOURCE */
+
 #endif /* __XEN_MM_H__ */
-- 
2.11.0


