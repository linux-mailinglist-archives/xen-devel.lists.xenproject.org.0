Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514188CE4B8
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729360.1134530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnK-00044o-K9; Fri, 24 May 2024 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729360.1134530; Fri, 24 May 2024 11:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnK-0003vl-9P; Fri, 24 May 2024 11:09:06 +0000
Received: by outflank-mailman (input) for mailman id 729360;
 Fri, 24 May 2024 11:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnI-0003D0-Nx
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e29255-19be-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 13:09:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a62614b9ae1so102337066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:09:04 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:09:02 -0700 (PDT)
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
X-Inumbo-ID: 07e29255-19be-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548943; x=1717153743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUAxAxl17Un/j2tMvIXlYjzldu2txD+7ziiQaQEA83I=;
        b=hYJP88TGNRM52W25def6gIE/lefzt0O6evaSDhD9VMT2hsWtzKrUtJUn4ttvFEyBx1
         pc5U98BYIeDlUMvgMAQSDm6OiPURDbP3ed9YhKjH4yl5pLaiVPzuvTk2EZosNGBbZvf/
         1X5tEkiEZV5UlD8bnGJiloE9lrKV+cqkHytOTdhlzvio9HTBSn8pGlNpkM2T7aqjV6B8
         uXBAOL/ddK933N9o+QEy9fwYSKcJ0SOmuUQzznbyZwivhBk1asUVVqLXvJUVVpBTZSbR
         +wpn4wV0u8Tj4Ifj9KFMqYsVgExXqpYXkhvYDma48JZDzWtiiVHbuUzhKO2AktVi2WGA
         MhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548943; x=1717153743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUAxAxl17Un/j2tMvIXlYjzldu2txD+7ziiQaQEA83I=;
        b=GdlTraNMOIL9OxYHHs/hLLVNnTBVTqxh84pNhW+BUES9t9KEhVyhXNpb8cz/zg1tO0
         xphWwjtfeJRXJ+TttcCxnRpr+2UF3Mw8DGjKbH+inq/ulTdWDj1GMlIXj0wrhIXKv1ax
         MHcCh0N2Zxj7PKf/CJoEM0ZFLOIrXXUZZs+BjO+FUXHPmFy75LTaoUYayZ3pdc72Rth5
         WIkk+diRpJMyv65cDsUKBEFtLv2DzmM6skcepscXmZoQb/w/jA0CeJd2okhcTqbL3VLq
         yBQ6oNTd4suW/IqjFe0ATfiZuerbzGXQwiILjgaHSGTtf+4YSotT8NO7ZtJvzPUvlhs+
         wKcQ==
X-Gm-Message-State: AOJu0YxacdgaFa8KAMFfIJurnOy+xD8w+3zCGkPVEq7Hn1gm+8av7NS4
	q7u6LJkhg0Oak71foC2sPWWEd23ZWlwqVb8aWZX5FxOcssUo+MnCsmNMnM1A
X-Google-Smtp-Source: AGHT+IHE/a5m9fzX2m1slVE057V0x6OasQt0uN7p/KQTRS+O+SESh703FTrh7+fom4J4NszhaHKe5g==
X-Received: by 2002:a17:906:b21a:b0:a61:9877:a26b with SMTP id a640c23a62f3a-a62647cdcf1mr113951166b.43.1716548943237;
        Fri, 24 May 2024 04:09:03 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 5/9] xen/riscv: add definition of __read_mostly
Date: Fri, 24 May 2024 13:08:51 +0200
Message-ID: <09d5f6bdd3bbd8fe1f97317009ee6d0d0fc7dd39.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716547693.git.oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

Considering that there is still no still final decision regarding patch [2] my suggestion
is to merge RISC-V specific patch and just drop the changes in patch [2].

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V9-V11:
 - Only rebase was done.
---
Change in V8:
 - update the footer after Signed-off.
---
Changes in V4-V7:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.45.0


