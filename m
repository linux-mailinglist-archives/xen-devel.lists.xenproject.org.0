Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01654A80817
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941969.1341337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28H2-00005S-6I; Tue, 08 Apr 2025 12:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941969.1341337; Tue, 08 Apr 2025 12:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28H2-0008Sv-0d; Tue, 08 Apr 2025 12:41:52 +0000
Received: by outflank-mailman (input) for mailman id 941969;
 Tue, 08 Apr 2025 12:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u28BF-0003x9-Lc
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:35:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f69963-1476-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:35:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C1B411F388;
 Tue,  8 Apr 2025 12:35:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E16713691;
 Tue,  8 Apr 2025 12:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y6V4FScY9WctIgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Apr 2025 12:35:51 +0000
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
X-Inumbo-ID: 01f69963-1476-11f0-9eaa-5ba50f476ded
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 4/6] tools: remove qemu-traditional
Date: Tue,  8 Apr 2025 14:35:22 +0200
Message-ID: <20250408123526.14613-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408123526.14613-1-jgross@suse.com>
References: <20250408123526.14613-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C1B411F388
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Remove qemu traditional from the tree.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  3 -
 CHANGELOG.md                                  |  1 +
 Config.mk                                     | 24 -----
 INSTALL                                       | 12 ---
 MAINTAINERS                                   |  4 -
 README                                        |  2 +-
 SUPPORT.md                                    | 16 ----
 config/Tools.mk.in                            |  1 -
 docs/process/branching-checklist.txt          |  1 -
 docs/process/release-technician-checklist.txt |  1 -
 stubdom/Makefile                              | 84 +----------------
 stubdom/configure                             | 89 -------------------
 stubdom/configure.ac                          | 15 ----
 stubdom/ioemu-minios.cfg                      |  6 --
 tools/Makefile                                | 58 ------------
 tools/Rules.mk                                |  3 -
 tools/config.h.in                             |  3 -
 tools/configure                               | 42 +--------
 tools/configure.ac                            | 21 +----
 19 files changed, 10 insertions(+), 376 deletions(-)
 delete mode 100644 stubdom/ioemu-minios.cfg

diff --git a/.gitignore b/.gitignore
index 53f5df0003..ccc0bebee6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -255,9 +255,6 @@ LibVNCServer*
 tools/qemu-xen-dir-remote
 tools/qemu-xen-dir
 
-tools/qemu-xen-traditional-dir-remote
-tools/qemu-xen-traditional-dir
-
 tools/firmware/seabios-dir-remote
 tools/firmware/seabios-dir
 
diff --git a/CHANGELOG.md b/CHANGELOG.md
index ce4fcf2feb..d150b9fa1b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
 
 ### Removed
+ - Support of qemu-traditional has been removed.
 
 ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
 
diff --git a/Config.mk b/Config.mk
index 8be7733d9e..d61257a286 100644
--- a/Config.mk
+++ b/Config.mk
@@ -208,22 +208,12 @@ XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
 
 # Where to look for inlined subtrees (for example, from a tarball)
 QEMU_UPSTREAM_INTREE ?= $(XEN_ROOT)/tools/qemu-xen
-QEMU_TRADITIONAL_INTREE ?= $(XEN_ROOT)/tools/qemu-xen-traditional
 
 
 # Handle legacy options
 ifneq (,$(SEABIOS_UPSTREAM_TAG))
 SEABIOS_UPSTREAM_REVISION ?= $(SEABIOS_UPSTREAM_TAG)
 endif
