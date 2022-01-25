Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F1649B298
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260085.449208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJf9-0004wj-Lh; Tue, 25 Jan 2022 11:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260085.449208; Tue, 25 Jan 2022 11:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJf9-0004ut-Hr; Tue, 25 Jan 2022 11:06:59 +0000
Received: by outflank-mailman (input) for mailman id 260085;
 Tue, 25 Jan 2022 11:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaS-0006Mn-7O
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b8c4e4f-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:07 +0100 (CET)
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
X-Inumbo-ID: 3b8c4e4f-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JPbHo9Jo8aOfD2/lllmxqNTLME6igV4FyqbCCTnSPrY=;
  b=C9SKhZlRNGdRKrIf2rLfHEP43Jah2yddpri85dYJn5W+MdZJHR3+Bz5P
   dy+UKgE0dWdTBEYTt/f7yDnURHV2UQnUPvlrdZKMJZ58rIXiw1jJ5CpCn
   5+IrH68Jm1anKYY663RnLLit/XXjsZ5X6bdN6Tz9HvbiWIW73oj+zXetm
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QWUz9YK1cap7V4Zd2e7r/gMgMbdEYXpIYHj+3ypl/iTdiOBv93LahrLDbp7riKnu69FijRq9W4
 ZuW9kwh4vKMZYKw9OqtNFyrfUA5AwmXrB4iEKq/1WjDT9gIl89NL9ZhLIoM4j2yZzGWAEAElC2
 e0Oy7VqcfZabkNB720an1yfBBNr1KrySHqPnVMEzMfk63WOjYc8XW7iF8WH/2Ug6HKOVpsfVzl
 lcAZ5x04DmnF5yimbojQBeq0dcD2sI1pLN14MYniSRhtfWiZeNVcLdAmtIzGZGr0I3aofV1iGd
 B7X/H34N4+G9sbsIuTHUehFy
X-SBRS: 5.2
X-MesageID: 62170391
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cWLiyq3XWSWLQNEXyPbD5S92kn2cJEfYwER7XKvMYLTBsI5bp2YDm
 zAdWmCBOaqPMzbzLtx+a4u/8RgFsJfQy9UxSAc6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhh9Ug1
 4VvrY2LTiAUB5Odsd4tcShDOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3JkRRa2PP
 qL1bxIoVBXySE1RZW0vJ440lrvwhlDtXgxX/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SWB2mKhgKnIhyyTcIAPELy18NZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Rizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxR3teyKGVCF54yTig6LB3k8F18gVDQtGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/Azr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hL0yT/FWy3yGomTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CquMMosRPcYgJVfvEMRSiai4hTyFfK8EyvlXB
 HtmWZz0USZy5VpPklJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CDrGWSnSJoOY7cABbRVBmVMueg5EGKYa+zv9ORTtJ5wn5m+1xIuSIXs19y4/1w
 51KchYIkQWk3Syed1zih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:Ll6cZaGeAc3uC1BppLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62170391"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 22/30] build: rework coverage and ubsan CFLAGS handling
Date: Tue, 25 Jan 2022 11:00:55 +0000
Message-ID: <20220125110103.3527686-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When assigning a value a target-specific variable, that also affect
prerequisite of the target. This is mostly fine, but there is one case
where we will not want the COV_FLAGS added to the CFLAGS.

In arch/x86/boot, we have "head.o" with "cmdline.S" as prerequisite
and ultimately "cmdline.o", we don't want COV_FLAGS to that last one.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - reorder target-specific assignments
    - fix typo in comment
    - reviewed

 xen/Rules.mk | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 5f2368805b36..abeba1ab7494 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -126,19 +126,31 @@ targets += $(targets-for-builtin)
 
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
+# Reset COV_FLAGS in cases where an objects has another one as prerequisite
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    COV_FLAGS :=
+
+$(non-init-objects): _c_flags += $(COV_FLAGS)
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize= options need to come after any -fsanitize= options
-$(filter-out %.init.o $(noubsan-y),$(obj-y) $(obj-bin-y) $(extra-y)): \
-CFLAGS-y += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+
+# Reset UBSAN_FLAGS in cases where an objects has another one as prerequisite
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    UBSAN_FLAGS :=
+
+$(non-init-objects): _c_flags += $(UBSAN_FLAGS)
 endif
 
 ifeq ($(CONFIG_LTO),y)
@@ -167,6 +179,9 @@ a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
+c_flags += $(_c_flags)
+a_flags += $(_c_flags)
+
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-- 
Anthony PERARD


