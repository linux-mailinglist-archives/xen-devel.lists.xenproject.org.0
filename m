Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5442CDCE93
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192964.1512091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHD-0006ZO-KL; Wed, 24 Dec 2025 17:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192964.1512091; Wed, 24 Dec 2025 17:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHD-0006TO-4T; Wed, 24 Dec 2025 17:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1192964;
 Wed, 24 Dec 2025 17:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSHA-0003b7-BD
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:52 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84fad15a-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:50 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b7a38f07eso7666681a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:50 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:49 -0800 (PST)
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
X-Inumbo-ID: 84fad15a-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595830; x=1767200630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHV6F5htLdht8yZyJ/VwtJxiGcps1XdDoDnEGPAzWMU=;
        b=VYo6zE9bFqe4p5SdBZZ5wLqzpeT98++7+dfo3SZStcT0P5PnWsoegw0dxpZwtmLGW+
         275CsL0O5VIdPqYHt4DKMRW/LFDBepqg+Rz9ZQvbP3FWI/d+CydD33IcHwtYfrFBeRsb
         hODY3nOlkLT2ES5/wDbSz8NqZjhwoGJH8XYSNRSDkUCdKJcTcYNxsydczEwKUa2dKvFy
         oK0KEWfzE28cowcAkYWLUqRP5L++VhpZl8iOOPhyTE2jtBJB+Oz26Z7prT6S3kUaYrm/
         tMlt4iQ/BTzqA5L0Hk6Q5/jMvlZITDxA0jJW3lC6Qknb8OB9InCdZm5GgPUIW7pPBpNa
         NRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595830; x=1767200630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHV6F5htLdht8yZyJ/VwtJxiGcps1XdDoDnEGPAzWMU=;
        b=Yu9e0h6S3P8n/tW0dDW2UHuH8j0RsqEw6Q8dSlisjpojbFN0B/MXI0VE3qLNdrxdK/
         bT1UJnzGS2zi7lGI8Yt2uCgeYbwT3+mjhhbo/o5HAt0yDF5Ut84Am8qd65SlqGrzQOQ1
         bfjU+4t3dEwHPO4M0GP1xox3YDH29NhXpgs0CpHEpzonlxfRNM6uFBwGuupfpF31BmPU
         hrVNxsF1oYO1/nnH9+yVH6GcjpibtUKBGveS1wYJg1UlJSjPnOwhitajI1+OPYUt3Tag
         SGMcHkkbmgrXjiP7Y7Mw51m3HafCywqpONbwkpUigmbgGQiFjgko4takBC+NfZ0hZ9jq
         n3jA==
X-Gm-Message-State: AOJu0YyYDs1iC65wRuuWMD1OBTox8qGp2fd6xRpn3H2/73XSRmvgxtrR
	tvUHyEM3Z9HAqUuVBLhnmTwgfI5nyimkwAzc8EUsugaF98lZY5ZN3Sspy7mKzg==
X-Gm-Gg: AY/fxX4mLv7aa6IXJlYQO2RF1df4gNxn8ROYo+YJajzEcF2iPSQYANAbI1z3FPOUSvS
	c30uPqdwt4atMeCRuTYI22RnmABCu1bJo/C38/0ksqxKA4FQdgf+2Q3f/CI38pySwyrksiv6i3/
	hqKxElESUK76OHDftPuSBo9/KqZUzF5chPCAXTe0kyYWD0N+/yUor9uhT56xGenU/bcR+xRAyzg
	mjX0BILplc96V8FkgXMTtavCxVrNS6aZC1ksaNVYUd6vmVqvw26Khy7UJA3QycSZUDcyoAxcnm8
	Y06hTmF5g6LvkRqKPsajVx/gaLAs7F4XRd4cle56qGq7O63NicKtz94Nz792WhvGrJ3oAst9TFM
	nisH4aRNyF+GoBDgfCviShEKHWPT9pyG2qYTubnLRXNj2uo1XpJDotOTBzMFoWvKWyqtmCegKsP
	5NEM5Yj616T1+GvSHt2u+nXFA2yO/v+w1CsEauGaMH/Vd+yzbTUzOsjJo=
X-Google-Smtp-Source: AGHT+IGCPZmbf6qTvckKYI4m1PncXD0B+3c5MgjqTyQZjgApVhhOZGr5y4+53c6unhHJQPTgfm0J4Q==
X-Received: by 2002:a17:907:97c5:b0:b6d:3fc9:e60c with SMTP id a640c23a62f3a-b8036f10dc8mr1977178266b.20.1766595829888;
        Wed, 24 Dec 2025 09:03:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 14/15] xen/riscv: handle hypervisor timer interrupts
Date: Wed, 24 Dec 2025 18:03:27 +0100
Message-ID: <c63eef564d0d350f009e253b24b567488e47eb13.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/traps.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..5fd12b1b21c3 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/intc.h>
 #include <asm/processor.h>
@@ -108,6 +109,15 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+static void timer_interrupt(unsigned long cause)
+{
+    /* Disable the timer to avoid more interrupts */
+    csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    /* Signal the generic timer code to do its work */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -148,6 +158,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 intc_handle_external_irqs(cpu_regs);
                 break;
 
+            case IRQ_S_TIMER:
+                timer_interrupt(cause);
+                break;
+
             default:
                 break;
             }
-- 
2.52.0


