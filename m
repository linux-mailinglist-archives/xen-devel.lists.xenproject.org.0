Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDA849E81
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676260.1052384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX12b-0002g0-0I; Mon, 05 Feb 2024 15:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676260.1052384; Mon, 05 Feb 2024 15:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX12a-0002dJ-P6; Mon, 05 Feb 2024 15:37:48 +0000
Received: by outflank-mailman (input) for mailman id 676260;
 Mon, 05 Feb 2024 15:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y1-0007Hv-3r
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:05 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9e34def-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:03 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso4071568e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:02 -0800 (PST)
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
X-Inumbo-ID: d9e34def-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147183; x=1707751983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSkC4h9RHu0ZPi8yVkfyYrb9TlPun8CaqbFwSR6X+nY=;
        b=lgAOSssgK0izZvo/eByOYxCZOcyQuLl1LphlcFgDfrw4bTM0CMdT+7oaC8UE0pqGMZ
         o6DoafnVO+RZsMiDEiq4bWPyGNGENGVrVu+1AIwfmRmlX0Kz3Wb6cym2z2sZdQIxM+8D
         lZggEUd3deN3Nc68HFWj2E9A0ljMhOu67U0XkogkDk/zmMXOXfeeElMG9YZzufBLHIX+
         zqUn4B6M2z1yKPQBr3SHlMuThthRLG8mLjjcf5KlkjBAzWFwnUlHdheGtQKwJKF9di5b
         +NrHefe3dpHsopNA8xgc86q8axLgXHel3zeXB7TIfSLbDdU75b0SrE4cEd8oQi9pPdei
         NWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147183; x=1707751983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSkC4h9RHu0ZPi8yVkfyYrb9TlPun8CaqbFwSR6X+nY=;
        b=OHtEHmKiDBhJQyBoDiTg2aykeOmnjtmO1wJE9ZPaUtVuoYC5O4IiDghheR4itjBq2M
         2gvn2rQ2I6GTkpdox2FgeEbMnudhsatWamhk8fb2QsWpiBnAzSU2XBb5j2rU6m8905Tq
         p7uJTl1N4DdZkAUzivMNgZOH9t10V5QMUiptVvELLDngoKrI82ClCpmCf/ujH/4bO24k
         OmXeVI7WUgJDvND9QMmNPEnrFMkmVR1iuwmCVCuysovSKhPs3unAIJswNOlhAfWFEfYl
         +kJ8LJ74zDgWvPbtTc97c+ep5zuJwWSbgYVw9V4542MGfK5HfQuWNMytrwPLdsN99uvq
         RK7Q==
X-Gm-Message-State: AOJu0Ywz/VL81NFVqYzOkItZKlgP1Z8im6UkeaKy2jL5/40NOJBL51Zy
	zCwIDHSJX2ezPTtGhRIzheaRnAbXeehb+Qs7BS0uvfirUCqm0TZppYE2RrCZ
X-Google-Smtp-Source: AGHT+IGTlPwspuKMw53Na5DdBtJmFPAAq5A3ih9VNf0oCvaDXAg4cGvieTC4z72KOBq4nEL9xYpnWw==
X-Received: by 2002:a19:4f57:0:b0:511:4646:54f3 with SMTP id a23-20020a194f57000000b00511464654f3mr14586lfk.10.1707147182714;
        Mon, 05 Feb 2024 07:33:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVGXvLe4XJsrxfdoixZ0NqlGgka//FC5/RH2AS+rnUaVAp3xJu/mcmHp12yRfb30V2wK5zQgc9x03U4B4wHAUQfJrYvTTGmFUrhsHMWJN7LP2wJGa3ZsD9Uc2WJ7tRri/tJXigsrxgosYLy+fSoMDCwQXBuuCSyh4EyDim9bZ4DtIWfxwXzfRQlVW9TSfdfHK07mcmqdIVNtUkTz7GLtliRrzbh7WUkclVrm0plT50H1FanZgtI20Pep8E6Gi/vJvYTjMQbr+e63Eeu9bskPRfnFW2u1FyIke69s7aw/kArt41+sFXcurvgvorUa7hEqy8AFf5+
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 21/30] xen/riscv: add definition of __read_mostly
Date: Mon,  5 Feb 2024 16:32:28 +0100
Message-ID: <5aff6b7d13b17e4ce5807f589c0be20f2e9e0bc0.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
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

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V4:
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
2.43.0


