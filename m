Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768424EC7E
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPh-00053X-F6; Sun, 23 Aug 2020 09:35:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPg-0004sy-FX
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:44 +0000
X-Inumbo-ID: 24254a33-80c3-4139-a7cd-8e08c719ab0a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24254a33-80c3-4139-a7cd-8e08c719ab0a;
 Sun, 23 Aug 2020 09:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60131AE02;
 Sun, 23 Aug 2020 09:35:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 09/38] tools: drop explicit path specifications for qemu
 build
Date: Sun, 23 Aug 2020 11:34:50 +0200
Message-Id: <20200823093519.18386-10-jgross@suse.com>
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

Since more than three years now qemu is capable to set the needed
include and library paths for the Xen libraries via pkg-config.

So drop the specification of those paths in tools/Makefile. This will
enable to move libxenctrl away from tools/libxc, as qemu's configure
script has special treatment of this path.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Makefile | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 198b239edc..7c9f9fc900 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -245,32 +245,8 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		-DXC_WANT_COMPAT_GNTTAB_API=1 \
 		-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
 		-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
-		-I$(XEN_ROOT)/tools/include \
-		-I$(XEN_ROOT)/tools/libs/toolcore/include \
-		-I$(XEN_ROOT)/tools/libs/toollog/include \
-		-I$(XEN_ROOT)/tools/libs/evtchn/include \
-		-I$(XEN_ROOT)/tools/libs/gnttab/include \
-		-I$(XEN_ROOT)/tools/libs/foreignmemory/include \
-		-I$(XEN_ROOT)/tools/libs/devicemodel/include \
-		-I$(XEN_ROOT)/tools/libxc/include \
-		-I$(XEN_ROOT)/tools/xenstore/include \
-		-I$(XEN_ROOT)/tools/xenstore/compat/include \
 		$(EXTRA_CFLAGS_QEMU_XEN)" \
-		--extra-ldflags="-L$(XEN_ROOT)/tools/libxc \
-		-L$(XEN_ROOT)/tools/xenstore \
-		-L$(XEN_ROOT)/tools/libs/toolcore \
-		-L$(XEN_ROOT)/tools/libs/evtchn \
-		-L$(XEN_ROOT)/tools/libs/gnttab \
-		-L$(XEN_ROOT)/tools/libs/foreignmemory \
-		-L$(XEN_ROOT)/tools/libs/devicemodel \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/evtchn \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/gnttab \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory \
-		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel \
-		$(QEMU_UPSTREAM_RPATH)" \
+		--extra-ldflags="$(QEMU_UPSTREAM_RPATH)" \
 		--bindir=$(LIBEXEC_BIN) \
 		--datadir=$(SHAREDIR)/qemu-xen \
 		--localstatedir=$(localstatedir) \
-- 
2.26.2


