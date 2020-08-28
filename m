Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E507B255D60
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfyx-0004er-CN; Fri, 28 Aug 2020 15:07:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfyw-0004eG-4q
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:07:58 +0000
X-Inumbo-ID: 7170e77f-2fca-4db4-a01f-791eb462f593
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7170e77f-2fca-4db4-a01f-791eb462f593;
 Fri, 28 Aug 2020 15:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9080AF2A;
 Fri, 28 Aug 2020 15:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 04/31] tools: fix pkg-config file for libxenguest
Date: Fri, 28 Aug 2020 17:07:20 +0200
Message-Id: <20200828150747.25305-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

The pkg-config file for libxenguest is missing the private dependency
on libxenctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index 315ac0b4f3..763231065c 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -178,7 +178,7 @@ $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_NAME = Xenguest
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_LIB = xenguest
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn,xencontrol
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
-- 
2.26.2


