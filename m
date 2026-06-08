Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1v2mCaT8Jmr4pAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 19:32:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621C65944A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 19:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=hM3BXIb3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1332006.1594648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWdoh-0007WR-Dy; Mon, 08 Jun 2026 17:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332006.1594648; Mon, 08 Jun 2026 17:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWdoh-0007US-B3; Mon, 08 Jun 2026 17:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1332006;
 Mon, 08 Jun 2026 17:31:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWdof-0007T2-Ms
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:31:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWdoe-0039XG-BO
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 19:31:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a26fc4e-5cb7-0a2a0a5109dd-0a2a4505af64-22
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 19:31:12 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a26fc60-aaa8-0a2a45050019-d155802bb48b-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 19:31:12 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso53485875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 10:31:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2d2d11asm355238855e9.1.2026.06.08.10.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 10:31:10 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780939871; x=1781544671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emdv5XAKXcHLSKQQjRjcb4jErQOPpUfK6czq6IDDt94=;
        b=hM3BXIb3d7uKgVIP1HZUGWJMc4IwSBYOF27wgRnJ64XfgyqnQ6WDE7Iikm91/Qk6cn
         AeY19jelJcKkoM22NVxltP6JXTKtgrAq97SiqobG5M4DFqlw2Rvy4hne95KQOwuZIpMx
         NhLbU5WL45KU9hH6Au/LauGvlWnBQdbPUc4Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939871; x=1781544671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emdv5XAKXcHLSKQQjRjcb4jErQOPpUfK6czq6IDDt94=;
        b=hCVwxJdqyAbEHUr6qsdQ2q8Qs1As5Xy9n1PgllLm2DDYESJwvjyKk4E5Oi0B5TwRqZ
         Miul7kRT17csUmo9dk2i/s6h5RpOD6XzwAHrbJdznSgkKH0fXZ3KZVPY5cpybdhXRJI3
         ied1Jm59UqmnWhTd0WQ1r+QRDDA5N1zTavVs2NUUj7EwqPku6QoCurET8qfgD+B0tAKi
         Fatp1GlmJFiLpnEUTrr5jJWbCj1Xdne4BdxuNP5HppnDAh1J6hKa2N924lmrD4LtDYZa
         EqVnCLJKXcJPf1SEfUcRo5taFf4fAxgj9U9CdK4C81iXbiYBGpaIk/ujyTBW0uh+3zoG
         sF3Q==
X-Gm-Message-State: AOJu0Yyirhj7zEuduiEFS4AufZroccpfVsEqoNxItwvGW+hL16WyH1rn
	YN+CkUvPAUGrH+2eOvCQFvJXA894dP8ojcNZC8Rt5tHNgAuHh/x7fQzRB+c7roI7Rv76jqCktot
	No0pQ
X-Gm-Gg: Acq92OFQOW525j4i5sHlC0bpMUa/g8zL19YW+pYjhODxNczdDfZ0ysiaXGnFp5A/esC
	7IwtfgMmk/KeKQolWUia/gG7A07Pav2FlHwv7i+K6sHPrb/WElc+K+BfxxmSIDJ+XPMSwFJ90Yo
	G3zt+sqg1ZbT8ong2wyjZH9jO7lhlb59oXALxpUd1iw19m8McGi1jxacyqBg/ZJBh3ukRJ6y4NZ
	VsYhZ3rNMOc5/wojqUW3rNEJ/EJga82K0ruc/7l0amJJ1WvabsnyGu7IMREBq2i2o+rLxXW+aR4
	GVf3WRP9fM+mdQQaNEUPDCWTv3YUhZ/Byix+1QEYby4sOHsoDnLiqxE/b4mTC5JvcIOEqhPKSeK
	hMWz/RbNIBYfUlZf2a/jQrKT9FRSLax9nK6s7N05g5Snr8+WCxY/gpRPmLpTti+otzE2g16+A80
	ml9lJiSbYy5hOrNjErMImAJZp/S2u1nSSCWa/HldHmKYZXog0vEIan5h5fkWMcCNru7tETEvCja
	pn+gXthsKeA3bY=
X-Received: by 2002:a05:600c:34c7:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490c2525299mr284333175e9.0.1780939871376;
        Mon, 08 Jun 2026 10:31:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH for-4.22] xen/x86: Always strip xen.efi
