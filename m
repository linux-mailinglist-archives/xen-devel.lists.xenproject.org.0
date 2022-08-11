Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A72590547
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384909.620496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXA-0007It-0M; Thu, 11 Aug 2022 16:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384909.620496; Thu, 11 Aug 2022 16:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBX9-00079Q-Bc; Thu, 11 Aug 2022 16:59:47 +0000
Received: by outflank-mailman (input) for mailman id 384909;
 Thu, 11 Aug 2022 16:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNB-0003s9-L5
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fadaf68-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:27 +0200 (CEST)
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
X-Inumbo-ID: 8fadaf68-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qDrQV7EHclVKP7YqOg4K6xaUcpWhXjaa6NfN5s1VLLM=;
  b=fDMozji7l0DCFmMSd/wR422tnl/HJuQ3mELQuxUw6jd/SlJ6De42tFgb
   Zi302Prj3HaAo+VrVcAX0FGRrozOjtFJl0D9/dmD3FFNVRAIeYWLbjcbo
   Pbikh/eMufpqKoEPfb9T1atZ55g0RbQ68BCYv9PqpIRQaGJJqXhW+799f
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77134691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5Xjz1q1uUExxY18NQvbD5ddxkn2cJEfYwER7XKvMYLTBsI5bpzJUy
 2EbWT/SPfbYZmamL4wkYdiw8RwG78fcyodgSQVppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Uo35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/5tA3FqZpNbwOJUCjl+q
 dUmLzo/Zw/W0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRB3Gfx1IPEZREJ8klf2krnL+bydZuBSeoq9fD237k1Moi+SzYYO9ltqiQOtHkk27p
 0///kvfQRgcDt2E0x/d7Sf57gPItXyiA99DfFGizdZ1hHWDy2pVDwcZPXOhpuKzkEm5WNR3J
 Ekd+y5opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt6NrskN1okFH1SvVoSJ7pp+PyEwP53
 GXfxMQhvIn/nfLnxo3iow6f22Pz/8GXJuImzl6JBzz4t2uVcKbgPtX1sgaDsJ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPnqgKuVmS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4y9CaiNP4oTOMIZmOq7EMZGOyatM53FyhBwwcnTx
 7/CGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+iOL2TCPEFt843K6mNL9RAFWs/FqIq
 L6y9qKil31ibQEJSnWOrdJPcAtacSFT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:tK2Gia/ixrzluuJQ1WRuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77134691"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, Nick Rosbrook
	<rosbrookn@gmail.com>
Subject: [XEN PATCH v4 17/32] tools: Introduce $(xenlibs-ldflags, ) macro
Date: Thu, 11 Aug 2022 17:48:30 +0100
Message-ID: <20220811164845.38083-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This avoid the need to open-coding the list of flags needed to link
with an in-tree Xen library when using -lxen*.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 tools/golang/xenlight/Makefile | 2 +-
 tools/Rules.mk                 | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 64671f246c..00e6d17f2b 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) build -x
 
 .PHONY: install
 install: build
diff --git a/tools/Rules.mk b/tools/Rules.mk
index ce77dd2eb1..26958b2948 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -105,6 +105,14 @@ define xenlibs-ldlibs
     $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
 endef
 
+# Provide needed flags for linking an in-tree Xen library by an external
+# project (or when it is necessary to link with "-lxen$(1)" instead of using
+# the full path to the library).
+define xenlibs-ldflags
+    $(call xenlibs-rpath,$(1)) \
+    $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
+endef
+
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
-- 
Anthony PERARD


