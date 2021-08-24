Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA33F5CAA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170997.312218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBf-000088-Ue; Tue, 24 Aug 2021 11:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170997.312218; Tue, 24 Aug 2021 11:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBe-0008Cy-FH; Tue, 24 Aug 2021 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 170997;
 Tue, 24 Aug 2021 11:01:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4N-0001EC-Ev
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6333f6ed-aaac-483c-a919-463de5858291;
 Tue, 24 Aug 2021 10:52:07 +0000 (UTC)
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
X-Inumbo-ID: 6333f6ed-aaac-483c-a919-463de5858291
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0sdKoSvD950B0zcSvy6AS1vxf5zMM2TIt6vZB7gd6A8=;
  b=NR8eimQi/WDkegfaDQYT7Woa0iN2TliHISijXHP2P8wpRUXQPJrf1k+s
   tbO+ZRmgvLDQ5c/3+PGe94DzjBpm5g5PNYdaWJJFCKKT+3NXY3dFAQ+AK
   e3thryVLxxfQTDszuVc7csp+lktQvuQW2Ynp4klFDpCK4d0VNc86G1V9n
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 47z0dCT4csvYRb1sn4qDiS4fqAtWgx+7AaDOQknfgr+XufCsn6Zx6+K1Y3esQgWsvNoYj1PHjL
 xQ8amI4x8CiJDDeT0gIz49blFzcykp1VdqajMtcCiFVUb/t5LmFU9pR/QmC1wBAMJOIg59ufSp
 lx+KXWbX/HWOvzRl4a4TCE4Af7bTinz1JNoEwwT+cq1PFZ8T6WWB/YVIGP2jVNCfFYPgakTTmR
 gtYhEfURnfNYBAsGeASZUlt1yT7C5bkP9WVzR93Sh12SFy9csFSwNsAlIBFko83V5ZUAWtKs9E
 TMWlulfyuSLG8FOO1tZ7WJxb
X-SBRS: 5.1
X-MesageID: 50772237
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lkUgW6kN7KEec+8G0DPkOXZg4WDpDfOQimdD5ihNYBxZY6Wkfp
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
   d="scan'208";a="50772237"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 39/51] build: rework coverage and ubsan CFLAGS handling
Date: Tue, 24 Aug 2021 11:50:26 +0100
Message-ID: <20210824105038.1257926-40-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When assigning a value a target-specific variable, that also affect
prerequisite of the target. This is mostly fine, but there is one case
where we will not want the COV_FLAGS added to the CFLAGS.

In arch/x86/boot, we have "head.o" with "cmdline.S" as prerequisite
and ultimately "cmdline.o", we don't want COV_FLAGS to that last one.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 1e1839c4b629..6877fcc2d6d8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -131,19 +131,31 @@ targets += $(targets-for-builtin)
 
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
+non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
+
 ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
 else
     COV_FLAGS := -fprofile-arcs -ftest-coverage
 endif
-$(filter-out %.init.o $(nocov-y),$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += $(COV_FLAGS)
+
+$(non-init-objects): _c_flags += $(COV_FLAGS)
+
+# Reset COV_FLAGS in cases where an objects as another one as prerequisite
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    COV_FLAGS :=
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize= options need to come after any -fsanitize= options
-$(filter-out %.init.o $(noubsan-y),$(obj-y) $(obj-bin-y) $(extra-y)): \
-CFLAGS-y += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+
+$(non-init-objects): _c_flags += $(UBSAN_FLAGS)
+
+# Reset UBSAN_FLAGS in cases where an objects as another one as prerequisite
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    UBSAN_FLAGS :=
 endif
 
 ifeq ($(CONFIG_LTO),y)
@@ -172,6 +184,9 @@ a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
+c_flags += $(_c_flags)
+a_flags += $(_c_flags)
+
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-- 
Anthony PERARD


