Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114726D796E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518390.804880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Di-0002Rd-46; Wed, 05 Apr 2023 10:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518390.804880; Wed, 05 Apr 2023 10:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Di-0002OK-1O; Wed, 05 Apr 2023 10:18:26 +0000
Received: by outflank-mailman (input) for mailman id 518390;
 Wed, 05 Apr 2023 10:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Dg-0002Na-Et
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:18:24 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31729cae-d39b-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:18:22 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id t4so30403161wra.7
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b002cea8664304sm14500312wrx.91.2023.04.05.03.18.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:21 -0700 (PDT)
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
X-Inumbo-ID: 31729cae-d39b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5W5kRucCzOBlp3KNoaJLlOhdcHcmgdcoSudurkJOAU=;
        b=YvdDHGNJmJITr/TCaBwa+nNTBQzwFo4m9pQoqmbmi3vaFmhxmN+kDfHXTlih7hjOuG
         i5foQd722oTmMrBj+Hnn/y+vSEYHeAfBNU8qFxNsz637G6z7vjp3C2UAjRMomPmXSt6B
         8zPBf0Ips8vfVnHZNtgCTbmeRiHGsNV5SUfNvKV2SqM3fJYcuc7ImyIhwyWRK6Hj9a9X
         +Js3FJbT2ARj2FgCtaCnNeF4Yijhd95peS0BiCwqBd/BuWcL+6seYLzsD3aU2CENQUwI
         ovnk8urTgfiCLVoqgt1J2QmQfKLKfpa8JYktu83jlKdtgVQauBcK79zdBkzhpVPSX3Ka
         StWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5W5kRucCzOBlp3KNoaJLlOhdcHcmgdcoSudurkJOAU=;
        b=yID/JQcz4IvI6Uf+RrQrUUjq6My/2RFP5113Ru96WPQdsmAevaGOwvHbizsVNtrOlN
         0GcG2wg/trt7QUqZcV2qJtRcfAX0z1ax1KEYQhHduq+LnHBM7s/PUnTxlz52jAShZVhE
         i2k6mZUGtL6bWDwu9Auqq6Edis3ntcl2iIKpnjDw/TFi+y/txrimNWdLlr97EVo5RYsM
         aYxB8vo8y8EL6ycGNdFCFKE2lS3+pUxfWMFHOUIx1Q1+QchugOxQI/myVpM7FORseTKX
         cocv1T33yFmNOtKGinSw4MMYvz+hdkrTo3wpoFV0KfFt2JvFZQGlbhY8DNwCVaIr4i89
         /Cyg==
X-Gm-Message-State: AAQBX9cYvSyiIyLdA85ApxGxouWGZ3KfbxuncfU5LLdw2KB78dt0fCR5
	gu4ES9iY/Avv+Zy9g4i9eX1HXA==
X-Google-Smtp-Source: AKy350bpxg4IrwdUQGHpIVdGoidA/+sCsrkONX9FyvsEM868pIe4QiJWHCOtkMTvKUMsoYziJ+Rgdw==
X-Received: by 2002:a5d:44c2:0:b0:2cf:efd7:2f1d with SMTP id z2-20020a5d44c2000000b002cfefd72f1dmr3851096wrr.13.1680689901758;
        Wed, 05 Apr 2023 03:18:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 01/14] accel: Document generic accelerator headers
Date: Wed,  5 Apr 2023 12:17:58 +0200
Message-Id: <20230405101811.76663-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These headers are meant to be include by any file to check
the availability of accelerators, thus are not accelerator
specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index c8281c07a7..cc6c678ed8 100644
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


