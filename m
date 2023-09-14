Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC357A081B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602356.938910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmM-0003UA-FC; Thu, 14 Sep 2023 14:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602356.938910; Thu, 14 Sep 2023 14:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmM-0003OC-6J; Thu, 14 Sep 2023 14:57:14 +0000
Received: by outflank-mailman (input) for mailman id 602356;
 Thu, 14 Sep 2023 14:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmK-0002W4-7t
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:12 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc029670-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:11 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bfc2b26437so16160121fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
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
X-Inumbo-ID: fc029670-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703431; x=1695308231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svTWqdPYc3ftSZpDKuUWuYkTn6Vp//dh2r2RtkrDP2E=;
        b=XUy1GQBbwZr909HCD9mH92fQ2n9A+WQsYRO1ca2syYNuftSzrw9HWM9fscbnH7CPtl
         h0YvhgqnfN+UFHto8xsrCPvM3oOyzT0CjZoR1McCOXVjap2IiF8BHsiOYiXd+AmaxD4j
         qHUppktg3cHWIx5lGU5r/Q+N4dzUnvG7/SdPjm0EEaWtBb8ErVXakwRnK6C/EPJ+qjER
         vtz700BabUI8xW8Whos4yphk3lO0sZ7EpArGMNay+WJthIf+5vWrYPnEDzjF5x0qRN4P
         y9N/xXlUFwI5Ioz0a6i0Ox7/9bg0ou3rnclsnxeHWVamPO/c47ftvCxrhvYu0ht9oW7O
         ubIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703431; x=1695308231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svTWqdPYc3ftSZpDKuUWuYkTn6Vp//dh2r2RtkrDP2E=;
        b=UY+m5NhZLMR5sq6SjqQwI+cibe2D6qjaxpsNwyPbrleMaAnmMbtFf55Rsu1/T4X4nt
         oo7ik+u7tsUBzMzd0eXQ6ZvW1SXRqbF1Yt7xb/d2zzd1fVlPx+aWQAtsoucx5uTsyQUH
         9czGvEObQVhKRp/BCmI2dxRfczHeopU1Dv3bn4PVQ/5WHg6U3pEkhVKbnxmFPy7QwttK
         5K1QIv3DCHZw4iXJuYUsTWzphHqZ2yW6wgD6hC81PDyxo46FxbuNqDlDdP0/KGGHvREw
         xsXUxsJe+dfgJMJuzUWK95DAnIcxPm3y/pdxK2otHiTijDq+947lbjHRbGRwSAoMq5pm
         9x/Q==
X-Gm-Message-State: AOJu0YxVJIZIYgJAXGThlKXRNra+EtcEtW+WNQ7vAjauYEgMB+bdYjEt
	iavckPQIPxbKesp64NckXRI/TqT+QkI=
X-Google-Smtp-Source: AGHT+IGSzGN+thgWV5HA2e1EpC6tTCT3RVL7noSwopFanb0rR30SRaZ7g6RhKSuz6ZkzQh56VdH+sg==
X-Received: by 2002:a2e:93d7:0:b0:2bb:9781:1a4c with SMTP id p23-20020a2e93d7000000b002bb97811a4cmr5066743ljh.27.1694703431205;
        Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 05/29] xen/asm-generic: introduce stub header event.h
Date: Thu, 14 Sep 2023 17:56:26 +0300
Message-ID: <69563e3f41cb6971f93630d9df59395f159bd3c4.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/event.h | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 xen/include/asm-generic/event.h

diff --git a/xen/include/asm-generic/event.h b/xen/include/asm-generic/event.h
new file mode 100644
index 0000000000..d25ba36aad
--- /dev/null
+++ b/xen/include/asm-generic/event.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_EVENT_H__
+#define __ASM_GENERIC_EVENT_H__
+
+#include <xen/sched.h>
+
+static inline void vcpu_mark_events_pending(struct vcpu *v)
+{
+}
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+}
+
+static inline bool arch_virq_is_global(unsigned int virq)
+{
+    return true;
+}
+
+#endif /* __ASM_GENERIC_EVENT_H__ */
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


