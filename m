Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE7ABE538
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991133.1375058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTxA-0006qq-1B; Tue, 20 May 2025 20:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991133.1375058; Tue, 20 May 2025 20:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTx9-0006ob-Rj; Tue, 20 May 2025 20:52:47 +0000
Received: by outflank-mailman (input) for mailman id 991133;
 Tue, 20 May 2025 20:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHTx8-0006MJ-0A
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:52:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60aad136-35bc-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 22:52:44 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso3388655f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 13:52:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3674fed67sm13346626f8f.89.2025.05.20.13.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:52:43 -0700 (PDT)
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
X-Inumbo-ID: 60aad136-35bc-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747774363; x=1748379163; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYDHu2sNUHYKOZndg0ckJhy2AgiTG60/H+oM7p1zbrI=;
        b=iDqy6fof3cPW6xIW0kMf6D2P7OTQ/TvdyOzjXzeJyg2R5knNy36RW59tWnYZ1vDmGU
         +PnkJcALYnA+eNKFul4/KJyrgfnx/zVmzy4yGYRbeL3Yz3/WIVwFwT+zbou+r8SgamRg
         UtVFs6t5/d6KFfSKEwnQyebaPsfqQ0py6Ehzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774363; x=1748379163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYDHu2sNUHYKOZndg0ckJhy2AgiTG60/H+oM7p1zbrI=;
        b=K+Y10e8I4LZCuvuz0ZEta3WUV1hH10lS/hHKfXSva5NrFK6IVRFXgTdfPy/AsPG8VO
         kDK0ouVBztaaKo9AFp5joRLwizz3b8p93dKpUkGWbgC3q+saU7HimCaZ/AcOnb7j474F
         8u13omGPyzHDtkUFXEYjy4Ks92IgWOXYPiomon68h7Pr9V17zthK8wFJd35bdcXuHMOK
         0TcpEUeWLZiOn0Fp3MDbwkKNwpwhvJOc4XlSu2MHQbSf59EGhSxs8wOLtlKB/lSBwl7a
         x8d7khOwPqnkhOhgYfRpZpWUF4Qm1Of9P7D4ywKzuP9cIVFrZni75qvGpprbWS6DRUzZ
         rN+g==
X-Gm-Message-State: AOJu0Yzr0NCGcLneh8/ntzA4lg5m07OJgd6xhNj2YWr82NafE1dc1Ddo
	Z4GdwG6Ej7BxWYTncXkpcixWeR9/raGIRUK1FB6iUsE1mBKInM2oPRNWIM6CTrblvjMXSDRLIPl
	2R47j
X-Gm-Gg: ASbGncvWIYYzGlWJlJ+979HtIIW6fBi4B+TMcxGp6oMnD0VpeA8B8+33+q4uh6tkMOD
	Q1EY9a73kZFGzhYUIATPP6hZuo5DkZyEhOsS0CxIkOXWffNgAspq0hFpgLgfUDy2sZVJ4mxVodB
	Pm0qdJGxj/SnOJt9nwTNPbNg454MFXKajCyO8CxNc3RdiXxQXQFq7jmgjV4WvO4mo5pkkgv2e5H
	adLgCtBdo7RYsK7TQQTg1zp6K6d7pk9BchBdzhV/ke/EY7N2y+vkj444kwm6dr+Kn9D+pSAzusi
	hHeY+VvQ8MtBYab2MY2h1mPtaNcsRfF9tB8jTKwNURtv059Frp3RGGKInhzddPS1xqn2oL2nwhk
	/joIokarLPEqPfBLoThFgljJwAgdOPko0rTQ=
X-Google-Smtp-Source: AGHT+IEm8qC0/Cw499LvGYeu6PTVrv6v4GMfM/V8kSQ0Tgoq7Ny42YSk/kZf0kJtD3FICrHJYPgKkA==
X-Received: by 2002:a05:6000:4284:b0:3a2:244:67a4 with SMTP id ffacd0b85a97d-3a35ffd2acbmr14640201f8f.43.1747774363393;
        Tue, 20 May 2025 13:52:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] tools/tests: Install tests into $(LIBEXEC)/tests
Date: Tue, 20 May 2025 21:52:38 +0100
Message-Id: <20250520205239.203253-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520205239.203253-1-andrew.cooper3@citrix.com>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

$(LIBEXEC_BIN) is a dumping ground of many things.  Separate the "clearly
tests" from everything else so we can clean up how they're run in CI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/tests/cpu-policy/Makefile     | 6 +++---
 tools/tests/paging-mempool/Makefile | 6 +++---
 tools/tests/rangeset/Makefile       | 6 +++---
 tools/tests/resource/Makefile       | 6 +++---
 tools/tests/tsx/Makefile            | 6 +++---
 tools/tests/xenstore/Makefile       | 6 +++---
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 5df9b1ebbd7e..24f87e2eca2a 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -29,12 +29,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests)
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
 
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(CFLAGS_xeninclude)
diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
index a081b3baa514..a1e12584ce80 100644
--- a/tools/tests/paging-mempool/Makefile
+++ b/tools/tests/paging-mempool/Makefile
@@ -16,12 +16,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
index 3dafcbd0546c..e3bfce471cd3 100644
--- a/tools/tests/rangeset/Makefile
+++ b/tools/tests/rangeset/Makefile
@@ -20,12 +20,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET))
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGET))
 
 list.h: $(XEN_ROOT)/xen/include/xen/list.h
 rangeset.h: $(XEN_ROOT)/xen/include/xen/rangeset.h
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index a5856bf09590..09d678fffe3e 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -20,12 +20,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index a4f516b72597..0bb7e7010347 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -16,12 +16,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
 
 .PHONY: uninstall
 uninstall:
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index 202dda0d3c23..2ee4a1327e75 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -20,12 +20,12 @@ distclean: clean
 
 .PHONY: install
 install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests)
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
 
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += $(APPEND_CFLAGS)
-- 
2.39.5


