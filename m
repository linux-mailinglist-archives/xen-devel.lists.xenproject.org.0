Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7634559E08
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355618.583492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnw-0001Ow-Su; Fri, 24 Jun 2022 16:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355618.583492; Fri, 24 Jun 2022 16:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnw-0001Co-6y; Fri, 24 Jun 2022 16:05:08 +0000
Received: by outflank-mailman (input) for mailman id 355618;
 Fri, 24 Jun 2022 16:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lns-0004qc-Vh
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672b381d-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:03 +0200 (CEST)
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
X-Inumbo-ID: 672b381d-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TsefgdfY0tcRhsq+woEvspQFjwDZdlkGaeHqzm9V7cQ=;
  b=FQAm0jRg7yFdGPSEc6W9jwfvmdria3uINiXArUiY8IebA7wfjFCc+s8q
   qB7FWL548LsWMvf9gghLe3/h0gfT3n+K9sHVdF7ZQMMy0aRdpgG4PtUBA
   r1DFaDX4/vn+fVDsiBmY6ce/6fL1ZDVJUxLFnYBnNQLXxEcoFf0qRsrwp
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73702048
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PEA8rKkhkzc3Bt2TbsKbwRro5gzZJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYW2mAa/iLajDwe9lxO9y/9EICsZKAy9FqQFZo+ys8EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZAhxBOqcudgkAzpDKRxBF/FF/ebYGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMmU3NkycM3WjPH8pFYJmnOi6lkDaWCRGulusuJAVs0zqmVkZPL/Fb4OOJ43iqd9utkSXv
 GXd5EziHwoXcteYzFKt7XaEluLJ2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUX51m3jfr13z/JJXM+cwFrNN8j7dAPEGlCO
 kCyoz/5OdB+mOTLFCzFrerM8mPa1Ts9djFbO3JdJecRy5y6+dxo0EqSJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+aTNT8D2BQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/0ua7dYWSD3QY3QPHNEghBHVb5Jei8BxkuTHqFz+5eIWO5C
 KMtkVk5CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps3pgi51SsEpLmevpXg2DWbJhjyFuBV8wMkXZ
 MbAGe7xXClyNEiS5GfvLwvr+eRwnX5WKKK6bc2T8ilLJpLENSDMF+taYQDQBg37hYvdyDjoH
 x9kH5Pi431ivCfWOUE7LaZ7wYg2EEUG
IronPort-HdrOrdr: A9a23:UmlaBajZ+Y2OCDQogC9iuRL1MXBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="73702048"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 16/25] libs/libs.mk: Remove the need for $(PKG_CONFIG_INST)
Date: Fri, 24 Jun 2022 17:04:13 +0100
Message-ID: <20220624160422.53457-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can simply use $(PKG_CONFIG) to set the parameters, and add it to
$(TARGETS) as necessary.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index e02f91f95e..7aee449370 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -37,10 +37,10 @@ PKG_CONFIG_LIB := $(LIB_FILE_NAME)
 PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
-PKG_CONFIG_INST := $(PKG_CONFIG)
-$(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
-$(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
-$(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
+TARGETS += $(PKG_CONFIG)
+$(PKG_CONFIG): PKG_CONFIG_PREFIX = $(prefix)
+$(PKG_CONFIG): PKG_CONFIG_INCDIR = $(includedir)
+$(PKG_CONFIG): PKG_CONFIG_LIBDIR = $(libdir)
 endif
 
 PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
@@ -55,7 +55,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: headers.chk $(TARGETS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 headers.chk:
@@ -127,7 +127,6 @@ clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
-	rm -f $(PKG_CONFIG)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


