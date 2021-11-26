Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D515B45F650
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 22:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233492.405135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigl-0006pG-96; Fri, 26 Nov 2021 21:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233492.405135; Fri, 26 Nov 2021 21:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigl-0006mT-5j; Fri, 26 Nov 2021 21:23:23 +0000
Received: by outflank-mailman (input) for mailman id 233492;
 Fri, 26 Nov 2021 21:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqigk-0006mN-C5
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 21:23:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 132f5f49-4eff-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 22:23:20 +0100 (CET)
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
X-Inumbo-ID: 132f5f49-4eff-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637961800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bq6J9uivE4OFqVknMwT0glvJ/cJ2p4tmLYuqVTlL0Lk=;
  b=CP+eHPxlhd9WTsTtqagvcCD8gqr+qeE1PovB6srdOkJXQbntA2z0RUTt
   SpMpn/8F627Vzmv78QMpRynslHJfdlvyM/242WHAspde4wUB7N1JvLKMW
   rgK3TYwRKWHCAjQRCFpDODTl3WD1aAEAcB3atd5w48SqhxRF4/H6qWiD+
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jjjHfZ7XNjv2KAbml77rhU0NWM9t2TmwMqi+zNaDiF3d1Uz/t3fqSUneKdTeIlM77/Rz+8NtG5
 Ercv6V3ZK6OImyRt3yLn+pj9hmBWrt2YSSwNOzwTZfADLCwLql/5QKF4lBNVTFeFFLOxQOoCNJ
 mpg8KiI2pNYE2GKAP3AdZ0BqqgQZ1nE1QktmuD0bbu9Gxtf/zNyGR/aP0WY1LOB8Et+Z0GI3i9
 +0UlAZsXdLGLDjdQ39rvM8VbxUGxMtp1Q/QS0eYE2zA/ENYoBd3BTIkhoLcUk5xIRx14Klq9q3
 jkFkWWHVn0dpM5+pWRyXShDe
X-SBRS: 5.1
X-MesageID: 58217717
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EyFukK3jWiHtpgMFyvbD5St2kn2cJEfYwER7XKvMYLTBsI5bpzNWy
 WcdDTjVPvnfYTbxKtoiO9iy8k0Gv5fcyYJmQVM/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhuuh6+
 u0Tka2JSR4zYPyVh8A3VANoDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1poXQqmHO
 KL1bxJSTzOYSi9rIW0LUpInuuS3oXf0fxJX/Qf9Sa0fvDGIkV0ZPKLWGPj/d8GORM5Vtl2Fv
 W+A9GP8ajkFMPSPxDzD9Wij7sfDhTj+WZ4SPLSg++R2nUaIwWgOFBwRU0D9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+E15AyC0KP8/xeSBm9CSCVILtMhqqcLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aHBAeH1dcQR49TRIfvYi6v6UZiQj/UYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQGDta4oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFpy7LkWN4umgWyKJV3iAsI2eBj
 Kj741452XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX81Oh/Nhj22yhJyzsnT3
 Kt3l+72Vh727ow9kVKLqxo1i+d3lkjSO0uPLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVrVPje9p0MHsbec1UOJY3UI6KIqV/XU9c+xPo9eyah1
 izVZ3K0P3Kj3yCaclvTNSg4AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:IVHYNqEfXFqZKJCWpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58217717"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] xen/xsm: Use __init_data_cf_clobber for xsm_ops
Date: Fri, 26 Nov 2021 21:22:57 +0000
Message-ID: <20211126212258.7550-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126212258.7550-1-andrew.cooper3@citrix.com>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All calls through xsm_ops are fully altcall'd.  Harden all fnptr targets.

This yields:

  (XEN) altcall: Optimised away 197 endbr64 instructions

of 1655 on an everything-enabled build of Xen, which is ~12%.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/xsm/dummy.c       | 2 +-
 xen/xsm/flask/hooks.c | 2 +-
 xen/xsm/silo.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 4d29a9aa5b9f..4f1d352d5507 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -13,7 +13,7 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
-static const struct xsm_ops __initconstrel dummy_ops = {
+static struct xsm_ops __initdata_cf_clobber dummy_ops = {
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 63484e323c09..b1c917113ec3 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1765,7 +1765,7 @@ static int cf_check flask_argo_send(
 
 #endif
 
-static const struct xsm_ops __initconstrel flask_ops = {
+static struct xsm_ops __initdata_cf_clobber flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 4d5fc98e7e54..7a17595888bb 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -102,7 +102,7 @@ static int cf_check silo_argo_send(
 
 #endif
 
-static const struct xsm_ops __initconstrel silo_xsm_ops = {
+static struct xsm_ops __initdata_cf_clobber silo_xsm_ops = {
     .evtchn_unbound = silo_evtchn_unbound,
     .evtchn_interdomain = silo_evtchn_interdomain,
     .grant_mapref = silo_grant_mapref,
-- 
2.11.0


