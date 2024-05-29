Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB78D3F24
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732322.1138279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-0003xy-K1; Wed, 29 May 2024 19:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732322.1138279; Wed, 29 May 2024 19:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-0003sM-DF; Wed, 29 May 2024 19:55:19 +0000
Received: by outflank-mailman (input) for mailman id 732322;
 Wed, 29 May 2024 19:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCPOH-0003Nf-DS
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:55:17 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef92ff7-1df5-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 21:55:16 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-529b79609cbso173149e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:55:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b249sm1344203e87.178.2024.05.29.12.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 12:55:15 -0700 (PDT)
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
X-Inumbo-ID: 5ef92ff7-1df5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012516; x=1717617316; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3OBfOym5W7zP/NOzLdy/wTYIWbuyzij9mGpUhq8jn8=;
        b=FXOMKagBdb7WBn+WKoaoOCl3NTDtgwaYgcP/t2jk/vaIqJx0mgssV5tsMsOHSNj5+r
         6hKjE4djiOUkCVb3ZcL8/K9vdZWtZAKmmQTEz6DpjNusjCvAoerw61Hbl19ytQRGNvRQ
         nOsyzWt4KA4feEQf3W9Sze3v5v3CBVjSRkcZAKDxDoJ6iOQB9et0Rq+v4ZS/EkSKZl3l
         c5Vgbo9+8GVVVejgGqxBKShA4c4tM2AbhOQZfMbdrlxStcZ5+S0NLEPFv570TY5EsSvs
         v5GkEDgPnnLl7yItr6Ds7JshotbqkN1UBSnLncPh3dyj02qoN9+xZgWWAUqZ5vBqP73Q
         XLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012516; x=1717617316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3OBfOym5W7zP/NOzLdy/wTYIWbuyzij9mGpUhq8jn8=;
        b=Z0ZZdRN50W+xs5/y8py/Meh0yfcvs7H7lRSKgFcd3W8YI60klAbvksdXjixZLQsFKs
         uKu6kvPMQz/aVwIH55OnhL8MIXWU0a20Npj6cwyNjjlMOORS518k8A0WtRRyHSrnubbM
         Qp52pqAO3NVpj/hIL9/7ol//wpi/PEqkT66KZblClUfFoa8RbDsI9qF7Tw8i+rI2ivS0
         U+4TdeniShfSZ6/ykV7qXcZJoKZC+wKB4anS0Fmhf8CkS1ssCJZiuxd1KbmCG4jDCNjZ
         H3Gyo3ZfUUvmEGYnbwRm3rjlKGPDh6QyM8cU++g7Cc9N0sBFEicffXRajNspoNpQpo++
         euiw==
X-Gm-Message-State: AOJu0YwyyDeKXVgxnsL+mIxkcybcCjhfnAomUcKetK+FMCQLNtjo+m1x
	9vhcIoq3a/F6qQbN1bDudeXPYdnJkfVdmJgrZxnFgww/4IDqSgHA9Da/NmkP
X-Google-Smtp-Source: AGHT+IF8TRHBMLnG7vbLddBJSm+lXJuXkNyuIx+55aDyvR4lh964SVdEQEN1swQiiL5CcERQAR3igQ==
X-Received: by 2002:ac2:5f08:0:b0:52b:797f:b21f with SMTP id 2adb3069b0e04-52b7d47a923mr117416e87.51.1717012516270;
        Wed, 29 May 2024 12:55:16 -0700 (PDT)
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
Subject: [PATCH v12 4/8] xen/riscv: add definition of __read_mostly
Date: Wed, 29 May 2024 21:55:05 +0200
Message-ID: <b93a0eab949f49d2977a3358b6c6c940b8028f4d.1717008161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1717008161.git.oleksii.kurochko@gmail.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
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
Changes in V9-V12:
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


