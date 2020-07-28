Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE99230774
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MeT-0007Vm-Mn; Tue, 28 Jul 2020 10:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0MeS-0007Vg-L0
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:16:04 +0000
X-Inumbo-ID: 571de7da-d0bb-11ea-8b26-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 571de7da-d0bb-11ea-8b26-bc764e2007e4;
 Tue, 28 Jul 2020 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595931363;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eResLKENKrnBvZCEPNYPX+GbqgM/48vwzyRSj+mBaw8=;
 b=D7ulHQGTbCsO0jZGFZcVzJtrsQ0xtyQQo58EGu8tBqteqKK/O9o5Wgi2
 eP2loA9WxmHkxgBzJmmbOxqIXcvC+tNGXrKTRJ1vEjmYw16NS9yphTf9q
 Xagk3ZV4xNBuaQe7RxV0e+fCa1QJ6AOw0yIrgY4K5B9oY+/7f602j/TpA o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4jNe9HkyjwpDKXp9aDdQaicuN+zhaneZt6IDT4vGSS6Cmm5gSPaOg2DU4IieG74IfRsJsoMo7+
 dfDFv7uAHOBpd9gLh1Ql5WF96i95uKqYtscNhkuvppfR3jxX39ZH9YfYf6IXuF1tTVsoO37l2k
 0GxlWl8LYZ8i7GgPsoWH2ovGhe8SnUFXtgfwebiYeo2JvgQMJuQevIRYd9PEZrk528A79EHNq2
 kh4g68we4OUzBz6aujwRX4aIlDlEJGTekepNg3mdFY6iDlNzyGe5YAdR6ltYZaNA9MKbkPEQYm
 gWw=
X-SBRS: 2.7
X-MesageID: 23344596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23344596"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] public/domctl: Fix the struct xen_domctl ABI in 32bit builds
Date: Tue, 28 Jul 2020 11:15:29 +0100
Message-ID: <20200728101529.13753-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The Xen domctl ABI currently relies on the union containing a field with
alignment of 8.

32bit projects which only copy the used subset of functionality end up with an
ABI breakage if they don't have at least one uint64_aligned_t field copied.

Insert explicit padding, and some build assertions to ensure it never changes
moving forwards.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

Further proof that C isn't an appropriate way to desribe an ABI...
---
 xen/common/domctl.c         | 8 ++++++++
 xen/include/public/domctl.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a69b3b59a8..20ef8399bd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -959,6 +959,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     return ret;
 }
 
+static void __init __maybe_unused build_assertions(void)
+{
+    struct xen_domctl d;
+
+    BUILD_BUG_ON(sizeof(d) != 16 /* header */ + 128 /* union */);
+    BUILD_BUG_ON(offsetof(typeof(d), u) != 16);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 59bdc28c89..9464a9058a 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1222,6 +1222,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gdbsx_domstatus             1003
     uint32_t interface_version; /* XEN_DOMCTL_INTERFACE_VERSION */
     domid_t  domain;
+    uint16_t _pad[3];
     union {
         struct xen_domctl_createdomain      createdomain;
         struct xen_domctl_getdomaininfo     getdomaininfo;
-- 
2.11.0


