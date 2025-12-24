Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E6CDCE9F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192953.1512005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH3-0004EF-KL; Wed, 24 Dec 2025 17:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192953.1512005; Wed, 24 Dec 2025 17:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH3-00049E-Ew; Wed, 24 Dec 2025 17:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1192953;
 Wed, 24 Dec 2025 17:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH2-0003b7-If
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:44 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8054301f-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8052725de4so484933166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:43 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:41 -0800 (PST)
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
X-Inumbo-ID: 8054301f-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595822; x=1767200622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsMdYupDzApAqnlVn5Mcs/WEIvYP7U3Z1iGkgA4AkDY=;
        b=LxT+L1hnxXMUYl2UXND0Yuf2TQIt7iQtlqORZDFl2bzt0WMyM73E3+Uqfa5c0eMFAt
         bntnmVg2Xmzhzjj3Q+mYAJtNRd6hIapoXcNnKDbn4M2U4V1SXHeP9XTazGTe1h8HfjsA
         M68/j17SmoRhcPl2o17cR4dcuEd8gOLu4vKG6xgKC6Hdvui5xai11pPsGWX7i6LFVRdZ
         FqY6sedZ21VJqtALSbHvPclLYCqsTHvugd3I9lZgfuFHBYou/jNmJo6SAelhqFs5vfJY
         PPrLM0FehTK42KcHhfKIbeM6Gzz334fDPoalTJmGb8s2kXLgMJ6UxsuPoN666AHwcvQD
         7OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595822; x=1767200622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RsMdYupDzApAqnlVn5Mcs/WEIvYP7U3Z1iGkgA4AkDY=;
        b=R6Qg9ja1bcK5iQ6xsS8JZGRoy5yLsy9dwS9abjLnhcrFb9W3cWMMC+u/xiiLJLk7bg
         k0wIzUgp5dRUoE1WGXmvwrHq7oaa5yxs3zJM9Ncb0ruJwUwXeSfGpVl1hVQYtq8oa9VM
         LFIwtXxLXO8M5mtPx0QA2E6w3RLm9zBku/PU34DrVbXULEM1ZGOWbWhk9HZB99B4X5k0
         UcYrQfToxsd5u9VdvB6ohb84ywtavyw1q++gxxUhiajLZ3PaiHCV7cUfETMSdtl3mzFW
         CN+eP1rGUJD5KKhPYahVjUlg5zZsaNmaqu/sSVMXrndS946pvedht6IUKjtlh4RqS+I3
         /qNQ==
X-Gm-Message-State: AOJu0Yy/euLGjNUm8WudLJUB+hzPbmAD3gWpg3N0UWWQ/Sd1zye07WL2
	OeTYgKXa5+b9gij+8YgI32U2XlvrdcsIErQSa9APIENgVitubV6vWTSNa0jxhw==
X-Gm-Gg: AY/fxX7YFw1MjlYOvcp6RvyVfeeSy6XgmrvFTo1pGHI/6AoClv2tPYL54lK/HFVzJPQ
	Pch4NiuHlmLhDAkv/oYWjBbImZYla6AH8VIEUtBDtYG1oOEkDjHOQ9S1lsSDQS23+ffILHsKcq6
	F8oEfyYNVm5VqYARBnFVjOrkN1BLE4+GXfyheiQGO4Hp0ieLqxGrILpMCE+v5nEXRkM+WPC1ueL
	j/yFcwhj9CprztD/mNP1EXDxTGjWjUA9KZRGs261C+tAo39V7XQFmJO6myG7HNGS/4rzieFWnd5
	oCbBm9keyj/KXbIWhxAvUkg5j3bO6wOo/vBsVTIUs+ni2O7tyERYeRN2PWPVzptB2SpmKlJuexR
	nr+l2ged2GLOrRU3hKwFrJVpD67E8Mv6oFq6OpafJ2jhe/RCijacrSa6o7EKGwsULIModrjW9jT
	n7q0Rr2qFYL6wypdtRGkuWkc7L6AC5JV8J8JpwMSC+sXaxMMtQMLx8BXU=
X-Google-Smtp-Source: AGHT+IHhUMpUxd3Xsuvj4VpMElwnJhkzHeXZnV3OSkbjZoCKDj/+fCc9yIGuUZtowk1PFuuqdElJhQ==
X-Received: by 2002:a17:907:948d:b0:b7a:1bde:1224 with SMTP id a640c23a62f3a-b80371e921fmr1846678166b.65.1766595822095;
        Wed, 24 Dec 2025 09:03:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 06/15] xen/riscv: introduce vcpu_kick() implementation
Date: Wed, 24 Dec 2025 18:03:19 +0100
Message-ID: <b27b8bc4e03901b7f3184f2a041c74497eedbb02.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a RISC-V implementation of vcpu_kick(), which unblocks the target
vCPU and sends an event check IPI if the vCPU was running on another
processor. This mirrors the behavior of Arm and enables proper vCPU
wakeup handling on RISC-V.

Remove the stub implementation from stubs.c, as it is now provided by
arch/riscv/domain.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c | 14 ++++++++++++++
 xen/arch/riscv/stubs.c  |  5 -----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index dd3c237d163d..164ab14a5209 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -1,7 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cpumask.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
@@ -121,3 +123,15 @@ void arch_vcpu_destroy(struct vcpu *v)
 {
     free_xenheap_pages(v->arch.stack, STACK_ORDER);
 }
+
+void vcpu_kick(struct vcpu *v)
+{
+    bool running = v->is_running;
+
+    vcpu_unblock(v);
+    if ( running && v != current )
+    {
+        perfc_incr(vcpu_kick);
+        smp_send_event_check_mask(cpumask_of(v->processor));
+    }
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 6ebb5139de69..68ee859ca1a8 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -213,11 +213,6 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_kick(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


