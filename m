Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5AA1AD9A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876443.1286807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6y0-000464-SS; Thu, 23 Jan 2025 23:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876443.1286807; Thu, 23 Jan 2025 23:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6y0-00043W-PZ; Thu, 23 Jan 2025 23:50:32 +0000
Received: by outflank-mailman (input) for mailman id 876443;
 Thu, 23 Jan 2025 23:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sm-0007w9-PO
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e68f85-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:08 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so15618625e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17630asm997952f8f.6.2025.01.23.15.45.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:06 -0800 (PST)
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
X-Inumbo-ID: 13e68f85-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675908; x=1738280708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDFP15LbfYjBwdgoNtB1SUTPS+QYiGObjjbLDQKpiPc=;
        b=H01CtwRfWhB4wEasZAKV33jROT9Fur5PGDogNm5FKaZUlxVtxyTBheK5boQJgALWeD
         bmf3oQLWsKNHi/fzhZJuDOl4Krj6oGnnAjHLFfe9czfWFAbsiHp6rUkLcJX0Ldn/77gV
         t2Tlu79cFh2folA6WmMu2jBFqkqqmUZ44eOPUVSmsAdvcNZIe+9GDpOIIffsf9NhqP08
         2/rU54fzDIgCAbZlbjs0c6X4P7KALQ2yslDE6UghNKETDINTKFcX53hqnEix9acRmzkn
         yS/Oa7Y8GydKO3HAfgPcnwr28iNytcoiYLQKboSIKvrk4n/naw1unFvU6HFuBW1kdPAr
         DkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675908; x=1738280708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDFP15LbfYjBwdgoNtB1SUTPS+QYiGObjjbLDQKpiPc=;
        b=YPYqPR8kGqA8AUCxIqO77Uq3T5EVkvgi3yFpTF2yr+tJuYiM1WehmDg+un690Dodn4
         IuwQqOT5u6RjGX+zsbHkfQz961JV/0lCFIWAV0Y/gddhKzAATai7hHcjgzpMEU8Pdi2l
         +O/DOpWVBg/NB2TrTpHUkX+YAFViGMTSaQ8bA0bq3kXLGTeHDXQ3iLUtU5+17ik29wRj
         EjCVQ7rKu3ElPpvtnRa1Y7zCTma0qGnNazBr4OeSuKLl/UFr0Q+ufYzSaEoggn6MVUfb
         Ba50uz8+F0AUGqRjeGx2YCTaU4JNinQ7mN+jpZ5umumTbVso2M2pS1qtfCCKyQea66lh
         9g3g==
X-Forwarded-Encrypted: i=1; AJvYcCVcC1rrGmLS9JbaizWig7ZnFjNQ+sE8EX6iksDt4Y0rIjbnA5toRwKwcjLgTfmX6XVdgss5m/N6xI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdxmgIO/qXeONPDDAJoQdOuE8IXTcIGHVJaQ2axkoxzL5cKsXh
	ylr3DZgZVdVXyLdZ8SzluZgRXxPucThUVJ+m1MFgJRlAwDVdXolf/N5bKp9Z2mU=
X-Gm-Gg: ASbGnct0Au4AcMO3NAI/YrLRDpWe7fvhIbhQ701zSv7ZcE4Buv2aN2X4nPl9iXQyUca
	ZvA8JYoiq+r03HTtImyIZKnlDR81dU1Sh2TVqxP+eGEQ518qp0rECSnBctsnAB1TCeci2+gTFvN
	bmPzNLWZSS8jJKJEJiXEE8w1wQUcMa0JAZVWYiUYCpDLUTnOeomkOuPUOp+di1p6iEMsIWuYZyr
	rulgCg+H3yc+h5+zG0ZTjYlnXl2H0Sa8vLiRfHpwk6n2Kh/hATw23rKWq/TeOTOn1Nnle6dFeV7
	S6jrnWWt6oBDtHS8qyhkYSMb7+ALNo3SFixA+39Z3uieC+l8CKyODs0=
X-Google-Smtp-Source: AGHT+IF/y2rn8++eRXtfGXVV9eCNnufdJ4OAKshcVAU/XMr+be4nBaPjnThGR5Wf47h3eLbBgCoQsA==
X-Received: by 2002:a05:6000:401f:b0:38c:2677:9bee with SMTP id ffacd0b85a97d-38c26779db8mr3711264f8f.15.1737675907708;
        Thu, 23 Jan 2025 15:45:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/20] accel/tcg: Restrict 'icount_align_option' global to TCG
Date: Fri, 24 Jan 2025 00:44:03 +0100
Message-ID: <20250123234415.59850-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 740b1759734 ("cpu-timers, icount: new modules")
we don't need to expose icount_align_option to all the
system code, we can restrict it to TCG. Since it is used as
a boolean, declare it as 'bool' type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal-common.h | 2 ++
 include/system/cpus.h       | 2 --
 accel/tcg/icount-common.c   | 2 ++
 system/globals.c            | 1 -
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/internal-common.h b/accel/tcg/internal-common.h
index d3186721839..7ef620d9631 100644
--- a/accel/tcg/internal-common.h
+++ b/accel/tcg/internal-common.h
@@ -17,6 +17,8 @@ extern int64_t max_advance;
 
 extern bool one_insn_per_tb;
 
+extern bool icount_align_option;
+
 /*
  * Return true if CS is not running in parallel with other cpus, either
  * because there are no other cpus or we are within an exclusive context.
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 3d8fd368f32..1cffeaaf5c4 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -38,8 +38,6 @@ void resume_all_vcpus(void);
 void pause_all_vcpus(void);
 void cpu_stop_current(void);
 
-extern int icount_align_option;
-
 /* Unblock cpu */
 void qemu_cpu_kick_self(void);
 
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index b178dccec45..402d3e3f4e8 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -48,6 +48,8 @@ static bool icount_sleep = true;
 /* Arbitrarily pick 1MIPS as the minimum allowable speed.  */
 #define MAX_ICOUNT_SHIFT 10
 
+bool icount_align_option;
+
 /* Do not count executed instructions */
 ICountMode use_icount = ICOUNT_DISABLED;
 
diff --git a/system/globals.c b/system/globals.c
index 4867c93ca6b..b968e552452 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -48,7 +48,6 @@ unsigned int nb_prom_envs;
 const char *prom_envs[MAX_PROM_ENVS];
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
-int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
  * little-endian "wire format" described in the SMBIOS 2.6 specification.
-- 
2.47.1


