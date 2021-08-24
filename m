Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE93F5C99
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170957.312056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUAy-0002i3-2L; Tue, 24 Aug 2021 11:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170957.312056; Tue, 24 Aug 2021 11:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUAx-0002gA-US; Tue, 24 Aug 2021 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 170957;
 Tue, 24 Aug 2021 11:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU22-0001EC-9b
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bd6516f-f5e4-492b-9635-845939c011e7;
 Tue, 24 Aug 2021 10:51:10 +0000 (UTC)
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
X-Inumbo-ID: 3bd6516f-f5e4-492b-9635-845939c011e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WypzVU9rf23sGm2Av46eWBR2S9nY0Xuo8OA2HzrRil0=;
  b=AAUTZgulXbDcDEFnl7sWjm8ot5/+lNi6z4Z3Yl1HWvzcTWym4JBEjbBV
   AWaEgPJ1tq1WwJKOVcvdST6iYUDO8+18H6/Mg2mWraQfADfTFG5Uu/ARj
   AWX4WajI+SXUw7faracDBxn8sYD1dnd2b6pTU3A955Uh6YRFPR/iAMszJ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: V5zkhaFj1GJEZ9xLAqK6GdzDCUgaGdMHnS8SzdSXpa8yMjZncY8XGpF+D4eYZRL1gZ9CwaJRof
 H1UWmZOa221YArykhQGZPUzSgZAGHr1ZuBM2hnnxe2yj1kG694XykysdPrwQ4gmz8RC7kImmbP
 +KwgegsLA1Fi8GD+p2nX7pgeSBmdXYap3Y+LwD+nTcVjpk6XMVzCSMfT2vfc5SxEmelyBXkvcZ
 SDQWNcApf8ecc4rk+0lp4he5s+7Db0/kiXf22NPBA1gtIESleU/AitiZN2R0QuYvmp3I4hmTtZ
 nfTnSDA3/F1KE1NCpVVGbXKh
X-SBRS: 5.1
X-MesageID: 51153535
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fCnLzqFyzFcUXqC5pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153535"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 13/51] build: convert binfile use to if_changed
Date: Tue, 24 Aug 2021 11:50:00 +0100
Message-ID: <20210824105038.1257926-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow to detect command line changes and allow to regenerate
the file in that case.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - define $(cmd_binfile) in Rules.mk so we can use the same one in both
      common/ and xsm/flask/

 xen/Rules.mk           | 5 +++++
 xen/common/Makefile    | 5 +++--
 xen/xsm/flask/Makefile | 6 ++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index c313486ce0f6..f449669475bd 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -57,6 +57,11 @@ cmd_ar = rm -f $@; $(AR) cr $@ $(real-prereqs)
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
 
+# binfile
+# use e.g. $(call if_changed,binfile,binary-file varname)
+quiet_cmd_binfile = BINFILE $@
+cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
+
 define gendep
     ifneq ($(1),$(subst /,:,$(1)))
         DEPS += $(dir $(1)).$(notdir $(1)).d
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d42278..141d7d40d3dc 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -80,8 +80,9 @@ config.gz: $(CONF_FILE)
 
 config_data.o: config.gz
 
-config_data.S: $(BASEDIR)/tools/binfile
-	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
+config_data.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile,config.gz xen_config_data)
+targets += config_data.S
 
 clean::
 	rm -f config_data.S config.gz 2>/dev/null
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 637159ad8276..f4d4038c01bd 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -35,8 +35,10 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 flask-policy.o: policy.bin
 
-flask-policy.S: $(BASEDIR)/tools/binfile
-	$(SHELL) $(BASEDIR)/tools/binfile -i $@ policy.bin xsm_flask_init_policy
+flask-policy.S: BINFILE_FLAGS := -i
+flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile,policy.bin xsm_flask_init_policy)
+targets += flask-policy.S
 
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
-- 
Anthony PERARD


