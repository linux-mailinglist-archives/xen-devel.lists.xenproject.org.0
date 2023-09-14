Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18B7A081E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602360.938944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmP-0004Qx-Px; Thu, 14 Sep 2023 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602360.938944; Thu, 14 Sep 2023 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmP-0004Gw-DJ; Thu, 14 Sep 2023 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 602360;
 Thu, 14 Sep 2023 14:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmN-0002WX-4H
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:15 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd05cec2-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:13 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bcb89b4767so15732981fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:12 -0700 (PDT)
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
X-Inumbo-ID: fd05cec2-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703433; x=1695308233; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5FVW5lFgXbPxKRgrUE4uLRflweOsPkQ4ZLusD9BFg8=;
        b=cljFYE1UwQScuPiKUuHkUD6lwaOewCU7kUW6hZXTg4NOCFDZ4iNpNS1vqOrnPSuL9v
         IDFGutBynE67oom0HNg9vB5ziakMO8RmgO2ErHIY+EHbBdEVxVnSKhY0+AYl4wUKZV1s
         S6ZR8hQ25V9j+R15Ycx39GOuNmwodORkLOUUNJT8HlP1zIL8kLC1/Nl2NWeJIiIe6kOz
         OEy2Z6xQJRvZLqwOHKWYq4Ssy/chVIXt54K4d4O/o/wRc8ehHIvN2YsiSBevyHOuxlvl
         iZjh+r9d7m5ga7CL4P7g3Hc4BRnLbEMwfvHhA08obbhM46gX2pmhkEB4xRH0Na9VSOLb
         HfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703433; x=1695308233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5FVW5lFgXbPxKRgrUE4uLRflweOsPkQ4ZLusD9BFg8=;
        b=OdIWIaqFD18MgODfom5CchDq5Ei+TvUALodRJjiOjyWAPm0UBkDk38nhWWrP3Bi7ad
         8z5Pv9/vW8yUMDVDYB/WUqMy+Mnw8SKxAp4mn2+neTtcmDZLYtUtCfsaDrj5OfJ3ZP5i
         mnrXeHLtHVM9HwrKlydcNPrwLCfE1CKboR1Nx4RV03m1zi465Mei62rfJkp5LTil1Eso
         jmUIjTfQwhBnHC0hOPjvO1f+rcOatPvDl4yFH0VNX6vyVmksFh+yuu9U5mN/p4CqAw6y
         msQ3rM2A0Q2hz9SHUYniy7NUJLan/lF+W0dKBgtHqsLYyM7Ki6YZi5l/5Mm10PcqKEhK
         1Z5A==
X-Gm-Message-State: AOJu0YwX0UqbbP0Vw9+44RxtgUzxS7J/bu6XMf3JWmZ+Fn+nekL6fxG6
	Pyg1Dv1mUSPrVYlI/of+iV4vQHlap4c=
X-Google-Smtp-Source: AGHT+IElB/BHMWUB5mcY+Z4K/FtyqkkGTLUirJQ2ikpAhSDN72YU33+mS9+23YZrIt2HJ21oIA0mtA==
X-Received: by 2002:a05:651c:10d:b0:2bc:b29e:8ff6 with SMTP id a13-20020a05651c010d00b002bcb29e8ff6mr5141859ljb.7.1694703432878;
        Thu, 14 Sep 2023 07:57:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 07/29] xen/asm-generic: introduce stub header guest_atomics.h
Date: Thu, 14 Sep 2023 17:56:28 +0300
Message-ID: <96473b36fdfbb62eba8cd207cd8701f3827207d4.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/guest_atomics.h | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 xen/include/asm-generic/guest_atomics.h

diff --git a/xen/include/asm-generic/guest_atomics.h b/xen/include/asm-generic/guest_atomics.h
new file mode 100644
index 0000000000..6c4e79350a
--- /dev/null
+++ b/xen/include/asm-generic/guest_atomics.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_GUEST_ATOMICS_H
+#define __ASM_GENERIC_GUEST_ATOMICS_H
+
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+                                                                            \
+    return 0;                                                               \
+}
+
+#define guest_bitop(name)                                                   \
+static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+}
+
+guest_bitop(set_bit)
+guest_bitop(clear_bit)
+guest_bitop(change_bit)
+
+#undef guest_bitop
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
+
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+
+#endif /* __ASM_GENERIC_GUEST_ATOMICS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


