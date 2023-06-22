Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC973A514
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553682.864394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMIm-000232-VE; Thu, 22 Jun 2023 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553682.864394; Thu, 22 Jun 2023 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMIm-00020G-Rj; Thu, 22 Jun 2023 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 553682;
 Thu, 22 Jun 2023 15:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMIl-0001iC-Jv
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:32:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09eb6ad1-1112-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 17:32:49 +0200 (CEST)
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
X-Inumbo-ID: 09eb6ad1-1112-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687447969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K7GhXsQkcFOr4n5Xl8d8vBjHvn10uHxoIpiBKvaS8NA=;
  b=fEPl22U8n5J0QY6Atbo1XKqtgzfDQIZe7SrmCppEzBktXxTfuo1cYJag
   DYJstBNjexPOdZ0y/Oh8bLVIcHM/wKIoCl3m1/hHces5uBWcaVP9Drrou
   OdQNlDuT9iHYPTcrVQJri6q4NHTf5xqciTYyVFsQeAVbSilc+zfAyhPaV
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116317366
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XSV19qhDCJrKm5u4oLT2t7fzX161SBAKZh0ujC45NGQN5FlHY01je
 htvWTyGa62NMTf8etoib4rn9B4EucCBnNZkQFRs+3owRCkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4gWEzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQKFgsSURuPjNiRxZ69dOlh3e1/FdLCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zydpjuiXE9y2Nq3l2a4y1Wpm+/1hgT8W6c3TLqYy95onwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQkqcs3SDoCx
 lKP2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt/N3LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1UL5uC2TrZTCdCkwygPpXm/+x19Af6fwMuRE9mPnAeZ8wJexFwfR4
 yNay5bCvIjiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT46Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyZFUvs9lmruGrxMuVPO+szY7TmILXwc5079uYdymVbPEetVWLdwRr5RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Km3iObclvVOiw6AF4tNL4mxU8G0eUXFQ7A8xAejUyHt8/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:sEehQK4DPEQrDex66APXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3AqGa4O2m/P0EZZeT4JTme8BXEN5LXOW/j92jvKEO?=
 =?us-ascii?q?zM0FsZLurSVLL0f9diOM7zg=3D=3D?=
X-Talos-MUID: 9a23:kkbt/AisSo+eZT5LeptNGMMpaptV2oOrFUA3irIBuOyhbStQBhefk2Hi
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="116317366"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/5] build: remove TARGET_SUBARCH, a duplicate of ARCH
Date: Thu, 22 Jun 2023 16:30:02 +0100
Message-ID: <20230622153005.31604-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch

 xen/Makefile | 3 +--
 xen/build.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 78d176f04e..bc639a1f80 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -234,7 +234,7 @@ include scripts/Kbuild.include
 # we need XEN_TARGET_ARCH to generate the proper config
 include $(XEN_ROOT)/Config.mk
 
-# Set ARCH/SUBARCH appropriately.
+# Set ARCH/SRCARCH appropriately.
 
 ARCH := $(XEN_TARGET_ARCH)
 SRCARCH := $(shell echo $(ARCH) | \
@@ -242,7 +242,6 @@ SRCARCH := $(shell echo $(ARCH) | \
         -e 's/riscv.*/riscv/g')
 export ARCH SRCARCH
 
-export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
                             sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
                                 -e s'/riscv.*/riscv/g')
diff --git a/xen/build.mk b/xen/build.mk
index 30d74d4772..7e33e710fd 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -41,7 +41,7 @@ include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 targets += include/xen/compile.h
 
 -include $(wildcard .asm-offsets.s.d)
-asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
+asm-offsets.s: arch/$(TARGET_ARCH)/$(ARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
-- 
Anthony PERARD


