Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1ECA091E9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869511.1280966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4a-0001lw-TB; Fri, 10 Jan 2025 13:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869511.1280966; Fri, 10 Jan 2025 13:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4a-0001ii-PH; Fri, 10 Jan 2025 13:29:12 +0000
Received: by outflank-mailman (input) for mailman id 869511;
 Fri, 10 Jan 2025 13:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4Y-0001QR-RH
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:10 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe7a059-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:10 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so2537670a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:10 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:09 -0800 (PST)
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
X-Inumbo-ID: dfe7a059-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515749; x=1737120549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O7gLemGUf6JN5FF2lKFWWHjDWg3G1VdwWkZcZUgbRo=;
        b=H+3rDaSRoJ9qfFjKCevTO9Db2au3aLeL3PSMeJGGENCB2svThvFz6H77i906SZF1tj
         flMU2CvdS1XcpQb0sWnu5TQSZDXblQRMMdb1Cn650KEGkda9GsuoPGqVdYQx6ZRRb0mp
         Eck0ivjrA9CJRFAOIC9LpKYtX+PIEmGw/eY8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515749; x=1737120549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O7gLemGUf6JN5FF2lKFWWHjDWg3G1VdwWkZcZUgbRo=;
        b=DOLvvUVE7w+qJa2HJCgrHnB7PchQ8003xmaU93EZeOD6ydJCIO6SCVBana7n9BRvaY
         9uFnZ/Bolisb0G+aIDXdNfY+1faJH645xLx43+GyIv36fhTyAXqNfL/rOoKlQTAlaw5B
         AD5dmREDpLZP1t0P9LHWjT1J6VN6eWij7hM9nfzsOJTqYW+UH4b52T6jfxPWmZ/vzElQ
         K3JDyiRGgieUtFtIkpxV+5PMbnMf5SoN51fu/KTvY8063t/ilsRfoWOacIwqM5m5aV6R
         UCdv4FCknliuNcxNEjMwa9W3n1gxbFYtb6517Rp4j99/XnZ3aqvf6tXnDcYaChtifJ7C
         UTBw==
X-Gm-Message-State: AOJu0Yyadct4GtAKXBF/i66+vxI5pvgo2UVdfkYvjTiqTb0cCzOAKTTl
	NCLinBwqFdBrvlczabjY0NkuVbu0BYHy7fwYSiWU06AD4r2mkH/R1VDqCMV9iT/zJN+aUbw72+l
	qaCaVEA==
X-Gm-Gg: ASbGncupgDhCzJvAWLqJ7oPTlBL5bk4hMHGnb9KHRwkylvdq49+ZlFhnEK8rn0Wzu3k
	srl7GRwowqQfuyLGUK+XId3j9dZB5NL6dcDJIUjvCQEA1cR6lLGWpviExqIv9tALQQyHvUporEj
	hC0ybO9MURVDZLPtFvfY5OPxMBCS+3x8/mHHlDQLhVMhkPSSea0iJuYZnxoMyiw1k4XjQhFUUis
	ZVU22YlOBdezuvYnXpWeC5Z0/MVsMzQyBTa6Vxf8oe7QaS9QlyRHAyJELA3Oz60cVK271Y6FdM7
	aew=
X-Google-Smtp-Source: AGHT+IFDwVTKHs3K2kJcgyqa3q8O7JLMmDZootiHiSvxM+9IOV5nU8oJOp9UKXOkmTk4hp/wvl9+qw==
X-Received: by 2002:a05:6402:5243:b0:5d9:b84:a01f with SMTP id 4fb4d7f45d1cf-5d972e169a3mr10438762a12.18.1736515749503;
        Fri, 10 Jan 2025 05:29:09 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 03/12] x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
Date: Fri, 10 Jan 2025 13:28:14 +0000
Message-ID: <20250110132823.24348-4-alejandro.vallejo@cloud.com>
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
 xen/arch/x86/i387.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 8fba0aef4284..5429531ddd5f 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -304,24 +304,32 @@ int vcpu_init_fpu(struct vcpu *v)
 
 void vcpu_reset_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     v->fpu_initialised = false;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
 
     /* Old gcc doesn't permit these to be part of the initializer. */
-    v->arch.xsave_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
-    v->arch.xsave_area->fpu_sse.fcw = FCW_RESET;
-    v->arch.xsave_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
+    xsave_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
+    xsave_area->fpu_sse.fcw = FCW_RESET;
+    xsave_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
 void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     v->fpu_initialised = true;
-    *v->arch.xsave_area = (struct xsave_struct) {
+    *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
     };
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
 /* Free FPU's context save area */
-- 
2.47.1


