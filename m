Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F49B3556
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826688.1241077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0O-0001L3-57; Mon, 28 Oct 2024 15:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826688.1241077; Mon, 28 Oct 2024 15:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0N-0001DL-Uz; Mon, 28 Oct 2024 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 826688;
 Mon, 28 Oct 2024 15:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0L-0008FV-Ho
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c1752b5-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:04 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c95a962c2bso5541659a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:04 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:02 -0700 (PDT)
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
X-Inumbo-ID: 4c1752b5-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130603; x=1730735403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY/UrTCQ/vWU0sbBxlJ8N5ALQVl83VMvY6/kdegt+f8=;
        b=FJek+/D7mp0vn/T9HA2IbH50c731yiPg9/cjRpNDHKVx86eIvfLiQCvPG6ahNtbUR+
         LV7oC4/RKRTUDyAy5j7XOQWW2/x5xlP4qma3T/3g1QZmlsJoWf7ltftn2eChnOZ7KCRs
         MqYziWqu8Jj3YWUyg7HFH6gYg339cTt96FkkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130603; x=1730735403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY/UrTCQ/vWU0sbBxlJ8N5ALQVl83VMvY6/kdegt+f8=;
        b=Gly7dzCclPefjZNsd5+p9WUx8CvJxkN8DiUEr2eJGUEJt7iJUosNzK4tOs8t9SSWX4
         FVzZn86SbHWOAsdjVnHQnsT8VnkWgD4CeazcBLqmVkgozhoxhU5UsWnEHTug0R2r6pJb
         hOkUz7N3zQnNHm7FdN/7sembCbiKxNhlfa/zxRbbG+/k/MYOxNX0iQsaXTc5YzDpOKj5
         QAvDszfa8bbB/a9xg9hJgkejWY5Fh7h4PdB+2ugmt2JXUku210uXfVja7XtOpA0Ye2z1
         PoXtiPJp0Rrkhc44bYMX67tr9y8hd9KlKpfkTIAu1aJ7l9mpNlwML0HCX9bkYeAlYSDS
         2YbQ==
X-Gm-Message-State: AOJu0Yw5CAF7kEtNNwPRUTikoCYELzfx9gBKc61yed043r8CmPbM01TS
	5fAKIKLMjvwHTAWkZacqqwDD+6viRlVyXQpB189EHrOV2WU2YKWl9/XAYfp/mg9LCkGNHky2Ca3
	r
X-Google-Smtp-Source: AGHT+IG6StWqjpAO8DYedOrCCnEILK72ffLHyWgeM9Uz/5/G68jTWsMGvKh3D3LSCUH1wOiNDrZUFg==
X-Received: by 2002:a17:906:6a1d:b0:a9a:4f78:b8 with SMTP id a640c23a62f3a-a9de5c922c6mr748802166b.2.1730130603202;
        Mon, 28 Oct 2024 08:50:03 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/14] x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
Date: Mon, 28 Oct 2024 15:49:22 +0000
Message-ID: <20241028154932.6797-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/i387.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 375a8274f632..a571bcb23c91 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -306,8 +306,10 @@ int vcpu_init_fpu(struct vcpu *v)
 
 void vcpu_reset_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area = vcpu_map_xsave_area(v);
+
     v->fpu_initialised = false;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .fpu_sse = {
             .mxcsr = MXCSR_DEFAULT,
             .fcw = FCW_RESET,
@@ -315,15 +317,21 @@ void vcpu_reset_fpu(struct vcpu *v)
         },
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
+
+    vcpu_unmap_xsave_area(v, xsave_area);
 }
 
 void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
+    struct xsave_struct *xsave_area = vcpu_map_xsave_area(v);
+
     v->fpu_initialised = true;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
     };
+
+    vcpu_unmap_xsave_area(v, xsave_area);
 }
 
 /* Free FPU's context save area */
-- 
2.47.0


