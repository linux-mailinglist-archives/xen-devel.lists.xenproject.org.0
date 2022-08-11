Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DB590541
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384876.620392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWs-0003wQ-G8; Thu, 11 Aug 2022 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384876.620392; Thu, 11 Aug 2022 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBWs-0003uX-CT; Thu, 11 Aug 2022 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 384876;
 Thu, 11 Aug 2022 16:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNQ-0003s9-NL
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98768f32-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:43 +0200 (CEST)
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
X-Inumbo-ID: 98768f32-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/gk/zrc7mUau8n7u3084orMZkSKyjao6ioLVB6VKyZU=;
  b=cpPFQ3kzJJGr6vJFYit8uvf6uSzQuR24sSBUT/i9pzGYKr6HQQZ51o09
   NQsLMDLZsY2wPs57krO1/Ty6nuXlQKxJIB3+qflOhcM1SJmOMVcOtbYpg
   71gNux4cMRirMR0Gyj6dmyn7oTvz+xEQ4evUlB5nnXkgMetj/w7CHFX2B
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893963
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v94EQaLZjYN0cux2FE+RvZUlxSXFcZb7ZxGr2PjKsXjdYENS0DIAn
 zYcWm/TbqveZzOmeth2YNm+9BgG75OAnN5lGQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEmMpTEnkXPpEh5vsoLWNkz
 v80MncdR0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMk1wgi+mza7I5fPTVe+d/vEeni
 lnGoVnYCwlALdzG9DeapyfEaujnwnqgBdN6+KeD3vxlmlqI3UQIFQYbE1C8pJGRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxQ0j4CLcVOe6o6IsGyeOwIuLkMYIj8tGF5tD8bYnG0jsv7eZo89Tvbt34KsQG+YL
 yOi93Zn2ehK5SIf/+DipA2c3WrxznTcZlRtjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBuaL9UdF1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG3O
 BeM4VoAtMIJZhNGiJObhKrvY/nGMIC6TYi1PhwqRoMmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 aqmnTKXJS9DUcxPkWvpL9rxJJdxmUjSM0uPGs2gp/lmuJLCDEOopUAtbALSMrxkt/PY+W04M
 b93bqO39vmWa8WmCgG/zGLZBQliwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:2xFxG6yhHFVOhYBlZyFCKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893963"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v4 25/32] libs: Avoid exposing -Wl,--version-script to other built library
Date: Thu, 11 Aug 2022 17:48:38 +0100
Message-ID: <20220811164845.38083-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(SHLIB_LDFLAGS) is used by more targets that the single targets that
except it (libxenfoo.so.X.Y). There is also some dynamic libraries in
stats/ that uses $(SHLIB_LDFLAGS) (even if those are never built), and
there's libxenlight_test.so which doesn't needs a version script.

Also, libxenlight_test.so might failed to build if the version script
doesn't exist yet.

For these reasons, avoid changing the generic $(SHLIB_LDFLAGS) flags,
and add the flag directly on the command line.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/libs.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index e47fb30ed4..3eb91fc8f3 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -12,8 +12,6 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 endif
 MINOR ?= 0
 
-SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
-
 CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
@@ -85,7 +83,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=libxen$(LIBNAME).map $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
-- 
Anthony PERARD


