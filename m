Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C400B245107
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 15:04:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6vqp-0006Rk-IU; Sat, 15 Aug 2020 13:03:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6vqo-0006R1-5v
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 13:03:58 +0000
X-Inumbo-ID: 8562101a-e743-4fee-9ff3-d70cccce0bf7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8562101a-e743-4fee-9ff3-d70cccce0bf7;
 Sat, 15 Aug 2020 13:03:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1E0FB1ED;
 Sat, 15 Aug 2020 13:04:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH I v2 1/6] stubdom: add stubdom/mini-os.mk for Xen paths used
 by Mini-OS
Date: Sat, 15 Aug 2020 15:03:36 +0200
Message-Id: <20200815130341.27147-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815130341.27147-1-jgross@suse.com>
References: <20200815130341.27147-1-jgross@suse.com>
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


