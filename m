Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B520973CC1B
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554641.865950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GY-0000UW-Ld; Sat, 24 Jun 2023 17:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554641.865950; Sat, 24 Jun 2023 17:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GY-0000Ry-IA; Sat, 24 Jun 2023 17:41:42 +0000
Received: by outflank-mailman (input) for mailman id 554641;
 Sat, 24 Jun 2023 17:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7GX-0008Gp-Fr
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:41:41 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60769381-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:41:40 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f9bece8d1bso22346845e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:41:40 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a7bc3d0000000b003f17848673fsm2720557wmj.27.2023.06.24.10.41.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:41:39 -0700 (PDT)
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
X-Inumbo-ID: 60769381-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628500; x=1690220500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=omrduxic9rR9gPq+8XiHL87viBJ6wPrEMLfMgl5GRT1MGJsF+TtB4IIzUjBDeXNjSP
         tp/8tj21VJeGWzF0OuqgjS2WgxvAd7ieEEmjLY+I4RrDNy354ZcTaHifbrUEQBN4g/u9
         4e/DFqq/MH/KbKaaB92Ppsx49dKlUxgAkumlNe5v3R+Jm/CqIieAk+esoDLYqoEBfLF/
         1f88uKZFICtvcllNPS/mi7pVo0xerJ43s2nY2Z3sJDSCnEe0Pht9v3orZiuam5tqDacn
         UUqcswJ4Q6QF4/9o+nZDEmVIc9HxLeYNLEDed2aM4/V1htoQbmJH9XmE/hgtRRhOhIST
         3Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628500; x=1690220500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=UhUS+Yw+qubC3nFMj00IuP06x+4UJ99xull6wpvNpRTRRxqRChGqxnQwQwOWFIlkFe
         EZIt9AHrp9qdXHPIPRvBC8D7Q88kBH5NiG9jgWvUjw4VjjYOjuyPH/qDoMxtbqKcR0x1
         HOmS3c6pFtQ1GOg0mpVEp/cxGn8sHUxuZghOn4Qm7O2YPsQ+SH1Y73ru/GWQHzl+gLvT
         bmwZNgVYG6UX0W1vbaoBgIfErrDwKyu8YsX7psx0HHPECvoDyBLj+C3sz6g6ZXIs0PmH
         fdTUosxRh0tWteGOYDkFLSUhLcnOOsvZ159j8fzKaNYXK30FahJCDLcCAP3W+96ZdjbN
         AlLw==
X-Gm-Message-State: AC+VfDzY6YLCQCzsY/8q+OacHDgytYhd/fh2OsZg33Jlk/zC0bbwDIR2
	dtkj6iok4DXhi/16MMpQovrwFw==
X-Google-Smtp-Source: ACHHUZ4U4xeWdaU30+Yq1mmhN/DHgskzeAXZldA07vw+iV02dwa7q8YwoovgGfKWWwqQiGNx3nFeTA==
X-Received: by 2002:a1c:f70d:0:b0:3f7:3685:1e10 with SMTP id v13-20020a1cf70d000000b003f736851e10mr19084030wmh.40.1687628500315;
        Sat, 24 Jun 2023 10:41:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	xen-devel@lists.xenproject.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 02/16] accel: Document generic accelerator headers
Date: Sat, 24 Jun 2023 19:41:07 +0200
Message-Id: <20230624174121.11508-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These headers are meant to be include by any file to check
the availability of accelerators, thus are not accelerator
specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/hax.h  | 2 ++
 include/sysemu/kvm.h  | 2 ++
 include/sysemu/nvmm.h | 2 ++
 include/sysemu/tcg.h  | 2 ++
 include/sysemu/whpx.h | 2 ++
 include/sysemu/xen.h  | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index bf8f99a824..80fc716f80 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -19,6 +19,8 @@
  *
  */
 
+/* header to be included in non-HAX-specific code */
+
 #ifndef QEMU_HAX_H
 #define QEMU_HAX_H
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 88f5ccfbce..7902acdfd9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -11,6 +11,8 @@
  *
  */
 
+/* header to be included in non-KVM-specific code */
+
 #ifndef QEMU_KVM_H
 #define QEMU_KVM_H
 
diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
index 833670fccb..be7bc9a62d 100644
--- a/include/sysemu/nvmm.h
+++ b/include/sysemu/nvmm.h
@@ -7,6 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-NVMM-specific code */
+
 #ifndef QEMU_NVMM_H
 #define QEMU_NVMM_H
 
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 53352450ff..5e2ca9aab3 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -5,6 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-TCG-specific code */
+
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 2889fa2278..781ca5b2b6 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -10,6 +10,8 @@
  *
  */
 
+/* header to be included in non-WHPX-specific code */
+
 #ifndef QEMU_WHPX_H
 #define QEMU_WHPX_H
 
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 0ca25697e4..bc13ad5692 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -5,6 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-Xen-specific code */
+
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
-- 
2.38.1


