Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A81EBC37
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:59:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6VX-0002dO-1F; Tue, 02 Jun 2020 12:59:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jg6VV-0002d6-J1
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:59:05 +0000
X-Inumbo-ID: d6265100-a4d0-11ea-abee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6265100-a4d0-11ea-abee-12813bfff9fa;
 Tue, 02 Jun 2020 12:59:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A592AAF69;
 Tue,  2 Jun 2020 12:59:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 v2 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
Date: Tue,  2 Jun 2020 14:58:59 +0200
Message-Id: <20200602125900.4424-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602125900.4424-1-jgross@suse.com>
References: <20200602125900.4424-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 58263ed7713e ("xen: add /buildinfo/config entry to hypervisor
filesystem") added a dependency to .config, but the hypervisor's build
config could be have another name via setting KCONFIG_CONFIG.

Fix that by using $(KCONFIG_CONFIG) instead. Additionally reference
the config file via $(XEN_ROOT) instead of a relative path.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- accept an absolute path in KCONFIG_CONFIG (Jan Beulich)
---
 xen/common/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 91581e1815..fc2c8eb4a3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -75,7 +75,8 @@ obj-$(CONFIG_UBSAN) += ubsan/
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
-config.gz: ../.config
+CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/$(KCONFIG_CONFIG),$(KCONFIG_CONFIG))
+config.gz: $(CONF_FILE)
 	gzip -c $< >$@
 
 config_data.o: config.gz
-- 
2.26.2


