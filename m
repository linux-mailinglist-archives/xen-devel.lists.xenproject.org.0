Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21CA2097B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878412.1288609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjc3-0001av-DL; Tue, 28 Jan 2025 11:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878412.1288609; Tue, 28 Jan 2025 11:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjc3-0001Yg-AX; Tue, 28 Jan 2025 11:18:35 +0000
Received: by outflank-mailman (input) for mailman id 878412;
 Tue, 28 Jan 2025 11:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p3hs=UU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tcjc2-0000yw-Gw
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:18:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba03b7c-dd69-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 12:18:32 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso5107134f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:18:32 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a18931esm14090518f8f.60.2025.01.28.03.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Jan 2025 03:18:31 -0800 (PST)
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
X-Inumbo-ID: 9ba03b7c-dd69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738063112; x=1738667912; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN2sEDLcal0RxGhKQBHLWKpiMjFeqeXkP17+0wDdg70=;
        b=a12zUEniaBT2058n/ao1lzhWP8Q9CwzP4esTbH9jH+89DRcxO9DI/uFNbyhiPtiUXT
         vUZla3RRX5+9FTeuipCkbAEuepRuPOyKsiTFCBfuFuzDkYjwJvTTeQ6W+wzK6ChRgErI
         HhVwRLVz/FU94Da0LT3Kgn1s+S9TB0NCy4G0MgVLy762ZvDl38Ds90KjFX6VG3GTYeHI
         nqqSs7PSxp/0w5sUPkOzpVmxDYA5UK19yghSosf6QBv1jHCIpTozbdLSBVRUl80whlBX
         gHJf57NYI/gxtaYeR6NvTSzOum2qVMqSaO7eL8nFrSnCOQhp2bK26AHEYPKbfau40AlI
         UQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063112; x=1738667912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2sEDLcal0RxGhKQBHLWKpiMjFeqeXkP17+0wDdg70=;
        b=NAPHKbL9JIlhXTd0I+dOBvkM3dtEjUl5k1umC8j+VBSgXuwG8kEjn5KNwZ0+MlTy9P
         /TkW+0hJEsmggQmKd6MzHaBgP+eMZ1eD3QRgkv4EOqw4Ep5FQ3Ycmevtt0sKMbr7mY7/
         Wuie1NGSSfgNC8+OkKuB+Weqyn3NBpZMw0H6eJ+w6nB5Nhrfn25zSxaKRNOk+mL9hFKz
         7j3/GeZKRp4ZZ057byswXp0Mf7Z30yuX7uaroR7Hm8ijbnZy70fTJKGKdQI925Et1K6/
         sKlPD0e7b6HU5dpk4yrJzXnPAmkKz0d2QAQUGBTHUgdwCjtShrn3Yv+FEuX040mUDRD8
         R8Fw==
X-Gm-Message-State: AOJu0YyeMKPPuccHWNWJ4LWkTCfT9JpV8booAmLXTjlY/49csLckx8YA
	TKzstk1/W8Atb/7PqOPA48+08RL1ZcdbcCpjaLQ3PVLgsNFXXRIFPLIwpq2F+SS6iMvfS+eQDbu
	QIqw=
X-Gm-Gg: ASbGncvWSO4l4X5/Rr6tiwCEv0DTR2Es2mo849uPDEE58R/SL8xGz6acLxwr4aCnc/x
	Qi0S4qc6s08ExlH0hZJ+LHEEEKOrRSzPyYJqL9rEG16zfqe+nYiI59Zsa1NnX312Dr8KGxJ2YJl
	FtfqLXh1t7TIKcBl0TFEWo/xzdxDJ4neDUzNZ+srp3cNGZmMqpd5EERzWG2kZoUJWlyqSot9xVF
	0BC6ScgInwOTyJWNJxWl00gOZcaQv8JY4m5lGv4FPnGJkVH6gCHAN8RJsKxIlZJGixXLHlgiulp
	/EmirZJudLOYU0UL+tKXXx8WDpmAdF2/65avbgMaeiG8mRShr2OMcvDNOr18ry8kcA==
X-Google-Smtp-Source: AGHT+IFWxgl1VusfEZKSGe4OFJyb0PxvJeiXznINSQNI0S+Gx4FvxU/nsmXT0fp2RgHAmqCcN0ELvw==
X-Received: by 2002:a5d:54ce:0:b0:38a:88ac:ed14 with SMTP id ffacd0b85a97d-38bf5659e26mr28903902f8f.19.1738063112306;
        Tue, 28 Jan 2025 03:18:32 -0800 (PST)
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
Subject: [PATCH 2/2] tests/qtest: Make qtest_has_accel() generic
Date: Tue, 28 Jan 2025 12:18:21 +0100
Message-ID: <20250128111821.93767-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250128111821.93767-1-philmd@linaro.org>
References: <20250128111821.93767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit b14a0b7469f ("accel: Use QOM classes for accel types")
accelerators are registered as QOM objects. Use QOM as a generic
API to query for available accelerators. This is in particular
useful to query hardware accelerators such HFV, Xen or WHPX which
otherwise have their definitions poisoned in "exec/poison.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7e9366ad6d5..3071dedeff6 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -30,6 +30,7 @@
 
 #include "libqtest.h"
 #include "libqmp.h"
+#include "qemu/accel.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -1030,13 +1031,10 @@ static bool qtest_qom_has_concrete_type(const char *parent_typename,
 
 bool qtest_has_accel(const char *accel_name)
 {
-    if (g_str_equal(accel_name, "tcg")) {
-#if defined(CONFIG_TCG)
-        return true;
-#else
-        return false;
-#endif
-    } else if (g_str_equal(accel_name, "kvm")) {
+    static QList *list;
+    g_autofree char *accel_type = NULL;
+
+    if (g_str_equal(accel_name, "kvm")) {
         int i;
         const char *arch = qtest_get_arch();
         const char *targets[] = { CONFIG_KVM_TARGETS };
@@ -1048,11 +1046,12 @@ bool qtest_has_accel(const char *accel_name)
                 }
             }
         }
-    } else {
-        /* not implemented */
-        g_assert_not_reached();
+        return false;
     }
-    return false;
+
+    accel_type = g_strdup_printf("%s%s", accel_name, ACCEL_CLASS_SUFFIX);
+
+    return qtest_qom_has_concrete_type("accel", accel_type, &list);
 }
 
 bool qtest_get_irq(QTestState *s, int num)
-- 
2.47.1


