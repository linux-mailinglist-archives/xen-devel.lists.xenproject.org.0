Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EB68DC00
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491186.760185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFL-0004Ky-S9; Tue, 07 Feb 2023 14:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491186.760185; Tue, 07 Feb 2023 14:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFL-0004Io-OX; Tue, 07 Feb 2023 14:46:59 +0000
Received: by outflank-mailman (input) for mailman id 491186;
 Tue, 07 Feb 2023 14:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFJ-00043Z-QZ
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:46:57 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4515cb25-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:46:57 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id i5so6624587wrc.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:46:57 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:46:56 -0800 (PST)
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
X-Inumbo-ID: 4515cb25-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tgYfAfD7y5+s+fFwercTLYRC593TWNu/7OHh5VrJ1Y=;
        b=mtUiH24LSxdP83e3/HoZXgc0OSVrOXMZMcwetkPgnyCh7NTtvPvHdSqhUmfgoOXfjG
         3Vy3kMX6XdDkBUxrJRZiL802ZUViLF/QSv8ug/V7uWD32qsl9Gxi/kmfHz2NEyfLZ4He
         woSGDLNeeutwfm3i3ZY86XtvDhzsNqVIcdkBHVD6FX2m1TsriDf9AeJsVWPkTLBwndYB
         nJT8PrAIIVMvMmm8N8cQO/eQEum5PioQprmtXeT01A0fmCv7EgpXgVhzQuTyfVWzJgyw
         WzfWMeh67YspgiKw6C5DE2xLTKEd/5HZQwqrpN/ugVtTJ+0A3sGYknkruujams3oE0mJ
         cy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tgYfAfD7y5+s+fFwercTLYRC593TWNu/7OHh5VrJ1Y=;
        b=sq3Ehho7Hv/y/9Pp7Z3A8n7y1jG3+wRncBzjfoO+khrNp9AiAV6KAAVmZ++d4m9u+G
         YcaYNG8F5Rj3ei5ANKg7OPcQHi7Dt1UoCJKIY7IvbAT06JJdUAckn7bJCDr7qD3JiH4C
         qLJ5p0Q6OTA29dagEz8jWaFSeXLrO4rx9C8hGjFsBcXQZZHi9KMa6fK+3tGEyDJpbdzD
         8iNP5frkJJLYBZs7gCEHiaIuHLLiDjsJQTAFDgLpu4/K5lJwAHfVUxp+iMRMA/9+4C7N
         jPpKkGFV26qhtiEJH7ZKAtMr67uOFmWa6CVh2Fz9BxbTZKCRoc7+astC3q7PbgQ+vBBG
         M5rA==
X-Gm-Message-State: AO0yUKVYtYWUCCc1ukBDAeM6AUKkhP36wVUahWjSaycdUscWcbtSOKz1
	kyohqejqg+gQI9w3QWEIsJOcY2ECF34=
X-Google-Smtp-Source: AK7set/Ro8PcNKY56BKu1kk8MYAYlHQ4VC0V0zDkbBq20MZDeqvG877jB1ZF4xqM4qub7WdYBiNxFg==
X-Received: by 2002:a05:6000:110e:b0:2bf:95fb:e5b3 with SMTP id z14-20020a056000110e00b002bf95fbe5b3mr2886114wrw.33.1675781216795;
        Tue, 07 Feb 2023 06:46:56 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 02/14] xen/riscv: add <asm/asm.h> header
Date: Tue,  7 Feb 2023 16:46:37 +0200
Message-Id: <0c7192216497663865fa220c95301c357a846568.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/include/asm/asm.h | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/asm.h

diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
new file mode 100644
index 0000000000..6d426ecea7
--- /dev/null
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only) */
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_ASM_H
+#define _ASM_RISCV_ASM_H
+
+#ifdef __ASSEMBLY__
+#define __ASM_STR(x)	x
+#else
+#define __ASM_STR(x)	#x
+#endif
+
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b)	__ASM_STR(a)
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b)	__ASM_STR(b)
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define REG_L		__REG_SEL(ld, lw)
+#define REG_S		__REG_SEL(sd, sw)
+
+#if __SIZEOF_POINTER__ == 8
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.dword
+#else
+#define RISCV_PTR		".dword"
+#endif
+#elif __SIZEOF_POINTER__ == 4
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.word
+#else
+#define RISCV_PTR		".word"
+#endif
+#else
+#error "Unexpected __SIZEOF_POINTER__"
+#endif
+
+#if (__SIZEOF_INT__ == 4)
+#define RISCV_INT		__ASM_STR(.word)
+#else
+#error "Unexpected __SIZEOF_INT__"
+#endif
+
+#if (__SIZEOF_SHORT__ == 2)
+#define RISCV_SHORT		__ASM_STR(.half)
+#else
+#error "Unexpected __SIZEOF_SHORT__"
+#endif
+
+#endif /* _ASM_RISCV_ASM_H */
-- 
2.39.0


