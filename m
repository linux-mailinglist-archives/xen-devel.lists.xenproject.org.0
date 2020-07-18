Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A7224850
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 05:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwdZX-0002Cy-K1; Sat, 18 Jul 2020 03:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7JXE=A5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1jwdZW-0002Ct-54
 for xen-devel@lists.xen.org; Sat, 18 Jul 2020 03:31:34 +0000
X-Inumbo-ID: 2cda321a-c8a7-11ea-b7bb-bc764e2007e4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cda321a-c8a7-11ea-b7bb-bc764e2007e4;
 Sat, 18 Jul 2020 03:31:33 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 06I3VLlr088879
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 17 Jul 2020 23:31:27 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 06I3VLqL088878;
 Fri, 17 Jul 2020 20:31:21 -0700 (PDT) (envelope-from ehem)
Date: Fri, 17 Jul 2020 20:31:21 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xen.org
Subject: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Message-ID: <20200718033121.GA88869@mattapan.m5p.com>
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

This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7
actually remains due to passage of time.

Of the 3, both Python and pygrub appear to mostly be building just fine
cross-compiling.  The OCAML portion is being troublesome, this is going
to cause bug reports elsewhere soon.  The OCAML portion though can
already be disabled by setting OCAML_TOOLS=n and shouldn't have this
extra form of disabling.
---
 tools/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 7b1f6c4d28..930a533724 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -40,12 +40,9 @@ SUBDIRS-$(CONFIG_X86) += debugger/gdbsx
 SUBDIRS-$(CONFIG_X86) += debugger/kdd
 SUBDIRS-$(CONFIG_TESTS) += tests
 
-# These don't cross-compile
-ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))
 SUBDIRS-y += python
 SUBDIRS-y += pygrub
 SUBDIRS-$(OCAML_TOOLS) += ocaml
-endif
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := libs libxc xenstore
-- 
2.20.1



-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