-ifneq (,$(QEMU_REMOTE))
-QEMU_TRADITIONAL_URL ?= $(QEMU_REMOTE)
-endif
-ifneq (,$(CONFIG_QEMU))
-QEMU_TRADITIONAL_LOC ?= $(CONFIG_QEMU)
-endif
-ifneq (,$(QEMU_TAG))
-QEMU_TRADITIONAL_REVISION ?= $(QEMU_TAG)
-endif
 
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
@@ -239,20 +229,6 @@ SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 
-
-QEMU_TRADITIONAL_URL ?= https://xenbits.xen.org/git-http/qemu-xen-traditional.git
-QEMU_TRADITIONAL_REVISION ?= 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764
-# Wed Jul 15 10:01:40 2020 +0100
-# qemu-trad: remove Xen path dependencies
-
-# Specify which qemu-dm to use. This may be `ioemu' to use the old
-# Mercurial in-tree version, or a local directory, or a git URL.
-# QEMU_UPSTREAM_LOC ?= `pwd`/$(XEN_ROOT)/../qemu-xen.git
-
-# Defaults for subtree locations
-QEMU_TRADITIONAL_LOC ?= $(call or,$(wildcard $(QEMU_TRADITIONAL_INTREE)),\
-                                  $(QEMU_TRADITIONAL_URL))
-
 QEMU_UPSTREAM_LOC ?= $(call or,$(wildcard $(QEMU_UPSTREAM_INTREE)),\
                                $(QEMU_UPSTREAM_URL))
 
diff --git a/INSTALL b/INSTALL
index 88c1464816..786e3da996 100644
--- a/INSTALL
+++ b/INSTALL
@@ -113,15 +113,6 @@ Build a private copy of SeaBIOS.
 Use the given SeaBIOS binary instead of compiling a private copy.
   --with-system-seabios=PATH
 
-Build the old qemu used by xm/xend. This is required if existing domUs
-should be migrated to this host, or if existing domU snapshots should be
-started with this version of the tools. Only if all domUs used the new
-upstream qemu during initial start it is safe to disable this option.
-The old qemu requires rombios, which can be disable along with
-qemu-traditional.
-  --enable-qemu-traditional
-  --enable-rombios
-
 The libxl toolstack uses the upstream qemu per default. A private copy
 will be built. If desired this private copy can be configured with
 additional options passed to its configure script.
@@ -245,7 +236,6 @@ locations.
 XEN_EXTFILES_URL=
 OVMF_UPSTREAM_URL=
 QEMU_UPSTREAM_URL=
-QEMU_TRADITIONAL_URL=
 SEABIOS_UPSTREAM_URL=
 MINIOS_UPSTREAM_URL=
 
@@ -253,7 +243,6 @@ Using additional CFLAGS to build tools which will run in dom0 is
 required when building distro packages. These variables can be used to
 pass RPM_OPT_FLAGS.
 EXTRA_CFLAGS_XEN_TOOLS=
-EXTRA_CFLAGS_QEMU_TRADITIONAL=
 EXTRA_CFLAGS_QEMU_XEN=
 
 Additional CFLAGS may be supplied to the build of the hypervisor by
@@ -340,7 +329,6 @@ sudo make install BOOT_DIR=/ood/path/boot EFI_DIR=/odd/path/efi
 export WGET=$(type -P false)
 export GIT=$(type -P false)
 export EXTRA_CFLAGS_XEN_TOOLS="$RPM_OPT_FLAGS"
-export EXTRA_CFLAGS_QEMU_TRADITIONAL="$RPM_OPT_FLAGS"
 export EXTRA_CFLAGS_QEMU_XEN="$RPM_OPT_FLAGS"
 %configure \
         --with-initddir=%{_initddir}
diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..7d1b3b8641 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -466,10 +466,6 @@ M:	Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
 S:	Supported
 F:	tools/python
 
-QEMU-DM
-S:	Supported
-T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
-
 QEMU UPSTREAM
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Anthony Perard <anthony.perard@vates.tech>
diff --git a/README b/README
index be90be3910..6ee58f7b35 100644
--- a/README
+++ b/README
@@ -80,7 +80,7 @@ disabled at compile time:
       libnl-3-dev, etc).  Required if network buffering is desired
       when using Remus with libxl.  See docs/README.remus for detailed
       information.
