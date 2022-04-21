Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B766550ACC9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 02:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310562.527469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh9B-0002cx-0q; Fri, 22 Apr 2022 00:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310562.527469; Fri, 22 Apr 2022 00:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh9A-0002b0-UD; Fri, 22 Apr 2022 00:27:40 +0000
Received: by outflank-mailman (input) for mailman id 310562;
 Fri, 22 Apr 2022 00:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nhh98-0002ap-WA
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 00:27:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ba711d-c1d3-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 02:27:37 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23M0RO6s006798
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Apr 2022 20:27:30 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23M0ROmH006797;
 Thu, 21 Apr 2022 17:27:24 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 02ba711d-c1d3-11ec-8fc2-03012f2f19d4
Message-Id: <92e5016290be569916c82c255e911d469b1de2db.1650551486.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650551486.git.ehem+xen@m5p.com>
References: <cover.1650551486.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Date: Wed, 20 Apr 2022 19:23:50 -0700
Subject: [PATCH 1/1] tools/python: move lowlevel packages one level up
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=1.2 required=10.0 tests=DATE_IN_PAST_12_24,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Prior to this a Python script first needed to import 3 levels of
packages, then invoke xen.lowlevel.$tool.$tool() to get a handle.  Now
only 2 levels of packages, then xen.lowlevel.$tool() gets a handle.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/pygrub/src/pygrub                 |  4 ++--
 tools/python/setup.py                   | 12 ++++++------
 tools/python/xen/lowlevel/{xc => }/xc.c |  0
 tools/python/xen/lowlevel/{xs => }/xs.c |  0
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename tools/python/xen/lowlevel/{xc => }/xc.c (100%)
 rename tools/python/xen/lowlevel/{xs => }/xs.c (100%)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index ce7ab0eb8c..6b1989c7d8 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -18,7 +18,7 @@ import os, sys, string, struct, tempfile, re, traceback, stat, errno
 import copy
 import logging
 import platform
-import xen.lowlevel.xc
+import xen.lowlevel
 
 import curses, _curses, curses.textpad, curses.ascii
 import getopt
@@ -669,7 +669,7 @@ def run_grub(file, entry, fs, cfg_args):
     return grubcfg
 
 def supports64bitPVguest():
-    xc = xen.lowlevel.xc.xc()
+    xc = xen.lowlevel.xc()
     caps = xc.xeninfo()['xen_caps'].split(" ")
     for cap in caps:
         if cap == "xen-3.0-x86_64":
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8c95db7769..77546335b8 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -17,28 +17,28 @@ PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
 PATH_LIBXENGUEST = XEN_ROOT + "/tools/libs/guest"
 PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
 
-xc = Extension("xc",
+xc = Extension("xen.lowlevel.xc",
                extra_compile_args = extra_compile_args,
                include_dirs       = [ PATH_XEN,
                                       PATH_LIBXENTOOLLOG + "/include",
                                       PATH_LIBXENEVTCHN + "/include",
                                       PATH_LIBXENCTRL + "/include",
                                       PATH_LIBXENGUEST + "/include",
-                                      "xen/lowlevel/xc" ],
+                                      "xen/lowlevel" ],
                library_dirs       = [ PATH_LIBXENCTRL, PATH_LIBXENGUEST ],
                libraries          = [ "xenctrl", "xenguest" ],
                depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so", PATH_LIBXENGUEST + "/libxenguest.so" ],
                extra_link_args    = SHLIB_libxenctrl + SHLIB_libxenguest,
-               sources            = [ "xen/lowlevel/xc/xc.c" ])
+               sources            = [ "xen/lowlevel/xc.c" ])
 
-xs = Extension("xs",
+xs = Extension("xen.lowlevel.xs",
                extra_compile_args = extra_compile_args,
-               include_dirs       = [ PATH_XEN, PATH_XENSTORE + "/include", "xen/lowlevel/xs" ],
+               include_dirs       = [ PATH_XEN, PATH_XENSTORE + "/include", "xen/lowlevel" ],
                library_dirs       = [ PATH_XENSTORE ],
                libraries          = [ "xenstore" ],
                depends            = [ PATH_XENSTORE + "/libxenstore.so" ],
                extra_link_args    = SHLIB_libxenstore,
-               sources            = [ "xen/lowlevel/xs/xs.c" ])
+               sources            = [ "xen/lowlevel/xs.c" ])
 
 plat = os.uname()[0]
 modules = [ xc, xs ]
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc.c
similarity index 100%
rename from tools/python/xen/lowlevel/xc/xc.c
rename to tools/python/xen/lowlevel/xc.c
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs.c
similarity index 100%
rename from tools/python/xen/lowlevel/xs/xs.c
rename to tools/python/xen/lowlevel/xs.c
-- 
2.30.2


