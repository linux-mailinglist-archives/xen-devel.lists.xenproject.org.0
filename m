Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F108C7A0939
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602543.939225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoGj-00063C-7l; Thu, 14 Sep 2023 15:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602543.939225; Thu, 14 Sep 2023 15:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoGj-00061C-4s; Thu, 14 Sep 2023 15:28:37 +0000
Received: by outflank-mailman (input) for mailman id 602543;
 Thu, 14 Sep 2023 15:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmg-0002WX-6e
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:34 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076c65fe-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:31 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso17177231fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:29 -0700 (PDT)
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
X-Inumbo-ID: 076c65fe-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703450; x=1695308250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS9dqGCpAOUnguzSJqX9s3B1Z/m07EXLgTDZdpLLavM=;
        b=kcygb0E5rrQV+k6okYFc80Wlj/DSvnITtwhArOfXYbNaczAZuFsdLD+/j+9czhB3rs
         GggP/IObhLE4sSs8ZCa+TFxG2xZaS6MNtgk6kNUfYgm/CvZSsB65HHHwRfl/8D2VZIh1
         B7oMLSWXzrLKwAQ8vczV0dGSddMFHAPFrXrVRhf+qtDfjFJzAROsb5q/vpifXFJ/GOYK
         AYZ6rLkmc4WefJGzDNnUHfFZxpXTYmIsgYPsEP4kaUO5xfPuuEHlGItMw8qjH2PG6lwz
         IeikPHsfy4PEHUkgUbKJQPJ2nqVaaOJAqTGGUq11q3oBy3U2pk7duL/pjBHkOZoOkcCg
         DFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703450; x=1695308250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS9dqGCpAOUnguzSJqX9s3B1Z/m07EXLgTDZdpLLavM=;
        b=GYmJ3lyIpbwELMFkBnMy9bjbfc7nhObTXyqauCUNy863n41CcuwNny3dleAxDfG5b9
         H+y5tqVpEIItUiyO52asu6ksgh770OIoKCMbQvQYHvEtTMRAXm5k0ibHjIRdbccsP+Cd
         ZtnOuZACdhctd8haBFjqnuhic5Iey1VYnK+hY59GH1VH66obtEi6y2NOmDP005JwgQ1r
         uD2ybSOCiTgNjbRkcTjZG/VLeuFwP/XujhaoP2TqQ/HwJ4cRQ/7LTc+mbmNxaMusnvAZ
         SOy1daViE/pNBGu0R9dSmmrAZL0tWG390ZS+3WgUFPJMWFA4oNQZcF6lJF12tlIo280V
         pQOg==
X-Gm-Message-State: AOJu0YxKNe/Zb7pE4R0h4Xdw2IJzlstJdOY8HalKO0bw4TUhna74VBrj
	MQ6ssW/5PAFHkSuTMZY0ERbUgMH3510=
X-Google-Smtp-Source: AGHT+IFFtE1e9BEGsKLK5Ds6M+bdJk/xzKD9OoQM4tv5YIdVTMrAE5TuJ2vKVadFF70V2n7rhOV09Q==
X-Received: by 2002:a2e:b04d:0:b0:2bc:c2cb:cd3f with SMTP id d13-20020a2eb04d000000b002bcc2cbcd3fmr5475467ljl.32.1694703450276;
        Thu, 14 Sep 2023 07:57:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 27/29] xen/asm-generic: introduce stub header numa.h
Date: Thu, 14 Sep 2023 17:56:48 +0300
Message-ID: <102c2a155cc7b14f0a8ea8049672f1d5ecbcd0e5.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/numa.h | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 xen/include/asm-generic/numa.h

diff --git a/xen/include/asm-generic/numa.h b/xen/include/asm-generic/numa.h
new file mode 100644
index 0000000000..028f7b3638
--- /dev/null
+++ b/xen/include/asm-generic/numa.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARCH_GENERIC_NUMA_H
+#define __ARCH_GENERIC_NUMA_H
+
+#include <xen/mm.h>
+
+typedef u8 nodeid_t;
+
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   (cpu_online_map)
+
+extern mfn_t first_valid_mfn;
+
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
+#define __node_distance(a, b) (20)
+
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32;
+}
+
+#define arch_want_default_dmazone() (false)
+
+#endif /* __ARCH_GENERIC_NUMA_H */
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


