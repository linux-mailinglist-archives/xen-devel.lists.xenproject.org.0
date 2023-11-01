Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860037DDDF0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626146.976120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75Y-0005v0-In; Wed, 01 Nov 2023 09:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626146.976120; Wed, 01 Nov 2023 09:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75Y-0005tp-Du; Wed, 01 Nov 2023 09:00:36 +0000
Received: by outflank-mailman (input) for mailman id 626146;
 Wed, 01 Nov 2023 09:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy75X-0005dE-0p
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2e5971-7895-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:00:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7D761F6E6;
 Wed,  1 Nov 2023 09:00:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA82913460;
 Wed,  1 Nov 2023 09:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lJZCKLATQmWWeQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:00:32 +0000
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
X-Inumbo-ID: 1d2e5971-7895-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698829232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZskEOM+MiLaIPYXwEBr/N2mAl+8BJFBTXJcg57YRBlA=;
	b=iHjnHGvI3hMjv4I3xqohuwKL1+WEXhOXfLLu5ahZQ+NT2j5kw/MfTUQHQu+zNXTQGr3p8Y
	WInP6qupjkXIl2u+GbS5En6+UgxnmxOIkG3PDq+fUVS5EHHh6iv1v/D5xa+jtr1qBRqQhA
	8Qmfs/OrrXZ/UYhjugMLv7ZJWPyvoFo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] Mini-OS: make xenstore_buf externally visible
Date: Wed,  1 Nov 2023 10:00:22 +0100
Message-Id: <20231101090024.28934-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101090024.28934-1-jgross@suse.com>
References: <20231101090024.28934-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For support of the 9pfs frontend in Xenstore-stubdom xenstore_buf
needs to be externally visible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/xenbus.h | 2 ++
 xenbus.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/xenbus.h b/include/xenbus.h
index c0fc0ac5..542ee456 100644
--- a/include/xenbus.h
+++ b/include/xenbus.h
@@ -8,12 +8,14 @@ typedef unsigned long xenbus_transaction_t;
 
 #ifdef CONFIG_XENBUS
 extern uint32_t xenbus_evtchn;
+extern struct xenstore_domain_interface *xenstore_buf;
 
 /* Initialize the XenBus system. */
 void init_xenbus(void);
 void get_xenbus(void *p);
 #else
 #define xenbus_evtchn ~0
+#define xenstore_buf NULL
 
 static inline void init_xenbus(void)
 {
diff --git a/xenbus.c b/xenbus.c
index 923e8181..8bfd5bd4 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -44,7 +44,7 @@
 #define DEBUG(_f, _a...)    ((void)0)
 #endif
 
-static struct xenstore_domain_interface *xenstore_buf;
+struct xenstore_domain_interface *xenstore_buf;
 static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
 DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
 static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
-- 
2.35.3