-    * 16-bit x86 assembler, loader and compiler for qemu-traditional / rombios
+    * 16-bit x86 assembler, loader and compiler for rombios
       (dev86 rpm or bin86 & bcc debs)
     * Development install of liblzma for rombios
     * Development install of libbz2, liblzma, liblzo2, and libzstd for DomU
diff --git a/SUPPORT.md b/SUPPORT.md
index e8fd0c251e..5eecf1dcbc 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -998,21 +998,6 @@ See the section **Blkback** for image formats supported by QEMU.
 
     Status: Supported, not security supported
 
-### qemu-xen-traditional ###
-
-The Xen Project provides an old version of qemu with modifications
-which enable use as a device model stub domain.  The old version is
-normally selected by default only in a stub dm configuration, but it
-can be requested explicitly in other configurations, for example in
-`xl` with `device_model_version="QEMU_XEN_TRADITIONAL"`.
-
-    Status, Device Model Stub Domains: Supported, with caveats
-    Status, as host process device model: No security support, not recommended
-
-qemu-xen-traditional is security supported only for those available
-devices which are supported for mainstream QEMU (see above), with
-trusted driver domains (see Device Model Stub Domains).
-
 ## Virtual Firmware
 
 ### x86/HVM iPXE
@@ -1031,7 +1016,6 @@ as the guest itself.
 Booting a guest via guest BIOS firmware
 
     Status, SeaBIOS (qemu-xen): Supported
-    Status, ROMBIOS (qemu-xen-traditional): Supported
 
 ### x86/HVM OVMF
 
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 37c071961e..463ab75965 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -43,7 +43,6 @@ CONFIG_OVMF         := @ovmf@
 CONFIG_ROMBIOS      := @rombios@
 CONFIG_SEABIOS      := @seabios@
 CONFIG_IPXE         := @ipxe@
-CONFIG_QEMU_TRAD    := @qemu_traditional@
 CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index aa7a27eed5..9632888a56 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -71,7 +71,6 @@ ov=4.0
 Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
 The variables and there content should be:
   * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
-  * QEMU_TRADITIONAL_REVISION: xen-X.Y.0
   * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
 Where X.Y is the release version (e.g. 4.17).
 
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 829e8ec47b..64ed9fd5b2 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -56,7 +56,6 @@ t=RELEASE-$r
 
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
-#   QEMU_TRADITIONAL_REVISION
 #   MINIOS_UPSTREAM_REVISION
 #     (drop any references to the specific commits, e.g. date or title)
 * change SUPPORT.md heading version number; -unstable or -rc tag
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 724ce40365..82fc1e90f8 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -7,7 +7,6 @@ export PKG_CONFIG_DIR = $(CURDIR)/pkg-config
 
 # Remove flags which are meant for tools, e.g. "-m64"
 export EXTRA_CFLAGS_XEN_TOOLS=
-export EXTRA_CFLAGS_QEMU_TRADITIONAL=
 
 export stubdom=y
 export debug=y
@@ -267,43 +266,6 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 .PHONY: $(CROSS_ROOT)
 $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
 
