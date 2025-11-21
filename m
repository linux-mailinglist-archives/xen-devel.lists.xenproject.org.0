Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3FEC79487
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 14:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169203.1495020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR78-0006oU-UH; Fri, 21 Nov 2025 13:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169203.1495020; Fri, 21 Nov 2025 13:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR78-0006lc-QE; Fri, 21 Nov 2025 13:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1169203;
 Fri, 21 Nov 2025 13:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmUi=55=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vMR76-0006GA-Uj
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 13:23:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f44fd28-c6dd-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 14:23:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74F6D20FF4;
 Fri, 21 Nov 2025 13:23:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BC453EA61;
 Fri, 21 Nov 2025 13:23:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UaHHEOJnIGmrVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Nov 2025 13:23:46 +0000
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
X-Inumbo-ID: 4f44fd28-c6dd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkRKojTRFnPJl1IrQaG507FF4g4A7BM7UpW5MiCRfuo=;
	b=cqbxdF/sDjzBGE+do8eQtg0T0biRoNDx+EkW5K9m5S1AF/oung6veRtkNSIefBR6Yya/aa
	ASYuYkgWkdp+Z/rjNhqRJY2/qcOo0EA2TtsJsa07wsaYLXzskvMe13cwxiKZAl/JZYRZor
	kQpZvpKs8lcpGmxeHk3h7g7fZ8Nz4rc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="cqbxdF/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkRKojTRFnPJl1IrQaG507FF4g4A7BM7UpW5MiCRfuo=;
	b=cqbxdF/sDjzBGE+do8eQtg0T0biRoNDx+EkW5K9m5S1AF/oung6veRtkNSIefBR6Yya/aa
	ASYuYkgWkdp+Z/rjNhqRJY2/qcOo0EA2TtsJsa07wsaYLXzskvMe13cwxiKZAl/JZYRZor
	kQpZvpKs8lcpGmxeHk3h7g7fZ8Nz4rc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 2/4] docs: replace @xxx@ markers at build time
Date: Fri, 21 Nov 2025 14:23:30 +0100
Message-ID: <20251121132332.23514-3-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121132332.23514-1-jgross@suse.com>
References: <20251121132332.23514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 74F6D20FF4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Use the apply-build-vars make macro to replace the @xxx@ markers in
*.in files only at build time.

This allows to change the affected document files without having to
run "configure" for making the change effective.

While at it add the generated files to the distclean make target.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't rename source files
V3:
- rename IN_FILES to IN_TARGETS (Jan Beulich)
- add only one file to IN_TARGETS per line (Andrew Cooper)
- use $(RM) instead of rm -f (Andrew Cooper)
---
 docs/Makefile     | 11 ++++++++++-
 docs/configure    |  7 +------
 docs/configure.ac |  9 +--------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/docs/Makefile b/docs/Makefile
index 37776d303c..8e68300e3b 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -8,8 +8,14 @@ DATE		:= $(call date,"+%Y-%m-%d")
 DOC_ARCHES      := arm ppc riscv x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
 
+IN_TARGETS := man/xl-disk-configuration.5.pod
+IN_TARGETS += man/xl-network-configuration.5.pod
+IN_TARGETS += man/xl.1.pod
+IN_TARGETS += man/xl.cfg.5.pod
+IN_TARGETS += man/xl.conf.5.pod
+
 # Documentation sources to build
-MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc)))
+MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc) $(IN_TARGETS)))
 
 RST-SRC-y := $(sort $(filter-out %index.rst,$(shell find * -type f -name '*.rst' -print)))
 
@@ -77,11 +83,14 @@ clean: clean-man-pages
 distclean: clean
 	rm -rf $(XEN_ROOT)/config/Docs.mk config.log config.status config.cache \
 		autom4te.cache
+	$(RM) $(IN_TARGETS)
 
 # Top level install targets
 
 .PHONY: man-pages install-man-pages clean-man-pages uninstall-man-pages
 
+$(foreach file,$(IN_TARGETS),$(eval $(call apply-build-vars,$(file))))
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
-- 
2.51.0


