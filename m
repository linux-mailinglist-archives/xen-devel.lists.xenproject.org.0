Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37064A84F0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264730.457938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbwR-0004tm-7L; Thu, 03 Feb 2022 13:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264730.457938; Thu, 03 Feb 2022 13:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbwR-0004rO-3W; Thu, 03 Feb 2022 13:14:27 +0000
Received: by outflank-mailman (input) for mailman id 264730;
 Thu, 03 Feb 2022 13:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nHU3=SS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFbwP-0004qx-Mv
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:14:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ef5f52-84f3-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 14:14:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 174241F3AF;
 Thu,  3 Feb 2022 13:14:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4A4E13BC0;
 Thu,  3 Feb 2022 13:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 09zAMi/V+2GZMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Feb 2022 13:14:23 +0000
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
X-Inumbo-ID: 28ef5f52-84f3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643894064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QuC0bG21+xDeovd2V5wjc961oxT9zXJ/CXc6pmIKuBw=;
	b=qX6gAZbcVG/zg+sloMEH8QogQ1BrDZRQJuW0fgoYRgKGRvmpL6fITr2AyfGfCAfUXKGNOV
	y6wpmc3lKP+XGtKQEU64DdchB9Y2kzuvlwHT64NKNsWsjA0vwgbuY2ptQbIEROEOluriIx
	WYN6EE2PPh8vU4E+2Grw7PiyJAoLkCE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] xen: add option to disable GNTTABOP_transfer
Date: Thu,  3 Feb 2022 14:14:17 +0100
Message-Id: <20220203131418.1319-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The grant table operation GNTTABOP_transfer is meant to be used in
PV device backends, and it hasn't been used in Linux since the old
Xen-o-Linux days.

Add a command line sub-option to the "gnttab" option for disabling the
GNTTABOP_transfer functionality.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make option available for CONFIG_PV only (Jan Beulich)
- return -EOPNOTSUPP instead of -ENOSYS (Jan Beulich)
---
 docs/misc/xen-command-line.pandoc |  8 ++++++--
 xen/common/grant_table.c          | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b3da6ddc1..44232b94c5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1167,9 +1167,9 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 Specify which console gdbstub should use. See **console**.
 
 ### gnttab
-> `= List of [ max-ver:<integer>, transitive=<bool> ]`
+> `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
-> Default: `gnttab=max-ver:2,transitive`
+> Default: `gnttab=max-ver:2,transitive,transfer`
 
 Control various aspects of the grant table behaviour available to guests.
 
@@ -1178,6 +1178,10 @@ version are 1 and 2.
 * `transitive` Permit or disallow the use of transitive grants.  Note that the
 use of grant table v2 without transitive grants is an ABI breakage from the
 guests point of view.
+* `transfer` Permit or disallow the GNTTABOP_transfer operation of the
+grant table hypercall.  Note that disallowing GNTTABOP_transfer is an ABI
+breakage from the guests point of view.  This option is only available on
+hypervisors configured to support PV guests.
 
 The usage of gnttab v2 is not security supported on ARM platforms.
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ed1e2fabce..57dfc54994 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -181,6 +181,11 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
 
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
+#ifdef CONFIG_PV
+static bool __ro_after_init opt_grant_transfer = true;
+#else
+#define opt_grant_transfer false
+#endif
 
 static int __init parse_gnttab(const char *s)
 {
@@ -204,6 +209,10 @@ static int __init parse_gnttab(const char *s)
         }
         else if ( (val = parse_boolean("transitive", s, ss)) >= 0 )
             opt_transitive_grants = val;
+#ifndef opt_grant_transfer
+        else if ( (val = parse_boolean("transfer", s, ss)) >= 0 )
+            opt_grant_transfer = val;
+#endif
         else
             rc = -EINVAL;
 
@@ -2233,6 +2242,9 @@ gnttab_transfer(
     unsigned int max_bitsize;
     struct active_grant_entry *act;
 
+    if ( !opt_grant_transfer )
+        return -EOPNOTSUPP;
+
     for ( i = 0; i < count; i++ )
     {
         bool_t okay;
-- 
2.34.1


