Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E99917A8
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 17:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810960.1223674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6W2-0007Zs-4a; Sat, 05 Oct 2024 15:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810960.1223674; Sat, 05 Oct 2024 15:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6W2-0007Xy-1S; Sat, 05 Oct 2024 15:16:18 +0000
Received: by outflank-mailman (input) for mailman id 810960;
 Sat, 05 Oct 2024 15:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sx6W0-0006TD-8a
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 15:16:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c384f09e-832c-11ef-a0bb-8be0dac302b0;
 Sat, 05 Oct 2024 17:16:15 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 382CC1FDDA;
 Sat,  5 Oct 2024 15:16:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DAB313A8F;
 Sat,  5 Oct 2024 15:16:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k/3hAT9YAWcBCQAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 05 Oct 2024 15:16:15 +0000
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
X-Inumbo-ID: c384f09e-832c-11ef-a0bb-8be0dac302b0
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/4] stubdom: add fine grained library config items to Mini-OS configs
Date: Sat,  5 Oct 2024 17:15:48 +0200
Message-ID: <20241005151548.29184-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005151548.29184-1-jgross@suse.com>
References: <20241005151548.29184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 382CC1FDDA
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Today Mini-OS can only be configured to use all or none Xen library.
In order to prepare a more fine grained configuration scheme, add per
library config items to the Mini-OS config files.

As some libraries pull in others, the config files need to be
extended at build time to reflect those indirect library uses.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/.gitignore |  1 +
 stubdom/Makefile   | 49 ++++++++++++++++++++++++++++++++++------------
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/stubdom/.gitignore b/stubdom/.gitignore
index 10e2547a22..c6a88467ae 100644
--- a/stubdom/.gitignore
+++ b/stubdom/.gitignore
@@ -1,3 +1,4 @@
+*.out.cfg
 /*.tar.gz
 /*-minios-config.mk
 /autom4te.cache/
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 8c503c2bf8..3b501a0710 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -340,6 +340,14 @@ endef
 
 $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
+define BUILD_config
+ cp $< $@
+ for i in $(sort $(APP_LIBS) $(call xenlibs-dependencies,$(APP_LIBS))); do \
+   u=`echo $$i | tr a-z A-Z`; \
+   echo "CONFIG_LIBXEN$$u=y"; \
+ done >> $@
+endef
+
 xenstore/stamp: $(XEN_ROOT)/tools/xenstored/Makefile.common
 	$(do_links)
 
@@ -373,8 +381,12 @@ $(TARGETS_MINIOS): mini-os-%:
 # ioemu
 #######
 
-ioemu-minios-config.mk: $(CURDIR)/ioemu-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+ioemu-minios.out.cfg: APP_LIBS = evtchn gnttab ctrl guest
+ioemu-minios.out.cfg: $(CURDIR)/ioemu-minios.cfg Makefile
+	$(BUILD_config)
+
+ioemu-minios-config.mk: ioemu-minios.out.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: ioemu
 ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
@@ -435,8 +447,12 @@ grub-upstream: grub-$(GRUB_VERSION).tar.gz
 		patch -d $@ -p1 < $$i || exit 1; \
 	done
 
-grub-$(XEN_TARGET_ARCH)-minios-config.mk: $(CURDIR)/grub/minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+grub/minios.out.cfg: APP_LIBS = guest ctrl toollog
+grub/minios.out.cfg: $(CURDIR)/grub/minios.cfg Makefile
+	$(BUILD_config)
+
+grub-$(XEN_TARGET_ARCH)-minios-config.mk: grub/minios.out.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: grub
 grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-config.mk
@@ -447,8 +463,12 @@ grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-
 # xenstore
 ##########
 
-xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+xenstore-minios.out.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstore-minios.out.cfg: $(CURDIR)/xenstore-minios.cfg Makefile
+	$(BUILD_config)
+
+xenstore-minios-config.mk: xenstore-minios.out.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: xenstore
 xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
@@ -458,8 +478,12 @@ xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
 # xenstorepvh
 #############
 
-xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+xenstorepvh-minios.out.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstorepvh-minios.out.cfg: $(CURDIR)/xenstorepvh-minios.cfg Makefile
+	$(BUILD_config)
+
+xenstorepvh-minios-config.mk: xenstorepvh-minios.out.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: xenstorepvh
 xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
@@ -472,7 +496,7 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
 .PHONY: ioemu-stubdom
 ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
 ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.out.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
 
 .PHONY: c-stubdom
 c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
@@ -488,7 +512,7 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
 
 .PHONY: pv-grub
 pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.out.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
 
 .PHONY: pv-grub-if-enabled
 ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
@@ -499,11 +523,11 @@ endif
 
 .PHONY: xenstore-stubdom
 xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.out.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
 
 .PHONY: xenstorepvh-stubdom
 xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh libxenguest xenstorepvh
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.out.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
 
 #########
 # install
@@ -605,6 +629,7 @@ clean:
 	rm -fr grub-$(XEN_TARGET_ARCH)
 	rm -f $(STUBDOMPATH)
 	rm -f *-minios-config.mk
+	rm -f *.out.cfg
 	rm -fr pkg-config
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
-- 
2.43.0


