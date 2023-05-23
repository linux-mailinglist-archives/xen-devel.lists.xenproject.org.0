Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352170E1F8
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538563.838658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2H-0001bK-8W; Tue, 23 May 2023 16:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538563.838658; Tue, 23 May 2023 16:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2H-0001Xj-4b; Tue, 23 May 2023 16:38:57 +0000
Received: by outflank-mailman (input) for mailman id 538563;
 Tue, 23 May 2023 16:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2F-0006Dq-IC
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d58af33-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:54 +0200 (CEST)
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
X-Inumbo-ID: 4d58af33-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xUrRJZg21IcuIXPT65Mny77WEiL8WRyRZGb2P5u/V+k=;
  b=LZ61PVuPAlSVkaOC4RYQddLagOPLe1XbU0xz7v36taSS2HOe/PAKUWMk
   euDVWxBUxQ3ODQcGXOgEXCNeTnnPxLxM3GSRdRxlctLd7X6vaPfxkbsZn
   D1b0nLMkKm6bEtXggTb0GfsSoKq+A0ttIOKTqdvPF1NI3wYkn7FO1ZQeL
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110112588
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:CRZ2A6ODbD5H+ZXvrR2Wl8FynXyQoLVcMsEvi/4bfWQNrUoghGMFn
 GsYDD2DbPeOM2D8fIh1aou19xgHucWHzIJkSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t11KjhX8
 8w3EmpOUD6biMir+4uUF+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHZwMxBvI9
 goq+UzwMB03d9qgkgap1X6ptrORgHOiVqE7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLmoZSj9MbvQ2uclwQiYlv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcdYQcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7tswgjry9zX/92XGSiIDGZBMO3yqKUTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fK4fTgGfqqOBjarXnSWXFHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF7mn9unT+IFMmjk3xLNIZyg1bME9843KamNLhlvMtoXi2Om
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAGOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSafc1TVNSgzOe+HsFQWhStTABHA9G2AgxALCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:CD91cKvMtS3VwGBX/AUAJYtZ7skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: 9a23:KD4jOmyU9n6r63qOtdRbBgUvGOt8a3vt402KYHGWEWlDVYasZgKfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AZnozNw/eKAaoSy0k1ob4b3KQf85a74ntDn9Wrbk?=
 =?us-ascii?q?ht8y0aXJta26Trx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110112588"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 13/15] build: fix compile.h compiler version command line
Date: Tue, 23 May 2023 17:38:09 +0100
Message-ID: <20230523163811.30792-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CFLAGS is just from Config.mk, instead use the flags used to build
Xen.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I don't know if CFLAGS is even useful there, just --version without the
    flags might produce the same result.

 xen/build.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/build.mk b/xen/build.mk
index e2a78aa806..d468bb6e26 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -23,7 +23,7 @@ define cmd_compile.h
 	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
 	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
 	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
-	    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
+	    -e 's!@@compiler@@!$(shell $(CC) $(XEN_CFLAGS) --version 2>&1 | head -1)!g' \
 	    -e 's/@@version@@/$(XEN_VERSION)/g' \
 	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
 	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
-- 
Anthony PERARD


