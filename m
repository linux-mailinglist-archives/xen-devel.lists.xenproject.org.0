Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4DA5D024
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908983.1316092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kF-0000vl-M1; Tue, 11 Mar 2025 19:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908983.1316092; Tue, 11 Mar 2025 19:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kF-0000lC-E4; Tue, 11 Mar 2025 19:58:31 +0000
Received: by outflank-mailman (input) for mailman id 908983;
 Tue, 11 Mar 2025 19:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kD-0007Uu-Jt
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:29 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd56c7b-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:23 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2feae794508so8962715a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:23 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:21 -0700 (PDT)
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
X-Inumbo-ID: 2fd56c7b-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723102; x=1742327902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=JWxnxbYcPjz/Z68peTnRDKwzZo1lExFgxMYf7eC2/2RfEiQKTS00Om9Ml/ZwNd0BTg
         oYsq9wuzAHQTmurDr6fOGseYtvFWvCtvh8fLwekIGZ7Z4F9d8fAct0RtnxjgeyN1CunZ
         nRSzB6ByKD8g86J8VfxHHdpjd1XIliu7Qa1K7bq477/yZvTFrjwam9QWbd0n2pvKAA1l
         oCl3/jJAx7/6t0kvCFF9Z+wM+363EVt+2y8ZDmiITyg6YbHT2M0aws1JhmeTfaWXlUH+
         1aAgrpTvcrXIafnYtKhCjf2Z0Epsm3EFnvt/jL7MDZf/kXwOhTn9BOkaYfCxTJQk6pXA
         KhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723102; x=1742327902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=KC71ZJg6zFJ7IjA0psBs0U3dJMsn+k8kfF3vRPoe5ozZ6WK1klHXi++L+0dXBcGK3r
         n/CwQEkLT7zmmcXSWPm14VqpqbIiAiYc3R8/olJDGn2rKz5+eVh9lXtQePCzz+iQfi37
         b+jgxe5/+hPU0YVgOaCmHJJnhc+xDMXGNDaN4u1S3APni5H+0EHG5koBXi0/wQnSy7tC
         UXp78e1YghLJcPUGXMnmcdukj2B0HmJWXSijHdIZms2qFzlw5GN995roGBCV5stHAfkv
         jU0D62Frr02ApeEvZHYoVqRVnBdTDRbPKsdSsG+nS7vSaEuzwG5s28TRh9+ezmZ/kmuY
         rAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUGLY8IWXFok/Pto1qg/YN5lZX2JBWfGZDtlSLYhI8w99UaFN0JFDoeXgd3P2+FVVgCRDtYXoO6W7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM9HaoPhQcubaIxs1rlxOf+9vl2bo7wET0v6UTt75ZwSpr1QHi
	T/ScdBxOIVTq1ocYxhwbxh2CyHdUmbdbpyZsM2WwyXw3Ez4evTVZ0yD1IqEt8Ew=
X-Gm-Gg: ASbGncv556S6+diyH7YakDmrH05VJRedrh0VWhH+LHcpAnDzdKJLE1CNuLOAxzAhckd
	PpiAu5Pha3ahq1KWzvNIF90fXK3KU8ABGLQjFnw9GDJs7GV4VWhfIFiKJUOhu/Kiigi1sMOszBg
	SP1AR9ryjpHVU99tOZHyOFfhgAOqemyE0Ks3KkMOb/LgG6+x6PmExBhfH7PMcJ7nK9T3a3RpBkv
	6LDURm4Cgz21sJ5M4K5JXuUO0hvA8lp2O+vmEkEJmn0dKcW/3vACVuLVGvFc1CSB+gGYYHPhGqE
	8K2tLp+6StWqvrLMFTy9ETPfSG6Ap8AYOrKJU3eRvkIt
X-Google-Smtp-Source: AGHT+IFuSUSQsgKDn+cb31pnjdNEblE2NjRflSuEeU68kg8s8JFfsQQJsGkDTEhj0ycbJp3/pjIRHA==
X-Received: by 2002:a05:6a20:6f90:b0:1f3:397d:86f1 with SMTP id adf61e73a8af0-1f544afa185mr29488018637.16.1741723102158;
        Tue, 11 Mar 2025 12:58:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Tue, 11 Mar 2025 12:57:56 -0700
Message-Id: <20250311195803.4115788-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is used by system/physmem.c will be turn into common code
in next commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index ab17c09a551..21da3b8b052 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -210,11 +210,11 @@ bool kvm_arm_supports_user_irq(void);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu.h"
-
 void kvm_flush_coalesced_mmio_buffer(void);
 
+#ifdef COMPILING_PER_TARGET
+#include "cpu.h"
+
 /**
  * kvm_update_guest_debug(): ensure KVM debug structures updated
  * @cs: the CPUState for this cpu
-- 
2.39.5


