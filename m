Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81D4375AE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214951.373852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5u-0006l2-QE; Fri, 22 Oct 2021 10:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214951.373852; Fri, 22 Oct 2021 10:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5u-0006f7-IG; Fri, 22 Oct 2021 10:48:14 +0000
Received: by outflank-mailman (input) for mailman id 214951;
 Fri, 22 Oct 2021 10:48:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5s-00063s-J0
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8aaffa20-3325-11ec-83b2-12813bfff9fa;
 Fri, 22 Oct 2021 10:48:07 +0000 (UTC)
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
X-Inumbo-ID: 8aaffa20-3325-11ec-83b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXdMTUepQc/hWgrrZYpWXrp3b/8Yk5JMcrV/PHsyXk8=;
  b=CBOnxnnSZHoq9WMG/jcYbwpGgX6tWk25cLlIj3/ck1cM0TGe8RalBcQD
   39GMHUm9YSp38uOllQXfB5yaFXHtpym8OCCy/KyPzTjuZhFdEpQRh8cGO
   DUuJDB7y33obkqD5N2xOF20ga0L5js2wSSxFBAomYBDX2qoXkAwFOcc9K
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5mV+QcJuMbU1xqtO+XxIArH03DeejP7wBDUKBvGVXkm3MZrcF9qzgOVv4yecmboHYycM1Vflk0
 5i3hChc0YQ9YowmZezRDpSA32TSB8OCaxG+EHSxk9xZjxz5VlTa3M0Hw0XutKF0G1+hsnZVc+C
 68ze2YdqIDFWFIItGHmjSV/FaZ7K30Mr751aZwc/YPLr3OF8bpzZtLbLa8mo5yx7jJ7DTlyE/V
 uZlNdYx3Q0Zu0Ul0quvuehcm2UHx55DlBQcIgiV4YiW4ZHr6/S15RDhUN7Wv8btxjVghqrHz1L
 X62c5dseILazvfIQRis2jK9r
X-SBRS: 5.1
X-MesageID: 55807253
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m7bC0qubxBSeGMlPh5sjBrMyKufnVIhZMUV32f8akzHdYApBsoF/q
 tZmKW3VOf/bYGvyeosnOY/j/EMG7cOGnN9qSFZo/yFkES8T+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplu8fzUAMUJvT2vstEdUB8Gid/IqJI0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DOIIZ/HVh0BnSDOo8QICFSKLPjTNd9Gpt1pgRR6uFD
 yYfQTBjQw/pQAJlAWUoGZ4FnMGIqSPkcDIN/Tp5ooJoujOOnWSdyoPFPMLOf92WRe1chkuCu
 n/d5GP9Hw0bM9qEjzGC9xqEiuDDkCzhUaoOBba48bhsm1TVyWsNYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZjAaK8UiiddvfxoFj
 3nQu9rvBCNgvpTAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo08SPDt37UZDRm1m
 mrQ9HFv2N3/mOZSj/3jlW0rlQ5AsXQgouQd3Q7QQn6+pj1wYIqoduREAnCKsK4ecu51orSH1
 UXoevRyDshSUvlhdwTXGY3h+Y1FAd7fbFUwZnY0R/EcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QrM97oVJRylvWxfTgAahwyRoASCnSWXFTflByCmGbKhzy9+KTSufFX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClM3QT97U6aMme9Jlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:Rx5Bgq8GbjfmWaIMfPxuk+DiI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re5cjztCWE8wr5N0tQ+uxoVJPufZqYz+8Q3WBzB8bFYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IOcOEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55807253"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 5/7] xen/xsm: Switch to byteswap.h
Date: Fri, 22 Oct 2021 10:47:26 +0000
Message-ID: <400efbc5c394140bb01664e5847046e8c4a38ea2.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to use byteswap.h to swap bytes

No functional change

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/ss/avtab.c       | 2 +-
 xen/xsm/flask/ss/conditional.c | 2 +-
 xen/xsm/flask/ss/ebitmap.c     | 2 +-
 xen/xsm/flask/ss/policydb.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index bfc91c8b0c..1fa796f625 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -19,8 +19,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
+#include <xen/byteswap.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
index 3e58aea551..059f6e07e5 100644
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -9,7 +9,7 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/errno.h>
diff --git a/xen/xsm/flask/ss/ebitmap.c b/xen/xsm/flask/ss/ebitmap.c
index e1d0a586a7..1550437c6f 100644
--- a/xen/xsm/flask/ss/ebitmap.c
+++ b/xen/xsm/flask/ss/ebitmap.c
@@ -10,7 +10,7 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index 9426164353..595005c3b7 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -22,7 +22,7 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
-- 
2.27.0


