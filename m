Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE75268FF
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 20:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328677.551764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjv-0005sf-5h; Fri, 13 May 2022 18:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328677.551764; Fri, 13 May 2022 18:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjv-0005nz-0F; Fri, 13 May 2022 18:10:11 +0000
Received: by outflank-mailman (input) for mailman id 328677;
 Fri, 13 May 2022 18:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eu56=VV=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1npZjt-0005kx-Su
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 18:10:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec4ee4e2-d2e7-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 20:10:08 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id j6so17685722ejc.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 11:10:08 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:08 -0700 (PDT)
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
X-Inumbo-ID: ec4ee4e2-d2e7-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/cQH/1Zw9GFUPtTbC8zhxsJeeQwE0nxDRipyyaTmMk=;
        b=nJbHxWaET9J2XSZE+M5dxA8DbQG9coK769SMpj9GQeA6B5MYfqK0lpTZcTTjHsEoB2
         YsduPUN8KjpCjR1DlXYGnacXqjJvn7IpxP4QJwwabsXwlB2JehTlehcQWwm8++WmkHfw
         zMKKJEq7lkxDz9bynvEtBKYjR8DZFnZ0q1rIZLCNHjl5MEiaHmg2/Pua8eTz0e5i/K0s
         O35/MwMsvzGnN1SNER3JYxYIq1A0gTWG/4Mf4U0UOVAfyKazUT1wcSm0RnH/KlFTIpPO
         ezpSVliTQlXlbntvSNatMSPlv39fsevETfJV20FcGkLi7qNZ1UwkQcUejQEj+ufSI0cT
         RTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/cQH/1Zw9GFUPtTbC8zhxsJeeQwE0nxDRipyyaTmMk=;
        b=FTVttHFuUlvijRcgSuVuUeCt1nZAe9YhyxuQyNNIZv7CN3Bgq7ag/0ASzAqtz5IWbN
         rkG6XVkQOAJRqyjwYvgBb1Z/JjG07qGtTDtRDLNsPt77fGLAXKgd/9IPHi/pn65BwNAq
         gL9EmvLd/4r/W+e31UpLCxUT6hBVQa2UgbtuJIq065VhpwXCXNnFSGJlcRxDhq/O85Ir
         UV6OdN1TnYAOwXlRhZ0+vsy9lc4Y6tofK7+tokmB3hXWu5+1BUCwsoz9kUQa8yXLqNCi
         vW+p2l3RB1reGhKdAr1cCCXjENXHP36mcGpahvfHVMTnL/IL2sykWnN0+AQH26VqKDEN
         C0UA==
X-Gm-Message-State: AOAM531gVxEFe7t8Q6SKE6MyydRHOPROG8SylFeFOpby1k39DbXXjxiR
	pdvF++Gwk1jsSZKvOJMx8k4=
X-Google-Smtp-Source: ABdhPJzCkBRWOB3k5QAtg0VncyWPkLbOceUIGxvuo0vGktR8YMH06iLzsWamhF0MqDhovZ65RgZoVQ==
X-Received: by 2002:a17:907:2064:b0:6f4:3f07:c76e with SMTP id qp4-20020a170907206400b006f43f07c76emr5383734ejb.462.1652465408332;
        Fri, 13 May 2022 11:10:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device class
Date: Fri, 13 May 2022 20:09:55 +0200
Message-Id: <20220513180957.90514-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
generic class init function' already resolved redundant code which in
turn rendered piix3-ide-xen redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 +--
 hw/ide/piix.c     | 7 -------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f843dd906f..c2bf33d2f1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -244,8 +244,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
-                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..2345fe9e1d 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -241,12 +241,6 @@ static const TypeInfo piix3_ide_info = {
     .class_init    = piix3_ide_class_init,
 };
 
-static const TypeInfo piix3_ide_xen_info = {
-    .name          = "piix3-ide-xen",
-    .parent        = TYPE_PCI_IDE,
-    .class_init    = piix3_ide_class_init,
-};
-
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 static void piix4_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -272,7 +266,6 @@ static const TypeInfo piix4_ide_info = {
 static void piix_ide_register_types(void)
 {
     type_register_static(&piix3_ide_info);
-    type_register_static(&piix3_ide_xen_info);
     type_register_static(&piix4_ide_info);
 }
 
-- 
2.36.1


