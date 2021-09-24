Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD741693A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194705.346920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZgc-0005ue-Px; Fri, 24 Sep 2021 01:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194705.346920; Fri, 24 Sep 2021 01:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZgc-0005sr-Mi; Fri, 24 Sep 2021 01:07:34 +0000
Received: by outflank-mailman (input) for mailman id 194705;
 Fri, 24 Sep 2021 01:07:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRwQ=OO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1mTZgb-0005sl-DC
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:07:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc624788-1f63-49e5-ad7f-3b40609bd6b7;
 Fri, 24 Sep 2021 01:07:31 +0000 (UTC)
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
X-Inumbo-ID: cc624788-1f63-49e5-ad7f-3b40609bd6b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632445650;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=AQPasy10jnAnd6QRIBKkT16f+WQmWbLReT1xEJ+hZHo=;
  b=YBSKvVoahNmyOO4Xeb1poBLavlE3+YxENSAkoZ44fgzB9CaMx+8mC5Km
   oP3wKlPrBiDMH3zdUC5Wl9MCXoCqTFIzbta9tp9ElH4aXxySKcG6tEj+W
   0A4URqdvoVecGCCcocGdGpD5tv4FF6ASK/golN5KSRftDp2D72bAsW7jg
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 52exaaOPYHh4O0trf5qSy0hCRAMunmEEbdVijJD+xLOGSdpJi/GNIq9SvZBBZ7OuXzZ40jBgzN
 Jm9E6yOjdXdkyQtaHpCqYqZx0zUE5cZv4a+HYlM0zm/VBJSxoahyKRQRdgrfS0y2abrspFawkt
 rJppBBJafpjcUVHbp33QmUKVJWfu10p+9jVaQpi1Pov3tyyq5WaAak10a0J0ESZeoBXtyXinjF
 FEYftvDH4+NY52aHhPiQFiV4AY4z1xnc1R7ixnrbO48gvE9yYEUgAHRZN/NW6lj5DDo5X4Ex7X
 Mj0=
X-SBRS: 5.1
X-MesageID: 53916454
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yCvSk61yved+6545ovbD5dFxkn2cJEfYwER7XKvMYLTBsI5bp2AHz
 WVOWD+PMqyPNzahctxxaoy/8kNX6pTTxtYxSQc4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbVh2eaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhutNy1
 Y5ptpmMQBZxZpHXncRFWUlXOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Eh8skNo/nJp4NunBmzDfxBvc6W5HTBa7N4Le02R9t3ZEXQ6qDO
 6L1bxJjYAifbAJIBG0uBas8zcuWn0XVSSZh/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0ftlTDrYe6wSxw7uMuzqCA0hcRG5OQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djBZOHVaJecRy5y6+thi006WJjp2OPPt1rXI9SfML
 ydmRcTUr44ai9ICn46/9ErO695HjsmUFlNtjuk7s2TM0++YWGJHT9D0gbQ4xawZRGp8crVnl
 CJf8yR5xLpSZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfx01aJxZJmK1P
 BW7VeZtCHl7ZiDCgUhfOd7ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZzEMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHKKrtJDcQ5QfRDWx/ne8qRqSwJKGSI+cElJNhMb6epJlyFNz/wL/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:+JPzVq0xhA5PjgWuUHnqlQqjBKQkLtp133Aq2lEZdPRUGvb3qy
 nOpoV96faaslYssR0b9exoW5PwJU80l6QFgrX5VI3KNGKN1VdARLsSiLcKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.85,318,1624334400"; 
   d="scan'208";a="53916454"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <paul@xen.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH] pci: fix handling of PCI bridges with subordinate bus number 0xff
Date: Fri, 24 Sep 2021 02:06:59 +0100
Message-ID: <1632445619-9211-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Bus number 0xff is valid according to the PCI spec. Using u8 typed sub_bus
and assigning 0xff to it will result in the following loop getting stuck.

    for ( ; sec_bus <= sub_bus; sec_bus++ ) {...}

Just change its type to u16 the same way that is already handled in
dmar_scope_add_buses().

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/drivers/passthrough/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fc4fa2e..48b415c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -364,7 +364,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
     {
         u16 cap;
-        u8 sec_bus, sub_bus;
+        u16 sec_bus, sub_bus;
 
         case DEV_TYPE_PCIe2PCI_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
-- 
2.7.4


