Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B929A7FA21F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642120.1001325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMk-0006IX-Qp; Mon, 27 Nov 2023 14:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642120.1001325; Mon, 27 Nov 2023 14:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cMk-0006Gh-NQ; Mon, 27 Nov 2023 14:13:38 +0000
Received: by outflank-mailman (input) for mailman id 642120;
 Mon, 27 Nov 2023 14:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7cMj-0005in-2c
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:13:37 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27126976-8d2f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:13:35 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so6013173e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:13:35 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x29-20020ac259dd000000b00507b869b068sm1494100lfn.302.2023.11.27.06.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:13:33 -0800 (PST)
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
X-Inumbo-ID: 27126976-8d2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701094414; x=1701699214; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5JXuiZ7y/GlkK062RV6dkVhWvGbS3m7ws90DCrxh6U=;
        b=DN5mpgKDXUujobLQXmeWg1w8cIxwqnuz/Zhx+zWWO2QmELfX5qg4HLLCvQ8dVZ3w7n
         ArZKxk1K5slEQ3reYoAKjZkqtoPxAUJOFeK6PimUwe/ZhK0J6l1gk/SNJ4fufP8g5Imn
         PcN1tttLToH3ha6ZJYgzezMuE+dJL/54nx2qxQfyR7R79GqEjXoU8FpeJhfF15QhAnDr
         pyXKCBPBIS41HaXEhD6fWRo3lDgJMjS02u6LWGq+w5dl03cBi+w46n/61RIwoP1V1Z5S
         DY++1VcImZmS3ypkD+13gkLgDL/8H4ksRnt+x5OT49G7gRgakDhcK/5cut+2h0JPSbSS
         eQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094414; x=1701699214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5JXuiZ7y/GlkK062RV6dkVhWvGbS3m7ws90DCrxh6U=;
        b=sr9rBIEdDwLqMyn5x9mXrkcNz9qhRiDQ3eS9Ki3Q7etQMzIqIb8UTrOmSR1TUS7EOh
         ZotdEDKo6uSTu2Iq4lnF8QUAZsutecjLcqbmATENb9yvwlxSAjPBXkC+YDAvVkQa7ZS2
         v+lf0ZgQL1HXYQyGQDvirmjPU82DDu8XKCLjjrJcQeK5tRuCbU8++zVB/EgJdVhoVSSY
         06MCMKFcccl7C/JyCAOP5OepnkX9HtgI8NVKEcy1rYFDhoNPem+XYEUjyeLFphxPhoqG
         zSbQucUDpoJUd1OPRhItTKhB5t6kUYodn/vRMU/7j946igK8rZkRzRYrdDiwkg/+MMpu
         JUvg==
X-Gm-Message-State: AOJu0YwOWdvh8MGSaIjn1D/zTcfjaUWGh40NxcD8qjiLoFMQCcY6XR0E
	xzj5tEWOedopnDHjpSJ06LdCpP67lphP6g==
X-Google-Smtp-Source: AGHT+IEatNVdXmW8IqzjIx2tCSu+qukrkKZOFVdAtYZechh5EkESLflZ4iddO6h3vLURycoMFC3xFg==
X-Received: by 2002:a05:6512:14f:b0:50b:a75f:c7 with SMTP id m15-20020a056512014f00b0050ba75f00c7mr5490792lfo.57.1701094414107;
        Mon, 27 Nov 2023 06:13:34 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 03/14] xen/asm-generic: introduce generic hypercall.h
Date: Mon, 27 Nov 2023 16:13:16 +0200
Message-ID: <b08aeb05ae905d8ed0d61f3780e20c576950f96b.1701093907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an empty generic hypercall.h for archs which don't
implement it.

Drop PPC's hypercall.h and switch to generic one instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Drop PPC's hypercall.h and switch to generic one.
 - Update the commit message
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - add check that <asm/hypercall.h> isn't included directly.
---
 xen/arch/ppc/include/asm/Makefile    |  1 +
 xen/arch/ppc/include/asm/hypercall.h |  5 -----
 xen/include/asm-generic/hypercall.h  | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/hypercall.h
 create mode 100644 xen/include/asm-generic/hypercall.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index df4c1ebb08..d5e369128c 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += device.h
+generic-y += hypercall.h
 generic-y += paging.h
 generic-y += vm_event.h
diff --git a/xen/arch/ppc/include/asm/hypercall.h b/xen/arch/ppc/include/asm/hypercall.h
deleted file mode 100644
index 1e8ca0ce9c..0000000000
--- a/xen/arch/ppc/include/asm/hypercall.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_HYPERCALL_H__
-#define __ASM_PPC_HYPERCALL_H__
-
-#endif /* __ASM_PPC_HYPERCALL_H__ */
diff --git a/xen/include/asm-generic/hypercall.h b/xen/include/asm-generic/hypercall.h
new file mode 100644
index 0000000000..7743b35c0d
--- /dev/null
+++ b/xen/include/asm-generic/hypercall.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_HYPERCALL_H__
+#error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
+#endif
+
+#ifndef __ASM_GENERIC_HYPERCALL_H__
+#define __ASM_GENERIC_HYPERCALL_H__
+
+#endif /* __ASM_GENERIC_HYPERCALL_H__ */
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
2.43.0


