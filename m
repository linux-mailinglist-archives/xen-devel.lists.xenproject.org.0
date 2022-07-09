Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27756C8E3
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 12:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363781.594507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QL-0002Sn-EY; Sat, 09 Jul 2022 10:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363781.594507; Sat, 09 Jul 2022 10:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QL-0002PR-Aw; Sat, 09 Jul 2022 10:10:53 +0000
Received: by outflank-mailman (input) for mailman id 363781;
 Sat, 09 Jul 2022 10:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pVM=XO=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oA7QJ-0001pr-QA
 for xen-devel@lists.xenproject.org; Sat, 09 Jul 2022 10:10:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68802849-ff6f-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 12:10:50 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id v14so1265469wra.5
 for <xen-devel@lists.xenproject.org>; Sat, 09 Jul 2022 03:10:50 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b00210bac248c8sm1095853wrw.11.2022.07.09.03.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 03:10:48 -0700 (PDT)
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
X-Inumbo-ID: 68802849-ff6f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8OSB73HYoVg9SH33htKf8c4svw80U8RHuxNi/KmYSo=;
        b=Gidtaxn45o/M2tcSpD3avIRNJ/XA/1CQcNOOe0GKrRT6JAqr+PZowgh9w/Zu0x3qVx
         tP9zRq2RdD290davfVuQLBnGJ/b2DMmFD41qEojYq42cRgv3bLtWoTgfV0kPBfri3s6/
         KhPwrh7skJDxMrVAjsqaP7W/dax2RayFgc2dBdeaz7aadJR+noevgnOlmPSW09z+4ox9
         k9ry4Ms70XQ8mKqihkH0+sz0H1OTTqC6inI/UnshBtxleaaElBJf/Hpf7sIXXIg14BVt
         AejlUsVUCnwZ67dY/ykoOJ4g6G5Bps+RsiyztoU/xLcM3flIRrKtd6znydLMG0l5lA/8
         yr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8OSB73HYoVg9SH33htKf8c4svw80U8RHuxNi/KmYSo=;
        b=44DH+8yUHD3LF3ARiAiIP3mNGa6wesJOTiDwYJpw4jK/G8kz2u/pvix3Xgmzc50BoK
         iBKIv+2m81CtnaxjggddrD6BJ6WGF6qGlz8gBdKOaHnWKKLbuwNuPSpgP1mpy7ztlc92
         vev/iYuR/MbxyfOIgffz5YJ1B+2ZriSSPGMoqAqLtUZ84+gVJ8OQEPUUEDz2nHNYaVvc
         g1Qifl9kV46JW8n2NGMVoBLFwa4iDVuzEnCKOJRcXLg7A7Na+kgvvkRF39ZyVy1QOtDn
         ZU3wqzgTbBx8ZnNS+nVUcYGLSIxWFX3jeH9Um6zqklysWRmDLe6tCl7j8yct3LuDGT7f
         Ngng==
X-Gm-Message-State: AJIora/DmlB2GRG/g2D1V37Gwv/j4T6xNrn3kKtHus4Vff9EPONwjCf3
	9u+9DxTn4TYgHKeDKBY/BkxzeIHdKtVz7n10
X-Google-Smtp-Source: AGRyM1u5sWLl27+RENYYLTGx78k88S+cr24F22Gu1Rl6lbJmmFI4mRn0JIyg+8b7UdUl/KhVpCSxsw==
X-Received: by 2002:a5d:4e49:0:b0:21d:6e8a:fa3 with SMTP id r9-20020a5d4e49000000b0021d6e8a0fa3mr7159417wrt.528.1657361449328;
        Sat, 09 Jul 2022 03:10:49 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH 3/4] tools/libs/light: Add vchan support to libxl
Date: Sat,  9 Jul 2022 13:10:34 +0300
Message-Id: <20220709101035.2989428-3-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add possibility to send commands from libxl and execute them on server
side. Libxl vchan adds support for JSON messages processing.

