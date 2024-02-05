Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2915849814
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675796.1051326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwYd-0004Gn-SK; Mon, 05 Feb 2024 10:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675796.1051326; Mon, 05 Feb 2024 10:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwYd-0004ED-Nz; Mon, 05 Feb 2024 10:50:35 +0000
Received: by outflank-mailman (input) for mailman id 675796;
 Mon, 05 Feb 2024 10:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwYc-0000qL-KK
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:50:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6275bc70-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:50:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FDE822100;
 Mon,  5 Feb 2024 10:50:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 453CD132DD;
 Mon,  5 Feb 2024 10:50:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PVFnD3i9wGUZNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:50:32 +0000
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
X-Inumbo-ID: 6275bc70-c414-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 05/32] tools/xen-9pfsd: add 9pfs response generation support
Date: Mon,  5 Feb 2024 11:49:34 +0100
Message-Id: <20240205105001.24171-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6FDE822100
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Add support for generation a 9pfs protocol response via a format based
approach.

Strings are stored in a per device string buffer and they are
referenced via their offset in this buffer. This allows to avoid
having to dynamically allocate memory for each single string.

As a first user of the response handling add a generic p9_error()
function which will be used to return any error to the client.

Add all format parsing variants in order to avoid additional code churn
later when adding the users of those variants. Prepare a special case
for the "read" case already (format character 'D'): in order to avoid
adding another buffer for read data support doing the read I/O directly
into the response buffer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- check parameter size limits (Jason Andryuk)
V3:
- use new unaligned access macros (Jason Andryuk)
V4:
- use recursion in fill_buffer() as a preparation for reading dirs
---
 tools/xen-9pfsd/io.c        | 217 +++++++++++++++++++++++++++++++++++-
 tools/xen-9pfsd/xen-9pfsd.h |   3 +
 2 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
index 4312a62dfe..4a44c70c4d 100644
--- a/tools/xen-9pfsd/io.c
+++ b/tools/xen-9pfsd/io.c
@@ -11,6 +11,7 @@
  * before looking for the next request.
  */
 
+#include <errno.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
@@ -20,6 +21,16 @@
 
 #include "xen-9pfsd.h"
 
