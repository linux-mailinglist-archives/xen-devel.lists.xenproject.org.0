Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D465D667
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471203.730963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51E-0007SF-D5; Wed, 04 Jan 2023 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471203.730963; Wed, 04 Jan 2023 14:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51E-0007P7-8S; Wed, 04 Jan 2023 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 471203;
 Wed, 04 Jan 2023 14:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51C-00079b-56
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:26 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c262db5-8c3e-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 15:45:25 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id s9so1187925wru.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:25 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:24 -0800 (PST)
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
X-Inumbo-ID: 6c262db5-8c3e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skngD2C07lkAR57VFiC9hSpSkRXE8QLpJkhdrtzHaoE=;
        b=fglIPWzWe7OF+ReYiVQjbIlqvtMvTu/HBo031zXX2Dmr6PoRqVzCCMudfgPYd4aGRi
         ZzXHYC+LUG8aYoxMQ2QopDZUsHWe8+I3MBPfz33YHbBlA0wpSiPunpMSxDNEQu3gic8o
         tjY9LXxtHVjsr5RFAPk3J091DyzHz40da+k0hi4YR2NRpwGdMpmrPobxn+rII4pfszR+
         ABmHKixdWzp6dCP+vGUOG1X6vLOHELWO4oX1VeVkM5l0HNpdBbKdWd/OSHzgbTTCC2Ov
         ZZVVZUIoXft/7/vDq3sRETSoVxCTNiDIkVm5XL0QJYkZbABRQHyxfDTifj0y4vNNeuN2
         dMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skngD2C07lkAR57VFiC9hSpSkRXE8QLpJkhdrtzHaoE=;
        b=kg0lubPSIw99ddQbqcMxO2UKuAKQ487UQqg1qktYtMniSR30oTmTs6q81N4JP3eI0i
         yFw91Zu6sCl2XRa9ZFvPZ18DHKcsprpvXjsrmryo8kvWMKXUI5ou/U0cd3G7qUxd9JpH
         ZGmouFnqsOi62gtiFCCMUnmBLW8OoFovgUYsU1UI4xBVD50mlseRbgp0acqoIJ0MfqiG
         loIRgnik8o6qPN7piuSN7sTDXdy7HEUZmdfoynvAdPrpX8g/aRexww5q/5W25s1SL6hT
         P0OwQmVUxJvx/RjpTYnQMfT81mJN7SwcJI33tn1MJ5vwbNnO+ArJWRhMXNG8Nn77on6l
         O2fw==
X-Gm-Message-State: AFqh2kpk7jXHU7ldk5yEkqrkdWIhooaAqwZc42X8ny+AtmfkiQjkJ2jn
	NKmD4AgHlgHcPMoGb3fg2Io=
X-Google-Smtp-Source: AMrXdXsN3egZuow7sNDCctPG+VunNJGlKj4E12ZlT9Um1FBGzDz97HrRjJAVFxuMN8+oPIQ6UyZajQ==
X-Received: by 2002:adf:fa0f:0:b0:28f:b480:f4 with SMTP id m15-20020adffa0f000000b0028fb48000f4mr12954011wrr.12.1672843524496;
        Wed, 04 Jan 2023 06:45:24 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/6] hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
Date: Wed,  4 Jan 2023 15:44:33 +0100
Message-Id: <20230104144437.27479-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
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
index a7a4eec206..25707479eb 100644
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


