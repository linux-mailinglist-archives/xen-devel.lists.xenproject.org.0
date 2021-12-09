Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A039946F0EC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 18:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243203.420631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvMuQ-0006ss-4s; Thu, 09 Dec 2021 17:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243203.420631; Thu, 09 Dec 2021 17:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvMuQ-0006r5-1r; Thu, 09 Dec 2021 17:08:42 +0000
Received: by outflank-mailman (input) for mailman id 243203;
 Thu, 09 Dec 2021 17:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UJ8=Q2=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mvMuO-0006qy-Rq
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 17:08:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5dd9fbb-5912-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 18:08:39 +0100 (CET)
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
X-Inumbo-ID: a5dd9fbb-5912-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639069718;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hu1ZqT9o16Vi47eUiutfexlW11uIgdieEQGKeg+w63g=;
  b=TyFPZZZriC4AdzDSXJAxPUECAsaIHqaemS9FbRII/w2xj+70EwjV3bsK
   utblMyF/+AgaMCl9uqck8WRw7o6YqGcjOjOOr0zPjehGl/4zaAGjtnhPK
   6VRcQ8jxM1B3Y4g+cnvqwVMx0iUmDwhjcTy8Y9W236rEZ9NfwiBUfWyFP
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JQN7InQL5tZa7/jUWkllQ6zF0vj4YgYkHlOGkABVpxqnJtk/q/DQqQxhUQ+aqXIe4z2c81wpcC
 Hce43Qr/eVIiFL0hT7XXD7nYaAT/29NKp81jrBScvnIOrburrMcqS5pRs+IIz6lj+f9iyeeH48
 byNH5IIYXJdef55aoyZwFg2NlhVTueYtLBBHYi1YApIMsVCNlLFjjBMHzzyJxLe+THDFMsfWJ9
 yV9bBLbJjUdJveaCTyw/Vhm5KNLEsNKKBLeKaX1Qr1rnudw7FC4+jbiOoVOz6Bc91EkF7IYDQA
 8y5dMmPPCgenRLllYOs8UyTC
X-SBRS: 5.1
X-MesageID: 59675662
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vJtOAqkantmZbYysx0i+Ekvo5gy9IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJCzvQP/aLZWHzfdAibIzl8ksCvJSBzYQxTQRt+CAzESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2NY52YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ih35IaNYhkoBJXnvsMDdBV6UA9TbIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKeAO
 JdHN2AHgBLoeS1vEGs7FMwHpci1h0bHXxdUh3LEuv9ii4TU5FMoi+W8WDbPQfSISt9ShV2wv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0BuABCdAR9gC38oHyxBi+CkpHYBMQQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qXHb4
 xA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSXzLNABum8kfBsyWirhRdMOS
 BWM0T69GbcJZCf6BUOJS9zZ5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziFmPr
 osEaZLVk043vS+XSnC/zLP/5GsidRATba0aYeQOHgJaCgY5SmwnFdHLxrYtJ95sk6hPz7+a9
 XChQE5IjlH4gCSfewmNb3libpLpXIp+8i1nbXB9Yw7w1ihxe5ur4Ycea4AzIest+tt8wKMmV
 PICYciBXKhCE2yV5zQHYJDhh4V+bxD31xmWNi+obWFnLZ5tTgDE4PH+eQ7r+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi1qdpkMS38iPMzMvogExSby2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWW6oqqWvY
 eJZk6P1PPEdxQsYtoN9F/BgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHYasrqHWkYKBchcuneh+ofnSPf7KhtLUj3jMOtEGFrjamG08GwtRFg
IronPort-HdrOrdr: A9a23:qW6W5K2ysbpTu6ROmX3ARAqjBKQkLtp133Aq2lEZdPRUGvb3qy
 nOpoV96faaslYssR0b9exoW5PwJU80l6QFgrX5VI3KNGKN1VdARLsSiLcKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.88,193,1635220800"; 
   d="scan'208";a="59675662"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
Date: Thu, 9 Dec 2021 17:07:52 +0000
Message-ID: <20211209170752.20576-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The values are already available in dom->{console,xenstore}_pfn, just like on
the PV side of things.  No need to ask Xen.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_dom.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index c9c24666cd04..03841243ab47 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -722,13 +722,10 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
 }
 
 static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
-                                libxl_domain_build_info *info,
-                                unsigned long *store_mfn,
-                                unsigned long *console_mfn)
+                                libxl_domain_build_info *info)
 {
     struct hvm_info_table *va_hvm;
     uint8_t *va_map, sum;
-    uint64_t str_mfn, cons_mfn;
     int i;
 
     if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
@@ -749,12 +746,6 @@ static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
         munmap(va_map, XC_PAGE_SIZE);
     }
 
-    xc_hvm_param_get(handle, domid, HVM_PARAM_STORE_PFN, &str_mfn);
-    xc_hvm_param_get(handle, domid, HVM_PARAM_CONSOLE_PFN, &cons_mfn);
-
-    *store_mfn = str_mfn;
-    *console_mfn = cons_mfn;
-
     return 0;
 }
 
@@ -1168,12 +1159,14 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     if (rc != 0)
         goto out;
 
-    rc = hvm_build_set_params(ctx->xch, domid, info, &state->store_mfn,
-                              &state->console_mfn);
+    rc = hvm_build_set_params(ctx->xch, domid, info);
     if (rc != 0) {
         LOG(ERROR, "hvm build set params failed");
         goto out;
     }
+
+    state->console_mfn = dom->console_pfn;
+    state->store_mfn = dom->xenstore_pfn;
     state->vuart_gfn = dom->vuart_gfn;
 
     rc = hvm_build_set_xs_values(gc, domid, dom, info);
-- 
2.11.0


