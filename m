Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A37DDE7D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626243.976361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7br-00080g-NP; Wed, 01 Nov 2023 09:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626243.976361; Wed, 01 Nov 2023 09:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7br-0007y4-Jq; Wed, 01 Nov 2023 09:33:59 +0000
Received: by outflank-mailman (input) for mailman id 626243;
 Wed, 01 Nov 2023 09:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7bp-0005E0-Mr
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c79872cf-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:33:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9FBB1F74A;
 Wed,  1 Nov 2023 09:33:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9053313460;
 Wed,  1 Nov 2023 09:33:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R162IYQbQmXDCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:56 +0000
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
X-Inumbo-ID: c79872cf-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9twQoG8Ni5j7s6nNRlwgs8V2w4vbElXCXWFZkZ1OasA=;
	b=fVRInW4p0CstzpGkfVb6dpeZF9twhiYqF0nnpSnCxFEUfdj2kjR+AayNgF65z20uKO6ZvZ
	SYY23ROOirCYGHcypuQfl0tdWn5B3Guoxzmn3fNORbOiL/gvU+jOJc3+kDDEZrE7r0RAAo
	C+WD1T9gtgrW2+LuzoPqCyzoAd1hyDA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 05/29] tools/xenlogd: add 9pfs response generation support
Date: Wed,  1 Nov 2023 10:33:01 +0100
Message-Id: <20231101093325.30302-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 tools/xenlogd/io.c      | 189 +++++++++++++++++++++++++++++++++++++++-
 tools/xenlogd/xenlogd.h |   3 +
 2 files changed, 191 insertions(+), 1 deletion(-)

diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
index 590d06e906..5a06f72338 100644
--- a/tools/xenlogd/io.c
+++ b/tools/xenlogd/io.c
@@ -11,6 +11,7 @@
  * before looking for the next request.
  */
 
+#include <errno.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
@@ -20,6 +21,16 @@
 
 #include "xenlogd.h"
 
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
@@ -101,6 +112,172 @@ static bool io_work_pending(device *device)
                                    : ring_out_data(device);
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
+ * b: 2 byte unsigned integer
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
+static void fill_buffer(device *device, uint8_t cmd, uint16_t tag,
+                        const char *fmt, ...)
+{
+    struct p9_header *hdr = device->buffer;
+    void *data = hdr + 1;
+    const char *f;
+    const void *par;
+    const char *str_val;
+    const struct p9_qid *qid;
+    unsigned int len;
+    va_list ap;
+    unsigned int array_sz = 0;
+    unsigned int elem_sz = 0;
+
+    hdr->cmd = cmd;
+    hdr->tag = tag;
+
+    va_start(ap, fmt);
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
+            *(__packed uint16_t *)data = array_sz;
+            data += sizeof(uint16_t);
+            par = va_arg(ap, const void *);
+            elem_sz = 0;
+            break;
+
+        case 'u':
+            *(__packed uint16_t *)data = *(const uint16_t *)par;
+            elem_sz = sizeof(uint16_t);
+            data += sizeof(uint16_t);
+            break;
+
+        case 'D':
+            if ( array_sz )
+                fmt_err(fmt);
+            len = *(const unsigned int *)par;
+            *(__packed uint32_t *)data = len;
+            data += sizeof(uint32_t);
+            par = va_arg(ap, const void *);
+            if ( data != par )
+                memcpy(data, par, len);
+            data += len;
+            break;
+
+        case 'L':
+            *(__packed uint64_t *)data = *(const uint64_t *)par;
+            elem_sz = sizeof(uint64_t);
+            data += sizeof(uint64_t);
+            break;
+
+        case 'Q':
+            qid = par;
+            elem_sz = sizeof(*qid);
+            *(uint8_t *)data = qid->type;
+            data += sizeof(uint8_t);
+            *(__packed uint32_t *)data = qid->version;
+            data += sizeof(uint32_t);
+            *(__packed uint64_t *)data = qid->path;
+            data += sizeof(uint64_t);
+            break;
+
+        case 'S':
+            str_val = par;
+            elem_sz = sizeof(str_val);
+            len = strlen(str_val);
+            *(__packed uint16_t *)data = len;
+            data += sizeof(uint16_t);
+            memcpy(data, str_val, len);
+            data += len;
+            break;
+
+        case 'U':
+            *(__packed uint32_t *)data = *(const uint32_t *)par;
+            elem_sz = sizeof(uint32_t);
+            data += sizeof(uint32_t);
+            break;
+
+        default:
+            fmt_err(fmt);
+        }
+
+        if ( array_sz )
+            f--;
+    }
+
+    hdr->size = data - device->buffer;
+}
+
+static unsigned int add_string(device *device, const char *str,
+                               unsigned int len)
+{
+    char *tmp;
+    unsigned int ret;
+
+    if ( device->str_used + len + 1 > device->str_size )
+    {
+        tmp = realloc(device->str, device->str_used + len + 1);
+        if ( !tmp )
+            return ~0;
+        device->str = tmp;
+        device->str_size = device->str_used + len + 1;
+    }
+
+    ret = device->str_used;
+    memcpy(device->str + ret, str, len);
+    device->str_used += len;
+    device->str[device->str_used++] = 0;
+
+    return ret;
+}
+
+static void p9_error(device *device, uint16_t tag, uint32_t err)
+{
+    unsigned int erroff;
+
+    strerror_r(err, device->buffer, device->ring_size);
+    erroff = add_string(device, device->buffer, strlen(device->buffer));
+    fill_buffer(device, P9_CMD_ERROR, tag, "SU",
+                erroff != ~0 ? device->str + erroff : "cannot allocate memory",
+                &err);
+}
+
 void *io_thread(void *arg)
 {
     device *device = arg;
@@ -152,7 +329,16 @@ void *io_thread(void *arg)
             if ( count < hdr.size )
                 continue;
 
-            /* TODO: handle request. */
+            device->str_used = 0;
+
+            switch ( hdr.cmd )
+            {
+            default:
+                syslog(LOG_DEBUG, "%u.%u sent unhandled command %u\n",
+                       device->domid, device->devid, hdr.cmd);
+                p9_error(device, hdr.tag, EOPNOTSUPP);
+                break;
+            }
 
             device->handle_response = true;
             hdr.size = ((struct p9_header *)device->buffer)->size;
@@ -175,6 +361,7 @@ void *io_thread(void *arg)
         }
     }
 
+    free(device->str);
     free(device->buffer);
 
     device->thread_active = false;
diff --git a/tools/xenlogd/xenlogd.h b/tools/xenlogd/xenlogd.h
index 40aa7cd03a..c10c6aa9e5 100644
--- a/tools/xenlogd/xenlogd.h
+++ b/tools/xenlogd/xenlogd.h
@@ -57,6 +57,9 @@ struct device {
     bool error;             /* Protocol error - stop processing. */
     bool handle_response;   /* Main loop now handling response. */
     void *buffer;           /* Request/response buffer. */
+    char *str;              /* String work space. */
+    unsigned int str_size;  /* Size of *str. */
+    unsigned int str_used;  /* Currently used size of *str. */
 };
 
 extern xenevtchn_handle *xe;
-- 
2.35.3