The using of libxl vchan is preventing the client from libxl from reading
and writing from / to the local sysfs directly.To do this, the libxl vchan
was added - instead of working with the read and write functions from / to
the sysfs, functionality allows to send requests to the server, then
receive and process the response.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
---
 tools/helpers/Makefile         |   4 +-
 tools/libs/light/Makefile      |   7 +-
 tools/libs/light/libxl_vchan.c | 488 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_vchan.h |  92 +++++++
 tools/xl/Makefile              |   3 +-
 5 files changed, 588 insertions(+), 6 deletions(-)
 create mode 100644 tools/libs/light/libxl_vchan.c
 create mode 100644 tools/libs/light/libxl_vchan.h

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 7f6c422440..3240ef2b6e 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -30,10 +30,10 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
 all: $(PROGS)
 
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 453bea0067..ea8994af6d 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -77,6 +77,7 @@ SRCS-y += libxl.c
 SRCS-y += libxl_create.c
 SRCS-y += libxl_dm.c
 SRCS-y += libxl_pci.c
+SRCS-y += libxl_vchan.c
 SRCS-y += libxl_dom.c
 SRCS-y += libxl_exec.c
 SRCS-y += libxl_xshelp.c
@@ -175,7 +176,7 @@ LDUSELIBS-y += $(PTHREAD_LIBS)
 LDUSELIBS-y += -lyajl
 LDUSELIBS += $(LDUSELIBS-y)
 
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) $(CFLAGS_libxenevtchn) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
 libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
@@ -231,13 +232,13 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDUSELIBS) $(APPEND_LDFLAGS)
 
 test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
 testidl: testidl.o libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
 install: installlocal $(LIBHEADERS)
 
