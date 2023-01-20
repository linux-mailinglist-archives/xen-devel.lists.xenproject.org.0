Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB82675E49
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482102.747483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJr-000862-2J; Fri, 20 Jan 2023 19:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482102.747483; Fri, 20 Jan 2023 19:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJq-00083b-VM; Fri, 20 Jan 2023 19:44:58 +0000
Received: by outflank-mailman (input) for mailman id 482102;
 Fri, 20 Jan 2023 19:44:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxJp-0007So-81
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:44:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e99920fc-98fa-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 20:44:54 +0100 (CET)
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
X-Inumbo-ID: e99920fc-98fa-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fh1/fP1mhvs+CCh30pp4CnSP8cqF7mY8PIja6gPahWo=;
  b=AE+pFJRR2f5GPi3prwKn3GM5537qaFuLSUKfhY6IojnQf03qNZ9UONoH
   29iJZexjzXdrd3fTZ6O1J+iE644PgfDFtTOO3lPCu5McpmzrxsqqFW9pJ
   Z8KzEWBK3BNOiwKKXBUP1Y9d5zJOnJhU6xtxHUGDORZgWoZBh6Nuf7F+I
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93020461
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SxzEw6OQwPfn1tDvrR2gl8FynXyQoLVcMsEvi/4bfWQNrUonhGFWn
 2AbWmCPPfbcZmT3e9BzYdvg80JTvZ6HxoRrHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ux8AiZD+
 tlCETQiMzre29qr3pOeWsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3RHZ8NwhjBz
 o7A10DoIzsxJO2Y9X2q83aJp9eXlyb2Y41HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gDxh0YKNvVzfXDJdCGccNpp/7pReqSEWO
 kGhldjqQjFgleesTV3A3OrIlS6sGA0FBDpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlRtjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBuaL9XdF1M2xpjGGeE6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYyfwNv4qOtLtU5xCIU3c+TLNDKi8gj1mO8gZSeN61Hs2OR74M57FziDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7nlW+I8nfriil07P+ePHNBaopUItbAPmghYRsPnV/204M
 r93a6O39vmoeLSnMnmKqtRPcQtiwLpSLcmelvG7v9WremJOcFzNwdeKqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:OExSj6lFFYnKjizn/1RoicDHNVfpDfMBiWdD5ihNYBxZY6Wkfp
 +V7ZMmPE7P+VIssS8b6LW90fG7MAHhHZ4c2/hqAV7QZniShILIFvAg0WKG+Vbd8kLFh5BgPM
 tbAtBD4ZjLfCtHZKXBkUuF+rQbsai6GcmT7I+urQYKPHhXguNbnndE422gYzBLrXx9dOUE/e
 2nl7Z6TlSbCA8qh8KAZghnYwE8nbL2fWndDCLu+yRH1OB1t1mVAUHBfyRwIy1xbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH+TqhkFwnMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonyXwzTo07Hfm6FmAxV/uu9bwSj4WA9dIwahZbhzawUw9u8wU6t
 MP40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIo3ctZq3Moi1XIQNK1FMDPx6YghHu
 UrJtrb/uxqfVSTaG2clnVzwearQm84En69MxE/U42uomBrdUJCvhElLf8k7yo9HVUGOsV5Dt
 H/Q/9VfXd1P5ArhOxGdbk8qICMexjwqFr3QRWvyBLcZeY60jv22ujKyaRw6+ewdJMSypwu3J
 zHTVNDrGY3P1njEMuUwfRwg17wqUiGLHjQI/tlltdEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4MhmTFKtlvAGhbVNdQtscwWlqIrM6OIor2tvbDePKWILb2Cz4rVm72H3
 NGVjnuI8dL6FytRxbD8VnscmKofla68YN7EaDc8eRWwI8RNpdUugxQkli97tHjE0wOjkX3Rj
 o1HFrKqNLxmYDtxxeA04xAAGsUMnpo
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93020461"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v6 4/5] tools: Introduce macro $(xenlibs-cflags,) and introduce $(USELIBS) in subdirs
Date: Fri, 20 Jan 2023 19:44:30 +0000
Message-ID: <20230120194431.55922-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce $(xenlibs-cflags,) to get the CFLAGS needed to build with
the xen library listed as argument. This mainly give the ability to
use the same list of xen libs as we can use with the other macro
$(xenlibs-ldlibs,). Also, we can avoid listing $(CFLAGS_xeninclude)
more than once.

