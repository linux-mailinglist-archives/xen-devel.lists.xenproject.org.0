Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055862D9F20
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52403.91769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshg-0002zc-2i; Mon, 14 Dec 2020 18:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52403.91769; Mon, 14 Dec 2020 18:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshe-0002tE-6I; Mon, 14 Dec 2020 18:36:10 +0000
Received: by outflank-mailman (input) for mailman id 52403;
 Mon, 14 Dec 2020 16:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqrm-0006vN-Lw
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:38:30 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa988afb-11e3-4515-8642-5030b4b9fb4a;
 Mon, 14 Dec 2020 16:36:35 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaYF2021664;
 Mon, 14 Dec 2020 17:36:34 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaY2G005438;
 Mon, 14 Dec 2020 17:36:34 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 555F5AAC66; Mon, 14 Dec 2020 17:36:34 +0100 (MET)
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
X-Inumbo-ID: aa988afb-11e3-4515-8642-5030b4b9fb4a
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 24/24] Fix error: array subscript has type 'char' [-Werror=char-subscripts]
Date: Mon, 14 Dec 2020 17:36:23 +0100
Message-Id: <20201214163623.2127-25-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/libs/light/libxl_qmp.c | 2 +-
 tools/xentrace/xentrace.c    | 2 +-
 xen/tools/symbols.c          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index c394000ea9..9b638e6f54 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -1249,7 +1249,7 @@ static int qmp_error_class_to_libxl_error_code(libxl__gc *gc,
                 se++;
                 continue;
             }
-            if (tolower(*s) != tolower(*se))
+            if (tolower((unsigned char)*s) != tolower((unsigned char)*se))
                 break;
             s++, se++;
         }
diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index 4b50b8a53e..a8903ebf46 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -957,7 +957,7 @@ static int parse_cpumask_range(const char *mask_str, xc_cpumap_t map)
 {
     unsigned int a, b;
     int nmaskbits;
-    char c;
+    unsigned char c;
     int in_range;
     const char *s;
 
diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index 9f9e2c9900..0b12452616 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -173,11 +173,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
 	s->len = strlen(str) + 1;
-	if (islower(stype) && filename)
+	if (islower((unsigned char)stype) && filename)
 		s->len += strlen(filename) + 1;
 	s->sym = malloc(s->len + 1);
 	sym = SYMBOL_NAME(s);
-	if (islower(stype) && filename) {
+	if (islower((unsigned char)stype) && filename) {
 		sym = stpcpy(sym, filename);
 		*sym++ = '#';
 	}
-- 
2.28.0