-QEMU_ROOT := $(shell if [ -d "$(QEMU_TRADITIONAL_LOC)" ]; then echo "$(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
-
-ifneq ($(filter ioemu,$(STUBDOM_TARGETS)),)
-IOEMU_LINKFARM_TARGET := ioemu/linkfarm.stamp
-endif
-
-ifeq ($(QEMU_ROOT),.)
-$(XEN_ROOT)/tools/qemu-xen-traditional-dir:
-	$(MAKE) DESTDIR= -C $(XEN_ROOT)/tools qemu-xen-traditional-dir-find
-
-ioemu/linkfarm.stamp: $(XEN_ROOT)/tools/qemu-xen-traditional-dir
-	mkdir -p ioemu
-	set -e;									\
-	$(buildmakevars2shellvars);						\
-	cd ioemu;								\
-	src="$$XEN_ROOT/tools/qemu-xen-traditional-dir"; export src;		\
-	(cd $$src && find * -type d						\
-		$(addprefix ! -path , '*-softmmu*' '*-linux-user*') -print)	\
-		| xargs mkdir -p;						\
-	(cd $$src && find *	! -type l  -type f  $(addprefix ! -path ,	\
-			'*.[oda1]' 'config-*' config.mak qemu-dm qemu-img-xen	\
-			'*.html' '*.pod' '*-softmmu*' '*-linux-user*'		\
-			)) >linkfarm.stamp.tmp;				\
-	cmp -s linkfarm.stamp.tmp linkfarm.stamp &&			\
-		rm linkfarm.stamp.tmp || {				\
-		mv linkfarm.stamp.tmp linkfarm.stamp;			\
-		cat linkfarm.stamp | while read f;			\
-			do rm -f "$$f"; ln -s "$$src/$$f" "$$f"; done;	\
-	}
-else
-export QEMU_ROOT
-
-ioemu/linkfarm.stamp:
-	mkdir -p ioemu
-	touch ioemu/linkfarm.stamp
-endif
-
 #######
 # libraries under tools/libs
 #######
@@ -380,29 +342,6 @@ $(TARGETS_MINIOS): mini-os-%:
                 mkdir -p $@/$$i ; \
 	done
 
-#######
-# ioemu
-#######
-
-ioemu-minios.gen.cfg: APP_LIBS = evtchn gnttab ctrl guest
-ioemu-minios.gen.cfg: ioemu-minios.cfg Makefile
-	$(GEN_config) >$@
-
-ioemu-minios-config.mk: ioemu-minios.gen.cfg
-	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
-
-.PHONY: ioemu
-ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
-	[ -f ioemu/config-host.mak ] || \
-	  ( $(buildmakevars2shellvars); \
-	    cd ioemu ; \
-	    LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) \
-	    TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat ioemu-minios-config.mk)" \
-	    TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-	    TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
-	    $(QEMU_ROOT)/xen-setup-stubdom )
-	$(MAKE) DESTDIR= -C ioemu -f $(QEMU_ROOT)/Makefile
-
 ###
 # C
 ###
@@ -496,11 +435,6 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
 # minios
 ########
 
-.PHONY: ioemu-stubdom
-ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
-ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
-
 .PHONY: c-stubdom
 c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
@@ -544,13 +478,6 @@ else
 install: $(STUBDOMPATH)
 endif
 
-install-ioemu: ioemu-stubdom
-	$(INSTALL_DIR) "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_PROG) stubdom-dm "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_DATA) stubdompath.sh "$(DESTDIR)$(LIBEXEC_BIN)"
-	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
-	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-ioemu/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz"
-
 install-grub: pv-grub
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz"
@@ -593,11 +520,6 @@ else
 uninstall:
 endif
 
