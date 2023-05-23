Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447970E1F9
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538567.838668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2J-00023q-Q6; Tue, 23 May 2023 16:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538567.838668; Tue, 23 May 2023 16:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2J-0001x6-L5; Tue, 23 May 2023 16:38:59 +0000
Received: by outflank-mailman (input) for mailman id 538567;
 Tue, 23 May 2023 16:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2H-0006Dq-Ij
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e613f36-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:56 +0200 (CEST)
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
X-Inumbo-ID: 4e613f36-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1S/PIs/4N3VAkKwJ+CBkSKlCj5ulIeeoVMLk5Q/XC08=;
  b=ReGjuiPeDNGs5/wWMLup3ywIS2NAdQ8aqbibv7LZRQ2OZr2HV2MwNDrF
   T7Xn86TkJ8VO3jIu3ONEOC6u8iQEECaz5PhjkE4W8PLFtL+ZD+PhCCzed
   r7K7+pVWaEFz21b2BkFTVXMG/x8/cjcOUM/h6PK/e0HDGjfkqNA+kb3/K
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109985443
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:n7tHLaiFli/lPQhkHvJ7ujoCX161UhAKZh0ujC45NGQN5FlHY01je
 htvWmGFOv2LZmD8fYp+OYy18BhS6MPdnIRlGQJo/ClnRi4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ2GQg0Nlezl96MzbTgEbNLgNQRBZDSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 jOXrzmlXkpy2Nq3kCq0+G6vn9XzmhzmZ4ApHq2jq8BonwjGroAUIEJPDgbqyRWjsWa8RtZeJ
 ko86ico668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1X72uwv04ajZcjQ44F6MBEWj/jFQPbfwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiONrKigbArLmdrGR2CgmbOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNFcykn0z7iuvHPCL9pVI53LymN7pR0U95iF+Nr
 4Y32zWikH2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/S9Nv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg4MOm+Askn/SNnVcHuVH7xs0UejU+UxP93X/MKkXMPrbELISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:U9TLsKoPt5qbgWg/NZ2IesAaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-Talos-CUID: 9a23:dGDAdWBLlX3GBFT6EwdWzHdMXfA1TkfQyiyLeWi+GVRAEYTAHA==
X-Talos-MUID: 9a23:1zO0yQaC0Av2oOBT7i/dji1hLf1U5JuzN0I2m4Ud5veGKnkl
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109985443"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 05/15] build: introduce a generic command for gzip
Date: Tue, 23 May 2023 17:38:01 +0100
Message-ID: <20230523163811.30792-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make the gzip command generic and use -9 which wasn't use for
config.gz. (xen.gz does use -9)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk        | 5 +++++
 xen/common/Makefile | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 59072ae8df..68b10ca5ef 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -63,6 +63,11 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
 quiet_cmd_binfile = BINFILE $@
 cmd_binfile = $(SHELL) $(srctree)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
 
+# gzip
+quiet_cmd_gzip = GZIP    $@
+cmd_gzip = \
+    cat $(real-prereqs) | gzip -n -f -9 > $@
+
 # Figure out what we need to build from the various variables
 # ===========================================================================
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46049eac35..f45f19c391 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -78,13 +78,13 @@ obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
-$(obj)/config.gz: $(CONF_FILE)
-	gzip -n -c $< >$@
+$(obj)/config.gz: $(CONF_FILE) FORCE
+	$(call if_changed,gzip)
+
+targets += config.gz
 
 $(obj)/config_data.o: $(obj)/config.gz
 
 $(obj)/config_data.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
-
-clean-files := config.gz
-- 
Anthony PERARD


