Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587579BCF74
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830262.1245252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd6-0003gE-6m; Tue, 05 Nov 2024 14:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830262.1245252; Tue, 05 Nov 2024 14:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd6-0003d2-24; Tue, 05 Nov 2024 14:34:00 +0000
Received: by outflank-mailman (input) for mailman id 830262;
 Tue, 05 Nov 2024 14:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd3-0002K5-W3
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:57 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc92def0-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:33:55 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so5994362a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:55 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:53 -0800 (PST)
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
X-Inumbo-ID: fc92def0-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZjOTJkZWYwLTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjM1Ljg5NDEwMywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817235; x=1731422035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJwLbo7xtzRRC/VnQO4xXecso10EVyoDQfxpw8QvaGI=;
        b=Szbl2X6Sf3CZ+i/9NunmcRgJl7dOrZiIQG3VR2m9NbzB6Q9J8a9QUFK6MJqufMKKPh
         bgji8ssMnieAHstP/bHqP9i6eeRUDrOPjTATvAXhnxDjvZnoxZTv6KXJCTwRq+Briz67
         +tAf3dWs8Boy+2Xf++QEmD4GwKpjlO/izqRXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817235; x=1731422035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJwLbo7xtzRRC/VnQO4xXecso10EVyoDQfxpw8QvaGI=;
        b=QAC5disuorDut0ISeUznhscGMifL/jDVgg0gxzxhadYw9jwnDcq9s1KCuxQON8B90a
         1YuiV92uI/kfRp1E6sgud1b2eSbTqzxdtK13ZprQ1mG8THu789UwOkQ9xMyKEP9jFitf
         FkXSlVi47yorx1Dbf+/cw67Yj4FBhAr1W/A8/vx4l56PAItFyiS8tMjo2RXFj2gc6TGG
         4rO6x4GbAZlGDUu+1gM5DmE8UspZZYY5dzC55O7Mlm6Elky50lZDOuTfQAHsReZ1svos
         E1eQKQx9dsMBeAB5mA1lfVcPEBEJWPpsAOR1a0b9113xzJ2frbIHG9qwSCba9EChaGTA
         UGyA==
X-Gm-Message-State: AOJu0Yxvvbyis5FHDPwZcL+XNpGY60pv1Zas5Lujphe2DlEldjPvWDIo
	CzkplGee8Ht65Qs+dmZb/nhdcOkzVU77I1Wl0c6TAapyFWVdgDA27ZfuoU/7/YqCKzMmuzf7z7J
	t
X-Google-Smtp-Source: AGHT+IHTCf6ZJQX++QLf10O2tL6Cn7s9y8sERr+xKKzk+gTuFjlCqijQcrcnwHgB0hYuPj/Ra8bJzw==
X-Received: by 2002:a05:6402:1d56:b0:5ce:e067:27aa with SMTP id 4fb4d7f45d1cf-5cee0672877mr3491397a12.32.1730817234883;
        Tue, 05 Nov 2024 06:33:54 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/13] x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
Date: Tue,  5 Nov 2024 14:33:03 +0000
Message-ID: <20241105143310.28301-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Added comments highlighting fastpath for current
---
 xen/arch/x86/hvm/emulate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f2bc6967dfcb..04a3df420a59 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2371,7 +2371,9 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
+        /* has a fastpath for `current`, so there's no actual map */
+        const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
+        const fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
 
         /*
          * Latch current register state so that we can back out changes
@@ -2397,6 +2399,8 @@ static int cf_check hvmemul_get_fpu(
             else
                 ASSERT(fcw == fpu_ctxt->fcw);
         }
+
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
     }
 
     return X86EMUL_OKAY;
@@ -2411,7 +2415,9 @@ static void cf_check hvmemul_put_fpu(
 
     if ( aux )
     {
-        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
+        /* has a fastpath for `current`, so there's no actual map */
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
+        fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
@@ -2465,6 +2471,8 @@ static void cf_check hvmemul_put_fpu(
 
         fpu_ctxt->fop = aux->op;
 
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
+
         /* Re-use backout code below. */
         backout = X86EMUL_FPU_fpu;
     }
-- 
2.47.0


