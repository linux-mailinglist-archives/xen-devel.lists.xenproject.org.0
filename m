Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eXPiD/FvS2qhRQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A299E70E6BD
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="fSO/CZRV";
	dkim=pass header.d=suse.com header.s=susede1 header.b="fSO/CZRV";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355177.1609935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGd-0000rL-Na; Mon, 06 Jul 2026 09:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355177.1609935; Mon, 06 Jul 2026 09:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfGd-0000p3-Kr; Mon, 06 Jul 2026 09:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1355177;
 Mon, 06 Jul 2026 09:05:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wgfGc-0000or-5K
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:05:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfGb-00GoLn-IG
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:05:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fd4-2eae-0a2a0a5409dd-0a2a4502d16a-20
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:29 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4b6fd9-5a27-0a2a45020019-c387df828028-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:05:29 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1FB9573AB0;
 Mon,  6 Jul 2026 09:05:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E75F3779AA;
 Mon,  6 Jul 2026 09:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CqwPN9hvS2o1UAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Jul 2026 09:05:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783328729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMhrG//n6aEUC0sKej1RPG+N4bNTIaOxt0bOaUBw/9Q=;
	b=fSO/CZRVsXz5j+VsnCO9UXQPiTARjIRpKX+iT+wTa7KUdqF0IlgHrtvWYjTG9QvRRH11gN
	5jiMYGf9YdBSChcOjRL+Kqb03NGspJUnw5y6Ij71lKkmzRV/HFa0oVhjdGKLLxtUflFxP9
	ziz1wQD9eVnG1ca00SS8beMcok8RZH4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783328729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMhrG//n6aEUC0sKej1RPG+N4bNTIaOxt0bOaUBw/9Q=;
	b=fSO/CZRVsXz5j+VsnCO9UXQPiTARjIRpKX+iT+wTa7KUdqF0IlgHrtvWYjTG9QvRRH11gN
	5jiMYGf9YdBSChcOjRL+Kqb03NGspJUnw5y6Ij71lKkmzRV/HFa0oVhjdGKLLxtUflFxP9
	ziz1wQD9eVnG1ca00SS8beMcok8RZH4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] stubdom: remove c-stubdom
Date: Mon,  6 Jul 2026 11:05:20 +0200
Message-ID: <20260706090521.1992123-2-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706090521.1992123-1-jgross@suse.com>
References: <20260706090521.1992123-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
X-purgate-ID: tlsNG-720697/1783328729-558E37C5-8DF3CD1F/0/0
X-purgate-type: clean
X-purgate-size: 6016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:samuel.thibault@ens-lyon.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,citrix.com:email,xenstorepvh-minios-config.mk:url];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A299E70E6BD

C-stubdom was meant as a base for building new Mini-OS based stubdoms.
It hasn't seen any work for many years now and creating new stubdoms
should use UNIKRAFT instead of Mini-OS.

So remove c-stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 stubdom/Makefile     | 19 -------------------
 stubdom/c/Makefile   | 13 -------------
 stubdom/c/main.c     |  8 --------
 stubdom/c/minios.cfg |  2 --
 stubdom/configure    | 44 --------------------------------------------
 stubdom/configure.ac |  1 -
 6 files changed, 87 deletions(-)
 delete mode 100644 stubdom/c/Makefile
 delete mode 100644 stubdom/c/main.c
 delete mode 100644 stubdom/c/minios.cfg

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 9aa0d3dee4..acd5e56f16 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -339,17 +339,6 @@ $(TARGETS_MINIOS): mini-os-%:
                 mkdir -p $@/$$i ; \
 	done
 
-###
-# C
-###
-
-c-minios-config.mk: $(CURDIR)/c/minios.cfg
-	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
-
-.PHONY: c
-c: $(CROSS_ROOT) c-minios-config.mk
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat c-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) 
-
 ######
 # VTPM
 ######
@@ -432,10 +421,6 @@ xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
 # minios
 ########
 
-.PHONY: c-stubdom
-c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
-	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
-
 .PHONY: vtpm-stubdom
 vtpm-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpm vtpm
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/vtpm/minios.cfg" $(MAKE) -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS="$(CURDIR)/vtpm/vtpm.a" APP_LDLIBS="-ltpm -ltpm_crypto -lgmp -lpolarssl"
@@ -485,8 +470,6 @@ else
 install-grub-if-enabled:
 endif
 
