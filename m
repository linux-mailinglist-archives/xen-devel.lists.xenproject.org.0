Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E77691D56
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 11:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493298.763197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQR3j-0002oc-3r; Fri, 10 Feb 2023 10:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493298.763197; Fri, 10 Feb 2023 10:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQR3i-0002lY-Tq; Fri, 10 Feb 2023 10:55:14 +0000
Received: by outflank-mailman (input) for mailman id 493298;
 Fri, 10 Feb 2023 10:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9hqk=6G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQQvn-000617-VA
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 10:47:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e9e5fb6-a930-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 11:46:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 286413FEC5;
 Fri, 10 Feb 2023 10:46:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC1231325E;
 Fri, 10 Feb 2023 10:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t2tDOKIg5mMAVAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Feb 2023 10:46:58 +0000
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
X-Inumbo-ID: 3e9e5fb6-a930-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676026019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AjLtvshfjPJLxhGdXS+IgJVdKslWSTSlXSgC0tGAfD0=;
	b=NOT/uNDL/q3Nh9a1C32Rlo3B2Dyw3tSWtTow1koZyC/xfTeUU+zab4gzRWdQhPxW9MhA9h
	JfGEdoK2tm+/YaKjFmY6K14mBmlYXzsL0TURz4/IZFuIN9MwZKHFno9uQvLBOGAmFeIgi1
	Ar1vr/wksJI1o4ekhjZl3Nyo8Kk0hYk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/7] Mini-OS: add 9pfs transport layer
Date: Fri, 10 Feb 2023 11:46:26 +0100
Message-Id: <20230210104628.14374-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230210104628.14374-1-jgross@suse.com>
References: <20230210104628.14374-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the transport layer of 9pfs. This is basically the infrastructure
to send requests to the backend and to receive the related answers via
the rings.

As a first example add the version and attach requests of the 9pfs
protocol when mounting a new 9pfs device. For the version use the
"9P2000.u" variant, as it is the smallest subset supported by the qemu
based backend.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add more comments (Samuel Thibault)
- log short copy (Samuel Thibault)
- send event after consuming response (Samuel Thibault)
- reaturn EAGAIN in case no free request could be got (Samuel Thibault)
---
 9pfront.c | 478 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 478 insertions(+)

diff --git a/9pfront.c b/9pfront.c
index 89ecb3a1..0b8d5461 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -7,6 +7,8 @@
 #include <mini-os/lib.h>
 #include <mini-os/events.h>
 #include <mini-os/gnttab.h>
+#include <mini-os/semaphore.h>
+#include <mini-os/wait.h>
 #include <mini-os/xenbus.h>
 #include <mini-os/xmalloc.h>
 #include <errno.h>
@@ -14,6 +16,9 @@
 #include <mini-os/9pfront.h>
 
 #ifdef HAVE_LIBC
