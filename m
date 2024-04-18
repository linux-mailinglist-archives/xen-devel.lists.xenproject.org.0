Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC48A9F23
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708495.1107470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU4H-0004fj-8i; Thu, 18 Apr 2024 15:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708495.1107470; Thu, 18 Apr 2024 15:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU4H-0004dd-5N; Thu, 18 Apr 2024 15:52:57 +0000
Received: by outflank-mailman (input) for mailman id 708495;
 Thu, 18 Apr 2024 15:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0X1s=LX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxU4G-0004M8-1y
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:52:56 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b78489aa-fd9b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 17:52:54 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-78f05035f56so70111285a.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:52:54 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 wi10-20020a05620a570a00b0078ee7bad7a2sm749561qkn.3.2024.04.18.08.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:52:51 -0700 (PDT)
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
X-Inumbo-ID: b78489aa-fd9b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713455572; x=1714060372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3jZy3odbL5XV50iWWQ1nW/SD6X8ck0zK9SiJgWp6PY=;
        b=qne6XbngJ4HmKQyJT1sJG/j/uQMFagJUXpQ4XXYHScnYGke443vU86H1cYYBNFKfRD
         UUj4FMxX+cn2gsgYTkls+gB/QmThbTPSp677NQhTSImIZE7jPTtAzxAWpJZxJ3fF1Wx1
         zmK315t9Mh4WMOAa/WPv7n/ZjOvryYWNbosb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455572; x=1714060372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3jZy3odbL5XV50iWWQ1nW/SD6X8ck0zK9SiJgWp6PY=;
        b=bPV1gQdmatm4vRn3mQu9dTGfSqL1r6hvHzkz7NR5SEfWUlCStoAZLb37X8VViNE/Jn
         xSX+61F9wkReGupPq+WY0usmo1kpg9+bUxKF04iNW6Wb97Zb7dpM12t7zKgv42VWk70Z
         qcQknT9Sv01HwJSpxFmUbF1lyUBRu0UtJB3YLKhmJI23UiGdyv43gHEgM+SsndA2A7jc
         vsKBwr0M7k5Eqkv95CUv0EPFsN4Wh0vijWEutH9aLzTsQpIyYhhvvBd30Ezq6Qf5bIGv
         MPMgrqQxJ37fG2DKZmFdPL2DUoFsGxCt67J6grHelEhUjmkqu7Ns05aTAgYjdAbympti
         /+LQ==
X-Gm-Message-State: AOJu0YzSNvCtk0c/9337m/Dqq5Bavq36qDPNpvsyHWUNVOeoznzTdi/h
	1+KdMp6eVn8O86posmU76a/Swsmn9o/zhChWT+ifRGDP1c17dThP4ulITRUJcLGOvP+4tZ4moxT
	D
X-Google-Smtp-Source: AGHT+IFt+5sMhOV5t6bXh3DcsrzXm18hsIx2IWjfj7kGmbQncwkVUUI3FbcXh+QGdAhVLLNBni2+cA==
X-Received: by 2002:a05:620a:4155:b0:789:e7a0:7148 with SMTP id k21-20020a05620a415500b00789e7a07148mr3956197qko.7.1713455572295;
        Thu, 18 Apr 2024 08:52:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] x86/spec: adjust logic to logic that elides lfence
Date: Thu, 18 Apr 2024 17:52:08 +0200
Message-ID: <20240418155208.7771-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418155208.7771-1-roger.pau@citrix.com>
References: <20240418155208.7771-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's currently too restrictive by just checking whether there's a BHB clearing
sequence selected.  It should instead check whether BHB clearing is used on
entry from PV or HVM specifically.

Switch to use opt_bhb_entry_{pv,hvm} instead, and then remove cpu_has_bhb_seq
since it no longer has any users.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 954c983abcee ('x86/spec-ctrl: Software BHB-clearing sequences')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.

There (possibly) still a bit of overhead for dom0 if BHB clearing is not used
for dom0, as Xen would still add the lfence if domUs require it.
---
 xen/arch/x86/include/asm/cpufeature.h | 3 ---
 xen/arch/x86/spec_ctrl.c              | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 743f11f98940..9bc553681f4a 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -235,9 +235,6 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
 #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
 
-#define cpu_has_bhb_seq        (boot_cpu_has(X86_SPEC_BHB_TSX) ||       \
-                                boot_cpu_has(X86_SPEC_BHB_LOOPS))
-
 enum _cache_type {
     CACHE_TYPE_NULL = 0,
     CACHE_TYPE_DATA = 1,
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1e831c1c108e..40f6ae017010 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -2328,7 +2328,7 @@ void __init init_speculation_mitigations(void)
          * unconditional WRMSR.  If we do have it, or we're not using any
          * prior conditional block, then it's safe to drop the LFENCE.
          */
-        if ( !cpu_has_bhb_seq &&
+        if ( !opt_bhb_entry_pv &&
              (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
               !boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)) )
             setup_force_cpu_cap(X86_SPEC_NO_LFENCE_ENTRY_PV);
@@ -2344,7 +2344,7 @@ void __init init_speculation_mitigations(void)
          * active in the block that is skipped when interrupting guest
          * context, then it's safe to drop the LFENCE.
          */
-        if ( !cpu_has_bhb_seq &&
+        if ( !opt_bhb_entry_pv &&
              (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
               (!boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) &&
                !boot_cpu_has(X86_FEATURE_SC_RSB_PV))) )
@@ -2356,7 +2356,7 @@ void __init init_speculation_mitigations(void)
          * A BHB sequence, if used, is the only conditional action, so if we
          * don't have it, we don't need the safety LFENCE.
          */
-        if ( !cpu_has_bhb_seq )
+        if ( !opt_bhb_entry_hvm )
             setup_force_cpu_cap(X86_SPEC_NO_LFENCE_ENTRY_VMX);
     }
 
-- 
2.44.0


