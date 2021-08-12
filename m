Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AD23EA67D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166458.303814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbb-00034N-D3; Thu, 12 Aug 2021 14:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166458.303814; Thu, 12 Aug 2021 14:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbb-00031A-8x; Thu, 12 Aug 2021 14:22:47 +0000
Received: by outflank-mailman (input) for mailman id 166458;
 Thu, 12 Aug 2021 14:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbZ-0002Q2-Ur
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:22:45 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbfc7067-d493-430c-82db-cee0258dc3e7;
 Thu, 12 Aug 2021 14:22:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id z20so13830266lfd.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:37 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:34 -0700 (PDT)
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
X-Inumbo-ID: dbfc7067-d493-430c-82db-cee0258dc3e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JdPxHs8pmc5umX+oWUld/sGpQUemWUwM1K9E4JXG7Fw=;
        b=e4/bORrc7EIG5RcPhOR2s5nYwwOjF3V/SZY0Pg4tvMA7pSAB/dgfAngE1qul2z5JGV
         l43BDLzGd9wkdFllMqtAxBQxN7mtB72DpdJKWQji34l+QDFP/2iOTtA9cnKqIOjTam7j
         g/QxwV6EDe7rlE3tWs2ZLABjyoOKFDI8FbDDpc6OhsoCaMujRpZtaF6d5XbZYMZk/1/A
         LcRD+qKwg5lv3sOsC/MotURnrWJ6b62soupvU+fIZE629cO63DXHiZkjPoQ3Xx9p6UqY
         4NAUs1bSRpegeQRGYKoTIqSEsUHARVWHLk7QXjZv/GJpHOB9lNuUlMmnKXEHJLTcKJR0
         /FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JdPxHs8pmc5umX+oWUld/sGpQUemWUwM1K9E4JXG7Fw=;
        b=QhVxrrQYzMOCKlYKdnjO2HhTGz9oPcEAaz1JbbiARHqy0zvMC5aYNQHzqwI87Vydwy
         DS0sZ8rsKiSNmzVST2NCXwObbi7BA78ubXWA6PxvdD3FYrTFgsFzHc7z+v5VEWITKozp
         jmzYA7EpvkPinC9dGLap58afQqNEJcRV6QBJRR6ZCO0tLW/5L2nP56cMbs9QDkGNMO4+
         nbKELU5jINT9RU310xKXBUA9sFrUAflNZ3VM3hsEB7HCboH5h17tgROyXqE/BmflBJhv
         mBzRpMEHma+NAlMW7dBCzqQJbqAmtxLXBes+eF/WF85BPBVVPjxQ0Wzvhei0eJZpygAr
         mQJw==
X-Gm-Message-State: AOAM531xbKXJkGLyavOCPuIqFwzPgB0IiIY1BzLjvAwWbLJWttTQ3KxE
	yYSHBLL/owsmA0KxH9XOeMKlFbqjond+zg==
X-Google-Smtp-Source: ABdhPJxP/uirSlE99zuR7nj0wlbr6O8tgDNBgu5mFUKVrxO12qW4mXOBZ2wrFGq31IKhpRu89hwanQ==
X-Received: by 2002:ac2:53a8:: with SMTP id j8mr2940005lfh.477.1628778154463;
        Thu, 12 Aug 2021 07:22:34 -0700 (PDT)
From: Anastasiia Lukianenko <vicooodin@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com,
	artem_mygaiev@epam.com,
	rahul.singh@arm.com,
	bertrand.marquis@arm.com,
	oleksandr_andrushchenko@epam.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	andr2000@gmail.com,
	vicooodin@gmail.com,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH 2/9] tools/libs/light: Add functions for handling PCI messages in JSON format
Date: Thu, 12 Aug 2021 17:22:23 +0300
Message-Id: <20210812142230.19353-3-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

These functions allow to process the received message from PCI server and
to generate a reply in JSON format for the client.

Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/include/pcid.h                      |  49 ++++++++
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_pcid.c             | 134 ++++++++++++++++++++++
 tools/libs/light/libxl_types.idl          |   1 +
 tools/libs/light/libxl_types_internal.idl |   6 +
 5 files changed, 191 insertions(+)
 create mode 100644 tools/include/pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
new file mode 100644
index 0000000000..59a7aad64a
--- /dev/null
+++ b/tools/include/pcid.h
@@ -0,0 +1,49 @@
+/*
+    Common definitions for Xen PCI client-server protocol.
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#ifndef PCID_H
+#define PCID_H
+
+#define PCID_XS_DIR             "/local/domain/"
+#define PCID_XS_PATH            "/data/pcid-vchan"
+
+#define PCI_RECEIVE_BUFFER_SIZE 4096
+#define PCI_MAX_SIZE_RX_BUF     MB(1)
+
+#define PCID_MSG_FIELD_ID        "id"
+#define PCID_MSG_FIELD_ARGS      "arguments"
+
+#define PCID_PCIBACK_DRIVER      "pciback_driver"
+
+#if defined(__linux__)
+#define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
+#endif
+
+int libxl_pcid_process(libxl_ctx *ctx);
+
+#endif /* PCID_H */
+
+/*
+ * Local variables:
+ *  mode: C
+ *  c-file-style: "linux"
+ *  indent-tabs-mode: t
+ *  c-basic-offset: 8
+ *  tab-width: 8
+ * End:
+ */
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index f5d34b3371..40e3a7d7ce 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -76,6 +76,7 @@ SRCS-y += libxl.c
 SRCS-y += libxl_create.c
 SRCS-y += libxl_dm.c
 SRCS-y += libxl_pci.c
