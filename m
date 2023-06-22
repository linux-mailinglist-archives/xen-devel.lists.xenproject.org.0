Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213373A592
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553733.864483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrd-0001w2-Lz; Thu, 22 Jun 2023 16:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553733.864483; Thu, 22 Jun 2023 16:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrd-0001tM-J1; Thu, 22 Jun 2023 16:08:53 +0000
Received: by outflank-mailman (input) for mailman id 553733;
 Thu, 22 Jun 2023 16:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMrb-0001Gi-J9
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:08:51 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13c3fd8d-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:08:51 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3112f256941so5271924f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:08:51 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d4a88000000b003068f5cca8csm7356928wrq.94.2023.06.22.09.08.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:08:50 -0700 (PDT)
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
X-Inumbo-ID: 13c3fd8d-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450130; x=1690042130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=hz1Iri7fzveQD0XzRURoVBQ0AayjUFEKed+ma5hJWh66FT6qnBh9fJ6Yqa49kNHo/F
         3IpOngfIDQP04/ptc2tjcBXuEBGYnyItgUqUv1Xzu4OMyAwehLKCQiYvbdeSNCij8x95
         cWxKOYJL2Kj+I0ElvY9i/iRKv7l1uzjI7KdJo4fnnC4me8XMGc9CZSrylMv1xwbefMDq
         20wIR6Hftn5IW5cBGp88Pv5LYTiLSSfKvPKxbm7q5nblR8TO4SLMy+l/dx7jOAt50qA/
         UPo0hT2rx1nx+tTGE22u6Jz+w2s4b5BrZ3reMQGP04EpIgkSA8Qr9dx1Stp7KU/I3xGF
         CtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450130; x=1690042130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=SM8kOq4JBK4/5elUb71gz11op5ZvOyNL1mW2QaCiJoz9YgAKf+C/94G75GOiTch9i0
         mYhiPh8GE5abgy2x59JWI6cBT7u0dh8dxh5aDq5BA1GsLOvDzRYSsD1uPpVaAH/5UqUS
         7AjrQqoMJzhyeQjni27hGUg8HhHilPyDGDzceF50oE33TEflibWYGCumsrFzlO4bI9Ma
         CGICC9J4WsfDT3tw52ZQYKQYs2AeG1JoZAWXfp6xOyu7iReoGtMf3wFe0AflMLZOHLTq
         XQEgTF+AMAfqtfyle2MWNBlvt/VfIF4c0esP7W1uI4rb79Ss8Wu5wM38AVflITqmH3wN
         aYjA==
X-Gm-Message-State: AC+VfDzMcmL4oWzNn7ELLuxntqeO9EeT3NtNRqFZDfYXevOlSjVTDYZ2
	CkKhQ4cNkEyp97Gvt8UsBBJTrg==
X-Google-Smtp-Source: ACHHUZ5FZJ07KWuWBYKgfrnuifY1fdOTl2VG8E4TsYr3Kvhd2tgi1EDXYohQtUPqrVHBijnkT2QeEg==
X-Received: by 2002:adf:f952:0:b0:30f:ca58:a00d with SMTP id q18-20020adff952000000b0030fca58a00dmr10419263wrr.45.1687450130628;
        Thu, 22 Jun 2023 09:08:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 02/16] accel: Document generic accelerator headers
Date: Thu, 22 Jun 2023 18:08:09 +0200
Message-Id: <20230622160823.71851-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
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


