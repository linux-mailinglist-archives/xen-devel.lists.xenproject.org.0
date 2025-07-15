Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1499B05DC1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044372.1414466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfzc-0000RI-T5; Tue, 15 Jul 2025 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044372.1414466; Tue, 15 Jul 2025 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfzc-0000OY-Oo; Tue, 15 Jul 2025 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1044372;
 Tue, 15 Jul 2025 13:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfkH-00013q-G6
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f032645e-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:30:56 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 843B721204;
 Tue, 15 Jul 2025 13:30:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55E4913A68;
 Tue, 15 Jul 2025 13:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SpCUEw9Ydmi4NwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:55 +0000
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
X-Inumbo-ID: f032645e-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRAM08+RsDuhPyXv0NnzQdGBRwKZEE1NwpnhwhZY1kI=;
	b=czyLtKC/4apootecF9icytHIoHa0Kv34P32ozcD39gFmaWi9oa7P8kVXqhtg5P/vK0WoXW
	yw8tsOZWIrBoB/Gp8LH3zGLH9HYPJLryzaEA8cXc1SePVGfZczy8NHEX/cbda23ggz3SOg
	VkDBlxcW5jJCBc9R9Cc/Yc1ovRlEAIY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ogtWD3F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRAM08+RsDuhPyXv0NnzQdGBRwKZEE1NwpnhwhZY1kI=;
	b=ogtWD3F3SCbMTuMQPElx1+pug0hrUlsNm8lu/XlSrCBsqlohAQCCl4R4pVdL/YTY8VhzWC
	NJYI4LUBwvWxUZwQ739YLAPfX0F7fCxN80DTSsXCMs9Pt6F84UwYOI0G39zjHKdi+3Sr9W
	96Eb5dF2Do1G4Dn950Cm2AKXdiz4Re0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 13/14] 9pfs: add support to keep device opened across kexec
Date: Tue, 15 Jul 2025 15:29:35 +0200
Message-ID: <20250715132936.2798-14-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 843B721204
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -3.01

In order to support Xenstore-stubdom live update, the 9pfs device used
to save and restore the Xenstore state needs to be kept open across
kexec, as otherwise re-opening of the device using the new kernel
would not work (this would require Xenstore to be active, which is
obviously not possible before having read the saved state).

Add an alternative init function for a 9pfs device supporting to take
the configuration from the kexec module instead of Xenstore. Add
support for creating the device using the kexec module, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 9pfront.c         | 120 +++++++++++++++++++++++++++++++++++++++++-----
 include/9pfront.h |   9 ++++
 include/kexec.h   |   1 +
 3 files changed, 117 insertions(+), 13 deletions(-)

diff --git a/9pfront.c b/9pfront.c
index 8da2f726..b3106d13 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -8,6 +8,7 @@
 #include <mini-os/events.h>
 #include <mini-os/fcntl.h>
 #include <mini-os/gnttab.h>
+#include <mini-os/kexec.h>
 #include <mini-os/semaphore.h>
 #include <mini-os/wait.h>
 #include <mini-os/xenbus.h>
@@ -26,6 +27,7 @@ struct dev_9pfs {
     unsigned int dom;
     char *backend;
     char bepath[64];
+    bool kexecmem;
 
     char *tag;
     const char *mnt;
@@ -58,6 +60,13 @@ struct dev_9pfs {
     unsigned long long fid_mask;              /* Bit mask for free fids. */
 };
 
+struct kexec_9pfs_rec {
+    grant_ref_t ring_ref;
+    evtchn_port_t evtchn;
+    RING_IDX prod_pvt_out;
+    RING_IDX cons_pvt_in;
+};
+
 struct file_9pfs {
     uint32_t fid;
     struct dev_9pfs *dev;
@@ -898,7 +907,7 @@ static bool path_canonical(const char *pathname)
     return true;
 }
 
-static int connect_9pfs(struct dev_9pfs *dev)
+static int connect_9pfs(struct dev_9pfs *dev, bool do_attach)
 {
     int ret;
 
@@ -906,7 +915,7 @@ static int connect_9pfs(struct dev_9pfs *dev)
     if ( ret )
         return ret;
 
-    return p9_attach(dev);
+    return do_attach ? p9_attach(dev) : 0;
 }
 
 static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
@@ -1079,6 +1088,9 @@ static int open_9pfs(struct mount_point *mnt, const char *pathname, int flags,
     return -1;
 }
 
+static int kexec_recid = -1;
+static struct dev_9pfs *kexec_dev;
+
 static void free_9pfront(struct dev_9pfs *dev)
 {
     unsigned int i;
@@ -1087,13 +1099,22 @@ static void free_9pfront(struct dev_9pfs *dev)
     {
         for ( i = 0; i < (1 << dev->ring_order); i++ )
             gnttab_end_access(dev->intf->ref[i]);
-        free_pages(dev->data.in, dev->ring_order);
+        if ( dev->kexecmem )
+            kexec_free_mod_pages(kexec_recid, (unsigned long)dev->data.in,
+                                 1 << dev->ring_order);
+        else
+            free_pages(dev->data.in, dev->ring_order);
     }
     unbind_evtchn(dev->evtchn);
     gnttab_end_access(dev->ring_ref);
-    free_page(dev->intf);
+    if ( dev->kexecmem )
+        kexec_free_mod_pages(kexec_recid, (unsigned long)dev->intf, 1);
+    else
+        free_page(dev->intf);
     free(dev->backend);
     free(dev->tag);
+    if ( dev == kexec_dev )
+        kexec_dev = NULL;
     free(dev);
 }
 
@@ -1111,7 +1132,7 @@ static bool issue_err(struct dev_9pfs *dev, char *msg, char *reason)
     return false;
 }
 
