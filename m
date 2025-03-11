Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C5CA5D17A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909296.1316274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uB-0000D2-Ij; Tue, 11 Mar 2025 21:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909296.1316274; Tue, 11 Mar 2025 21:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uB-00007E-E5; Tue, 11 Mar 2025 21:12:51 +0000
Received: by outflank-mailman (input) for mailman id 909296;
 Tue, 11 Mar 2025 21:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uA-0008V9-LN
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95e918ae-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:49 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so2419490f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:49 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:47 -0700 (PDT)
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
X-Inumbo-ID: 95e918ae-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727568; x=1742332368; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYYWoFXQadYNqg3ppNES3f8YOcne8bmt2zBhfPE0KsI=;
        b=NQ7ppZ5BoMP+56b3zvvq0pg9IntpOq2H7hwB9NAWZHQgz9Vev0XfpO+inCeHB/FD5Q
         zgNjofAmDPEnnlOuu5w+LRA3sFAZ5T5xj/9UleERfO84m7FYCcQ5LmNf1Z8b+vsbuKoj
         9EVOA3/9AHmOibF/D7j7KuX4aN/Ou7MHC8loA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727568; x=1742332368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYYWoFXQadYNqg3ppNES3f8YOcne8bmt2zBhfPE0KsI=;
        b=NmygXvVXZ5hdakzcLs+Lx7gqPw4hRbZ6a2ayj7LQe2LfZUGq+OechiYj0d8JupEZnW
         p+h3ooUyWl6c7Ca0whSOH82Lx4XSidiwwOFthbmYLfZIN24mPJ/YCPjF8MvwZkoX7kKI
         TJp+psLXh4EdGywgoBd7EnBYJqwbzOroS82og7+mExVLyXsDgp1IUILmg3+FQJaW8BJO
         UNS0CkJvGPSioqkfqd+dwmk6+d91fiCiHvEIkwJV/YUIXFATqAbN+pc5b/8vvIxXZUSy
         EbGAAhMV/kFcFUHtRD387eZ3WaCzdhQPDNOca3BKXHgzcgVRJqOLXggWe27uLL2tvQ0H
         TGWQ==
X-Gm-Message-State: AOJu0YxtNDVnCCwP3tqQuMAV3qb2J4L/3z8iW2d79SP1bhrgAPQqcOnz
	nzredl4bMW+mOakCqwJhBbYTOGXBjpLKbmHcFxAX3ufHxz8FqPJdwP3w1kpnnyeaI84TZ4xto6d
	z
X-Gm-Gg: ASbGncuq/HjRfF9g/5MlXIP+HnUiK2yOr8RySPFuzLJIAs2GEh/W1xnUqN+vqD229P7
	Iv75CmxDw5mPgfpAhzjeY1nutTt17KEJTDiNZhx9ToZgOI2sxb22yfi6gWWIJLKpoF66LwCUJ62
	wRYurEYT3W/nAh9mYcwxEm3gY44sURqckAyZtezO9Wz6pgqWRjifj6SoNPNu6jd2/UQUbS1lpiK
	KT7Y2vUTa6meqzASa2D53RGI4gYzF6NR8QzHRmGbUzcsrJkTwKO207K0rMnIoxGkDGnrwes2Lo3
	fQykMhNvmVoY49Gdo+ML2r3pWAaCBwayWXQ6kkYS8SrseUrk+Y8NDxAlCHZVHyrOB0QzTdYrs59
	FvuC/aCDeVUiKLTRaH5pvF3cpcxpIvPz40vU=
X-Google-Smtp-Source: AGHT+IFZgdnQQjNxx8ghjAcICekZILUDfTG+OshKCf0R9bGe78OIZA2mDQRW7kigxJY2ri5dUHihpg==
X-Received: by 2002:a05:6000:4011:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-392641bfd05mr5345571f8f.17.1741727568219;
        Tue, 11 Mar 2025 14:12:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/8] x86/regs: Fold x86_64/regs.h into it's single includer
Date: Tue, 11 Mar 2025 21:10:36 +0000
Message-Id: <20250311211043.3629696-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/regs.h        | 21 ++++++++++++++++++-
 xen/arch/x86/include/asm/x86_64/regs.h | 28 --------------------------
 2 files changed, 20 insertions(+), 29 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/x86_64/regs.h

diff --git a/xen/arch/x86/include/asm/regs.h b/xen/arch/x86/include/asm/regs.h
index ddf5e14e5719..4f2f06b60161 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -2,7 +2,26 @@
 #ifndef __X86_REGS_H__
 #define __X86_REGS_H__
 
-#include <asm/x86_64/regs.h>
+#define ring_0(r)    (((r)->cs & 3) == 0)
+#define ring_1(r)    (((r)->cs & 3) == 1)
+#define ring_2(r)    (((r)->cs & 3) == 2)
+#define ring_3(r)    (((r)->cs & 3) == 3)
+
+#define guest_kernel_mode(v, r)                                 \
+    (!is_pv_32bit_vcpu(v) ?                                     \
+     (ring_3(r) && ((v)->arch.flags & TF_kernel_mode)) :        \
+     (ring_1(r)))
+
+#define permit_softint(dpl, v, r) \
+    ((dpl) >= (guest_kernel_mode(v, r) ? 1 : 3))
+
+/* Check for null trap callback handler: Is the EIP null? */
+#define null_trap_bounce(v, tb) \
+    (!is_pv_32bit_vcpu(v) ? ((tb)->eip == 0) : (((tb)->cs & ~3) == 0))
+
+/* Number of bytes of on-stack execution state to be context-switched. */
+/* NB. Segment registers and bases are not saved/restored on x86/64 stack. */
+#define CTXT_SWITCH_STACK_BYTES (offsetof(struct cpu_user_regs, es))
 
 #define guest_mode(r)                                                         \
 ({                                                                            \
diff --git a/xen/arch/x86/include/asm/x86_64/regs.h b/xen/arch/x86/include/asm/x86_64/regs.h
deleted file mode 100644
index 171cf9a2e217..000000000000
--- a/xen/arch/x86/include/asm/x86_64/regs.h
+++ /dev/null
@@ -1,28 +0,0 @@
-#ifndef _X86_64_REGS_H
-#define _X86_64_REGS_H
-
-#include <xen/types.h>
-#include <public/xen.h>
-
-#define ring_0(r)    (((r)->cs & 3) == 0)
-#define ring_1(r)    (((r)->cs & 3) == 1)
-#define ring_2(r)    (((r)->cs & 3) == 2)
-#define ring_3(r)    (((r)->cs & 3) == 3)
-
-#define guest_kernel_mode(v, r)                                 \
-    (!is_pv_32bit_vcpu(v) ?                                     \
-     (ring_3(r) && ((v)->arch.flags & TF_kernel_mode)) :        \
-     (ring_1(r)))
-
-#define permit_softint(dpl, v, r) \
-    ((dpl) >= (guest_kernel_mode(v, r) ? 1 : 3))
-
-/* Check for null trap callback handler: Is the EIP null? */
-#define null_trap_bounce(v, tb) \
-    (!is_pv_32bit_vcpu(v) ? ((tb)->eip == 0) : (((tb)->cs & ~3) == 0))
-
-/* Number of bytes of on-stack execution state to be context-switched. */
-/* NB. Segment registers and bases are not saved/restored on x86/64 stack. */
-#define CTXT_SWITCH_STACK_BYTES (offsetof(struct cpu_user_regs, es))
-
-#endif
-- 
2.39.5


