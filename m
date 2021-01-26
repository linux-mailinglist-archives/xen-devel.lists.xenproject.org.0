Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E770E304C8B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75593.136101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8D-0001Mc-3y; Tue, 26 Jan 2021 22:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75593.136101; Tue, 26 Jan 2021 22:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8D-0001MD-0X; Tue, 26 Jan 2021 22:48:17 +0000
Received: by outflank-mailman (input) for mailman id 75593;
 Tue, 26 Jan 2021 22:48:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X8B-0001M8-KS
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:48:15 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5226b15-163f-4324-b8dc-7662a9593298;
 Tue, 26 Jan 2021 22:48:14 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMm44f000532;
 Tue, 26 Jan 2021 23:48:04 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMm4oc007224;
 Tue, 26 Jan 2021 23:48:04 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 271B1AA8C1; Tue, 26 Jan 2021 23:48:01 +0100 (MET)
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
X-Inumbo-ID: d5226b15-163f-4324-b8dc-7662a9593298
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] Fix error: array subscript has type 'char'
Date: Tue, 26 Jan 2021 23:47:47 +0100
Message-Id: <20210126224800.1246-1-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:04 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Use unsigned char variable, or cast to (unsigned char), for
tolower()/islower() and friends. Fix compiler error
array subscript has type 'char' [-Werror=char-subscripts]

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
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
2.29.2


