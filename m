Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D476A1C4CE
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877012.1287242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfb-0005tP-3o; Sat, 25 Jan 2025 18:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877012.1287242; Sat, 25 Jan 2025 18:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfa-0005rb-WD; Sat, 25 Jan 2025 18:14:11 +0000
Received: by outflank-mailman (input) for mailman id 877012;
 Sat, 25 Jan 2025 18:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfY-000565-Th
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abdfab3-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:14:07 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso32316685e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:07 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857c3sm68307685e9.10.2025.01.25.10.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:06 -0800 (PST)
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
X-Inumbo-ID: 2abdfab3-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828847; x=1738433647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyOkRsNGVEWSIU/g0zj3C7+UfvVjzQgLwIYDoErjrzY=;
        b=E3O265wl8yaUU469AX64Lx2fHgrT11jgPvGuwnNbs2wApqv2zuUVgkd+ZrCcHWzbM9
         nuyw1pl9S3/SGydU1n4FEQkHTZsiIn2G47jTsnv1ckFrstQHyVBvQMz97zeIBRnDcGGv
         fBNp9dx2OkOGMJej9nItABW5MVvQJ4hy1DsdkT6Lr+NUi5/PNLq7lrg4GvgL4o3gqqql
         yz6Fec8OtOElEzfzMHdqt3qWT9vYR4bAlQOWnV/ZZhiqOw09spIhL8HtdlwISu32SCXG
         3VERGi0PMk8dIp/1dB5kCAZWYUeMeeMRw2WSpnmoXsj7PST+0dz58etulVZHCfR+5T7G
         jMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828847; x=1738433647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyOkRsNGVEWSIU/g0zj3C7+UfvVjzQgLwIYDoErjrzY=;
        b=h4LxTu31Svs5wse0ClHatCNPvzJjf2/ylBctYZwijYPYY3si4YYbL/PtW30ZRntQ9W
         ZZAPR2QDHL/usRKB26UlzJ6r14gjghKAhe51BERYPhsdvpIb3Lra7T11YZ2A7tanyDjo
         wII+1DHMGwmmmK2bDtmKU/FC9j3hZF+9NRFf15b+5Kq4TpdRlPglJUp/plkDoDL3HJwM
         VSP2dvvSSDE8UamZsgltB9AKm3XWtZgU+cLR8gBXihaFzn1Y4/q0J+mrSOsNxv+q5ojt
         /T1m7XZtkYmJN8gVPPNn11bH2uyLUMncQlo1FgbF6A5CxUEYCV5J1pmfva4E0QpReDhy
         LqOA==
X-Forwarded-Encrypted: i=1; AJvYcCWvH5oNEE6kesSQPUmc8gwMEAsOb0ByRbnRM4+OGHF4Q70glcTw4AkGFi0QuMbHa+2Ayl7JMF1jo68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHTLGjFrv+XELr7wZKoXqGUOHp68I0a5rBIKnvEHoHYGhUyCEU
	+Nt45C0J8dhzBteka9c/cZgoD2qNleD/7bai5ht/UCD44QyGjxsmkrV2QAnzYOk=
X-Gm-Gg: ASbGncueZI9WCvpTZEWH6bRl7tPNeZ9YERv2TxwhJXJb5ljXkSZhViWAa5EdlLcDbbi
	X2A9rDoFdiXBNHg6XyCiWCU320hrUi4C18xlogxUB1py73TC4n77dZr//2SjFG1DT5+ecbUWNlR
	X7dZ4wbPapr0wqnJm7U6aMuO2CHeXMqYgK0JP2wizTYrPljzCUdAdWVfEyMN5JpmtppfKqO6YFC
	/qn4rEc5bTkv4LNnZveFzogViDkkPzJ07cR408jjI92vSRsS/ODiyGJojh4aFdKyC60985/21i3
	M4Y6/uybwhirkxOTK5jMURmdG3vwxFv8rIMdqb5vW0Q4KuytN2ysErF+xaWm
X-Google-Smtp-Source: AGHT+IEr2qoA1rRQRSxzBRg9AaVRyh1DsB0c2e066JVheh7W35FZo8o118MnJ47nSIRaQRkoz3MpFg==
X-Received: by 2002:a05:600c:468d:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-43891437546mr293523335e9.20.1737828846888;
        Sat, 25 Jan 2025 10:14:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/9] hw/vfio: Have VFIO_PLATFORM devices inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:38 +0100
Message-ID: <20250125181343.59151-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not explain why VFIO_PLATFORM devices are user_creatable,
have them inherit TYPE_DYNAMIC_SYS_BUS_DEVICE, to explicit
they can optionally be plugged on TYPE_PLATFORM_BUS_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/amd-xgbe.c      | 2 --
 hw/vfio/calxeda-xgmac.c | 2 --
 hw/vfio/platform.c      | 4 +---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
index 96bd608b8dd..aaa96903db0 100644
--- a/hw/vfio/amd-xgbe.c
+++ b/hw/vfio/amd-xgbe.c
@@ -41,8 +41,6 @@ static void vfio_amd_xgbe_class_init(ObjectClass *klass, void *data)
                                     &vcxc->parent_realize);
     dc->desc = "VFIO AMD XGBE";
     dc->vmsd = &vfio_platform_amd_xgbe_vmstate;
-    /* Supported by TYPE_VIRT_MACHINE */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_amd_xgbe_dev_info = {
diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
index 87c382e7361..b016d42b496 100644
--- a/hw/vfio/calxeda-xgmac.c
+++ b/hw/vfio/calxeda-xgmac.c
@@ -41,8 +41,6 @@ static void vfio_calxeda_xgmac_class_init(ObjectClass *klass, void *data)
                                     &vcxc->parent_realize);
     dc->desc = "VFIO Calxeda XGMAC";
     dc->vmsd = &vfio_platform_calxeda_xgmac_vmstate;
-    /* Supported by TYPE_VIRT_MACHINE */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_calxeda_xgmac_dev_info = {
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 1070a2113a1..f491f4dc954 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -672,13 +672,11 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
     dc->desc = "VFIO-based platform device assignment";
     sbc->connect_irq_notifier = vfio_start_irqfd_injection;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    /* Supported by TYPE_VIRT_MACHINE */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_platform_dev_info = {
     .name = TYPE_VFIO_PLATFORM,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .instance_size = sizeof(VFIOPlatformDevice),
     .instance_init = vfio_platform_instance_init,
     .class_init = vfio_platform_class_init,
-- 
2.47.1