+SRCS-y += libxl_pcid.c
 SRCS-y += libxl_vchan.c
 SRCS-y += libxl_dom.c
 SRCS-y += libxl_exec.c
diff --git a/tools/libs/light/libxl_pcid.c b/tools/libs/light/libxl_pcid.c
new file mode 100644
index 0000000000..6317c77a3c
--- /dev/null
+++ b/tools/libs/light/libxl_pcid.c
@@ -0,0 +1,134 @@
+/*
+    Utils for xl pcid daemon
+
+    Copyright (C) 2021 EPAM Systems Inc.
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define _GNU_SOURCE  // required for strchrnul()
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+
+#include "libxl_internal.h"
+#include "libxl_vchan.h"
+
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include <pcid.h>
+#include <xenstore.h>
+
+#include <libxl.h>
+#include <libxl_json.h>
+#include <dirent.h>
+
+#define DOM0_ID 0
+
+static int pcid_handle_message(libxl__gc *gc, const libxl__json_object *request,
+                               libxl__json_object **result)
+{
+    const libxl__json_object *command_obj;
+    char *command_name;
+
+    command_obj = libxl__json_map_get(VCHAN_MSG_EXECUTE, request, JSON_ANY);
+    if (!command_obj) {
+        LOGE(ERROR, "Execution command not found\n");
+        return ERROR_FAIL;
+    }
+    command_name = command_obj->u.string;
+
+    return 0;
+}
+
+static char *pcid_prepare_reply(libxl__gc *gc, const char *cmd,
+                                libxl__json_object *result, int id)
+{
+    yajl_gen hand = NULL;
+    /* memory for 'buf' is owned by 'hand' */
+    const unsigned char *buf;
+    libxl_yajl_length len;
+    yajl_gen_status s;
+    char *ret = NULL;
+    int rc;
+
+    hand = libxl_yajl_gen_alloc(NULL);
+    if (!hand) {
+        LOGE(ERROR, "Error with hand allocation\n");
+        goto out;
+    }
+
+#if HAVE_YAJL_V2
+    /* Disable beautify for data */
+    yajl_gen_config(hand, yajl_gen_beautify, 0);
+#endif
+
+    yajl_gen_map_open(hand);
+    if ( !result )
+        libxl__yajl_gen_asciiz(hand, VCHAN_MSG_ERROR);
+    else {
+        libxl__yajl_gen_asciiz(hand, VCHAN_MSG_RETURN);
+        rc = libxl__json_object_to_yajl_gen(gc, hand, result);
+        if (rc)
+            goto get_buf_fail;
+    }
+    libxl__yajl_gen_asciiz(hand, PCID_MSG_FIELD_ID);
+    yajl_gen_integer(hand, id);
+    yajl_gen_map_close(hand);
+
+    s = yajl_gen_get_buf(hand, &buf, &len);
+    if (s != yajl_gen_status_ok) {
+        goto get_buf_fail;
+    }
+
+    ret = libxl__sprintf(gc, "%*.*s" END_OF_MESSAGE, (int)len, (int)len, buf);
+
+get_buf_fail:
+    yajl_gen_free(hand);
+out:
+
+    return ret;
+}
+
+int libxl_pcid_process(libxl_ctx *ctx)
+{
+    GC_INIT(ctx);
+    struct vchan_info *vchan;
+    char *xs_path;
+    int ret = 0;
+
+    vchan = libxl__zalloc(gc, sizeof(*vchan));
+    xs_path = GCSPRINTF(PCID_XS_DIR"%d"PCID_XS_PATH, DOM0_ID);
+
+    vchan->state = vchan_get_instance(gc, DOM0_ID, xs_path, VCHAN_SERVER);
+    if (!(vchan->state)) {
+        ret = -1;
+        goto out;
+    }
+
+    vchan->handle_msg = pcid_handle_message;
+    vchan->prepare_cmd = pcid_prepare_reply;
+    vchan->receive_buf_size = PCI_RECEIVE_BUFFER_SIZE;
+    vchan->max_buf_size = PCI_MAX_SIZE_RX_BUF;
+
+    while (true) {
+        ret = vchan_process_command(gc, vchan);
+        if (ret < 0)
+            break;
+    }
+
+out:
+    GC_FREE;
+    return ret;
+}
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 395165d801..d89c3ac1eb 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -76,6 +76,7 @@ libxl_error = Enumeration("error", [
     (-30, "QMP_DEVICE_NOT_ACTIVE"), # a device has failed to be become active
     (-31, "QMP_DEVICE_NOT_FOUND"), # the requested device has not been found
     (-32, "QEMU_API"), # QEMU's replies don't contains expected members
+    (-33, "PROTOCOL_ERROR_PCID"),
     ], value_namespace = "")
 
 libxl_domain_type = Enumeration("domain_type", [
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index d66da13764..b9cee64d41 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -58,3 +58,9 @@ libxl__device_action = Enumeration("device_action", [
     (1, "ADD"),
     (2, "REMOVE"),
     ])
+
+libxl__pcid_message_type = Enumeration("pcid_message_type", [
+    (1, "return"),
+    (2, "error"),
+    (3, "invalid"),
+    ])
-- 
2.17.1