-uninstall-ioemu:
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/stubdom-dm
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/stubdompath.sh
-	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/ioemu-stubdom.gz
-
 uninstall-grub:
 	rm -f $(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz
 
@@ -617,11 +539,10 @@ uninstall-vtpmmgr:
 # clean
 #######
 
-# Only clean the libxc/ioemu/mini-os part
+# Only clean the libxc/mini-os part
 .PHONY: clean
 clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
 clean:
-	rm -fr mini-os-$(XEN_TARGET_ARCH)-ioemu
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
@@ -636,7 +557,6 @@ clean:
 	rm -f *-minios-config.mk
 	rm -f *.gen.cfg
 	rm -fr pkg-config
-	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
 	-[ ! -d xenstorepvh ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh clean
 
@@ -647,7 +567,7 @@ crossclean: clean
 	rm -fr newlib-$(XEN_TARGET_ARCH)
 	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
-	rm -fr ioemu xenstore xenstorepvh
+	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
 	rm -fr polarssl-$(XEN_TARGET_ARCH)
 	rm -fr tpm_emulator-$(XEN_TARGET_ARCH)
diff --git a/stubdom/configure b/stubdom/configure
index 08cacf764c..9dd0e7c796 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -622,7 +622,6 @@ STUBDOM_UNINSTALL
 STUBDOM_INSTALL
 STUBDOM_BUILD
 STUBDOM_TARGETS
-ioemu
 vtpmmgr
 vtpm
 TPMEMU_VERSION
@@ -713,14 +712,12 @@ SHELL'
 ac_subst_files=''
 ac_user_opts='
 enable_option_checking
-enable_ioemu_stubdom
 enable_c_stubdom
 enable_pv_grub
 enable_xenstore_stubdom
 enable_xenstorepvh_stubdom
 enable_vtpm_stubdom
 enable_vtpmmgr_stubdom
-enable_qemu_traditional
 enable_debug
 enable_extfiles
 '
@@ -1363,7 +1360,6 @@ Optional Features:
   --disable-option-checking  ignore unrecognized --enable/--with options
   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
-  --enable-ioemu-stubdom  Build and install ioemu-stubdom
   --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
   --enable-pv-grub        Build and install pv-grub (default is DISABLED)
   --disable-xenstore-stubdom
@@ -1375,7 +1371,6 @@ Optional Features:
   --enable-vtpm-stubdom   Build and install vtpm-stubdom
   --enable-vtpmmgr-stubdom
                           Build and install vtpmmgr-stubdom
-
   --disable-debug         Disable debug build of stubdom (default is ENABLED)
   --disable-extfiles      Use xen extfiles repository for libraries (default
                           is ENABLED)
@@ -2411,40 +2406,6 @@ case $host_os in *\ *) host_os=`echo "$host_os" | sed 's/ /-/g'`;; esac
 
 # Enable/disable stub domains
 
-# Check whether --enable-ioemu-stubdom was given.
-if test ${enable_ioemu_stubdom+y}
-then :
-  enableval=$enable_ioemu_stubdom;
-
-if test "x$enableval" = "xyes"
-then :
-
-
-ioemu=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS ioemu"
-STUBDOM_BUILD="$STUBDOM_BUILD ioemu-stubdom"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-ioemu"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-ioemu"
-
-
-else $as_nop
-
-if test "x$enableval" = "xno"
-then :
-
-
-ioemu=n
-
-
-fi
-
-fi
-
-
-fi
-
-
-
 # Check whether --enable-c-stubdom was given.
 if test ${enable_c_stubdom+y}
 then :
@@ -2685,35 +2646,6 @@ fi
 
 
 
-# Check whether --enable-qemu-traditional was given.
-if test ${enable_qemu_traditional+y}
-then :
-  enableval=$enable_qemu_traditional;
-fi
-
-if test "x$enable_qemu_traditional" = "xyes"
-then :
-
-    qemu_traditional=y
-else $as_nop
-
-    qemu_traditional=n
-
-fi
-if test "x$ioemu" = "x"
-then :
-
-    ioemu=$qemu_traditional
-
-fi
-echo "x$ioemu$qemu_traditional"
-if test "x$ioemu$qemu_traditional" = "xyn"
-then :
-
-    as_fn_error $? "IOEMU stubdomain requires qemu-traditional" "$LINENO" 5
-
-fi
-
 
 # Check whether --enable-debug was given.
 if test ${enable_debug+y}
@@ -4358,27 +4290,6 @@ fi
 
 
 
-if test "x$ioemu" = "xy" || test "x$ioemu" = "x"
-then :
-
-
-ioemu=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS ioemu"
-STUBDOM_BUILD="$STUBDOM_BUILD ioemu-stubdom"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-ioemu"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-ioemu"
-
-
-else $as_nop
-
-
-ioemu=n
-
-
-fi
-
-
-
 
 
 
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index fc736c0387..f07b08c5b3 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -18,7 +18,6 @@ m4_include([../m4/depends.m4])
 m4_include([../m4/fetcher.m4])
 
 # Enable/disable stub domains
-AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
 AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
 AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
@@ -26,19 +25,6 @@ AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
 AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
 
-AC_ARG_ENABLE([qemu-traditional])
-AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
-    qemu_traditional=y],[
-    qemu_traditional=n
-])
-AS_IF([test "x$ioemu" = "x"], [
-    ioemu=$qemu_traditional
-])
-echo "x$ioemu$qemu_traditional"
-AS_IF([test "x$ioemu$qemu_traditional" = "xyn"], [
-    AC_MSG_ERROR(IOEMU stubdomain requires qemu-traditional)
-])
-
 AX_ARG_DEFAULT_ENABLE([debug], [Disable debug build of stubdom])
 AX_ARG_DEFAULT_ENABLE([extfiles], [Use xen extfiles repository for libraries])
 
