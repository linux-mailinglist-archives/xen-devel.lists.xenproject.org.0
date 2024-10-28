Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CAF9B3559
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826687.1241071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0N-0001DG-OR; Mon, 28 Oct 2024 15:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826687.1241071; Mon, 28 Oct 2024 15:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0N-00019a-J3; Mon, 28 Oct 2024 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 826687;
 Mon, 28 Oct 2024 15:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0L-000874-BW
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca4ce99-9544-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:50:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a68480164so620241766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:04 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:03 -0700 (PDT)
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
X-Inumbo-ID: 4ca4ce99-9544-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130604; x=1730735404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5/TXen51hB68I6BFGT+jmFtlRjBnBfjDOpUJmu9hDE=;
        b=TY/fIWVJd9hNosxSg3y3L6TwxGcyw7Z3XrbpVDP6KAO8hoYT8IWuoWN7fhgQSh5JGG
         +bBsdgJR4MDfiAdoYrWFTpEMiT1TOo7spC056dsdxpo+U0KpKG/fhZU79WPIiYqJ99bY
         ViUYA3oq4eJvH4rpmRy6UPRfPG6XgaiLJSg+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130604; x=1730735404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5/TXen51hB68I6BFGT+jmFtlRjBnBfjDOpUJmu9hDE=;
        b=RNZV0/86H4+vsjKM0IYys36ILFAR9wTFeMPYBecQYl3eO8tljREINku+2EVhzV6dl6
         fO2XhsxpHP9Pap1KENTjjcpzrZohtZlSkkR6xTjRNR3RVTStK6orPJcvNjYjqZFgVIkp
         hfVhha+VXhw43FknpHKCOOXBxDsmLRajY8GjZzcel0iJFsAznIfJtiltF7yHB7VKKU5a
         4tEBBLEFukgvYVQo/atFGN2hu0W8nXZax18exmHaT26sz2xfJECjnFT26gHqTCscTMGi
         WS93vG7fzaNYdU/tL9KZxVfeb5xhiaJHZXZOmDR3AIqCPGpLiXPPgvIUh1x5VN2GkJuZ
         zRig==
X-Gm-Message-State: AOJu0Yxprcl01SzgNs+btBwc1R8S25lC6HwdnhEuwZj0vjwd/5jz/WwO
	ztY4WCGg845vZx/vtnjhtCiO1xgUxsAzXvuJ4sTt2KeYxYtMQpvl9Bho7Wygh0BcXK5LIT/vNfI
	G
X-Google-Smtp-Source: AGHT+IEuqJAcG2GYWLVnnngxRLpaSRDV3BwBCu+v1OexXNCj5m10aMlavT0wiEaUKGuKYvkiTGsvTg==
X-Received: by 2002:a17:906:6a1d:b0:a9a:18ee:5106 with SMTP id a640c23a62f3a-a9de61e95a5mr760804266b.65.1730130604050;
        Mon, 28 Oct 2024 08:50:04 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/14] x86/xstate: Map/unmap xsave area in xstate_set_init() and handle_setbv()
Date: Mon, 28 Oct 2024 15:49:23 +0000
Message-ID: <20241028154932.6797-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/xstate.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index af9e345a7ace..60e752a245ca 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -993,7 +993,12 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
         clts();
         if ( curr->fpu_dirtied )
-            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
+        {
+            struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
+
+            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+            vcpu_unmap_xsave_area(curr, xsave_area);
+        }
         else if ( xstate_all(curr) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
@@ -1048,7 +1053,7 @@ void xstate_set_init(uint64_t mask)
     unsigned long cr0 = read_cr0();
     unsigned long xcr0 = this_cpu(xcr0);
     struct vcpu *v = idle_vcpu[smp_processor_id()];
-    struct xsave_struct *xstate = v->arch.xsave_area;
+    struct xsave_struct *xstate;
 
     if ( ~xfeature_mask & mask )
     {
@@ -1061,8 +1066,10 @@ void xstate_set_init(uint64_t mask)
 
     clts();
 
+    xstate = vcpu_map_xsave_area(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
     xrstor(v, mask);
+    vcpu_unmap_xsave_area(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
-- 
2.47.0


