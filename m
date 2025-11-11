Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B50C4F001
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 17:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159093.1487516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6U-00031U-TA; Tue, 11 Nov 2025 16:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159093.1487516; Tue, 11 Nov 2025 16:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6U-0002y7-PW; Tue, 11 Nov 2025 16:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1159093;
 Tue, 11 Nov 2025 16:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vIr6S-00027n-RZ
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 16:20:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5136b0b8-bf1a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 17:20:20 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C285D21CE4;
 Tue, 11 Nov 2025 16:20:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94A5E14A47;
 Tue, 11 Nov 2025 16:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jYZZIENiE2ldDQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Nov 2025 16:20:19 +0000
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
X-Inumbo-ID: 5136b0b8-bf1a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+soXsd5RJ+tn6vw+rsKME/DKU3Va+AYoo0xgD3bolg=;
	b=iQu0Lniq9q9KFB5LLSufnptCv2dv0wVj/G7cbRshOi3prYanYMOKX3UuPDFPr1paEVE3HM
	oF+WE+Kze2uLABmbG2dgIpfm63yK9dDYIwOdrjFbOiXQjmpaqYgiVdh8Phdn/niSPj56BT
	jshC8s6j5hIqx/McrkbobT/d13V7prY=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+soXsd5RJ+tn6vw+rsKME/DKU3Va+AYoo0xgD3bolg=;
	b=iQu0Lniq9q9KFB5LLSufnptCv2dv0wVj/G7cbRshOi3prYanYMOKX3UuPDFPr1paEVE3HM
	oF+WE+Kze2uLABmbG2dgIpfm63yK9dDYIwOdrjFbOiXQjmpaqYgiVdh8Phdn/niSPj56BT
	jshC8s6j5hIqx/McrkbobT/d13V7prY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/5] docs: rename *.in files to *.src
Date: Tue, 11 Nov 2025 17:19:57 +0100
Message-ID: <20251111161959.13667-4-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111161959.13667-1-jgross@suse.com>
References: <20251111161959.13667-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,pod.in:url,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Rename the *.in files under docs to *.src, resulting to replace the
@...@ markers only at build time.

This allows to change the affected document files without having to
run "configure" for making the change effective.

While at it add the generated files to the distclean make target.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/Makefile                                            | 8 +++++++-
 docs/configure                                           | 7 +------
 docs/configure.ac                                        | 9 +--------
 ...guration.5.pod.in => xl-disk-configuration.5.pod.src} | 0
 ...ation.5.pod.in => xl-network-configuration.5.pod.src} | 0
 docs/man/{xl.1.pod.in => xl.1.pod.src}                   | 0
 docs/man/{xl.cfg.5.pod.in => xl.cfg.5.pod.src}           | 0
 docs/man/{xl.conf.5.pod.in => xl.conf.5.pod.src}         | 0
 8 files changed, 9 insertions(+), 15 deletions(-)
 rename docs/man/{xl-disk-configuration.5.pod.in => xl-disk-configuration.5.pod.src} (100%)
 rename docs/man/{xl-network-configuration.5.pod.in => xl-network-configuration.5.pod.src} (100%)
 rename docs/man/{xl.1.pod.in => xl.1.pod.src} (100%)
 rename docs/man/{xl.cfg.5.pod.in => xl.cfg.5.pod.src} (100%)
 rename docs/man/{xl.conf.5.pod.in => xl.conf.5.pod.src} (100%)

diff --git a/docs/Makefile b/docs/Makefile
index 37776d303c..5d7fbcb032 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -8,8 +8,10 @@ DATE		:= $(call date,"+%Y-%m-%d")
 DOC_ARCHES      := arm ppc riscv x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
 
+GEN-MAN := $(sort $(patsubst %.src,%,$(wildcard man/*.pod.src)))
+
 # Documentation sources to build
-MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc)))
+MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc) $(GEN-MAN)))
 
 RST-SRC-y := $(sort $(filter-out %index.rst,$(shell find * -type f -name '*.rst' -print)))
 
@@ -77,11 +79,15 @@ clean: clean-man-pages
 distclean: clean
 	rm -rf $(XEN_ROOT)/config/Docs.mk config.log config.status config.cache \
 		autom4te.cache
+	rm -f $(GEN-MAN)
 
 # Top level install targets
 
 .PHONY: man-pages install-man-pages clean-man-pages uninstall-man-pages
 
+man/%: man/%.src
+	$(apply-build-vars)
+
 # Metarules for generating manpages.  Run with $(1) substitued for section
 define GENERATE_MANPAGE_RULES
 
diff --git a/docs/configure b/docs/configure
index 98dda3cd0f..8871914dcb 100755
--- a/docs/configure
+++ b/docs/configure
@@ -1794,7 +1794,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Docs.mk man/xl.cfg.5.pod man/xl.1.pod man/xl-disk-configuration.5.pod man/xl-network-configuration.5.pod man/xl.conf.5.pod"
+ac_config_files="$ac_config_files ../config/Docs.mk"
 
 
 
@@ -3063,11 +3063,6 @@ for ac_config_target in $ac_config_targets
 do
   case $ac_config_target in
     "../config/Docs.mk") CONFIG_FILES="$CONFIG_FILES ../config/Docs.mk" ;;
-    "man/xl.cfg.5.pod") CONFIG_FILES="$CONFIG_FILES man/xl.cfg.5.pod" ;;
-    "man/xl.1.pod") CONFIG_FILES="$CONFIG_FILES man/xl.1.pod" ;;
-    "man/xl-disk-configuration.5.pod") CONFIG_FILES="$CONFIG_FILES man/xl-disk-configuration.5.pod" ;;
-    "man/xl-network-configuration.5.pod") CONFIG_FILES="$CONFIG_FILES man/xl-network-configuration.5.pod" ;;
-    "man/xl.conf.5.pod") CONFIG_FILES="$CONFIG_FILES man/xl.conf.5.pod" ;;
 
   *) as_fn_error $? "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
   esac
diff --git a/docs/configure.ac b/docs/configure.ac
index c2e5edd3b3..43dc516056 100644
--- a/docs/configure.ac
+++ b/docs/configure.ac
@@ -5,14 +5,7 @@ AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Documentation], m4_esyscmd([../version.sh ../xen/Makefile]),
     [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
 AC_CONFIG_SRCDIR([misc/xen-command-line.pandoc])
-AC_CONFIG_FILES([
-../config/Docs.mk
-man/xl.cfg.5.pod
-man/xl.1.pod
-man/xl-disk-configuration.5.pod
-man/xl-network-configuration.5.pod
-man/xl.conf.5.pod
-])
+AC_CONFIG_FILES([../config/Docs.mk])
 AC_CONFIG_AUX_DIR([../])
 
 # M4 Macro includes
diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.src
similarity index 100%
rename from docs/man/xl-disk-configuration.5.pod.in
rename to docs/man/xl-disk-configuration.5.pod.src
diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-network-configuration.5.pod.src
similarity index 100%
rename from docs/man/xl-network-configuration.5.pod.in
rename to docs/man/xl-network-configuration.5.pod.src
diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.src
similarity index 100%
rename from docs/man/xl.1.pod.in
rename to docs/man/xl.1.pod.src
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.src
similarity index 100%
rename from docs/man/xl.cfg.5.pod.in
rename to docs/man/xl.cfg.5.pod.src
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.src
similarity index 100%
rename from docs/man/xl.conf.5.pod.in
rename to docs/man/xl.conf.5.pod.src
-- 
2.51.0