@@ -69,7 +55,6 @@ AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
 #Conditionally enable these stubdoms based on the presense of dependencies
 AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
-AX_STUBDOM_CONDITIONAL_FINISH([ioemu-stubdom], [ioemu])
 
 AX_STUBDOM_FINISH
 AC_OUTPUT()
diff --git a/stubdom/ioemu-minios.cfg b/stubdom/ioemu-minios.cfg
deleted file mode 100644
index 6153ae05f8..0000000000
--- a/stubdom/ioemu-minios.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-CONFIG_LIBC=y
-CONFIG_LWIP=y
-CONFIG_START_NETWORK=n
-CONFIG_QEMU_XS_ARGS=y
-CONFIG_PCIFRONT=y
-XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/tools/Makefile b/tools/Makefile
index e9e1cda305..6ecf7c0da8 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -24,7 +24,6 @@ SUBDIRS-$(CONFIG_Linux) += vchan
 
 # do not recurse in to a dir we are about to delete
 ifneq "$(MAKECMDGOALS)" "distclean"
-SUBDIRS-$(CONFIG_QEMU_TRAD) += qemu-xen-traditional-dir
 SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir
 endif
 
@@ -79,7 +78,6 @@ clean: subdirs-clean
 
 .PHONY: distclean
 distclean: subdirs-distclean clean
-	rm -rf qemu-xen-traditional-dir qemu-xen-traditional-dir-remote
 	rm -rf qemu-xen-dir qemu-xen-dir-remote qemu-xen-build
 	rm -rf ../config/Tools.mk config.h config.log config.status \
 		config.cache autom4te.cache
@@ -97,11 +95,6 @@ QEMU_UPSTREAM_RPATH := -Wl,-rpath,$(LIBEXEC_LIB)
 IOEMU_EXTRA_LDFLAGS :=
 endif
 
-QEMU_ROOT := $(shell if [ -d "$(QEMU_TRADITIONAL_LOC)" ]; then echo "$(QEMU_TRADITIONAL_LOC)"; else echo .; fi)
-ifneq ($(QEMU_ROOT),.)
-export QEMU_ROOT
-endif
-
 # Targets for external trees:
 #  ${target}-dir-find
 #    See if the directory exists and check it out if not.
@@ -136,54 +129,6 @@ endif
 #   ${TARGET}_LOC
 #     The ultimate location of the source (either a local dir or remote URL)
 
