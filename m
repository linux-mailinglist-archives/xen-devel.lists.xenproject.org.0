Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406E416E9D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195045.347512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThDz-00063t-Kx; Fri, 24 Sep 2021 09:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195045.347512; Fri, 24 Sep 2021 09:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThDz-00061k-Hd; Fri, 24 Sep 2021 09:10:31 +0000
Received: by outflank-mailman (input) for mailman id 195045;
 Fri, 24 Sep 2021 09:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRwQ=OO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1mThDy-00061e-3i
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:10:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42617344-1d17-11ec-bab1-12813bfff9fa;
 Fri, 24 Sep 2021 09:10:28 +0000 (UTC)
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
X-Inumbo-ID: 42617344-1d17-11ec-bab1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632474627;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=flt40ZSuy8Pfpgn6sTAAkDoqhWcDyGnzCI4H5hH2DIs=;
  b=Lg5JsFRbEJGWFH+pcvswaNIF/Jogzg4SNc2gFXYTzJyqhfJHd6uxeQby
   PERTPXOcwPakFqirinxpFy2WfeJXqsKD6oWsJGttGV+wX9ahcL6LZQ8ZC
   VShWdQJ0jy1guIzEFuWoX7SmexgbGameKX7zYg77nEuC8515XA51lMoUj
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Oln3FXpqFEwxf91ovtV68pqbs9UGCDCbxGbwh9T1JDi2Q5VYNzzFNWKUClKfHHfuVp5jRyXBlU
 JOQUTuz92tpFOzM1AzVYzHw/V0Db8i3PxcX1JH76BBDX0vEDOu4xkMAh3+TBB7ARP0mxHPzvEv
 /vumyUYgY/QE2qoX+AM4bU1l0Xsyhbf0ezfITnoM2R0qmXDJJi23pzTUpxTJARbZEultUDfjyN
 PZ96OhZAsU10WQ8zE03YRDn5WP3HD0D1yt1jGXgjIKTQQsKHv3PBaYZnvedICZr3n6m3LnM2O7
 ajXEShY85AnNTT3WdO2DGpJx
X-SBRS: 5.1
X-MesageID: 55337888
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JCPae6nWl2dbiEd8f9ZNu63o5gxPIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCz+AaaqJYWT2KNgja4Sy9kkBuJSAn4VlTwRpq3hhEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Q02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NpGi4PzZDgUBIOPhN0hAxkHFA9vZoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMjkO5lZtmt93zHYC/cgaZvCX7/L9ZlT2zJYasVmQKuFP
 JVJOWoHgBLoPCUWC28QT68Fk/6ZgUmlcDZg933Oqv9ii4TU5FMoi+W8WDbPQfSSTNhRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+Ix1h7O55Xp2SjaGlE4Hj4eb/I37+ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRbFlZfvbEPtKl210iWH4s/ScZZm/WoQWmY/
 tyckMQpa1z/Z+Yw3qOn9Bjshzu2r/AlpSZku12KBgpJAu5/DbNJhrBEC3CHsZ6sz67DFzFtW
 UTofeDEt4ji6rnXyESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1eJWWzP
 RCO5V8LjHO2AJdMRfUsC25WI552pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5AYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRIcA9WfSRlX8CeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:W/AIfqDxvfEdkbTlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="55337888"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <paul@xen.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH v2] pci: fix handling of PCI bridges with subordinate bus number 0xff
Date: Fri, 24 Sep 2021 10:10:12 +0100
Message-ID: <1632474612-9940-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Bus number 0xff is valid according to the PCI spec. Using u8 typed sub_bus
and assigning 0xff to it will result in the following loop getting stuck.

    for ( ; sec_bus <= sub_bus; sec_bus++ ) {...}

Just change its type to unsigned int similarly to what is already done in
dmar_scope_add_buses().

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
v2:
- fix free_pdev() as well
- style fixes
---
 xen/drivers/passthrough/pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fc4fa2e..d65cda8 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -363,8 +363,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     /* update bus2bridge */
     switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
     {
-        u16 cap;
-        u8 sec_bus, sub_bus;
+        unsigned int cap, sec_bus, sub_bus;
 
         case DEV_TYPE_PCIe2PCI_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
@@ -431,7 +430,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
     /* update bus2bridge */
     switch ( pdev->type )
     {
-        uint8_t sec_bus, sub_bus;
+        unsigned int sec_bus, sub_bus;
 
         case DEV_TYPE_PCIe2PCI_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
-- 
2.7.4


