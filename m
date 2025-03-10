Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65EA58C33
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905966.1313472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqt-0002Em-36; Mon, 10 Mar 2025 06:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905966.1313472; Mon, 10 Mar 2025 06:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqs-00024e-Mn; Mon, 10 Mar 2025 06:43:02 +0000
Received: by outflank-mailman (input) for mailman id 905966;
 Mon, 10 Mar 2025 04:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEH-000735-2o
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:05 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6361bf9c-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:04 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-225477548e1so20296055ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:04 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:02 -0700 (PDT)
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
X-Inumbo-ID: 6361bf9c-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582743; x=1742187543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTI1e75Far6tkvgIJWf413Q47HXvE/J/3XXxjgsh6yQ=;
        b=UwdO3/DlArvPrTbp7cCirMYVd/il1H7IPdcFWlxtSXqc2kgHQa9CW5UivbcyQagELN
         Y5Hm/s7op8lqFSym1LmYVnZUiotjLgHSC4rfTmzu+yYa/gDVFd1NMSU44lOX64Npg8e3
         ziOjlQ+Y6hyD6xAp5OvC1ptab3Ep+Vx0NclWK7ReGVGpmKEwxr8Sx0RY+lOtkUSbMzja
         gF7n5wHWCZisHu298rs8eBL7fezC1HyMnezZlH/0o3xwm+kk8V2/P8qix8EwbcOIqYki
         IZwYi+qQezBNT71Qj9AEAmTnWvlsfdNCPUFSp+xVPCiZR+6N70DO2lE8BS1dRDehLjj2
         N70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582743; x=1742187543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTI1e75Far6tkvgIJWf413Q47HXvE/J/3XXxjgsh6yQ=;
        b=vBpbyJr2AybVZHtSTSCj6b1r/qw3oOV6YYkhh863mN0vDCb54MFyLxO+gj+O2KumMm
         t5TF0UYG5xG6Cv7uU4LFI0V4heerANKqF48s9KSKgT2GHyZf306I7NIm+7mZDT7+JtKD
         l1gBNsCD0hCiqAz/aaknpfi3H1WWGRQ+1U47OolQFfUaigqOKIiJjEPcNVjhz6zDYd9f
         lsZGGTH7YTfB3Tyrr13S7Gjsmk6HTWKmG/4rJdYIt51b9n8IRYWncnnjrB/EgZ4khK9u
         4B/JvZczgeLwo9vUX3F+p/3h64BkM/65OyRjFJGrv8hCZZk+AvamsN74pJwpt0UE4O3q
         aajQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPHgsZ/RYNMcvulqpEE5U1aHuacpU8Ky/hKXPP3WZxvn79tMOpNYYlQRRaZ7WN82qHjPY5MsAImNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrYy7ntWdrn/K+ZZlUx/Oal2m7CLd0MBUx6lmcMdEOf+yWDlrp
	b9YZmN/Yxxqdnly2VHr/NPOOUoUb/4r1JoO0OnL2aCzH9ih2zFj4+aQ15aS251c=
X-Gm-Gg: ASbGncsUw2WOOGW5etwiOOeLyAId5oQFMD22gFRKCjZ+2oJVqGsYCAlvSdbWt9+ZvQf
	aLO4WyD//CtqcYm+89MS+56GjeuBZ9w3ZzDkTIjXcOI8ZhRPTtF6DApRUDiHmHIOEApiKDhWbTR
	YIDU7yDEa8gWQTVSV1fRpm9l0nIqcIJuD/7n9BdjYShGKvxHV7EnvxUreaEkN2nKJal2mNMN0Bw
	ybor2pdUsUmazFr5EOU+t9nDoWCKoy7tienikeMBmH3N9InjzsjAelAVeLigxM2vIbkLJ52Yyol
	i8FCZ9jPc0UeTMP5Dl5K67RabCkrKpyMtQEzx6R1eMx5
X-Google-Smtp-Source: AGHT+IEJmFw/36nK1SG72X+BhxhrmIBbQ3tB+znRJTwS+V3kz822OtyZYcKaYIi+o8+TLN45WlwkAA==
X-Received: by 2002:a17:903:32c5:b0:224:3c9:19ae with SMTP id d9443c01a7336-22428c07361mr200227865ad.34.1741582743213;
        Sun, 09 Mar 2025 21:59:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/16] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Sun,  9 Mar 2025 21:58:37 -0700
Message-Id: <20250310045842.2650784-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is used by system/physmem.c will be turn into common code
in next commit.

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


