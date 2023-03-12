Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB66B65BF
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508991.784127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPU-0005Ih-DS; Sun, 12 Mar 2023 12:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508991.784127; Sun, 12 Mar 2023 12:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPU-00057s-2n; Sun, 12 Mar 2023 12:02:44 +0000
Received: by outflank-mailman (input) for mailman id 508991;
 Sun, 12 Mar 2023 12:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPR-0003B1-12
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c928b590-c0cd-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 13:02:39 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id er25so9992692edb.5
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:38 -0700 (PDT)
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
X-Inumbo-ID: c928b590-c0cd-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeEvGg++lFeh8k7cLusk/ewqgWO+0IihMJjULI+D8m0=;
        b=qcpoFIQ+HklRYXLIh6GPxiw1QBLKylV/h/epwSeIgXeIYsgzhFld/1jrTl4ToJk8nj
         amsn4w4tAi/0k5NoN0R+S4Ad9xbPurvtz099V7SwD3T8zg8uJsgiM1cy6l3KYVnOh6l6
         MZEreKMsK56ei5NEALPkXT0jKZG0b/eMDNSVgll5fU0uBn1z1UwHwdS+44xV2ylDDV7v
         rSHlYUEMLc75x8ezNSNwYDzIJyRuYg04bHSU//6HGu8TiIdi3mQ1uPri0dwvWBEaoi70
         ccc2eKvSCLY8k+suJMkrbhaI7HDGtyt5eFrq62yDUW3cY0BNf+rMFfOivEsua/+1+ye0
         YdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeEvGg++lFeh8k7cLusk/ewqgWO+0IihMJjULI+D8m0=;
        b=wgDh9q2nRSKNwMYUvnV3BYoiox7NzCtrFGkF7m7uHq4wkP5p4gu8gVEvQpGF2jS6NN
         mbYDxotePycv0f5q11EDyE/78iC4wtLHuXshLeUZfJ7unk37HBXtm/juTqnsDPuj/zC+
         d1sTM8dCm/F4F5MpjnmzkzDBgWQVhm0SKRNwl0IdDhYQIr/Wc7Wi42hv93FeAo0VNavz
         +XD82QOqtOPv3JosVFEKAVd40d9AjdcqOGgcrz0ajjJlPEvlyIOW/rEsO2UeL0tfv2BM
         DdS7VGneGgA2vbOwH4cBGVVeMYsby5TMdwJNfVYNCIxcBIODTMPxFPE8RtVbloZmioDf
         4S0A==
X-Gm-Message-State: AO0yUKU6d0fChwLH5ayI38id7rILqTKeIXiKwXn2JQBllC3QxEEAj+ps
	3rKuEZA5mQknTBRsP1xNolQgTPHhIg0=
X-Google-Smtp-Source: AK7set98iz+H2osc7xMl+ULgZZLU6IRoBeyuhWbYGxcktAEzZ9GIUquNW3UPb5oD9vNj3FFNI/TtYw==
X-Received: by 2002:a17:907:608d:b0:88c:a43d:81bc with SMTP id ht13-20020a170907608d00b0088ca43d81bcmr37010919ejc.58.1678622559115;
        Sun, 12 Mar 2023 05:02:39 -0700 (PDT)
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
Subject: [PATCH v3 5/6] hw/isa/piix3: Resolve redundant k->config_write assignments
Date: Sun, 12 Mar 2023 13:02:20 +0100
Message-Id: <20230312120221.99183-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch unified handling of piix3_write_config() accross the
PIIX3 device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 737f5c6a5d..418940139d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -308,6 +308,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix3_write_config;
     dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -356,7 +357,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
@@ -370,7 +370,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.2


