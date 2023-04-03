Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16606D3E45
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517310.802458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEou-0000iz-Md; Mon, 03 Apr 2023 07:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517310.802458; Mon, 03 Apr 2023 07:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEou-0000Xy-G9; Mon, 03 Apr 2023 07:41:40 +0000
Received: by outflank-mailman (input) for mailman id 517310;
 Mon, 03 Apr 2023 07:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEos-0000Sg-Jq
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f686a8af-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id m2so28256759wrh.6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:36 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:35 -0700 (PDT)
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
X-Inumbo-ID: f686a8af-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2bxbqf6j4QPQJIwH9ivxbi0oLjhsXkO+rq7lp2Eh9U=;
        b=WC5szrsbsTKCY9H3NIUWRSbAOse9TsOnH1X01M7jJFEyCnqYih84GDL/KdBhBXgvfZ
         cxx71VQpcKF9zWdzMnSbkpc1hfesym5CJWKDjgWmFqmwEAZxtxhq8nOHsCyYPynIYrS9
         BaLfK4jsrhCeSuXHGsXYL7fNzlE5hnc0hfC+2XsB/zKpBEIWgD6sfzdiEyxE4zaNCnEv
         162tllbbB0sUjNuop5fu0nl/n19meZoUfNaKBn50XCNcWvdCal884QeT/q0SEepuboYT
         CVmM6NveJXfoFPYDUH3UGFCSnAI2AjW/EN4i3xu23N5hvy6np1jlESM9iiQdcFx39cPw
         K01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2bxbqf6j4QPQJIwH9ivxbi0oLjhsXkO+rq7lp2Eh9U=;
        b=LhOJ1lrSYnxj9MUFQKCgjRAj4wr02EKrwj0qKL4X0Q1KJ6nnICaPdUCcN83T8IibM5
         OC+Rw7sovmPOurnDKhNCYvMU4jGl7C1z6N+813c3+bREstJvF5T4cp+bgw9ox981fj9F
         SXkmRGdJpvr6F638m5Wh20ROF4bUF0uI/81/DWJsko4WOQtBbVoQUNJvUFBivV23gTE9
         ImdwRgEo08kqM7gi+PZ2lGDJNj1ugsutJ1PFgbENyHeGyam153ZwxgFwPcL3Jr4r/MnP
         8n+JBC9zZL2jZO73i8j/15Cl2yzn0+LljrmWM1Rm70tYL1LCC+MGkNimz4Suc7ctOtPN
         rMyw==
X-Gm-Message-State: AAQBX9e6sQsde7vVErMC/G6l2yhvuNy3gBcdboCWV/dCPuzxYhE7UP8k
	OBb4IvexUDRVN5Qg/BfLn5E=
X-Google-Smtp-Source: AKy350a8w/UjVGBXm/IvW1eiUEjt7WBOj3GvSpZIn/V9+4KAg1DkfQwNZGfsneF3GohAYNphgxwWGA==
X-Received: by 2002:a05:6000:ca:b0:2d6:5afe:7b91 with SMTP id q10-20020a05600000ca00b002d65afe7b91mr11692241wrx.30.1680507696091;
        Mon, 03 Apr 2023 00:41:36 -0700 (PDT)
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
Subject: [PATCH v4 2/7] hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
Date: Mon,  3 Apr 2023 09:41:19 +0200
Message-Id: <20230403074124.3925-3-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling pci_bus_irqs() multiple times on the same object without calling
pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked.
Let's fix this because Xen will do just that in a few commits, and because
calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome.

Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
pci_bus_irqs() doesn't do a double free.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..be1c5d16ec 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
     bus->set_irq = set_irq;
     bus->irq_opaque = irq_opaque;
     bus->nirq = nirq;
+    g_free(bus->irq_count);
     bus->irq_count = g_malloc0(nirq * sizeof(bus->irq_count[0]));
 }
 
@@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
     bus->irq_opaque = NULL;
     bus->nirq = 0;
     g_free(bus->irq_count);
+    bus->irq_count = NULL;
 }
 
 PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
-- 
2.40.0


