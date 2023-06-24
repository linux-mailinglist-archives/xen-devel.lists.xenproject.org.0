Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF3F73CC40
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554680.866072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O6-0005ke-9E; Sat, 24 Jun 2023 17:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554680.866072; Sat, 24 Jun 2023 17:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O5-0005Yv-RO; Sat, 24 Jun 2023 17:49:29 +0000
Received: by outflank-mailman (input) for mailman id 554680;
 Sat, 24 Jun 2023 17:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Hi-0008Gp-HM
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:42:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1d55ae-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:42:54 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f90b8ace97so23113725e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:42:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05600c290500b003f9b66a9376sm5651642wmd.42.2023.06.24.10.42.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:42:53 -0700 (PDT)
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
X-Inumbo-ID: 8c1d55ae-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628573; x=1690220573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnzdpi/SMqQKnah+FjHhFaYorhth+hVWT4q3k+G9Eas=;
        b=Rl+gIz/1qET6eDxSMKBlhgEu7TmyZ3qVvdZ/pF7ESuaDiAgqa0TRaV3uHvFx81SIeJ
         qV48l02FA5t/FTKOknHNBLfCx5Ba1eIp6WEdUkWmn7UkdBYryX6Psh7GsUfx5W+xyxkL
         3c8KjhetLy0GIjWOUWB3ntdnDUeOwr94g+1P+m5shTihxl+S6wUTSEMW3Qlx3DI6NP2l
         vrLr9dXR9+akQkWnsGaMqcGp/3u5JivD0nZdZrXF6pZOBFyTPj2x9FDEPXRcn+qIk9nD
         5gqJesBceAKK2qgsqePd5rhjrvRO65NK/VxnJZ9g/MTCIDd+ugMpSpYXChqlyNwCrEuQ
         lcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628573; x=1690220573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnzdpi/SMqQKnah+FjHhFaYorhth+hVWT4q3k+G9Eas=;
        b=jy2n6DM4ntmHY5tijr/M9iSOZHPaPDbr0Xv6Bhq8Gu4VbBKgo7SC7mB/lpBed8cpeV
         Wm7KLvxLZNAcknD78SNtPqr0XcVJKRrkcfLq1PxYmZL/hU+8WBjUP1NgySWWGsnswnnf
         WYzKLnv1ddJbgUdkVsJ7TUi4GQ9/nAJpnmivSI/O1zGEn/MCTXolRNlxZQ7A12f2ywEH
         GIT/tmDor7nbJPETBVFHrytHSCOfvsaYItpr0fPWY16gjZFu2T0VrKWGPy+H6iX7znhg
         4nxWw1BKO5Xmiu7CZRckEcUgsx2FHNnCpi1IuB7cJu9f1iCwbL3QGGH/CxYqF4TuJDRG
         mdGw==
X-Gm-Message-State: AC+VfDyBM+Owk6MqagktmR5gsVQfFpc+MKJKmfLeqISwKxeGvM39H+TH
	ejAQG5Cr5vFimcefwGEXi8gQUg==
X-Google-Smtp-Source: ACHHUZ54XAa6Du/8XTOzNhZjWrdIxzwHN95ahuIY8Dglo2ED7aclOY9r3VnonPY6Q+CxQ2enFMDFBQ==
X-Received: by 2002:a5d:4c49:0:b0:307:9702:dfc8 with SMTP id n9-20020a5d4c49000000b003079702dfc8mr21407001wrt.48.1687628573655;
        Sat, 24 Jun 2023 10:42:53 -0700 (PDT)
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
Subject: [PATCH v3 12/16] accel: Remove WHPX unreachable error path
Date: Sat, 24 Jun 2023 19:41:17 +0200
Message-Id: <20230624174121.11508-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_new0() can not fail. Remove the unreachable error path.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/whpx/whpx-all.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 410b34d8ec..cad7bd0f88 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2179,12 +2179,6 @@ int whpx_init_vcpu(CPUState *cpu)
 
     vcpu = g_new0(struct whpx_vcpu, 1);
 
-    if (!vcpu) {
-        error_report("WHPX: Failed to allocte VCPU context.");
-        ret = -ENOMEM;
-        goto error;
-    }
-
     hr = whp_dispatch.WHvEmulatorCreateEmulator(
         &whpx_emu_callbacks,
         &vcpu->emulator);
-- 
2.38.1


