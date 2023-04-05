Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37236D79B3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518433.805016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0O4-0001Tt-PM; Wed, 05 Apr 2023 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518433.805016; Wed, 05 Apr 2023 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0O4-0001RM-IK; Wed, 05 Apr 2023 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 518433;
 Wed, 05 Apr 2023 10:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Ea-0002Na-UF
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:20 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53612bd7-d39b-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:19:19 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id r11so35629067wrr.12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:19 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm14040108wrr.100.2023.04.05.03.19.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:18 -0700 (PDT)
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
X-Inumbo-ID: 53612bd7-d39b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBsjiWXEyjNdcnK7CdgNfH2aIDA7wl6BmVcuMNTGlRg=;
        b=ZCeEmGx5C1tuByO7Gk8190umAFm3Jq4q/3LEy8V4HB/sgDGk01PdV0MXcQqltklyu3
         DW09L0fwCMzuVJZy82A0vSyQNKZSvZwE3Rakfj2hr1zvFY1eZeaEbcBCDOHIx7fy11jt
         /S2FM9gq9oJe4BBqhtdS5l+3uhXXNdnl7KuLkaG9eftfsUPFv3TGzexWOVF1sWTguVrY
         838K9xTGvVrgnK3wGNr49BTbICPTkdgaMh9RIPXj5OJjY/e393NR9LtEmB+cM2VmI3zz
         RQrk9WLPd1wzBdC0E7STdPo8yjxVpnfYhSiLQXfXjBKsSb4Cc8fPtp7Mrl4DfK8dO1FF
         g35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBsjiWXEyjNdcnK7CdgNfH2aIDA7wl6BmVcuMNTGlRg=;
        b=UmyRNXnzdCCa2vrgkknss4VTCQUCx6LmDdnwIHwYLFy2fpolh2KxAJXhSxmJTW65ej
         sivBCc+vTt+UkruP+yjbCc7XZKWYzGSoUigCzprhA7rd77lwYqOd203/dYvWGGAj3kEk
         o1mlTu3a2gpGkDtuGU1Q/AU62kkBKdHU1HM0H01tUehOwEEUhyHKhUL16IxoA09tr8wW
         /YWhe8DzMG03heV+CNx7BE9pTIA9tqLXa+juvAwqpapSV5Luu+bt/x+KEmZxuS0aJgs4
         UeU5YSD8fvXk80+HNfaN5ACHrYAzaMkzOpP024W8hSWT6wr59auuVY5qsrDr6EYFzo2E
         Zr/w==
X-Gm-Message-State: AAQBX9dHHg+FpUOeJzkl16FfeJEzhRjg6MbHvzlQ5Lcm5OM9ZGVM763c
	NTCR2J8qhJt/TeBwQR0DmnaQgEffp8+ee5BrAt4=
X-Google-Smtp-Source: AKy350bqyCS4jO7cj3IxU6M9gEfWmwwxn91ShCFu07OvQwRL7AbHTBtXunKmonFyvH6AyOInd3xSpQ==
X-Received: by 2002:adf:f004:0:b0:2cf:f01f:ed89 with SMTP id j4-20020adff004000000b002cff01fed89mr4200753wro.24.1680689958696;
        Wed, 05 Apr 2023 03:19:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Date: Wed,  5 Apr 2023 12:18:06 +0200
Message-Id: <20230405101811.76663-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_malloc0() can not fail. Use g_try_malloc0() instead.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 3c7bdd560f..45fd318d23 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
         }
     }
 
-    qcpu = g_malloc0(sizeof(*qcpu));
+    qcpu = g_try_malloc0(sizeof(*qcpu));
     if (qcpu == NULL) {
         error_report("NVMM: Failed to allocate VCPU context.");
         return -ENOMEM;
-- 
2.38.1


