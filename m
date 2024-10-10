Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC229984CA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 13:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816016.1230190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syrCz-0007y3-BV; Thu, 10 Oct 2024 11:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816016.1230190; Thu, 10 Oct 2024 11:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syrCz-0007v5-8o; Thu, 10 Oct 2024 11:19:53 +0000
Received: by outflank-mailman (input) for mailman id 816016;
 Thu, 10 Oct 2024 11:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syrCx-0007ux-FW
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 11:19:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ff27684-86f9-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 13:19:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A60121D7E;
 Thu, 10 Oct 2024 11:19:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FFAD13A6E;
 Thu, 10 Oct 2024 11:19:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DdvcGVS4B2eIKgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 10 Oct 2024 11:19:48 +0000
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
X-Inumbo-ID: 8ff27684-86f9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728559188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nEIq7GwYUVCTUGK0lDr/JTYVABBl7q7jjnz8jp44RBA=;
	b=dulR21QjCezK2FALVTbUtmxUdiwTWHiuaif1kFtSTcxD1HMBBmW6qnBkPxSNCcaR3Q05jR
	WXzcamY3ZHZvhWtrngwQQHwSzo2/I5IYVmMjn0jHEugr2ZgQHpIOgi9NTa7g9sHKQSHeUW
	o4liODM5e7RFxGRB3GX1UMG5vxfzWfo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=dulR21Qj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728559188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nEIq7GwYUVCTUGK0lDr/JTYVABBl7q7jjnz8jp44RBA=;
	b=dulR21QjCezK2FALVTbUtmxUdiwTWHiuaif1kFtSTcxD1HMBBmW6qnBkPxSNCcaR3Q05jR
	WXzcamY3ZHZvhWtrngwQQHwSzo2/I5IYVmMjn0jHEugr2ZgQHpIOgi9NTa7g9sHKQSHeUW
	o4liODM5e7RFxGRB3GX1UMG5vxfzWfo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] stubdom: add fine grained library config items to Mini-OS configs
Date: Thu, 10 Oct 2024 13:19:46 +0200
Message-ID: <20241010111946.22173-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9A60121D7E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Today Mini-OS can only be configured to use all or none Xen library.
In order to prepare a more fine grained configuration scheme, add per
library config items to the Mini-OS config files.

As some libraries pull in others, the config files need to be
extended at build time to reflect those indirect library uses.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename BUILD_config to GEN_CONFIG (Anthony PERARD)
- rename generated config files to *.gen.cfg (Anthony PERARD)
- don't write config data to file in make macro (Anthony PERARD)
- remove no longer needed $(CURDIR)/ from prerequisites (Anthony PERARD)
---
 stubdom/.gitignore |  1 +
 stubdom/Makefile   | 49 ++++++++++++++++++++++++++++++++++------------
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/stubdom/.gitignore b/stubdom/.gitignore
index 10e2547a22..23350446b9 100644
--- a/stubdom/.gitignore
+++ b/stubdom/.gitignore
@@ -1,3 +1,4 @@
+*.gen.cfg
 /*.tar.gz
 /*-minios-config.mk
 /autom4te.cache/
diff --git a/stubdom/Makefile b/stubdom/Makefile
index f8c31fd35d..6ed4253b25 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -342,6 +342,14 @@ endef
 
 $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
+define GEN_config
+ (cat $< && \
+ for i in $(sort $(APP_LIBS) $(call xenlibs-dependencies,$(APP_LIBS))); do \
+   u=`echo $$i | tr a-z A-Z`; \
+   echo "CONFIG_LIBXEN$$u=y"; \
+ done)
+endef
+
 xenstore/stamp: $(XEN_ROOT)/tools/xenstored/Makefile.common
 	$(do_links)
 
@@ -375,8 +383,12 @@ $(TARGETS_MINIOS): mini-os-%:
 # ioemu
 #######
 
-ioemu-minios-config.mk: $(CURDIR)/ioemu-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+ioemu-minios.gen.cfg: APP_LIBS = evtchn gnttab ctrl guest
+ioemu-minios.gen.cfg: ioemu-minios.cfg Makefile
+	$(GEN_config) >$@
+
+ioemu-minios-config.mk: ioemu-minios.gen.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: ioemu
 ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
@@ -437,8 +449,12 @@ grub-upstream: grub-$(GRUB_VERSION).tar.gz
 		patch -d $@ -p1 < $$i || exit 1; \
 	done
 
-grub-$(XEN_TARGET_ARCH)-minios-config.mk: $(CURDIR)/grub/minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+grub/minios.gen.cfg: APP_LIBS = guest ctrl toollog
+grub/minios.gen.cfg: grub/minios.cfg Makefile
+	$(GEN_config) >$@
+
+grub-$(XEN_TARGET_ARCH)-minios-config.mk: grub/minios.gen.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: grub
 grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-config.mk
@@ -449,8 +465,12 @@ grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-
 # xenstore
 ##########
 
-xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+xenstore-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstore-minios.gen.cfg: xenstore-minios.cfg Makefile
+	$(GEN_config) >$@
+
+xenstore-minios-config.mk: xenstore-minios.gen.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: xenstore
 xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
@@ -460,8 +480,12 @@ xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
 # xenstorepvh
 #############
 
-xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
+xenstorepvh-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
+xenstorepvh-minios.gen.cfg: xenstorepvh-minios.cfg Makefile
+	$(GEN_config) >$@
+
+xenstorepvh-minios-config.mk: xenstorepvh-minios.gen.cfg
+	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: xenstorepvh
 xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
@@ -474,7 +498,7 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
 .PHONY: ioemu-stubdom
 ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
 ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
 
 .PHONY: c-stubdom
 c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
@@ -490,7 +514,7 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
 
 .PHONY: pv-grub
 pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
 
 .PHONY: pv-grub-if-enabled
 ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
@@ -501,11 +525,11 @@ endif
 
 .PHONY: xenstore-stubdom
 xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
 
 .PHONY: xenstorepvh-stubdom
 xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh libxenguest xenstorepvh
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
+	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
 
 #########
 # install
@@ -607,6 +631,7 @@ clean:
 	rm -fr grub-$(XEN_TARGET_ARCH)
 	rm -f $(STUBDOMPATH)
 	rm -f *-minios-config.mk
+	rm -f *.gen.cfg
 	rm -fr pkg-config
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
-- 
2.43.0


