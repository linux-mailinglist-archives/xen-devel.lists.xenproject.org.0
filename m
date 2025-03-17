Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0CA65CB3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917746.1322631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIP-0000E6-Hl; Mon, 17 Mar 2025 18:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917746.1322631; Mon, 17 Mar 2025 18:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIP-00009y-7h; Mon, 17 Mar 2025 18:34:41 +0000
Received: by outflank-mailman (input) for mailman id 917746;
 Mon, 17 Mar 2025 18:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIN-0006uj-Fx
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:39 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ab0f316-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:37 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-225df540edcso61414345ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:37 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:35 -0700 (PDT)
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
X-Inumbo-ID: 7ab0f316-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236476; x=1742841276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=csDciEVVSKkjB1deLTNlS7WgymgexcpHBIWmRcsdBAdiGh3Rdy0JFNmKi+VSvRInl8
         pmHKwDeeYzwMq38fGbwFjZ0eqWsXi4/UqnBZhKep+wBbjOgKySfeQITvRnMGJTMKIzTu
         Se60MNJPp0WCBZa4LN6KHU2NuQcyZCMKwF5BilSfM5Mtk1TaHeGCgsH9iCXyr5DHWp1Z
         YmduxqPG664074PVFXovR0UXQe/AhYZiXvTdtdsyhAS98Nc0QnovsfNU9B00kGEMSxgM
         Ks3hMB2AhCJN8IxuY4QJ7Ql/fz3PWXHbYOQU/5O41sMdUmmNTfK6Dl9Xcs19XUHYlIT3
         c20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236476; x=1742841276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=jI5oDMAUu6xWQ0DV/7wFmcPM/J84/nbaxRCKa5ZFYp265cTEk4sdfW4+LkR0rvJVZl
         TfrUDmr22K+V3uFVp+73ShuculGvfdGvVksj/ZcyxLR0KMl3Ba8+6FW6I34VZdw1hqCV
         XI9lUYKXehjnGZ/Cd5edSjt2kgZB+xppFSZmls5bTMt91YB2XYhlnFHc4apWhi8LrMlX
         tRSYVoI4bT1f21I2lVAbQS0x7sg8m4OAhlw3qK84dfPaZS+9XgKn9ageeferaZ8MaSrm
         SB8wepm3GgspHDaI+OaIK4oBrTy5gjhGze1ulsOZu5f0bVbfBSl79Ae2OvvzMEHDjfsA
         xiLA==
X-Forwarded-Encrypted: i=1; AJvYcCWNlbc4itPKr3ZoCebtqMVSol+IZBj8uoX6kt5aZSUVa2P20tOFMDHAYMkTocienFouPuKHUqSfcww=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp7NOlunBKKy97hhkwaCZIoDGJ016F7OBXqtEooCQo36zFKfy6
	PVSJnlLa3ujnqI/+plimJ6mnMLTZ1/g2uP+ac/pWSbL5sbJsP1hgspP1c94OVQ4=
X-Gm-Gg: ASbGncsopieuK9upLq/udyfhBS8MbrxTsnikuVIM4bAkpol7XxpaDRNzj+tvE2TAbLE
	fL27lrTbd+9cablRkPkcjVBO+I3dSQzIgUmkWgh3d5wBbW66QvjUgJhXj8g6fo1nRn/EJ6mvpQ8
	kkAxKy7whztO8Oq5lsAGHEUjDjh1P07TxYHIRIxKEq7bPWAXk+V9tSVWhXcnHNblVy/LXsvpp4a
	KRXnSp/P8LE9t093RxCR/PhnxGlPeyJA4HlC/B2DZylrUaOrbicakobauEfcRGq2tWMgJs1iPrQ
	z+KEXC/AnADvRqg6z1CWlJQyMZ/JNYjCgR/8ciBjNdS1
X-Google-Smtp-Source: AGHT+IFrc3E9fUAh+z3i68X6oJdtySmjNUcFSLSYjTurJl9vG25uO/0RkrUhFSmr8bwDc6/U+8pjrQ==
X-Received: by 2002:a05:6a00:3b8e:b0:736:b400:b58f with SMTP id d2e1a72fcca58-7375752916dmr715700b3a.0.1742236476193;
        Mon, 17 Mar 2025 11:34:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 10/18] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Mon, 17 Mar 2025 11:34:09 -0700
Message-Id: <20250317183417.285700-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


