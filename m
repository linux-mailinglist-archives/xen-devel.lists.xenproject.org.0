Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E697E075B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 18:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627281.978211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyxw5-0000vp-GZ; Fri, 03 Nov 2023 17:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627281.978211; Fri, 03 Nov 2023 17:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyxw5-0000sT-Cd; Fri, 03 Nov 2023 17:26:21 +0000
Received: by outflank-mailman (input) for mailman id 627281;
 Fri, 03 Nov 2023 17:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVO2=GQ=citrix.com=prvs=6645367c8=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1qyxw3-0000sN-GV
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 17:26:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1621c9e3-7a6e-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 18:26:15 +0100 (CET)
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
X-Inumbo-ID: 1621c9e3-7a6e-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699032375;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yN70GOoQktKPfAW3IF83IxnbcNK56YwJ2jVGY4KfhVk=;
  b=KY5Z5suq8r46jpa+02Pawk4IgTY3QXrYcPKnMdONNiVwsayDBVdYnQep
   5MCkxx1HlNYO2HO9OGjE/Ek2254Jooskk2gz0vdpYnwUPTMzOfxBN/PS0
   JiJ5GJNHI4WHLiNFoL5Qi1QVAZhRR7RrcYujZ4bfZL8yXFy9nQ9pzlQrb
   Y=;
X-CSE-ConnectionGUID: 3puI7Y9fT5KL74H8rEvnbA==
X-CSE-MsgGUID: ESGCXgn2QkqXPlMKtyqIYQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127951790
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:gfXooKyZ7XODwkksTO16t+cpxirEfRIJ4+MujC+fZmUNrF6WrkVWz
 TAdXzzTbPbZYmShL9tyb4q+9hxU68OByd5mHFdv+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVnPasT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTpW6
 N1HGWEDUk2go73q4OKhZ/dqjO12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tP2vnWK5dzRXpUiKrK4zy2PS0BZwwP7mN9+9ltmiHJ8KzxvB+
 TOel4j/KjwhG/evxjzfy3G1ttfLuADnSZszJYTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQ+vdIybSwn0
 BmOhdyBLSVitaDQRX+D+7O8qzS0Ni4Ia2gYakc5oRAtuoe55ttp11SWE4clT/bdYsDJ9S/Ym
 CiXjXcP1rsv0O0viPmbrUrqnTSmj82cJuIq3Tk7Tl5J/ysgOt/0P9fwuQGLhRpTBNzHFAXf5
 hDoj+DbvLhUU8zX/MCYaLxVROnB2hqTDNHLbbeD9bEK8C6k/zaYZZpR5j5lTKuCGp1fIWCwC
 KM/VBk42XOyAJdJRfUsC25JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ9wfBiY
 c/HL5jyVh727JiLKxLvGY8gPUIDn31lmws/u7igp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oz
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6WNkeJ6K9w5zv09eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:GT6fT6D6ScllFPHlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-Talos-CUID: 9a23:yBnY4WGGh5DFzFqzqmI87FM1RfF0fEGA71OPf2/oE0t3Tre8HAo=
X-Talos-MUID: 9a23:6ap0tQYoaHs0LOBTmgTDrwFtMp1R4L2eMEQosokXoui1DHkl
X-IronPort-AV: E=Sophos;i="6.03,273,1694750400"; 
   d="scan'208";a="127951790"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<qemu-devel@nongnu.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/pt: Emulate multifunction bit in header type
Date: Fri, 3 Nov 2023 17:26:01 +0000
Message-ID: <20231103172601.1319375-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The intention of the code appears to have been to unconditionally set
the multifunction bit but since the emulation mask is 0x00 it has no
effect. Instead, emulate the bit and set it based on the multifunction
property of the PCIDevice (which can be set using QAPI).

This allows making passthrough devices appear as functions in a Xen
guest.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 hw/xen/xen_pt_config_init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 2b8680b112fa..e6ec32e3ccd2 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -291,7 +291,10 @@ static int xen_pt_header_type_reg_init(XenPCIPassthroughState *s,
                                        uint32_t *data)
 {
     /* read PCI_HEADER_TYPE */
-    *data = reg->init_val | 0x80;
+    *data = reg->init_val;
+    if ((PCI_DEVICE(s)->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)) {
+        *data |= PCI_HEADER_TYPE_MULTI_FUNCTION;
+    }
     return 0;
 }
 
@@ -676,7 +679,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0x00,
+        .emu_mask   = PCI_HEADER_TYPE_MULTI_FUNCTION,
         .init       = xen_pt_header_type_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
-- 
2.41.0


