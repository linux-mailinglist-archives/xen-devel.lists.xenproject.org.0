Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACF3A8663
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142288.262603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBsI-0003fb-7a; Tue, 15 Jun 2021 16:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142288.262603; Tue, 15 Jun 2021 16:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBsI-0003dD-4W; Tue, 15 Jun 2021 16:25:14 +0000
Received: by outflank-mailman (input) for mailman id 142288;
 Tue, 15 Jun 2021 16:25:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltBsG-0003IV-4t
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:25:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 430cf9d0-84ca-47da-9e24-22f579c47ed3;
 Tue, 15 Jun 2021 16:25:02 +0000 (UTC)
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
X-Inumbo-ID: 430cf9d0-84ca-47da-9e24-22f579c47ed3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623774302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zXwBttlq/sUctChlltDPrS3/9kYAFsNJN4Yl+m3Z5I0=;
  b=Uv9WOl155jbybyXWFKG/HpmXnY1Vc/f51nKqaLPArvvfWXRW0yb0uDbf
   5JXrQh25ZAqXuXYKh7JaFoXmJXNDyCiSF6m6DDvEKL4GLw5igwQAgiTi4
   454c9+zYnh2SsGAijq4sloLn84Xt5oOGFrXZQ0YRr4dAbrm0GilL+bGsv
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r7fvxB8phPJ6dc9iLBwsP4KCY8wB7wqr2HsSbs1E37V29dzS9IQVFgt/1/x6WSZDI2wQ2pZt/U
 qPfb9MxbMtxUN7rDtPXB/7aMaf9QLO29HsCHIzmQpTM7ZFbpZn4ghuZwG8uCiQ6DfA5x29QwJE
 krdg8h/zb+fTfgj86JRVBMR9gs7hnx1xFfARxsx4TveZOC6FGsME1nUvw1SEFiU+GMz+S1Zb3h
 JtFvvI3O13ggSczOfQAYNq6QkQo/StTfMoxy4T91dDXrJANpAOgJ2fCH4SMmkzSuQhk2c22Uj5
 DVw=
X-SBRS: 5.1
X-MesageID: 46552554
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rNLb2qnSbOtMMtblxjK47wyt/kjpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46552554"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 2/5] tools/tests: Drop run runes
Date: Tue, 15 Jun 2021 17:19:02 +0100
Message-ID: <20210615161905.9831-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210615161905.9831-1-andrew.cooper3@citrix.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These aren't implemented consistently.  The one in resource/ is useless as the
binary needs running in dom0, and the layout in cpu-policy/ demonstrates the
weakness of this approach with multiple binaries.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/tests/cpu-policy/Makefile   | 4 ----
 tools/tests/resource/Makefile     | 4 ----
 tools/tests/vpci/Makefile         | 4 ----
 tools/tests/x86_emulator/Makefile | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 70ff154da6..53b4f28b2a 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -17,10 +17,6 @@ endif
 .PHONY: all
 all: $(TARGET-y)
 
-.PHONY: run
-run: $(TARGET-y)
-	./$(TARGET-y)
-
 .PHONY: clean
 clean:
 	$(RM) -f -- *.o .*.d .*.d2 test-cpu-policy
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 4bef482966..da5e2a4f9b 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -6,10 +6,6 @@ TARGET := test-resource
 .PHONY: all
 all: $(TARGET)
 
-.PHONY: run
-run: $(TARGET)
-	./$(TARGET)
-
 .PHONY: clean
 clean:
 	$(RM) -f -- *.o $(TARGET) $(DEPS_RM)
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 5075bc2be2..f172cefd3d 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -6,10 +6,6 @@ TARGET := test_vpci
 .PHONY: all
 all: $(TARGET)
 
-.PHONY: run
-run: $(TARGET)
-	./$(TARGET)
-
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
 	$(HOSTCC) -g -o $@ vpci.c main.c
 
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 7b07c31bbd..7b3f58b7a2 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -7,10 +7,6 @@ TARGET := test_x86_emulator
 .PHONY: all
 all:
 
-.PHONY: run
-run: $(TARGET)
-	./$(TARGET)
-
 # Add libx86 to the build
 vpath %.c $(XEN_ROOT)/xen/lib/x86
 
-- 
2.11.0


