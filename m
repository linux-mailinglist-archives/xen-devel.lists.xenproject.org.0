Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65122748F2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKnmh-00063Q-Sr; Tue, 22 Sep 2020 19:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKnmg-00063L-Qm
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:17:02 +0000
X-Inumbo-ID: df8c82c3-70bd-4163-a603-fd2759fa0a39
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df8c82c3-70bd-4163-a603-fd2759fa0a39;
 Tue, 22 Sep 2020 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600802222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dsM/jx4luDEmzlvy/L9q8VqQDVQ5pjh+Iap8EapwOhs=;
 b=SLDXe1H6lCOuoTA5C5L2kWRxCsQMZv8odl3psSu84tuk976SPIC694V7
 mhPL1k1GXXLvd1Xgq2SIyOydX/obd/UK1/Ix/99ZFUA5mV9NnWFvX51VG
 +KCEjvaeSt1bw0/Q+eN8r1j8EhkWIARK81wijMVLtingGyXwq1KOxIqUL U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +CSamO9UpQgkb+7thSz33rASDpeanYTLDksu+JuOOmJYT1sfICs6gcxK7bpIi772QOPJljiAXs
 mslx7XZXwKn+bFkfPM1Sda9id0n1JdgErPQS8p1dPEiThW/lx/aWLfSJUEfsnknerw73vSmJ4V
 FfxgGjx4RKoygRaT2qWQ5ZrNBR8iUIZdoTXHWVdyjO93Mot+1qMyl5ED6OFV5BP01pOdmWxu0L
 BC4osNMJHn3XwwhJ+w3iXA/bCNBqaL2Gd5hO+MipHleep/wGY0OTRqUOtBiFZvwj1kOxYvmYDu
 a2I=
X-SBRS: 2.7
X-MesageID: 27305023
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27305023"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/msi: Fold pci_conf_write16() calls in write_msi_msg()
Date: Tue, 22 Sep 2020 20:16:43 +0100
Message-ID: <20200922191643.5933-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In addition, this removes the unqualified 0/1 passed to msi_data_reg()

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/msi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index a899c43e8d..5febc0ea4b 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -214,13 +214,10 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
         pci_conf_write32(dev->sbdf, msi_lower_address_reg(pos),
                          msg->address_lo);
         if ( entry->msi_attrib.is_64 )
-        {
             pci_conf_write32(dev->sbdf, msi_upper_address_reg(pos),
                              msg->address_hi);
-            pci_conf_write16(dev->sbdf, msi_data_reg(pos, 1), msg->data);
-        }
-        else
-            pci_conf_write16(dev->sbdf, msi_data_reg(pos, 0), msg->data);
+        pci_conf_write16(dev->sbdf, msi_data_reg(pos, entry->msi_attrib.is_64),
+                         msg->data);
         break;
     }
     case PCI_CAP_ID_MSIX:
-- 
2.11.0


