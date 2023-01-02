Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D818765B763
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470400.729915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTA-00045L-53; Mon, 02 Jan 2023 21:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470400.729915; Mon, 02 Jan 2023 21:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCST9-00041Y-WE; Mon, 02 Jan 2023 21:35:44 +0000
Received: by outflank-mailman (input) for mailman id 470400;
 Mon, 02 Jan 2023 21:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCST8-0003Wk-CH
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6765f685-8ae5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 22:35:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id m18so69165178eji.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:40 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:39 -0800 (PST)
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
X-Inumbo-ID: 6765f685-8ae5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZDEL8s6HWwEfgKMeGlSAkqHU0n7hORkrqT7smSJTVY=;
        b=GU3AYEhEt5HGHHUhKsuD0ojio6SvhzKD2dSKr64WYZjapbbSIsZnEZNRwIsilTaOUJ
         iGTkrUbs+yhPQyQgY/ZZpAiFqB4ecrRyGNQlNB9jjQAFyfPYYKyIu3p+2LAHxwhgitUL
         LedNWX6Boc+BkDPK3KEqCjyCurW61QmS5JrZOGNzDZwVGaY/3Bu50aDxQPLngHJylhPt
         wdEtW5D2xVHw3Vu4PphFdbdzXJQQT1bvsQyyOKRq9fDe6W81Cvgzz2lFPFByXTJL5t4o
         5CQ8Qo1pNIhYYxhrzpL7P7fjIZnzuZrFuUzHvPYI6ubpnIrjO06SV/rS4zJP0QG7PcyB
         Swaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZDEL8s6HWwEfgKMeGlSAkqHU0n7hORkrqT7smSJTVY=;
        b=QFU5oC71Yk5hHY3H/mWS4ZzcDTAPl9QJmWRDXZL/vYIu94oZrMi2UUeX9GvuBg054w
         l0NcjgtS0WiPe5tdOa5JaM/lKwO/G9BUL0RjYTmeHvuMzbwkJYyUod5szAYZpB7DkuP/
         DvUP8FGng4ovzsvOOy1DoSUxU/zdCt06RlJ3blF7fZgAeimbiBB8QRt6rdbCL8LQk7qe
         iu0xRlKY/0AKQqPYbYPgA1On3ED52tMEVy9HOQcDrkNxDJsjHeTNxPQQXafgr+zPYME+
         wJwQft0ubY7aDmpTm/2UkArG4KyzjTatRsraXO4wtOjmk9csNCqUsz+Oq9eoT1xPDTMF
         pg3A==
X-Gm-Message-State: AFqh2kq4QmGcSTQvY+RkxZNzHkCDxDBLfatipvHgcL1TZoOMbPxUs+lU
	JGOUpXl6NYgZYkufwyHwvaQ=
X-Google-Smtp-Source: AMrXdXtC/ibfuSlBrNsQnaQfyhwXLOGrgcrvGa+eum0cbe4JY/6WC6uF8ZpOR32bH9fWmLx0CvyqaQ==
X-Received: by 2002:a17:906:a1d7:b0:815:8942:dde with SMTP id bx23-20020a170906a1d700b0081589420ddemr45198684ejb.23.1672695340325;
        Mon, 02 Jan 2023 13:35:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/6] hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
Date: Mon,  2 Jan 2023 22:35:00 +0100
Message-Id: <20230102213504.14646-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a preparational patch for the next one to make the following
more obvious:

First, pci_bus_irqs() is now called twice in case of Xen where the
second call overrides the pci_set_irq_fn with the Xen variant.

Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index dc6014a4e4..a1281c2d77 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -493,7 +493,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
+    piix3_realize(dev, errp);
     if (*errp) {
         return;
     }
-- 
2.39.0


