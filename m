Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA4A091EC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869513.1280982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4d-00029j-JK; Fri, 10 Jan 2025 13:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869513.1280982; Fri, 10 Jan 2025 13:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4d-00023B-EY; Fri, 10 Jan 2025 13:29:15 +0000
Received: by outflank-mailman (input) for mailman id 869513;
 Fri, 10 Jan 2025 13:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4b-0000vX-Te
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e125b8e4-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:12 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso3788211a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:12 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:11 -0800 (PST)
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
X-Inumbo-ID: e125b8e4-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515751; x=1737120551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUEO9205Bbujlvio/njapuGkmXsktum9lbTR3dku2CE=;
        b=hZO6ExnZGiX60aGYwqM1OiTBkheEI5vkDcgkTdmjcz2FHxsxCcbxIneG7x+hpcb/jE
         7kL0lqhfU+rXmG3HZWcR/2bPZeGGLv2NsKRt/ijloECBwZ2Ypaq2JjR129ULDQCSFko2
         cHuE7Qn6Ni5B/lHknoi5GpsrEWarlUozyBvKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515751; x=1737120551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUEO9205Bbujlvio/njapuGkmXsktum9lbTR3dku2CE=;
        b=XgIOfn98hPLq0Mpy/AZJILxpzQLsnCCJk3e1UlCgjKFfR8/d/xADfswc5yUwmLKQue
         HsZVS0LiYl8JFUpmVyH0uwp+00HrH7YGNOS47Cuoiaih8yMM8xWDBagVbUjDtwlo1qlu
         LG7HOKW8l/kngoxAfUJyub2kVO7WRH4bJ8a0XLdLQkHqN315FLcSMjV+wtzR6msoM0V3
         TPwhKZQXZ1PH3TlP+wCm5YN9blHkQcBpKtfdx0pN0JzH2zRDlr0SiBZrk+/oD2OOp4PW
         Eluqmw8HBP4VQU7FqqN3MoTL5mHYIuOOkMyjTivVyt1nwD75QZ//8B1Lb99Qj0pXx38K
         mvdg==
X-Gm-Message-State: AOJu0YxbHpuORyiPtSe9zs1NrCoF9bG0gsoR0h0ZyaP/lL0yUF2Uay8z
	F8iLInB2OvlMLdB927lklV6SvZXwqAC9GwCkfMjXkdUPhL/TXSWOuT+mQYau/QlOW0g+NSGqhsI
	+VUq6mg==
X-Gm-Gg: ASbGnctkcKa1r5ZNBqgXBeHEkijfuVgLzuLqYA8rATILSvxpPl/foqDCNvJyDLSKC+p
	ybbLj5HVmeE3+HDktJDNKh7vrTTvns4v94J0hb+2BvhBWIDH9KjT+4RVeqdyha6oVBSIsdLBkRL
	9T2AzDBqpjmcn3T7GfBDO1fsRRaNunB04PKaByG2dRwD2XIAktZDKRwWT4Uc3xkjfZy3b1FR7zx
	iGxYAzXruuk018D+e6DYFrECNKmu+2BRaXmFrlD/GcySShlbXq2jR0cOAj0ygXXEMwFZPlIAaFX
	njg=
X-Google-Smtp-Source: AGHT+IEoX1iZirm/9+11R/yAmKqYvTojFGbSSLXDzqpQe8R8iEbKo+oGFbWvaPWpr8T4NrAFe7KVoQ==
X-Received: by 2002:a05:6402:3506:b0:5d9:3118:d0b8 with SMTP id 4fb4d7f45d1cf-5d98a27dc65mr5164910a12.8.1736515751604;
        Fri, 10 Jan 2025 05:29:11 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 05/12] x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
Date: Fri, 10 Jan 2025 13:28:16 +0000
Message-ID: <20250110132823.24348-6-alejandro.vallejo@cloud.com>
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
  * style: Capitalized first letter of the fastpath comment
  * Added A-by

v1->v2:
  * Added comments highlighting fastpath for current
---
 xen/arch/x86/hvm/emulate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index a1935a174830..d5011612aff0 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2371,7 +2371,9 @@ static int cf_check hvmemul_get_fpu(
         alternative_vcall(hvm_funcs.fpu_dirty_intercept);
     else if ( type == X86EMUL_FPU_fpu )
     {
-        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
+        /* Has a fastpath for `current`, so there's no actual map */
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
+        /* Has a fastpath for `current`, so there's no actual map */
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
+        fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
         bool dval = aux->dval;
         int mode = hvm_guest_x86_mode(curr);
 
@@ -2467,6 +2473,8 @@ static void cf_check hvmemul_put_fpu(
 
         fpu_ctxt->fop = aux->op;
 
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
+
         /* Re-use backout code below. */
         backout = X86EMUL_FPU_fpu;
     }
-- 
2.47.1


