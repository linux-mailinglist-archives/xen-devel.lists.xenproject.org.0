Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B34A58EE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 10:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263453.456147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEp3k-0002Xz-SB; Tue, 01 Feb 2022 09:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263453.456147; Tue, 01 Feb 2022 09:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEp3k-0002VU-Od; Tue, 01 Feb 2022 09:02:44 +0000
Received: by outflank-mailman (input) for mailman id 263453;
 Tue, 01 Feb 2022 09:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JH7e=SQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nEp3j-0002VL-Kp
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 09:02:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b68a112c-833d-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 10:02:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ACFFE1F383;
 Tue,  1 Feb 2022 09:02:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7239513D18;
 Tue,  1 Feb 2022 09:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LFiBGjH3+GGDYwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Feb 2022 09:02:41 +0000
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
X-Inumbo-ID: b68a112c-833d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643706161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m5vs36ER6Ri+BF1FUM6MMCWIEyXsaWVxNJYgwdpcovk=;
	b=k5swS/JBANgnOCvLSvxcZcxheBngpIq38q2sYUkfT3NDGG1zCZM4MDHslygdI0opsUv7xN
	a2IGscq+08Ssk8ksjdpOTDV+oy9JKfTVP30oZYq2rWVrEd1D40+vYoPkhKpQLbFzSR5V4v
	9Kpdm5/psKL69xOS8EWNL2BwQoOPEqg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: add option to disable GNTTABOP_transfer
Date: Tue,  1 Feb 2022 10:02:39 +0100
Message-Id: <20220201090239.32067-1-jgross@suse.com>
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
 docs/misc/xen-command-line.pandoc | 7 +++++--
 xen/common/grant_table.c          | 6 ++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b3da6ddc1..97ddcfa523 100644
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
 
@@ -1178,6 +1178,9 @@ version are 1 and 2.
 * `transitive` Permit or disallow the use of transitive grants.  Note that the
 use of grant table v2 without transitive grants is an ABI breakage from the
 guests point of view.
+* `transfer` Permit or disallow the GNTTABOP_transfer operation of the
+grant table hypercall.  Note that disallowing GNTTABOP_transfer is an ABI
+breakage from the guests point of view.
 
 The usage of gnttab v2 is not security supported on ARM platforms.
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ed1e2fabce..d1c225e927 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -181,6 +181,7 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
 
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
+static bool __read_mostly opt_grant_transfer = true;
 
 static int __init parse_gnttab(const char *s)
 {
@@ -204,6 +205,8 @@ static int __init parse_gnttab(const char *s)
         }
         else if ( (val = parse_boolean("transitive", s, ss)) >= 0 )
             opt_transitive_grants = val;
+        else if ( (val = parse_boolean("transfer", s, ss)) >= 0 )
+            opt_grant_transfer = val;
         else
             rc = -EINVAL;
 
@@ -2233,6 +2236,9 @@ gnttab_transfer(
     unsigned int max_bitsize;
     struct active_grant_entry *act;
 
+    if ( !opt_grant_transfer )
+        return -ENOSYS;
+
     for ( i = 0; i < count; i++ )
     {
         bool_t okay;
-- 
2.34.1


