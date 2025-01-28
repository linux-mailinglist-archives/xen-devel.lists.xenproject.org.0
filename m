Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E32A20978
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878411.1288600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjbz-0001Hp-3s; Tue, 28 Jan 2025 11:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878411.1288600; Tue, 28 Jan 2025 11:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjbz-0001G6-07; Tue, 28 Jan 2025 11:18:31 +0000
Received: by outflank-mailman (input) for mailman id 878411;
 Tue, 28 Jan 2025 11:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p3hs=UU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tcjbx-0001F4-3o
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:18:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99048f01-dd69-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 12:18:28 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43618283dedso58131915e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:18:28 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17630asm13849683f8f.6.2025.01.28.03.18.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Jan 2025 03:18:27 -0800 (PST)
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
X-Inumbo-ID: 99048f01-dd69-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738063107; x=1738667907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYrLqiOXcaakZxlAQt7EUmigWAEMqhVrl2IG/lxJyhw=;
        b=TJjpaU8jMle07/7MkT8rtfEM7YglAa79rNtk93PtGP7PTzN+Zylc106GyVo4wlJSYK
         iFnOlxV/zBoTKfVGgJwitCuRMmk8RXK5ugViM+cxk2jfZOeqd4uacyi/ULXyXZDb0LKO
         cNB20cs7jfMs35362PqzuSMIqlU8axSXG2aPCxFCNQgWgE0O7R8nUQ3KI1iFawabk2J0
         A8LMPSbe3BnvN5gMyfX92zfO1G/4wA1JBHWUaAvoZFm4GdwPuhYB/wwSN0MiPvroYuDp
         VDvzL+BHGEyljuc5b/WgzIEjQ8jhP/C4IwdgmhSfBlkZzYqB8WRMDN/6Yb+/y4cPBbo6
         ukPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063107; x=1738667907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYrLqiOXcaakZxlAQt7EUmigWAEMqhVrl2IG/lxJyhw=;
        b=Ko7R0mVQ/d6weUMvAXoZlwi1221/TcwrSUgUNg9zSw4Ry9uGKaoiuXj0rVV5ydKC52
         w7dKbBi0RVS4dFCrSov9YeF8rh6XelNA3fiZNkQ2huWsmS3GyvwD2Zu9suxRHJ32HkVx
         tT2a4ScvBQI28tComRzKBrphFvaLZCjoN3OuKNEjUsjqT3d67hYk6nZCr/Gh5F8/w0Qk
         jojd6GqpgdYNMgh+jWP8ett0H2OeI4/eNYR9UTGcRABy7WMKMWAC2RvITyZOEuEMQ7NN
         +BXFQC2LOk1XekOR4zA3Ky5X+2K7G4XcyhuV7AaBqmF+PqfK0xqusfyHvTW0wyVUyhcS
         RbIA==
X-Gm-Message-State: AOJu0YwCyo0I0yNmV1ieZY/2Xp9j+Pyf3Hg7s2aOMVM5XliA8e5P6fTV
	slYm4qmvSVpNwLbsBwZrM4dYANUY0MybzGShEi3mv7tM3RjN/b2xhxPzJXjvvrU=
X-Gm-Gg: ASbGncuvh2GGtM1b11GkTMLy9/Lh8FnRVW+qzSknYvPgFxymipE6PYr14Ddxl/3tVI+
	NMfO1KKCGluNuMl0dqEQkCIUMkD1yP4uozXt2DODrnaq3tthhYNAX22S0y7PoluSbM5hROi6Btk
	g1EhvQDmpyd76g6zqevxN6z+5jS6A/zUTzfyh25BWfUW3LZUBz1aiSINiCgkBpKC9BFyAsp7NJV
	IATODPwAET9bbPWifGwBrrAMJrV8pA1OfvxdQEz7F03g/mNR0hfJ2li6c1oMWmq0KcSXHP9FtiY
	B0nAIjgo1fsCLl4Iso7eX6MXpzOhypme0HoGZ3KZKH3YfsgFYSH847Yq1BDt+J/6ng==
X-Google-Smtp-Source: AGHT+IHuyptLaRttD9sYQjH4mdAu0F/Xvz8DUVOj+7pYznWKRjFlcYnhiRd7S+GEQeAAPBF5mr0tSg==
X-Received: by 2002:a05:6000:1887:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-38bf56639d5mr43298969f8f.21.1738063107562;
        Tue, 28 Jan 2025 03:18:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Bernhard Beschow <shentey@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] tests/qtest: Extract qtest_qom_has_concrete_type() helper
Date: Tue, 28 Jan 2025 12:18:20 +0100
Message-ID: <20250128111821.93767-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250128111821.93767-1-philmd@linaro.org>
References: <20250128111821.93767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extract qtest_qom_has_concrete_type() out of qtest_has_device()
in order to re-use it in the following commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


