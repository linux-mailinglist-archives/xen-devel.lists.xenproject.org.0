Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B8431A219
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84346.158162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAak9-0002uK-VX; Fri, 12 Feb 2021 15:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84346.158162; Fri, 12 Feb 2021 15:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAak9-0002tv-S9; Fri, 12 Feb 2021 15:52:29 +0000
Received: by outflank-mailman (input) for mailman id 84346;
 Fri, 12 Feb 2021 15:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAak8-0002tq-68
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:52:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1085d0ec-aa4b-47ae-a060-fd302c24a649;
 Fri, 12 Feb 2021 15:52:27 +0000 (UTC)
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
X-Inumbo-ID: 1085d0ec-aa4b-47ae-a060-fd302c24a649
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613145147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=71PBv1yaSXwV1DXb00ABA1ndEflYaw9hZ+l02M+OUzY=;
  b=EdoI7/2zxyHXmZis2df1wf5fE+VvTRHJc24JzUjSvqhSPaEJT+0pQGOs
   2ZelLzjNXflGCeJmgIXwSICBNxYorpt3gIh9FYfnWIJbdJDCrf5HjE8gY
   +JlSfAjinO1SjEStSgoOQye6YuQ942B0+0S5NsD3nrvB167+LIDC7exqQ
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1XPwlT/SsWH1wkhbtbN8GhOIc5iKNlVmziz9mOZJaCQVt0oHdU0oxUA29altqRi5xQ5SaMJjUZ
 wwH3XXgJ/Qv+Z3q12XBW6gWNtIEHgc25AfQAVj6yn0MfxwXGckMgN+HHnWsRCjv3GxAxpirRAd
 nu6IqyFkDugU2+Y4P5nr8FeQG7KcYV5HinC5pxQt40zFcYLDRMDUUXYe9Ya/A16YikQPF2Fgca
 cTYCS/joN3bTiBxs904fuGrSV1vMTBc+Jc3T3H66BgX8GPTJgpig+rLzNZd8U7BRajGInPvxLB
 x4Y=
X-SBRS: 5.2
X-MesageID: 37145664
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37145664"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available
Date: Fri, 12 Feb 2021 15:39:53 +0000
Message-ID: <20210212153953.4582-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index ac68996ab2..2a4ce8a90c 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -49,6 +49,8 @@ PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 LIBHEADER ?= $(LIB_FILE_NAME).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
 
+PKG_ABI := lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)-$(XEN_COMPILE_ARCH)-abi.dump
+
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
@@ -94,6 +96,13 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
 	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
 
+# If abi-dumper is available, write out the ABI analysis
+ifneq ($(ABI_DUMPER),)
+libs: $(PKG_ABI)
+$(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
+	abi-dumper $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
+endif
+
 .PHONY: install
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-- 
2.11.0


