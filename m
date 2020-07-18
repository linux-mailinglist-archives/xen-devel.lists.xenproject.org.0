Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13174224877
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 06:19:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jweIK-0005k5-5M; Sat, 18 Jul 2020 04:17:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7JXE=A5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1jweIJ-0005k0-1K
 for xen-devel@lists.xen.org; Sat, 18 Jul 2020 04:17:51 +0000
X-Inumbo-ID: a34d57aa-c8ad-11ea-96f0-12813bfff9fa
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a34d57aa-c8ad-11ea-96f0-12813bfff9fa;
 Sat, 18 Jul 2020 04:17:48 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 06I3WgY1088890
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 17 Jul 2020 23:32:48 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 06I3Wgfh088889;
 Fri, 17 Jul 2020 20:32:42 -0700 (PDT) (envelope-from ehem)
Date: Fri, 17 Jul 2020 20:32:42 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xen.org
Subject: [PATCH 2/2] tools/ocaml: Default to useful build output
Message-ID: <20200718033242.GB88869@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
 autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, christian.lindig@citrix.com, wl@xen.org,
 dave@recoil.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While hiding details of build output looks pretty to some, defaulting to
doing so deviates from the rest of Xen.  Switch the OCAML tools to match
everything else.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---

Time for a bit of controversy.

Presently the OCAML tools build mismatches the rest of the Xen build.
My choice is to default to verbose output.  While some may like beauty
in their build output, function is far more important.

If someone wants to take on the task of making Xen's build output
consistently beatiful, invite them to do so.  Then call the police and
tell them you're being robbed.
---
 tools/ocaml/Makefile.rules | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index a893c42b43..abfbc64ce0 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -1,17 +1,20 @@
 ifdef V
-  ifeq ("$(origin V)", "command line")
-    BUILD_VERBOSE = $(V)
-  endif
+	ifeq ("$(origin V)", "command line")
+		BUILD_VERBOSE = $(V)
+	endif
+else
+	V := 1
+	BUILD_VERBOSE := 1
 endif
 ifndef BUILD_VERBOSE
-  BUILD_VERBOSE = 0
+	BUILD_VERBOSE := 0
 endif
 ifeq ($(BUILD_VERBOSE),1)
-  E = @true
-  Q =
+	E := @true
+	Q :=
 else
-  E = @echo
-  Q = @
+	E := @echo
+	Q := @
 endif
 
 .NOTPARALLEL:
-- 
2.20.1



-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



