Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8EC48640D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253906.435216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP6-0005YM-QH; Thu, 06 Jan 2022 11:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253906.435216; Thu, 06 Jan 2022 11:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP6-0005Ww-Io; Thu, 06 Jan 2022 11:58:00 +0000
Received: by outflank-mailman (input) for mailman id 253906;
 Thu, 06 Jan 2022 11:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP4-0005UX-TC
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:57:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e25b206b-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69607212C7;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3FA9513C4A;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GIlQDkPZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:55 +0000
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
X-Inumbo-ID: e25b206b-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R3ZzVCzkcurvfIiXoJfZKNipObEjTIYIL/twAPEHmg=;
	b=GYmLaoTdv9YvOlvBOvK4jAtMwhOJg02clrHMZYqdYH2gUP1tTILJ7o37Z7FQ5HO9wAmyrg
	El4HB+u1kC1aILpOQx/jAZ086aghL5uPyYeTLbrCTIPQZUnylW1T3F8KWm0rcei1XFxUvF
	l+oBSTjAAbERdNv+A6AlQQg+WbaIGrA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 01/15] mini-os: split struct file definition from its usage
Date: Thu,  6 Jan 2022 12:57:27 +0100
Message-Id: <20220106115741.3219-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the struct file definition standalone and use it for the
declaration of the files array.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


