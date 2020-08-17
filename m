Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF42463B8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7blg-00046q-5a; Mon, 17 Aug 2020 09:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blf-00046j-17
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:27 +0000
X-Inumbo-ID: fcf56dec-4d10-4b5e-977a-bf1aebd524a4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcf56dec-4d10-4b5e-977a-bf1aebd524a4;
 Mon, 17 Aug 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5794CAD33;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 02/17] tools: drop explicit path specifications for qemu
 build
Date: Mon, 17 Aug 2020 11:49:07 +0200
Message-Id: <20200817094922.15768-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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


