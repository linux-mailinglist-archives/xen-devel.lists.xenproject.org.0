Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9636B65B5
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508986.784072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPO-0003co-55; Sun, 12 Mar 2023 12:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508986.784072; Sun, 12 Mar 2023 12:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPN-0003Oz-Rk; Sun, 12 Mar 2023 12:02:37 +0000
Received: by outflank-mailman (input) for mailman id 508986;
 Sun, 12 Mar 2023 12:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPM-0002uS-3A
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:36 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6f2e221-c0cd-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 13:02:35 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id da10so38221300edb.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:35 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
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
X-Inumbo-ID: c6f2e221-c0cd-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWg4LuzaxWFvJH2Cc10WqoexJQmNb/n77OizqFG/hOg=;
        b=CRFIKihiG3gt5U7Bo9POrDRCvKcX7GhlR/4RrRquOq1v4D0aQQphgBlcVb+oKE619W
         Llu9/G1Ybdpw0CxHZULyucDFqERnJjlfCQ6QSuA1DH48U5evIEPeCz1tYTeXxEQicnHO
         IS83yQWd562FDvEzReKeF73BzrnwADN72svQtkzb/68v70DdxCeMuDCqdC1AogFwSo1U
         O7ZqtXNXZY0Lc9inLbJpjv1y5rww93LSySnMpjczQEdd+GZmmPxbYZ2Ncc95uROmaM2L
         e9pKi8P37Qdvbnfo7P80owlzihA6njd0jy1mHWVgE5ERWcrpXZ99qhFWb8leSlBPvvQ9
         GlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWg4LuzaxWFvJH2Cc10WqoexJQmNb/n77OizqFG/hOg=;
        b=c/4VGLY6yjkclaQuV2S0zFxQUkTJtt1Mtx0FLTbXVgDKt3UQcXkpfGYL7qjL8nAsuH
         UpO3vKPXbhtS3yPZA8HaMpJQ9vK0s5qFJUx0kNSyUTwO+PdCuVVTgyCQ/3LrNIuoyGdy
         0WPEeINT0snMrnPQ2BCo8syxsaJu0bKvAnVLK+q92/kPqeK/9Jj3VLqgXqQs9MMY2Dga
         b4qJvsaOypNeUWPvAfdDZpzTdo7zSFqR4z3MPuwk1qwWq+muiNuJyH1qfBwUnEVxR/dh
         CN1V3V045R0ArNlbUhlGdXdJUKVyGa9XjDB/0xP4kuY5tCHO7r8RA6wum3hc0eDKZ71a
         WYaQ==
X-Gm-Message-State: AO0yUKXpxuTBEKUfpcVdUwB3zbKS7G8uBM0ylFcxXrf8yT/Bcm+/UhS/
	GgvkP0EX3wpRnOAGsQ/fFJI=
X-Google-Smtp-Source: AK7set+8bU52UZ6EPZu8793oap+FG+WY4eM5GCpxYQgaKRcrzsOTsF85v6SrfshFWBQhYEm6N29wPQ==
X-Received: by 2002:a17:907:1905:b0:8a6:e075:e364 with SMTP id ll5-20020a170907190500b008a6e075e364mr30020126ejc.26.1678622555342;
        Sun, 12 Mar 2023 05:02:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
Date: Sun, 12 Mar 2023 13:02:17 +0100
Message-Id: <20230312120221.99183-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a preparational patch for the next one to make the following
more obvious:

First, pci_bus_irqs() is now called twice in case of Xen where the
second call overrides the pci_set_irq_fn with the Xen variant.

Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
2.39.2


