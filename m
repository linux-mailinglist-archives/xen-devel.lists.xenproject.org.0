Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B441D945EEB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771219.1181803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsjZ-0003Pb-Vp; Fri, 02 Aug 2024 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771219.1181803; Fri, 02 Aug 2024 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsjZ-0003Jw-SB; Fri, 02 Aug 2024 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 771219;
 Fri, 02 Aug 2024 13:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZsjY-00036j-OS
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:54:16 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e9a8b5-50d6-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 15:54:16 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef2d582e31so96118121fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 06:54:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e1ae4easm1684271fa.43.2024.08.02.06.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 06:54:14 -0700 (PDT)
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
X-Inumbo-ID: b4e9a8b5-50d6-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722606855; x=1723211655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xMFnCQstUzRDpJ+Lt8V1NerdXhHxQ/jZPU/wjOAbGA=;
        b=axmmV1u+JFrGY4t8gaewl3rsax935QuHnNRN9uoKtfGgdrjXJcCXPhNxJa2MgI2SYF
         1g7XyYMHaF912EFkK3iFXN0vrhVlgDziAwzNGC0uupYidVvk3PK8XiqC0Tf4N3mU1JMm
         IIV7h/zm4rDyzM7kB3HfM76eT6NigcVAr75iVrTvgmHYULEo1NSp6kkmrZiBQaalPqsi
         q/TpFTPvBMKr/le6t9xDtqDPx4dD4xoQ+zQjnbMzdwR77BN+/7f3sVm1NKsnBeZhv5t9
         NLeTcd2wiIExuQ2ovhLGLsLcRBh24lMrvp6cNkfGp/CqNeu8lVQSfZMaJSZdKDqf4Uuo
         QvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606855; x=1723211655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xMFnCQstUzRDpJ+Lt8V1NerdXhHxQ/jZPU/wjOAbGA=;
        b=l1ndGbcZKO/5A1QJtSPntR9AQrDMU7ggqwM6VuMHbtUbxurSXBZw3wajO9P/PXz9Gx
         kovcSJemEIPms89lDKnIIDcFQSzO28vaNaws/EkW8eGY9NwMeIVP+Ek1o+hMQ1u4dLrL
         0aYGrDo/98H+6KnkDDsvTFD+CWWnFXk0mFhgpee0J9s/53J892c+jIdvh7Xh3B3Mp1MZ
         g3WO7SkIeaGYmT9D+3a+NmcFguw3nQg9jyecwueY22VY9PUyc3vPa/SH5NAOyOmBFqfc
         IVFCEau5HRSbcmLyIt1wDSNDJ6dZRqiM1m4hpLYIAvTyW0lUMDdwURPSrrnhdE56N5mS
         6yKQ==
X-Gm-Message-State: AOJu0Yy4UmOAG0RzNmTC/YszXUOpaKwtYenJn8bhZNf4ztg1CG27mwbM
	FdxjV0P97sOW9bR8ZZzcaAoQMGrYG9z7siN3l3nr0GEHe4CPrBt4/8olTQ==
X-Google-Smtp-Source: AGHT+IHxufmfzYuTB4oOeLssPmvuH/MFYbb7j6IzGfwer3jhklgSUL5HMxdQgEe6RvQlMF1MzkmnAg==
X-Received: by 2002:a2e:2c11:0:b0:2ef:243b:6dce with SMTP id 38308e7fff4ca-2f15aa84ec7mr23882531fa.10.1722606855031;
        Fri, 02 Aug 2024 06:54:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 3/3] xen/riscv: refactor decode_trap_cause()
Date: Fri,  2 Aug 2024 15:54:09 +0200
Message-ID: <88e15908d6ac363934b6da52091443af28bd7291.1722605952.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722605952.git.oleksii.kurochko@gmail.com>
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use array_access_nospec() to prevent guest speculation.

Avoid double access of trap_causes[cause].

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V12:
 - New patch.
---
 xen/arch/riscv/traps.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 72ffdcd79e..51f6e45ccc 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/lib.h>
+#include <xen/nospec.h>
 #include <xen/sched.h>
 
 #include <asm/processor.h>
@@ -48,9 +49,10 @@ static const char *decode_trap_cause(unsigned long cause)
         [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
     };
 
-    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
-        return trap_causes[cause];
-    return "UNKNOWN";
+    const char *res = cause < ARRAY_SIZE(trap_causes) ? array_access_nospec(trap_causes, cause)
+                                                      : NULL;
+
+    return res ?: "UNKNOWN";
 }
 
 static const char *decode_reserved_interrupt_cause(unsigned long irq_cause)
-- 
2.45.2