-# External target: qemu-xen-traditional
-qemu-xen-traditional-dir-find:
-	set -ex; \
-	if test -d $(QEMU_TRADITIONAL_LOC); then \
-		mkdir -p qemu-xen-traditional-dir; \
-	else \
-		export GIT=$(GIT); \
-		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_TRADITIONAL_LOC) $(QEMU_TRADITIONAL_REVISION) qemu-xen-traditional-dir; \
-	fi
-
-.PHONY: qemu-xen-traditional-dir-force-update
-qemu-xen-traditional-dir-force-update: qemu-xen-traditional-dir-find
-	set -ex; \
-	if [ "$(QEMU_TRADITIONAL_REVISION)" ]; then \
-		cd qemu-xen-traditional-dir-remote; \
-		$(GIT) fetch origin; \
-		$(GIT) reset --hard $(QEMU_TRADITIONAL_REVISION); \
-	fi
-
-qemu-traditional-recurse = \
-	set -e; \
-		$(buildmakevars2shellvars); \
-		export CONFIG_BLKTAP1=n; \
-		export BUILDING_QEMU_TRAD=y; \
-		cd qemu-xen-traditional-dir; \
-		$(1)
-
-subdir-all-qemu-xen-traditional-dir: qemu-xen-traditional-dir-find
-	$(call qemu-traditional-recurse,\
-		$(QEMU_ROOT)/xen-setup \
-		--extra-cflags="-D__XEN_TOOLS__ $(EXTRA_CFLAGS_QEMU_TRADITIONAL)" \
-		$(IOEMU_EXTRA_LDFLAGS) \
-		--cpu=$(IOEMU_CPU_ARCH) \
-		$(IOEMU_CONFIGURE_CROSS); \
-		$(MAKE) all \
-	)
-
-subdir-install-qemu-xen-traditional-dir: subdir-all-qemu-xen-traditional-dir
-	$(call qemu-traditional-recurse,$(MAKE) install)
-
-subdir-clean-qemu-xen-traditional-dir:
-	set -e; if test -d qemu-xen-traditional-dir/.; then \
-		$(MAKE) -C qemu-xen-traditional-dir clean; \
-	fi
-subdir-uninstall-qemu-xen-traditional-dir:
-	rm -f $(D)$(bindir)/qemu-nbd*
-	rm -f $(D)$(bindir)/qemu-img*
-
 # External target: qemu-xen
 qemu-xen-dir-find:
 	if test -d $(QEMU_UPSTREAM_LOC) ; then \
@@ -276,9 +221,6 @@ subtree-force-update:
 ifeq ($(CONFIG_QEMU_XEN),y)
 	$(MAKE) qemu-xen-dir-force-update
 endif
-ifeq ($(CONFIG_QEMU_TRAD),y)
-	$(MAKE) qemu-xen-traditional-dir-force-update
-endif
 ifeq ($(CONFIG_X86),y)
 	$(MAKE) -C firmware subtree-force-update
 endif
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6bd636709f..725c3c32e9 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -134,12 +134,9 @@ endif
 
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
 
-# Don't add -Werror if we are used by qemu-trad build system.
-ifndef BUILDING_QEMU_TRAD
 ifeq ($(CONFIG_WERROR),y)
 CFLAGS += -Werror
 endif
-endif
 
 ifeq ($(debug),y)
 # Use -Og if available, -O0 otherwise
diff --git a/tools/config.h.in b/tools/config.h.in
index 0bab3cb136..fe2a94cfc4 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -42,9 +42,6 @@
 /* pygrub enabled */
 #undef HAVE_PYGRUB
 
-/* Qemu traditional enabled */
-#undef HAVE_QEMU_TRADITIONAL
-
 /* ROMBIOS enabled */
 #undef HAVE_ROMBIOS
 
diff --git a/tools/configure b/tools/configure
index e1f6ea6bf5..27ae7c52fb 100755
--- a/tools/configure
+++ b/tools/configure
@@ -726,7 +726,6 @@ BCC
 LD86
 AS86
 ipxe
-qemu_traditional
 LINUX_BACKEND_MODULES
 pygrub
 golang
@@ -835,7 +834,6 @@ enable_seabios
 enable_golang
 enable_pygrub
 with_linux_backend_modules
-enable_qemu_traditional
 enable_ipxe
 with_system_ipxe
 enable_rombios
@@ -1518,13 +1516,10 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --disable-pygrub        Disable pygrub (default is ENABLED)
-  --enable-qemu-traditional
-                          Enable qemu traditional device model, (DEFAULT is
-                          off)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also
                           --with-system-ipxe)
