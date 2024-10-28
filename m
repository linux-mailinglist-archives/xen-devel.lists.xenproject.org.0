Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380319B3557
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826689.1241083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0O-0001Tv-Ob; Mon, 28 Oct 2024 15:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826689.1241083; Mon, 28 Oct 2024 15:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0O-0001LM-Eb; Mon, 28 Oct 2024 15:50:08 +0000
Received: by outflank-mailman (input) for mailman id 826689;
 Mon, 28 Oct 2024 15:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0N-0008FV-8j
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d1cebc9-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:05 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso731818966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:05 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:04 -0700 (PDT)
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
X-Inumbo-ID: 4d1cebc9-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130605; x=1730735405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCUIaO5AAUJAl3VVRobAf52t1sH+3QDwfli/NHe1tzs=;
        b=cPAtnkReW2GjHosOwvGsYwTAOkydWbo96UeTiSRlrVpqo0ohTY7mlvtyCtkOmsJBQ3
         fArpT3883r5gOsdxp8WGro8N70BJm/WjoPY00+e7QqHo6Pv+/lEugBsO5yeW+rDqM7yn
         EPbZz0GQVoKc0MtE8UOZ5gDe+0PH9RT+WTscI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130605; x=1730735405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCUIaO5AAUJAl3VVRobAf52t1sH+3QDwfli/NHe1tzs=;
        b=N4hcVtIKytbjnAVWOvodSrxKqnO4wiuJwBoE62VGnbUPUtihz171+ZEZoZFZSpGdNS
         HDwV5sF/6ovR8he9Y5KDbqCKhfACwnsbPT58EQS/97OTGk4LR/YezEA3iu6ic2aeUF3A
         BbBVhY8HZl7XoR3UE4kahX1CGgjH8k5h7Jl7ieMftzTa6mtjDwPm4+l7OebeQPxHvPHi
         Nr9ApgCJ1+zM8srdR+x7iGq/Tcg3jOzYoaTPn5JGoVSCxvIS7lQrJ4k6HQONpZ6s1o7w
         I8A/NK62uznZa7f7IVAdDGVpxhMx7Gv3LuzdLygnPdiTfiQX+oH5WjR4hEgtY7qJnLVX
         eCEg==
X-Gm-Message-State: AOJu0YyP4/foT71RTzdS+VPqXxhcAdyGmVoIb0gGzM9yg/Hr5H2td4Om
	LD6Qpm5/5Bg8PJdBVdSX377vKwqXCxkexWjZaGAG7g1GXV4Pa1ZyU56YoDUmAAL/Q8jDQcfgw8c
	f
X-Google-Smtp-Source: AGHT+IE5VF1LUnql9xYflHwCakwiEC09wAgohLGgcWNnxyhKcGI4YZSpn8NZ2zgcm3u36Kdyu5zrtg==
X-Received: by 2002:a17:906:794f:b0:a9a:4597:a7f3 with SMTP id a640c23a62f3a-a9de619876amr890640466b.62.1730130604948;
        Mon, 28 Oct 2024 08:50:04 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 06/14] x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
Date: Mon, 28 Oct 2024 15:49:24 +0000
Message-ID: <20241028154932.6797-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/emulate.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f2bc6967dfcb..a6ddc9928f16 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2371,7 +2371,8 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
+        const struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
+        const fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2397,6 +2398,8 @@ static int cf_check hvmemul_get_fpu(
             else
                 ASSERT(fcw == fpu_ctxt->fcw);
         }
+
+        vcpu_unmap_xsave_area(curr, xsave_area);
     }
 
     return X86EMUL_OKAY;
@@ -2411,7 +2414,8 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
+        struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
+        fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
@@ -2465,6 +2469,8 @@ static void cf_check hvmemul_put_fpu(
 
         fpu_ctxt->fop = aux->op;
 
+        vcpu_unmap_xsave_area(curr, xsave_area);
+
         /* Re-use backout code below. */
         backout = X86EMUL_FPU_fpu;
     }
-- 
2.47.0


