Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC2A5B7C3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907019.1314354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvY-0001iU-Ck; Tue, 11 Mar 2025 04:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907019.1314354; Tue, 11 Mar 2025 04:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvY-0001eu-4x; Tue, 11 Mar 2025 04:09:12 +0000
Received: by outflank-mailman (input) for mailman id 907019;
 Tue, 11 Mar 2025 04:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvW-0000fJ-72
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:10 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94ba1b05-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:09 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso23111055ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:08 -0700 (PDT)
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
X-Inumbo-ID: 94ba1b05-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666148; x=1742270948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=l9OL+HSsU20FBz6Rn+inDNzpv7yBRsst2fq1x6gPUv2lonFCNnmadQObLUFsNBP4E9
         4+vDgwYL1PC86BlPawV1hY7T2C5MLZ6p+jY+Kck9LsL5t59b9bwHCJRo2CB64/WlRCDo
         KIylmdgHX6MhhxkQv9l5Xfomx+45hdpqIdZQ23lBr+0S5eQzyGbsFl5eOi7U35iEz8a/
         HW8gkRZwDE3M0T/J/Zi0WxBQEBGeSspwHbLfoIX6E0zPdxF9hsYBoBUJ0ISLFIO5Wf7v
         V7/Rlv1mj96fiUGKKyg8WCbX0UZ6nvEYXQADJoD8tGDFvOysPw5ZA3MhJJydfQAA2+Yd
         vU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666148; x=1742270948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=eRP0f+zmPJVL1O86BW+LiDv7Ed7dvJ5z11tsAb8oMq1wwAQyjicIepVETKH62LGIgH
         ZATWu+8yCrgLFX8Soo/SBG2BvxkVtu6xgE4rMMLrxJhYw8FvQtI+tzmZdUa+ssrmemYT
         kLaDGc+rX7BdqLhcJZc/hrMxFupaksFcje9c1P/VMllppGf2e87PMlXHoCTQUCxdQUid
         2umFEr/1IBSwFnRjC8pSMRKlsy8OdUdhwHwqpFWZZDG93TSIrp/4UG6wBaJseKzkQhIb
         MnI4MQpt8zN0yNzzVc24r1cIW3HAu8A1Ut22ML9BErq5SiVbNCg7OSV16rIuNEhWYHY+
         MtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTyq2WOHoPQcFbaIEYDNf33l5RMOmj1okYMXo6+G/drM3tA2+o6OkHTHcr9HRZtZhTlQHaiHpgZLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr3P1jaqGDF5OFnOsSlIx+YO/TSrevhX8YTIVjAk4Yg71Lg5X6
	I3xH7uElR5OCFsXYz391kdGUr6brD4t+ISMY6xbKYmn7KcNfHIOkf745gFd6dKI3uG/Y3WhO9fB
	GpuE=
X-Gm-Gg: ASbGncscz4tWZkcpF58g8L6YnCi3efCiRhs+88+TGHwMQo8A1PWyDdcJCi4dLVgswdC
	zOfZ/L7K8QEeNLypt78e5zNC7Ry2RJV1DOsY8dm0cvDW4skOWsOWvB9evcd66Vn0F3KH4mq8zQr
	JJ4imROe7S0ptp3cUkfLtTx/rKRamHdseIR0Id+xv+E0udXJdBUXgbTvwTEWp5D2jNNvnH5W1dT
	EqpSaQj4Y7NzDjvCh9fCQ6qRU/CBub7tOu4Nlg4BuKvEbva8zt9YVkQZcXVAgpf94BGz2+/GVUD
	1mvPoZ5H9De3z8G0fwqpSSWMmZN5Q+NG+/g/ONl7xW2Z
X-Google-Smtp-Source: AGHT+IHS2PJ+/kxwhPkSsqZSy1Lcoi2dOdo4gLmR9Sx1nH5mZxTPaitClYNterYld+kjauOZ34q9lw==
X-Received: by 2002:a05:6a21:164a:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-1f560fb098fmr15311166637.33.1741666148378;
        Mon, 10 Mar 2025 21:09:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 10/16] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Mon, 10 Mar 2025 21:08:32 -0700
Message-Id: <20250311040838.3937136-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
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


