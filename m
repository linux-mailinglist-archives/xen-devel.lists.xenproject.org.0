Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD8A7085D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926852.1329709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H7-0004l4-DB; Tue, 25 Mar 2025 17:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926852.1329709; Tue, 25 Mar 2025 17:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H7-0004h2-A3; Tue, 25 Mar 2025 17:41:17 +0000
Received: by outflank-mailman (input) for mailman id 926852;
 Tue, 25 Mar 2025 17:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx8H5-00045y-PP
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:41:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59b17cf4-09a0-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:41:15 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39127512371so3993715f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:41:15 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fdbd0a9sm158386185e9.38.2025.03.25.10.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:41:13 -0700 (PDT)
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
X-Inumbo-ID: 59b17cf4-09a0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742924474; x=1743529274; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pcwLJmB1yC+r9MBb3YQ0Qzf5TTJGwAw3sPrq/2+5tw=;
        b=FdWJrVMCr0DYaSCiSET4fXp3z1WCio8trnCy84gsOCMuiOwoQIZvDiMsIEzh0du0dV
         u8KfztBPRc0T3zBoA1S4CpXhj0jsd97/JE1Jm4XOZWaxFQui7knpisUbJyzUkHqWjo44
         bjO5UU5u5/gBeBeeralf9bHFZMnaUL3cgn6Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924474; x=1743529274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pcwLJmB1yC+r9MBb3YQ0Qzf5TTJGwAw3sPrq/2+5tw=;
        b=QxBJ1UfKNsnTld1+x6z8qolxlxKadWsoOdgtAihbZX2r0x+p/NofIcHf4sWIlXC6yT
         b+X8g3zXBq4kbS+8AIWRyLx2jLBEQLSb+mEO7Wh33Xc8c0+0D3oBeBd0jSWv1l/uRVdO
         8hWiyjFLpLLiHEX9FOI5BcMAMccvwXcyQWhXGXjIEcp7V0JyFd3awv63Xtpm9e2T79Yg
         eV1+bh99EDknz6VfO81Ny8Qpkb0Dxzo562ysfGpQhxOUW5l7QZQeUcC8FN+TRQdsyhkx
         PiWwaJwOti3/Bt4wZk7f7SbGkxvt9RAefkaAtbEMBL2ei7eB4oQMHBuOmUJqNET6dASV
         aWIA==
X-Gm-Message-State: AOJu0YwLrFTNwislOPBg74xjtzg8zvI0P7hzp0EGkSgYCVDOhY3Oq1oE
	dDacx7oCy2rC5YG0ymGgy2R8eu7lRMQfOD5hKZe422Dr7Na5ivAn9r4FwEAkXRZjB/9OD2Byyfd
	iVoE=
X-Gm-Gg: ASbGnctJcSvJ8PmQD1wyvw5GQWadZzNqHeAtnAtveQH7KZy3QxRifXBT53kjThEF9aN
	S1zGiPtoifseIHck0e6lxSNgblEpurornkW3x1myqIhutZo0boU/FpFyissA+c9slfGl9mSKnkU
	7ReOASBPU0kSyDYq2msLjZw0d1HvFXYujOmLZP7XQTO4HrRGN8HI8K5aFu2N6Tiy4qbqJG1yUQK
	om9O5Ybi+LibNv0CuWH5oXGl9bfGfBhey5bi6e6lDvKNPT+6XNlxzh6ktrtfGCCkBN6UuR4Xu7C
	lZJi9jxIme9H+cP+/nIOC+/Vysd3o62rcUsqlWGPjA6eWiqSeQ3hNm0jtDTU0qUrBfNmSrJyUMr
	a7s+Zd2Ty1QkKvUoTrOE0SUMSRadb
X-Google-Smtp-Source: AGHT+IGnA1nhRYU/s0KClBcfRPcWZiRte8COkIcLEjxWQDpxV0xFR5pLYXSeSmb88ByK93Z4Ot2Atg==
X-Received: by 2002:a05:6000:2b08:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-3997f90ecd8mr10847032f8f.30.1742924474538;
        Tue, 25 Mar 2025 10:41:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/emul: Emulate %cr8 accesses
Date: Tue, 25 Mar 2025 17:41:09 +0000
Message-Id: <20250325174109.267974-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325174109.267974-1-andrew.cooper3@citrix.com>
References: <20250325174109.267974-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Petr reports:

  (XEN) MMIO emulation failed (1): d12v1 64bit @ 0010:fffff8057ba7dfbf -> 45 0f 20 c2 ...

during introspection.

This is MOV %cr8, which is wired up for hvm_mov_{to,from}_cr(); the VMExit
fastpaths, but not for the full emulation slowpaths.

Xen's handling of %cr8 turns out to be quite wrong.  At a minimum, we need
storage for %cr8 separate to APIC_TPR, and to alter intercepts based on
whether the vLAPIC is enabled or not.  But that's more work than there is time
for in the short term, so make a stopgap fix.

Extend hvmemul_{read,write}_cr() with %cr8 cases.  Unlike hvm_mov_to_cr(),
hardware hasn't filtered out invalid values (#GP checks are ahead of
intercepts), so introduce X86_CR8_VALID_MASK.

Reported-by: Petr Beneš <w1benny@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Petr Beneš <w1benny@gmail.com>

v2:
 * Check for reserved bits

In CPUs, CR8 has has 4 bits of storage, and can explicitly get out of sync of
APIC_TPR if the the LAPIC is hardware-disabled in MSR_APIC_BASE.  Writes to
APIC_TPR don't get reflected back into CR8 (according to AMD at least).  Both
Intel and AMD accelerate TPR differently; SVM in the base architecture, and
VT-x as the ~first optional extension.
---
 xen/arch/x86/hvm/emulate.c           | 15 +++++++++++++++
 xen/arch/x86/include/asm/x86-defns.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 172ed55bd5e7..61aa356d5736 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2288,6 +2288,10 @@ static int cf_check hvmemul_read_cr(
         val = curr->arch.hvm.guest_cr[reg];
         break;
 
+    case 8:
+        val = (vlapic_get_reg(vcpu_vlapic(curr), APIC_TASKPRI) & 0xf0) >> 4;
+        break;
+
     default:
         return X86EMUL_UNHANDLEABLE;
     }
@@ -2333,6 +2337,17 @@ static int cf_check hvmemul_write_cr(
         rc = hvm_set_cr4(val, true);
         break;
 
+    case 8:
+        if ( val & ~X86_CR8_VALID_MASK )
+        {
+            rc = X86EMUL_EXCEPTION;
+            break;
+        }
+
+        vlapic_set_reg(vcpu_vlapic(curr), APIC_TASKPRI, val << 4);
+        rc = X86EMUL_OKAY;
+        break;
+
     default:
         rc = X86EMUL_UNHANDLEABLE;
         break;
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 61b0cea8f37c..23579c471f4a 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -76,6 +76,8 @@
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
 
+#define X86_CR8_VALID_MASK 0xf
+
 /*
  * XSTATE component flags in XCR0 | MSR_XSS
  */
-- 
2.39.5


