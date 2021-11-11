Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E444DB62
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224832.388372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKy-0006Qy-Lv; Thu, 11 Nov 2021 17:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224832.388372; Thu, 11 Nov 2021 17:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKy-0006Ld-Ce; Thu, 11 Nov 2021 17:58:12 +0000
Received: by outflank-mailman (input) for mailman id 224832;
 Thu, 11 Nov 2021 17:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKw-0005kR-HK
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed5ad4e9-4318-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 18:58:09 +0100 (CET)
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
X-Inumbo-ID: ed5ad4e9-4318-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/0v3Sf50cFNF0yODlWT/nVv/6FJ5Q1x8/OSVwgO6GU=;
  b=N3o6QLgR2TsS1YQBhgrnhxYf/Ew5hFqDWaK5+crlXtn7fjufJaMehnw/
   rdSVa3sc+NiyP/WsXzdk5NayMm//V8u1qFnfvJYejxZ9RU6WO4e/QzAY6
   5q09X0jcNVHloc7Fw1mHpntY4wdev4vcGTdHpyi+xZbJpQxMrGasbgDzt
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ggK1CUUX5UhS1Uoe+hmHccflEXRTp8qP6qoQASuwhQ7Kcag+nXHrVcWvMInyZoRiAXSxQBOyMh
 icY6ZrvnEKPlyCsGQ+A4wgyEPMpDC9rAqmUSgoSTRhhn7XAnv4MJjhib8nO0raHGdWLTHR1FbR
 NvUY5I6eAMidEg0hwr4/U9PRNRjTZHx3SShdjvY39ffKxq9WEkExOY8u9libeskDBs+eukUBvD
 dmsYDXIKUp5Z7VFEomG9MJnE+BhOylAaTtoUVAZ0S1/bi8qaBaA0uyPdRx3Unc64P8h/VFPUnb
 rFRNN9KL1oeVyshHymzU1/th
X-SBRS: 5.1
X-MesageID: 57155539
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2Zbtlagvs3HzPLDzIC5skhXTX161rRcKZh0ujC45NGQN5FlHY01je
 htvDG2GMq6JN2T2Lt1yPtu0pk5X68fUzNc2GlZoqy02FHsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1QtL2WWy4WNZHHnf8/CDhcEyteLPRZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauBP
 pdENGE+BPjGSxJ/CnNJD7Q0pcH233LzKjJgpnOJmKVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4DuwbzhOk9aHo6AOCJDMlSj5LSM1/q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swpn2AAcmV8HlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybJtaKGC5P
 RCM5mu9AaO/2lPzPMebhKrrW6wXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIOSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:JEO63KotJcgm2uXwdh/HDFIaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57155539"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] xen/wait: Remove indirect jump
Date: Thu, 11 Nov 2021 17:57:39 +0000
Message-ID: <20211111175740.23480-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211111175740.23480-1-andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no need for this to be an indirect jump at all.  Execution always
returns to a specific location, so use a direct jump instead.

Use a named label for the jump.  As both 1 and 2 have disappeared as labels,
rename 3 to skip to better describe its purpose.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 24716e76768b..9276d76464fb 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -144,18 +144,16 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         "push %%r8;  push %%r9;  push %%r10; push %%r11;"
         "push %%r12; push %%r13; push %%r14; push %%r15;"
 
-        "call 1f;"
-        "1: addq $2f-1b,(%%rsp);"
         "sub %%esp,%%ecx;"
         "cmp %3,%%ecx;"
-        "ja 3f;"
+        "ja .L_skip;"
         "mov %%rsp,%%rsi;"
 
         /* check_wakeup_from_wait() longjmp()'s to this point. */
-        "2: rep movsb;"
+        ".L_wq_resume: rep movsb;"
         "mov %%rsp,%%rsi;"
-        "3: pop %%rax;"
 
+        ".L_skip:"
         "pop %%r15; pop %%r14; pop %%r13; pop %%r12;"
         "pop %%r11; pop %%r10; pop %%r9;  pop %%r8;"
         "pop %%rbp; pop %%rdx; pop %%rbx; pop %%rax"
@@ -204,15 +202,14 @@ void check_wakeup_from_wait(void)
     }
 
     /*
-     * Hand-rolled longjmp().  Returns to the pointer on the top of
-     * wqv->stack, and lands on a `rep movs` instruction.  All other GPRs are
-     * restored from the stack, so are available for use here.
+     * Hand-rolled longjmp().  Returns to __prepare_to_wait(), and lands on a
+     * `rep movs` instruction.  All other GPRs are restored from the stack, so
+     * are available for use here.
      */
     asm volatile (
-        "mov %1,%%"__OP"sp; INDIRECT_JMP %[ip]"
+        "mov %1,%%"__OP"sp; jmp .L_wq_resume;"
         : : "S" (wqv->stack), "D" (wqv->esp),
-          "c" ((char *)get_cpu_info() - (char *)wqv->esp),
-          [ip] "r" (*(unsigned long *)wqv->stack)
+          "c" ((char *)get_cpu_info() - (char *)wqv->esp)
         : "memory" );
     unreachable();
 }
-- 
2.11.0


