Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4B3F5C6B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170928.312034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1t-0007Lo-Sa; Tue, 24 Aug 2021 10:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170928.312034; Tue, 24 Aug 2021 10:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1t-0007I3-OC; Tue, 24 Aug 2021 10:51:41 +0000
Received: by outflank-mailman (input) for mailman id 170928;
 Tue, 24 Aug 2021 10:51:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1s-0001EC-9R
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4a9e43c-6982-480e-9a20-723681e4cb13;
 Tue, 24 Aug 2021 10:51:06 +0000 (UTC)
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
X-Inumbo-ID: e4a9e43c-6982-480e-9a20-723681e4cb13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7uRuMBIULvFTfFL0MTl+k+EkGnHEI0YpQ0xr5zoMeQ=;
  b=hvqP7WRRzTuWZMambJ/kZHmaRbp+CVUHmGceXrEx2K/y24W3vII3QfO9
   YVRIRzX7ZQBt+9qsODNnC3ILf/PMMLWItScsXai2dyx7wPLgL9tY4lRx0
   mj9H4kBbtNJcFb7Bs+C5cgAhyCtXFobSRR4W2WKYTC0LSeahxroA09ian
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nqdIsawWsV0NUNXuRV64bM3LTdvfA9L0RIzmIdIoOqEOGYtyTZA6EwN8D2FBYlEU+YKF8FWKbY
 cq3QA3gqM/zSrIUyqA33VqMBolQQP+Iulo1hMcb3ykcLSny1uY8MZPPxXvIpA5+Ia4MThxzlxQ
 fY9Rq/1CiHKWEwA01k3cl0YTVR/XNNqBg8pINOs8OQITQm6NwEDJJa3lPepcTv0D4eBs/X+Yl4
 9GOBEO9nIY5y5A9a/VnLbPIjiAv1vY0C/p5o2QuHxejyrLcJUvEDw2RQnSo88OftzcjfBiu6xv
 mqRWUMEobbocyrrlNG7J0+2w
X-SBRS: 5.1
X-MesageID: 51166344
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NtBFhanGO5sHbNIhcnlJy33Ntc/pDfOQimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qXO1z/5ICPoqTM6ftWjdySCVxe5ZnO/fKlHbdREWldQtn5
 uIEZIOb+EYZGIS5aqU3ODSKadC/DDzytHMuQ6o9QYOcegFUcBdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz6+HjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T/M1TiyWsmVM73a4m2OcJ+eEzR/BkTfJlaAkEvzzYJbiJnYfy+Qzd7tvfrGrC2+
 O82yvId/4DkE85OFvF7CcFkjOQqgoG+jvsz0SVjmDkptG8TDUmC9BZjYYcaRfB7VE81esMpp
 6j8ljpw6a/Nymw6xgVJuK4Ji1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02ZfusrMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60e5hAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgfwQl7MkccIDcSRCeI1JbcJ6e
 j8uWJjxB0PkhjVeLCzNbVwg2/waXT4RjLw180b/IR9ttTHNcrWDRE=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166344"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 11/51] build: move make option changes check earlier
Date: Tue, 24 Aug 2021 11:49:58 +0100
Message-ID: <20210824105038.1257926-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And thus avoiding checking for those variable over and over again.

Also, add "e.g." in the error messages to hint that "menuconfig"
isn't the only way.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v7:
    - Add "e.g." into the error message to hint that menuconfig isn't the
      only way.

 xen/Makefile | 22 ++++++++++++++++++++++
 xen/Rules.mk | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index f35a4d84f7cd..2c56546cd1dc 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -56,6 +56,28 @@ include scripts/Kbuild.include
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
 
+ifneq ($(origin crash_debug),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable crash_debug now.")
+endif
+ifeq ($(origin debug),command line)
+$(warning "You must use e.g. 'make menuconfig' to enable/disable debug now.")
+endif
+ifneq ($(origin frame_pointer),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable frame_pointer now.")
+endif
+ifneq ($(origin kexec),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable kexec now.")
+endif
+ifneq ($(origin lock_profile),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable lock_profile now.")
+endif
+ifneq ($(origin perfc),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable perfc now.")
+endif
+ifneq ($(origin verbose),undefined)
+$(error "You must use e.g. 'make menuconfig' to enable/disable verbose now.")
+endif
+
 # Beautify output
 # ---------------------------------------------------------------------------
 #
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 48ae519d0153..c313486ce0f6 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -9,28 +9,6 @@ include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
 
-ifneq ($(origin crash_debug),undefined)
-$(error "You must use 'make menuconfig' to enable/disable crash_debug now.")
-endif
-ifeq ($(origin debug),command line)
-$(warning "You must use 'make menuconfig' to enable/disable debug now.")
-endif
-ifneq ($(origin frame_pointer),undefined)
-$(error "You must use 'make menuconfig' to enable/disable frame_pointer now.")
-endif
-ifneq ($(origin kexec),undefined)
-$(error "You must use 'make menuconfig' to enable/disable kexec now.")
-endif
-ifneq ($(origin lock_profile),undefined)
-$(error "You must use 'make menuconfig' to enable/disable lock_profile now.")
-endif
-ifneq ($(origin perfc),undefined)
-$(error "You must use 'make menuconfig' to enable/disable perfc now.")
-endif
-ifneq ($(origin verbose),undefined)
-$(error "You must use 'make menuconfig' to enable/disable verbose now.")
-endif
-
 TARGET := $(BASEDIR)/xen
 
 # Note that link order matters!
-- 
Anthony PERARD


