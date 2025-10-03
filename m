Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FDBB859A
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136892.1473354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oes-0005xK-Bl; Fri, 03 Oct 2025 22:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136892.1473354; Fri, 03 Oct 2025 22:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oes-0005sE-75; Fri, 03 Oct 2025 22:53:50 +0000
Received: by outflank-mailman (input) for mailman id 1136892;
 Fri, 03 Oct 2025 22:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oeq-0004mK-P3
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:48 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1e9e9b5-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:47 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so1487958f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:47 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:45 -0700 (PDT)
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
X-Inumbo-ID: d1e9e9b5-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532026; x=1760136826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU50b2CIr8z+rKB8yhDMf5NI7QoTTkkJ3hl1yF+jo5w=;
        b=AtVI7h+KoCgniDsNAy29u6TWQqOYGYzD20lBHSAz3fAw5Nk5X0+fY5SKUhL3tThysm
         gAmu9sVNy8zAGcDjC/VT/+yuRP97hehZM/qlgF3tyMmI6WNtOQQziEw6KEt/e1jWmh7A
         ZqulECobhXbvdr6C/YWfyPSyssOhbuoQJOWq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532026; x=1760136826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uU50b2CIr8z+rKB8yhDMf5NI7QoTTkkJ3hl1yF+jo5w=;
        b=gaeMC1zFy2gZ4QoZFYHpEMUzZnvF2EB/NRQ2RvgF2ItGBoTFRZESRXDLvPBwY0RM2v
         HRAWGkbZd+7JFIz7/37tVESvpU3Sq8mwbB5lzNbiFgRcm9ICju5Kok5PUl/VlaNcXctN
         uYO7LcHoSPXvWm/6jm9PKoLdyJyGqw1viVHnGakNShzrjWDw82PnBBgVAkByHvyrG9VB
         NVn2Ab9MK9YMouJlfL8kOw+jr120p4psK0+rj8SlHBLRd9JgXiQYToQUxFKMM6MWNJCA
         TwuyLJbfvErG/FMexwxVWdeiAQqiB9ZIJ16XvaFt6CWq5Qtkgja0QK9f+z5MyheC60lW
         0ByQ==
X-Gm-Message-State: AOJu0YxriTDGUM0qjMdUDpTSdmZpATZZT/7BnIMxL2Tj1Wzdv/JbZ6U0
	EuKwIn3XUvpXjHy9NsyPzFQShZRRBx03E5tpKLpTs8/TauhasY1LEpEQziKwKiogHZUCVr+hhEo
	F7ylvkjz0To6R
X-Gm-Gg: ASbGncvPVbo/mU/UojrSTIVUWbOqiHWmEBqkEbg7UT0owgHkaGg84AKUEc3NP3/6xJh
	1oumuSOPC3LRKsCdKzLx/HIa03gZkQxctRZA1XMEPqGGm4cu8WV73858XDaBBqZpGBrsH9cDuwt
	oQykSbcJ4fZMIl/a1kKJH2jSaM98LRhXMGjFHRWgNx0WZiY7sXU+e3TIVR6UeB+UQXVpOvzRtnE
	R78QzvArMIGj3TWPE/AzQY0H4PITOgUGAzNNAdFCXgH8b81WSkRVp+lUeLvpJWmFLp+vW8sTRdx
	q7JpMuohYMdzNDKJVouXsfJKVkaqR6DWyeU9gKxfXnF4fZJV0xXH+DLKb0Ii6HL2UsvSsT0rCmP
	SDpaF3eJKwYtdNKNMR5WScZ7WLFVbKd5P/4GsRjeObUpQg8krFQsY277qE3MksXMxEjBRahHbqz
	EnUicxw9/w/Bu8DxOYeMoHw1+KIrjkINY=
X-Google-Smtp-Source: AGHT+IFNgesRO9KQE+1EDzFOyGemzxgi/B/Bn2ir1u8VhCJcvbxVt8SX2TtWZgCw44x7gKMh2wvVLQ==
X-Received: by 2002:a05:6000:40da:b0:3e0:c28a:abbb with SMTP id ffacd0b85a97d-42567158fccmr3269428f8f.13.1759532026367;
        Fri, 03 Oct 2025 15:53:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 05/22] x86/fsgsbase: Improve code generation in read_registers()
Date: Fri,  3 Oct 2025 23:53:17 +0100
Message-Id: <20251003225334.2123667-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It turns out that using the higher level helpers adjacent like this leads to
terrible code generation.  Due to -fno-strict-alising, the store into state->
invalidates the read_cr4() address calculation (which is really cpu_info->cr4
under the hood), meaning that it can't be hoisted.

As a result we get "locate the top of stack block, get cr4, and see if
FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.

Hoist the calculation manually, which results in two basic blocks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Side-by-side disassembly: https://termbin.com/9xfq
---
 xen/arch/x86/traps.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0c5393cb2166..545c42a10862 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -118,9 +118,18 @@ static void read_registers(struct extra_state *state)
     state->cr3 = read_cr3();
     state->cr4 = read_cr4();
 
-    state->fsb = read_fs_base();
-    state->gsb = read_gs_base();
-    state->gss = read_gs_shadow();
+    if ( state->cr4 & X86_CR4_FSGSBASE )
+    {
+        state->fsb = __rdfsbase();
+        state->gsb = __rdgsbase();
+        state->gss = __rdgs_shadow();
+    }
+    else
+    {
+        state->fsb = rdmsr(MSR_FS_BASE);
+        state->gsb = rdmsr(MSR_GS_BASE);
+        state->gss = rdmsr(MSR_SHADOW_GS_BASE);
+    }
 
     asm ( "mov %%ds, %0" : "=m" (state->ds) );
     asm ( "mov %%es, %0" : "=m" (state->es) );
-- 
2.39.5