-static bool read_config_xs(struct dev_9pfs *dev)
+static bool read_config_xs(struct dev_9pfs *dev, struct kexec_9pfs_rec *rec)
 {
     char *msg;
     char *reason = "";
@@ -1121,7 +1142,9 @@ static bool read_config_xs(struct dev_9pfs *dev)
     char *v;
     void *addr;
     unsigned int i;
+    unsigned int n_pages;
     int retry = 1;
+    int err;
 
     msg = xenbus_read_unsigned(XBT_NIL, dev->nodename, "backend-id", &dev->dom);
     if ( msg )
@@ -1177,7 +1200,9 @@ static bool read_config_xs(struct dev_9pfs *dev)
         return issue_err(dev, msg, reason);
     }
 
-    dev->intf = (void *)alloc_page();
+    dev->intf = (void *)(dev->kexecmem
+                         ? kexec_alloc_mod_pages(kexec_recid, 1)
+                         : alloc_page());
     if ( !dev->intf )
     {
         reason = "couldn't allocate shared interface page";
@@ -1191,14 +1216,17 @@ static bool read_config_xs(struct dev_9pfs *dev)
         return issue_err(dev, msg, reason);
     }
     dev->intf->ring_order = dev->ring_order;
-    dev->data.in = (void *)alloc_pages(dev->ring_order);
+    n_pages = 1 << dev->ring_order;
+    dev->data.in = (void *)(dev->kexecmem
+                            ? kexec_alloc_mod_pages(kexec_recid, n_pages)
+                            : alloc_pages(dev->ring_order));
     if ( !dev->data.in )
     {
         reason = "couldn't allocate ring pages";
         return issue_err(dev, msg, reason);
     }
     dev->data.out = dev->data.in + XEN_FLEX_RING_SIZE(dev->ring_order);
-    for ( i = 0; i < (1 << dev->ring_order); i++ )
+    for ( i = 0; i < n_pages; i++ )
     {
         addr = dev->data.in + i * PAGE_SIZE;
         dev->intf->ref[i] = gnttab_grant_access(dev->dom, virt_to_mfn(addr), 0);
@@ -1256,18 +1284,65 @@ static bool read_config_xs(struct dev_9pfs *dev)
     if ( msg )
         return issue_err(dev, msg, reason);
 
+    if ( dev->kexecmem )
+    {
+        rec->ring_ref = dev->ring_ref;
+        rec->evtchn = dev->evtchn;
+        err = kexec_upd_mod_record(kexec_recid, KEXECMOD_REC_9PFS, rec,
+                                   sizeof(*rec));
+        BUG_ON(err);
+    }
+
     return true;
 }
 
