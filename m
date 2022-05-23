Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E559530C6A
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335655.559828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k4-0002mf-86; Mon, 23 May 2022 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335655.559828; Mon, 23 May 2022 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k4-0002fU-3W; Mon, 23 May 2022 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 335655;
 Mon, 23 May 2022 09:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k3-0002dp-1s
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16a63e5a-da7e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:52:43 +0200 (CEST)
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
X-Inumbo-ID: 16a63e5a-da7e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEkEMnPb+q1gLdgxKH7ndanRPUKwGzgXMdy6eBWVxBI=;
  b=KcSzmiiDACObnkdzFPCcFC+0HszyloCyEwN3hVSa9kSAvL93QgSmhbm8
   ffYcNsk2GM1PK0R9Pc2yy26bxkfesqPvjDkAZo4u59B+pu+CQPC0+SSwe
   n/DXDV+3aT+E2NB0i0lQCoAU3cEyV66c1/762pmQCTmeHF/L5hyrhEKXy
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74445148
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iQmXt6kRhckX7sWuOuVaf2Lo5gzUJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWG3VafzeYmb3cogkPdy2/EtXsZfWz9U1QAdo+yEwFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVjV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYeSEDJZbcvNomXCJXSQ9sD5VgxeWWPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3vnBmizXYEN4tQIzZQrWM7thdtNs1rp8SQaqDP
 pZJAdZpRCuHaiNsHFoVMpIFkf6BoXvEagwAl03A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkFMPSPxDzD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKali46ccFrA8kE0w62xfD68TShIFVeHyEUPbTKq/QKqSwWO
 k6hxo20XmY04O3OExpx5Z/P82rsZHF9wXsqIHZdEFBbu4SLTJQb1Eqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCub/BDvNAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUynHWGrlRQOjzv6/VWNE5vbKIN8B8nwlBBlb5JdwAiN2ADBkB3jk4lc/BP
 xaI5FI5CG57N3q2d65nC79d+OxzpZUM4e/ND6iOBvIXO8AZXFberElGOB/Lt0iwwRdErE3KE
 crCGSpaJS1CWfoPIfvfb7p17ILHMQhllTKPHsqilkvPPHj3TCf9dIrp+WCmNogRhJ5oai2Pm
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:BSCFIquqKXSpjDe62mMIRMwg7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="74445148"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 5/6] tools: Use new byteswap helper
Date: Mon, 23 May 2022 05:52:21 -0400
Message-ID: <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Include new header to use new byteswap helper

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c   | 5 +++++
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index fc48198741..493427d517 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
 	return cpu_to_le32(*p);
 }
 
+static inline u32 le32_to_cpu(u32 val)
+{
+   return le32_to_cpup((const u32 *)&val);
+}
+
 #define __force
 #define always_inline
 
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 01eafaaaa6..b06f2e767f 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -31,7 +31,8 @@ typedef uint64_t __be64;
 
 #define __BYTEORDER_HAS_U64__
 #define __TYPES_H__ /* xen/types.h guard */
-#include "../../xen/include/xen/byteorder/little_endian.h"
+#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#include "../../xen/include/xen/byteorder.h"
 #define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
 #include "../../xen/include/xen/unaligned.h"
 #include "../../xen/include/xen/xxhash.h"
-- 
2.27.0


