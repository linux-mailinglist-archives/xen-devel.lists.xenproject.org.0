Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B0373CC48
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554676.866051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O4-0005Ev-LH; Sat, 24 Jun 2023 17:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554676.866051; Sat, 24 Jun 2023 17:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O4-00054O-5z; Sat, 24 Jun 2023 17:49:28 +0000
Received: by outflank-mailman (input) for mailman id 554676;
 Sat, 24 Jun 2023 17:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7HN-0000wd-Ml
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:42:33 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f06082c-12b6-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 19:42:32 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51d5569e4d1so726852a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:42:32 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05640208cf00b0051a3e7d7996sm872902edz.83.2023.06.24.10.42.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:42:31 -0700 (PDT)
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
X-Inumbo-ID: 7f06082c-12b6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628551; x=1690220551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDJq03Cy4udm0BY/tdQJBSn7cYSDg3Mije1czkKCJYY=;
        b=RO2avB+FoBAH/Di/V4kIhFyDQH7uIlgC0gwfCgQrD89bwE83AmBBFg0CcRlHBZjeo8
         xf712Qc9aR38nPiF+uDaf5yc8gD19WEsCR2svxAprxd1bFxGUA2r4lMmJIlwctgs7QkB
         EUtMNoLLcY3J6LBbohSpdImmOm/n5GLZ+fA8stYV9O4SnDoSh8DTgNabJ/O9qfxzX4AN
         5t1XZJvA/e/bJFTTAZaWg85tev9gNfCnctzxCTxdaNAK3TWI6g6FLKy1iSyDWwm7ICVw
         UkmuMgdFFe7lQAMN+uYaq3GLpkAMayp43PGSU3d6bHrT+2SGnuNJPvNFppg8VTyk9Otn
         2Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628551; x=1690220551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDJq03Cy4udm0BY/tdQJBSn7cYSDg3Mije1czkKCJYY=;
        b=L4PugDDnxYbE35IOdH04SqxQNB1sQTmOHVAbpozvbtIrYCveeNyqe+GTuU7+s6y/7e
         rC2VxxNLYfWHyYCu0p9ywZ6YeeyqkXTK+FHnocz4x47brGYuwJ5MeMTWdqL323Jghi6Z
         y4OUeJlXDhOthfSAEl5r6+MotTYAQA+SsXAmrRPGWB1B6BNpFq0ajqaaaAY62MAhi7h5
         wQUFeAU7m2uXUfZOwU8Cg6M7FQ6ZncRFR2bIdaKfJRsJVbWTTkf6Jo9Bj07bg5jy5GIA
         OXB71VFFVQM65pXlN/Q+oaLe74kRqiISRzUmrbyjYm4S8p/E1TykOV12S/BeeWV8xQvZ
         F7NA==
X-Gm-Message-State: AC+VfDyXC/tiVuGvbKQRhasl78Q2PW7PrmZE2nXKUqHqMWzff4ZDzO+R
	1tvUs3WzridTmBtfuQ7RF6ekeg==
X-Google-Smtp-Source: ACHHUZ4FYM2a+yRGrt0ZR/p6B5z15VUL79T2BhspQcZnT7ZhY2JGOdCOYx1WSa4ydzRjjHwIT6bFeg==
X-Received: by 2002:aa7:cb47:0:b0:51d:9130:3c54 with SMTP id w7-20020aa7cb47000000b0051d91303c54mr196875edt.26.1687628551740;
        Sat, 24 Jun 2023 10:42:31 -0700 (PDT)
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
Subject: [PATCH v3 09/16] accel: Remove NVMM unreachable error path
Date: Sat, 24 Jun 2023 19:41:14 +0200
Message-Id: <20230624174121.11508-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_malloc0() can not fail. Remove the unreachable error path.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b3c3adc59a..90e9e0a5b2 100644
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


