Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35699867ED4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685697.1066884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewm-0001KD-3C; Mon, 26 Feb 2024 17:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685697.1066884; Mon, 26 Feb 2024 17:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewl-0001Gn-SH; Mon, 26 Feb 2024 17:39:23 +0000
Received: by outflank-mailman (input) for mailman id 685697;
 Mon, 26 Feb 2024 17:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewj-0007o5-I7
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:21 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f89e9859-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:20 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d28464c554so23731621fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:19 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:18 -0800 (PST)
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
X-Inumbo-ID: f89e9859-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969159; x=1709573959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlE/LVl89DqUSGdn7SyMPtS4yZCQebNAKpxbRc6e8bw=;
        b=MpHP7mRNqs6C2VufmAb9Js1Sangzi9czoJPmP3L7wgYCx8W+3tg63hzBc5b0NTe/if
         nob8Eidhp+OVOXkFaiKzhDtF2OBs3W2hSZTt6CEmgTPanK2gnF6Hvuthhp6xI3sPJR75
         vcmBkm1U+yP9V7L5nqSKrPhjmP00HJPVUTZ5fyH9ZFJPUEzTQDVKl4rzCyZbUUIvSN7j
         u8wZ6pu5aO7bW0EmDei4ubvHeBuynUDk3U7BWtqXfDcd91O6jLZt9TP+NKSR/OmTCp2/
         rZbowiNo8gEFdixa9HCRYN8rlSfMadHNQJAfTZyk3jVWEoWTnGs5eppTbdepFUHMHAM0
         nZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969159; x=1709573959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlE/LVl89DqUSGdn7SyMPtS4yZCQebNAKpxbRc6e8bw=;
        b=TqP5iI4YqdSau1U8peTcS6yOIxOh59u/N2sDLXvaxG0tqIt3V1agWHeOOV0tiETG+z
         vlGaIR2dkdBuBMu549CiaFH4QPv6s9+w1hqKg/dS8b/PC8h45LUvu1MvoPTPMOJdZp2j
         8Jlg68WQIDl64lyQTquZ8DfepvFd7nJ3lM55WbsDnAKegl3F9+JhanmgIDIIIpmdyQ4d
         cTkS7UhqN1Y+gdRoeh+IF0oIN+HwymGZMfDxVROKJuVBNWXDzdUxNTrKFOEx6Zt92w6H
         dQl6ATojB7Byc4GQFlrRt1ZxCB8IgB32nYo6KiZ/LW6DP0uqoNXZBUuYemdqxhM9pWCQ
         kyOQ==
X-Gm-Message-State: AOJu0YxB6KPZ09mngZZcGqcX6JlEr4N5C7M7fqsmq8eTrVMr7OKGYeaO
	5gWPHpzeHl2LLSKKMj11I4CuDNUZtaikkImVIK5Q4npv+o326OteRQW8a5pH
X-Google-Smtp-Source: AGHT+IEjSQ8o3xX5dVo2wHraeEsZEaWY/KLvFJUb5rGHMzeij7VJlbzkgb8IFvpjotiU9+JEwAdSJw==
X-Received: by 2002:a2e:854f:0:b0:2d2:8cf7:ed07 with SMTP id u15-20020a2e854f000000b002d28cf7ed07mr1951027ljj.11.1708969158836;
        Mon, 26 Feb 2024 09:39:18 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 07/23] xen/asm-generic: introduce generic hweight64()
Date: Mon, 26 Feb 2024 18:38:49 +0100
Message-ID: <15dde1f7c5157321998b5518238b247a27d9fec4.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic hweight() function can be useful for architectures
that don't have corresponding arch-specific instructions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/include/asm-generic/bitops/hweight.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 xen/include/asm-generic/bitops/hweight.h

diff --git a/xen/include/asm-generic/bitops/hweight.h b/xen/include/asm-generic/bitops/hweight.h
new file mode 100644
index 0000000000..0d7577054e
--- /dev/null
+++ b/xen/include/asm-generic/bitops/hweight.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_HWEIGHT_H_
+#define _ASM_GENERIC_BITOPS_HWEIGHT_H_
+
+/*
+ * hweightN - returns the hamming weight of a N-bit word
+ * @x: the word to weigh
+ *
+ * The Hamming Weight of a number is the total number of bits set in it.
+ */
+#define hweight64(x) generic_hweight64(x)
+
+#endif /* _ASM_GENERIC_BITOPS_HWEIGHT_H_ */
-- 
2.43.0


