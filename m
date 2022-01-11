Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFF48B0A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255894.438853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Itb-0000as-GE; Tue, 11 Jan 2022 15:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255894.438853; Tue, 11 Jan 2022 15:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Itb-0000Y7-CX; Tue, 11 Jan 2022 15:17:11 +0000
Received: by outflank-mailman (input) for mailman id 255894;
 Tue, 11 Jan 2022 15:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ip7-0002Fw-FX
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de878388-72f0-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:12:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 466151F3BA;
 Tue, 11 Jan 2022 15:12:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F80B13DDD;
 Tue, 11 Jan 2022 15:12:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JqoBlOe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:19 +0000
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
X-Inumbo-ID: de878388-72f0-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFwpD60ZcJNKwT6VpP/TNivSPE9GLBBs9qy9595IhG4=;
	b=Zl160vCEssZCDKXNooVkVMdF+ZGxizKNsTLHQIHyHoirX1qQQpo57vSIKxqXGstRXLF0FM
	4nabICwSmWFWby2PVJnme7m2SpFZJrFSM/4KnosLnIoyDCWZoToEhmpqN1jLOfs/xTUeqU
	2WRjo1La8bfIpj1bKgVtvaVaq7nswWc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 12/12] mini-os: make files array private to sys.c
Date: Tue, 11 Jan 2022 16:12:15 +0100
Message-Id: <20220111151215.22955-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no user of the files[] array outside of lib/sys.c left, so
it can be made static.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 2 --
 lib/sys.c     | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index c171fe8..80e804b 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -199,8 +199,6 @@ struct file {
     };
 };
 
-extern struct file files[];
-
 struct file *get_file_from_fd(int fd);
 int alloc_fd(unsigned int type);
 void close_all_files(void);
diff --git a/lib/sys.c b/lib/sys.c
index 0f42e97..c0cad87 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -89,7 +89,7 @@ extern void minios_evtchn_close_fd(int fd);
 extern void minios_gnttab_close_fd(int fd);
 
 pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
-struct file files[NOFILE] = {
+static struct file files[NOFILE] = {
     { .type = FTYPE_CONSOLE }, /* stdin */
     { .type = FTYPE_CONSOLE }, /* stdout */
     { .type = FTYPE_CONSOLE }, /* stderr */
-- 
2.26.2


