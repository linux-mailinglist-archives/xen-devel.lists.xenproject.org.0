Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0E7A081D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602359.938940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmP-0004II-C0; Thu, 14 Sep 2023 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602359.938940; Thu, 14 Sep 2023 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmO-00049S-PV; Thu, 14 Sep 2023 14:57:16 +0000
Received: by outflank-mailman (input) for mailman id 602359;
 Thu, 14 Sep 2023 14:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmM-0002W4-Qu
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:14 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd868efb-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:14 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bfbd7d49e7so16860191fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:13 -0700 (PDT)
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
X-Inumbo-ID: fd868efb-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703434; x=1695308234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H87nIzFyKi3Nj19NY5+iR4gC6MDMil9IpKyKy4GmQIY=;
        b=oZxbhlDujEKNF61mXRlxA1z0tqC08DOnOAVJM8/aRB4gn5kNCHbouRkhsyqRzgYlJr
         Xaq33i/V6ivIU8jKPkxYLcefDLH+U0zsyfBA450N45iMx2ncZzpmAkPLB/47OiiWUlw6
         wMa7QPcPNUh3y6fX9LKo5ZEGLsVxmXgtyme4rlp3leqqDUTkfRihozYs7Yiq2hQd2mJg
         v2Dy7vooiKRWV2Mfv4lu5PjWODc1YK1GJ5M3nSig87MQWrMQhX91HDOk9wVtmd0y/cGE
         pEoheYYbJzi9GIloqjPe3pJOPfmTeTn5YWF/iTh9xOaY+Zra7kb7rAqpm2zoh283LXva
         j74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703434; x=1695308234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H87nIzFyKi3Nj19NY5+iR4gC6MDMil9IpKyKy4GmQIY=;
        b=GUZ5OWRmlzo3W/vBdPDJKXXLEGq4W6wjxJGEu4jaqgAk8KZorOEw5zbwjzHFdyiLMh
         UDy+vb2fCZ0zx7pAXf7ZcIGnwHq89czF+ZzfyiaaaHWg+vqnZRyPGri4X639yZ6jWdJw
         788fF7R9Mc/9FfCoIXbMIJhNsczA6WMYca3LxRRQTeg7m0AbuWs56rhtFzBhrvASiBBm
         FXpBk8Fn5+rv267cefNcWgJIoDqI1XWriqsfLe7lHcuIk7WdNBSJGDYcbaL5f08cPExk
         2c0NeSoaTkT9Q/GTHSmfHFP43uz20u/Ao5IrP8z7ss/huRzUXnzQP2gkN8EcQhuZ8rhm
         /0Hg==
X-Gm-Message-State: AOJu0YxVtHlbBbZ5nhdIAghgtekI057YYPNPGuz+u8jOqiH+kfvjsyn3
	6yvORQT1NdwDYooqGJ4zmx7INMZqKRk=
X-Google-Smtp-Source: AGHT+IHY8IGYkIluEefe3k9SglFjJeyCR9g5u3PGk8FTvrePpQaZayY92otUFnchuqLao1H3dUj4mQ==
X-Received: by 2002:a2e:9791:0:b0:2bc:c557:848a with SMTP id y17-20020a2e9791000000b002bcc557848amr5027250lji.50.1694703433586;
        Thu, 14 Sep 2023 07:57:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 08/29] xen/asm-generic: introduce stub hypercall.h
Date: Thu, 14 Sep 2023 17:56:29 +0300
Message-ID: <bd57ae1fd448b7d2f4188ff705bb5f537ac48521.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/hypercall.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 xen/include/asm-generic/hypercall.h

diff --git a/xen/include/asm-generic/hypercall.h b/xen/include/asm-generic/hypercall.h
new file mode 100644
index 0000000000..d89196fb3e
--- /dev/null
+++ b/xen/include/asm-generic/hypercall.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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


