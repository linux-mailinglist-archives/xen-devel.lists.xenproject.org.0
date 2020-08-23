Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A424EC83
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:36:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPv-0005G8-3g; Sun, 23 Aug 2020 09:35:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPs-0004t9-SY
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:56 +0000
X-Inumbo-ID: 77f96788-d6a1-4109-83f3-c050a5399b78
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77f96788-d6a1-4109-83f3-c050a5399b78;
 Sun, 23 Aug 2020 09:35:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E094B707;
 Sun, 23 Aug 2020 09:35:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 24/38] tools/xcutils: use official headers in readnotes
Date: Sun, 23 Aug 2020 11:35:05 +0200
Message-Id: <20200823093519.18386-25-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

readnotes.c is including xg_private.h. Now that the xenctrl headers
are structured better this is no longer needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xcutils/Makefile    | 3 +--
 tools/xcutils/readnotes.c | 5 +++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xcutils/Makefile b/tools/xcutils/Makefile
index 2811893980..82d42624c8 100644
--- a/tools/xcutils/Makefile
+++ b/tools/xcutils/Makefile
@@ -15,8 +15,7 @@ PROGRAMS = readnotes lsevtchn
 
 CFLAGS += -Werror
 
-# incorrectly uses libxc internals
-CFLAGS_readnotes.o  := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest) -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
+CFLAGS_readnotes.o  := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
 CFLAGS_lsevtchn.o   := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl)
 
 .PHONY: all
diff --git a/tools/xcutils/readnotes.c b/tools/xcutils/readnotes.c
index a6b7358e70..ff684c7dcb 100644
--- a/tools/xcutils/readnotes.c
+++ b/tools/xcutils/readnotes.c
@@ -11,8 +11,9 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 
-#include <xg_private.h>
-#include <xenctrl_dom.h> /* gunzip bits */
+#include <xen/xen.h>
+#include <xenctrl.h>
+#include <xenguest.h>
 
 #include <xen/libelf/libelf.h>
 
-- 
2.26.2