+/* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
+#define P9_CMD_ERROR      107
+
+struct p9_qid {
+    uint8_t type;
+#define QID_TYPE_DIR      0x80
+    uint32_t version;
+    uint64_t path;
+};
+
 /*
  * Note that the ring names "in" and "out" are from the frontend's
  * perspective, so the "in" ring will be used for responses to the frontend,
@@ -100,6 +111,200 @@ static bool io_work_pending(struct ring *ring)
     return ring->handle_response ? ring_in_free(ring) : ring_out_data(ring);
 }
 
+static void fmt_err(const char *fmt)
+{
+    syslog(LOG_CRIT, "illegal format %s passed to fill_buffer()", fmt);
+    exit(1);
+}
+
+/*
+ * Fill buffer with response data.
+ * fmt is a sequence of format characters. Supported characters are:
+ * a: an array (2 bytes number of elements + the following format as elements)
+ *    The number of elements is passed in the first unsigned int parameter, the
+ *    next parameter is a pointer to an array of elements as denoted by the next
+ *    format character.
+ * b: 1 byte unsigned integer
+ * u: 2 byte unsigned integer
+ *    The parameter is a pointer to a uint16_t value
+ * D: Data blob (4 byte length + <length> bytes)
+ *    2 parameters are consumed, first an unsigned int for the length, then a
+ *    pointer to the first uint8_t value.
+ *    No array support.
+ * L: 8 byte unsigned integer
+ *    The parameter is a pointer to a uint64_t value
+ * Q: Qid (struct p9_qid)
+ * S: String (2 byte length + <length> characters)
+ *    The length is obtained via strlen() of the parameter, being a pointer
+ *    to the first character of the string
+ * U: 4 byte unsigned integer
+ *    The parameter is a pointer to a uint32_t value
+ */
+static void fill_buffer_at(void **data, const char *fmt, ...);
+static void vfill_buffer_at(void **data, const char *fmt, va_list ap)
+{
+    const char *f;
+    const void *par;
+    const char *str_val;
+    const struct p9_qid *qid;
+    unsigned int len;
+    unsigned int array_sz = 0;
+    unsigned int elem_sz = 0;
+
+    for ( f = fmt; *f; f++ )
+    {
+        if ( !array_sz )
+            par = va_arg(ap, const void *);
+        else
+        {
+            par += elem_sz;
+            array_sz--;
+        }
+
+        switch ( *f )
+        {
+        case 'a':
+            f++;
+            if ( !*f || array_sz )
+                fmt_err(fmt);
+            array_sz = *(const unsigned int *)par;
+            if ( array_sz > 0xffff )
+            {
+                syslog(LOG_CRIT, "array size %u in fill_buffer()", array_sz);
+                exit(1);
+            }
+            put_unaligned(array_sz, (uint16_t *)*data);
+            *data += sizeof(uint16_t);
+            par = va_arg(ap, const void *);
+            elem_sz = 0;
+            break;
+
+        case 'b':
+            put_unaligned(*(const uint8_t *)par, (uint8_t *)*data);
+            elem_sz = sizeof(uint8_t);
+            *data += sizeof(uint8_t);
+            break;
+
+        case 'u':
+            put_unaligned(*(const uint16_t *)par, (uint16_t *)*data);
+            elem_sz = sizeof(uint16_t);
+            *data += sizeof(uint16_t);
+            break;
+
+        case 'D':
+            if ( array_sz )
+                fmt_err(fmt);
+            len = *(const unsigned int *)par;
+            put_unaligned(len, (uint32_t *)*data);
+            *data += sizeof(uint32_t);
+            par = va_arg(ap, const void *);
+            if ( *data != par )
+                memcpy(*data, par, len);
+            *data += len;
+            break;
+
+        case 'L':
+            put_unaligned(*(const uint64_t *)par, (uint64_t *)*data);
+            elem_sz = sizeof(uint64_t);
+            *data += sizeof(uint64_t);
+            break;
+
+        case 'Q':
+            qid = par;
+            elem_sz = sizeof(*qid);
+            fill_buffer_at(data, "bUL", &qid->type, &qid->version, &qid->path);
+            break;
+
+        case 'S':
+            str_val = par;
+            elem_sz = sizeof(str_val);
+            len = strlen(str_val);
+            if ( len > 0xffff )
+            {
+                syslog(LOG_CRIT, "string length %u in fill_buffer()", len);
+                exit(1);
+            }
+            put_unaligned(len, (uint16_t *)*data);
+            *data += sizeof(uint16_t);
+            memcpy(*data, str_val, len);
+            *data += len;
+            break;
+
+        case 'U':
+            put_unaligned(*(const uint32_t *)par, (uint32_t *)*data);
+            elem_sz = sizeof(uint32_t);
+            *data += sizeof(uint32_t);
+            break;
+
+        default:
+            fmt_err(fmt);
+        }
+
+        if ( array_sz )
+            f--;
+    }
+}
+
+static void fill_buffer_at(void **data, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfill_buffer_at(data, fmt, ap);
+    va_end(ap);
+}
+
+static void fill_buffer(struct ring *ring, uint8_t cmd, uint16_t tag,
+                        const char *fmt, ...)
+{
+    struct p9_header *hdr = ring->buffer;
+    void *data = hdr + 1;
+    va_list ap;
+
+    hdr->cmd = cmd;
+    hdr->tag = tag;
+
+    va_start(ap, fmt);
+    vfill_buffer_at(&data, fmt, ap);
+    va_end(ap);
+
+    hdr->size = data - ring->buffer;
+}
+
+static unsigned int add_string(struct ring *ring, const char *str,
+                               unsigned int len)
+{
+    char *tmp;
+    unsigned int ret;
+
+    if ( ring->str_used + len + 1 > ring->str_size )
+    {
+        tmp = realloc(ring->str, ring->str_used + len + 1);
+        if ( !tmp )
+            return ~0;
+        ring->str = tmp;
+        ring->str_size = ring->str_used + len + 1;
+    }
+
+    ret = ring->str_used;
+    memcpy(ring->str + ret, str, len);
+    ring->str_used += len;
+    ring->str[ring->str_used++] = 0;
+
+    return ret;
+}
+
+static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
+{
+    unsigned int erroff;
+
+    strerror_r(err, ring->buffer, ring->ring_size);
+    erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
+    fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
+                erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
+                &err);
+}
+
 void *io_thread(void *arg)
 {
     struct ring *ring = arg;
@@ -151,7 +356,16 @@ void *io_thread(void *arg)
             if ( count < hdr.size )
                 continue;
 
-            /* TODO: handle request (will rewrite hdr.size). */
+            ring->str_used = 0;
+
+            switch ( hdr.cmd )
+            {
+            default:
+                syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
+                       ring->device->domid, ring->device->devid, hdr.cmd);
+                p9_error(ring, hdr.tag, EOPNOTSUPP);
+                break;
+            }
 
             ring->handle_response = true;
             hdr.size = ((struct p9_header *)ring->buffer)->size;
@@ -174,6 +388,7 @@ void *io_thread(void *arg)
         }
     }
 
+    free(ring->str);
     free(ring->buffer);
 
     ring->thread_active = false;
diff --git a/tools/xen-9pfsd/xen-9pfsd.h b/tools/xen-9pfsd/xen-9pfsd.h
index d587f59a32..0cde0d2bb8 100644
--- a/tools/xen-9pfsd/xen-9pfsd.h
+++ b/tools/xen-9pfsd/xen-9pfsd.h
@@ -46,6 +46,9 @@ struct ring {
     bool error;             /* Protocol error - stop processing. */
     bool handle_response;   /* Main loop now handling response. */
     void *buffer;           /* Request/response buffer. */
+    char *str;              /* String work space. */
+    unsigned int str_size;  /* Size of *str. */
+    unsigned int str_used;  /* Currently used size of *str. */
 };
 
 struct device {
-- 
2.35.3


