Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CDA1ADA4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876491.1286887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yq-00088b-Cl; Thu, 23 Jan 2025 23:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876491.1286887; Thu, 23 Jan 2025 23:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yq-00085w-52; Thu, 23 Jan 2025 23:51:24 +0000
Received: by outflank-mailman (input) for mailman id 876491;
 Thu, 23 Jan 2025 23:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tQ-0007w9-De
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:48 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b751e45-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:47 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43618283dedso15517605e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47f355sm7138595e9.4.2025.01.23.15.45.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:46 -0800 (PST)
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
X-Inumbo-ID: 2b751e45-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675947; x=1738280747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmeiNXwxDOryj9Nk89BSf7ntmaAiV2ODrxL67LjT3oE=;
        b=Nbwi6evql1n75WRaVnKCPLltTihG5WWspsDkjKs3P3n/CiDGfATte5Si4TLL0NvgBr
         uSFr/j1ly5E+kLeI2htX8DdYgZhDtTXxA+H8d9SpVsaMrLsAV7fOybeDbkHdUxi6ygjr
         maw5oSA4G1SNNiak+QWPOkd/hBPAFd90GQwNHRkbvVzhIjdDcS4Jo+pNQ+lELXkIT0dh
         PyEHijOmVRt896CvKidiYv7uW+LhBC5mPiTm8+lxYDS9nRZhKeUbbhZ6H/3NqiHYXWRT
         Pv2Z8tFp/cCzfPyEF7+ipVf9p1dLwD5Wncv+ccm63SRl3fus1InbrXcFQVUovUKTLCNz
         AZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675947; x=1738280747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmeiNXwxDOryj9Nk89BSf7ntmaAiV2ODrxL67LjT3oE=;
        b=O7PnIOU6RSxFDE+ICi8WBQ3f0dZF/wspV41jDrPRBNPI4LYonTqGv6cKet+hD96RCT
         RYLkbb9qrMXTwJgupQRP/452BdfAUGUFHoyf3NR/E6NYYlQHRYLpjmh/ALLrr7XqqaSn
         vaKSPHOuFDN5HkeukAD6uwZFcXHScjAvIiz8bqzxV6eT86Tz3nVO3bG2ibGcoAL2t1M1
         P5fFrKhnSDZ9fDUoW5GG68z1TuFF8vgkxIuNdo5WssIneiXrvwCmuf/t3qBFky5visTI
         EVuItF8E1GgnRWTMAh8F11Q/O0jX2D4K7f7qxpNYJmccDY8n5d4oIDoC62nBpivIUgDa
         OQNw==
X-Forwarded-Encrypted: i=1; AJvYcCX8PG5Rblywq4UgmYjz9+NCDD3a5B7X7BHiA74O4xlnOF0wazVd+KKfHbNh9R1HcdP6WM6LNsW1b5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk+3AX0nF1PlcKgBAzkAXZ0ZT6Kkgh98d9X/pxKQJipIAZLWyJ
	gFpgLWMD+xSnaiUN3Lx0jAB+ZE8acVhd9o2vO3B6cSLlhkFYUOZQiQN6F+kyRH8=
X-Gm-Gg: ASbGncukU9s1TtRTE4M64BeRy1TFUQQyYfPlUCaiRzpYpMa1rFhwk9xFLraFL7VACXt
	W1Mutbw37Bn2RzSrbV13bv/XhGm61RV0gDcv6vBmP0l1tIwaTsOe/EjUwSdrIf21KJuVEja8Otu
	EP5kvJdXNTS5S2xEimmzhLNKhPKob0FeP1deurjd6l3u6XZZomVZO/CIFXn3B3YcYaBTzrpPwDY
	WO0mTFVlCPgjzxL1xniPAKKCn1HYbpBMU3V46Vme8IxdFKWTAGT7DMaifxorwgnbUm9fcJYzZ9G
	MA16Yznzbvwnhzr/x9pEDzfGmtnxMp0Ldpl5I2hsRWhUDW6+Z/6sisg=
X-Google-Smtp-Source: AGHT+IEFJ1SeJWoUW3YaXnTGBs2yrvL22hVEarb/siWyosLBI70zXEF7xcr/1TRnUm9/lQBURa7m3g==
X-Received: by 2002:a05:600c:1e18:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4389141c12emr225835175e9.22.1737675947213;
        Thu, 23 Jan 2025 15:45:47 -0800 (PST)
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
Subject: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
Date: Fri, 24 Jan 2025 00:44:10 +0100
Message-ID: <20250123234415.59850-17-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
("Use a dedicated function to request exit from execution
loop"), tlb_flush() and tb_flush() are related to TCG
accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index a2999e7c3c0..c05ef1ff096 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -45,22 +45,27 @@
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
 {
-    CPUState *cpu = opaque;
+#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
+        CPUState *cpu = opaque;
 
-    /*
-     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-     * version_id is increased.
-     */
-    cpu->interrupt_request &= ~0x01;
-    tlb_flush(cpu);
+        /*
+         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+         * version_id is increased.
+         */
+        cpu->interrupt_request &= ~0x01;
 
-    /*
-     * loadvm has just updated the content of RAM, bypassing the
-     * usual mechanisms that ensure we flush TBs for writes to
-     * memory we've translated code from. So we must flush all TBs,
-     * which will now be stale.
-     */
-    tb_flush(cpu);
+        tlb_flush(cpu);
+
+        /*
+         * loadvm has just updated the content of RAM, bypassing the
+         * usual mechanisms that ensure we flush TBs for writes to
+         * memory we've translated code from. So we must flush all TBs,
+         * which will now be stale.
+         */
+        tb_flush(cpu);
+    }
+#endif
 
     return 0;
 }
-- 
2.47.1


