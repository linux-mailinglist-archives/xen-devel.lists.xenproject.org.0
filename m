Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9B3EA67C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166457.303803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbX-0002jU-3j; Thu, 12 Aug 2021 14:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166457.303803; Thu, 12 Aug 2021 14:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbW-0002hJ-Vs; Thu, 12 Aug 2021 14:22:42 +0000
Received: by outflank-mailman (input) for mailman id 166457;
 Thu, 12 Aug 2021 14:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbU-0002Q2-Ug
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:22:40 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f3e53c-e01f-4b37-950c-1653ded55785;
 Thu, 12 Aug 2021 14:22:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r9so4320564lfn.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:36 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:33 -0700 (PDT)
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
X-Inumbo-ID: 04f3e53c-e01f-4b37-950c-1653ded55785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oJL+jaD3j+tB2hFVXmAv2nPtE4uqfFnnjmMp4UudG8E=;
        b=Ok0YewcvgGM4yeJGorn27Lv/uQbCmYa+oYSKajj4ZrE5uDL9uGeWVcjQljD3XjBDQ+
         sKaUSJX93gXiRpO3QAB5afdUc1IjgkENfwYx5TYrAVDvzeHo3LM2PGbckFyFrpiLMcEr
         fEUTVs09hQjcgdT2UdNdEd5IgEzop3H+qDiBQSH6csiwegggo5sOt/6qKcv0Z54/rWxs
         hGpze9dvH8YwgaM+CGuX5PtVQcwPU/IahzIQpw0s+w+3bQRqR9MbmB/yt1yEWjb1nXJ4
         aGGiDAePxeXv2Zt2JcaWKCnhijOFYPVq+wr+f+cg26ol4sk9JFeLg1Zw4RAc30dtEFJX
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oJL+jaD3j+tB2hFVXmAv2nPtE4uqfFnnjmMp4UudG8E=;
        b=taHVG89kwMVDIVsN/rxz2DVPIrKNimMhHCQQxzEIjP8FGXfJ5WL35oRpM1PNOXrI36
         obWi7v5xagPRHLzdfudGkpF/in+e0Dm7kcSDG5w9vDLov00R8liyRJ3cFQBPa5IGZABc
         2lrys7JvW4FHic+2MWH9cHjZWxId4h4QhRWUdsc/iNP2ClvxWP8zD2GMdP7MWaVIuBlh
         yl6wyYGRKWPOK3+j8WFPKxDVlwloMnw/KOWDN868U4qPjG2DmZPVqzIUdIbqm9busScS
         sfGyTfwagPHlONPqQBZgTndWBMYoY4n1xQnTVFqKaoeXO/9yVwJcxByiTce+eMDmFQmq
         HqnA==
X-Gm-Message-State: AOAM531LAH096+ZB3m9JQREunILtc/jEr808PbZMoLZdROtFJvZo4OzC
	0nrLvQSFYvUIl0rmVi902oFz2P3StyyXWA==
X-Google-Smtp-Source: ABdhPJzTKbIO03oj9tadXceoS/j+YjCsBYKcGbGLpbBoMkCEdQJKKVTNO8JK8n9uGEbU70Ysc2xF+g==
X-Received: by 2002:a05:6512:1148:: with SMTP id m8mr2664586lfg.53.1628778153388;
        Thu, 12 Aug 2021 07:22:33 -0700 (PDT)
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
Subject: [PATCH 1/9] tools/libs/light: Add vchan support to libxl
Date: Thu, 12 Aug 2021 17:22:22 +0300
Message-Id: <20210812142230.19353-2-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812142230.19353-1-vicooodin@gmail.com>
References: <20210812142230.19353-1-vicooodin@gmail.com>

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

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
 tools/libs/light/libxl_vchan.c | 359 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_vchan.h |  81 ++++++++
 tools/xl/Makefile              |   3 +-
 5 files changed, 448 insertions(+), 6 deletions(-)
 create mode 100644 tools/libs/light/libxl_vchan.c
 create mode 100644 tools/libs/light/libxl_vchan.h

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 1bcc97ea8a..ad2cdf32ad 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -29,12 +29,12 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 all: $(PROGS)
 
 xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN_INIT_DOM0_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
 $(INIT_XENSTORE_DOMAIN_OBJS): _paths.h
 
 init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 4a4de12610..f5d34b3371 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -76,6 +76,7 @@ SRCS-y += libxl.c
 SRCS-y += libxl_create.c
 SRCS-y += libxl_dm.c
 SRCS-y += libxl_pci.c
+SRCS-y += libxl_vchan.c
 SRCS-y += libxl_dom.c
 SRCS-y += libxl_exec.c
 SRCS-y += libxl_xshelp.c