+
+#define N_REQS   64
+
 struct dev_9pfs {
     int id;
     char nodename[20];
@@ -22,6 +27,7 @@ struct dev_9pfs {
 
     char *tag;
     const char *mnt;
+    unsigned int msize_max;
 
     struct xen_9pfs_data_intf *intf;
     struct xen_9pfs_data data;
@@ -32,14 +38,470 @@ struct dev_9pfs {
     evtchn_port_t evtchn;
     unsigned int ring_order;
     xenbus_event_queue events;
+
+    unsigned int free_reqs;
+    struct req {
+        unsigned int id;
+        unsigned int next_free;     /* N_REQS == end of list. */
+        unsigned int cmd;
+        int result;
+        bool inflight;
+        unsigned char *data;        /* Returned data. */
+    } req[N_REQS];
+
+    struct wait_queue_head waitq;
+    struct semaphore ring_out_sem;
+    struct semaphore ring_in_sem;
 };
 
 #define DEFAULT_9PFS_RING_ORDER  4
 
+#define P9_CMD_VERSION    100
+#define P9_CMD_ATTACH     104
+#define P9_CMD_ERROR      107
+
+#define P9_QID_SIZE    13
+
+struct p9_header {
+    uint32_t size;
+    uint8_t cmd;
+    uint16_t tag;
+} __attribute__((packed));
+
+#define P9_VERSION        "9P2000.u"
+#define P9_ROOT_FID       ~0
+
 static unsigned int ftype_9pfs;
 
+static struct req *get_free_req(struct dev_9pfs *dev)
+{
+    struct req *req;
+
+    if ( dev->free_reqs == N_REQS )
+        return NULL;
+
+    req = dev->req + dev->free_reqs;
+    dev->free_reqs = req->next_free;
+
+    return req;
+}
+
+static void put_free_req(struct dev_9pfs *dev, struct req *req)
+{
+    req->next_free = dev->free_reqs;
+    req->inflight = false;
+    req->data = NULL;
+    dev->free_reqs = req->id;
+}
+
+static unsigned int ring_out_free(struct dev_9pfs *dev)
+{
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(dev->ring_order);
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(dev->prod_pvt_out, dev->intf->out_cons, ring_size);
+    rmb();
+
+    return ring_size - queued;
+}
+
+static unsigned int ring_in_data(struct dev_9pfs *dev)
+{
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(dev->ring_order);
+    unsigned int queued;
+
+    queued = xen_9pfs_queued(dev->intf->in_prod, dev->cons_pvt_in, ring_size);
+    rmb();
+
+    return queued;
+}
+
+static void copy_to_ring(struct dev_9pfs *dev, void *data, unsigned int len)
+{
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(dev->ring_order);
+    RING_IDX prod = xen_9pfs_mask(dev->prod_pvt_out, ring_size);
+    RING_IDX cons = xen_9pfs_mask(dev->intf->out_cons, ring_size);
+
+    xen_9pfs_write_packet(dev->data.out, data, len, &prod, cons, ring_size);
+    dev->prod_pvt_out += len;
+}
+
+static void copy_from_ring(struct dev_9pfs *dev, void *data, unsigned int len)
+{
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(dev->ring_order);
+    RING_IDX prod = xen_9pfs_mask(dev->intf->in_prod, ring_size);
+    RING_IDX cons = xen_9pfs_mask(dev->cons_pvt_in, ring_size);
+
+    xen_9pfs_read_packet(data, dev->data.in, len, prod, &cons, ring_size);
+    dev->cons_pvt_in += len;
+}
+
+/*
+ * send_9p() and rcv_9p() are using a special format string for specifying
+ * the kind of data sent/expected. Each data item is represented by a single
+ * character:
+ * U: 4 byte unsigned integer (uint32_t)
+ * S: String (2 byte length + <length> characters)
+ *    in the rcv_9p() case the data for string is allocated (length omitted,
+ *    string terminated by a NUL character)
+ * Q: A 13 byte "qid", consisting of 1 byte file type, 4 byte file version
+ *    and 8 bytes unique file id. Only valid for receiving.
+ */
+static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
+{
+    struct p9_header hdr;
+    va_list ap, aq;
+    const char *f;
+    uint32_t intval;
+    uint16_t len;
+    char *strval;
+
+    hdr.size = sizeof(hdr);
+    hdr.cmd = req->cmd;
+    hdr.tag = req->id;
+
+    va_start(ap, fmt);
+
+    va_copy(aq, ap);
+    for ( f = fmt; *f; f++ )
+    {
+        switch ( *f )
+        {
+        case 'U':
+            hdr.size += 4;
+            intval = va_arg(aq, unsigned int);
+            break;
+        case 'S':
+            hdr.size += 2;
+            strval = va_arg(aq, char *);
+            hdr.size += strlen(strval);
+            break;
+        default:
+            printk("send_9p: unknown format character %c\n", *f);
+            break;
+        }
+    }
+    va_end(aq);
+
+    /*
+     * Waiting for free space must be done in the critical section!
+     * Otherwise we might get overtaken by other short requests.
+     */
+    down(&dev->ring_out_sem);
+
+    wait_event(dev->waitq, ring_out_free(dev) >= hdr.size);
+
+    copy_to_ring(dev, &hdr, sizeof(hdr));
+    for ( f = fmt; *f; f++ )
+    {
+        switch ( *f )
+        {
+        case 'U':
+            intval = va_arg(ap, unsigned int);
+            copy_to_ring(dev, &intval, sizeof(intval));
+            break;
+        case 'S':
+            strval = va_arg(ap, char *);
+            len = strlen(strval);
+            copy_to_ring(dev, &len, sizeof(len));
+            copy_to_ring(dev, strval, len);
+            break;
+        }
+    }
+
+    wmb();   /* Data on ring must be seen before updating index. */
+    dev->intf->out_prod = dev->prod_pvt_out;
+    req->inflight = true;
+
+    up(&dev->ring_out_sem);
+
+    va_end(ap);
+
+    notify_remote_via_evtchn(dev->evtchn);
+}
+
+/*
+ * Using an opportunistic approach for receiving data: in case multiple
+ * requests are outstanding (which is very unlikely), we nevertheless need
+ * to consume all data available until we reach the desired request.
+ * For requests other than the one we are waiting for, we link the complete
+ * data to the request via an intermediate buffer. For our own request we can
+ * omit that buffer and directly fill the caller provided variables.
+ *
+ * Helper functions:
+ *
+ * copy_bufs(): copy raw data into a target buffer. There can be 2 source
+ *   buffers involved (in case the copy is done from the ring and it is across
+ *   the ring end). The buffer pointers and lengths are updated according to
+ *   the number of bytes copied.
+ *
+ * rcv_9p_copy(): copy the data (without the generic header) of a 9p response
+ *   to the specified variables using the specified format string for
+ *   deciphering the single item types. The decision whether to copy from the
+ *   ring or an allocated buffer is done via the "hdr" parameter, which is
+ *   NULL in the buffer case (in that case the header is located at the start
+ *   of the buffer).
+ *
+ * rcv_9p_one(): Checks for an already filled buffer with the correct tag in
+ *   it. If none is found, consumes one response. It checks the tag of the
+ *   response in order to decide whether to allocate a buffer for putting the
+ *   data into, or to fill the user supplied variables. Return true, if the
+ *   tag did match. Waits if no data is ready to be consumed.
+ */
+static void copy_bufs(unsigned char **buf1, unsigned char **buf2,
+                      unsigned int *len1, unsigned int *len2,
+                      void *target, unsigned int len)
+{
+    if ( len <= *len1 )
+    {
+        memcpy(target, *buf1, len);
+        *buf1 += len;
+        *len1 -= len;
+    }
+    else
+    {
+        memcpy(target, *buf1, *len1);
+        target = (char *)target + *len1;
+        len -= *len1;
+        *buf1 = *buf2;
+        *len1 = *len2;
+        *buf2 = NULL;
+        *len2 = 0;
+        if ( len > *len1 )
+        {
+            printk("9pfs: short copy (dropping %u bytes)\n", len - *len1);
+            len = *len1;
+        }
+        memcpy(target, *buf1, *len1);
+    }
+}
+
+static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
+                        struct p9_header *hdr, const char *fmt, va_list ap)
+{
+    struct p9_header *h = hdr ? hdr : (void *)req->data;
+    RING_IDX cons = dev->cons_pvt_in + h->size - sizeof(*h);
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(dev->ring_order);
+    unsigned char *buf1, *buf2;
+    unsigned int len1, len2;
+    const char *f;
+    char *str;
+    uint16_t len;
+    uint32_t err;
+    uint32_t *val;
+    char **strval;
+    uint8_t *qval;
+
+    if ( hdr )
+    {
+        buf1 = xen_9pfs_get_ring_ptr(dev->data.in, dev->cons_pvt_in, ring_size);
+        buf2 = xen_9pfs_get_ring_ptr(dev->data.in, 0,  ring_size);
+        len1 = ring_size - xen_9pfs_mask(dev->cons_pvt_in, ring_size);
+        if ( len1 > h->size - sizeof(*h) )
+            len1 = h->size - sizeof(*h);
+        len2 = h->size - sizeof(*h) - len1;
+    }
+    else
+    {
+        buf1 = req->data + sizeof(*h);
+        buf2 = NULL;
+        len1 = h->size - sizeof(*h);
+        len2 = 0;
+    }
+
+    if ( h->cmd == P9_CMD_ERROR )
+    {
+        copy_bufs(&buf1, &buf2, &len1, &len2, &len, sizeof(len));
+        str = malloc(len + 1);
+        copy_bufs(&buf1, &buf2, &len1, &len2, str, len);
+        str[len] = 0;
+        printk("9pfs: request %u resulted in \"%s\"\n", req->cmd, str);
+        free(str);
+        err = EIO;
+        copy_bufs(&buf1, &buf2, &len1, &len2, &err, sizeof(err));
+        req->result = err;
+
+        if ( hdr )
+            dev->cons_pvt_in = cons;
+
+        return;
+    }
+
+    if ( h->cmd != req->cmd + 1 )
+    {
+        req->result = EDOM;
+        printk("9pfs: illegal response: wrong return type (%u instead of %u)\n",
+               h->cmd, req->cmd + 1);
+
+        if ( hdr )
+            dev->cons_pvt_in = cons;
+
+        return;
+    }
+
+    req->result = 0;
+
+    for ( f = fmt; *f; f++ )
+    {
+        switch ( *f )
+        {
+        case 'U':
+            val = va_arg(ap, uint32_t *);
+            copy_bufs(&buf1, &buf2, &len1, &len2, val, sizeof(*val));
+            break;
+        case 'S':
+            strval = va_arg(ap, char **);
+            copy_bufs(&buf1, &buf2, &len1, &len2, &len, sizeof(len));
+            *strval = malloc(len + 1);
+            copy_bufs(&buf1, &buf2, &len1, &len2, *strval, len);
+            (*strval)[len] = 0;
+            break;
+        case 'Q':
+            qval = va_arg(ap, uint8_t *);
+            copy_bufs(&buf1, &buf2, &len1, &len2, qval, P9_QID_SIZE);
+            break;
+        default:
+            printk("rcv_9p: unknown format character %c\n", *f);
+            break;
+        }
+    }
+
+    if ( hdr )
+        dev->cons_pvt_in = cons;
+}
+
+static bool rcv_9p_one(struct dev_9pfs *dev, struct req *req, const char *fmt,
+                       va_list ap)
+{
+    struct p9_header hdr;
+    struct req *tmp;
+
+    if ( req->data )
+    {
+        rcv_9p_copy(dev, req, NULL, fmt, ap);
+        free(req->data);
+        req->data = NULL;
+
+        return true;
+    }
+
+    wait_event(dev->waitq, ring_in_data(dev) >= sizeof(hdr));
+
+    copy_from_ring(dev, &hdr, sizeof(hdr));
+
+    wait_event(dev->waitq, ring_in_data(dev) >= hdr.size - sizeof(hdr));
+
+    tmp = dev->req + hdr.tag;
+    if ( hdr.tag >= N_REQS || !tmp->inflight )
+    {
+        printk("9pfs: illegal response: %s\n",
+               hdr.tag >= N_REQS ? "tag out of bounds" : "request not pending");
+        dev->cons_pvt_in += hdr.size - sizeof(hdr);
+
+        return false;
+    }
+
+    tmp->inflight = false;
+
+    if ( tmp != req )
+    {
+        tmp->data = malloc(hdr.size);
+        memcpy(tmp->data, &hdr, sizeof(hdr));
+        copy_from_ring(dev, tmp->data + sizeof(hdr), hdr.size - sizeof(hdr));
+
+        return false;
+    }
+
+    rcv_9p_copy(dev, req, &hdr, fmt, ap);
+
+    return true;
+}
+
+static void rcv_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+
+    down(&dev->ring_in_sem);
+
+    while ( !rcv_9p_one(dev, req, fmt, ap) );
+
+    rmb(); /* Read all data before updating ring index. */
+    dev->intf->in_cons = dev->cons_pvt_in;
+
+    notify_remote_via_evtchn(dev->evtchn);
+
+    up(&dev->ring_in_sem);
+
+    va_end(ap);
+}
+
+static int p9_version(struct dev_9pfs *dev)
+{
+    unsigned int msize = XEN_FLEX_RING_SIZE(dev->ring_order) / 2;
+    struct req *req = get_free_req(dev);
+    char *verret;
+    int ret;
+
+    if ( !req )
+        return EAGAIN;
+
+    req->cmd = P9_CMD_VERSION;
+    send_9p(dev, req, "US", msize, P9_VERSION);
+    rcv_9p(dev, req, "US", &dev->msize_max, &verret);
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    if ( ret )
+        return ret;
+
+    if ( strcmp(verret, P9_VERSION) )
+        ret = ENOMSG;
+    free(verret);
+
+    return ret;
+}
+
+static int p9_attach(struct dev_9pfs *dev)
+{
+    uint32_t fid = P9_ROOT_FID;
+    uint32_t afid = 0;
+    uint32_t uid = 0;
+    uint8_t qid[P9_QID_SIZE];
+    struct req *req = get_free_req(dev);
+    int ret;
+
+    if ( !req )
+        return EAGAIN;
+
+    req->cmd = P9_CMD_ATTACH;
+    send_9p(dev, req, "UUSSU", fid, afid, "root", "root", uid);
+    rcv_9p(dev, req, "Q", qid);
+    ret = req->result;
+
+    put_free_req(dev, req);
+
+    return ret;
+}
+
+static int connect_9pfs(struct dev_9pfs *dev)
+{
+    int ret;
+
+    ret = p9_version(dev);
+    if ( ret )
+        return ret;
+
+    return p9_attach(dev);
+}
+
 static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