Date: Mon,  8 Jun 2026 18:31:08 +0100
Message-Id: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780939872-E2790443-E7A527F3/10/73395122804
X-purgate-type: spam
X-purgate-size: 8815
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,apertussolutions.com:email,changelog.md:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7621C65944A

From: Frediano Ziglio <frediano.ziglio@citrix.com>

xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
to boot xen.efi when debugging symbols are included.

Either way, having debug symbols by default is abnormal and contrary to how
the non-EFI path works.

Produce xen-syms.efi unconditionally, just like xen-syms.  If
CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.

Some old versions of binutils ld managed to produce efi files which the
matching version of strip couldn't process.  This includes Binutils 2.26
included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
less broken toolchain.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Frediano Ziglio <frediano.ziglio@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

For 4.22.  This was posted previously as

  https://lore.kernel.org/xen-devel/20251208133945.61375-1-frediano.ziglio@citrix.com/T/#u

but merged the two patches and rewritten the commit message to make it clear
that failing to strip xen.efi is causing boot failures.

Previously xen.efi.elf was produced but it's unclear why, and unnecessaerily
different, so I've dropped it.

While this does want backporting, it can't be.  Xen 4.21 and older still build
test with Ubuntu 16.04 and choke
---
 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile | 11 ++++-------
 xen/arch/x86/arch.mk  |  7 -------
 7 files changed, 11 insertions(+), 47 deletions(-)

diff --git a/.gitignore b/.gitignore
index bfc7bdf043c3..49e2c6961768 100644
--- a/.gitignore
+++ b/.gitignore
@@ -224,6 +224,7 @@ tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
 xen/xen-syms
+xen/xen-syms.efi
 xen/xen-syms.map
 xen/xen.*
 
diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5cf19372a361..71d1e9ab8c69 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
    - The libxenguest bzImage loader now uses the system liblz4 library.
+   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
+     xen.efi is always stripped, while the symbols remain available in
+     xen-syms.efi.
 
 ### Added
  - Support for per-domain Xenstore quota in C xenstored (includes
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 8198a7f063cf..0a3fd67076fc 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). When built with debug info, the binary can be quite large.
-Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
-of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
-to any combination of options suitable to pass to `strip`, in case the default
-ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
-unless `EFI_DIR` is set in the environment to override this default. This
-binary will not be stripped in the process.
+match your system).
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..fcd3fc3d36cf 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -147,12 +147,7 @@ config DEBUG_INFO
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
 	  hypervisor via the "crash" tool.
-	  Saying Y will increase the size of the xen-syms and xen.efi
-	  binaries. In case the space on the EFI boot partition is rather
-	  limited, you may want to install a stripped variant of xen.efi in
-	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
-	  docs/misc/efi.pandoc for more information - when not using
-	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  Saying Y will increase the size of the xen-syms and xen-syms.efi
+	  binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index 1f11610b5f68..0f9b56fc399d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -493,22 +493,6 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
-# Strip
-#
-# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
-# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
-# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
-# option(s) to the strip command.
-ifdef INSTALL_EFI_STRIP
-
-ifeq ($(INSTALL_EFI_STRIP),1)
-efi-strip-opt := --strip-debug --keep-file-symbols
-else
-efi-strip-opt := $(INSTALL_EFI_STRIP)
-endif
-
-endif
-
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
-			$(if $(efi-strip-opt), \
-			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
-			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 47dd6c50fe88..01ed7302202e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -196,10 +196,7 @@ note_file_option ?= $(note_file)
 
 extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
-ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
-endif
+$(TARGET)-syms.efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
 		> $(dot-target).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0s.o
@@ -233,10 +230,10 @@ endif
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
-endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+
+$(TARGET).efi: $(TARGET)-syms.efi
+	$(STRIP) $< -o $@
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index cd0602a79aaf..199adc1a0967 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -95,13 +95,6 @@ EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long
 LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
 XEN_BUILD_PE := $(LD_PE_check_cmd)
 
-# If the above failed, it may be merely because of the linker not dealing well
-# with debug info. Try again with stripping it.
-ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
-EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(LD_PE_check_cmd)
-endif
-
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default

base-commit: 37df17d2f903503c619713eb01e488f2cb1a257f
-- 
2.39.5


