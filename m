Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395573A5E6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553783.864619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1x-0000OG-9R; Thu, 22 Jun 2023 16:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553783.864619; Thu, 22 Jun 2023 16:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1x-0000Lx-3R; Thu, 22 Jun 2023 16:19:33 +0000
Received: by outflank-mailman (input) for mailman id 553783;
 Thu, 22 Jun 2023 16:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMtF-0001Yq-6n
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:10:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fb1dddb-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:10:31 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f9c0abc8b1so21515445e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:10:31 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 8-20020a05600c028800b003f9c8c6bf53sm3978876wmk.13.2023.06.22.09.10.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:10:30 -0700 (PDT)
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
X-Inumbo-ID: 4fb1dddb-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450231; x=1690042231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrWBSt50GXK7KCFoWhMRFDVlBR7e4c4Lap7a/Dv/MfQ=;
        b=uh16dyOE/YngV+vlrCn9FF7LTn5kqMPDeNAZPJp/OXd6o48t2oNQK6+xyZgF0O/Rwg
         eOGnESuioKTn+49rZFTitvpZbXcCCA2lKI3uKKPWDO6qAJwPVxKRyFjY6tswlOnD5ggQ
         uglMk0I6MEVmcZiNo50/xLJc3XKZtwUiYzcshho3Z8PHZ77Ff5SeMMqNEPPm+6yamswW
         43xD7f+l3wuUlEu0Jk5k14uNzXBhG+/BP5Z2LtMbnA+vN2SOlxaHgl9cD7Y/VNZS7ggW
         sXiU9m8gF/k7MyaKQbMxBUzf2iKP0B73BEmBKpJN7i3GqROl8rychDyAYceCJlDAbGA3
         M6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450231; x=1690042231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrWBSt50GXK7KCFoWhMRFDVlBR7e4c4Lap7a/Dv/MfQ=;
        b=KEYnMPCumrT8ItbXkRVdCvaiEvthdBc9MuJSGeJRqt6Krm4xkC9IdOQe/eRXHo6Cf8
         Kp6MHTDQ2r+nLHww49qcIEdqbZKjh6yhcc8x9fdeBLJwqYqWsqf/sjDMwgeU17/Rojuv
         JZOG7Avk+iSEYMrgkztkXoLUTzcl7iNruOtxQYUwqKSBFI2B9W1Xvq/JizTTZpMErcGQ
         urrYtMZgs88hG5i1Hl9OybcMI6Sy4DY0NOF83XdLWxX1jFshpRFImnz/8mqfOR/b5W3E
         5KeT7S3Suvt1I8BlmH6gMOr1oOX+hG/zmB56vemEMHp0ws3pBOXSEdiAn8UWaOCs/EsH
         8mEA==
X-Gm-Message-State: AC+VfDx8PnIgooFQbsIayGd7upAN5in04Ld4cRAFivida/4vZE+h8k2D
	Ks0lVDsV87HRWu9FUUyynK5bSQ==
X-Google-Smtp-Source: ACHHUZ5cB8aDLTQ/tjJec4fXZP1xWmF+PhC752VaaNKObmwfmqLXBqw27M1/B1ILuvDg4fp61kaDNA==
X-Received: by 2002:a1c:7911:0:b0:3f9:b2a9:c546 with SMTP id l17-20020a1c7911000000b003f9b2a9c546mr9068827wme.28.1687450231205;
        Thu, 22 Jun 2023 09:10:31 -0700 (PDT)
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
Subject: [PATCH v2 12/16] accel: Remove WHPX unreachable error path
Date: Thu, 22 Jun 2023 18:08:19 +0200
Message-Id: <20230622160823.71851-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_new0() can not fail. Remove the unreachable error path.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 340053e6dd..012ba696a9 100644
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


