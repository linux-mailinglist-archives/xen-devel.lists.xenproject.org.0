Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32F220800
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvdIN-0008Di-LG; Wed, 15 Jul 2020 09:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U57p=A2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jvdIM-0008Dd-T7
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:01:42 +0000
X-Inumbo-ID: cccba14e-c679-11ea-93a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cccba14e-c679-11ea-93a3-12813bfff9fa;
 Wed, 15 Jul 2020 09:01:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F3B0AF59;
 Wed, 15 Jul 2020 09:01:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] qemu-trad: remove Xen path dependencies
Date: Wed, 15 Jul 2020 11:01:40 +0200
Message-Id: <20200715090140.7590-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xen-hhoks.mak contains hard wired paths for the used libraries of
qemu-trad. Replace those by the make variables from Xen's Rules.mk,
which is already included.

This in turn removes the need to add the runtime link paths of the
libraries the directly used libraries depend on.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen-hooks.mak | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/xen-hooks.mak b/xen-hooks.mak
index a68eba3c..2689db0f 100644
--- a/xen-hooks.mak
+++ b/xen-hooks.mak
@@ -1,10 +1,8 @@
-CPPFLAGS+= -I$(XEN_ROOT)/tools/libs/toollog/include
-CPPFLAGS+= -I$(XEN_ROOT)/tools/libs/evtchn/include
-CPPFLAGS+= -I$(XEN_ROOT)/tools/libs/gnttab/include
+XEN_LIBS = evtchn gnttab ctrl guest store
+
 CPPFLAGS+= -DXC_WANT_COMPAT_MAP_FOREIGN_API
 CPPFLAGS+= -DXC_WANT_COMPAT_DEVICEMODEL_API
-CPPFLAGS+= -I$(XEN_ROOT)/tools/libxc/include
-CPPFLAGS+= -I$(XEN_ROOT)/tools/xenstore/include
+CPPFLAGS += $(foreach lib,$(XEN_LIBS),$(CFLAGS_libxen$(lib)))
 CPPFLAGS+= -I$(XEN_ROOT)/tools/include
 
 SSE2 := $(call cc-option,-msse2,)
@@ -22,15 +20,7 @@ endif
 
 CFLAGS += $(CMDLINE_CFLAGS)
 
-LIBS += -L$(XEN_ROOT)/tools/libs/evtchn -lxenevtchn
-LIBS += -L$(XEN_ROOT)/tools/libs/gnttab -lxengnttab
-LIBS += -L$(XEN_ROOT)/tools/libxc -lxenctrl -lxenguest
-LIBS += -L$(XEN_ROOT)/tools/xenstore -lxenstore
-LIBS += -Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog
-LIBS += -Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore
-LIBS += -Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call
-LIBS += -Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory
-LIBS += -Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel
+LIBS += $(foreach lib,$(XEN_LIBS),$(LDLIBS_libxen$(lib)))
 
 LDFLAGS := $(CFLAGS) $(LDFLAGS)
 
-- 
2.26.2


