Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBE9BCF72
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830261.1245248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd5-0003d6-SY; Tue, 05 Nov 2024 14:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830261.1245248; Tue, 05 Nov 2024 14:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd5-0003aa-NG; Tue, 05 Nov 2024 14:33:59 +0000
Received: by outflank-mailman (input) for mailman id 830261;
 Tue, 05 Nov 2024 14:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd3-0002Lm-Ji
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:57 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbcc7573-9b82-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:33:54 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e13375d3so5709834e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:54 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:52 -0800 (PST)
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
X-Inumbo-ID: fbcc7573-9b82-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiY2M3NTczLTliODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjM0LjU0NDQyMywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817234; x=1731422034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cccZT2nNkS7HwSnMjpqOOO6Pj9Rt1hTJOtUGj8Io0EM=;
        b=cqvAj5hq1PfOP4NTs3I5y/dVM5hYvU49CVm5dH1egJD2yUuL2ZuCN9fhnf3nPU8eV0
         YKacFgYt1lZ4wcLHvUpKPH3lAGAs9OkC2ceMbLkUVBKUcksFYuEFbEU8WNbmG5UnFCZT
         ylHMnciva4isyDxkzHyfBGsh/L3+OjqCWBWj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817234; x=1731422034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cccZT2nNkS7HwSnMjpqOOO6Pj9Rt1hTJOtUGj8Io0EM=;
        b=oJmpnsvGqWa6PrpxuY2gdYHVY7psur+QYz4ZMWDiR/q7i77HSfaQMsoroqBCV1PE/t
         59DHsP1HbnphSDDYsMiXOKvAUOyp91uWJCPKsKWq+DSBcozQItJBkGmZdRJXTpcIvpLe
         7F/bptu2fbFpxq2+TFEnt2vNNUDxurFveyJ/7OL58wCDT4NM/BeMrTvJ5LT8++Uxz2DZ
         F2tztBoCAL9x4YoXzdPyYuX+2tIFg27MuNSVEhG2zAKSBR01VzWtIatrz9iD9P4Ye+rX
         +dyFl2By6xHjH9rQBE4mxjippyMDrOqejE0YN9g8+9+Cm5MM4MDbIcxChtZtmwU/DLty
         8VsA==
X-Gm-Message-State: AOJu0YwX3SBpsV26eVykjVzf9J7LxleTWOL6fUjYMCWM9NyfLW9JTyVV
	0HQF4s8nHgw+ZjM42l2J+e8i4ndKdgi9AbTF7tqrKGUEW1LGtkHF1Zs9dd8susI/EIrZQv3VAsA
	g
X-Google-Smtp-Source: AGHT+IHrNmRZfcX4aC6aS1DeA4a59+43m9OGjtNEUC2QU5MbtRtDnUQSzXyAAjVgiUZtRovM+6xiGQ==
X-Received: by 2002:a05:6512:138e:b0:536:53f0:2f8e with SMTP id 2adb3069b0e04-53c79e8ecbdmr8749128e87.37.1730817233351;
        Tue, 05 Nov 2024 06:33:53 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 05/13] x86/xstate: Map/unmap xsave area in xstate_set_init() and handle_setbv()
Date: Tue,  5 Nov 2024 14:33:02 +0000
Message-ID: <20241105143310.28301-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Added comment highlighting fastpath for current
---
 xen/arch/x86/xstate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index af9e345a7ace..401bdad2eb0d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -993,7 +993,13 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
         clts();
         if ( curr->fpu_dirtied )
-            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
+        {
+            /* has a fastpath for `current`, so there's no actual map */
+            struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
+
+            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+            VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
+        }
         else if ( xstate_all(curr) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
@@ -1048,7 +1054,7 @@ void xstate_set_init(uint64_t mask)
     unsigned long cr0 = read_cr0();
     unsigned long xcr0 = this_cpu(xcr0);
     struct vcpu *v = idle_vcpu[smp_processor_id()];
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate;
 
     if ( ~xfeature_mask & mask )
     {
@@ -1061,8 +1067,10 @@ void xstate_set_init(uint64_t mask)
 
     clts();
 
+    xstate = VCPU_MAP_XSAVE_AREA(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
     xrstor(v, mask);
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
-- 
2.47.0


