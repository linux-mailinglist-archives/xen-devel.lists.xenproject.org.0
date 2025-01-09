Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E037FA07E1B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869002.1280512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvmT-0007Re-F6; Thu, 09 Jan 2025 16:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869002.1280512; Thu, 09 Jan 2025 16:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvmT-0007P3-C4; Thu, 09 Jan 2025 16:53:13 +0000
Received: by outflank-mailman (input) for mailman id 869002;
 Thu, 09 Jan 2025 16:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVvmR-0007Ox-SN
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:53:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3533833f-ceaa-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 17:53:10 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so1646467a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 08:53:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d7d5sm738166a12.66.2025.01.09.08.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 08:53:09 -0800 (PST)
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
X-Inumbo-ID: 3533833f-ceaa-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736441590; x=1737046390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFPG3vtagIjWQDrIfBWtwD87girSPnIfPZVcnJtDFaI=;
        b=mOA4WLSvjLtllt7zku9qbf/rcEUVm6il8OnTyqSoW37WyYkm5iZjvIJArxucg710Nk
         vIGuJLf/WP1Is0SjQoXGuSLDggVQHepTYK+84fPcV2lKFTYB3fijmm3U7+UfU67YkOxI
         8Tp1sr3tMIDvxk8wu88nW9ZMPSKDrwLzT1WZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441590; x=1737046390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFPG3vtagIjWQDrIfBWtwD87girSPnIfPZVcnJtDFaI=;
        b=ThYb3IO6H2Hp7aA2g0tOIzl0hqVzyaDNo3DTPAzafLtj+tx5zq+Jp3uE19O1Ri+V1l
         4fndsf+RiRjEl90t6rJnnxXSw4GGtZIxuyxEL9Stkbkl2lGerDo9qA07RX/NiqPDdgOf
         ScvruxIjqRnVdPz4su0lMAxKm8+VRYj2nQpOzZp7YLkBTin5ofJj1Vg3D775zRlfW3Np
         VgzwrjNf8T9VLaup/Pm8di6nfOhAjOOXqlMADKhHDdAcdS8WLgUAlxBtlUZJM5KXbC9n
         hUL6coKmlDq/Sls57WBQbJ2ldng7twmSe7DqHdXg8vvH/HVQrxkyNvodOEFJlOJBnA3P
         HrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJYIjas52/rKuYFqb+4tpT4cKGzeJLbt7Z22Vr42jp6hf+bZ/3OlpX7rHQKRKO1apMu1svRlOKRUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9exTz9iknof76jMUvEZD9N7Vo8FlN+edrTf6jodj2iTNYqbgH
	Y0DQsUNaaU9hNCOp9RPB9bam9L81Q1eun0S8LLKPjptA1UEntwxzp20aN5JLPn8=
X-Gm-Gg: ASbGncuruJ3KU6AJUCy2N1jojUnOIEsLBCIe/ZSp/mbyNo6u+wGsV3Es39/H5g8J93s
	p4PI1WlSrC2V1yQ69F9iZXMlVYYucdAZKf9QaBRcIhVoxdHd2NLIpbwHH0dEVOO6IUqJ1wNWtdL
	OHnQroezx13J+b5tQ+HxXPdb+w/DlYNB6siJZOxxANlx2mI3KkQYMaJwCY3i0R/chsAKSlOjVFM
	x4Vj4zpI5U0IW+dDxmERhddF0JnKqWO7XDImv/uomAVgPov18NbRMJWM0w1+uJf/94=
X-Google-Smtp-Source: AGHT+IEz6qx9kQS5GG0suU4+aH8afVchE/kbuaGCek4OwD21/xD8B0SAVRHHt950XLLRsbI8wiVm7A==
X-Received: by 2002:a05:6402:5254:b0:5d3:fc60:a504 with SMTP id 4fb4d7f45d1cf-5d972e17891mr6477983a12.20.1736441589808;
        Thu, 09 Jan 2025 08:53:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen: do not use '%ms' scanf specifier
