Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F161CED71
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 09:01:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYOu5-0004PQ-SW; Tue, 12 May 2020 07:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB0z=62=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jYOu4-0004PK-Gf
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 07:00:36 +0000
X-Inumbo-ID: 45568d56-941e-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45568d56-941e-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 07:00:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z72so12371510wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txIDyB7XC8tZKLfnlalgGrEM/4fVGjUtnwmnJEocRGA=;
 b=BUmdZMezX1+Z5MKQa9G7TP6V/232cCpjbA6TQUHmvPfH6RjhjqjWRwVYH/NFRReXvh
 R/9gEFCAIepjicSrtqaLV3k3jM6FT7+u3R6Jgbff7mLr4eQ/aBT4AjbxdGFxKeOHpE/1
 OZctIeOuzbH5ZIseuZ9mjbtL/MqFJqOqFCURnWNrhoCkYfZaPKM8WOWYNosQlpCwcCrB
 U0Ggsy3SBNsNOr0lb5CAQ/EoGyxjvqWAWIpkg7DvEb9/NLTd9xXqqnZoMwGzGB5qI966
 3XiAONBjxmg2n1UcePsLclE2GhSywWgJtcmSpEBGdsDWHr7kmFCFWNh57w/5tZT3kg85
 ZkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=txIDyB7XC8tZKLfnlalgGrEM/4fVGjUtnwmnJEocRGA=;
 b=EKlSKP/sFFy4Wbp26fAYYZU7ywRQiNnxecPYIb2BXSszUposua6i3FPMyq9VRd83Do
 5vug4VaZg7uMTMRZA9YfwPQCMfwXfHrW2BwQGcT38WS3dWiJlJsgDENHgqP4JaDGJ/4z
 nzwYT9+WZjvuZuPIxkIU0BRqTPJzeUznwGPOVPetB24oy/zC3aCa6OhvGiuUFplWoo2D
 u1lNqTrKPXFNunPY/dkNEha9lt/4m8quXiggIgHBgbSHeHwVrjKzPNiF0j+nxAApNiPo
 c8E2DfzrDKV2MplljggTJAREy2d6lHvrwr7IZqt7p+OZ8XvvmepCXhnqhEuqQbCtgxfj
 +VLQ==
X-Gm-Message-State: AGi0PuZt7AUbpSU74T9kBnfFq6/DFnu8hR4BmQ6lVr8ln/ML5QOF5xlS
 iYDcY/Dqdoercjdaaur/AsY=
X-Google-Smtp-Source: APiQypJE9nNwBRqddbh239Y2LT2ofMC3xojGfMdo2Ac3ymnEIbCGjV+p6ybl8OCjnG82fAIykC+wEw==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr33504111wmi.64.1589266831768; 
 Tue, 12 May 2020 00:00:31 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] various: Remove unnecessary OBJECT() cast
Date: Tue, 12 May 2020 09:00:19 +0200
Message-Id: <20200512070020.22782-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512070020.22782-1-f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The OBJECT() macro is defined as:

  #define OBJECT(obj) ((Object *)(obj))

Remove the unnecessary OBJECT() casts when we already know the
pointer is of Object type.

Patch created mechanically using spatch with this script:

  @@
  typedef Object;
  Object *o;
  @@
  -   OBJECT(o)
  +   o

Acked-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/bus.c                       | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/s390x/sclp.c                     | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 7 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 3dc0a825f0..4ea5870de8 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -25,7 +25,7 @@
 
 void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **errp)
 {
-    object_property_set_link(OBJECT(bus), OBJECT(handler),
+    object_property_set_link(OBJECT(bus), handler,
                              QDEV_HOTPLUG_HANDLER_PROPERTY, errp);
 }
 
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index bb8393d2b6..8536b9eb5a 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -90,7 +90,7 @@ static void allwinner_ahci_init(Object *obj)
     SysbusAHCIState *s = SYSBUS_AHCI(obj);
     AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
 
-    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
+    memory_region_init_io(&a->mmio, obj, &allwinner_ahci_mem_ops, a,
                           "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
     memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
                                 &a->mmio);
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index 2a9470d9df..f1a0148755 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -329,7 +329,7 @@ static void smbus_ipmi_init(Object *obj)
 {
     SMBusIPMIDevice *sid = SMBUS_IPMI(obj);
 
-    ipmi_bmc_find_and_link(OBJECT(obj), (Object **) &sid->bmc);
+    ipmi_bmc_find_and_link(obj, (Object **) &sid->bmc);
 }
 
 static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 0a2640c40b..52dcea9abd 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -150,9 +150,9 @@ petalogix_ml605_init(MachineState *machine)
     qdev_set_nic_properties(eth0, &nd_table[0]);
     qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
     qdev_prop_set_uint32(eth0, "txmem", 0x1000);
-    object_property_set_link(OBJECT(eth0), OBJECT(ds),
+    object_property_set_link(OBJECT(eth0), ds,
                              "axistream-connected", &error_abort);
-    object_property_set_link(OBJECT(eth0), OBJECT(cs),
+    object_property_set_link(OBJECT(eth0), cs,
                              "axistream-control-connected", &error_abort);
     qdev_init_nofail(eth0);
     sysbus_mmio_map(SYS_BUS_DEVICE(eth0), 0, AXIENET_BASEADDR);
@@ -163,9 +163,9 @@ petalogix_ml605_init(MachineState *machine)
     cs = object_property_get_link(OBJECT(eth0),
                                   "axistream-control-connected-target", NULL);
     qdev_prop_set_uint32(dma, "freqhz", 100 * 1000000);
-    object_property_set_link(OBJECT(dma), OBJECT(ds),
+    object_property_set_link(OBJECT(dma), ds,
                              "axistream-connected", &error_abort);
-    object_property_set_link(OBJECT(dma), OBJECT(cs),
+    object_property_set_link(OBJECT(dma), cs,
                              "axistream-control-connected", &error_abort);
     qdev_init_nofail(dma);
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, AXIDMA_BASEADDR);
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index ede056b3ef..4132286db7 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -322,7 +322,7 @@ void s390_sclp_init(void)
 
     object_property_add_child(qdev_get_machine(), TYPE_SCLP, new,
                               NULL);
-    object_unref(OBJECT(new));
+    object_unref(new);
     qdev_init_nofail(DEVICE(new));
 }
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 9723b466cd..f5207cd242 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1837,8 +1837,7 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
 static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
 {
     GSList **list = opaque;
-    DeviceState *dev = (DeviceState *)object_dynamic_cast(OBJECT(obj),
-                                                          TYPE_DEVICE);
+    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
 
     if (dev == NULL) {
         return 0;
diff --git a/qom/object.c b/qom/object.c
index be700e831f..07c1443d0e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -762,7 +762,7 @@ Object *object_new_with_propv(const char *typename,
         }
     }
 
-    object_unref(OBJECT(obj));
+    object_unref(obj);
     return obj;
 
  error:
@@ -1687,7 +1687,7 @@ void object_property_add_child(Object *obj, const char *name,
         return;
     }
 
-    type = g_strdup_printf("child<%s>", object_get_typename(OBJECT(child)));
+    type = g_strdup_printf("child<%s>", object_get_typename(child));
 
     op = object_property_add(obj, name, type, object_get_child_property, NULL,
                              object_finalize_child_property, child, &local_err);
-- 
2.21.3


