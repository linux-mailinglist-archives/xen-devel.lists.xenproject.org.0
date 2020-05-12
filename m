Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74901CFE09
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 21:11:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYaJM-0002OM-Az; Tue, 12 May 2020 19:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYaJK-0002OF-Q7
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 19:11:26 +0000
X-Inumbo-ID: 5fc2edc2-9484-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fc2edc2-9484-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589310685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=koGuhiMVnPOG2QDwjwN95ApMyENVW3xkRxCOG8gCMLs=;
 b=Gpuqk/C/RYoMkkwbFHKdLRPz2by0FkgDeM5JM4i97kJX7MvvGp5UXRpg
 VdCu2eKLo1tJsiSuiCB9x+wIutB2xnWjgyNIrQeCjB3sNo/cgvI11X0gt
 9w6tavJXvDVxD4Ea7me+z9rpthex9GXTP5Wh52zOw3wGhCWp/Lh6DAsSK U=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: vkZGNXi74RKObYukMDCiIiiczA99NXOOM5tOGNdVz5UCWqCqkESy7Eb09Kn1B48dCU9FMQlwS9
 cV/PotgV//XMYenCdaor1+BjiR9qh33dAwn0uNQESH7uOPEFQAPIB3hT/fCqyOslXn+HWMiPuQ
 YAhghx3PnDB0YCVzeLezYRpTqyB/nphxgexIfpWtJ54Hy5BwyL6Qv0njrj2Jn6ZNF1+8gA2/hk
 zirupSWBh2BM0SO/qeaRMdpMj5CLvNv3HlrifGvNbpqCTw1BZi5HtZ03QSX5sOr9ay9VbfONMt
 PeQ=
X-SBRS: 2.7
X-MesageID: 17376180
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17376180"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/build32: Discard all orphaned sections
Date: Tue, 12 May 2020 20:11:08 +0100
Message-ID: <20200512191108.6461-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linkers may put orphaned sections ahead of .text, which breaks the calling
requirements.  A concrete example is Ubuntu's GCC-9 default of enabling
-fcf-protection which causes us to try and execute .note.gnu.properties during
Xen's boot.

Put .got.plt in its own section as it specifically needs preserving from the
linkers point of view, and discard everything else.  This will hopefully be
more robust to other unexpected toolchain properties.

Fixes boot from an Ubuntu build of Xen.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Stefan Bader <stefan.bader@canonical.com>
---
 xen/arch/x86/boot/build32.lds | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds
index da35aee910..97454b40ff 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds
@@ -31,7 +31,7 @@ SECTIONS
         *(.bss.*)
   }
 
-  /DISCARD/ : {
+  .got.plt : {
         /*
          * PIC/PIE executable contains .got.plt section even if it is not linked
          * with dynamic libraries. In such case it is just placeholder for
@@ -47,6 +47,14 @@ SECTIONS
          *
          * Please check build32.mk for more details.
          */
-        /* *(.got.plt) */
+        *(.got.plt)
+  }
+
+  /DISCARD/ : {
+        /*
+         * Discard everything else, to prevent linkers from putting
+         * orphaned sections ahead of .text, which needs to be first.
+         */
+        *(*)
   }
 }
-- 
2.11.0