@@ -176,7 +177,7 @@ LDUSELIBS-y += $(PTHREAD_LIBS)
 LDUSELIBS-y += -lyajl
 LDUSELIBS += $(LDUSELIBS-y)
 
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) $(CFLAGS_libxenevtchn) -include $(XEN_ROOT)/tools/config.h
 $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
 libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
@@ -240,13 +241,13 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
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
index 0000000000..b533243fd3
--- /dev/null
+++ b/tools/libs/light/libxl_vchan.c
@@ -0,0 +1,359 @@
+/*
+ * Vchan support for JSON messages processing
+ *
+ * Copyright (C) 2021 EPAM Systems Inc.
+ * Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
+ * Author: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
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
+/* Based on QMP Parameters Helpers */
+static void vchan_parameters_common_add(libxl__gc *gc, libxl__json_object **param,
+                                        const char *name, libxl__json_object *obj)
+{
+    libxl__json_map_node *arg = NULL;
+
+    if (!*param) {
+        *param = libxl__json_object_alloc(gc, JSON_MAP);
+    }
+
+    GCNEW(arg);
+
+    arg->map_key = libxl__strdup(gc, name);
+    arg->obj = obj;
+
+    flexarray_append((*param)->u.map, arg);
+}
+
+
+void libxl__vchan_param_add_string(libxl__gc *gc, libxl__json_object **param,
+                                   const char *name, const char *s)
+{
+    libxl__json_object *obj;
+
+    obj = libxl__json_object_alloc(gc, JSON_STRING);
+    obj->u.string = libxl__strdup(gc, s);
+
+    vchan_parameters_common_add(gc, param, name, obj);
+}
+
+void libxl__vchan_param_add_integer(libxl__gc *gc, libxl__json_object **param,
+                                    const char *name, const long long i)
+{
+    libxl__json_object *obj;
+
+    obj = libxl__json_object_alloc(gc, JSON_INTEGER);
+    obj->u.i = i;
+
+    vchan_parameters_common_add(gc, param, name, obj);
+}
+
+/* Returns 1 if path exists, 0 if not, ERROR_* (<0) on error. */
+int xs_path_exists(libxl__gc *gc, const char *xs_path)
+{
+    int rc;
+    const char *dir;
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL, xs_path, &dir);
+    if (rc)
+        return rc;
+    if (dir)
+        return 1;
+    return 0;
+}
+
+libxl_domid vchan_find_server(libxl__gc *gc, char *xs_dir, char *xs_path)
+{
+    char **domains;
+    unsigned int i, n;
+    libxl_domid domid = DOMID_INVALID;
+
+    domains = libxl__xs_directory(gc, XBT_NULL, "/local/domain", &n);
+    if (!n)
+        goto out;
+
+    for (i = 0; i < n; i++) {
+        int d;
+
+        if (sscanf(domains[i], "%d", &d) != 1)
+            continue;
+        if (xs_path_exists(gc, GCSPRINTF("%s%d%s", xs_dir, d, xs_path)) > 0) {
+            /* Found the domain where the server lives. */
+            domid = d;
+            break;
+        }
+    }
+
+out:
+    return domid;
+}
+
+static int vchan_init_client(libxl__gc *gc, struct vchan_state *state, int is_server)
+{
+	if (is_server) {
+		state->ctrl = libxenvchan_server_init(NULL, state->domid, state->xs_path, 0, 0);
+	    if (!state->ctrl) {
+	        perror("Libxenvchan server init failed\n");
+	        exit(1);
+	    }
+	} else {
+		state->ctrl = libxenvchan_client_init(CTX->lg, state->domid,
+                                          state->xs_path);
+	    if (!state->ctrl) {
+	        LOGE(ERROR, "Couldn't intialize vchan client");
+	        return ERROR_FAIL;
+	    }
+	}
+
+    state->select_fd = libxenvchan_fd_for_select(state->ctrl);
+    if (state->select_fd < 0) {
+        LOGE(ERROR, "Couldn't read file descriptor for vchan client");
+        return ERROR_FAIL;
+    }
+
+    LOG(DEBUG, "Intialized vchan client, server at %s", state->xs_path);
+
+    return 0;
+}
+
+/*
+ * TODO: Running this code in multi-threaded environment
+ * The code now assumes that there is only one client invocation process
+ * in one domain. In the future, it is necessary to take into account cases
+ * when within one domain there will be several requests from a client at the
+ * same time. Therefore, it will be necessary to regulate the multithreading
+ * of processes.
+ */
+struct vchan_state *vchan_get_instance(libxl__gc *gc, libxl_domid domid,
+                                       char *vchan_xs_path, int is_server)
+{
+    static struct vchan_state *state = NULL;
+    int ret;
+
+    if (state)
+        return state;
+
+    state = libxl__zalloc(gc, sizeof(*state));
+    state->domid = domid;
+    state->xs_path = vchan_xs_path;
+    ret = vchan_init_client(gc, state, is_server);
+    if (ret)
+        state = NULL;
+
+    return state;
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
+    const size_t eoml = sizeof(END_OF_MESSAGE) - 1;
+    libxl__json_object *o = NULL;
+
+    if (!state->rx_buf_used)
+        return ERROR_NOTFOUND;
+
+    /* Search for the end of a message: "\r\n" */
+    end = memmem(state->rx_buf, state->rx_buf_used, END_OF_MESSAGE, eoml);
+    if (!end)
+        return ERROR_NOTFOUND;
+    len = (end - state->rx_buf) + eoml;
+
+    LOGD(DEBUG, state->domid, "parsing %zuB: '%.*s'", len, (int)len,
+         state->rx_buf);
+
+    /* Replace \r by \0 so that libxl__json_parse can use strlen */
+    state->rx_buf[len - eoml] = '\0';
+    o = libxl__json_parse(gc, state->rx_buf);
+
+    if (!o) {
+        LOGD(ERROR, state->domid, "Parse error");
+        return ERROR_FAIL;
+    }
+
+    state->rx_buf_used -= len;
+    memmove(state->rx_buf, state->rx_buf + len, state->rx_buf_used);
+
+    LOGD(DEBUG, state->domid, "JSON object received: %s", JSON(o));
+
+    *o_r = o;
+
+    return 0;
+}
+
+static libxl__json_object *vchan_handle_message(libxl__gc *gc,
+                                                struct vchan_info *vchan,
+                                                const libxl__json_object *request)
+{
+	libxl__json_object *result = NULL;
+	const libxl__json_object *command_obj;
+	int ret;
+
+	ret = vchan->handle_msg(gc, request, &result);
+	if (ret == ERROR_FAIL) {
+		LOGE(ERROR, "Message handling failed\n");
+	} else if (ret == ERROR_NOTFOUND) {
+		command_obj = libxl__json_map_get(VCHAN_MSG_EXECUTE, request, JSON_ANY);
+		LOGE(ERROR, "Unknown command: %s\n", command_obj->u.string);
+	}
+    return result;
+}
+
+static int set_nonblocking(int fd, int nonblocking)
+{
+    int flags = fcntl(fd, F_GETFL);
+    if (flags == -1)
+        return -1;
+
+    if (nonblocking)
+        flags |= O_NONBLOCK;
+    else
+        flags &= ~O_NONBLOCK;
+
+    if (fcntl(fd, F_SETFL, flags) == -1)
+        return -1;
+
+    return 0;
+}
+
+static libxl__json_object *vchan_process_request(libxl__gc *gc,
+                                                 struct vchan_info *vchan)
+{
+    int rc, ret;
+    ssize_t r;
+    fd_set rfds;
+    fd_set wfds;
+
+    while (true) {
+        FD_ZERO(&rfds);
+        FD_ZERO(&wfds);
+        FD_SET(vchan->state->select_fd, &rfds);
+        ret = select(vchan->state->select_fd + 1, &rfds, &wfds, NULL, NULL);
+        if (ret < 0) {
+            LOGE(ERROR, "Error occured during the libxenvchan fd monitoring\n");
+            return NULL;
+        }
+        if (FD_ISSET(vchan->state->select_fd, &rfds))
+            libxenvchan_wait(vchan->state->ctrl);
+        /* Check if the buffer still have space, or increase size */
+        if (vchan->state->rx_buf_size - vchan->state->rx_buf_used < vchan->receive_buf_size) {
+            size_t newsize = vchan->state->rx_buf_size * 2 + vchan->receive_buf_size;
+
+            if (newsize > vchan->max_buf_size) {
+                LOGD(ERROR, vchan->state->domid,
+                     "receive buffer is too big (%zu > %zu)",
+                     newsize, vchan->max_buf_size);
+                return NULL;
+            }
+            vchan->state->rx_buf_size = newsize;
+            vchan->state->rx_buf = libxl__realloc(gc, vchan->state->rx_buf,
+                                                  vchan->state->rx_buf_size);
+        }
+
+        while (libxenvchan_data_ready(vchan->state->ctrl)) {
+            r = libxenvchan_read(vchan->state->ctrl,
+                                 vchan->state->rx_buf + vchan->state->rx_buf_used,
+                                 vchan->state->rx_buf_size - vchan->state->rx_buf_used);
+            if (r < 0) {
+                LOGED(ERROR, vchan->state->domid, "error reading");
+                return NULL;
+            }
+
+            LOG(DEBUG, "received %zdB: '%.*s'", r,
+                (int)r, vchan->state->rx_buf + vchan->state->rx_buf_used);
+
+            vchan->state->rx_buf_used += r;
+            assert(vchan->state->rx_buf_used <= vchan->state->rx_buf_size);
+
+            libxl__json_object *o = NULL;
+            /* parse rx buffer to find one json object */
+            rc = vchan_get_next_msg(gc, vchan->state, &o);
+            if (rc == ERROR_NOTFOUND)
+                break;
+            else if (rc)
+                return NULL;
+
+            return vchan_handle_message(gc, vchan, o);
+        }
+        if ( !libxenvchan_is_open(vchan->state->ctrl)) {
+            if (set_nonblocking(1, 0))
+                return NULL;
+        }
+    }
+    return NULL;
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
+                                       const char *cmd, libxl__json_object *args)
+{
+    libxl__json_object *result;
+    char *json;
+    int ret;
+
+    json = vchan->prepare_cmd(gc, cmd, args, 0);
+    if (!json)
+        return NULL;
+
+    ret = vchan_write(gc, vchan->state, json);
+    if (ret < 0)
+        return NULL;
+
+    result = vchan_process_request(gc, vchan);
+    return result;
+}
+
+int vchan_process_command(libxl__gc *gc, struct vchan_info *vchan)
+{
+    libxl__json_object *result;
+    char *json;
+    int ret;
+
+    result = vchan_process_request(gc, vchan);
+
+    json = vchan->prepare_cmd(gc, NULL, result, 0);
+    if (!json)
+        return -1;
+
+    ret = vchan_write(gc, vchan->state, json);
+    if (ret < 0)
+        return -1;
+
+    return 0;
+}
diff --git a/tools/libs/light/libxl_vchan.h b/tools/libs/light/libxl_vchan.h
new file mode 100644
index 0000000000..7ded416447
--- /dev/null
+++ b/tools/libs/light/libxl_vchan.h
@@ -0,0 +1,81 @@
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
+#define VCHAN_SERVER 1
+#define VCHAN_CLIENT 0
+
+#define END_OF_MESSAGE "\r\n"
+
+#define VCHAN_MSG_EXECUTE         "execute"
+#define VCHAN_MSG_RETURN          "return"
+#define VCHAN_MSG_ERROR           "error"
+
+struct vchan_state {
+    /* Server domain ID. */
+    libxl_domid domid;
+    /* XenStore path of the server with the ring buffer and event channel. */
+    char *xs_path;
+    struct libxenvchan *ctrl;
+    int select_fd;
+    /* receive buffer */
+    char *rx_buf;
+    size_t rx_buf_size; /* current allocated size */
+    size_t rx_buf_used; /* actual data in the buffer */
+};
+
+typedef int (*vchan_handle_t)(libxl__gc *gc, const libxl__json_object *request,
+                              libxl__json_object **result);
+typedef char* (*vchan_prepare_t)(libxl__gc *gc, const char *cmd,
+                                 libxl__json_object *args, int id);
+struct vchan_info {
+    struct vchan_state *state;
+    vchan_handle_t handle_msg;
+    vchan_prepare_t prepare_cmd;
+    /* buffer info */
+    size_t receive_buf_size;
+    size_t max_buf_size;
+};
+
+void libxl__vchan_param_add_string(libxl__gc *gc, libxl__json_object **param,
+                                   const char *name, const char *s);
+void libxl__vchan_param_add_integer(libxl__gc *gc, libxl__json_object **param,
+                                    const char *name, const long long i);
+int xs_path_exists(libxl__gc *gc, const char *xs_path);
+libxl_domid vchan_find_server(libxl__gc *gc, char *xs_dir, char *xs_path);
+struct vchan_state *vchan_get_instance(libxl__gc *gc, libxl_domid domid,
+                                       char *vchan_xs_path, int is_server);
+libxl__json_object *vchan_send_command(libxl__gc *gc, struct vchan_info *vchan,
+                                       const char *cmd, libxl__json_object *args);
+int vchan_process_command(libxl__gc *gc, struct vchan_info *vchan);
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
index a5d2ee4528..d35570c343 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -15,6 +15,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 CFLAGS_XL += $(CFLAGS_libxenlight)
 CFLAGS_XL += $(CFLAGS_libxenutil)
 CFLAGS_XL += -Wshadow
+CFLAGS_XL += $(CFLAGS_libxenvchan)
 
 XL_OBJS-$(CONFIG_X86) = xl_psr.o
 XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
@@ -38,7 +39,7 @@ $(XL_OBJS): _paths.h
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenvchan) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.17.1


