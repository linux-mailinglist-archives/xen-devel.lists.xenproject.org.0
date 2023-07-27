Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CAF765675
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571158.894342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OI-0003Zk-67; Thu, 27 Jul 2023 14:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571158.894342; Thu, 27 Jul 2023 14:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2OI-0003RY-1z; Thu, 27 Jul 2023 14:54:58 +0000
Received: by outflank-mailman (input) for mailman id 571158;
 Thu, 27 Jul 2023 14:54:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP2OG-0003Ok-RC
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:54:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca5998a-2c8d-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:54:55 +0200 (CEST)
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
X-Inumbo-ID: 8ca5998a-2c8d-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690469696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ohc1iV0GThxiLbuhMafuZPgcgU3YvgSTIZgUQtbNJOA=;
  b=App6GUa/Xmz82snkjg8mykFveGwhLbPMKDmxNfy0zHkztz+m3GMXfuiQ
   V1cZl4WKym9oIZTyw3kho1Num+MEc9IYJ0iQe7thZUc82BsO7BAEjCPze
   en184+FwPOB5mkMg/5ZxVWH98pNZsR8gXVV8+MDm5htzNDeqN91Kdum/E
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118094561
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Of4ZtaBNa7/YixVW/+3jw5YqxClBgxIJ4kV8jS/XYbTApG5w1mECy
 GFKDW3VPquKNDT9LdF+Po2zpksGsJSAyYQwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6sRbG2131
 /YkLxsmNU/SqtLv8rOpY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XaHZQJwxjBz
 o7A1zTlE0kFaOWg8iOu91Oroev3o33XVZ1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtxgQQctNEMU17QiMzuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 Fi3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzhX1cnip1yFzWImOTNf3uHXrtMRBPq/MGzFto
 0M4d9iiAPEmVM/czHfcG7VVQNlF9N7ebmSC3AcH840Jsm30piX9Jd04DCRWfh8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjntZLlXvENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+5znXFgnzyCHsikp/hC7VZ4TCTLIVviGALQBt3VEYve+FmFm
 zqhH5XiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbaSjeK7FoJUqeLqZt4ItwNokigvruQl
 p1LchMCmQWXaLyuAVniV02Pn5u0B8sl9itiYnBxVbtqslB6CbuSAG4kX8NfVdEaGCZLlJaYk
 9Ftlx28P8ly
IronPort-HdrOrdr: A9a23:8WP6+q81h7xXXoAbd6Buk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3AOMIQR2hDz+1bPVggYHMV/fVcXTJuYl/x1nvpAUW?=
 =?us-ascii?q?EDk1CE+LEZG/JyqJ2up87?=
X-Talos-MUID: 9a23:D9Js9QsNiCJC8wDLz82n1C1zbNg02puVEWsIsJIhv/G6awB9JGLI
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="118094561"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v3 1/2] build: evaluate XEN_BUILD_* and XEN_DOMAIN immediately
Date: Thu, 27 Jul 2023 15:54:46 +0100
Message-ID: <20230727145447.2701-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727145447.2701-1-anthony.perard@citrix.com>
References: <20230727145447.2701-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

Also, `make -d` shows a lot of these:
    Makefile:15: not recursively expanding XEN_BUILD_DATE to export to shell function
    Makefile:16: not recursively expanding XEN_BUILD_TIME to export to shell function
    Makefile:17: not recursively expanding XEN_BUILD_HOST to export to shell function
    Makefile:14: not recursively expanding XEN_DOMAIN to export to shell function

So to avoid having these command been run more than necessary, we
will replace ?= by an equivalent but with immediate expansion.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v3:
    - replace evaluation on first use construct by immediate expansion which
      isn't likely to break and is clearer.

 xen/Makefile | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e8aa663781..c1738dbbde 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,10 +11,18 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
 export XEN_WHOAMI	?= $(USER)
-export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
-export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
-export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
-export XEN_BUILD_HOST	?= $(shell hostname)
+ifeq ($(origin XEN_DOMAIN), undefined)
+export XEN_DOMAIN	:= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
+endif
+ifeq ($(origin XEN_BUILD_DATE), undefined)
+export XEN_BUILD_DATE	:= $(shell LC_ALL=C date)
+endif
+ifeq ($(origin XEN_BUILD_TIME), undefined)
+export XEN_BUILD_TIME	:= $(shell LC_ALL=C date +%T)
+endif
+ifeq ($(origin XEN_BUILD_HOST), undefined)
+export XEN_BUILD_HOST	:= $(shell hostname)
+endif
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
-- 
Anthony PERARD


