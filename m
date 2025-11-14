Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC3C5CE00
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162448.1490107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2x-00022X-FP; Fri, 14 Nov 2025 11:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162448.1490107; Fri, 14 Nov 2025 11:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2x-0001zr-BJ; Fri, 14 Nov 2025 11:32:55 +0000
Received: by outflank-mailman (input) for mailman id 1162448;
 Fri, 14 Nov 2025 11:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJs2v-0001jd-Sl
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:32:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a86a21ee-c14d-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 12:32:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ACB8D1F74A;
 Fri, 14 Nov 2025 11:32:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 892703EA61;
 Fri, 14 Nov 2025 11:32:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5m4SIGQTF2nMSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Nov 2025 11:32:52 +0000
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
X-Inumbo-ID: a86a21ee-c14d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULa01XMBOk0XUwU3HICTxucNohNobFgTxHDIYuvUKbA=;
	b=MKTEGOsMpXreL52gNLWhpzq0jTNC4vdCZOdVXzO2LOEkTEpVXEYrPcJ+4yEKaQC8hbcLev
	lds6WazYycnUjWVxI0+5g8KLzJ5wNXjs7+ppxAsLC04dgjDLFVmegMrglUwVd5v/BYVwqF
	7aTOnBo49CGSvoXkZNhGkrqdvYVgqnw=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULa01XMBOk0XUwU3HICTxucNohNobFgTxHDIYuvUKbA=;
	b=MKTEGOsMpXreL52gNLWhpzq0jTNC4vdCZOdVXzO2LOEkTEpVXEYrPcJ+4yEKaQC8hbcLev
	lds6WazYycnUjWVxI0+5g8KLzJ5wNXjs7+ppxAsLC04dgjDLFVmegMrglUwVd5v/BYVwqF
	7aTOnBo49CGSvoXkZNhGkrqdvYVgqnw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
Date: Fri, 14 Nov 2025 12:32:36 +0100
Message-ID: <20251114113238.9279-3-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114113238.9279-1-jgross@suse.com>
References: <20251114113238.9279-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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
---
 docs/Makefile     | 8 +++++++-
 docs/configure    | 7 +------
 docs/configure.ac | 9 +--------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/docs/Makefile b/docs/Makefile
index 37776d303c..e5f4a8ca86 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -8,8 +8,11 @@ DATE		:= $(call date,"+%Y-%m-%d")
 DOC_ARCHES      := arm ppc riscv x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
 
+IN_FILES := man/xl-disk-configuration.5.pod man/xl-network-configuration.5.pod
+IN_FILES += man/xl.1.pod man/xl.cfg.5.pod man/xl.conf.5.pod
+
 # Documentation sources to build
-MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc)))
+MAN-SRC-y := $(sort $(basename $(wildcard man/*.pod man/*.pandoc) $(IN_FILES)))
 
 RST-SRC-y := $(sort $(filter-out %index.rst,$(shell find * -type f -name '*.rst' -print)))
 
@@ -77,11 +80,14 @@ clean: clean-man-pages
 distclean: clean
 	rm -rf $(XEN_ROOT)/config/Docs.mk config.log config.status config.cache \
 		autom4te.cache
+	rm -f $(IN_FILES)
 
 # Top level install targets
 
 .PHONY: man-pages install-man-pages clean-man-pages uninstall-man-pages
 
+$(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
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


