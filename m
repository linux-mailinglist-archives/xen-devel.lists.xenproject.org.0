Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE948640B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253911.435249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP8-0006Ak-LO; Thu, 06 Jan 2022 11:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253911.435249; Thu, 06 Jan 2022 11:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP8-00064G-Gw; Thu, 06 Jan 2022 11:58:02 +0000
Received: by outflank-mailman (input) for mailman id 253911;
 Thu, 06 Jan 2022 11:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP6-0005UX-TZ
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2cc6d54-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 366F4212CC;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0300413C4A;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOQ0O0PZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e2cc6d54-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tru95lucHl6eXrRSEYruYf0s6MYSR/EyxinHg1pggO4=;
	b=fmz1LjyfMYD45R5dtM/5FppITveTaKMBnCxcp5u+H90M+u/rLZ2qgn5y/Q1sGv+gqgantT
	zDfi7S/BqLf1DvsOm6Hs7kDtIoet8QicZZBKW/TZVHUa23mV3cjYkcGOiK/JojiXXY0VMu
	MKhmsH0TsZytENYwJWvROX3ruUOcx5g=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 05/15] mini-os: introduce a common dev pointer in struct file
Date: Thu,  6 Jan 2022 12:57:31 +0100
Message-Id: <20220106115741.3219-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many dev pointers in a union in struct file. Prepare to
switch to a single one by introducing a new common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/lib.h b/include/lib.h
index dc56f52..60aaf1c 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -188,6 +188,7 @@ struct file {
     off_t offset;
     union {
         int fd; /* Any fd from an upper layer. */
+        void *dev;
 	struct {
 	    struct evtchn_port_list ports;
 	} evtchn;
-- 
2.26.2


