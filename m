Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D0B281DD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 16:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083512.1443107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvU7-0006Oq-Kx; Fri, 15 Aug 2025 14:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083512.1443107; Fri, 15 Aug 2025 14:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvU7-0006Mf-Gm; Fri, 15 Aug 2025 14:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1083512;
 Fri, 15 Aug 2025 14:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1umvU6-0006MZ-ON
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 14:32:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b238053a-79e4-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 16:32:40 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 307342117A;
 Fri, 15 Aug 2025 14:32:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07A0F13876;
 Fri, 15 Aug 2025 14:32:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id P8RvAAdFn2i2CAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 15 Aug 2025 14:32:39 +0000
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
X-Inumbo-ID: b238053a-79e4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755268359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KOHAGKcLsiksvIN2UqijmhF0goRfZGHcsts43BNRfMI=;
	b=EXWXHiEBEln+uzyCBuZSJQ71sQjhvd3z1P8awJItuuhJlIDmvqOT0MljuQNwXTupA7zMwH
	l07nk7AxlDexDsO8cqgWOC3w0/991Ysr+lniVGo1/DdFm1MMxwm0LPpNeW4/PT6XnPQKqi
	jwoKUcs/fwRnOvNl2UrMvdI4QW6PJYs=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755268359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KOHAGKcLsiksvIN2UqijmhF0goRfZGHcsts43BNRfMI=;
	b=EXWXHiEBEln+uzyCBuZSJQ71sQjhvd3z1P8awJItuuhJlIDmvqOT0MljuQNwXTupA7zMwH
	l07nk7AxlDexDsO8cqgWOC3w0/991Ysr+lniVGo1/DdFm1MMxwm0LPpNeW4/PT6XnPQKqi
	jwoKUcs/fwRnOvNl2UrMvdI4QW6PJYs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/xl: hide xenstore-features behind option
Date: Fri, 15 Aug 2025 16:32:36 +0200
Message-ID: <20250815143236.27641-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

In order to be able to use "xl info" before Xenstore has been started
or after it has crashed, hide obtaining the available Xenstore features
behind the new option "-x".

Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to xl info output")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl.1.pod.in     |  4 ++++
 docs/man/xl.cfg.5.pod.in |  2 +-
 tools/xl/xl_info.c       | 14 ++++++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index fe38724b2b..88ccf7ad82 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -996,6 +996,10 @@ B<OPTIONS>
 
 List host NUMA topology information
 
+=item B<-x>, B<--xenstore>
+
+Show Xenstore features available.
+
 =back
 
 =item B<top>
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index f0c920b39d..acff45d308 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -743,7 +743,7 @@ condition.
 =back
 
 The features supported by the running Xenstore instance can be retrieved
-via the B<xl info> command in dom0.
+via the B<xl info -x> command in dom0.
 
 The default value is B<0xffffffff>, meaning that all possible Xenstore
 features are visible by the guest.
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index eb019e3ee9..d3583cbf8f 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -353,7 +353,7 @@ static void output_xenstore_info(void)
     xs_close(xsh);
 }
 
-static void print_info(int numa)
+static void print_info(int numa, bool xs)
 {
     output_nodeinfo();
 
@@ -365,7 +365,8 @@ static void print_info(int numa)
     }
     output_xeninfo();
 
-    output_xenstore_info();
+    if (xs)
+        output_xenstore_info();
 
     maybe_printf("xend_config_format     : 4\n");
 
@@ -631,14 +632,19 @@ int main_info(int argc, char **argv)
     int opt;
     static struct option opts[] = {
         {"numa", 0, 0, 'n'},
+        {"xenstore", 0, 0, 'x'},
         COMMON_LONG_OPTS
     };
     int numa = 0;
+    bool xs = false;
 
-    SWITCH_FOREACH_OPT(opt, "n", opts, "info", 0) {
+    SWITCH_FOREACH_OPT(opt, "nx", opts, "info", 0) {
     case 'n':
         numa = 1;
         break;
+    case 'x':
+        xs = true;
+        break;
     }
 
     /*
@@ -648,7 +654,7 @@ int main_info(int argc, char **argv)
     if (numa == 0 && argc > optind)
         info_name = argv[optind];
 
-    print_info(numa);
+    print_info(numa, xs);
     return 0;
 }
 
-- 
2.43.0