We will use $(USELIBS) to list the xen libraries been used by a
subdirectory or a binary. Since we usually want the CFLAGS, LDFLAGS
and LDLIBS of possibly several xen libs, we don't need to duplicate
the list for each flags. This change to use $(USELIBS) is only done in
console/ and helpers/ for now as those already use the
$(xenlibs-ldlibs,) macro

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - new patch

 tools/console/client/Makefile |  7 ++++---
 tools/console/daemon/Makefile | 10 ++++------
 tools/helpers/Makefile        | 26 +++++++++-----------------
 tools/Rules.mk                |  6 ++++++
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index 62d89fdeb9..071262c9ae 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -1,11 +1,12 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenstore)
+USELIBS := ctrl store
+
+CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(call xenlibs-ldlibs,ctrl store)
+LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 
 OBJS-y := main.o
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index 9fc3b6711f..e53c874eee 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -1,15 +1,13 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenstore)
-CFLAGS += $(CFLAGS_libxenevtchn)
-CFLAGS += $(CFLAGS_libxengnttab)
-CFLAGS += $(CFLAGS_libxenforeignmemory)
+USELIBS := ctrl store evtchn gnttab foreignmemory
+
+CFLAGS += $(call xenlibs-cflags,$(USELIBS))
 CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(call xenlibs-ldlibs,ctrl store evtchn gnttab foreignmemory)
+LDLIBS += $(call xenlibs-ldlibs,$(USELIBS))
 LDLIBS += $(SOCKET_LIBS)
 LDLIBS += $(UTIL_LIBS)
 LDLIBS += -lrt
diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 09590eb5b6..0d4df01365 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -15,29 +15,21 @@ TARGETS += init-dom0less
 endif
 endif
 
+XEN_INIT_DOM0_USELIBS := ctrl toollog store light
 XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
-$(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
-$(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenstore)
-$(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenlight)
-$(XEN_INIT_DOM0_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
-xen-init-dom0: LDLIBS += $(call xenlibs-ldlibs,ctrl toollog store light)
+$(XEN_INIT_DOM0_OBJS): CFLAGS += $(call xenlibs-cflags,$(XEN_INIT_DOM0_USELIBS))
+xen-init-dom0: LDLIBS += $(call xenlibs-ldlibs,$(XEN_INIT_DOM0_USELIBS))
 
+INIT_XENSTORE_DOMAIN_USELIBS := toollog store ctrl guest light
 INIT_XENSTORE_DOMAIN_OBJS = init-xenstore-domain.o init-dom-json.o
-$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
-$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenguest)
-$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
-$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
-$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
+$(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_XENSTORE_DOMAIN_USELIBS))
 $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
-init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,toollog store ctrl guest light)
+init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,$(INIT_XENSTORE_DOMAIN_USELIBS))
 
+INIT_DOM0LESS_USELIBS := ctrl evtchn toollog store light guest foreignmemory
 INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
-init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
+$(INIT_DOM0LESS_OBJS): CFLAGS += $(call xenlibs-cflags,$(INIT_DOM0LESS_USELIBS))
+init-dom0less: LDLIBS += $(call xenlibs-ldlibs,$(INIT_DOM0LESS_USELIBS))
 
 .PHONY: all
 all: $(TARGETS)
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6e135387bd..d7c1f61cdf 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -88,6 +88,12 @@ define xenlibs-dependencies
         $(USELIBS_$(lib)) $(call xenlibs-dependencies,$(USELIBS_$(lib)))))
 endef
 
+define xenlibs-cflags
+    $(CFLAGS_xeninclude) \
+    $(foreach lib,$(1), \
+	$(filter-out $(CFLAGS_xeninclude),$(CFLAGS_libxen$(lib))))
+endef
+
 # Flags for linking recursive dependencies of Xen libraries in $(1)
 define xenlibs-rpath
     $(addprefix -Wl$(comma)-rpath-link=$(XEN_ROOT)/tools/libs/,$(call xenlibs-dependencies,$(1)))
-- 
Anthony PERARD


