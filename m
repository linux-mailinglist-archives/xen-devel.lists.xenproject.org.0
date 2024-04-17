Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA73C8A8055
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707311.1105181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AN-00027A-5V; Wed, 17 Apr 2024 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707311.1105181; Wed, 17 Apr 2024 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AM-00023m-T5; Wed, 17 Apr 2024 10:05:22 +0000
Received: by outflank-mailman (input) for mailman id 707311;
 Wed, 17 Apr 2024 10:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AL-0007lI-5Z
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:21 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc6d18f-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:20 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so4783062e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:19 -0700 (PDT)
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
X-Inumbo-ID: ffc6d18f-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348319; x=1713953119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2am1xKyxE6JlgsfSfWnqwPwpi6tx6R61A7kq4D9LFjk=;
        b=gDMrbQYgfJGjP+sqjCeaU7TQPjgY0vkMlC6qeRyDaCjGnAh6LgA0jJZci++FaAeqK6
         rwwBJGobgFbJc4OZlv2PKKdNFfT3eFS1hi5Q0Sjp3KnZxC34EMbVu6jO1rHZx/Im0FHF
         9Q/k2HJHmb8UNPBpKXq/fJBubvbKmuHulDRMIG3QLOVsdZe9e/weQszbW+DyXFoCtvsi
         c6+NuT1C/WCVTUuxEl747WpJhdX0IYw8aS0ORoLlNCqy4mzfkqfUyo8WF02SbupfHR5g
         r2Gf9aec5EgviwrLRuXOClhivcr4vePeJausgITZdH5YTxSENQmxOzDvJUAxLG4EGFdh
         VltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348319; x=1713953119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2am1xKyxE6JlgsfSfWnqwPwpi6tx6R61A7kq4D9LFjk=;
        b=dXms2mCD5CbeEdwseq06Hw5CmK17WnM8foBRQ5HpfICH/3njajxdeBFLRU7XXyF6kw
         H6gT3C6SGtDMn6B+vqAQX6e/SctvzLFEZMvtMQMO+XtnKW/tZaBcgWiZjvnQWsQHiXcQ
         MbzdcKkP1ZH01si/xf/H5Cufos/Df/4weR0h5I7CIFyp8ZdSt0wURxqPBdlnTLchDC4w
         P6gtQABGM3FDOlrxdG097X3j65EUP0sOfCmQuhxVRNxJVgxeMI4maDA6CXA+cJDGdnf4
         HupDVJn63avPeNYovl1XMIDT3tYEvU/31LKvBrqQUGMmvMNGzQkrs2yaaarf4Sf6bM4B
         1KWQ==
X-Gm-Message-State: AOJu0YxJ5uWsvsNK3Zhs5/6vWgiSIncaa4eyhVK1+2l6is7jn3eU2R87
	iIHUH9ZkDMlKxIsjMaSXsJ0crjVgtY2N8Cnosa3f6/hQmDFyDG8bLyYdEQ==
X-Google-Smtp-Source: AGHT+IG4YzV6cn8xxJwdwfvBRT665yfVESZrPLkUSP9xoKcmcZwcTYCzLd07SI+jpcSADeYiyZ0ckw==
X-Received: by 2002:a05:6512:124e:b0:519:2a14:8511 with SMTP id fb14-20020a056512124e00b005192a148511mr3293313lfb.69.1713348319472;
        Wed, 17 Apr 2024 03:05:19 -0700 (PDT)
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
Subject: [PATCH v8 11/17] xen/riscv: add required things to current.h
Date: Wed, 17 Apr 2024 12:04:54 +0200
Message-ID: <5236076478a67e129e86a7ad0adf3ef5950991e0.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V8:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - BUG() was changed to BUG_ON("unimplemented");
 - Change "xen/bug.h" to "xen/lib.h" as BUG_ON is defined in xen/lib.h.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX
 - drop a forward declaration of struct vcpu;
 - update guest_cpu_user_regs() macros
 - replace get_processor_id with smp_processor_id
 - update the commit message
 - code style fixes
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/current.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d84f15dc50..aedb6dc732 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,6 +3,21 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
+#include <xen/lib.h>
+#include <xen/percpu.h>
+#include <asm/processor.h>
+
+#ifndef __ASSEMBLY__
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            this_cpu(curr_vcpu)
+#define set_current(vcpu)  do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
+
+#define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
+
 #define switch_stack_and_jump(stack, fn) do {               \
     asm volatile (                                          \
             "mv sp, %0\n"                                   \
@@ -10,4 +25,8 @@
     unreachable();                                          \
 } while ( false )
 
+#define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ASM_CURRENT_H */
-- 
2.44.0


