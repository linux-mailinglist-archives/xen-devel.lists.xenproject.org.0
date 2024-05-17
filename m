Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B248C8794
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724188.1129450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3N-00047I-Vp; Fri, 17 May 2024 13:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724188.1129450; Fri, 17 May 2024 13:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3N-0003z6-BG; Fri, 17 May 2024 13:55:21 +0000
Received: by outflank-mailman (input) for mailman id 724188;
 Fri, 17 May 2024 13:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3K-0001sq-QG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:18 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e13c8c-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:16 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so766853e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.14
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
X-Inumbo-ID: 16e13c8c-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954115; x=1716558915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTDNSGKQqAKoOtL7zFg1D0HVcpP6MEv+cyhDVsjtWjY=;
        b=JVTxYvK83JKiKdJ64CMxW7rdDY+W76aVxt1kTSkyehriTX6p72tuwgl1/FlppTQIBe
         lw8Y/SZ6SoVOh9NC1aYhrrh8fGCo3fbWEjIMWw6IAxEjVq0OEl5hTyQayvK8b5YYedij
         qzv/90mh1xYg30eEHe0lafBl4gzlHziqYbZoRgh6dJzjoI7g5JTlzoHY0Gwa1KW9LEpg
         hccpGq6buzx2wYZ3oWkFBmGTosbuZh4BaHAv4YNG8S/qSe+VDUGfF2g6h/x6yoYRgjcz
         yj8lDjjfi1GlnjkKwI0JDwhdMnWO5cavTXqN+HLaDNqKpcPiaLioFotepDpl2WCGTgw+
         WUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954115; x=1716558915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTDNSGKQqAKoOtL7zFg1D0HVcpP6MEv+cyhDVsjtWjY=;
        b=cqAYvDEQJ6BY9Hzhk9I9ApMwd9I1oTTgs7wmr3xfg+BUzJEl2ex5hSOJj3Mhs0biBy
         zfhjuKMxc8NkuiosiZ9bEggZJQqEroYTG5Ol2d+ra3WPVnZ3HdAnFT2XhR9iZlNZaPmG
         WHtdS/USuukxXGM50nb2eZEeTEF959oU+HLtZftsbhaH/yk1HmL7+K8gRJwfS2HNHFpA
         fZm0LNeX2IH/jaUcarbIhhmtJC7jY0sFsMfWDtPpZYXDi4haALCINIp5SDk3KrW4bJiK
         +jpTcUkWnYKgZMf/6EiJREDkLXSpFM0p6mLfh+m6GWwqEDl4KdLHEKIx3/CIp5BTn/QB
         QUGA==
X-Gm-Message-State: AOJu0YyZbZUIk2fR6YLumY4k7CM/hR8rvxbzFPQzjQGe2RxwNFw0+sg+
	kv66e5dEb9xi60Wv74Db/eYBiCS2NpnU31aUb0LDebtrQXk7UySHWFeuMIcV
X-Google-Smtp-Source: AGHT+IGRn6SScVZRY3a4dnKl4tKASVwrpUz5YO+fZnCSMnLLdTKOL18B0Ez524cvClsoV2oad3TtLg==
X-Received: by 2002:a05:6512:2356:b0:519:6953:2ffc with SMTP id 2adb3069b0e04-5221007027amr17339627e87.42.1715954115225;
        Fri, 17 May 2024 06:55:15 -0700 (PDT)
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
Subject: [PATCH v10 09/14] xen/riscv: add required things to current.h
Date: Fri, 17 May 2024 15:54:58 +0200
Message-ID: <6ba3a3f673e54c4235fe3040699d0ce5b52234f4.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V10:
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
2.45.0


