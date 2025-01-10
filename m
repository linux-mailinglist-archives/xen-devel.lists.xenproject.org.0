Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D98A08C49
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 10:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869350.1280816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBQl-0005ri-IP; Fri, 10 Jan 2025 09:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869350.1280816; Fri, 10 Jan 2025 09:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBQl-0005qD-FR; Fri, 10 Jan 2025 09:35:51 +0000
Received: by outflank-mailman (input) for mailman id 869350;
 Fri, 10 Jan 2025 09:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWBQk-0005c8-68
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 09:35:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d5f3a5-cf36-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 10:35:49 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso551254366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 01:35:49 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9562519sm149700166b.132.2025.01.10.01.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:35:48 -0800 (PST)
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
X-Inumbo-ID: 46d5f3a5-cf36-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736501749; x=1737106549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heAlNNCsF7d+p9roHrTGYRStQWTNbLe8js38yKlHKDA=;
        b=Ox1eoZnPJ42O5nX2N6Yazmcl8wHaHdeor61p73hamVJtDfsoNYLqLmDxmIN+SGNbdl
         uS/5vWAKJKpI9aGDJ/asjm70rCZpK3OpXrsz1BBq/z/yZX6FEHy17toUBDzOTUm4nV0k
         gwACi8XT4PqwlfluJYKRqXgRgAFXxlvw848aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501749; x=1737106549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heAlNNCsF7d+p9roHrTGYRStQWTNbLe8js38yKlHKDA=;
        b=ZK9Bu8FDdHjNBc2YF+knlPOAZP0D6kWKwYXtQSDHFwj7DDm7w0c7QbmNPy/p0t5OsP
         zKbDgAR3HkGpLiI1De01dg8R+f3o5AGlQoJ4eKLWWGnv11rE7N1pWMEc9wjzwW7WY7OB
         py1X8Z9bkDkwwqbcGDJoLIB0Y3C1ORll/kcTzy5Bn/8acuJ2ksb4rFUUOJ0M2b1nJLGV
         NRghJTIqAOIOQ+8D5dCMe1VFy7wgvx9elMPq2K98hLecgnH65VVFplJDoJm6AqGfajM8
         xLj8Y07/kXUi38bE/kmsYTygHHYSGmvrl2OmspGJ+Ni9RJ0DlmfqgqqELOP8dv5ejcMz
         uyaw==
X-Forwarded-Encrypted: i=1; AJvYcCWIC2GOGN+4Zl5JMiT55IE9R3e9Fz6PR4kJSRz3XJTrYH526+++rIUFPdOpHbWOLfiHIsWQYm/+/Mw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvKS9QIFaKPw5KmhdHuV0mERC50CXl8Tn2FIgmkEyw/fa9OzNx
	jcbi7v6AzswKaUOQQyL/Qh2kMiy+F9V4+Qj5WR399wcye8touylFMrQXGKqlbU20WKbvuPWB7id
	F
X-Gm-Gg: ASbGnctOWh+8WHGxebKS2VpeIvk4eMxpeQ0eS6vXWWHYoxLAkNLy632ev69DT0c1MyR
	D094qFjAjng/ziRYmJXbvs9qusmfurvd5pM0afp6WTH8WOX0waHJgi05BaWw9OZkX6Y103fs9NF
	dfxMDLA/MZtvMxpbB8H/bhbg0Ci/AXibWJfHgsYIHHWt7m9MaS2yMXIujqI5mEeR9QPHx18Swjw
	4OWEKyeg3Pd9e93eqst97DkqpzDXAck7UvQy23i2mykKNMzOu+qJMaVA129iysFQs8=
X-Google-Smtp-Source: AGHT+IF9I+Bn1k3Y/QmCjZal+54tLnhYTkVBay0iOh00OvkCwpx1fGD8280XTGNWMnzZIdz6+zIOPQ==
X-Received: by 2002:a17:907:7282:b0:a9a:6c41:50a8 with SMTP id a640c23a62f3a-ab2c3c79cf5mr496036166b.17.1736501749069;
        Fri, 10 Jan 2025 01:35:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] hw/xen: Add xs_node_read() helper function
Date: Fri, 10 Jan 2025 10:35:30 +0100
Message-ID: <20250110093531.23221-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110093531.23221-1-roger.pau@citrix.com>
References: <20250110093531.23221-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Woodhouse <dwmw@amazon.co.uk>

This returns the full contents of the node, having created the node path
from the printf-style format string provided in its arguments.

This will save various callers from having to do so for themselves (and
from using xs_node_scanf() with the non-portable %ms format string.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[remove double newline and constify trace parameters]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org
---
 hw/xen/trace-events             |  1 +
 hw/xen/xen-bus-helper.c         | 22 ++++++++++++++++++++++
 include/hw/xen/xen-bus-helper.h |  4 ++++
 3 files changed, 27 insertions(+)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index a07fe41c6d3b..461dee7b239f 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -39,6 +39,7 @@ xs_node_create(const char *node) "%s"
 xs_node_destroy(const char *node) "%s"
 xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
+xs_node_read(const char *path, const char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
 
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index b2b2cc9c5d5e..0fba7946c55e 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -142,6 +142,28 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
     return rc;
 }
 
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   unsigned int *len, Error **errp,
+                   const char *node_fmt, ...)
+{
+    char *path, *value;
+    va_list ap;
+
+    va_start(ap, node_fmt);
+    path = g_strdup_vprintf(node_fmt, ap);
+    va_end(ap);
+
+    value = qemu_xen_xs_read(h, tid, path, len);
+    trace_xs_node_read(path, value);
+    if (!value) {
+        error_setg_errno(errp, errno, "failed to read from '%s'", path);
+    }
+
+    g_free(path);
+
+    return value;
+}
+
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
                                     const char *key, xs_watch_fn fn,
                                     void *opaque, Error **errp)
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index d8dcc2f0107d..6478d25be5e6 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -37,6 +37,10 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
                   const char *fmt, ...)
     G_GNUC_SCANF(6, 7);
+char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
+                   unsigned int *len, Error **errp,
+                   const char *node_fmt, ...)
+    G_GNUC_PRINTF(5, 6);
 
 /* Watch node/key unless node is empty, in which case watch key */
 struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
-- 
2.46.0


