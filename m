Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36D73A5E9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553770.864548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1p-0006sU-DR; Thu, 22 Jun 2023 16:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553770.864548; Thu, 22 Jun 2023 16:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1p-0006oW-6M; Thu, 22 Jun 2023 16:19:25 +0000
Received: by outflank-mailman (input) for mailman id 553770;
 Thu, 22 Jun 2023 16:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMsl-0001Yq-71
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:10:03 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbce790-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:10:01 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso7571834f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:10:01 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c231200b003f9063fc3cbsm15728619wmo.44.2023.06.22.09.09.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:10:00 -0700 (PDT)
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
X-Inumbo-ID: 3dbce790-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450201; x=1690042201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HtP5OMiHV1uHyCREuOsPgXLNdWuwc5y+seBeAIuir0=;
        b=fD2yFKYVUSbELRWkgGW0danFEJd49UvIoHVUaoL+iV8IqYQvNfiml31iLxtBJeKK+2
         BhYPg4qUhHRzjckRgaA9Y7ICZhNcCZMhqc202pVq8XOrpxWtk6WoH7hxA67ck5XYCSA2
         a1mUXkxpR3fQsnOmFzfz0iq4qYue5q1tdAT5/kH9rAuDXlR9gqshBZLvQbP2e7xh87Rz
         116ue4dKX7z8nRG43aPZMWOGjKu3Mtzz5LGCpfwr8CqoismIj/q6QyBXeNO1kiC0U6lz
         /+jW94I7TghlhujpjnaWLHWAqKt+jU29K9hKNOv+XTxyLGAUr4jy4FnAEonFW8sot8W/
         zLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450201; x=1690042201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HtP5OMiHV1uHyCREuOsPgXLNdWuwc5y+seBeAIuir0=;
        b=kkDF3Einu3YWsVSSV37Q7tT4z9gFFOnd1wpQTl+V1JJfF22JEkM16mgfV85ZSvBt5/
         tjf5ySQs5o2t+4mLzTvX9TNmXuUY4Y0DMwlPMqfTRwZkT/rqRjQIudCx3xtiYhmWuAIh
         1qT4Nsp1NNar0casWCUVQJfgV6xwaxjIcbPceu8sMnhvMpv6e4IGP5A9PdBWzoLyo3I1
         eQddwu61+L4pcRoLn/5UKPG1f2t59BDQip4dXihhf9oUBy/T6ihWcpWNWNyeYPDn5Nbj
         sETYDEVXWlhhomPxlAU2XfmKxZEycWEfsu993nYwLht+yGj1PctFcrRnGe0q9YIwNzj5
         0eig==
X-Gm-Message-State: AC+VfDyIh2LNSuAW2r22fhLJUgx29XUgqtGnY2cLGRCDoFfkAnFTY26q
	pKvmAFrj9YpRar3L8Ida5pHB8A==
X-Google-Smtp-Source: ACHHUZ63Fuzhm8d41+KEQTBgPUOc0gqnijkCpCOihqOKQVjSB4IS+fg+O0ZMGvIAchJ0HLw7tqsoww==
X-Received: by 2002:adf:e611:0:b0:309:fcbe:748a with SMTP id p17-20020adfe611000000b00309fcbe748amr17046247wrm.11.1687450201085;
        Thu, 22 Jun 2023 09:10:01 -0700 (PDT)
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
Subject: [PATCH v2 09/16] accel: Remove NVMM unreachable error path
Date: Thu, 22 Jun 2023 18:08:16 +0200
Message-Id: <20230622160823.71851-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_malloc0() can not fail. Remove the unreachable error path.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 50b96ced45..0588a328ae 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -943,10 +943,6 @@ nvmm_init_vcpu(CPUState *cpu)
     }
 
     qcpu = g_malloc0(sizeof(*qcpu));
-    if (qcpu == NULL) {
-        error_report("NVMM: Failed to allocate VCPU context.");
-        return -ENOMEM;
-    }
 
     ret = nvmm_vcpu_create(mach, cpu->cpu_index, &qcpu->vcpu);
     if (ret == -1) {
-- 
2.38.1


