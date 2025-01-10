Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE5A091EA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869509.1280957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4Y-0001V9-KR; Fri, 10 Jan 2025 13:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869509.1280957; Fri, 10 Jan 2025 13:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4Y-0001Rj-HK; Fri, 10 Jan 2025 13:29:10 +0000
Received: by outflank-mailman (input) for mailman id 869509;
 Fri, 10 Jan 2025 13:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4X-0001QR-3K
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:09 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de97cd0e-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:08 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so3927428a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:08 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:05 -0800 (PST)
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
X-Inumbo-ID: de97cd0e-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515747; x=1737120547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S28ujRidgdqsUo8KctrJ2mFUS3eNRL5DEkXV5XiQbS4=;
        b=QKaeRnlOYPQCiNTgTugLWYvK8SKLLF7nOu+ApIO6eKY1hjVV7CxmMTGOV8rmT/4RQg
         VAhoeK/uM94PIIsw8XxTCiH6t/bxmCmqjP3Bifxe3EdoR1pUFf3wTrH8GGjCAMkb2m+r
         U2NdnL3G2YzvaCQBiqiohu7oBB417DmTNzCxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515747; x=1737120547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28ujRidgdqsUo8KctrJ2mFUS3eNRL5DEkXV5XiQbS4=;
        b=mVNFu+M0063MCVDYq5IsIVsPP5TLqPOBD+m2+5sMBYXMQRprr7NOLIzXwQ9hPFXfW8
         ZdunpgESmgyit53PhK68dQ4dvJFPvfdHrxK9Z6MzhVdhAA+clerCnHrEJq/I6SGOmjZc
         BItYaITYhOy4vnntvSevM13cGRUa8IJhOu3CBZ5/8rxwHkRkrfCRNqLK3d9my1A+ZOCa
         11pUROiEOceU6r38iON2cbaDC5pghB7AIdQx3PUA+QVAqWQT31KlQClGd9GVUGrjPZYy
         o5aGXFt05/2y7sGjyHD8+b5nV523CIvFvstwh3Zim30r9zz7ar6ZWSdeJel7zW0ML/as
         3Tmg==
X-Gm-Message-State: AOJu0YyZw/WL4CxeGZTPcqx+RFq5Wksc76ck7kgbIEayA55YU3hydaeV
	4RXdAXNd5k3IoOOjxK4kYiRr5T+xn98JTlOF1OtB4co1k0Hq+nxKiMgmm/L8093WHD+omJZNpPd
	2uH66jA==
X-Gm-Gg: ASbGncvm7lks88ic0Ku5iC+j3+XC/5Kfx0cwPGsJn/u09glFAh1tS3L26gQGK4KO6HR
	YIvI2mjoSuDH3p4yBikhMDAIRTmmBXMUlos2t+9eyVN+yyxFUnqewAEAzDerLjCyAPk4OsThybv
	NqIKpVhE5FAPcKgwvhqmNSrc20BlkaxeKE+5bpb0NMKOST+I9yuwzmjvR8U05CrQrigm7K7UMfK
	RVYORzMEQkbUDPWfPTbqddvEtPqKYr9Lf1v+G3TRHT7K+UAp6o8P6GOkLd3ZxRQjFiGRMKPkdHa
	gy4=
X-Google-Smtp-Source: AGHT+IHo0flgxzQJnpbc2JNOLtTwppT7VEX9vUmyga15KAzYVXXS0m2eQk3iDaRnwtsq76u6Qp3rQw==
X-Received: by 2002:a05:6402:194e:b0:5d8:211a:4d59 with SMTP id 4fb4d7f45d1cf-5d972e178e1mr10632908a12.19.1736515745814;
        Fri, 10 Jan 2025 05:29:05 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 02/12] x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
Date: Fri, 10 Jan 2025 13:28:13 +0000
Message-ID: <20250110132823.24348-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2->v3:
  * Added A-by

v1->v2:
  * No change
---
 xen/arch/x86/hvm/hvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 922c9b3af64d..884b2b9d32cd 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -914,11 +914,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) !=
-                     sizeof(v->arch.xsave_area->fpu_sse));
-        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
-               sizeof(ctxt.fpu_regs));
+        const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
+        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
+        memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
+        VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
-- 
2.47.1


