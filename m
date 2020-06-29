Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDF20CDEC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 12:32:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpr4Y-0008Fx-Tj; Mon, 29 Jun 2020 10:31:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jpr4X-0008Fs-Nh
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 10:31:33 +0000
X-Inumbo-ID: b34dd8e6-b9f3-11ea-854d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b34dd8e6-b9f3-11ea-854d-12813bfff9fa;
 Mon, 29 Jun 2020 10:31:33 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kCUloU30hnj9oHyFqiiI365g2eomIco5GQ9CRLHeuvAPmCpv65HJlZQthcNXRP2k2l3t2t6fAh
 sahjJxurJ9MDctR8NuvT78UcnY/dqrliDIfeTGlmrJ7oGEdQQFrH9SyC5lTrX9sEhKz99dyyQj
 gjAzntWnsh5jaqHRDxEbiPMc9l6f9c9KU1CFfuspNLgXOrcjS8P10qcAJSPMOxR/y3JctZq8ro
 3+WNG42GU6UG9NdZjoSpoTReGykUb7LBPL/EK/My/PLblkbM+zMLq+n9v5wZxZbXOnkZ+h9SIG
 jE0=
X-SBRS: 2.7
X-MesageID: 21467703
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21467703"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/boot: Don't disable PV32 when XEN_SHSTK is compiled out
Date: Mon, 29 Jun 2020 11:31:13 +0100
Message-ID: <20200629103113.9328-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There is no need to automatically disable PV32 support on SHSTK-capable
hardware if Xen isn't actually using the feature.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>

For 4.14.  Minor bugfix.
---
 xen/arch/x86/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2aa1cd50b8..c9b6af826d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -95,7 +95,11 @@ unsigned long __initdata highmem_start;
 size_param("highmem-start", highmem_start);
 #endif
 
+#ifdef CONFIG_XEN_SHSTK
 static bool __initdata opt_xen_shstk = true;
+#else
+#define opt_xen_shstk false
+#endif
 
 static int __init parse_cet(const char *s)
 {
-- 
2.11.0


