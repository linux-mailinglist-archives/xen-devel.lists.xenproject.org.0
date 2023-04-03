Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4D6D3E39
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517311.802465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEov-0000pr-1B; Mon, 03 Apr 2023 07:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517311.802465; Mon, 03 Apr 2023 07:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEou-0000ie-S8; Mon, 03 Apr 2023 07:41:40 +0000
Received: by outflank-mailman (input) for mailman id 517311;
 Mon, 03 Apr 2023 07:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEos-0000Sf-IM
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7281ec2-d1f2-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 09:41:37 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id t4so23024662wra.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:38 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:37 -0700 (PDT)
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
X-Inumbo-ID: f7281ec2-d1f2-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTX5AlYG9H9wezF7Huuxzz/nE/nKnDO8ny1qnuzLZhc=;
        b=mtSXWDOaZ+SoOSRY+/QyXRKvT4i+55X7WZtDYWMATiHisig086+0JsHukwNdiJId7A
         tFqxCAoC4RwIQJM009Vk+jfFfOFlaKQrlmk2bTXjnhvW4+CF9lMXfKv1wHR3ukRMZW6Y
         CQyFaG+VXbo7bsLaY3JNaZ0O5jKXrhP2qIEG72Vjgf8MVH9BIMi5d+VGm5MfsEvzCudI
         GyrjyuNPJZrO+zweLhjAv7NojvLIUzr0fIDB8FyORUM/z/yAaS2dYmbZmQwIZzFXhz4c
         p7LFtBj/nJrdJSF6L2IGVCFNtgwR5DHDosc59QA+1G+LMTWWcV3o/frA6tmQ3zvYZ538
         VF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTX5AlYG9H9wezF7Huuxzz/nE/nKnDO8ny1qnuzLZhc=;
        b=AaGVptg30OZFuThAwmbjtugwjA87nIW8QbuDTEHAzXmyftRhPKHE3q7M1ZaJomU6m8
         t/G6SZmG66qvyPNbGXlJdkm4Iw9WZfkDGTfPJWSvYwOvJpalESOk3t/xLJkTseM25M7J
         fWyK21RCy0VQ4VQwSGdSMN2vYvEogq0mpxhJujwotDzk1namkTN8YbAtG+KZp8kKA1MF
         XPxa/Yk/LcZuZAiMsSGZQkOAUKghYMa3BJbD5K8p1Y/KUCWYXRdRzi5fNXj2+ECJQc07
         bdM647XOqleZUkHQY1gBvV2gZG6JTyH7d1X9w7kvLG+FQUdkpWqZr5fyDCdWx4o1Yroe
         gq2g==
X-Gm-Message-State: AAQBX9caUHF64emzsEUrgQvyZk1mPrV+Munuk6rVUwq9r8nXpbbj9s6s
	TGVs+5GrHExRL8kI8c46Afw=
X-Google-Smtp-Source: AKy350aggVxi8ptGEF+kz7DCXq42gtEfYkUb6ffP2AHigP6K835TVXtAlFx6fFv21AA1vyoQLxAQyA==
X-Received: by 2002:adf:f388:0:b0:2db:46ad:7e82 with SMTP id m8-20020adff388000000b002db46ad7e82mr25915768wro.47.1680507697657;
        Mon, 03 Apr 2023 00:41:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 3/7] hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
Date: Mon,  3 Apr 2023 09:41:20 +0200
Message-Id: <20230403074124.3925-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a preparational patch for the next one to make the following
more obvious:

First, pci_bus_irqs() is now called twice in case of Xen where the
second call overrides the pci_set_irq_fn with the Xen variant.

Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-3-shentey@gmail.com>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 1b3e23f0d7..a86cd23ef4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -394,7 +394,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    piix3_realize(dev, errp);
     if (*errp) {
         return;
     }
-- 
2.40.0


