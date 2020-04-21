Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125F1B2BF9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVj-0005Rs-FN; Tue, 21 Apr 2020 16:12:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVi-0005RF-H0
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:34 +0000
X-Inumbo-ID: e38a2fe5-83ea-11ea-9160-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e38a2fe5-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Y4zAqD3SPAwwyAAX03cx8+4KttgfO65JfsgLeokrM8=;
 b=g5Sv/JRviSNRAH//I/7pku8dK5A4ONMLtOrLJp/JURxYqF47RoEetwx8
 cP/8kUoBzr5rEmhO7wFDNTv65BqRyUUKozhTch+UAiYwwCUMymhUqXOq+
 cYUa6uOb2VOHlxPyGGxGHclkK46pnz2lE8ajJhPckoGr9/uYwn1NUU6hJ Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iEqW7XRTwssf4VmdNrQ65MSpHXxYQaHYKFHsqXKUx5+YtZsAG2cSP1Ee+X+rh9L3qBBsMaU/Vu
 N73biyyNmvUGqmt7GG+Y2XybyxA36aIJmsO8Wm5Tq59ACIp12EAtvIsj3gFtWY0QSuqiMaTBY/
 2lG89pOIb/siMj4v6nerr9QSAgT7fcK9oVtYZYX8e93uIoAXK5dRXHBVzRTqJyQHMuQun68bJA
 Lo2LKTdXz03NzFZsghXfypfgAqUW9B9NiTg2UNitRhTdcECXyx0LTOaWqNCRzxcOTocgbt7yPk
 a1c=
X-SBRS: 2.7
X-MesageID: 16330438
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16330438"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 02/16] xen/build: include include/config/auto.conf in
 main Makefile
Date: Tue, 21 Apr 2020 17:11:54 +0100
Message-ID: <20200421161208.2429539-3-anthony.perard@citrix.com>
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

We are going to generate the CFLAGS early from "xen/Makefile" instead
of in "Rules.mk", but we need to include "config/auto.conf", so
include it in "Makefile".

Before including "config/auto.conf" we check which make target a user
is calling, as some targets don't need "auto.conf". For targets that
needs auto.conf, make will generate it (and a default .config if
missing).

root-make-done is to avoid doing the calculation again once Rules.mk
takes over and is been executed with the root Makefile. When Rules.mk
is including xen/Makefile, `config-build' and `need-config' are
undefined so auto.conf will not be included again (it is already
included by Rules.mk) and kconfig target are out of reach of Rules.mk.

We are introducing a target %config to catch all targets for kconfig.
So we need an extra target %/.config to prevent make from trying to
regenerate $(XEN_ROOT)/.config that is included in Config.mk.

The way targets are filtered is inspired by Kbuild, with some code
imported from Linux. That's why there is PHONY variable that isn't
used yet, for example.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v5:
    - move kconfig shorthand to the only file that uses it.
    
    v4:
    - check that root-make-done hasn't been set to an expected value
      instead of checking if it has been set at all.
    - Add a shorthand $(kconfig) to run kconfig targets.
    
    v3:
    - filter only for %config instead of both config %config
    - keep the multi-target pattern rule trick for include/config/auto.conf
      instead of using Linux's newer pattern (we dont have tristate.conf so
      don't need to change it)
    - use y/n for root-make-done, config-build, need-config instead of
      relying on ifdef and ifndef and on assigning an empty value meaning
      undef
    - use space for indentation
    - explain why %/.config is suddenly needed.

 xen/Makefile | 101 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 78 insertions(+), 23 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e5f7b1ae13bc..643c689658f3 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -49,7 +49,76 @@ default: build
 .PHONY: dist
 dist: install
 
-build install:: include/config/auto.conf
+
+ifneq ($(root-make-done),y)
+# section to run before calling Rules.mk, but only once.
+#
+# To make sure we do not include .config for any of the *config targets
+# catch them early, and hand them over to tools/kconfig/Makefile
+
+clean-targets := %clean
+no-dot-config-targets := $(clean-targets) \
+                         uninstall debug cloc \
+                         cscope TAGS tags MAP gtags \
+                         xenversion
+
+config-build    := n
+need-config     := y
+
+ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
+    ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
+        need-config := n
+    endif
+endif
+
+ifneq ($(filter %config,$(MAKECMDGOALS)),)
+    config-build := y
+endif
+
+export root-make-done := y
+endif # root-make-done
+
+include scripts/Kbuild.include
+
+# Shorthand for kconfig
+kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
+
+ifeq ($(config-build),y)
+# ===========================================================================
+# *config targets only - make sure prerequisites are updated, and descend
+# in tools/kconfig to make the *config target
+
+config: FORCE
+	$(MAKE) $(kconfig) $@
+
+# Config.mk tries to include .config file, don't try to remake it
+%/.config: ;
+
+%config: FORCE
+	$(MAKE) $(kconfig) $@
+
+else # !config-build
+
+ifeq ($(need-config),y)
+include include/config/auto.conf
+# Read in dependencies to all Kconfig* files, make sure to run syncconfig if
+# changes are detected.
+include include/config/auto.conf.cmd
+
+# Allow people to just run `make` as before and not force them to configure
+$(KCONFIG_CONFIG):
+	$(MAKE) $(kconfig) defconfig
+
+# The actual configuration files used during the build are stored in
+# include/generated/ and include/config/. Update them if .config is newer than
+# include/config/auto.conf (which mirrors .config).
+#
+# This exploits the 'multi-target pattern rule' trick.
+# The syncconfig should be executed only once to make all the targets.
+include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
+	$(MAKE) $(kconfig) syncconfig
+
+endif # need-config
 
 .PHONY: build install uninstall clean distclean MAP
 build install uninstall debug clean distclean MAP::
@@ -254,9 +323,6 @@ cscope:
 _MAP:
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
-.PHONY: FORCE
-FORCE:
-
 %.o %.i %.s: %.c FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C $(*D) $(@F)
 
@@ -277,25 +343,6 @@ $(foreach base,arch/x86/mm/guest_walk_% \
                arch/x86/mm/shadow/guest_%, \
     $(foreach ext,o i s,$(call build-intermediate,$(base).$(ext))))
 
-kconfig := oldconfig config menuconfig defconfig allyesconfig allnoconfig \
-	nconfig xconfig gconfig savedefconfig listnewconfig olddefconfig \
-	randconfig $(notdir $(wildcard arch/$(SRCARCH)/configs/*_defconfig))
-.PHONY: $(kconfig)
-$(kconfig):
-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" $@
-
-include/config/%.conf: include/config/auto.conf.cmd $(KCONFIG_CONFIG)
-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" syncconfig
-
-# Allow people to just run `make` as before and not force them to configure
-$(KCONFIG_CONFIG):
-	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" defconfig
-
-# Break the dependency chain for the first run
-include/config/auto.conf.cmd: ;
-
--include $(BASEDIR)/include/config/auto.conf.cmd
-
 .PHONY: cloc
 cloc:
 	$(eval tmpfile := $(shell mktemp))
@@ -307,3 +354,11 @@ cloc:
 	cloc --list-file=$(tmpfile)
 	rm $(tmpfile)
 
+endif #config-build
+
+PHONY += FORCE
+FORCE:
+
+# Declare the contents of the PHONY variable as phony.  We keep that
+# information in a variable so we can use it in if_changed and friends.
+.PHONY: $(PHONY)
-- 
Anthony PERARD


