Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2B62FAD9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 17:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445847.701260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow4bk-0005ue-Kh; Fri, 18 Nov 2022 16:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445847.701260; Fri, 18 Nov 2022 16:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow4bk-0005rY-HR; Fri, 18 Nov 2022 16:52:52 +0000
Received: by outflank-mailman (input) for mailman id 445847;
 Fri, 18 Nov 2022 16:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTNm=3S=citrix.com=prvs=3144bca92=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ow4bi-0005rM-ON
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 16:52:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6caf5f4d-6761-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 17:52:47 +0100 (CET)
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
X-Inumbo-ID: 6caf5f4d-6761-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668790366;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J2CiieSJZxtkuKEWP4p8/1ZixIJQEx/CBNf7XOvZuew=;
  b=hmLyHFO6DoDprPar3+HP8uGJfuP/dXWRvOokfGqZAcSnaUpfvkyMIbgl
   kRh8R/f+1crfluauUSqxie5QlpJoiLmSH+BCaqd34Jtbv5eUvDxHhwiq6
   uiU5RhRHT7ob7rO1hz8PH4bPXFusu83KJZS0hnlYYl3xQvOwuYISyM8yd
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84189304
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qDwk46lLDhnkXmm5lNwq1sDo5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXWzVbKuINmCnLdtwaImz8BtQvp7TyYdmSVdorik1FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 foJJiEqRU6EvcKJ8oq5e8B329x/dNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zhrB9
 jOdpziR7hcyboOT+R+M4HiW1vLBk2D0AqkRCr7oz6s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIsorI171eDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 lKPhcKvOjVpv5WcU3fb/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5lAaCkqfarHgvQ/
 AKyrhkXnOgL0ZYUgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374105CHx7ZiHCgUpLj2WZVawXIVDIT4iNaxwtRoMmj1gYXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyhKVv46kWfsGb5FuVPO+szY7TmLLXwc5032uYdymVbPEetVWLdwRr9RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXWxPne9aRqSwJ0ClA7QT54UKeOn+5Jlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:LI5eY6xi1bUE00zMAEIBKrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="84189304"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH for-4.17] libs/light: Propagate libxl__arch_domain_create() return code
Date: Fri, 18 Nov 2022 16:52:35 +0000
Message-ID: <20221118165235.14143-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit 34990446ca91 started to overwrite the `rc` value from
libxl__arch_domain_create(), thus error aren't propagated anymore.

Check `rc` value before doing the next thing.

Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index b59bbe00bb..fa5c79e4f6 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -377,6 +377,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     state->console_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->console_domid);
 
     rc = libxl__arch_domain_create(gc, d_config, state, domid);
+    if (rc) goto out;
 
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
@@ -384,6 +385,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     if (!state->restore)
         rc = libxl__cpuid_legacy(ctx, domid, false, info);
 
+out:
     return rc;
 }
 
-- 
Anthony PERARD


