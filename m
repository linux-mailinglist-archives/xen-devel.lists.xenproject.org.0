Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91C559E36
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355731.583607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrq-0002FC-Jn; Fri, 24 Jun 2022 16:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355731.583607; Fri, 24 Jun 2022 16:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrq-0002Cr-Fh; Fri, 24 Jun 2022 16:09:10 +0000
Received: by outflank-mailman (input) for mailman id 355731;
 Fri, 24 Jun 2022 16:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lo7-0004qc-1N
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db82574-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:14 +0200 (CEST)
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
X-Inumbo-ID: 6db82574-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fDQ/vJNJxx9MBaOwB2oL0yR7kNW2eRPokZWwFVGVAsQ=;
  b=PmdY29JVwAOMKBPwTB41fUjBt+YXlePgcHhHTRCL4S3KYnZr00hysaoj
   tefkI2iKlVvbABUKgojQ0ikdJ9qWx/Bebjnytl5q4SIAhUkR9ngBkWrY/
   j+qTrYlVMgxhMFRODRvKyBPPDUQ+6F7KkQGbUJe5BHhx7kEF/fIYTgbDh
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76935370
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bCZZ7a32KuCpMNdmffbD5Zpxkn2cJEfYwER7XKvMYLTBsI5bpzUBy
 GpMDW3UbP/cNDT9Lo1xbNy2904G78eGm9VrGgpupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Vl77tQy4xLJScgdk8QUJePgohI5VJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNamAN
 pFEMmU3BPjGSyNDOVoYMrgmpf+hhXbeXTthtlG3lYNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4Aq1m72RPDlTSTouUOlrEUadvEPDdU1vVTlJrXv3+qJOoQVZmcfNYJ+75JuGmxCO
 kyhxI2wW2E22FGBYTfEr+rP82vvUcQABTVaDRLoWzfp9DUKTGsbqhvUBuhuH6eu5jEeMWGhm
 mvaxMTSalh6sCLq60lY1Qqe695UjsKVJjPZHy2ONo5f0it3ZZS+e6uj4kXB4PBLIe6xFwfc4
 iBcypHBsLhWUvlhcRBhps1XRNlFAN7VWAAwfHY1R8Vxn9hT0yTLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKJu0I+RRfYvOeqZUp1ypYC5TIiNfq2EP7JmP8kqHCfarX4GWKJl9z20+KTaufpkY
 snznAfFJStyNJmLOxLsFrlEj+N0l3tgrY4RLLiipymaPXOlTCb9Yd843JGmNIjVMIvsTN3pz
 uti
IronPort-HdrOrdr: A9a23:y/KiH6F3TRHJsio3pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="76935370"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 23/25] tools/helpers: Fix build of xen-init-dom0 with -Werror
Date: Fri, 24 Jun 2022 17:04:20 +0100
Message-ID: <20220624160422.53457-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Missing prototype of asprintf() without _GNU_SOURCE.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/helpers/xen-init-dom0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0.c
index 37eff8868f..764f837887 100644
--- a/tools/helpers/xen-init-dom0.c
+++ b/tools/helpers/xen-init-dom0.c
@@ -1,3 +1,5 @@
+#define _GNU_SOURCE
+
 #include <stdlib.h>
 #include <stdint.h>
 #include <string.h>
-- 
Anthony PERARD


