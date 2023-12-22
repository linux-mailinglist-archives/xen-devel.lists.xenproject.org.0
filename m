Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67181CC34
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659600.1029312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhRa-0002sP-Jv; Fri, 22 Dec 2023 15:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659600.1029312; Fri, 22 Dec 2023 15:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhRa-0002qC-HN; Fri, 22 Dec 2023 15:28:10 +0000
Received: by outflank-mailman (input) for mailman id 659600;
 Fri, 22 Dec 2023 15:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDo-0000EM-0x
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:56 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b79f2086-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:53 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e6ee8e911so166041e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:52 -0800 (PST)
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
X-Inumbo-ID: b79f2086-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258032; x=1703862832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQIDIuoLWyO5oFygQ2BVR/wl35YAyon66a6juh8mY+s=;
        b=kfuuoJqQnXWT9cS2w1OIPcbeDGhD4Espy8bae3/e45trkxnK1UlRMMEe28blP87V7Y
         wBEIYvuY8cjn8o+WoJuDXYJ3jd7HNcz3hthEMg4mMCG8GmNI16SNWnC61rxBHdDMFQA0
         uPpsl3abbEMJa+G1RYPxappEkyEgUxqjS1YMj9Xfj3yL9OAIYnEoReTqq3tgBQMd4Sbr
         pACX952CyQ2sb1AgfdPCbe4LdZ5IewulHk+v50PXaiyV2gFaINlxZVjI9WxEqjhbT9Oj
         uT7w0gry5WXIjqmnbN3hSIs7F9zybPAiiFWLWyQExXTEcNPnZz2eYjdqmX+EjGY/sd5V
         Pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258032; x=1703862832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQIDIuoLWyO5oFygQ2BVR/wl35YAyon66a6juh8mY+s=;
        b=rZq53KoUHcUUFizuHDj38nqBvUuhWpKg/BRbs0Xy8DxxurQ5wbG0jJnpmgodbbEE7x
         Bo0qK1bLdymUbpqyAVFvylowDja0AlLOuDqV6WM9DX+2djPkl5+lQpN8B1VwpWOX+geg
         CaO+8fXVm7PsaOSnBfQMsIAoB1vtA4lCIvAGMDfyxqW65dtOGx8NhhJ5kYDtaoi8yagJ
         d+vBl5+MUUnecpKbf1mQNxSmY+Dthxusp365xvyVEPBUv6GeNNLf31DeAX5RFI2Aw7Xy
         bqRkWX2MLv98TkS3XegksN2351ogRt0re3gI14A4N7tfvO3wjQHJoINc9ENcjBJmbiMa
         1xxA==
X-Gm-Message-State: AOJu0YxlV7OnJZ4CNsq4OkUv7AvvFvmJwhL66PtoJXHY/58wu3flQzMQ
	4fd8XILdEfiiM0pSgclle13nMOx5Lno=
X-Google-Smtp-Source: AGHT+IFNPgXNL5l4aLEXfkQCyg8DLODVuBOW2IvGmMZFeD6yFCdZY4Um6LhGRejA0ongl0d/zCRX0Q==
X-Received: by 2002:a05:6512:3767:b0:50e:558e:125b with SMTP id z7-20020a056512376700b0050e558e125bmr695236lft.125.1703258032365;
        Fri, 22 Dec 2023 07:13:52 -0800 (PST)
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
Subject: [PATCH v3 28/34] xen/riscv: add required things to current.h
Date: Fri, 22 Dec 2023 17:13:12 +0200
Message-ID: <8fd8d3652eafabf5f5586de91d97ecae077b90ea.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index d84f15dc50..1694f68c6f 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,6 +3,21 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
+#include <xen/bug.h>
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
+#define guest_cpu_user_regs() ({ BUG(); NULL; })
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


