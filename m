Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB75211F8
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325336.547872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuJ-0005Oh-MO; Tue, 10 May 2022 10:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325336.547872; Tue, 10 May 2022 10:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuJ-0005Iy-G8; Tue, 10 May 2022 10:15:55 +0000
Received: by outflank-mailman (input) for mailman id 325336;
 Tue, 10 May 2022 10:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noMuI-000561-9M
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:15:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c2a401e-d04a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:15:53 +0200 (CEST)
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
X-Inumbo-ID: 2c2a401e-d04a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652177753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vAwEG8ep7queso8cVxSz5fAnFQyJV9WnYmQA5HibJZQ=;
  b=gqC1vIksuqG7vDX2TFXtryrua+qX9mYL2qQFyS9HhyZW1G8ZHx0KoOZE
   4AjuGs8QsC+1Rfe8zDuFaBrU4UT5NEHWaqnKXPBGRqCp2snc/ZXQid5pD
   HbCLJpJbKI8qLBLbFPFSg7FtRWOSOnHE4SuZDU1gVbezkO8nK6qGpzYcj
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70954410
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:97wGWqkTf3tYqL35HcatMPHo5gzhJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXDiAafaJMGLwLo8nad61oUIPvpWHyNRqHVNtqHpgQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYhp1EKGQm/Ukb0d7HAclOZ1KpeHLCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3vnBmizXYEN4tQIzZQrWM7thdtNs1rp8WTKuCO
 5NBAdZpRBDPRyxxCl4RNKkvsuiNgnX1IgF68XvA8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkFMPSPxDzD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljUBB/RcT+4r0T3T6aXyuAKpCjVaQhcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/45SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPeZJhKTysDA3CMqsy67DFzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWn3oiT6ItAAvGkjTKuMDirjUWWyC
 HI/RCsLvMMDVJdURfEfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPU8pBLrFrh17FPe7n1nrY8lbcujn0rPPHv3TCP9dIrpx3PUML9jsPPf8FW9H
 hQ2H5Li9iizmdbWOkH/mbP/53hQRZTnLfgac/BqS9M=
IronPort-HdrOrdr: A9a23:7Iquia4cpNTL9TfGrAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70954410"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 6/6] tools: Remove unnecessary header
Date: Tue, 10 May 2022 06:15:24 -0400
Message-ID: <e6e161b23ad9860972a9af2e7dfa61ce1f0cacda.1652170719.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1652170719.git.lin.liu@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

xen/byteorder/little_endian.h is included but not used, Remove it.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 01eafaaaa6..47e071574d 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -31,7 +31,6 @@ typedef uint64_t __be64;
 
 #define __BYTEORDER_HAS_U64__
 #define __TYPES_H__ /* xen/types.h guard */
-#include "../../xen/include/xen/byteorder/little_endian.h"
 #define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
 #include "../../xen/include/xen/unaligned.h"
 #include "../../xen/include/xen/xxhash.h"
-- 
2.27.0


