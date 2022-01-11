Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7348B000
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255764.438381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbS-0002Ve-9Q; Tue, 11 Jan 2022 14:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255764.438381; Tue, 11 Jan 2022 14:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbS-0002PX-6A; Tue, 11 Jan 2022 14:58:26 +0000
Received: by outflank-mailman (input) for mailman id 255764;
 Tue, 11 Jan 2022 14:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IbQ-0002Oa-CQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea732dc8-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 307611F3B1;
 Tue, 11 Jan 2022 14:58:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08E741403F;
 Tue, 11 Jan 2022 14:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPr4AAyb3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:20 +0000
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
X-Inumbo-ID: ea732dc8-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+t0vHow+1jfI7LN6o5B5LYduCmgQ0IacEYiredT7b+0=;
	b=OGLo/N++S22CxpWwoigNm0n3vT4KfIh+MFOyER6HhCKV1FtpwitHHHzo+gmfes2bV425cz
	GLU3ADO3UMjXdJPokxOSOt1R7tOwm5JmnGoIBcGvDwirbibYOJz5laz4dMPqFs+3AuXmjn
	MhsqXMzy2J0gEG06o26qYSJFajXVNR8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 01/18] mini-os: split struct file definition from its usage
Date: Tue, 11 Jan 2022 15:58:00 +0100
Message-Id: <20220111145817.22170-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the struct file definition standalone and use it for the
declaration of the files array.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 39d6a18..a638bc9 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -181,7 +181,7 @@ struct evtchn_port_info {
         int bound;
 };
 
-extern struct file {
+struct file {
     enum fd_type type;
     union {
 	struct {
@@ -236,7 +236,9 @@ extern struct file {
 #endif
     };
     int read;	/* maybe available for read */
-} files[];
+};
+
+extern struct file files[];
 
 int alloc_fd(enum fd_type type);
 void close_all_files(void);
-- 
2.26.2


