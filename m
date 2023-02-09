Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF26690E1E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 17:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492763.762460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Zk-0008SZ-04; Thu, 09 Feb 2023 16:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492763.762460; Thu, 09 Feb 2023 16:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Zj-0008Pw-Sb; Thu, 09 Feb 2023 16:15:07 +0000
Received: by outflank-mailman (input) for mailman id 492763;
 Thu, 09 Feb 2023 16:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQ9Zi-0008Pp-7B
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:15:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e83e4e91-a894-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 17:15:04 +0100 (CET)
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
X-Inumbo-ID: e83e4e91-a894-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675959304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=chmXOk/3WgEjn30+l9uOCrphnQ3lpcNyWSCe347vpgY=;
  b=bPKyUjqLAByeBglge4c2UUXm4B98z/yoMSujlP4JV3Ixqbw0riXhCDn/
   83nEB3P7+zLtAMXiebF3QRqvcu99WtFE8nb4wqbJFOY9lFaz01JkN7LSq
   3AV9El6NQOEJP1vQkC+N+MDC4PK29bACcc2bOum44eos3cbglL7Oh6GNv
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96389816
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BPQREazlZfT1bA86tBd6t+ckxirEfRIJ4+MujC+fZmUNrF6WrkUGx
 zBODT/SPK7YZWPzft8nbNu+80hXv8PVydAySAZlpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPaET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVFh2
 /kRJxYdUhKolsWp/u6FFNsxhu12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQLxRbJ9
 juYl4j/Ki4QGeDOzRqeznyhmdbWryHLfZhCNoTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCooLW7ByeHXMsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAlAkEHbCAiXTcHyMjEv79vsEz9E9ZKRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcsJF/epH8/NBTBt4wIrKTKufpvU
 Xt8WZ/zZUv29Iw9lGbmLwvj+eBDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI8QjtxWqaOm+96E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:FrbU366/rQH7F9CqWAPXwAjXdLJyesId70hD6qkRc203TiX8ra
 uTdZsgpH3JYVoqNk3IuOrwXZVoIkmxyXcW2+Ys1N6ZNWGKhILrFvAE0WMmqAeQfxEWndQ86U
 4PSclDIeHRSX5nkM39/A60KNo4xsKbmZrY/9s2tE0dND2DcMtbnn9E4+ugYzZLbTgDObp8MJ
 aH/MJIq36caW0aB/7LYEXs1IX4zeH2qA==
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96389816"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH v2] libs/util: Fix parallel build between flex/bison and CC rules
Date: Thu, 9 Feb 2023 16:14:48 +0000
Message-ID: <20230209161448.38896-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230209121156.11040-1-anthony.perard@citrix.com>
References: <20230209121156.11040-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

flex/bison generate two targets, and when those targets are
prerequisite of other rules they are considered independently by make.

We can have a situation where the .c file is out-of-date but not the
.h, git checkout for example. In this case, if a rule only have the .h
file as prerequiste, make will procced and start to build the object.
In parallel, another target can have the .c file as prerequisite and
make will find out it need re-generating and do so, changing the .h at
the same time. This parallel task breaks the first one.

To avoid this scenario, we put both the header and the source as
prerequisite for all object even if they only need the header.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

v2:
- fix patch context

We could add those new prerequisite as order-only, but since the
header is going to be re-generated anyway, the object will be too.

I tried to simply have something like
"libxlu_cfg_l.h: libxlu_cfg_l.c", but make find it to be a circular
dependency.

I tried to use grouped target ( &: ) with a recent version of make
(4.3), but that didn't work. And we couldn't use it as it's a new
feature.

As reference, this is the minimum dependencies, as not all object
needs all generated headers, but keeping that in sync with source
change could be problematique:

libxlu_cfg_l.o libxlu_cfg_l.opic: libxlu_cfg_y.h
libxlu_cfg_y.o libxlu_cfg_y.opic: libxlu_cfg_l.h

libxlu_cfg.o libxlu_cfg.opic: libxlu_cfg_y.h libxlu_cfg_l.h
libxlu_disk.o libxlu_disk.opic: libxlu_cfg_y.h libxlu_disk_l.h
libxlu_vif.o:
libxlu_pci.o:

    And the .c files prerequisite
libxlu_cfg_l.o libxlu_cfg_l.opic: libxlu_cfg_y.c
libxlu_cfg_y.o libxlu_cfg_y.opic: libxlu_cfg_l.c
libxlu_cfg.o libxlu_cfg.opic: libxlu_cfg_y.c libxlu_cfg_l.c
libxlu_disk.o libxlu_disk.opic: libxlu_cfg_y.c libxlu_disk_l.c
---
 tools/libs/util/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index e016baf888..c3b21875dc 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -40,6 +40,14 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 
 $(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 
+# Adding the .c conterparts of the headers generated by flex/bison as
+# prerequisite of all objects.
+# This is to tell make that if only the .c file is out-of-date but not the
+# header, it should still wait for the .c file to be rebuilt.
+# Otherwise, make doesn't considered "%.c %.h" as grouped targets, and will run
+# the flex/bison rules in parallel of CC rules which only need the header.
+$(OBJS-y) $(PIC_OBJS): libxlu_cfg_l.c libxlu_cfg_y.c libxlu_disk_l.c
+
 %.c %.h:: %.y
 	@rm -f $*.[ch]
 	$(BISON) --output=$*.c $<
-- 
Anthony PERARD


