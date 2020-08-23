Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0524EC77
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:35:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPN-0004t3-Nk; Sun, 23 Aug 2020 09:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPM-0004sy-GF
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:24 +0000
X-Inumbo-ID: c3a2dcc9-c64c-4949-bdd4-4dcf18c40360
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3a2dcc9-c64c-4949-bdd4-4dcf18c40360;
 Sun, 23 Aug 2020 09:35:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29BBCAC7F;
 Sun, 23 Aug 2020 09:35:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 01/38] stubdom: add stubdom/mini-os.mk for Xen paths used
 by Mini-OS
Date: Sun, 23 Aug 2020 11:34:42 +0200
Message-Id: <20200823093519.18386-2-jgross@suse.com>
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

stubdom/mini-os.mk should contain paths used by Mini-OS when built as
stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 stubdom/mini-os.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 stubdom/mini-os.mk

diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
new file mode 100644
index 0000000000..32528bb91f
--- /dev/null
+++ b/stubdom/mini-os.mk
@@ -0,0 +1,17 @@
+# Included by Mini-OS stubdom builds to set variables depending on Xen
+# internal paths.
+#
+# Input variables are:
+# XEN_ROOT
+# MINIOS_TARGET_ARCH
+
+XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/xenstore/include
+TOOLCORE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
+TOOLLOG_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
+EVTCHN_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
+GNTTAB_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
+CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
+FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
+DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
+CTRL_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
+GUEST_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
-- 
2.26.2


