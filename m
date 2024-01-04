Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78050823E14
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661143.1030884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbh-0001xb-Hg; Thu, 04 Jan 2024 09:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661143.1030884; Thu, 04 Jan 2024 09:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbh-0001rw-Dm; Thu, 04 Jan 2024 09:01:41 +0000
Received: by outflank-mailman (input) for mailman id 661143;
 Thu, 04 Jan 2024 09:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJbf-00085z-Ok
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:01:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de938e00-aadf-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:01:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 457AD21F8C;
 Thu,  4 Jan 2024 09:01:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1646213722;
 Thu,  4 Jan 2024 09:01:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Df8yBPJzlmWyWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:01:38 +0000
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
X-Inumbo-ID: de938e00-aadf-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 07/33] tools/xenlogd: add 9pfs version request support
Date: Thu,  4 Jan 2024 10:00:29 +0100
Message-Id: <20240104090055.27323-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 457AD21F8C
X-Spam-Flag: NO

Add the version request of the 9pfs protocol. For the version use the
"9P2000.u" variant, as it is supported by Mini-OS and Linux.

For the request parsing add all format items needed even in future in
order to avoid code churn for those additions later.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- use unaligned helper macros (Jason Andryuk)
---
 tools/xen-9pfsd/io.c | 201 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 476562298b..245faeb9a6 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -22,8 +22,12 @@
 #include "xen-9pfsd.h"
 
 /* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
+#define P9_CMD_VERSION    100
 #define P9_CMD_ERROR      107
 
+#define P9_MIN_MSIZE      2048
+#define P9_VERSION        "9P2000.u"
+
 struct p9_qid {
     uint8_t type;
 #define QID_TYPE_DIR      0x80
@@ -276,6 +280,169 @@ static unsigned int add_string(struct ring *ring, const char *str,
     return ret;
 }
 
+static bool chk_data(struct ring *ring, void *data, unsigned int len)
+{
+    struct p9_header *hdr = ring->buffer;
+
+    if ( data + len <= ring->buffer + hdr->size )
+        return true;
+
+    errno = E2BIG;
+
+    return false;
+}
+
+static bool fill_data_elem(void **par, void **array, unsigned int *array_sz,
+                           unsigned int elem_sz, void *data)
+{
+    if ( *array_sz && !*array )
+    {
+        *array = calloc(*array_sz, elem_sz);
+        if ( !*array )
+            return false;
+        *par = *array;
+    }
+
+    memcpy(*par, data, elem_sz);
+
+    if ( *array_sz )
+    {
+        *par += elem_sz;
+        *array_sz -= 1;
+    }
+
+    return true;
+}
+
+/*
+ * Fill variables with request data.
+ * fmt is a sequence of format characters. Supported characters are:
+ * a: an array (2 bytes number of elements + the following format as elements)
+ *    The number of elements is stored in the first unsigned int parameter, the
+ *    next parameter is a pointer to an array of elements as denoted by the next
+ *    format character. The array is allocated dynamically.
+ * b: 1 byte unsigned integer
+ *    The value is stored in the next parameter with type uint8_t.
+ * D: Data blob (4 byte length + <length> bytes)
+ *    2 parameters are consumed, first an unsigned int for the length, then a
+ *    pointer to the first uint8_t value.
+ *    No array support.
+ * L: 8 byte unsigned integer
+ *    The value is stored in the next parameter with type uint64_t.
+ * S: String (2 byte length + <length> characters)
+ *    The 0-terminated string is stored in device->str + off, off is stored in
+ *    the next parameter with type unsigned int.
+ * U: 4 byte unsigned integer
+ *    The value is stored in the next parameter with type uint32_t.
+ *
+ * Return value: number of filled variables, errno will be set in case of
+ *   error.
+ */
+static int fill_data(struct ring *ring, const char *fmt, ...)
+{
+    struct p9_header *hdr = ring->buffer;
+    void *data = hdr + 1;
+    void *par;
+    unsigned int pars = 0;
+    const char *f;
+    va_list ap;
+    unsigned int len;
+    unsigned int str_off;
+    unsigned int array_sz = 0;
+    void **array = NULL;
+
+    va_start(ap, fmt);
+
+    for ( f = fmt; *f; f++ )
+    {
+        if ( !array_sz )
+            par = va_arg(ap, void *);
+
+        switch ( *f )
+        {
+        case 'a':
+            f++;
+            if ( !*f || array_sz )
+                fmt_err(fmt);
+            if ( !chk_data(ring, data, sizeof(uint16_t)) )
+                return pars;
+            array_sz = get_unaligned((uint16_t *)data);
+            data += sizeof(uint16_t);
+            *(unsigned int *)par = array_sz;
+            array = va_arg(ap, void **);
+            *array = NULL;
+            break;
+
+        case 'b':
+            if ( !chk_data(ring, data, sizeof(uint8_t)) )
+                return pars;
+            if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint8_t),
+                                 data) )
+                return pars;
+            data += sizeof(uint8_t);
+            break;
+
+        case 'D':
+            if ( array_sz )
+                fmt_err(fmt);
+            if ( !chk_data(ring, data, sizeof(uint32_t)) )
+                return pars;
+            len = get_unaligned((uint32_t *)data);
+            data += sizeof(uint32_t);
+            *(unsigned int *)par = len;
+            par = va_arg(ap, void *);
+            if ( !chk_data(ring, data, len) )
+                return pars;
+            memcpy(par, data, len);
+            data += len;
+            break;
+
+        case 'L':
+            if ( !chk_data(ring, data, sizeof(uint64_t)) )
+                return pars;
+            if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint64_t),
+                                 data) )
+                return pars;
+            data += sizeof(uint64_t);
+            break;
+
+        case 'S':
+            if ( !chk_data(ring, data, sizeof(uint16_t)) )
+                return pars;
+            len = get_unaligned((uint16_t *)data);
+            data += sizeof(uint16_t);
+            if ( !chk_data(ring, data, len) )
+                return pars;
+            str_off = add_string(ring, data, len);
+            if ( str_off == ~0 )
+                return pars;
+            if ( !fill_data_elem(&par, array, &array_sz, sizeof(unsigned int),
+                                 &str_off) )
+                return pars;
+            data += len;
+            break;
+
+        case 'U':
+            if ( !chk_data(ring, data, sizeof(uint32_t)) )
+                return pars;
+            if ( !fill_data_elem(&par, array, &array_sz, sizeof(uint32_t),
+                                 data) )
+                return pars;
+            data += sizeof(uint32_t);
+            break;
+
+        default:
+            fmt_err(fmt);
+        }
+
+        if ( array_sz )
+            f--;
+        pars++;
+    }
+
+    return pars;
+}
+
 static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
@@ -287,6 +454,36 @@ static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
                 &err);
 }
 
+static void p9_version(struct ring *ring, struct p9_header *hdr)
+{
+    uint32_t max_size;
+    unsigned int off;
+    char *version;
+    int ret;
+
+    ret = fill_data(ring, "US", &max_size, &off);
+    if ( ret != 2 )
+    {
+        p9_error(ring, hdr->tag, errno);
+        return;
+    }
+
+    if ( max_size < P9_MIN_MSIZE )
+    {
+        p9_error(ring, hdr->tag, EMSGSIZE);
+        return;
+    }
+
+    if ( max_size < ring->max_size )
+        ring->max_size = max_size;
+
+    version = ring->str + off;
+    if ( strcmp(version, P9_VERSION) )
+        version = "unknown";
+
+    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "US", &ring->max_size, version);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -342,6 +539,10 @@ void *io_thread(void *arg)
 
             switch ( hdr.cmd )
             {
+            case P9_CMD_VERSION:
+                p9_version(ring, &hdr);
+                break;
+
             default:
                 syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
                        ring->device->domid, ring->device->devid, hdr.cmd);
-- 
2.35.3


