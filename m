Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CC7C722D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 18:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615917.957491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIw-00041P-0S; Thu, 12 Oct 2023 16:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615917.957491; Thu, 12 Oct 2023 16:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIv-0003uy-T4; Thu, 12 Oct 2023 16:12:53 +0000
Received: by outflank-mailman (input) for mailman id 615917;
 Thu, 12 Oct 2023 16:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqyIu-00039J-L3
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 16:12:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 311d453e-691a-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 18:12:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-991c786369cso186313166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 09:12:51 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm11414461ejb.141.2023.10.12.09.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:12:49 -0700 (PDT)
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
X-Inumbo-ID: 311d453e-691a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127170; x=1697731970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSHi5/2cUoPsahCtfSXb7KL8cBzud0m2fEvRiojl9UE=;
        b=jmLnJTSocAIocPdvkghOiaqt+L/vI15+glJvKXLkTjS64iN4Texl6JxcRW6H79Xaaj
         q/Nsu3oHfdwJ4uA8iIwekgmJz8P02TdIOR8jjQ9wZFdBuXiU+E0kPJOOpSNKBq9RYs9y
         jw440MSkgvnhE9lLaKZ98ijEKpFiSfo0intyL2ezzoujX2DZP3oaaOVHPRDJajd7rEje
         vp3P7U1UAq+xl9WdQTtnEJX9ag57bf6I6L8GZlUx+oi4H3sE61HgUljPVRR3grnw0ktN
         2viL+1ISSzWpUYfg3nfqEijrG3KIqJNtwekgK2BrTYGbEelFKyRbSUv1Oumzcdbb17IB
         nU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127170; x=1697731970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSHi5/2cUoPsahCtfSXb7KL8cBzud0m2fEvRiojl9UE=;
        b=JPUHBSU+O/W+AwxpL7BJHXbtVjkrkFe17EBPDFclQsiPMbOUuRtfFb/tQqpcUeSLiQ
         lY7mZmAfLeF0XL53J6FvltrYBCfM1hmxeopotQRDJnDxLdu9mQeRTti//5k1xYHQXj0i
         /73Vz2+utptlJ0Tx1RiwKsUlgrZNwxU3AIJ+cpD/AgLQxbL6zcrQgvcJiAye2ol2MCEB
         oeweDhMlHRfaVWXMZbEFvmsVlNacNyH4s68cPs3Bv7n0If0smiA4VEWvQtHrTlbi4ySW
         F/TtihIjLnsriwYGlv5kNg4BcbJAMsuq5hrxh6G+/N5UVeozHFs6LdHi9dcs1MgF3m0Z
         AKKw==
X-Gm-Message-State: AOJu0YzmJ0+gUfNDp0pLZ7b7NX4P5o3iUIJsUezCmRytABXvzwvDK4Px
	ZSAwXypcjBwx4dxSW9v2Kc0=
X-Google-Smtp-Source: AGHT+IFpYi1blV2KJsYt/+b2deArMIbm7cJzAsEuhn9TEMfBcKQAcEqKVR0HJV8k5hdf8tw21y1uTg==
X-Received: by 2002:a17:906:76cf:b0:9b7:303b:1ecb with SMTP id q15-20020a17090676cf00b009b7303b1ecbmr22078486ejn.61.1697127170254;
        Thu, 12 Oct 2023 09:12:50 -0700 (PDT)
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
Subject: [PATCH 4/4] x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR macro
Date: Thu, 12 Oct 2023 18:10:39 +0200
Message-ID: <20231012161237.114733-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012161237.114733-1-ubizjak@gmail.com>
References: <20231012161237.114733-1-ubizjak@gmail.com>
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
 arch/x86/include/asm/percpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 34734d730463..9a5f1896c5ef 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -4,16 +4,18 @@
 
 #ifdef CONFIG_X86_64
 #define __percpu_seg		gs
+#define __percpu_rel		(%rip)
 #else
 #define __percpu_seg		fs
+#define __percpu_rel
 #endif
 
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_SMP
-#define PER_CPU_VAR(var)	%__percpu_seg:var
+#define PER_CPU_VAR(var)	%__percpu_seg:(var)##__percpu_rel
 #else /* ! SMP */
-#define PER_CPU_VAR(var)	var
+#define PER_CPU_VAR(var)	(var)##__percpu_rel
 #endif	/* SMP */
 
 #ifdef CONFIG_X86_64_SMP
-- 
2.41.0


