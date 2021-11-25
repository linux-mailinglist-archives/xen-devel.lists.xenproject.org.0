Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E445DB9A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231328.400436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6o-0006dt-MR; Thu, 25 Nov 2021 13:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231328.400436; Thu, 25 Nov 2021 13:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6o-0006Tn-DD; Thu, 25 Nov 2021 13:48:18 +0000
Received: by outflank-mailman (input) for mailman id 231328;
 Thu, 25 Nov 2021 13:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF1D-0007NX-Hi
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f64a68-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:42:30 +0100 (CET)
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
X-Inumbo-ID: 88f64a68-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M5y2bRJwpf/f0iMaWElHVm6rrtkE9/3uGDJa1vQtN3Q=;
  b=XJ1agrudUQ1NaqUb7sXHOKZ2P6SUF8ASYQ53t/ozyBto7GC1H60wLdTm
   loza74i3lFw/X0UZ3taK8UNExfIBaoYmvFuysZFfpEw7NnwRtkGqEvbs2
   18F85z6bRBfvCepU0soJI2SEjSi1a+lzWw+iEzeOTWsGxzFBoXz8QHSS+
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +2VEdq1WgiM/G1sp2lY11YCa7Erm61nQNOXokXF538l83+fX9k5dAvASaT44CAaIIM0zTs6pRv
 /ArX0jk6a9Ws6lcFXdk0cEZQDYk6kerArldHTosuhrBjU8VmdrmJXUr4syJjt/BpXFNm0+iGLL
 APgv3nrao5vzL/YfoWWzGQ9CyToQfHCYqVY171Fq5qzxhcr735Z4w0+Yqcbi83JeE5Zx1Wr7kJ
 eEhpYH8TlPyi32mvsQi0JeYKINidKljsc82yL5zVbVxXO6ivciLoAAf4Ew3YGfkZmY2ircxvxN
 Jc3EEgyEveoUTZNDkzpFvw4j
X-SBRS: 5.1
X-MesageID: 60634187
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oL6KfatgdgMA6GCvFsJboqbUMefnVL9ZMUV32f8akzHdYApBsoF/q
 tZmKW2Gb6mDZDGjet8gPo238kpUupHRzYBgT1Q9rys0Hi9D+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl65GpWA4gErP2vMdCDRhKLAZbIapP5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 5RCNWM/M3wsZTV/PQ0sDLY5l96Yl0j6VyZbqQO4mqsetj27IAtZj+G2bYu9lsaxbclakkuXv
 Gvu43XyAhZcMseWjzWC7BqEivfUmCLnWKobDLCi6uNxm1qX23ASDxsNE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JZFfE67wecjLLZ+Q+DCkALSzdAbJots8peeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sEXYYNH4LbAMady8mvIfisr4Uqw7IR8k2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCCta4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yL8FWyzyGsnTKuMDirjUWW0C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvL1DYo3A+NR/KgTGFfK0QfUYXY
 8nzTCpRJSxCVfQPIMSeG4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9yr2Vo
 yrjAxAAkzISRxTvcG23V5yqU5u3Nb4XkJ7xFXdE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:3rvEOaF025sUspwxpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634187"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 42/47] RFC, no-VPATH: workaround includes in xsm/flask
Date: Thu, 25 Nov 2021 13:40:01 +0000
Message-ID: <20211125134006.1076646-43-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

maybe generated header should be in a different directory

using <>-included headers instead of "" to avoid gcc including headers
from the source tree when it needs to includes them from the build
tree.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/xsm/flask/include/avc.h      | 4 ++--
 xen/xsm/flask/include/avc_ss.h   | 2 +-
 xen/xsm/flask/include/objsec.h   | 2 +-
 xen/xsm/flask/include/security.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/xsm/flask/include/avc.h b/xen/xsm/flask/include/avc.h
index c14bd07a2b39..b9be6ca5aa8b 100644
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -14,8 +14,8 @@
 #include <xen/percpu.h>
 #include <xen/spinlock.h>
 
-#include "flask.h"
-#include "av_permissions.h"
+#include <flask.h>
+#include <av_permissions.h>
 #include "security.h"
 
 extern bool flask_enforcing;
diff --git a/xen/xsm/flask/include/avc_ss.h b/xen/xsm/flask/include/avc_ss.h
index a3d7d1ef07a8..d80c2c7e57d8 100644
--- a/xen/xsm/flask/include/avc_ss.h
+++ b/xen/xsm/flask/include/avc_ss.h
@@ -6,7 +6,7 @@
 #ifndef _FLASK_AVC_SS_H_
 #define _FLASK_AVC_SS_H_
 
-#include "flask.h"
+#include <flask.h>
 
 int avc_ss_reset(u32 seqno);
 
diff --git a/xen/xsm/flask/include/objsec.h b/xen/xsm/flask/include/objsec.h
index b576a5dd4381..69ec66d3fe33 100644
--- a/xen/xsm/flask/include/objsec.h
+++ b/xen/xsm/flask/include/objsec.h
@@ -14,7 +14,7 @@
 #define _FLASK_OBJSEC_H_
 
 #include <xen/sched.h>
-#include "flask.h"
+#include <flask.h>
 #include "avc.h"
 
 struct domain_security_struct {
diff --git a/xen/xsm/flask/include/security.h b/xen/xsm/flask/include/security.h
index ec8b442a8f3b..8433541aa738 100644
--- a/xen/xsm/flask/include/security.h
+++ b/xen/xsm/flask/include/security.h
@@ -10,7 +10,7 @@
 #ifndef _FLASK_SECURITY_H_
 #define _FLASK_SECURITY_H_
 
-#include "flask.h"
+#include <flask.h>
 
 #define SECSID_NULL            0x00000000 /* unspecified SID */
 #define SECSID_WILD            0xffffffff /* wildcard SID */
-- 
Anthony PERARD


