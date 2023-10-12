Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203EB7C77C6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 22:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616005.957677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr289-0006pW-9Q; Thu, 12 Oct 2023 20:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616005.957677; Thu, 12 Oct 2023 20:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr289-0006hq-4V; Thu, 12 Oct 2023 20:18:01 +0000
Received: by outflank-mailman (input) for mailman id 616005;
 Thu, 12 Oct 2023 20:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr287-000668-8Y
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:17:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ef65c04-693c-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 22:17:57 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso539667466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:17:57 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b00997d7aa59fasm11692552ejv.14.2023.10.12.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:17:56 -0700 (PDT)
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
X-Inumbo-ID: 6ef65c04-693c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697141877; x=1697746677; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALeoGKxiNsNupqhZSQanqEeTZk7gDRiZ8s33h27zT00=;
        b=E+JH0n5WXyAT6++c3A81kHS8x3g7+pypAo4OLAhsxjKwbnFlLq5uIt+GzWt2KH2qmv
         24qo7rLatVC0XaybYNQVZW0QdghYKXtmnPKyPhuTkhA/lbzNnDHPgusfprvxGLAsEjDs
         R0pg4iijttj5crmuvN9HkM0hlwhta4hrc9DOhv2PGWph8dx0LI8pVdrZlMGNoMtZFQF3
         /8bdgptkp0oYUfR24jrAHFV2cHooCvCtMZyk8RIkPH3DJEvfrpML0wtTOs6xH0iUJ+UF
         B4iclaj2LGHXdgmv6L+LSOAomAcHr6SApjI2u6wmRNZx8WbZdbKcyKvZT0Ejz+3XAtk7
         yOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141877; x=1697746677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALeoGKxiNsNupqhZSQanqEeTZk7gDRiZ8s33h27zT00=;
        b=RQwaZz+LemqUcL5BElaVqkgELA0VxBI+67tMgV4wMFU20rOQyT//nym58/ft+qd3Ed
         5NZmYC2JQeXZE9ztqviz+eV69Pc2Lns5vhFkI8N/O6nxp6VC/Qt0QlXg/BSE9ivlincA
         GaMyXbo9nnHvtrEMUJIF6yoPRedBwb4FsJ0p9xHdsjeh0xqW+qJK+1LEtwffcm2ja3qa
         89V26pOR3WlYJngeX8X+KoisAv2XsxQWKkk5fQdQYspIlRApM53odztYR2iLz9GjAkY3
         9s2e7TvY5wTsOBzq7jGjgKQaHu3w0Xcw/L8BGpQWZj1HmmairX/7XV/vi/rf+BEWscIc
         kyqw==
X-Gm-Message-State: AOJu0YwDlGt3OhabphMXf+naVUZQHGFlANBv7QT65Rq8UFv+Y08dEqJE
	aMSvA0VBbYl3SDliGNLM480=
X-Google-Smtp-Source: AGHT+IGL/aK1BGpYJaP/mMy11SXb55Cywvjox0gtbzUH0yanedqIAwh6/5blT0OJLYZSBuGZJQt9Dw==
X-Received: by 2002:a17:907:9715:b0:9ae:705a:8451 with SMTP id jg21-20020a170907971500b009ae705a8451mr21130335ejc.25.1697141877018;
        Thu, 12 Oct 2023 13:17:57 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 4/4] x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR macro
Date: Thu, 12 Oct 2023 22:12:07 +0200
Message-ID: <20231012201743.292149-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012201743.292149-1-ubizjak@gmail.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce x86_64 %rip-relative addressing to PER_CPU_VAR macro.
Instruction with %rip-relative address operand is one byte shorter than
its absolute address counterpart and is also compatible with position
independent executable (-fpie) build.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/percpu.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 83e6a4bcea38..c53c5a7f8e78 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -4,19 +4,21 @@
 
 #ifdef CONFIG_X86_64
 #define __percpu_seg		gs
+#define __percpu_rel		(%rip)
 #else
 #define __percpu_seg		fs
+#define __percpu_rel
 #endif
 
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_SMP
 #define PER_CPU_ARG(arg)	%__percpu_seg:arg
-#define PER_CPU_VAR(var)	%__percpu_seg:var
+#define PER_CPU_VAR(var)	%__percpu_seg:(var)##__percpu_rel
 #else /* ! SMP */
 #define PER_CPU_ARG(arg)	arg
-#define PER_CPU_VAR(var)	var
-#endif	/* SMP */
+#define PER_CPU_VAR(var)	(var)##__percpu_rel
+#endif /* SMP */
 
 #ifdef CONFIG_X86_64_SMP
 #define INIT_PER_CPU_VAR(var)  init_per_cpu__##var
-- 
2.41.0


