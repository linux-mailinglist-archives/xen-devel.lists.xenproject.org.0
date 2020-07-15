Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F25221240
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkE4-0002Zn-81; Wed, 15 Jul 2020 16:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkE2-0002Yi-A6
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:25:42 +0000
X-Inumbo-ID: d00b3dae-c6b7-11ea-bca7-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d00b3dae-c6b7-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDv-0001sU-Je; Wed, 15 Jul 2020 17:25:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 01/12] stubdom: add stubdom/mini-os.mk for Xen paths used by
 Mini-OS
Date: Wed, 15 Jul 2020 17:25:00 +0100
Message-Id: <20200715162511.5941-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
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
Reply-To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, ian.jackson@eu.citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

stubdom/mini-os.mk should contain paths used by Mini-OS when built as
stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
2.20.1


