Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE09B3555
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826693.1241122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0T-0002Zg-Br; Mon, 28 Oct 2024 15:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826693.1241122; Mon, 28 Oct 2024 15:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0S-0002Lh-WA; Mon, 28 Oct 2024 15:50:12 +0000
Received: by outflank-mailman (input) for mailman id 826693;
 Mon, 28 Oct 2024 15:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0Q-0008FV-TX
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f3340e9-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:09 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so696754166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:09 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:07 -0700 (PDT)
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
X-Inumbo-ID: 4f3340e9-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130608; x=1730735408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Avz5HmUUjPMBeZFfQQx+SO7GKCNtStFnZFq73+xyyr8=;
        b=fGBlgYXj4aQ4LFrwVgbw+qOOp7iTsL3BI/zt8K1okiw4iXpEd8PN2i5JVyRPXy1Pdd
         dKtik0MWxssAdblNUvu+RGlKMDFLr6kcnYrPou2m6NQSa9bprIwfy0mJjgVXmFXvyekA
         TvQKrRuwXoJDKTZ6tos1qFRgJesa0/6R78JoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130608; x=1730735408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Avz5HmUUjPMBeZFfQQx+SO7GKCNtStFnZFq73+xyyr8=;
        b=XlNoRR0On38H49KC0KvBpWVLZ2hnjqw9a+4h4gFRwFmuxVkOdS1Gzhu1gTKIM4relk
         G6l6JOqtWc3DRwuHlj36zR8B77ynoxnVKrOqXDgq26Yh5ZqnA78ShmZtEzHF2q3hnPuU
         VeLqwlbdu+0De3wTG/9vu0Y2JxIZNM64urz7co3h/wKhpldhi4AUG9AHnOLp5H7vdtzg
         xjT9aIub4xoKSNvDNNo5s17rDKkNFwnMKe/w3+4rzIBlJ9xwTkR1R9CLMjs/2LBm4TVL
         7paTVs+9n9YDfEIhFMI8nR66F+fmx2RtvbMGKGDDLQyxENVFBs2obleA4ZzzsR/Pn9Qi
         Zu2g==
X-Gm-Message-State: AOJu0YxLU+bt6FxNKQ9D543WUE6uPYhYIsOV9j0vcsqBeG/7VIriL0eA
	5dt8qyB6fapeifQ9K9egEJdmji0BbgPUp8+SJZ8xeUTkaUFJ7XFzcp+gx/FsDlNZcimtTrEITCF
	H
X-Google-Smtp-Source: AGHT+IFYkudP6zAU62spG2PVUAK8m0Vhgf6c+oKiNEtCmUOgIOvJL7/w8NXyEKEp5JICHhs/Va6zEg==
X-Received: by 2002:a17:907:9281:b0:a99:d3f4:ff3b with SMTP id a640c23a62f3a-a9de5f65689mr830166466b.27.1730130608439;
        Mon, 28 Oct 2024 08:50:08 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/14] x86/mpx: Map/unmap xsave area in in read_bndcfgu()
Date: Mon, 28 Oct 2024 15:49:28 +0000
Message-ID: <20241028154932.6797-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/xstate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 4019ca4aae83..2a54da2823cf 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1021,9 +1021,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
 uint64_t read_bndcfgu(void)
 {
+    uint64_t ret = 0;
     unsigned long cr0 = read_cr0();
-    struct xsave_struct *xstate
-        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+    struct vcpu *v = idle_vcpu[smp_processor_id()];
+    struct xsave_struct *xstate = vcpu_map_xsave_area(v);
     const struct xstate_bndcsr *bndcsr;
 
     ASSERT(cpu_has_mpx);
@@ -1049,7 +1050,12 @@ uint64_t read_bndcfgu(void)
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
 
-    return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
+    if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
+        ret = bndcsr->bndcfgu;
+
+    vcpu_unmap_xsave_area(v, xstate);
+
+    return ret;
 }
 
 void xstate_set_init(uint64_t mask)
-- 
2.47.0


