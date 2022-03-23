Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B44E5754
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294004.499705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4ee-0000HL-D7; Wed, 23 Mar 2022 17:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294004.499705; Wed, 23 Mar 2022 17:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4ee-0000EO-9o; Wed, 23 Mar 2022 17:20:16 +0000
Received: by outflank-mailman (input) for mailman id 294004;
 Wed, 23 Mar 2022 17:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4ec-0007T4-Hz
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:20:14 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fb285ef-aacd-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 18:20:13 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id m22so2405557pja.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:20:13 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d24-20020a637358000000b003823aefde04sm336971pgn.86.2022.03.23.10.20.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:12 -0700 (PDT)
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
X-Inumbo-ID: 7fb285ef-aacd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MsX1ZkecFTiI7JDWgHH13CsFxdulVP/faYY6Ho3L9NU=;
        b=WiW4MrCr//Z88g+PXSFrPmTGMoceaVHESi73affp7lvaELZrmIQzuoUOKQHWdxEGR1
         NO8SV9ARJQk3egmkmUIPnlIThomv8Lit2KqxTc39Z2U2FpA9dGoRpDFaiV7jNk13qUza
         7zTfMC78Yc9mIXAGObaiUFBGpvB4UERocSaZSl7rhPntj8Gi1+FoC3nfqPiNjeGgZmPh
         TRMYKUG2CwwJHNw1Jqgv/qe0wIDn26xQq8oJkIoqzDAj6WG0NmljbJFdXSn/JSJOqJKV
         ad67bhyOCOEqsfPGFGJ1vRiL63Vd3PXt65wKeeSdZ40GLF1FXc9OTqtSP/xBz7j9+tjc
         hyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MsX1ZkecFTiI7JDWgHH13CsFxdulVP/faYY6Ho3L9NU=;
        b=6UdX6dVP5cjODG+BvQRiZCDSG7NudnyjoZc1zvFHYIsNWSZxKzdYBSFaRODybwFrUF
         IglWoVtqdU1I2+N37dEW7wlBluulRalPPMUNTfbPmz2+4xv5uKRtcnFLmN/rGhyUmF15
         3vR8xrGF/xyhfRKTWM8FbXio/E0rGRs3lAhSMllQH3hsb7o0p1l6DXShKHDlPQqPPNH+
         /igIeDdGQz/WytUQU1/rkHHBpZ9oqSu7Vm0TQ+CA7A1uSqI46U78LOmiW2JYcc6ZXccF
         +W+diRUr2Au4ZTDFSL4M5nM9nTcx7pWGlapsbBZnmJ8eoNcXX1FT16XR2mdhOo3n+eDb
         KtnQ==
X-Gm-Message-State: AOAM53233n7n9i/tRrqEuAXs6cV73RPw0zFFEnnEdUo1qdfBLkL4OyXR
	UUdl+Z5DQOSJBk6j8JPVKN0=
X-Google-Smtp-Source: ABdhPJyjcb2sZqeH87rq3zUZWSVN13XuvvacgYKtkqz+CZvHLPq51GDtssoIVmULExUOmBBtc3gkrA==
X-Received: by 2002:a17:90a:5291:b0:1bb:ef4d:947d with SMTP id w17-20020a17090a529100b001bbef4d947dmr12885297pjh.243.1648056012464;
        Wed, 23 Mar 2022 10:20:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 11/13] accel/tcg: Add rr_destroy_vcpu_thread_precheck()
Date: Wed, 23 Mar 2022 18:17:49 +0100
Message-Id: <20220323171751.78612-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TCG/RR is special and creates a single vCPU. It only have
to release its resources once. Implement the .precheck()
for that purpose.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 9 +++++++++
 accel/tcg/tcg-accel-ops.c    | 1 +
 2 files changed, 10 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 006b787289..6fe8e20356 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -295,3 +295,12 @@ void rr_create_vcpu_thread_postcheck(CPUState *cpu)
         cpu->created = true;
     }
 }
+
+bool rr_destroy_vcpu_thread_precheck(CPUState *cpu)
+{
+    if (single_tcg_cpu_thread) {
+        single_tcg_cpu_thread = NULL;
+        return true;
+    }
+    return false;
+}
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 127dd6fee5..0b0dbcc47a 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -102,6 +102,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->vcpu_thread_fn = rr_vcpu_thread_fn;
         ops->create_vcpu_thread_precheck = rr_create_vcpu_thread_precheck;
         ops->create_vcpu_thread_postcheck = rr_create_vcpu_thread_postcheck;
+        ops->destroy_vcpu_thread_precheck = rr_destroy_vcpu_thread_precheck;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
 
         if (icount_enabled()) {
-- 
2.35.1


