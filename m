Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4DD867EDD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685694.1066853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewi-0000ST-NM; Mon, 26 Feb 2024 17:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685694.1066853; Mon, 26 Feb 2024 17:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewi-0000Pg-In; Mon, 26 Feb 2024 17:39:20 +0000
Received: by outflank-mailman (input) for mailman id 685694;
 Mon, 26 Feb 2024 17:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewg-0007o5-8k
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:18 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a85ce2-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:16 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so47244191fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:16 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:14 -0800 (PST)
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
X-Inumbo-ID: f6a85ce2-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969155; x=1709573955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QXD9Bqte9tbBNNj19StZof4KTDsqaQLUFyEe8EONIE=;
        b=RYnO8C25oJP4vaPalPUe0Gywg5Q41kMBYG3+C6a3V09TZUfmOClrNZFuOAXcuClcL7
         nrn3webVJwDuIgPBD4EOAB8xloTxmHTfGx7ZUh2rxmRSmcxVUbiH05E4GGR4XV1hqgiO
         Uu1mgqKJ9qHGDdLVOeYQyMMrbXy8WScrIs5Wkn8nZxC2a/M5ntb6/8bAqDnfQc6rJsRK
         t0Ilh0CYxU4GPfYD6zByUlabdkZwG/SHfLdFbEtLJBff0Lr4mhePMiY/iVp90ntD08tX
         zTokcHF7MQFi4tZ+oFisd7RQeR77N4w7eCjW5462DZvl+lV2AqgJoHLYRsFBz6u1F9Ew
         AJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969155; x=1709573955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QXD9Bqte9tbBNNj19StZof4KTDsqaQLUFyEe8EONIE=;
        b=QhInZbf+dmUjPLWmLrdkE/p8HUQQIrNNBUdxJ0lA6YLR/JwJ1JTQyptQ2eTGN5j3eU
         UkZHlnnCt8CGbd2Ve2Zkp44bI785zypTzSNLnbRyKCQxfqszavJxMW53NT+DKuyqkVPE
         ZjfjxYZtJvh+aAwc8mE8fBAuywklj3EZqMgtkol/zwtxoQ7jzDHDXJvQSyA0uK0pKWM1
         lBE8yR5YlxsWFQGleEkuKy0MPm6l3vZqXGhoiOeeZruzvSCeeUhBCisPjQrdY+TvAJmT
         gCGzSUHx3WQGNmN4nhouDtjShDwrxCFXCz3OzkqxW5hbA/EgYaRapunj467+ScsJzZSx
         HoFg==
X-Gm-Message-State: AOJu0YwcLmRAR7fL0EI7OOCKUD5drTwmBRFMlUrjM1N1FaT08LPHHyJI
	IOiZ//4VvyEAyxPTr/AoaTJXYfR1L4Qyg75rPA0cKFEU+YmjyLcJkX04QIr1
X-Google-Smtp-Source: AGHT+IFvsPxhN4C3ThBll7DvHcWDkL9leZhN0tUsmEUehjtHp8dOS7FUThlx2z3fbjBdgSnh26b3Yg==
X-Received: by 2002:a2e:be07:0:b0:2d2:86ca:c0d0 with SMTP id z7-20020a2ebe07000000b002d286cac0d0mr3368307ljq.16.1708969155350;
        Mon, 26 Feb 2024 09:39:15 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and flsl() functions
Date: Mon, 26 Feb 2024 18:38:46 +0100
Message-ID: <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions can be useful for architectures that don't
have corresponding arch-specific instructions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/include/asm-generic/bitops/fls.h  | 18 ++++++++++++++++++
 xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h

diff --git a/xen/include/asm-generic/bitops/fls.h b/xen/include/asm-generic/bitops/fls.h
new file mode 100644
index 0000000000..369a4c790c
--- /dev/null
+++ b/xen/include/asm-generic/bitops/fls.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FLS_H_
+#define _ASM_GENERIC_BITOPS_FLS_H_
+
+/**
+ * fls - find last (most-significant) bit set
+ * @x: the word to search
+ *
+ * This is defined the same way as ffs.
+ * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
+ */
+
+static inline int fls(unsigned int x)
+{
+    return generic_fls(x);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
diff --git a/xen/include/asm-generic/bitops/flsl.h b/xen/include/asm-generic/bitops/flsl.h
new file mode 100644
index 0000000000..d0a2e9c729
--- /dev/null
+++ b/xen/include/asm-generic/bitops/flsl.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
+#define _ASM_GENERIC_BITOPS_FLSL_H_
+
+static inline int flsl(unsigned long x)
+{
+    return generic_flsl(x);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */
-- 
2.43.0