-  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
-                          or ipxe is enabled, otherwise off)
+  --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enabled,
+                          otherwise off)
   --enable-libfsimage     Enable libfsimage, (DEFAULT is on if pygrub is
                           enabled, otherwise off)
   --enable-systemd        Enable systemd support (default is DISABLED)
@@ -4838,45 +4833,16 @@ fi
 LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
 
 
-# Check whether --enable-qemu-traditional was given.
-if test ${enable_qemu_traditional+y}
-then :
-  enableval=$enable_qemu_traditional;
-fi
-
-if test "x$enable_qemu_traditional" = "xyes"
-then :
-
-
-printf "%s\n" "#define HAVE_QEMU_TRADITIONAL 1" >>confdefs.h
-
-    qemu_traditional=y
-else $as_nop
-
-    qemu_traditional=n
-
-fi
-
-
 # Check whether --enable-ipxe was given.
 if test ${enable_ipxe+y}
 then :
   enableval=$enable_ipxe;
-else $as_nop
-
-    if test "x$enable_qemu_traditional" = "xyes"
-then :
-
-        enable_ipxe="yes"
-
 else $as_nop
 
         enable_ipxe="no"
 
 fi
 
-fi
-
 if test "x$enable_ipxe" = "xno"
 then :
   ipxe=n
@@ -4912,7 +4878,7 @@ then :
   enableval=$enable_rombios;
 else $as_nop
 
-    if test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"
+    if test "x$enable_ipxe" = "xyes"
 then :
 
         enable_rombios="yes"
@@ -4928,7 +4894,7 @@ fi
 if test "x$enable_rombios" = "xyes"
 then :
 
-                # Extract the first word of "as86", so it can be a program name with args.
+    # Extract the first word of "as86", so it can be a program name with args.
 set dummy as86; ac_word=$2
 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 printf %s "checking for $ac_word... " >&6; }
diff --git a/tools/configure.ac b/tools/configure.ac
index 0dd6d747ab..dada1c3b15 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -121,25 +121,11 @@ esac])
 LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
 AC_SUBST(LINUX_BACKEND_MODULES)
 
-AC_ARG_ENABLE([qemu-traditional],
-    AS_HELP_STRING([--enable-qemu-traditional],
-                   [Enable qemu traditional device model, (DEFAULT is off)]))
-AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
-AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
-    qemu_traditional=y],[
-    qemu_traditional=n
-])
-AC_SUBST(qemu_traditional)
-
 AC_ARG_ENABLE([ipxe],
     AS_HELP_STRING([--enable-ipxe],
                    [Enable in-tree IPXE,
                     (DEFAULT is off, see also --with-system-ipxe)]),,[
-    AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
-        enable_ipxe="yes"
-    ], [
         enable_ipxe="no"
-    ])
 ])
 AS_IF([test "x$enable_ipxe" = "xno"], [ipxe=n], [ipxe=y])
 AC_ARG_WITH([system-ipxe],
@@ -162,18 +148,15 @@ AC_SUBST(ipxe)
 
 AC_ARG_ENABLE([rombios],
     AS_HELP_STRING([--enable-rombios],
-                   [Enable ROMBIOS, (DEFAULT is on if qemu-traditional or ipxe is enabled,
+                   [Enable ROMBIOS, (DEFAULT is on if ipxe is enabled,
                     otherwise off)]),,[
-    AS_IF([test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"], [
+    AS_IF([test "x$enable_ipxe" = "xyes"], [
         enable_rombios="yes"
     ], [
         enable_rombios="no"
     ])
 ])
 AS_IF([test "x$enable_rombios" = "xyes"], [
-    dnl as86, ld86, and bcc are only required when building rombios. They
-    dnl are only needed when the host system is x86 but that check is done
-    dnl for us above when checking if we should build with qemu-traditional.
     AX_PATH_PROG_OR_FAIL([AS86], [as86])
     AX_PATH_PROG_OR_FAIL([LD86], [ld86])
     AX_PATH_PROG_OR_FAIL([BCC], [bcc])
-- 
2.43.0


