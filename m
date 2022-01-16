Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130B748FBB3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257838.443292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yx-0002aM-5O; Sun, 16 Jan 2022 08:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257838.443292; Sun, 16 Jan 2022 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yw-0002Ef-NA; Sun, 16 Jan 2022 08:33:46 +0000
Received: by outflank-mailman (input) for mailman id 257838;
 Sun, 16 Jan 2022 08:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yq-0008IQ-VW
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd22d509-76a6-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E6C091F3B3;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCFAB1346A;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EPjeLFzY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:32 +0000
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
X-Inumbo-ID: fd22d509-76a6-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOgPnC87mBVmQF7jR57eu5ZPcD/ugF9PvO1qiNK3tw0=;
	b=HdBkVf2IlC6eWGmvrIixjb+2K/YwN1MUNDEScGcmGfxlV4b5RnkNiXoNxsQ5AZohqT2jFe
	+feJmN4FboDawfwO5jShMtHnttg1SpDpZmcS68zURnwstJxl4Smf2F8Zlp2AhoO4zFJjPi
	rDf7PtjLkmYTgBg3u82uLB3XHJHEF/w=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 12/12] make files array private to sys.c
Date: Sun, 16 Jan 2022 09:33:28 +0100
Message-Id: <20220116083328.26524-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no user of the files[] array outside of lib/sys.c left, so
it can be made static.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h | 2 --
 lib/sys.c     | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index e815e0a3..bec99646 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -175,8 +175,6 @@ struct file {
     };
 };
 
-extern struct file files[];
-
 struct file_ops {
     const char *name;
     int (*read)(struct file *file, void *buf, size_t nbytes);
diff --git a/lib/sys.c b/lib/sys.c
index 7f3dc4e4..8f8a3de2 100644
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


