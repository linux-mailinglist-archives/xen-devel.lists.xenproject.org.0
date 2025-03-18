Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E1A66F88
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918731.1323394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6X-0001jc-T2; Tue, 18 Mar 2025 09:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918731.1323394; Tue, 18 Mar 2025 09:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6X-0001iG-Pb; Tue, 18 Mar 2025 09:19:21 +0000
Received: by outflank-mailman (input) for mailman id 918731;
 Tue, 18 Mar 2025 09:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6V-0001Er-Sr
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12263b2a-03da-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:19:19 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3543019f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:19 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c83b6b43sm17746582f8f.35.2025.03.18.02.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:18 -0700 (PDT)
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
X-Inumbo-ID: 12263b2a-03da-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289558; x=1742894358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuDcf9Cv9x3i1U+A49P9TQaxoQRqLFIPfBAq0blwaPE=;
        b=QLwngdLGpw5wRhuRoOAW9Ie9ZF0iwB62KyCJ0lkSMIRuVUKnH7Xus3RvpRGJULxJ9s
         7v2dtcoEAyWATa0t2skWcuWbjlD91pEMMpDajWg75pxl9iZHMVF2/hiWEkV7Hcziufm/
         7JuhD2bRkWQba4DHZfL0FGvm2/y/1F8kYLSgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289558; x=1742894358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuDcf9Cv9x3i1U+A49P9TQaxoQRqLFIPfBAq0blwaPE=;
        b=Qs0OcSNnz+aUK06UHjVu3KVXrZaJOFQsM3PIg08W3hoNxPNUCeL2+aPtGAsevQ+4TQ
         1tdTgNasY4Co6QtOqpbG5h1EB9KNIlgz7ui9D5NM06TVh6U0v9nr/REBCjZhHOjdEmBI
         rppZTK1YJ+50rWDPkuef7N2qOCZXyf6ayYJ/Zs0D1KMiGHd9hX3M33Ct99JusLT0POO3
         NxGOp32MhJbxRSAenVhOPrPUu1v+PbVlUzzXe8Aly7pv6+cq0T+RWx4Sv8HsS3p+nZw4
         YlaKsrGC8tYxN60BI4tZCqnAxujLuPhNSb89oeCxKy2gq9ZsgA6+c7e/uHkMNHlVZNQF
         Mwlg==
X-Gm-Message-State: AOJu0YzT2lAJGKYYRxacUEhl/Hvu+ETFBejQ7FWyH9mhHLceLX7Dmyp2
	BlsXmPpmWJzdFJ5oRZK1XjOwCExf2BtWfW71oMA+5uL21QgSjUdAgNZPoKe/FF+go+umw+gguTI
	h
X-Gm-Gg: ASbGncvhKsQsdXu9Tg42E8DL4BAG0aVuStZOif7NmP6DVNdmHJz7p73NHEEicg4zTYx
	L/pBVXOQxltXxrcfOd5dHm26qd1BR6weobGUJyNR2LXMu3V7JjIjGFUGMfy3b9ISZL/QeQl0LGO
	nI75/wetvqhPCi7X1LDZwAnIcAdtSphEwQNssSkBbohLIGNG8GLJvOb18TGcPLawZ5ECsk58Yqf
	hZ8+enC/e3AHZnL8GmoZpGfmPXKvfNgquBMaGbCky1lZDODMtuyhu85ehqDSqM45iHz3z1pvHxM
	ODu0k3L/yIU472oAt6kNianYX8J5paV1a5B6qylUvOQjSTaBhw==
X-Google-Smtp-Source: AGHT+IGZhmwKpQwnvPKnE1JfFtguTAnacOSX1U3j5ss9YEvo5SJPno3RZX52vQX8KS78wbMIjF0zZA==
X-Received: by 2002:a05:6000:2c8:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-3971f7f9affmr19335621f8f.48.1742289558626;
        Tue, 18 Mar 2025 02:19:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in COMPAT_ARG_XLAT_VIRT_BASE
Date: Tue, 18 Mar 2025 10:19:02 +0100
Message-ID: <20250318091904.52903-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091904.52903-1-roger.pau@citrix.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UBSAN complains with:

UBSAN: Undefined behaviour in common/compat/memory.c:90:9
pointer operation overflowed ffff820080000000 to 0000020080000000
[...]
Xen call trace:
   [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
   [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
   [<ffff82d0402a6359>] F lib/xxhash64.c#compat_memory_op+0xf1/0x4d20
   [<ffff82d04041545d>] F lib/xxhash64.c#hvm_memory_op+0x55/0xe0
   [<ffff82d040416280>] F lib/xxhash64.c#hvm_hypercall+0xae8/0x21b0
   [<ffff82d0403b25ca>] F lib/xxhash64.c#svm_vmexit_handler+0x1252/0x2450
   [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15

Adjust the calculations in COMPAT_ARG_XLAT_VIRT_BASE to subtract from the
per-domain area to obtain the mirrored linear address in the 4th slot,
instead of overflowing the per-domain linear address.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/include/asm/x86_64/uaccess.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86_64/uaccess.h b/xen/arch/x86/include/asm/x86_64/uaccess.h
index c6fa3fd381bc..f933707e109f 100644
--- a/xen/arch/x86/include/asm/x86_64/uaccess.h
+++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
@@ -9,9 +9,9 @@
  * a secondary mapping installed, which needs to be used for such accesses in
  * the PV case, and will also be used for HVM to avoid extra conditionals.
  */
-#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
-                                   (PERDOMAIN_ALT_VIRT_START - \
-                                    PERDOMAIN_VIRT_START))
+#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
+                                   (PERDOMAIN_VIRT_START - \
+                                    PERDOMAIN_ALT_VIRT_START))
 #define COMPAT_ARG_XLAT_SIZE      (2*PAGE_SIZE)
 struct vcpu;
 int setup_compat_arg_xlat(struct vcpu *v);
-- 
2.48.1


