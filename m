Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506886FD39
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688227.1072184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XT-00035d-BO; Mon, 04 Mar 2024 09:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688227.1072184; Mon, 04 Mar 2024 09:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XT-00034A-6R; Mon, 04 Mar 2024 09:23:15 +0000
Received: by outflank-mailman (input) for mailman id 688227;
 Mon, 04 Mar 2024 09:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7cd=KK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rh4XR-0002pl-5e
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:23:13 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0de529d-da08-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 10:23:09 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so159549266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:23:10 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tj10-20020a170907c24a00b00a444526962asm4485529ejc.128.2024.03.04.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 01:23:08 -0800 (PST)
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
X-Inumbo-ID: d0de529d-da08-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709544189; x=1710148989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccAwOwOdhjjKU5vrkhjFv38qxkICvc3DaQURqNSfmho=;
        b=I5HAVRVbMOTNceOHmkEz6iBdl5UcJ+ywLU8ekcKVFjVwfasZqXA4BIJZzQdgl3tqAv
         4AbDg0eqMGbNsyMpSkwudeugNpJvQnkV2Do9lFsEPTYu/d+92CaFqQWzsSfE1tZl+XZQ
         JZ8OKqc3SRfMxXcZ4BzypRH0T2+fNHeRKxyeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544189; x=1710148989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccAwOwOdhjjKU5vrkhjFv38qxkICvc3DaQURqNSfmho=;
        b=sn/T6/KlKIRsWmzf2sTF6bcK3hEgygAG8mDj7LVnG6qiN3iqBsgNM9qGM09hDuqQDI
         pZIG3xRgOtL/2CkMgMu1n+A7T6SK/w7sWtP1WKz2ZQvlq11hkGAwpARQnFP9QYQFWVg3
         Uiy0tOLQzc4OtYtuvpWqGefyRcO2FDNOzqs9NR3cYMO81d0WNBU4ekLP6TjtJfhp7efB
         Lro1c6nMnS2Cny/zpsYf0zjzd9ycymlieQWKrd0V2yAWd6so6bhVLaHIBD8LAZl3DEYx
         JlctpKSOwabKzbTdaGIYXo7Xhs3DEZ4lhmW379YbOP1Z5UTU3qbCj9cHdtcTI3NJ3boJ
         xxig==
X-Gm-Message-State: AOJu0YzUu9y2JhXT8sfvqEzuGCwBrFs7FGVQWxBk/9lCxR5dBkMndYQH
	ZVnN5Bzpa2TQLHamT/9m74Y9GUaiSFhpc0LrkcC2/5bVPcfJ+UnmzlOpabPsMNcCMKTy9B2md2Q
	EXYM=
X-Google-Smtp-Source: AGHT+IFpVknCnBeGMT58GJNWesqTQw1OSRo9PDozkmsZZ3Qk9gRuJnRSh1A0qB4Ng6ODltK6luEauw==
X-Received: by 2002:a17:906:cd03:b0:a44:511d:630b with SMTP id oz3-20020a170906cd0300b00a44511d630bmr5560629ejb.24.1709544188840;
        Mon, 04 Mar 2024 01:23:08 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>,
	Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86: i387.c cleanup
Date: Mon,  4 Mar 2024 09:13:05 +0000
Message-ID: <20240304091307.2295344-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304091307.2295344-1-fouad.hilly@cloud.com>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

No functional change

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/i387.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index d824f2bb5294..7a4297cc921e 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -26,7 +26,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 
     ASSERT(v->arch.xsave_area);
     /*
-     * XCR0 normally represents what guest OS set. In case of Xen itself, 
+     * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
@@ -36,7 +36,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
     ASSERT(ok);
 }
 
-/* Restor x87 FPU, MMX, SSE and SSE2 state */
+/* Restore x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxrstor(struct vcpu *v)
 {
     const typeof(v->arch.xsave_area->fpu_sse) *fpu_ctxt = v->arch.fpu_ctxt;
@@ -307,7 +307,7 @@ void save_fpu_enable(void)
 int vcpu_init_fpu(struct vcpu *v)
 {
     int rc;
-    
+
     v->arch.fully_eager_fpu = opt_eager_fpu;
 
     if ( (rc = xstate_alloc_save_area(v)) != 0 )
-- 
2.42.0


