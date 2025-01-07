Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9EA03B3B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866222.1277536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xR-0002PS-Rr; Tue, 07 Jan 2025 09:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866222.1277536; Tue, 07 Jan 2025 09:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xR-0002Kc-NV; Tue, 07 Jan 2025 09:33:05 +0000
Received: by outflank-mailman (input) for mailman id 866222;
 Tue, 07 Jan 2025 09:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tV5xP-0002F7-Nf
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:33:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6428c0e4-ccda-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 10:33:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso68566965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:33:02 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6abesm49900025f8f.90.2025.01.07.01.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:33:01 -0800 (PST)
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
X-Inumbo-ID: 6428c0e4-ccda-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736242382; x=1736847182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXMJwJkD6GoreE4rq36bTo/n6oNP+S5NtP/Em4G4kUk=;
        b=cHoTXeJTR+e0omcIG2xaEIIMXPDIOWUG/4U3DL5P9rnDdAr1Jrp8i2ahA7kYPT4ECs
         I9kLZWMfU4P5j20qFCY1q9zt5kvVRncp9jDHw6JdGQSAYGsfXgMH5HFqCn9eWQpvlRTA
         6DGZf60uHjQrZK6GHj9E3M6cA51DW5EXqTtys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242382; x=1736847182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXMJwJkD6GoreE4rq36bTo/n6oNP+S5NtP/Em4G4kUk=;
        b=pSPLmwka+QeG07tS8tn4Bf2NSlmvSXmeQiF0czKno4+EdLf8qLbUmEDW3dfLrc3fFL
         Rw49yZqPyemPeMK4hMC9ZpozLPegytxI0wFS8JYhWeTfYzXKywWO7Gz5IzClOKsIu2wW
         xlbPAMHMbApNVBNq/38zrRtVZ3OMpwPVFPipMGprWccrv2EUY3QohOIvWcShQLs9BYW6
         Xl1d3MpVBVRuNhJ17cQtWHlnN4XOvpAo5Hyr35zVYRKWAbx1kgj9dlDY7yvrKX50CjMp
         +zzAXr7wMtYPF/98tE+u826b+IQBndupXAWJWJ7f7QACKlCZmQod2iSb38gf7is91Bav
         8FrA==
X-Forwarded-Encrypted: i=1; AJvYcCWZfs0Glt6iuE3YTsjuFkDZ6chufJPGQJffTYVKn/6QzcqD5sNIxoFhf9i2weoq8LLIearOrpNBiBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgICQSL+HkYfEGpZXSeVPwHrpyIFv9/PCtGG7LG/lCtLCHenIv
	gt/WRYMd3kFQUyONfnzy63ZDX0T5ImJhfZiCFKD0QvRe0okriQoTy/fScbvTIT8=
X-Gm-Gg: ASbGncsirMdk5OUAUm9DlIP7GwIF/YSV2TsMwwht++8vSIXmHuKnxPcQuqqcxlw1XPp
	uRFM74A9DkUWu7k7nol2KiHS/pWWeLZUYJL0aHSmrohlQQj4PgrJPw1XuXKSKxCk8y2gDlckN4g
	vW3ygmEjoG93KNFToOosQK8DsUjBPwu29q/y3+RJDSySwR8IZTEDJZAiQAh4NLeQA8fK2AOqoTi
	qs1h+5yJsccC1kMjiOaNw9cCn15DyN7jcYF1/h+amr82dGIfrkn9Rz6K/350g==
X-Google-Smtp-Source: AGHT+IEix0l+GrmL6GlNsHgpdBKlhdge3KcJsVrThXIBxIDP7VrUAOxyB//Zy8/3JjeQgqN+VJe5zw==
X-Received: by 2002:a05:6000:4012:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38a221fa6bamr42191038f8f.13.1736242382216;
        Tue, 07 Jan 2025 01:33:02 -0800 (PST)
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
Subject: [PATCH 2/2] xen: do not use '%ms' scanf specifier
Date: Tue,  7 Jan 2025 10:31:40 +0100
Message-ID: <20250107093140.86180-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250107093140.86180-1-roger.pau@citrix.com>
References: <20250107093140.86180-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'm' parameter used to request auto-allocation of the destination variable
is not supported on FreeBSD, and as such leads to failures to parse.

What's more, the current usage of '%ms' with xs_node_scanf() is pointless, as
it just leads to a double allocation of the same string.  Instead use
qemu_xen_xs_read() to read the whole xenstore node.

Fixes: a783f8ad4ec9 ('xen: add a mechanism to automatically create XenDevice-s...')
Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org
---
 hw/char/xen_console.c | 11 +++++++++--
 hw/xen/xen-bus.c      |  7 +++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index af706c7ef440..18afd214c2f6 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -531,6 +531,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
     const char *name = xen_backend_get_name(backend);
     unsigned long number;
     char *fe = NULL, *type = NULL, *output = NULL;
+    const char *node_path;
     char label[32];
     XenDevice *xendev = NULL;
     XenConsole *con;
@@ -550,7 +551,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
         goto fail;
     }
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
+    node_path = g_strdup_printf("%s/type", fe);
+    type = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
+    g_free(node_path);
+    if (!type) {
         error_setg(errp, "failed to read console device type: ");
         goto fail;
     }
@@ -568,7 +572,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
 
     snprintf(label, sizeof(label), "xencons%ld", number);
 
-    if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL, "%ms", &output) == 1) {
+    node_path = g_strdup_printf("%s/output", fe);
+    output = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
+    g_free(node_path);
+    if (!output) {
         /*
          * FIXME: sure we want to support implicit
          * muxed monitors here?
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index adfc4efad035..9be807649e77 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -142,6 +142,7 @@ again:
 
     opts = qdict_new();
     for (i = 0; i < n; i++) {
+        const char *node_path;
         char *val;
 
         /*
@@ -156,8 +157,10 @@ again:
             !strcmp(key[i], "hotplug-status"))
             continue;
 
-        if (xs_node_scanf(xenbus->xsh, tid, path, key[i], NULL, "%ms",
-                          &val) == 1) {
+        node_path = g_strdup_printf("%s/%s", path, key[i]);
+        val = qemu_xen_xs_read(xenbus->xsh, tid, node_path, NULL);
+        g_free(node_path);
+        if (val) {
             qdict_put_str(opts, key[i], val);
             free(val);
         }
-- 
2.46.0


