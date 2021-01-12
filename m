Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F12F386F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65885.116862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGP-0005P0-82; Tue, 12 Jan 2021 18:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65885.116862; Tue, 12 Jan 2021 18:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGO-0005Nf-Sj; Tue, 12 Jan 2021 18:19:28 +0000
Received: by outflank-mailman (input) for mailman id 65885;
 Tue, 12 Jan 2021 18:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOC5-0003Yo-0c
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:01 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43165549-8ff0-404b-a977-858c8a13a696;
 Tue, 12 Jan 2021 18:13:45 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDgKt023989;
 Tue, 12 Jan 2021 19:13:42 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDfO6024230;
 Tue, 12 Jan 2021 19:13:41 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 610617218; Tue, 12 Jan 2021 19:13:41 +0100 (MET)
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
X-Inumbo-ID: 43165549-8ff0-404b-a977-858c8a13a696
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libs/light: fix tv_sec printf format
Date: Tue, 12 Jan 2021 19:12:34 +0100
Message-Id: <20210112181242.1570-14-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:42 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
Use %jd and cast to (intmax_t) instead

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

---
 tools/libs/light/libxl_create.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 86f4a8369d..7199a79778 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
         vments[2] = "image/ostype";
         vments[3] = "hvm";
         vments[4] = "start_time";
-        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
+        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
 
         localents = libxl__calloc(gc, 13, sizeof(char *));
         i = 0;
@@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
         vments[i++] = "image/kernel";
         vments[i++] = (char *) state->pv_kernel.path;
         vments[i++] = "start_time";
-        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
+        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
         if (state->pv_ramdisk.path) {
             vments[i++] = "image/ramdisk";
             vments[i++] = (char *) state->pv_ramdisk.path;
@@ -1502,7 +1502,7 @@ static void domcreate_stream_done(libxl__egc *egc,
         vments[2] = "image/ostype";
         vments[3] = "hvm";
         vments[4] = "start_time";
-        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
+        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
         break;
     case LIBXL_DOMAIN_TYPE_PV:
         vments = libxl__calloc(gc, 11, sizeof(char *));
@@ -1512,7 +1512,7 @@ static void domcreate_stream_done(libxl__egc *egc,
         vments[i++] = "image/kernel";
         vments[i++] = (char *) state->pv_kernel.path;
         vments[i++] = "start_time";
-        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
+        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
         if (state->pv_ramdisk.path) {
             vments[i++] = "image/ramdisk";
             vments[i++] = (char *) state->pv_ramdisk.path;
-- 
2.29.2


