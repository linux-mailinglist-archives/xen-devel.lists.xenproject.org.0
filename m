Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDCE1E61C9
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 15:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeIGN-0006cY-Uw; Thu, 28 May 2020 13:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBWX=7K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jeIGN-0006cT-78
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 13:07:59 +0000
X-Inumbo-ID: 3ff13104-a0e4-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ff13104-a0e4-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 13:07:57 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 78UCGICbqnbVdGeCbbPd0B2eskBfpEuIjG+gYkPNFGwgfALk1/OeB7ClUBDCN4K5asDzjA3W/v
 sRuQ6M4Ta9gEkchlqHe93Qf4+Aq/VZVu4Ylwkzrspwj2r7tTa8N1OJ+Ug24Cq8Q/+LXO5zyQff
 Vpw1Ba8IcnjdM4ZK/wUgAx3LGNvTbEJ9Sh7mC6tQ5GYzyDMqqv9YTLb3JWfA8nA/WEcyRudQRD
 GdWd2xnaLI8LYG7qlLAUTw53OaAHXrPc2kKzOtfGFt+v5G15I2v52WJPm/E8iVi4q2Rfm6dQyf
 DzY=
X-SBRS: 2.7
X-MesageID: 19392726
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,444,1583211600"; d="scan'208";a="19392726"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: Improve error information in handle_pio()
Date: Thu, 28 May 2020 14:07:38 +0100
Message-ID: <20200528130738.12816-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

domain_crash() should always have a message which emitted even in release
builds, so something more useful than this is presented.

  (XEN) domain_crash called from io.c:171
  (XEN) domain_crash called from io.c:171
  (XEN) domain_crash called from io.c:171
  ...

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul.durrant@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Part of a bug reported by Marek.  Something else is wonky in the IO emulation
state, and preventing us from yielding to the scheduler so the domain can
progress with being shut down.
---
 xen/arch/x86/hvm/io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index a5b0a23f06..4e468bfb6b 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -167,7 +167,9 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
         break;
 
     default:
-        gdprintk(XENLOG_ERR, "Weird HVM ioemulation status %d.\n", rc);
+        gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*lx\n",
+                rc, port, dir == IOREQ_WRITE ? "write" : "read",
+                size * 2, data & ((1ul << (size * 8)) - 1));
         domain_crash(curr->domain);
         return false;
     }
-- 
2.11.0


