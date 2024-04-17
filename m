Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF298A8052
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707310.1105171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AL-0001oi-Pv; Wed, 17 Apr 2024 10:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707310.1105171; Wed, 17 Apr 2024 10:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AL-0001l2-HL; Wed, 17 Apr 2024 10:05:21 +0000
Received: by outflank-mailman (input) for mailman id 707310;
 Wed, 17 Apr 2024 10:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AJ-0007lI-H8
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:19 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec5b97f-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:19 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-516db2214e6so6721215e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:16 -0700 (PDT)
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
X-Inumbo-ID: fec5b97f-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348318; x=1713953118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A55wmsJqyXmnZuLXU+YGkCyPNW/O3UT62P8nJKgR0qE=;
        b=lmj0aURV5HFGTsJ2vC93nYvXIAB5a0X1SKGAi8pvtHj094hyQp4SkR6w/37Ntjt1Tr
         6a9o6U6JNj5HbLOfsqm7X9Jh5mLF4s8JyTfDEgcsZdb4lKgZTpSjpLLPbenhRZeeiDix
         BsvuDORVMiSZsPQEAFAYqxBj38HxCu86FftmOw01fuLw4cy8vCZX8f+iRpyDF33V3+aE
         wJnlOTWp2uwOzgjUgqIxHgbYWgVeW+hnYQjgfwCrQt05FP8dtBvpuVeaCDuTWMJSD+B6
         qn6m0PsyhH3OnDIFFo6eiEa6+X4H8/UepqK4cWlbG29NjHyX3/SMnmpee7UM4G94clbK
         bpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348318; x=1713953118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A55wmsJqyXmnZuLXU+YGkCyPNW/O3UT62P8nJKgR0qE=;
        b=PtHMC0KtrRqo2E8ezQi8NzjmriZ7ofMl01tq4U9tzt6lW1GSTsNszmnIZeVIiF1qzg
         AYEnQxnUj5EzO+y/NZIlCSSUDhSAbfEWfWpiSCu09DXHTNGQk2X2y21kLgRFU5NXbPap
         EyXMWnezySWStigQt226gZTvEZdVUvET/YUPCwhucSMTbmEKzbxjGeOIL7Y3oYdQMJz9
         7Zixhj61vBOWrlQPrO9W1vRpQr0iMGc45TZX7+arHy/eaqcVC044lEF0SwjtYFlrLEOi
         Yqjr0GV/S/C4smjAfLpCzO7SZkiTCzGAOOBGPd3YU5NEYwlc1OlrmigsErm7nc6YvV+y
         TZRQ==
X-Gm-Message-State: AOJu0YysispNyKNrNBPUD5XkPZK3vpvlRdz7Ra0Whm13ddTkrelBMaWu
	4B5VjMpzc1q8bG/Pn4pJl14wMwYxFW6aXuUTpR2vJw4Jn/HnJIzXvUwxyw==
X-Google-Smtp-Source: AGHT+IFA/TrttR/he40SFw+S/7WjIdupAZdY9f6uf/CSuQang1ycRpErrKDMTL1oVTtErcmsI3M7mA==
X-Received: by 2002:a19:f80f:0:b0:513:cf73:d8d2 with SMTP id a15-20020a19f80f000000b00513cf73d8d2mr9089456lff.54.1713348316464;
        Wed, 17 Apr 2024 03:05:16 -0700 (PDT)
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
Subject: [PATCH v8 10/17] xen/riscv: add definition of __read_mostly
Date: Wed, 17 Apr 2024 12:04:53 +0200
Message-ID: <6298d783d5b32307e76f91bcb969ef3ed64e28ab.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
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
2.44.0


