Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254345DB95
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231313.400364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6X-0002QT-DM; Thu, 25 Nov 2021 13:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231313.400364; Thu, 25 Nov 2021 13:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6W-00026e-93; Thu, 25 Nov 2021 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 231313;
 Thu, 25 Nov 2021 13:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0t-00076i-HJ
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cfb8380-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:42:10 +0100 (CET)
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
X-Inumbo-ID: 7cfb8380-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qiTCQde4ESeiEmkkyzpe1PUHy1DiTkjg/pAXNlV41C8=;
  b=fm1yg1FP1ScNdkBPHYS1Sxh6mFKwi4y0Y3OuVX4eJVEEz8LDawQNbiIc
   FOFrkmINkyvW8ICakNsvm5/kJazuSKsJbpeN7264C/8ZCC+bvMst++9eC
   lp+DLtO6SqotCCXz4EgexWABIujM/7k8ud1p/3N945TzZqVvPhGp+BkQw
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p2E3iK5ubT2TJdzcT1TYGnOtYAnCJXZSJgSZdmYK29bNZEfw6lVl4SVJAUI1R8NNwidRu4Z/7W
 fmBnygXvUMNieufWuSG/r818X60MVeR0u926HauLxZ+82ttMDh0bJ7N4naGxeMmFxaU2lXPzdi
 8o3zi+BWz+wfRO4xSUFqedqCUYxzuHlAHg6S13BWpPNT+lVXMcH6vgbBrTtjRf54A+vSygusZS
 sp8+4aExr4uaGqDHuls/JFhG0Q7ZFTUibmniwB6Xx3xBzxsV+ctQhHJGAGDuS36JMg5xqMXHKe
 Lzqe+SWerqEthP/oTuPIsUj5
X-SBRS: 5.1
X-MesageID: 58576729
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:725R7KtZsRD2jzLt4P41BUD9lOfnVNJZMUV32f8akzHdYApBsoF/q
 tZmKWzVOffbN2b2c95xYN/i9x5U7JCDn9ZmTQNkpX8xES4T+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplr6K3dgQCNYjwpboQdUd+LSRZZawX9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5dGN2U1PXwsZTVJHXITA7wUnt24j17tVmJ8q3mFqJEetj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWMwkQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9tPEcUq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby8Pdp74wpRnqcus9HYjrqOPwPmnxk
 j/f+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBdw5DGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGppbEdMKS
 BWK0e+02HO0FCH3BZKbm6rrV6wXIVLcPdrkTOvISdFFf4J8cgSKlAk3OxXPgD+8wBh9y/9uU
 Xt+TSpLJSxEYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJI+XP2okoZ4ENt/0Tzo8kC
 FnmARQGoLc+7FWaQTi3hodLNOmyAM0h9C1jZkTB/z+AghAeXGpm149HH7NfQFXt3LYLISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:y2VlsKNEAx6esMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576729"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 44/47] WIP, no-VPATH: build object from S source to be in build_in.o
Date: Thu, 25 Nov 2021 13:40:03 +0000
Message-ID: <20211125134006.1076646-45-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

similair to gen-objs-S, but obj-gen-y will be added to build_in.o

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    we could maybe use $(targets) instead of introducing new variables.

 xen/Rules.mk        | 21 ++++++++++++++-------
 xen/common/Makefile |  2 +-
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2d8d32f5fd72..0ef45d2c7087 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -22,6 +22,7 @@ include $(srctree)/scripts/Kbuild.include
 
 # Initialise some variables
 obj-y :=
+obj-gen-y :=
 lib-y :=
 targets :=
 ## targets made from generated sources
@@ -98,6 +99,7 @@ always-y        := $(addprefix $(obj)/,$(always-y))
 targets         := $(addprefix $(obj)/,$(targets))
 lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
+obj-gen-y       := $(addprefix $(obj)/,$(obj-gen-y))
 obj-bin-y       := $(addprefix $(obj)/,$(obj-bin-y))
 gen-objs-c      := $(addprefix $(obj)/,$(gen-objs-c))
 gen-objs-S      := $(addprefix $(obj)/,$(gen-objs-S))
@@ -112,6 +114,11 @@ ifneq ($(hostprogs-y),)
 include $(srctree)/scripts/Makefile.host
 endif
 
+ifndef building_out_of_srctree
+    obj-y += $(obj-gen-y)
+    obj-gen-y :=
+endif
+
 # subdir-builtin may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built_in.o, $(obj-y)))
 
@@ -144,7 +151,7 @@ else
 endif
 
 # Reset COV_FLAGS in cases where an objects has another one as prerequisite
-$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(obj-gen-y) $(extra-y)): \
     COV_FLAGS :=
 
 $(non-init-objects): _c_flags += $(COV_FLAGS)
@@ -155,7 +162,7 @@ ifeq ($(CONFIG_UBSAN),y)
 UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
 
 # Reset UBSAN_FLAGS in cases where an objects has another one as prerequisite
-$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(obj-gen-y) $(extra-y)): \
     UBSAN_FLAGS :=
 
 $(non-init-objects): _c_flags += $(UBSAN_FLAGS)
@@ -209,13 +216,13 @@ cmd_ld_builtin = \
     $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
 endif
 
-$(obj)/built_in.o: $(obj-y) FORCE
-	$(call if_changed,$(if $(strip $(obj-y)),ld_builtin,cc_builtin))
+$(obj)/built_in.o: $(obj-y) $(obj-gen-y) FORCE
+	$(call if_changed,$(if $(strip $(obj-y) $(obj-gen-y)),ld_builtin,cc_builtin))
 
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-targets += $(filter-out $(subdir-builtin), $(obj-y))
+targets += $(filter-out $(subdir-builtin), $(obj-y) $(obj-gen-y))
 targets += $(lib-y) $(MAKECMDGOALS)
 
 $(obj)/built_in_bin.o: $(obj-bin-y)
@@ -258,7 +265,7 @@ quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
 ifdef building_out_of_srctree
-$(gen-objs-S): $(obj)/%.o: $(obj)/%.S FORCE
+$(gen-objs-S) $(obj-gen-y): $(obj)/%.o: $(obj)/%.S FORCE
 	$(call if_changed_dep,cc_o_S)
 endif
 $(obj)/%.o: $(src)/%.S FORCE
@@ -279,7 +286,7 @@ define cmd_obj_init_o
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(obj-gen-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b1e076c30b81..fe3a4b7a8619 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
-obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
+obj-gen-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
-- 
Anthony PERARD


