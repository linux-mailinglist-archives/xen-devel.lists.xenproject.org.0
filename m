Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7B1BA46E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3dH-00012g-H1; Mon, 27 Apr 2020 13:17:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT3dF-00012b-QB
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:17:09 +0000
X-Inumbo-ID: 657b7ce0-8889-11ea-9781-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 657b7ce0-8889-11ea-9781-12813bfff9fa;
 Mon, 27 Apr 2020 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587993429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QNEMRm3aOz/vXC8CThrtL8kmn4AaSrbSZctPyHtEiqg=;
 b=V7cPtWxvpnaSY7nVZpu5Z+qoAcG7HwA3IGp+kdWFU9eq2NVAgHaFNJDL
 2dU2/H3M7tlzK2cA+woEQfpRcOTZdwHiOlG4JqjZ1BdpunzA8vmh6Atia
 CnJ7oDzkwiy6HKUE5dmb6f98BZp4Vle3kmYkCkIK/jgQK67vQlSg+NTgJ k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c9V0w1vFC+arBDDaY6OKbwzFhPivBwS/QKG2WCazcjtQ3c4wVyITEXmrlY9xYqvl4pkkFX0fyi
 yyRFgxOl6RSqDAut/ss6JhGIuxz4iEHR1/aE22EUxzegR1DNsyux4UJcsYYOPm4wliqiBECp4W
 SgfDYlCoRZvjV5eWT1ASiMVaj+txbOY+iejoZipFVHqt/WC9kt0ISG6wVMBGxznUHAd0s4QCYs
 beJn3BbC9niUXaoI7NBAaJniuMTzQOD4JojIMFJHcryk0plTD+8ae+bCjSl4bWSCyuCs6WcMvp
 n8E=
X-SBRS: 2.7
X-MesageID: 16552859
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16552859"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/IST: Fix comment about stack layout
Date: Mon, 27 Apr 2020 14:17:02 +0100
Message-ID: <20200427131702.13991-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This was an oversight in c/s 5d37af364dc "x86/traps: Use an Interrupt Stack
Table for #DB" which introduced the #DB IST to begin with.

Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/current.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index 0b47485337..39c2c6cbf8 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -18,7 +18,7 @@
  * 6 - Primary stack
  * 5 - Optionally not present (MEMORY_GUARD)
  * 4 - Unused; optionally not present (MEMORY_GUARD)
- * 3 - Unused; optionally not present (MEMORY_GUARD)
+ * 3 -  DB IST stack
  * 2 - MCE IST stack
  * 1 - NMI IST stack
  * 0 - Double Fault IST stack
-- 
2.11.0