Date: Thu,  9 Jan 2025 17:52:39 +0100
Message-ID: <20250109165239.16851-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'm' parameter used to request auto-allocation of the destination variable
is not supported on FreeBSD, and as such leads to failures to parse.

What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
it just leads to a double allocation of the same string.  Instead introduce and
use xs_node_read() to read the whole xenstore node.

Additionally fix the errors paths to not use error_prepend(), as that could
lead to a segmentation fault because xs_node_scanf() only initializes errp when
returning a value smaller than 0:

Program terminated with signal SIGSEGV, Segmentation fault.
Address not mapped to object.
    fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50)
    at ../qemu-xen-dir-remote/util/error.c:142
142         g_string_append(newmsg, (*errp)->msg);
[...]
(gdb) bt
    (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50) at ../qemu-xen-dir-remote/util/error.c:142
    (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ")
    at ../qemu-xen-dir-remote/util/error.c:152
    (backend=0x43944de00660, opts=0x43944c929000, errp=0x15cd0165ae10)
    at ../qemu-xen-dir-remote/hw/char/xen_console.c:555

With the change to use xs_node_read() instead of xs_node_scanf() errp will
never be initialized, and hence error_setg() should be used unconditionally.

Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce xs_node_read() helper.
 - Merge with errp fixes.
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org
---
 hw/char/xen_console.c           | 12 +++++++-----
 hw/xen/xen-bus-helper.c         | 12 ++++++++++++
 hw/xen/xen-bus.c                |  4 ++--
 include/hw/xen/xen-bus-helper.h |  2 ++
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index ef0c2912efa1..a3591df1af2e 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -550,8 +550,9 @@ static void xen_console_device_create(XenBackendInstance *backend,
         goto fail;
     }
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
-        error_prepend(errp, "failed to read console device type: ");
+    type = xs_node_read(xsh, XBT_NULL, fe, "type");
+    if (!type) {
+        error_setg(errp, "failed to read console device type");
         goto fail;
     }
 
@@ -568,7 +569,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
 
     snprintf(label, sizeof(label), "xencons%ld", number);
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL, "%ms", &output) == 1) {
+    output = xs_node_read(xsh, XBT_NULL, fe, "output");
+    if (!output) {
         /*
          * FIXME: sure we want to support implicit
          * muxed monitors here?
@@ -582,8 +584,8 @@ static void xen_console_device_create(XenBackendInstance *backend,
     } else if (number) {
         cd = serial_hd(number);
         if (!cd) {
-            error_prepend(errp, "console: No serial device #%ld found: ",
-                          number);
+            error_setg(errp, "console: No serial device #%ld found",
+                       number);
             goto fail;
         }
     } else {
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index b2b2cc9c5d5e..115c5b1a8ce8 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -142,6 +142,18 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
     return rc;
 }
 
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   const char *node, const char *key)
+{
+    char *path = (strlen(node) != 0) ? g_strdup_printf("%s/%s", node, key)
+                                     : g_strdup(key);
+    char *value = qemu_xen_xs_read(h, tid, path, NULL);
+
+    g_free(path);
+
+    return value;
+}
+
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
                                     const char *key, xs_watch_fn fn,
                                     void *opaque, Error **errp)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index adfc4efad035..aaede5d9ecb2 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -156,8 +156,8 @@ again:
             !strcmp(key[i], "hotplug-status"))
             continue;
 
-        if (xs_node_scanf(xenbus->xsh, tid, path, key[i], NULL, "%ms",
-                          &val) == 1) {
+        val = xs_node_read(xenbus->xsh, tid, path, key[i]);
+        if (val) {
             qdict_put_str(opts, key[i], val);
             free(val);
         }
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index d8dcc2f0107d..79f0787332ed 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -37,6 +37,8 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
                   const char *fmt, ...)
     G_GNUC_SCANF(6, 7);
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   const char *node, const char *key);
 
 /* Watch node/key unless node is empty, in which case watch key */
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
-- 
2.46.0


