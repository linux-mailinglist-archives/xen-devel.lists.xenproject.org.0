Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A1855ADA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681252.1059952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfL-0005IM-4D; Thu, 15 Feb 2024 06:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681252.1059952; Thu, 15 Feb 2024 06:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVfK-0005FK-WF; Thu, 15 Feb 2024 06:56:15 +0000
Received: by outflank-mailman (input) for mailman id 681252;
 Thu, 15 Feb 2024 06:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVfJ-0003NA-Pg
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:56:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2dc186-cbcf-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 07:56:12 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E03821DA6;
 Thu, 15 Feb 2024 06:56:12 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0136B1346A;
 Thu, 15 Feb 2024 06:56:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id M05jOou1zWVUSQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:56:11 +0000
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
X-Inumbo-ID: 4e2dc186-cbcf-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ep5GCYtOAcPi9Z1A4O1nBYAfiV8kAZfwfen9awb2d94=;
	b=AViuvk/q5wD2sGrPfa+YKUMCAxWbfDnm6j86JHxbAPz9pblBx1uuNjaOhx7GXSIVkaMQAr
	UYWYQYXLIGmvB9KCPlJH2f6dYVTXC84ev9Q6mxLxVzxtGGXbfgZ5zUFk/BnpwHISSyJj/T
	oKnnf5QRzNIqXvpSK8pMvxyyo//RJ5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707980172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ep5GCYtOAcPi9Z1A4O1nBYAfiV8kAZfwfen9awb2d94=;
	b=AViuvk/q5wD2sGrPfa+YKUMCAxWbfDnm6j86JHxbAPz9pblBx1uuNjaOhx7GXSIVkaMQAr
	UYWYQYXLIGmvB9KCPlJH2f6dYVTXC84ev9Q6mxLxVzxtGGXbfgZ5zUFk/BnpwHISSyJj/T
	oKnnf5QRzNIqXvpSK8pMvxyyo//RJ5o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v6 05/21] tools/xen-9pfsd: add 9pfs version request support
Date: Thu, 15 Feb 2024 07:55:25 +0100
Message-Id: <20240215065541.21067-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215065541.21067-1-jgross@suse.com>
References: <20240215065541.21067-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

Add the version request of the 9pfs protocol. For the version use the
"9P2000.u" variant, as it is supported by Mini-OS and Linux.

For the request parsing add all format items needed even in future in
order to avoid code churn for those additions later.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
V3:
- use unaligned helper macros (Jason Andryuk)
---
 tools/9pfsd/io.c | 201 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 4a44c70c4d..839dd1112c 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
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
@@ -294,6 +298,169 @@ static unsigned int add_string(struct ring *ring, const char *str,
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
@@ -305,6 +472,36 @@ static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
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
@@ -360,6 +557,10 @@ void *io_thread(void *arg)
 
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


