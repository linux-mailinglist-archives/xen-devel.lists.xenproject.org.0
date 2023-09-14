Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D240A7A0826
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602370.939014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnma-0006oD-Dg; Thu, 14 Sep 2023 14:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602370.939014; Thu, 14 Sep 2023 14:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmZ-0006YE-AK; Thu, 14 Sep 2023 14:57:27 +0000
Received: by outflank-mailman (input) for mailman id 602370;
 Thu, 14 Sep 2023 14:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmV-0002WX-Ok
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:23 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02331945-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:22 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bfb17435e4so16720911fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:22 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:21 -0700 (PDT)
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
X-Inumbo-ID: 02331945-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703441; x=1695308241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw4hs7r1RHwv2uC+iQlr3b+8ho8pcegGsrGnk2bhCNY=;
        b=qzpF6ZRsVQCa2e18UjCer1M88+J6GGVNivNK84B+J1OASihjcCG2F7IBO3xxli66Yb
         qgrvqved6pbLfgnSvct5VRwUOn9Gt21lZns24W5GGIs0Kh2cLkwXNt5JUkkMEYtfOBzO
         cNnxAza9KL1Tmay6kqyiRHh4ZMuGkOzAJ964QtDJA2MrJb0/zbtC5dhwsVJz52EIsukt
         rlCvrZgAPyxxdICHDMxBnw2QZegvNj/sVKfAZTdkR5dJyVq2HEKeuf8tJyhNjWPrEX2O
         BWrOEAZkvl8UZbufZgZyJP7yHqTisn4EwfqiFmWPOi65KrbkYeJ03oVL/XopvjpzuH6a
         yXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703441; x=1695308241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw4hs7r1RHwv2uC+iQlr3b+8ho8pcegGsrGnk2bhCNY=;
        b=WOHSUcxnixFDk6kWPShfJAaIkA3L9g+Nx8lDvs1goEHj9KcixubbBLo9B8bKZyI04N
         O/O2CNARa/9QfnoBKBjjIHNWAuIfuOc2YKlhEnOfYiFJ5n/PMecNuONp+XhYA9NRJDSu
         rWfSEik4ncbejEIXOWl9nTaUAXQgFzY8yiCrRiuG00qChovm+k0PLSY4yWMzwTJWig/t
         aDfJdsck2Hz0KtcbtslhZmHFmQmlIAZQ2I3gZT7RlwMN3tfkDruWEo6gIohkQ8hHCRbW
         WDSjuQ63hKDHenggd+vg7Y8eIsoCclfuDi3u2beS2h/1n9VD+uWnueAAyEknFVREhOYX
         SeyQ==
X-Gm-Message-State: AOJu0Yy76Ta/e8GiR1tfE+3zJdrdQGiI8txMtcPLzyCSzUOeS977SUho
	6ilBGAw+w31ah+gYuEBRX225bJ2pCnQ=
X-Google-Smtp-Source: AGHT+IGOu5qeTStgE788nL5SLYKiQs4E/s6kFsXw64y2Cq98UHtX7SbPMURoIsOH5yR8XKkL1ZLMSQ==
X-Received: by 2002:a2e:9791:0:b0:2bc:c51d:daa1 with SMTP id y17-20020a2e9791000000b002bcc51ddaa1mr5416813lji.39.1694703441419;
        Thu, 14 Sep 2023 07:57:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 18/29] xen/asm-generic: introduce stub header smp.h
Date: Thu, 14 Sep 2023 17:56:39 +0300
Message-ID: <e803ff406f9f597bd42242010a219148d387bba6.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/smp.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 xen/include/asm-generic/smp.h

diff --git a/xen/include/asm-generic/smp.h b/xen/include/asm-generic/smp.h
new file mode 100644
index 0000000000..5d6b7185f1
--- /dev/null
+++ b/xen/include/asm-generic/smp.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SMP_H
+#define __ASM_GENERIC_SMP_H
+
+#ifndef __ASSEMBLY__
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
+#endif
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


