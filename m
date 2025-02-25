Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A4A450CE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 00:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896073.1304748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3yT-0007eq-9l; Tue, 25 Feb 2025 23:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896073.1304748; Tue, 25 Feb 2025 23:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3yT-0007cI-5p; Tue, 25 Feb 2025 23:04:25 +0000
Received: by outflank-mailman (input) for mailman id 896073;
 Tue, 25 Feb 2025 23:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3yS-0007cC-2q
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 23:04:24 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e2c68f-f3cc-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 00:04:17 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f378498c9so6058062f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 15:04:17 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd866f0asm3704921f8f.12.2025.02.25.15.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 15:04:16 -0800 (PST)
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
X-Inumbo-ID: d6e2c68f-f3cc-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740524657; x=1741129457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MiVlEo35tFsBOaQXCM+yGEsP+MnNt6IKKaKpkCMvjN0=;
        b=lrC9RauDhjDic+FhXykgjYy8Z/E9cdRID0jKRnl2/S2zub4NNuOiK7dN7zX+tt3njG
         tjmpDrrKZczijCSkyfVdLaiNOpXnC/Kv+VUZDvbGqUcty32eKsy7AyOtzJi/T+BpTe+F
         0QehbaSHYOC1u2jnU91ZPwNUSLeYQonCF2il0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740524657; x=1741129457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiVlEo35tFsBOaQXCM+yGEsP+MnNt6IKKaKpkCMvjN0=;
        b=iwPfJLdVSSkPESQsAa8v1L9hdTvWP8gR+RkJqVopj2QAsayy/COZqORU2HQZuh/i8V
         B+gJT51GwpFZT3l9U8eMPebh2SymRWqn06Mgv0e2ChYgUPfquGqwLtLKTgU0qWrM/8Kv
         rK/gLgYARFek8C3w35gfnuS+Qk8HKqrDLWTyJAxySulqoigR8MMvgeKE/vYEweDQTS5+
         +eL5qPXTPyFeur7guP+sBTKxgeZV0m4MBRJlzsNjlwxz0Z/bDH9JgBOaDZ6cIy2EfwzU
         g/zmaoAocySLxY6C0G+ztssqm3vTRRKQ2pze7J6H80UJZbhU2q6hQDqcmTU/VVKna54i
         zBNw==
X-Gm-Message-State: AOJu0Yy/wdBVR6+oXnzZiKHf5s+nVbMzwLcJBBBLa9txR1EN4pg1ffhX
	X2veF3B6+3f8akqbwxvfohJBHAl8K2oEIeCV2SkRdDsG/Tx/kYWS/lTrkWFjICThfTs/EP5Vcqj
	R
X-Gm-Gg: ASbGncv+B1QASAZNzIWhDjDMwx8JG023aByFUiQEv2XZC9B1ZFzZ3lwGR05xhWIbL2z
	g135h8/Z0wRwX7SBwbDHtft7iVt1lqqc6rOAhqzO9MUIaDpWrufEQ38tUO66wvmspLo/uoxcqzo
	Vr3WjM54ZvUcpag6UZRrBVPdNNYFoCNCQSpuoYXmoIsZd9lLheyqwSTzvIhE/rMN5l/KV2l/iLR
	nrimeuWlUnyBeMirnNH7hPjvkkqOm17Nz7AAIJIpNSdChDf/EMq+aod4oOWo6fKK9d2I4mCNtXP
	PxiMvixHVjng4lmPVT3p0aqgxjKitoDrEgiLu7d9jiiKrFOV5xSswzm7f2ocTOCM1VgGJmTfQ09
	XT8h7Bw==
X-Google-Smtp-Source: AGHT+IEifWEstIv/+b7clY/Buq2JSUyl9RnPvSKkVUuCCmdpoGAy29yhO/3/xw5gwgs00UEQoUF+qg==
X-Received: by 2002:a5d:6d07:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-390cc6040d2mr4711322f8f.17.1740524656889;
        Tue, 25 Feb 2025 15:04:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
Date: Tue, 25 Feb 2025 23:02:13 +0000
Message-Id: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
pointer chase through memory and a technicality of the C type system to work
around the fact that get_hvm_registers() strictly requires a mutable pointer.

For anyone interested, this is one reason why C cannot optimise any reads
across sequence points, even for a function purporting to take a const object.

Anyway, have the function correctly state that it needs a mutable vcpu.  All
callers have a mutable vCPU to hand, and it removes the runtime pointer chase
in x86.

Make one style adjustment in ARM while adjusting the parameter type.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

RISC-V and PPC don't have this helper yet, not even in stub form.

I expect there will be one objection to this patch.  Since the last time we
fought over this, speculative vulnerabilities have demonstrated how dangerous
pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
not reasonable for Eclair to be able to spot and reject it.
---
 xen/arch/arm/include/asm/domain.h | 2 +-
 xen/arch/arm/traps.c              | 3 ++-
 xen/arch/x86/include/asm/domain.h | 2 +-
 xen/arch/x86/x86_64/traps.c       | 4 ++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48df..50b6a4b00982 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -243,7 +243,7 @@ struct arch_vcpu
 
 }  __cacheline_aligned;
 
-void vcpu_show_registers(const struct vcpu *v);
+void vcpu_show_registers(struct vcpu *v);
 void vcpu_switch_to_aarch64_mode(struct vcpu *v);
 
 /*
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 737f4d65e324..665b17813acb 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -969,9 +969,10 @@ void show_registers(const struct cpu_user_regs *regs)
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
 
-void vcpu_show_registers(const struct vcpu *v)
+void vcpu_show_registers(struct vcpu *v)
 {
     struct reg_ctxt ctxt;
+
     ctxt.sctlr_el1 = v->arch.sctlr;
     ctxt.tcr_el1 = v->arch.ttbcr;
     ctxt.ttbr0_el1 = v->arch.ttbr0;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c..5fc1d1e5d01a 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -688,7 +688,7 @@ bool update_secondary_system_time(struct vcpu *v,
 void force_update_secondary_system_time(struct vcpu *v,
                                         struct vcpu_time_info *map);
 
-void vcpu_show_registers(const struct vcpu *v);
+void vcpu_show_registers(struct vcpu *v);
 
 static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
 {
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 02fdb3637d09..22d4db240b95 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -170,7 +170,7 @@ void show_registers(const struct cpu_user_regs *regs)
     }
 }
 
-void vcpu_show_registers(const struct vcpu *v)
+void vcpu_show_registers(struct vcpu *v)
 {
     const struct cpu_user_regs *regs = &v->arch.user_regs;
     struct cpu_user_regs aux_regs;
@@ -180,7 +180,7 @@ void vcpu_show_registers(const struct vcpu *v)
     if ( is_hvm_vcpu(v) )
     {
         aux_regs = *regs;
-        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);
+        get_hvm_registers(v, &aux_regs, crs);
         regs = &aux_regs;
         context = CTXT_hvm_guest;
     }
-- 
2.39.5


