Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABABAA22BC5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 11:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879443.1289653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvW-0005Qm-TW; Thu, 30 Jan 2025 10:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879443.1289653; Thu, 30 Jan 2025 10:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvW-0005P0-Q9; Thu, 30 Jan 2025 10:37:38 +0000
Received: by outflank-mailman (input) for mailman id 879443;
 Thu, 30 Jan 2025 10:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2sA=UW=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tdRvV-0005An-Be
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 10:37:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35f1d38a-def6-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 11:37:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so3968455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 02:37:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf831sm1596604f8f.90.2025.01.30.02.37.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 02:37:34 -0800 (PST)
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
X-Inumbo-ID: 35f1d38a-def6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738233455; x=1738838255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg5MaFKnNzop8+TLP/dVC/2mW49fQZIVVDSrPsECg1A=;
        b=jVZ+eM9ci4wkv++lO41pp/yenRzKhVnGQ+IZlBEVACuTzr4nxTqtI7cX9JG7eaLGDy
         CjIYmBEwGUEVVYEFvPZ16XvYJQ/U3BelR3NHszDPnvKqfNs+IKNJkrJAgPg3qTwEDI2R
         DEwAz7b9SMEW77gH0FKmiGc6+3KEmw/OzXbCy+i/+B6RwUeUQzuQLxDDDdsNfpF6ZH3l
         02NRhByO5dTY0i7lcK4Jcfy/2ygYi/E9AjR0glx2+GbHzeRZoojTf/JNXWu8j0V5W44N
         FGqWYgSrxVVjHnRoObHJyPdX2sa14o2rGkclQocYgaRVmoiH+PjOByQUUtjchVe056lX
         YEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233455; x=1738838255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg5MaFKnNzop8+TLP/dVC/2mW49fQZIVVDSrPsECg1A=;
        b=OUPgIqyHuTeza0eCc2l1KgN9JJeUrLv2Inu2n4pjMIGhudxwNBJg/1g6KVwWylV/9K
         qF1aDnNM7PFSilL3nJymCcmsvIwuCeN+as/KjVbzrlk/NPHsujDTD2D+eHXQH0WXs0bf
         HSedLhJGf8iT3X5Utwty5ZsZOpLYmzcMj4lXo+uKBkyiRybjrPZAKILByJkOWVDQsXGB
         XDbK7xVz8T9uad/s8digmyKR+JTqW5Xsmmo8/b3XWPb9ACKKMe64fNmxHHjD9EvfV+6c
         9wB9mBBIdvS6tONy051xlxnuX6CcAfZV/h9IavrYsvHBuzM2nraX3u4eHM9xjrmebowq
         om+A==
X-Forwarded-Encrypted: i=1; AJvYcCXuh2WdiY+e6sjj6a882oheUW4e6JkIQGDpHplGTgqpTJ5f5V7Pghxfq8wRCf7BJhCzrfX73AAnjX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1oIsKEfsNc5J8ioQWZK12x+Yg3fl561mqWVDQFo/bLhtEF7S3
	Vii4eh/E4LHctMJACege9ZiBV+8AbfYZ1piGXfXzYABDbpQxYd7gYC0bEt880LlO/5790QKxySm
	SFUg=
X-Gm-Gg: ASbGncsDQ8AgdZStDVKIGKUQLFG9DeQqZcRA1JBj6g/Zfvnkc45gM06I2d2rC8Gs0TG
	l8O2G4sesfop8ULhP4ErqUQJFMcDzmfbcoQHInzHr61+vXPbhcX7Q/9jJFjGVljwxPjDZVtM+rL
	nHmeM7WoYm5xzfu7XlQKtRnoejxONYKDmrxqL5L1fXb0Kf/EyuF8nJObIFO4w9LaRclDfbVXkdB
	4OpyXpm9P0645vm3+kKeO8Rb9pqy3UUsjOSBVT0ZX1zM0QKqjAcWe8C1GJoWuaSM4qvp2X4sMdi
	5ZgA44mkaO7zIe8du2H2IVwb5z1LRB4t1FVTg1hJBtWHmGM/qwfkg1+/I1OKzBRJTQ==
