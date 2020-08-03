Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E223AAF1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2di5-0000O9-5k; Mon, 03 Aug 2020 16:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dd1b=BN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k2di3-0000Lq-4j
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:53:11 +0000
X-Inumbo-ID: cc940269-d5a9-11ea-90ad-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc940269-d5a9-11ea-90ad-bc764e2007e4;
 Mon, 03 Aug 2020 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596473586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9FHDzk5jP15PoxSFIG/3+YaZpBrml62Q4eCYIN4d3r8=;
 b=Ky7VFNfUWN3Ydkd6hSyzTAp5UOfdE1XawX/uIot6MKPXY2BB9PLX7Hre
 WkhDiSoOG7ZIn2GATbMd5IMG+f8vugk3FbFa1zxseqdToYJPOsykbq6my
 flTnNQBVJmu88005+FYJWZR626PI2R190ocbGg664gQKMiYeOGEkFtCYx Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oUizAzmZsbSPZfoucDhfLS3pp0o7C2fWvjF+HDf1ttDC08KVHWjcrG9PSqvQEBlqwv7JfCsNJg
 KCy83IsZWZRsis0vuW7kgTSt+MMgZXZ+KS0DXMtCnQpOnMZhrI1FX40OU3B/wgDdsEnUOyATwI
 YGlqEHb4rjBDjM8DRxExaVRzI5gZBGVI/J4h1Yz/Z3M8sxVwADYTCpUUhHCazqv8hug5gRb/Hu
 hBufHPAFCnV3pAUWFdL0u0BlUmLObj1z3j3Dd5PBli5UqhkzPWegs5b2fpiRvCJrtJwWcEzGnr
 Bec=
X-SBRS: 3.7
X-MesageID: 23941194
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,430,1589256000"; d="scan'208";a="23941194"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 1/1] accel/xen: Fix xen_enabled() behavior on target-agnostic
 objects
Date: Mon, 3 Aug 2020 17:52:51 +0100
Message-ID: <20200803165251.907213-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200803165251.907213-1-anthony.perard@citrix.com>
References: <20200803165251.907213-1-anthony.perard@citrix.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

CONFIG_XEN is generated by configure and stored in "config-target.h",
which is (obviously) only include for target-specific objects.
This is a problem for target-agnostic objects as CONFIG_XEN is never
defined and xen_enabled() is always inlined as 'false'.

Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
when we don't know to force the call of the non-inlined function,
returning the xen_allowed boolean.

Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
Reported-by: Paul Durrant <pdurrant@amazon.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Paul Durrant <paul@xen.org>
Message-Id: <20200728100925.10454-1-philmd@redhat.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 include/sysemu/xen.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 1ca292715e69..385a1fa2bff8 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -8,7 +8,15 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
-#ifdef CONFIG_XEN
+#ifdef NEED_CPU_H
+# ifdef CONFIG_XEN
+#  define CONFIG_XEN_IS_POSSIBLE
+# endif
+#else
+# define CONFIG_XEN_IS_POSSIBLE
+#endif
+
+#ifdef CONFIG_XEN_IS_POSSIBLE
 
 bool xen_enabled(void);
 
@@ -18,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 #endif
 
-#else /* !CONFIG_XEN */
+#else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
 #ifndef CONFIG_USER_ONLY
@@ -33,6 +41,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 }
 #endif
 
-#endif /* CONFIG_XEN */
+#endif /* CONFIG_XEN_IS_POSSIBLE */
 
 #endif
-- 
Anthony PERARD


