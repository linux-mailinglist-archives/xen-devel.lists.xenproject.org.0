Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2BA1AD65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876396.1286777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sL-0000c9-Tv; Thu, 23 Jan 2025 23:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876396.1286777; Thu, 23 Jan 2025 23:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sL-0000ZE-Pi; Thu, 23 Jan 2025 23:44:41 +0000
Received: by outflank-mailman (input) for mailman id 876396;
 Thu, 23 Jan 2025 23:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sK-0007hN-Db
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02623f21-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:44:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso10115625e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857c3sm7081075e9.10.2025.01.23.15.44.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:37 -0800 (PST)
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
X-Inumbo-ID: 02623f21-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675878; x=1738280678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=C4soO1wrkXfi/7UdcyGa+U6Vkylnu4OsHLQ4u8nOvV9uztw+hVTOKzy687uN1NrGJ5
         EKvUaRkIcqVi7SfdRC4qTI1x6nXiSShWf4PA9lNHtK1QwpP/cc8B6gsrlrEEilMdI1tE
         3NkADsX3CpMZFMckmOLY0hDrVLG/0+mTT18mBoX4C2dU4RXZAOeL/cKjCphOInh/NoNr
         dT8u7fkdxZ4YdO2wY3+zwhJuzvKW1TdWviDAP7ATcFHI3dUn8pP26WWxZV8FunoMpkWw
         P6jipUeKzzuqBzVEO+pj/TrxG159UDQl/sPqZcGkn6MTJEZRraRj5RSHFBE7izrdr2ZU
         pKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675878; x=1738280678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=B2c8EVA/obNpx71jNTe87E16C49hYp5clOyJXVVoBLPJ3p0dDU1U7CHBNjq8KM9zUT
         TGX36yVgsh3bxYrCkk2sXhSo3KwQGApxawRn25aXAnMuphJ6IHykxJ52Y5eNOo0udXFv
         2hie8M8grRGL0rMZP9wUx9QxEB/K34npa6vBuG2loFNRbG372bkKtLYR7YGcsri7V/FY
         T/LDrmp2trlXL2PLL81r42dMHyEX589WyeDVOS1ModgEJ2VG9ESC/i/oatkERqb1Yc9G
         2LrkUcNyT5mZdk24lJk+0XHxihYCXjgwgg+dP4P4eMGMMqU5l/oBnSC/aMbFGd15bI+t
         s/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu6QK7R4Us8jacRb31jBhyyPUo2HvGm2WvHPnDTH/6cuvwFzjbayXtmzQhZtV3j9ePFFMczcvyJ6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzR61OcdzLp9vaNjzW9Gyhm07bHdS7KFB10yZId3P1T0xKBtjgb
	luMGstV7g2hRqVrGfeJ7gDmTqoqe7oYZmTmZR7MUK97Ao0Uf8PUk/51eA56/qrs=
X-Gm-Gg: ASbGncsrX5Bjkr2xKD9R2WidAghKgG9tLSQKDxbrKvpvv+lsj7N43FYrVb59cWIRlil
	IyutIzW3JFaItF/KTVDlOgWqNleUtZVGrAFwZPEy4SwheElUTxdSRRHoCPjLyvlMn3cmzVmmWqu
	g8PvznHZh9v2jKoGQEMqimz92bv17uibBm4MGL/8t901Aox96PPjBrOVvhR/vqrY6BRe55vgmJO
	AB+7MNfPXJ8/oJ2Y1eG0maVglRs76tZ98UD/PEaNiiZCFPideidUgIFujrP7CCHc55T4LbSf2ii
	DiICXFiUL1el3FagT4VVKH9AYv7h8VrdagIK+yUJEX5f6pzwXvpp/i82x6GZHCVG5w==
X-Google-Smtp-Source: AGHT+IGo8PNbuw90Bq4/JTfJj+icg7kmRyyI+cmqGdvUrpM4r/a237PZVlDOFDC6zvKvXQiH9M0QlA==
X-Received: by 2002:a05:600c:3d05:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-438b87f953fmr44596875e9.0.1737675878313;
        Thu, 23 Jan 2025 15:44:38 -0800 (PST)
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
Subject: [PATCH 04/20] cpus: Cache CPUClass early in instance_init() handler
Date: Fri, 24 Jan 2025 00:43:58 +0100
Message-ID: <20250123234415.59850-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cache CPUClass as early as possible, when the instance
is initialized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 667688332c9..89874496a41 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -134,9 +134,6 @@ const VMStateDescription vmstate_cpu_common = {
 
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-    /* cache the cpu class for the hotpath */
-    cpu->cc = CPU_GET_CLASS(cpu);
-
     if (!accel_cpu_common_realize(cpu, errp)) {
         return false;
     }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index cb79566cc51..ff605059c15 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -238,6 +238,9 @@ static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
+
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
-- 
2.47.1