X-Google-Smtp-Source: AGHT+IG+nd03K6bXfTItyDPlrQaxlloknSN7c9PECZGXc3Uso0wTuNV9xeI8f/uUiqaWMOWrrWjoWg==
X-Received: by 2002:a05:600c:3d9b:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438dc3c39d6mr65674835e9.10.1738233455104;
        Thu, 30 Jan 2025 02:37:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Fabiano Rosas <farosas@suse.de>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] tests/qtest: Extract qtest_qom_has_concrete_type() helper
Date: Thu, 30 Jan 2025 11:37:27 +0100
Message-ID: <20250130103728.536-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130103728.536-1-philmd@linaro.org>
References: <20250130103728.536-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extract qtest_qom_has_concrete_type() out of qtest_has_device()
in order to re-use it in the following commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 89 ++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index a1e105f27f9..7e9366ad6d5 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -978,6 +978,56 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+static bool qtest_qom_has_concrete_type(const char *parent_typename,
+                                        const char *child_typename,
+                                        QList **cached_list)
+{
+    QList *list = cached_list ? *cached_list : NULL;
+    const QListEntry *p;
+    QObject *qobj;
+    QString *qstr;
+    QDict *devinfo;
+    int idx;
+
+    if (!list) {
+        QDict *resp;
+        QDict *args;
+        QTestState *qts = qtest_init("-machine none");
+
+        args = qdict_new();
+        qdict_put_bool(args, "abstract", false);
+        qdict_put_str(args, "implements", parent_typename);
+
+        resp = qtest_qmp(qts, "{'execute': 'qom-list-types', 'arguments': %p }",
+                         args);
+        g_assert(qdict_haskey(resp, "return"));
+        list = qdict_get_qlist(resp, "return");
+        qobject_ref(list);
+        qobject_unref(resp);
+
+        qtest_quit(qts);
+
+        if (cached_list) {
+            *cached_list = list;
+        }
+    }
+
+    for (p = qlist_first(list), idx = 0; p; p = qlist_next(p), idx++) {
+        devinfo = qobject_to(QDict, qlist_entry_obj(p));
+        g_assert(devinfo);
+
+        qobj = qdict_get(devinfo, "name");
+        g_assert(qobj);
+        qstr = qobject_to(QString, qobj);
+        g_assert(qstr);
+        if (g_str_equal(qstring_get_str(qstr), child_typename)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 bool qtest_has_accel(const char *accel_name)
 {
     if (g_str_equal(accel_name, "tcg")) {
@@ -1757,45 +1807,8 @@ bool qtest_has_machine(const char *machine)
 bool qtest_has_device(const char *device)
 {
     static QList *list;
-    const QListEntry *p;
-    QObject *qobj;
-    QString *qstr;
-    QDict *devinfo;
-    int idx;
 
-    if (!list) {
-        QDict *resp;
-        QDict *args;
-        QTestState *qts = qtest_init("-machine none");
-
-        args = qdict_new();
-        qdict_put_bool(args, "abstract", false);
-        qdict_put_str(args, "implements", "device");
-
-        resp = qtest_qmp(qts, "{'execute': 'qom-list-types', 'arguments': %p }",
-                         args);
-        g_assert(qdict_haskey(resp, "return"));
-        list = qdict_get_qlist(resp, "return");
-        qobject_ref(list);
-        qobject_unref(resp);
-
-        qtest_quit(qts);
-    }
-
-    for (p = qlist_first(list), idx = 0; p; p = qlist_next(p), idx++) {
-        devinfo = qobject_to(QDict, qlist_entry_obj(p));
-        g_assert(devinfo);
-
-        qobj = qdict_get(devinfo, "name");
-        g_assert(qobj);
-        qstr = qobject_to(QString, qobj);
-        g_assert(qstr);
-        if (g_str_equal(qstring_get_str(qstr), device)) {
-            return true;
-        }
-    }
-
-    return false;
+    return qtest_qom_has_concrete_type("device", device, &list);
 }
 
 /*
-- 
2.47.1


