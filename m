Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEF7EF296
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635112.990888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xu0-0001NS-09; Fri, 17 Nov 2023 12:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635112.990888; Fri, 17 Nov 2023 12:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xtz-0001KA-Sz; Fri, 17 Nov 2023 12:24:51 +0000
Received: by outflank-mailman (input) for mailman id 635112;
 Fri, 17 Nov 2023 12:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xtx-0000iK-V2
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:24:49 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c8a8535-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:24:48 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50aa2abfcfcso185150e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:24:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:24:46 -0800 (PST)
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
X-Inumbo-ID: 4c8a8535-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223887; x=1700828687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4Bl151fhJ0xUdwwLt/MNmOxcrc+o6rAwxdJ/C4d3oY=;
        b=lU0P3zPKzjzYN3PTklf4aqCrinnYngk2gQg86zBfGlluQsW5j4/hx3W0QIOi1Iz3Il
         6em5nfFjeL1ZfR3OYBViwxmLZVlwpFyikOtlCb8vcPcZpevyQV/pXeWh9+7z+cq6zbud
         2MN4224qCkGfDOd8OC61uUJUvL2dImRo6/mgM05YF/fD7GcCSsjIsvj0DAyCsH4NmDor
         VsvELFkAQrFmLYabkMdog8uMxFOne3WC6qAwtp6mDiVkv9dL5dhMtCLUl6y+98ccCX0z
         K0HptO1xvAj0OhWGGsoqiXOkcX6gbO6VWNouBpEuO5zSSfk7L+eoPuMUhuFnH0yMM/X5
         u9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223887; x=1700828687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4Bl151fhJ0xUdwwLt/MNmOxcrc+o6rAwxdJ/C4d3oY=;
        b=RQ0ASPgXG4j+dmmbY0LTmFVYvCwnlDPulDwvBAYmJ273mmgdW8utOjWYbKO0ZbNlo1
         aTlarCkInJKGF1px3YazQCC2gSg9P8zeUU4oua2qAXGpNak5wW5JVNNrieEt+9vjem8k
         2KjWa/xsw71t1R3MLE+5kalpL6e7gUPbsZP47CjWClwaUMFQeBaZagBSln+WJXTCeDG8
         cmi1+iQX3LV4ti2+uDcry7T3xu5w6jjwDXqhQUpe10r1RsXqWvvU4GCtbHAUc90f3y9E
         jfXmt15fMTJ1VhDOz3fVHvoA/d6OM0Jybm4fAxOrr60DeW9vR5O7r38JCW4a2GQVsfbX
         sHSA==
X-Gm-Message-State: AOJu0Yy6eNLA5hgbhsgOhVC4MwdRe3SQ6am8vsXrWHPNYJazy3UYwKLO
	fwEfwiBy/+KbZnFaTckqWWGC3mqMH2Y=
X-Google-Smtp-Source: AGHT+IEQGmAq7M3igpPBDgybVnhLTD9HucQkntc4cm/zOElOFuPdMvw5wfPD0tMgbHWZ7aCU8r1STg==
X-Received: by 2002:a05:6512:941:b0:500:a378:db71 with SMTP id u1-20020a056512094100b00500a378db71mr12212137lft.57.1700223887288;
        Fri, 17 Nov 2023 04:24:47 -0800 (PST)
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
Subject: [PATCH v3 03/14] xen/asm-generic: introduce generic hypercall.h
Date: Fri, 17 Nov 2023 14:24:27 +0200
Message-ID: <47f9117b19cbb616a36f4149a7aeaaffdbfa48a9.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an empty generic hypercall.h for archs which don't
implement it.

Drop PPC's hypercall.h and switch to generic one instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index ece7fa66dd..48d587f35d 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
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
2.41.0


