Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5C7DDEC5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626340.976551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7un-0007WV-Sf; Wed, 01 Nov 2023 09:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626340.976551; Wed, 01 Nov 2023 09:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7un-0007Sq-Ph; Wed, 01 Nov 2023 09:53:33 +0000
Received: by outflank-mailman (input) for mailman id 626340;
 Wed, 01 Nov 2023 09:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7c6-0005E0-6O
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d184bd93-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 616E321835;
 Wed,  1 Nov 2023 09:34:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39BD013460;
 Wed,  1 Nov 2023 09:34:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5hiwDJUbQmXrCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:13 +0000
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
X-Inumbo-ID: d184bd93-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBtgEznE3KEIFlMuwgPzeNll8kGnCvvkfUEy+BMKjGU=;
	b=E79bkSFrWNdKh7v9dMQ/SODnwbbLirN6Q7anPPTi/s3hVHOybayJkUzdG5d2oFK5RO3e9w
	ofRxMPDgFC+NWgEminjw+/oLwOGtgZ5G9LHxorh6QEKXzAfskU4h27FdN/oC6X0Si/Ichn
	AE1oMKAM9HE1qYBZ+tQsrnMJR7Dfq88=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 08/29] tools/xenlogd: add 9pfs walk request support
Date: Wed,  1 Nov 2023 10:33:04 +0100
Message-Id: <20231101093325.30302-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the walk request of the 9pfs protocol.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenlogd/io.c      | 138 ++++++++++++++++++++++++++++++++++++++++
 tools/xenlogd/xenlogd.h |   1 +
 2 files changed, 139 insertions(+)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index fa825c9f39..778e1dc2c9 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -27,9 +27,11 @@
 #define P9_CMD_VERSION    100
 #define P9_CMD_ATTACH     104
 #define P9_CMD_ERROR      107
+#define P9_CMD_WALK       110
 
 #define P9_MIN_MSIZE      2048
 #define P9_VERSION        "9P2000.u"
+#define P9_WALK_MAXELEM   16
 
 struct p9_qid {
     uint8_t type;
@@ -523,6 +525,20 @@ static int fill_qid(const char *path, struct p9_qid *qid, struct stat *stbuf)
     return 0;
 }
 
+static bool name_ok(const char *str)
+{
+    if ( !*str )
+        return false;
+
+    if ( strchr(str, '/' ) )
+        return false;
+
+    if ( !strcmp(str, "..") || !strcmp(str, ".") )
+        return false;
+
+    return true;
+}
+
 static void p9_error(device *device, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
@@ -600,6 +616,124 @@ static void p9_attach(device *device, struct p9_header *hdr)
     fill_buffer(device, hdr->cmd + 1, hdr->tag, "Q", &qid);
 }
 
+static void p9_walk(device *device, struct p9_header *hdr)
+{
+    uint32_t fid;
+    uint32_t newfid;
+    struct p9_fid *fidp;
+    struct p9_qid *qids = NULL;
+    unsigned int n_names = 0;
+    unsigned int *names = NULL;
+    unsigned int walked = 0;
+    unsigned int i;
+    char *path = NULL;
+    unsigned int path_len;
+    int ret;
+
+    ret = fill_data(device, "UUaS", &fid, &newfid, &n_names, &names);
+    if ( n_names > P9_WALK_MAXELEM )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        goto out;
+    }
+    if ( ret != 3 + n_names )
+    {
+        p9_error(device, hdr->tag, errno);
+        goto out;
+    }
+
+    fidp = find_fid(device, fid);
+    if ( !fidp )
+    {
+        p9_error(device, hdr->tag, ENOENT);
+        goto out;
+    }
+    if ( fidp->opened )
+    {
+        p9_error(device, hdr->tag, EINVAL);
+        goto out;
+    }
+
+    path_len = strlen(fidp->path) + 1;
+    for ( i = 0; i < n_names; i++ )
+    {
+        if ( !name_ok(device->str + names[i]) )
+        {
+            p9_error(device, hdr->tag, ENOENT);
+            goto out;
+        }
+        path_len += strlen(device->str + names[i]) + 1;
+    }
+    path = calloc(path_len + 1, 1);
+    if ( !path )
+    {
+        p9_error(device, hdr->tag, ENOMEM);
+        goto out;
+    }
+    strcpy(path, fidp->path);
+
+    if ( n_names )
+    {
+        qids = calloc(n_names, sizeof(*qids));
+        if ( !qids )
+        {
+            p9_error(device, hdr->tag, ENOMEM);
+            goto out;
+        }
+        for ( i = 0; i < n_names; i++ )
+        {
+            strcat(path, "/");
+            strcat(path, device->str + names[i]);
+            ret = fill_qid(path, qids + i, NULL);
+            if ( ret )
+            {
+                if ( !walked )
+                {
+                    p9_error(device, hdr->tag, errno);
+                    goto out;
+                }
+                break;
+            }
+            walked++;
+        }
+    }
+
+    if ( walked == n_names )
+    {
+        const char *rel_path = path + strlen(device->host_path);
+        bool ok = false;
+
+        if ( fid == newfid )
+        {
+            struct p9_fid *new_fidp;
+
+            new_fidp = alloc_fid_mem(device, fid, rel_path);
+            if ( new_fidp )
+            {
+                XEN_TAILQ_REMOVE(&device->fids, fidp, list);
+                XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
+                free(fidp);
+                ok = true;
+            }
+        }
+        else
+            ok = alloc_fid(device, newfid, rel_path);
+
+        if ( !ok )
+        {
+            p9_error(device, hdr->tag, errno);
+            goto out;
+        }
+    }
+
+    fill_buffer(device, hdr->cmd + 1, hdr->tag, "aQ", &walked, qids);
+
+ out:
+    free(qids);
+    free(path);
+    free(names);
+}
+
 void *io_thread(void *arg)
 {
     device *device = arg;
@@ -663,6 +797,10 @@ void *io_thread(void *arg)
                 p9_attach(device, &hdr);
                 break;
 
+            case P9_CMD_WALK:
+                p9_walk(device, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        device->domid, device->devid, hdr.cmd);
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
index bd2a283ccb..23f013af9e 100644
--- a/tools/xenlogd/xenlogd.h
+++ b/tools/xenlogd/xenlogd.h
@@ -22,6 +22,7 @@ struct p9_header {
 struct p9_fid {
     XEN_TAILQ_ENTRY(struct p9_fid) list;
     unsigned int fid;
+    bool opened;
     char path[];
 };
 
-- 
2.35.3


