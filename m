Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9706867EE3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685704.1066945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeww-0003gX-O5; Mon, 26 Feb 2024 17:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685704.1066945; Mon, 26 Feb 2024 17:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeww-0003TN-8b; Mon, 26 Feb 2024 17:39:34 +0000
Received: by outflank-mailman (input) for mailman id 685704;
 Mon, 26 Feb 2024 17:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewt-0007pd-8r
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:31 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff0b1b4b-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:30 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d220e39907so54921291fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:30 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:30 -0800 (PST)
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
X-Inumbo-ID: ff0b1b4b-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969170; x=1709573970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb07bjP5MT5URv/T6UfEIfVo4wn4HOEqDnf1WKrmicA=;
        b=dB3Xa/tesInuzjYOh7NNr804nKk56Y06LxnsSHzAssXH+r/uQ75rSXRvhYishB/wPm
         Yp57tUmTK25mBVbbydn0EXJMTS0iwe8C56Mp7lYFPtuvJ4ZugZ7I1SOw0bMB+FmgwaO1
         dSj+uzXPlB8uegjaYvY8p+5KXoGWaJ5ThpKdv5pcvTalXCil2Hydqa7NP2nT+Dj5T8Et
         XqKkqZfKkfKqMMKi/ir583KJc+Ut0P4HUlcMbx+DEApQpWmUkhP064Ssnb3WI25RuBQo
         Fr5593N4Y2RIO2EGxbMB5NJiYc4T35cM4h3xjCdlp7MBKDCc7lVcfUaXWbUMzGAqNGSc
         94cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969170; x=1709573970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tb07bjP5MT5URv/T6UfEIfVo4wn4HOEqDnf1WKrmicA=;
        b=ObCBA4e8aAXgI5YeYOB43BP0znwT1sbdz5RgoaXro0XA71OxAB0y+0rtWpJjKa8mvL
         2C7IidvuC6Z8+H8TvgyMJQSZEWy6yNF+J53Owl5jQdzOH99cW4Yur2ZfMso+pYBHFnqA
         df36JZngCjioo3tsoaNw2k9eI3WhfsdpbFiSJFrZCSZRRzLSJ4riJWkWseyxt5dpgjPw
         /PCtiAC15KDY0qp1fPH+axnJAiz1vzk/fV5/i4ZJJUUXfS/940P+hcOfL88EztX4v6y7
         DPvwyDU+7WOeYeDvEX2PdATWDNAeHgCEixJK4S0NS6Hmcm30pdGRBL2ZsB3JULgiqJEf
         KteQ==
X-Gm-Message-State: AOJu0Yytyf3SIEVBXtgmzzJ8FF8sSNBI0qBBm3MzgUzFYTOSHe/O3VjW
	KhOqhnE2BrdEt8VWB5TjNj1rxdYjbxv+wyaEcdnkkGAb0/jtKGowNFlygYW3
X-Google-Smtp-Source: AGHT+IGuW0ldyVHoN5ow3oTKDG66b+FmJr3b8VDMZKhzGzBWZ2dvIriEHzA+7YRr9PKsNjEnYncSoQ==
X-Received: by 2002:a05:651c:224:b0:2d2:5123:4d03 with SMTP id z4-20020a05651c022400b002d251234d03mr5091015ljn.22.1708969170163;
        Mon, 26 Feb 2024 09:39:30 -0800 (PST)
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
Subject: [PATCH v5 16/23] xen/riscv: add required things to current.h
Date: Mon, 26 Feb 2024 18:38:58 +0100
Message-ID: <9063614bd46592b323e7bde3c6be6727eb922312.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
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
2.43.0


