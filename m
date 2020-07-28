Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4B2308DC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NvZ-0006Gx-Nw; Tue, 28 Jul 2020 11:37:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0NvY-0006Bw-Pl
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:37:48 +0000
X-Inumbo-ID: bd6816ae-d0c6-11ea-a8af-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd6816ae-d0c6-11ea-a8af-12813bfff9fa;
 Tue, 28 Jul 2020 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RkXLHOS6wpf6G4+l7e752XZD9SMg/CfYFIDpBklde9o=;
 b=UcOibjlZKdsXXmgl2O37fcJAMRgllKBVnkO4kyiP5Ket5e2D8pok7zbg
 qpYun1NeYIG4176lkYGWebFwQ81vp8RuhT3/3IuLrkQiuY4b/jAXP8bj4
 ZhgPOFJ7fa38OyvXrvYfVUKABG5bH+y+F1ezBZ5Nkz6BwGtz01gRZR9n1 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +NVwCWu+BqEKtJP+3sNKXmvYcsDwY3TNoqsX/w6ha0A1PxR8C7sdHpDcaDYy54oGf00KjegAz8
 IW5ca5hUNk8RSkFr0dn+7l59ixRfGcfoXDkblqTU/gfTTiiy82fY0uW/MGawNQ1e7ZUMd/9jEc
 3Emj+Z+Ltol8BTtjVr8OqF2uDwMwXA8Dl3+qQ6a+y5yZ+pSwKIP/GhMnbAhUP56Zoj5XhSaHER
 JwBJHoAC93xw00Jgn/T4bsYwWezZncg5UKlZbh6hE8hzUpPZ2G2WkWA0vJliIWwxHo4kYAccEb
 3s8=
X-SBRS: 2.7
X-MesageID: 24202968
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="24202968"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
Date: Tue, 28 Jul 2020 12:37:07 +0100
Message-ID: <20200728113712.22966-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200728113712.22966-1-andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

New architectures shouldn't be forced to implement no-op stubs for unused
functionality.

Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and provide
compatibility logic in xen/mm.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
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
index 1061765bcd..1b2c1f6b32 100644
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


