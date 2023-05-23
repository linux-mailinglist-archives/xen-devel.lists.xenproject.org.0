Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA370E20B
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538600.838707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAc-0006dY-UF; Tue, 23 May 2023 16:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538600.838707; Tue, 23 May 2023 16:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAc-0006cy-QJ; Tue, 23 May 2023 16:47:34 +0000
Received: by outflank-mailman (input) for mailman id 538600;
 Tue, 23 May 2023 16:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2L-0006Dq-Jd
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:39:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b7961c-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:59 +0200 (CEST)
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
X-Inumbo-ID: 50b7961c-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FFiqj1ESYfIyZ3l/pGkAtoeGdSC6hrZ1HgE4QjQoKLM=;
  b=hMONPKQOWRfooN7SyTyrio+zS/vcRROvZLp181GlE5D33I+65KK2C7ej
   +KemFwvr0142Q2QZ04hlW+oHHrWW4ztf/4NdUzjgCo2cnEJHvjHQQSMIp
   qohS/yv96aFPorMNXf9MrGYx1akmPWjPBixvY2n/1hPRrQraovA3lFhQd
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112568352
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4tWeS6heu9iS9JxuHAdsVXmFX161UxAKZh0ujC45NGQN5FlHY01je
 htvXjuAb/aPa2X9eo1xOY2090gO6JPcmtNkHFQ6q39gFC8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGEBQ/Szuqp9if/+q4SfRwuPUGNJnSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 ziboTSiX0ty2Nq322uez2qhmez0pAjUQoM8GoKkpsNxjwjGroAUIEJPDgbqyRWjsWa8RtZeJ
 ko86ico668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1U7/pwCJjbHpdCcKvgbUQ36b3yZhNLfwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiONrKigbArLmdrGR2CgmbOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNFcykn0z7iuvHPCL9pVI53LymN7pR0U95iF+Nr
 4Y32zWikH2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/S9Nv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg4MOm+Askn/SNnVcHuVH7xs0UejU+UxP93X/MKkXMProSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:IP5oP6h9NcmKU0Mfu0DocS4MvXBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-Talos-CUID: 9a23:8Gg8sWwFN2FrOH2iILjFBgUKIuQXV1b07E35HBe7Cnt1doywUQ+prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AYUm1dgz3etzLgAZcjWMAOCwuFAyaqLb/E30VnIo?=
 =?us-ascii?q?FgPCvGjZxFTmikGSKWYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112568352"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 15/15] build: remove Config.mk include from Rules.mk
Date: Tue, 23 May 2023 17:38:11 +0100
Message-ID: <20230523163811.30792-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Everything needed to build the hypervisor should already be configured
by "xen/Makefile", thus Config.mk shouldn't be needed.

Then, Config.mk keeps on testing support of some CFLAGS with CC, the
result of this testing is not used at this stage so the build is
slowed unnecessarily.

Likewise, GCC is checked to be at the minimum at 4.2 when entering
every sub-directory, so the check have run countless time at this
stage.

We only need to export a few more configuration variables. And add
some variables in Kbuild.include, and macro fallbacks for Make older
than 3.81. (Adding `or` just in case. it's only used in xen/Makefile,
which includes Config.mk and so has already the fallback.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Removing Config.mk benefit:
        Rebuild on my computer is aboud 1 second faster overall.
        Save maybe 3 seconds of user time
        system less loaded

 xen/Makefile               | 4 ++++
 xen/Rules.mk               | 1 -
 xen/scripts/Kbuild.include | 7 +++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 4dc3acf2a6..9af7223c66 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -246,10 +246,14 @@ export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
                             sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
                                 -e s'/riscv.*/riscv/g')
 
+export XEN_COMPILE_ARCH XEN_TARGET_ARCH
 export CONFIG_SHELL := $(SHELL)
 export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
+export CPP AR
 export YACC = $(if $(BISON),$(BISON),bison)
 export LEX = $(if $(FLEX),$(FLEX),flex)
+export HOSTCC HOSTCXX HOSTCFLAGS
+export EMBEDDED_EXTRA_CFLAGS LDFLAGS_DIRECT
 
 # Default file for 'make defconfig'.
 export KBUILD_DEFCONFIG := $(ARCH)_defconfig
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 8177d405c3..8291e0a573 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -17,7 +17,6 @@ __build:
 
 -include $(objtree)/include/config/auto.conf
 
-include $(XEN_ROOT)/Config.mk
 include $(srctree)/scripts/Kbuild.include
 include $(XEN_ROOT)/config/compiler-testing.mk
 
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index d820595e2f..dfa66f2c8a 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -8,6 +8,13 @@ empty   :=
 space   := $(empty) $(empty)
 space_escape := _-_SPACE_-_
 pound   := \#
+comma   := ,
+open    := (
+close   := )
+
+# fallbacks for GNU Make older than 3.81
+realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "$$PWD/$(notdir $(file))")))
+or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(3),$(if $(strip $(4)),$(4)))))
 
 ###
 # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
-- 
Anthony PERARD


