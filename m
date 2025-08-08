Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6392B1EF88
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075125.1437654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTkv-0000yc-1m; Fri, 08 Aug 2025 20:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075125.1437654; Fri, 08 Aug 2025 20:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTku-0000wy-UW; Fri, 08 Aug 2025 20:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1075125;
 Fri, 08 Aug 2025 20:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcn-0005tW-W4
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f993f6a-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:35 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so1221880f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:35 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:34 -0700 (PDT)
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
X-Inumbo-ID: 8f993f6a-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684615; x=1755289415; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAd9iHYMcX06IGN3X/Q4h7oZi4HPIwI/IwRbI7UnnSY=;
        b=E4fOoEtbfjIwG2N3rcHlDy2FoaBsRR02mG8Aydy7lJJZqGa8zu4JgEglSL0cpCuVW1
         SV0TKey8gAS7o46oyfxVfyxJvuv8aWgliawJNsHEke7d1FIV3mNTAnvudUeSyT9vnMFL
         1EsKC3h2pbHaLBgwd9aP7CWuNv5owpsYRGV04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684615; x=1755289415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAd9iHYMcX06IGN3X/Q4h7oZi4HPIwI/IwRbI7UnnSY=;
        b=p9rzL0gaKsSvbpGD0Qx+YBTV+3ycLC5UeV6F3cyfEqiFIO2Chwmh70B4VqH1yqZEMs
         HINxun17WI+r/DfX/hmrohKwUyg5wxx5FDvnylfVyazo57sax1ik6CbpxlYcgr/3tAhZ
         PfIXTdVnKjW3JI0jC3zcwK7ecjxe9EOIVNQ+AM05MYmC7S+jh592vE0Q0mbv5bWK99z6
         /zyqmC/GYgflXsXKRpXz+W1krgCQcp48nMrq6CpNroToGVoB1NtukokAP4l4V1Q8MvoR
         zxgRIzTmchwDTiOQgHnDl+u67K3WIyULbCWSoJukZ9EzT2fvxeHRXpsHGUy67/EPwKz+
         hmNA==
X-Gm-Message-State: AOJu0Yw6AZ7Zw+TZuAhQ+W5NySF5ewxfvnu6mAPy+D53lGR4r3OARxXT
	2OuG39ziXLVB1SS0/mLzawGhqB4sjNRo5mSKSDx74eMrwLpUHw+VHRNHt5HGp8lMRSeNRBDosbV
	A4dqVP4Y=
X-Gm-Gg: ASbGncsh0TV0FuMJFnPZNFNkW6JLDXMqqppxmcQvHu8c1n5gAfmtXUmJuMvkUDT1wio
	KIUuJpBtbwYt6qgY9TqnhK0BT+rWFRuX4e3wLKfxAdjt2dwI3Dgi4+0gvuMGdWkhzdezRbbutaj
	4BrGr/SzjnTLZNau5XakTYLsWqdDM9Zs3AKOnDgD+PN/5KuaN3LPfw07Y1AsCcQgQygeMZvZhey
	gkYzUJjE8SXhPzMApHswLql/LoSHQQpDMg/LmXA75692YXq+UJdJTF/YOI+F5gwZ5UAWZAGccVy
	VhfvpKoc+zAN9lqFnhVQ0aEZunuTJ2VZk66ctrv4usIXuxNhbMLBLFUcS0MhB2nubgwynMXSc+E
	yrhaxCaUd/jWAh7OucLLymVqazMRpJahxlxrcB+BIR9vpAB+p93I3DMPL21pcWYa6z7ULr9EGu8
	+A
X-Google-Smtp-Source: AGHT+IH1tZDOHe6Lnce61CjDEETd3H3QQKXhBfuREDUtylAMTzZV87JNoqp2AcJxtHkYk938vxIINQ==
X-Received: by 2002:a05:6000:230f:b0:3b8:d1a4:bacb with SMTP id ffacd0b85a97d-3b900b5118emr3505157f8f.42.1754684615006;
        Fri, 08 Aug 2025 13:23:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 20/22] x86/traps: Alter switch_stack_and_jump() for FRED mode
Date: Fri,  8 Aug 2025 21:23:12 +0100
Message-Id: <20250808202314.1045968-21-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
means that switch_stack_and_jump() needs to discard one extra word when FRED
is active.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

RFC.  I don't like this, but it does work.

This emits opt_fred logic outside of CONFIG_XEN_SHSTK.  But frankly, the
construct is already too unweildly, and all options I can think of make it
moreso.
---
 xen/arch/x86/include/asm/current.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 962eb76a82b3..24d7d906a8c6 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -11,6 +11,7 @@
 #include <xen/page-size.h>
 
 #include <asm/cpu-user-regs.h>
+#include <asm/traps.h>
 
 /*
  * Xen's cpu stacks are 8 pages (8-page aligned), arranged as:
@@ -154,7 +155,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
     "rdsspd %[ssp];"                                            \
     "cmp $1, %[ssp];"                                           \
     "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
-    "mov $%c[skstk_base], %[val];"                              \
     "and $%c[stack_mask], %[ssp];"                              \
     "sub %[ssp], %[val];"                                       \
     "shr $3, %[val];"                                           \
@@ -177,6 +177,8 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 
 #define switch_stack_and_jump(fn, instr, constr)                        \
     ({                                                                  \
+        unsigned int token_offset =                                     \
+            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - (opt_fred ? 0 : 8);  \
         unsigned int tmp;                                               \
         BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
         __asm__ __volatile__ (                                          \
@@ -184,12 +186,11 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
             "mov %[stk], %%rsp;"                                        \
             CHECK_FOR_LIVEPATCH_WORK                                    \
             instr "[fun]"                                               \
-            : [val] "=&r" (tmp),                                        \
+            : [val] "=r" (tmp),                                         \
               [ssp] "=&r" (tmp)                                         \
             : [stk] "r" (guest_cpu_user_regs()),                        \
               [fun] constr (fn),                                        \
-              [skstk_base] "i"                                          \
-              ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
+              "[val]" (token_offset),                                   \
               [stack_mask] "i" (STACK_SIZE - 1),                        \
               _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
                                  __FILE__, NULL)                        \
-- 
2.39.5


