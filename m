Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC437A0817
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602354.938891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmK-0002vr-PK; Thu, 14 Sep 2023 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602354.938891; Thu, 14 Sep 2023 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmK-0002qi-Hi; Thu, 14 Sep 2023 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 602354;
 Thu, 14 Sep 2023 14:57:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmJ-0002WX-28
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:11 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa702ba9-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:09 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso17391411fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
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
X-Inumbo-ID: fa702ba9-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703428; x=1695308228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psRu+gzM+CN17BrbiRKWd+xnQKlPi1ihAZzBPzmaXsw=;
        b=kY15qIGGm18c92F/3YtljHv9jG437fHTQNq56yO3eHtVd1EHN7IuZ/kxxeQqf1WNj7
         ngLwg6/8RCYVkdieh5hrKHlX+3AXTtShY4f3h0JiRUs/5ao9qDvIdqj4r60Y/5/U899t
         VtKh4A8cQ7im/HfGCdGzDimiiGSt2eJsiXWyDlMGET1l65bv2xTdN78ckyauXGA1Bntz
         rUIcH5JZXTNicnZPU1LmldTMQDh/5txVw+XuYX+XAC4rJW/llIHqwdofy/2RzEeSvMaB
         BJ9zuHnr+tJ35eDI+ND6cDbWy67UCkzRP/atN2+Ghjmzy7oZHf9f8vxZ96dvQ9j+EjHE
         wLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703428; x=1695308228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psRu+gzM+CN17BrbiRKWd+xnQKlPi1ihAZzBPzmaXsw=;
        b=LucmSWaXqaIdZcfkwPsfilm+YK4bBLWN3qXfdu8kVHfpGniRl2a5AWeQGtckIgMu1g
         fvneOOsxBBD2+tPJodBdImJBBT+bSDgkHm/kGg3jtBAU0TJBQSVPIiFshfhQgI6BB3NM
         RTbY0Q3U3vyq1CKCOU6L/hdCSn3c6/MW3PMby3M1t9i9YaY+OYMo60jGSfRr0Ui6z9kj
         iQgURTkQWqhd9ZqKcTQJrWUzGKsINVC6bp8zJAijFkZ2Pjkuw6T6YNDZXHQF6gTRLgEm
         YF+kvnbfDc8FaarhMPut/aFQ1SithoeAmRuhjxNohsB1Q68rz1K8ncZ3XGUTi01vnAr6
         YqAw==
X-Gm-Message-State: AOJu0Yx/v3FWzNBgGByU6kh32LoKrrS4i8lTx38xIdyO1Muge15oOZsF
	UzQaMMYalNDlpaRKQ3XYtI/6W7lM+qc=
X-Google-Smtp-Source: AGHT+IEXXQASyFIVlBV9gGHhZPLP+vFIQ5ymrvIqc9EFnKLMd4VmQkRuvuPZugWpAdOK8z0kZvTHHg==
X-Received: by 2002:a2e:6e10:0:b0:2bc:b815:d64d with SMTP id j16-20020a2e6e10000000b002bcb815d64dmr5377636ljc.30.1694703428258;
        Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 01/29] xen/asm-generic: introduce stub header spinlock.h
Date: Thu, 14 Sep 2023 17:56:22 +0300
Message-ID: <30743e7391ad474724258441b7ec83affcf6b230.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/spinlock.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 xen/include/asm-generic/spinlock.h

diff --git a/xen/include/asm-generic/spinlock.h b/xen/include/asm-generic/spinlock.h
new file mode 100644
index 0000000000..22a9ec5222
--- /dev/null
+++ b/xen/include/asm-generic/spinlock.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SPINLOCK_H__
+#define __ASM_GENERIC_SPINLOCK_H__
+
+#define arch_lock_acquire_barrier() smp_mb()
+#define arch_lock_release_barrier() smp_mb()
+
+#define arch_lock_relax() cpu_relax()
+#define arch_lock_signal() do { \
+} while(0)
+
+#define arch_lock_signal_wmb() arch_lock_signal()
+
+#endif /* __ASM_GENERIC_SPINLOCK_H__ */
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