-void *init_9pfront(unsigned int id, const char *mnt)
+#ifdef CONFIG_KEXEC
+static int kexec_9pfront(bool undo)
+{
+    struct kexec_9pfs_rec rec;
+
+    if ( kexec_recid < 0 || !kexec_dev || undo )
+        return 0;
+
+    kexec_read_mod_record(kexec_recid, &rec, sizeof(rec));
+    rec.prod_pvt_out = kexec_dev->prod_pvt_out;
+    rec.cons_pvt_in = kexec_dev->cons_pvt_in;
+    kexec_upd_mod_record(kexec_recid, KEXECMOD_REC_9PFS, &rec, sizeof(rec));
+
+    return 0;
+}
+kexec_call(kexec_9pfront);
+#endif
+
+static void read_config_kexec(struct dev_9pfs *dev, struct kexec_9pfs_rec *rec)
+{
+    dev->ring_ref = rec->ring_ref;
+    dev->evtchn = rec->evtchn;
+    dev->prod_pvt_out = rec->prod_pvt_out;
+    dev->cons_pvt_in = rec->cons_pvt_in;
+
+    dev->intf = gnttab_get_addr(dev->ring_ref);
+    dev->ring_order = dev->intf->ring_order;
+    dev->data.in = gnttab_get_addr(dev->intf->ref[0]);
+    dev->data.out = dev->data.in + XEN_FLEX_RING_SIZE(dev->ring_order);
+
+    bind_evtchn(dev->evtchn, intr_9pfs, dev);
+}
+
+void *init_9pfront2(unsigned int id, const char *mnt, unsigned int flags)
 {
     struct dev_9pfs *dev;
     char *reason = "";
     unsigned int i;
+    struct kexec_9pfs_rec record = { };
+    unsigned int rec_size;
 
-    printk("9pfsfront add %u, for mount at %s\n", id, mnt);
+    printk("9pfsfront add %u, for mount at %s, flags %x\n", id, mnt, flags);
     dev = malloc(sizeof(*dev));
     memset(dev, 0, sizeof(*dev));
+    dev->kexecmem = flags & (INIT9P_FLAG_KEXEC | INIT9P_FLAG_REINIT);
+    if ( dev->kexecmem )
+        kexec_dev = dev;
     snprintf(dev->nodename, sizeof(dev->nodename), "device/9pfs/%u", id);
     dev->id = id;
     init_waitqueue_head(&dev->waitq);
@@ -1282,12 +1357,25 @@ void *init_9pfront(unsigned int id, const char *mnt)
     }
     dev->free_reqs = 0;
 
-    if ( !read_config_xs(dev) )
-        goto err_out;
+    if ( !(flags & INIT9P_FLAG_REINIT) )
+    {
+        if ( dev->kexecmem )
+            kexec_recid = kexec_add_mod_record(KEXECMOD_REC_9PFS, &record,
+                                               sizeof(record));
+        if ( !read_config_xs(dev, &record) )
+            goto err_out;
+    }
+    else
+    {
+        kexec_recid = kexec_find_mod_record(0, KEXECMOD_REC_9PFS, &rec_size);
+        BUG_ON(kexec_recid < 0 || rec_size != sizeof(record));
+        kexec_read_mod_record(kexec_recid, &record, rec_size);
+        read_config_kexec(dev, &record);
+    }
 
     unmask_evtchn(dev->evtchn);
 
-    if ( connect_9pfs(dev) )
+    if ( connect_9pfs(dev, !(flags & INIT9P_FLAG_REINIT)) )
     {
         reason = "9pfs connect failed";
         goto err;
@@ -1309,6 +1397,12 @@ void *init_9pfront(unsigned int id, const char *mnt)
     free_9pfront(dev);
     return NULL;
 }
+EXPORT_SYMBOL(init_9pfront2);
+
+void *init_9pfront(unsigned int id, const char *mnt)
+{
+    return init_9pfront2(id, mnt, 0);
+}
 EXPORT_SYMBOL(init_9pfront);
 
 void shutdown_9pfront(void *dev)
diff --git a/include/9pfront.h b/include/9pfront.h
index 722ec564..a0cb5487 100644
--- a/include/9pfront.h
+++ b/include/9pfront.h
@@ -2,6 +2,15 @@
 #define __9PFRONT_H__
 
 void *init_9pfront(unsigned int id, const char *mnt);
+void *init_9pfront2(unsigned int id, const char *mnt, unsigned int flags);
+#ifdef CONFIG_KEXEC
+#define INIT9P_FLAG_REINIT 0x01      /* Reinit with data from kexec module. */
+#define INIT9P_FLAG_KEXEC  0x02      /* Use kexec module for interface. */
+#else
+#define INIT9P_FLAG_REINIT 0
+#define INIT9P_FLAG_KEXEC  0
+#endif
+
 void shutdown_9pfront(void *dev);
 
 #endif /* __9PFRONT_H__ */
diff --git a/include/kexec.h b/include/kexec.h
index 0e0b1a4d..93dd9498 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -62,6 +62,7 @@ struct kexec_module_rec {
     uint16_t offset;        /* Offset to record from start of page.          */
     uint8_t type;           /* Type of record.                               */
 #define KEXECMOD_REC_NONE   0
+#define KEXECMOD_REC_9PFS   1
     uint8_t size;           /* Size of record.                               */
 };
 
-- 
2.43.0


