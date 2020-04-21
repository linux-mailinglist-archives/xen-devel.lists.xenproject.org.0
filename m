Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA001B2C01
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVy-0005eK-TD; Tue, 21 Apr 2020 16:12:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVx-0005dA-Gm
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:49 +0000
X-Inumbo-ID: edb62586-83ea-11ea-9160-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edb62586-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0izhnBZO5D9wuACF3/cIE86tFOeUto318+1OADqyCoo=;
 b=BGACX90UYtvdeQSJReSQ1jC/QaiIrKVDJKOWLR6Ry1nCTSiTMfMkIe58
 8if9AsqTNdOBMmXC2g5bEyeq8j7rKb7lCPUQixCjYq924g8hOMV1x4iYJ
 G4H6sjTOaDIygZmJ725Nb3bZMhf8mqY2zH0oT2yxfGgiuzoLCAWohlu3Q 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ujEdstzz5iP8bpZsR/3NBoE1tb6gIVT7YwtcNbq9VfKnStCgLpX6k5L627K1LwFbmN+kuFiiDZ
 FhJKu0F87UC/m0hLWErGTkp8kFg/yejZa7jcFrElnvNNQz18wsTq7zY/anJQELC+nF68R6xqH3
 WfHAmb6afBqD96j85hj+u/ixJED7VeZ9yqQM/enH6/er78WAaMy0LtxpRcu/IaD9RLIvd4zXp+
 SO9U+16kUnGXkikqoFAvdoL7G+0IDKSy4OEklkoS9z41wR2/TtH6Eo5rhYIyGXK/HEWJl0L8Oi
 aeE=
X-SBRS: 2.7
X-MesageID: 16414439
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16414439"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 10/16] xen/build: Use if_changed_rules with %.o:%.c
 targets
Date: Tue, 21 Apr 2020 17:12:02 +0100
Message-ID: <20200421161208.2429539-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use $(dot-target) to have the target name prefix with a dot.

Now, when the CC command has run, it is recorded in .*.cmd
file, then if_changed_rules will compare it on subsequent runs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 5e08e14455d7..9150911296de 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -173,19 +173,27 @@ FORCE:
 
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


