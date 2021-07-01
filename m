Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD403B92EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148712.274886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOt-00081L-Uu; Thu, 01 Jul 2021 14:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148712.274886; Thu, 01 Jul 2021 14:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOt-0007wh-PY; Thu, 01 Jul 2021 14:10:43 +0000
Received: by outflank-mailman (input) for mailman id 148712;
 Thu, 01 Jul 2021 14:10:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOs-0005F9-JC
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1306551d-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:23 +0000 (UTC)
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
X-Inumbo-ID: 1306551d-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W3w4kLLs4D474Vdd8fHK3XAA2OqyxxyERzR7s4cMOP0=;
  b=aeHrKohN/N6ShuMLamw3YwrNUV+XmzYHaPzfkdTwszQe4z+SVD0Ebspl
   hCZkKgq6ERoqlvnAdCERLPjbcTe5QVy4W7OsDNL/EJafRcRXpKqf2URTi
   xJ+22QUI53O40dm+qu7ZglvRXTwVGFSd2NxYBNfLiU+ghYqWh7+AW5Fzp
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GJ4PkxF6CblU0SjvcOwQOGT/BmredQqQ0MdquCllOKVewtxBRYzL6QA28aZcNVrL+XEhv6o3ml
 XdeCsmaWHLpttZeaEIuUaE0YO+gADtL1B/TT93ZIh2UUJErWB08+WCmKpMba7IqB8OvzGtMuCV
 eE/88p2AKPyUGSPfYlMeyMYlMOqZ+fOG2n9FWHh8vL2W+ps8SAod92gG6fCwot0niJnFFkOW12
 83oaxkGGLABKF2auaGR9f5ziN7N+wW2Rf9OROX4sU8lFjs4D5PttLTay6aUhh6gyQpvI4lXfjH
 maQ=
X-SBRS: 5.1
X-MesageID: 47384355
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ms3X/qNZ9Q7d5sBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384355"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 04/31] build: use if_changed_rules with %.o:%.c targets
Date: Thu, 1 Jul 2021 15:09:44 +0100
Message-ID: <20210701141011.785641-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(dot-target) to have the target name prefix with a dot.

Now, when the CC command has run, it is recorded in .*.cmd
file, then if_changed_rules will compare it on subsequent runs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 6a0cdfde2eed..4adc90eec80d 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -192,19 +192,27 @@ FORCE:
 
 SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
 
-%.o: %.c Makefile
+quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
-	$(CC) $(c_flags) -c $< -o $(@D)/.$(@F).tmp -MQ $@
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-	$(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(@D)/.$(@F).tmp $@
-else
-	$(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(@D)/.$(@F).tmp $@
-endif
-	rm -f $(@D)/.$(@F).tmp
+    cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
+    ifeq ($(CONFIG_CC_IS_CLANG),y)
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
+    else
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
+    endif
+    cmd_objcopy_fix_sym += && rm -f $(dot-target).tmp
 else
-	$(CC) $(c_flags) -c $< -o $@
+    cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $@
 endif
 
+define rule_cc_o_c
+    $(call cmd_and_record,cc_o_c)
+    $(call cmd,objcopy_fix_sym)
+endef
+
+%.o: %.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
-- 
Anthony PERARD


