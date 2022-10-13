Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04865FD9D7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422024.667851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu5-00037N-Ry; Thu, 13 Oct 2022 13:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422024.667851; Thu, 13 Oct 2022 13:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu5-00030Z-MX; Thu, 13 Oct 2022 13:05:37 +0000
Received: by outflank-mailman (input) for mailman id 422024;
 Thu, 13 Oct 2022 13:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu3-0001tl-Ba
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1cb305-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:12 +0200 (CEST)
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
X-Inumbo-ID: ac1cb305-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8abatJda7PXTHwPpPZRvwgJsTqH6k0O1FgQ7vtYYApo=;
  b=DHiU92MvGgVd4nu8bXooK/VdZlo511Arig3g7HFdTBMS+uEeet6ZwT22
   tx1O0DWsNWxqeqcrsbDHDQoixLZAqc7XfN4rSxqOi9Wv4U2052YqpdHPS
   jJR9x4kvX5XvONtrM9VnhE+mqvsPaVegbyFE1ZoBuzXNv2wCLuXDV6VHR
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81760196
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Np5mHqssR2UEbPmMGTgT3ARxm+fnVDxeMUV32f8akzHdYApBsoF/q
 tZmKW+Fa/uJYjP8ft4kbI7ioUoC65OBnINrTlQ9+3tkFiwa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklRr
 84laxRXZymRvPDt7KO5ethumNQKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUMwRjA/
 zOYl4j/Kk8ZM9zGlAqOy0uLn7Lum2TGB9sRPbLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCopc4+C7AWDJCFGQYLoV76olmHlTGy
 2Nlgfv2Xw5S85nPQEuPzaXPgSKwCRkXM38rMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclRuzBCxWtame0bbtT834JplyQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdzsVZxylfC+So2/PhwxUjapSsEoHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqKHfjGI+GPi+X2iIi9FehYazNjr4kRsMu5neki2
 48DZ5bVmksBCrCWj+u+2dd7EG3m5EMTXfjew/G7vMbdSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:bZ/OZathSTYiW2Ym2xQiS2ts7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81760196"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 02/17] tools/xentrace: rework Makefile
Date: Thu, 13 Oct 2022 14:04:58 +0100
Message-ID: <20221013130513.52440-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use "$(TARGETS)" to list binary to be built.

Cleanup "clean" rule.

Also drop conditional install of $(BIN) and $(LIBBIN) as those two
variables are now always populated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    missing-ack: XENTRACE
    
    v4:
    - also use := for BIN, SBIN, LIBBIN, SCRIPTS
    
    v2:
    - fix typo in title
    - drop conditional install of $(BIN) and $(LIBBIN)

 tools/xentrace/Makefile | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 9fb7fc96e7..63f2f6532d 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -9,41 +9,36 @@ LDLIBS += $(LDLIBS_libxenevtchn)
 LDLIBS += $(LDLIBS_libxenctrl)
 LDLIBS += $(ARGP_LDFLAGS)
 
-BIN      = xenalyze
-SBIN     = xentrace xentrace_setsize
-LIBBIN   = xenctx
-SCRIPTS  = xentrace_format
+BIN     := xenalyze
+SBIN    := xentrace xentrace_setsize
+LIBBIN  := xenctx
+SCRIPTS := xentrace_format
 
-.PHONY: all
-all: build
+TARGETS := $(BIN) $(SBIN) $(LIBBIN)
 
-.PHONY: build
-build: $(BIN) $(SBIN) $(LIBBIN)
+.PHONY: all
+all: $(TARGETS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-ifneq ($(BIN),)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) $(BIN) $(DESTDIR)$(bindir)
-endif
 	$(INSTALL_PROG) $(SBIN) $(DESTDIR)$(sbindir)
 	$(INSTALL_PYTHON_PROG) $(SCRIPTS) $(DESTDIR)$(bindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
-ifneq ($(BIN),)
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
-endif
 
 .PHONY: clean
 clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(SBIN) $(LIBBIN) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


