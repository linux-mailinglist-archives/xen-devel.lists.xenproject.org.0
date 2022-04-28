Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C76512F0E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316307.535189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njztD-0004R6-W9; Thu, 28 Apr 2022 08:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316307.535189; Thu, 28 Apr 2022 08:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njztD-0004OP-T5; Thu, 28 Apr 2022 08:52:43 +0000
Received: by outflank-mailman (input) for mailman id 316307;
 Thu, 28 Apr 2022 08:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8clo=VG=citrix.com=prvs=110d23c25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njztC-0004OE-CE
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:52:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e6673b8-c6d0-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:52:40 +0200 (CEST)
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
X-Inumbo-ID: 8e6673b8-c6d0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651135960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nlPhO5icSZyJwWgX0nfuCh5jsNzQNmMCZFNmur7hhFk=;
  b=Ibz0tmbqo89k9cUqFI0XElW158FChZPYMLnFccXWBHi4VGdwAyZQY+Xf
   mIiTsFAVIxBCT9EJi5xNSnD1ZytOAzjTqKGqz84ri2gC4FySEyThOgRof
   dvIeK+ZKZGDywHAjoAa+feLb3Sm/cEBbfWZkCV2Wsj+Wn2va1JSOfpS4/
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70117525
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8uvxQK6T5EyVYIyuZe1CvQxRtETHchMFZxGqfqrLsTDasY5as4F+v
 jccWT+FPvqMNDShKN9xaY+xpE8EuJPXm9BmSwE++ClgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSOWwwvI5fN2940UiV1QhB/IpVL5ebudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5VBMGMwMU6dC/FJElEFObUMsfn4vSLyQRNWslDN/7YPyHeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS1hOGzLfu4kWjL2k4Y29wacMeudJvbGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWuoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvWgnfB0wa51eIGKBj
 KrvVeV5vc470JyCN/IfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ7rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DbOuP3GLodJCRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:r2nDD6DAJ7BUN2XlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70117525"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cet: Support cet=<bool> on the command line
Date: Thu, 28 Apr 2022 09:52:09 +0100
Message-ID: <20220428085209.15327-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... as a shorthand for setting both suboptions at once.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I think this wants backporting.  cet=0 is "so obviously" the way to turn off
both that I tried using it to debug a problem.  It's absence was an oversight
of the original CET logic.
---
 docs/misc/xen-command-line.pandoc |  4 +++-
 xen/arch/x86/setup.c              | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca0706..1720cb216824 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -271,7 +271,7 @@ enough. Setting this to a high value may cause boot failure, particularly if
 the NMI watchdog is also enabled.
 
 ### cet
-    = List of [ shstk=<bool>, ibt=<bool> ]
+    = List of [ <bool>, shstk=<bool>, ibt=<bool> ]
 
     Applicability: x86
 
@@ -283,6 +283,8 @@ CET is incompatible with 32bit PV guests.  If any CET sub-options are active,
 they will override the `pv=32` boolean to `false`.  Backwards compatibility
 can be maintained with the pv-shim mechanism.
 
+*   An unqualified boolean is shorthand for setting all suboptions at once.
+
 *   The `shstk=` boolean controls whether Xen uses Shadow Stacks for its own
     protection.
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 53a73010e029..090abfd71754 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -117,7 +117,20 @@ static int __init cf_check parse_cet(const char *s)
         if ( !ss )
             ss = strchr(s, '\0');
 
-        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
+        if ( (val = parse_bool(s, ss)) >= 0 )
+        {
+#ifdef CONFIG_XEN_SHSTK
+            opt_xen_shstk = val;
+#else
+            no_config_param("XEN_SHSTK", "cet", s, ss);
+#endif
+#ifdef CONFIG_XEN_IBT
+            opt_xen_ibt = val;
+#else
+            no_config_param("XEN_IBT", "cet", s, ss);
+#endif
+        }
+        else if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
         {
 #ifdef CONFIG_XEN_SHSTK
             opt_xen_shstk = val;
-- 
2.11.0


