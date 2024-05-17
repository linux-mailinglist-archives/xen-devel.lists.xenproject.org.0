Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514668C8796
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724186.1129429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3L-0003Y9-Ih; Fri, 17 May 2024 13:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724186.1129429; Fri, 17 May 2024 13:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3L-0003Tc-4o; Fri, 17 May 2024 13:55:19 +0000
Received: by outflank-mailman (input) for mailman id 724186;
 Fri, 17 May 2024 13:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3J-0001sq-Pp
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:17 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 163a8bba-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:15 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-574f7c0bab4so5527038a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:14 -0700 (PDT)
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
X-Inumbo-ID: 163a8bba-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954114; x=1716558914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyBSZPlFHowbije2gbqJW9jX49ovLzWsyAVo7e+9BiA=;
        b=L/z7WBYDgtlz3Lq4W6ov/xA4GNcwQVp/Zjhg1t3/AkqFmrIRlQYKGepOR5nbkZSkrv
         qC/Hkw+79y8BWMrEBThMFFQZGdFJtggHDq8U52+sMrdivxRRCVAptk7w/v2kAjj47tef
         Fzb7cxpQNgHLGz7HiwtcyHkQuGi7AQNAiqLqmVnp/SCn7mfZKdv055ItSlIf9yapoKk5
         bLqqTbHMfZkG/UkVHyGTdBKh4R6vWcb7xTXmGbETWNQhKmAZXFjWOWkAGvHG9EM5q2Yn
         4qY7kQI/OPI0vlkgd1LNHKaHEnJJJ/xU1cs3ttbWIsmizrtWjLIFh7v7OYAvWtPGw7e+
         pyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954114; x=1716558914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyBSZPlFHowbije2gbqJW9jX49ovLzWsyAVo7e+9BiA=;
        b=ZgaqBM5ym7KUFoxAkmCb7tm6Xl3ZF59uh9xLW4jdZF6D6+Sw3l7vmlxbRYdC9bfwAC
         pZD4FdQGHhieJcv7NLHrlT6WX2bec75We9u9+0qLgjzCsSRaFIE29GrHMRrI60mLDZho
         vQEN8icbC4ypMRKn1w+Ly0PJX+vlArFss9UvVIRDK4YWXTCuoGHWnuizEtHYYVB5cQs0
         lGyW+sihN4Zoz1RddY6zJO8t0WGcRQhrXqJK6kfx6YQPFRQZ+csrIzrkGvVGtvoYoCJE
         w9yDsYDQ/12SocHYqAtVTpnZhlOY8E4QsVOHq6q2t6RNM5DIN2MHh/ajg8KLuRS4yU7X
         3X8g==
X-Gm-Message-State: AOJu0YwK6rEERgHvvAF40wmJ3qyGkwKzelZObnCcYq6S2k4suFoT6anl
	DanyIkZNtbDI6vqhhLsUgjB4HsDYdzAfSAjR8w/wMf+UCGA+iP5hMTw7xKKp
X-Google-Smtp-Source: AGHT+IEH4GixmiF/ZnYd2IrHPQ6pJGJyu1Ytdqrigw3Z/aFxvE19tc1zBfWvqXV4dA53oYRV9fQxng==
X-Received: by 2002:a17:906:240e:b0:a5c:dce0:9f4e with SMTP id a640c23a62f3a-a5cdce0a0camr589738166b.28.1715954114429;
        Fri, 17 May 2024 06:55:14 -0700 (PDT)
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
Subject: [PATCH v10 08/14] xen/riscv: add definition of __read_mostly
Date: Fri, 17 May 2024 15:54:57 +0200
Message-ID: <834486ff8e3233e067a0e4603f700182826eca94.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
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
Changes in V9-V10:
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


