Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126053B92F4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148719.274941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPC-0002SS-3A; Thu, 01 Jul 2021 14:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148719.274941; Thu, 01 Jul 2021 14:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPB-0002O2-T2; Thu, 01 Jul 2021 14:11:01 +0000
Received: by outflank-mailman (input) for mailman id 148719;
 Thu, 01 Jul 2021 14:11:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPB-0005tj-1K
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc51d3e3-e9ff-4cf0-8250-e11fa1c9f0c9;
 Thu, 01 Jul 2021 14:10:38 +0000 (UTC)
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
X-Inumbo-ID: dc51d3e3-e9ff-4cf0-8250-e11fa1c9f0c9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLKI3ja1OUbts2SnkXQR8tTgRcFYuztp8ELRrsey8HY=;
  b=GzMrmv93g75dGvqNHP/ElWe5XWY5IsPA/7go3q8fnKFgzZZaRgbp5Cg2
   wIGhO229pBS4nowzeIHkpnnrH1vSpQHK1HnTdu2FFtp27EvL+E0kIjZ4p
   yFzc92awQV9mjR16peojouoWcKDDWA8653djOcor0Y3qbR+dijDuabRsT
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wIO4LSAo1RB0HaT/akOTS3NCz9fKPQLBQUbVveOV7ZDsxOUA6h6frkF1StbkTbFdNID1zjly80
 pWCRm8a8pjU4Nrv+jvHD8wTjx+0gqGylMuUCK4JnKgI1f/Yy/YR3KbTu+0E2P3D7o0Xu8TZQ2i
 C/TDLPzF1zcft4irDJL81YbVQwxjfyVLArodacQF7kUFEh2JlwmD1h32z61mi43PctvgQdaTBQ
 quhDcHx9v0aM1oQBZC/dAgjzkegd/OZtGjZsb6QUI4l2AD3BCeqk/wCCQ5TFvywtHae1rrkabJ
 ncQ=
X-SBRS: 5.1
X-MesageID: 49007487
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kwHH2qx3bz8ADejhFK2EKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="49007487"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v6 14/31] build,arm: move LDFLAGS change to arch.mk
Date: Thu, 1 Jul 2021 15:09:54 +0100
Message-ID: <20210701141011.785641-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile | 8 --------
 xen/arch/arm/arch.mk  | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 0edd9dee6f49..3d0af8ebc93c 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -104,14 +104,6 @@ prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 endif
 
-ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
-    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
-        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
-    else
-        XEN_LDFLAGS += --fix-cortex-a53-843419
-    endif
-endif
-
 targets += prelink.o
 
 $(TARGET)-syms: prelink.o xen.lds
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 11caec86ba14..6a2982059486 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -17,3 +17,11 @@ $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)
 endif
+
+ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
+    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
+        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
+    else
+        LDFLAGS += --fix-cortex-a53-843419
+    endif
+endif
-- 
Anthony PERARD