-install-c: c-stubdom
-
 install-xenstore: xenstore-stubdom
 	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
 	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-xenstore/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/xenstore-stubdom.gz"
@@ -540,13 +523,11 @@ uninstall-vtpmmgr:
 .PHONY: clean
 clean: $(foreach lib,$(STUB_LIBS),clean-libxen$(lib))
 clean:
-	rm -fr mini-os-$(XEN_TARGET_ARCH)-c
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-grub
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstore
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-xenstorepvh
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpm
 	rm -fr mini-os-$(XEN_TARGET_ARCH)-vtpmmgr
-	$(MAKE) DESTDIR= -C c clean
 	$(MAKE) -C vtpm clean
 	$(MAKE) -C vtpmmgr clean
 	rm -fr grub-$(XEN_TARGET_ARCH)
diff --git a/stubdom/c/Makefile b/stubdom/c/Makefile
deleted file mode 100644
index b252dcad0b..0000000000
--- a/stubdom/c/Makefile
+++ /dev/null
@@ -1,13 +0,0 @@
-XEN_ROOT = $(CURDIR)/../..
-
-ifeq (,$(findstring clean,$(MAKECMDGOALS)))
-include $(XEN_ROOT)/Config.mk
-endif
-
-all: main.a
-
-main.a: main.o 
-	$(AR) cr $@ $^
-
-clean:
-	rm -f *.a *.o
diff --git a/stubdom/c/main.c b/stubdom/c/main.c
deleted file mode 100644
index f97a0f72d4..0000000000
--- a/stubdom/c/main.c
+++ /dev/null
@@ -1,8 +0,0 @@
-#include <stdio.h>
-#include <unistd.h>
-
-int main(void) {
-        sleep(2);
-        printf("Hello, world!\n");
-        return 0;
-}
diff --git a/stubdom/c/minios.cfg b/stubdom/c/minios.cfg
deleted file mode 100644
index 56d65510cd..0000000000
--- a/stubdom/c/minios.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_LIBC=y
-CONFIG_LWIP=y
diff --git a/stubdom/configure b/stubdom/configure
index e127ef44eb..8a0a798bd2 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -661,7 +661,6 @@ debug
 xenstorepvh
 xenstore
 grub
-c
 host_os
 host_vendor
 host_cpu
@@ -712,7 +711,6 @@ SHELL'
 ac_subst_files=''
 ac_user_opts='
 enable_option_checking
-enable_c_stubdom
 enable_pv_grub
 enable_xenstore_stubdom
 enable_xenstorepvh_stubdom
@@ -1360,7 +1358,6 @@ Optional Features:
   --disable-option-checking  ignore unrecognized --enable/--with options
   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
-  --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
   --enable-pv-grub        Build and install pv-grub (default is DISABLED)
   --disable-xenstore-stubdom
                           Build and install xenstore-stubdom (default is
@@ -2406,47 +2403,6 @@ case $host_os in *\ *) host_os=`echo "$host_os" | sed 's/ /-/g'`;; esac
 
 # Enable/disable stub domains
 
-# Check whether --enable-c-stubdom was given.
-if test ${enable_c_stubdom+y}
-then :
-  enableval=$enable_c_stubdom;
-
-if test "x$enableval" = "xyes"
-then :
-
-
-c=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS c"
-STUBDOM_BUILD="$STUBDOM_BUILD c-stubdom"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-c"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-c"
-
-
-else $as_nop
-
-if test "x$enableval" = "xno"
-then :
-
-
-c=n
-
-
-fi
-
-fi
-
-
-else $as_nop
-
-
-c=n
-
-
-fi
-
-
-
-
 # Check whether --enable-pv-grub was given.
 if test ${enable_pv_grub+y}
 then :
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index f07b08c5b3..33f170144e 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -18,7 +18,6 @@ m4_include([../m4/depends.m4])
 m4_include([../m4/fetcher.m4])
 
 # Enable/disable stub domains
-AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
 AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
 AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
-- 
2.54.0


