Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC08A22BC3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 11:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879444.1289664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvc-0005i0-4B; Thu, 30 Jan 2025 10:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879444.1289664; Thu, 30 Jan 2025 10:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdRvc-0005ft-0m; Thu, 30 Jan 2025 10:37:44 +0000
Received: by outflank-mailman (input) for mailman id 879444;
 Thu, 30 Jan 2025 10:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2sA=UW=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tdRva-0005ei-Na
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 10:37:42 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad0cb19-def6-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 11:37:41 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so6050245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 02:37:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7aa296esm56173275e9.1.2025.01.30.02.37.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 02:37:39 -0800 (PST)
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
X-Inumbo-ID: 3ad0cb19-def6-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738233460; x=1738838260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crB/f7vCa5hLa4LpwRk/HholuVWafRL1UUnQ0YPYia4=;
        b=VqOm0gzhr3quEpr4WnAjq4/GloRgP63zeXrker0ksaWuVyu6KiNcuNVr+4hen4kKa5
         k2fVtHNW2UgN/Bnz01POHaP+0SXcAG430xg9eckUfVYxgEHuFzXNK6Rs3PU3Vi5eZhgw
         1wKXHKrM+4ycSU2ijdCs5fgSw6XqqFXRrWXaevdef3M3BFzWW68TtGNYJvbSGh9EHkv4
         qYiXFMfkTN7lNQ33ighMpjfO8GduvrMTytRDF4sYU4Rhg0WPmAuTqhmX3zL/y2DqG7HV
         uxOMDufadSZbS55AyKy2CoLWuxkktkpHOG4AGpXaUd1bkp4E+qzqijEZOQHpqAQ8WjtZ
         lZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233460; x=1738838260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crB/f7vCa5hLa4LpwRk/HholuVWafRL1UUnQ0YPYia4=;
        b=flxQk5A87/8Y4IfD6ikVzZTlyUpI87hrD3Vh3OcPKdphso7pK9UyULvCipJemKaGcR
         v/7L0i7yeFheG41/y91GqF/ZMgT6+7K4ZtNDvHvwIly85d7n26hFfnqVIHt3o2DWUFvN
         3JbW0LTq9RjmnNEHRgPhONEJci+kIVLXfoPD9HjqJsGcNtbO2+cEyr854iyjEe9kgr4Z
         /EmW9jo7uU/YjvazOC30E3O5Vp0fyto/RKHrc+x5KW6Vy64fPUbapp3KOL7mqM6X3UYF
         4N3FGss+Mq1lqaT4lt9M4RGiWx5J9LuafxBLPm7MOspBOBue6MvdIcThufNWhRMlRYxS
         q7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUtME4wwEVFzxvT99/J23ltIP05RBzSxANI/PG0eP9y/W6M+dPUpVdNNmmlMubZM1ucso+ikpSpFxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcDYOxeNcdd2PA4Cejsdc/rOhb/6sefOsZr3lE1SfHQSOCOm8P
	24MtYooUc3wSAiqnqzg058R+afZEXkMcUzlKxC/pSM/gKW49yf4jeWMM4HRnRYc=
X-Gm-Gg: ASbGncuSOfcz3YcTlXaqNcCEfkdVzyxqImAgPPdfQvF5bWXryzEBQlHe4qwtO1sgT/j
	T7CGgyUF8NEJJ6mOZFkxZfJvwRPKqGYKFU0z/EfFbLcfxAb3bjIYhEO0Mu2HTT4wz3m/nBVS+UD
	lg9bsvdOVuNMfzkWqnPDzSVhX/S/ERTtya+QFDvMroP0Se1Rn/Lp6nWM9K7ECJS8KwhiTnX/TOw
	nA31vZLVD+GDVOx3Ln332jt41lM3RMRSF5jH6Dt4969kXc19CDLCy7a1FZ0xcfu+ymnhWBwQ9BG
	/bSYvLTsnvYOvkKMc6Qr3IRVAoiTZueya1vNuWf49UYuEUC2itpBlGuhAZXjxHwVlw==
X-Google-Smtp-Source: AGHT+IF1gLQHPAIuuIgyNdXKa7cL163sNFjn/3xyiZz/AIADfj2BGfFziESdqjtD8ZX3WUVzbzP+cQ==
X-Received: by 2002:a05:600c:190e:b0:438:d9ae:337b with SMTP id 5b1f17b1804b1-438dc3ca414mr59396625e9.17.1738233459802;
        Thu, 30 Jan 2025 02:37:39 -0800 (PST)
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
Subject: [PATCH v2 2/2] tests/qtest: Make qtest_has_accel() generic
Date: Thu, 30 Jan 2025 11:37:28 +0100
Message-ID: <20250130103728.536-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130103728.536-1-philmd@linaro.org>
References: <20250130103728.536-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit b14a0b7469f ("accel: Use QOM classes for accel types")
accelerators are registered as QOM objects. Use QOM as a generic
API to query for available accelerators. This is in particular
useful to query hardware accelerators such HFV, Xen or WHPX which
otherwise have their definitions poisoned in "exec/poison.h".

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7e9366ad6d5..a55ac57ff7e 100644
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
+    accel_type = g_strconcat(accel_name, ACCEL_CLASS_SUFFIX, NULL);
+
+    return qtest_qom_has_concrete_type("accel", accel_type, &list);
 }
 
 bool qtest_get_irq(QTestState *s, int num)
-- 
2.47.1