+    struct dev_9pfs *dev = data;
+
+    wake_up(&dev->waitq);
 }
 
 static int open_9pfs(struct mount_point *mnt, const char *pathname, int flags,
@@ -87,6 +549,16 @@ void *init_9pfront(unsigned int id, const char *mnt)
     memset(dev, 0, sizeof(*dev));
     snprintf(dev->nodename, sizeof(dev->nodename), "device/9pfs/%u", id);
     dev->id = id;
+    init_waitqueue_head(&dev->waitq);
+    init_SEMAPHORE(&dev->ring_out_sem, 1);
+    init_SEMAPHORE(&dev->ring_in_sem, 1);
+
+    for ( i = 0; i < N_REQS; i++ )
+    {
+        dev->req[i].id = i;
+        dev->req[i].next_free = i + 1;
+    }
+    dev->free_reqs = 0;
 
     msg = xenbus_read_unsigned(XBT_NIL, dev->nodename, "backend-id", &dev->dom);
     if ( msg )
@@ -205,6 +677,12 @@ void *init_9pfront(unsigned int id, const char *mnt)
 
     unmask_evtchn(dev->evtchn);
 
+    if ( connect_9pfs(dev) )
+    {
+        reason = "9pfs connect failed";
+        goto err;
+    }
+
     dev->mnt = mnt;
     if ( mount(dev->mnt, dev, open_9pfs) )
     {
-- 
2.35.3