diff --git a/tools/libs/light/libxl_vchan.c b/tools/libs/light/libxl_vchan.c
new file mode 100644
index 0000000000..c87024f00f
--- /dev/null
+++ b/tools/libs/light/libxl_vchan.c
@@ -0,0 +1,488 @@
+/*
+ * Vchan support for JSON messages processing
+ *
+ * Copyright (C) 2021 EPAM Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+
+#include "libxl_internal.h"
+#include "libxl_vchan.h"
+
+#define VCHAN_EOM       "\r\n"
+/*
+ * http://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html
+ * 1.4.4 Domain Controlled Paths
+ * 1.4.4.1 ~/data [w]
+ * A domain writable path. Available for arbitrary domain use.
+ */
+#define VCHAN_SRV_DIR   "/local/domain"
+
+struct vchan_state {
+    struct libxenvchan *ctrl;
+
+    /* Server domain ID. */
+    libxl_domid domid;
+
+    /* XenStore path of the server with the ring buffer and event channel. */
+    char *xs_path;
+
+    int select_fd;
+
+    /* GC used for state's lifetime allocations, such as rx_buf. */
+    libxl__gc *gc;
+    /* Receive buffer. */
+    char *rx_buf;
+    /* Current allocated size. */
+    size_t rx_buf_size;
+    /* Actual data in the buffer. */
+    size_t rx_buf_used;
+
+    /* YAJL generator used to parse and create requests/replies. */
+    yajl_gen gen;
+};
+
+int libxl__vchan_field_add_string(libxl__gc *gc, yajl_gen gen,
+                                  const char *field, char *val)
+{
+    libxl__json_object *result;
+
+    libxl__yajl_gen_asciiz(gen, field);
+    result = libxl__json_object_alloc(gc, JSON_STRING);
+    result->u.string = val;
+    return libxl__json_object_to_yajl_gen(gc, gen, result);
+}
+
+static libxl__json_object *libxl__vchan_arg_new(libxl__gc *gc,
+                                                libxl__json_node_type type,
+                                                libxl__json_object *args,
+                                                char *key)
+{
+    libxl__json_map_node *arg;
+    libxl__json_object *obj;
+
+    obj = libxl__json_object_alloc(gc, type);
+
+    GCNEW(arg);
+
+    arg->map_key = key;
+    arg->obj = obj;
+
+    flexarray_append(args->u.map, arg);
+
+    return obj;
+}
+
+void libxl__vchan_arg_add_string(libxl__gc *gc, libxl__json_object *args,
+                                 char *key, char *val)
+{
+    libxl__json_object *obj = libxl__vchan_arg_new(gc, JSON_STRING, args, key);
+
+    obj->u.string = val;
+}
+
+void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
+                               char *key, bool val)
+{
+    libxl__json_object *obj = libxl__vchan_arg_new(gc, JSON_BOOL, args, key);
+
+    obj->u.b = val;
+}
+
+static void reset_yajl_generator(struct vchan_state *state)
+{
+    yajl_gen_clear(state->gen);
+    yajl_gen_reset(state->gen, NULL);
+}
+
+void vchan_dump_gen(libxl__gc *gc, yajl_gen gen)
+{
+    const unsigned char *buf = NULL;
+    size_t len = 0;
+
+    yajl_gen_get_buf(gen, &buf, &len);
+    LOG(DEBUG, "%s\n", buf);
+}
+
+void vchan_dump_state(libxl__gc *gc, struct vchan_state *state)
+{
+    vchan_dump_gen(gc, state->gen);
+}
+
+/*
+ * Find a JSON object and store it in o_r.
+ * return ERROR_NOTFOUND if no object is found.
+ */
+static int vchan_get_next_msg(libxl__gc *gc, struct vchan_state *state,
+                              libxl__json_object **o_r)
+{
+    size_t len;
+    char *end = NULL;
+    const size_t eoml = sizeof(VCHAN_EOM) - 1;
+    libxl__json_object *o = NULL;
+
+    if (!state->rx_buf_used)
+        return ERROR_NOTFOUND;
+
+    /* Search for the end of a message which is CRLF. */
+    end = memmem(state->rx_buf, state->rx_buf_used, VCHAN_EOM, eoml);
+    if (!end)
+        return ERROR_NOTFOUND;
+
+    len = (end - state->rx_buf) + eoml;
+
+    LOGD(DEBUG, state->domid, "parsing %zuB: '%.*s'", len, (int)len,
+         state->rx_buf);
+
+    /* Replace \r by \0 so that libxl__json_parse can use strlen */
+    state->rx_buf[len - eoml] = '\0';
+
+    o = libxl__json_parse(gc, state->rx_buf);
+    state->rx_buf_used -= len;
+    if (!o) {
+        LOGD(ERROR, state->domid, "Parse error");
+        /*
+         * In case of parsing error get back to a known state:
+         * reset the buffer and continue reading.
+         */
+        return ERROR_INVAL;
+    }
+
+    memmove(state->rx_buf, state->rx_buf + len, state->rx_buf_used);
+
+    LOGD(DEBUG, state->domid, "JSON object received: %s", JSON(o));
+
+    *o_r = o;
+
+    return 0;
+}
+
+static int vchan_process_packet(libxl__gc *gc, struct vchan_info *vchan,
+                                libxl__json_object **resp_result)
+{
+    while (true) {
+        struct vchan_state *state = vchan->state;
+        int rc;
+        ssize_t r;
+
+        if (!libxenvchan_is_open(state->ctrl))
+            return ERROR_FAIL;
+
+        /* Check if the buffer still has space or increase its size. */
+        if (state->rx_buf_size - state->rx_buf_used < vchan->receive_buf_size) {
+            size_t newsize = state->rx_buf_size * 2 + vchan->receive_buf_size;
+
+            if (newsize > vchan->max_buf_size) {
+                LOGD(ERROR, state->domid,
+                     "receive buffer is too big (%zu > %zu)",
+                     newsize, vchan->max_buf_size);
+                return ERROR_NOMEM;
+            }
+
+            state->rx_buf_size = newsize;
+            state->rx_buf = libxl__realloc(state->gc, state->rx_buf,
+                                           state->rx_buf_size);
+        }
+
+        do {
+            libxl__json_object *msg;
+
+            r = libxenvchan_read(state->ctrl,
+                                 state->rx_buf + state->rx_buf_used,
+                                 state->rx_buf_size - state->rx_buf_used);
+
+            if (r < 0) {
+                LOGED(ERROR, state->domid, "error reading");
+                return ERROR_FAIL;
+            } else if (r == 0)
+                continue;
+
+            LOG(DEBUG, "received %zdB: '%.*s'", r,
+                (int)r, state->rx_buf + state->rx_buf_used);
+
+            state->rx_buf_used += r;
+            assert(state->rx_buf_used <= state->rx_buf_size);
+
+            /* parse rx buffer to find one json object */
+            rc = vchan_get_next_msg(gc, state, &msg);
+            if ((rc == ERROR_INVAL) || (rc == ERROR_NOTFOUND))
+                continue;
+            if (rc)
+                return rc;
+
+            if (resp_result)
+                return vchan->handle_response(gc, msg, resp_result);
+            else {
+                reset_yajl_generator(state);
+                return vchan->handle_request(gc, state->gen, msg);
+            }
+        } while (libxenvchan_data_ready(state->ctrl));
+    }
+
+    return 0;
+}
+
+static int vchan_write(libxl__gc *gc, struct vchan_state *state, char *cmd)
+{
+    size_t len;
+    int ret;
+
+    len = strlen(cmd);
+    while (len) {
+        ret = libxenvchan_write(state->ctrl, cmd, len);
+        if (ret < 0) {
+            LOGE(ERROR, "vchan write failed");
+            return ERROR_FAIL;
+        }
+        cmd += ret;
+        len -= ret;
+    }
+    return 0;
+}
+
+libxl__json_object *vchan_send_command(libxl__gc *gc, struct vchan_info *vchan,
+                                       char *cmd, libxl__json_object *args)
+{
+    libxl__json_object *result;
+    char *request;
+    int ret;
+
+    reset_yajl_generator(vchan->state);
+    request = vchan->prepare_request(gc, vchan->state->gen, cmd, args);
+    if (!request)
+        return NULL;
+
+    ret = vchan_write(gc, vchan->state, request);
+    if (ret < 0)
+        return NULL;
+
+    ret = vchan_write(gc, vchan->state, VCHAN_EOM);
+    if (ret < 0)
+        return NULL;
+
+    ret = vchan_process_packet(gc, vchan, &result);
+    if (ret < 0)
+        return NULL;
+
+    return result;
+}
+
+int vchan_process_command(libxl__gc *gc, struct vchan_info *vchan)
+{
+    char *json_str;
+    int ret;
+
+    ret = vchan_process_packet(gc, vchan, NULL);
+    if (ret)
+        return ret;
+
+    json_str = vchan->prepare_response(gc, vchan->state->gen);
+    if (!json_str)
+        return ERROR_INVAL;
+
+    ret = vchan_write(gc, vchan->state, json_str);
+    if (ret)
+        return ret;
+
+    return vchan_write(gc, vchan->state, VCHAN_EOM);
+}
+
+static libxl_domid vchan_find_server(libxl__gc *gc, char *xs_dir, char *xs_file)
+{
+    char **domains;
+    unsigned int i, n;
+    libxl_domid domid = DOMID_INVALID;
+
+    domains = libxl__xs_directory(gc, XBT_NULL, xs_dir, &n);
+    if (!n)
+        goto out;
+
+    for (i = 0; i < n; i++) {
+        const char *tmp;
+        int d;
+
+        if (sscanf(domains[i], "%d", &d) != 1)
+            continue;
+
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/%d/data/%s", xs_dir, d, xs_file));
+        /* Found the domain where the server lives. */
+        if (tmp) {
+            domid = d;
+            break;
+        }
+    }
+
+out:
+    return domid;
+}
+
+static int vchan_init_client(libxl__gc *gc, struct vchan_state *state,
+                             bool is_server)
+{
+    if (is_server) {
+        state->ctrl = libxenvchan_server_init(NULL, state->domid,
+                                              state->xs_path, 0, 0);
+        if (!state->ctrl) {
+            perror("Couldn't initialize vchan server");
+            exit(1);
+        }
+
+    } else {
+        state->ctrl = libxenvchan_client_init(CTX->lg, state->domid,
+                                              state->xs_path);
+        if (!state->ctrl) {
+            LOGE(ERROR, "Couldn't initialize vchan client");
+            return ERROR_FAIL;
+        }
+    }
+
+    state->ctrl->blocking = 1;
+    state->select_fd = libxenvchan_fd_for_select(state->ctrl);
+    if (state->select_fd < 0) {
+        LOGE(ERROR, "Couldn't read file descriptor for vchan client");
+        return ERROR_FAIL;
+    }
+
+    LOG(DEBUG, "Initialized vchan %s, XenSore at %s",
+        is_server ? "server" : "client", state->xs_path);
+
+    return 0;
+}
+
+struct vchan_state *vchan_init_new_state(libxl__gc *gc, libxl_domid domid,
+                                         char *vchan_xs_path, bool is_server)
+{
+    struct vchan_state *state;
+    yajl_gen gen;
+    int ret;
+
+    gen = libxl_yajl_gen_alloc(NULL);
+    if (!gen) {
+        LOGE(ERROR, "Failed to allocate yajl generator");
+        return NULL;
+    }
+
+#if HAVE_YAJL_V2
+    /* Disable beautify for data */
+    yajl_gen_config(gen, yajl_gen_beautify, 0);
+#endif
+
+    state = libxl__zalloc(gc, sizeof(*state));
+    state->domid = domid;
+    state->xs_path = vchan_xs_path;
+    state->gc = gc;
+    ret = vchan_init_client(gc, state, is_server);
+    if (ret) {
+        state = NULL;
+        yajl_gen_free(gen);
+    }
+
+    state->gen = gen;
+
+    return state;
+}
+
+char *vchan_get_server_xs_path(libxl__gc *gc, libxl_domid domid, char *srv_name)
+{
+    return GCSPRINTF(VCHAN_SRV_DIR "/%d/data/%s", domid, srv_name);
+}
+
+/*
+ * Wait for the server to create the ring and event channel:
+ * since the moment we create a XS folder to the moment we start
+ * watching it the server may have already created the ring and
+ * event channel entries. Thus, we cannot watch reliably here without
+ * races, so poll for both entries to be created.
+ */
+static int vchan_wait_server_available(libxl__gc *gc, const char *xs_path)
+{
+    char *xs_ring, *xs_evt;
+    int timeout_ms = 5000;
+
+    xs_ring = GCSPRINTF("%s/ring-ref", xs_path);
+    xs_evt = GCSPRINTF("%s/event-channel", xs_path);
+
+    while (timeout_ms) {
+        unsigned int len;
+        void *file;
+        int entries = 0;
+
+        file = xs_read(CTX->xsh, XBT_NULL, xs_ring, &len);
+        if (file) {
+            entries++;
+            free(file);
+        }
+
+        file = xs_read(CTX->xsh, XBT_NULL, xs_evt, &len);
+        if (file) {
+            entries++;
+            free(file);
+        }
+
+        if (entries == 2)
+            return 0;
+
+        timeout_ms -= 10;
+        usleep(10000);
+    }
+
+    return ERROR_TIMEDOUT;
+}
+
+struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name)
+{
+    libxl_domid domid;
+    char *xs_path, *vchan_xs_path;
+    libxl_uuid uuid;
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    domid = vchan_find_server(gc, VCHAN_SRV_DIR, srv_name);
+    if (domid == DOMID_INVALID) {
+        LOGE(ERROR, "Can't find vchan server");
+        return NULL;
+    }
+
+    xs_path = vchan_get_server_xs_path(gc, domid, srv_name);
+    LOG(DEBUG, "vchan server at %s\n", xs_path);
+
+    /* Generate unique client id. */
+    libxl_uuid_generate(&uuid);
+
+    vchan_xs_path = GCSPRINTF("%s/" LIBXL_UUID_FMT, xs_path,
+                              LIBXL_UUID_BYTES((uuid)));
+
+    if (!xs_mkdir(ctx->xsh, XBT_NULL, vchan_xs_path)) {
+        LOG(ERROR, "Can't create xs_dir at %s", vchan_xs_path);
+        return NULL;
+    }
+
+    if (vchan_wait_server_available(gc, vchan_xs_path)) {
+        LOG(ERROR, "Failed to wait for the server to come up at %s",
+            vchan_xs_path);
+        return NULL;
+    }
+
+    return vchan_init_new_state(gc, domid, vchan_xs_path, false);
+}
+
+void vchan_fini_one(libxl__gc *gc, struct vchan_state *state)
+{
+    if (!state)
+        return;
+
+    LOG(DEBUG, "Closing vchan");
+    libxenvchan_close(state->ctrl);
+
+    yajl_gen_free(state->gen);
+}
diff --git a/tools/libs/light/libxl_vchan.h b/tools/libs/light/libxl_vchan.h
new file mode 100644
index 0000000000..0968875298
--- /dev/null
+++ b/tools/libs/light/libxl_vchan.h
@@ -0,0 +1,92 @@
+/*
+    Common definitions for JSON messages processing by vchan
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
+#ifndef LIBXL_VCHAN_H
+#define LIBXL_VCHAN_H
+
+#include <libxenvchan.h>
+
+struct vchan_state;
+
+struct vchan_info {
+    struct vchan_state *state;
+
+    /* Process request and produce the result by adding json-objects to gen .*/
+    int (*handle_request)(libxl__gc *gc, yajl_gen gen,
+                      const libxl__json_object *request);
+    /* Convert the prepared response into JSON string. */
+    char *(*prepare_response)(libxl__gc *gc, yajl_gen gen);
+
+    /* Prepare request as JSON string which will be sent. */
+    char *(*prepare_request)(libxl__gc *gc, yajl_gen gen, char *request,
+                             libxl__json_object *args);
+    /* Handle response and produce the output suitable for the requester. */
+    int (*handle_response)(libxl__gc *gc, const libxl__json_object *response,
+                           libxl__json_object **result);
+
+    /* Handle new client connection on the server side. */
+    int (*handle_new_client)(libxl__gc *gc);
+
+    /* Buffer info. */
+    size_t receive_buf_size;
+    size_t max_buf_size;
+};
+
+int libxl__vchan_field_add_string(libxl__gc *gc, yajl_gen hand,
+                                  const char *field, char *val);
+
+static inline libxl__json_object *libxl__vchan_start_args(libxl__gc *gc)
+{
+    return libxl__json_object_alloc(gc, JSON_MAP);
+}
+
+void libxl__vchan_arg_add_string(libxl__gc *gc, libxl__json_object *args,
+                                 char *key, char *val);
+void libxl__vchan_arg_add_bool(libxl__gc *gc, libxl__json_object *args,
+                               char *key, bool val);
+
+libxl__json_object *vchan_send_command(libxl__gc *gc, struct vchan_info *vchan,
+                                       char *cmd, libxl__json_object *args);
+
+void vchan_reset_generator(struct vchan_state *state);
+
+int vchan_process_command(libxl__gc *gc, struct vchan_info *vchan);
+
+char *vchan_get_server_xs_path(libxl__gc *gc, libxl_domid domid, char *srv_name);
+
+struct vchan_state *vchan_init_new_state(libxl__gc *gc, libxl_domid domid,
+                                         char *vchan_xs_path, bool is_server);
+
+struct vchan_state *vchan_new_client(libxl__gc *gc, char *srv_name);
+
+void vchan_fini_one(libxl__gc *gc, struct vchan_state *state);
+
+void vchan_dump_state(libxl__gc *gc, struct vchan_state *state);
+void vchan_dump_gen(libxl__gc *gc, yajl_gen gen);
+
+#endif /* LIBXL_VCHAN_H */
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
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index b7f439121a..5dfff7fc6f 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -15,6 +15,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 CFLAGS_XL += $(CFLAGS_libxenlight)
 CFLAGS_XL += $(CFLAGS_libxenutil)
 CFLAGS_XL += -Wshadow
+CFLAGS_XL += $(CFLAGS_libxenvchan)
 
 XL_OBJS-$(CONFIG_X86) = xl_psr.o
 XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
@@ -33,7 +34,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.25.1


