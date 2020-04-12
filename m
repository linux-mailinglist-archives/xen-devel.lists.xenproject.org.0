Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61381A609F
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2020 23:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNjro-0007Jb-LE; Sun, 12 Apr 2020 21:10:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pqw0=54=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jNjrm-0007JW-Q3
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 21:10:10 +0000
X-Inumbo-ID: fc3c0584-7d01-11ea-b4f4-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc3c0584-7d01-11ea-b4f4-bc764e2007e4;
 Sun, 12 Apr 2020 21:10:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i10so8378368wrv.10
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsYbEjd4TD9Bp8EbfBEbuZbEWy++c7aKNJLdJ3YG81s=;
 b=F6MwD2LXNz5qSiQ9U7sN6titbvBTVPwW+WPnxAgReHxGMCEM+dPMLI2rDyI1SBuexA
 8X4en7LsPicU3CvVdJfUwpaYkWQJx/9JDE36m/vCG9tt4oNnclZvSGLtxDh9g2nqvVen
 egUlGG7jm5W4bkUTTQyk2IrVD5095MR2BaBB1nrA2tWvi4Uo2j7P5Aid8G1fMkGhrHgp
 3JcUjkFFHKzGHqOa5WPhvPjQa5uJtWQqbZ7u6YajqffuNp4Y4eS18QQqe3TejYDaLL/v
 NSSfd4k/Trj0zKPV1XsX0isvHEDohvQeLjdKEdbJp37tNHLfgAKiMGDBvJ9cRKFn6wia
 3pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gsYbEjd4TD9Bp8EbfBEbuZbEWy++c7aKNJLdJ3YG81s=;
 b=WRmDogn4LuWT0Xz02wTwnftnBgR3gI9W+VKWKb7W3oeV44FyjB3lHHWIfKb3KB2oAF
 OgvHcz9JMHP3yPHvXflG+Eo+0lcGoCP7eXf0RcrAnL86mqTc05St65n9n38w+9BFrn0d
 spcp9c/TmxHMTbuqCRULftW/zky8YtjK/uwCdrfs/HPhSLTVwOPdx6XOankDE4/7cBJ1
 9BJ5oESubbdIwInQHVXdekhdPyBq+sAsvpobVoML7FxHbginFxii6vS6SEh0Nk6ZHHd4
 gdXAUzfQ2JzcMSpOtGSQ0+D841syz2yOx+CDMT2UmQkfD36pwkGInQoah14BfJKwL7rY
 4uwA==
X-Gm-Message-State: AGi0PubCGJzTPiDng7EvtoeeC/eyA7no0wvbH/ylwI1EYjoPXt4jyESp
 RBJsQjTnKgFgbvCzp+9sd24=
X-Google-Smtp-Source: APiQypIWuuzEDhgrL5dFuOMcEExPN7XGYetuwcVi65TL0H1PSMXhw1g00339hVtTvTn98WKI8byMwQ==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr15764392wrw.307.1586725806483; 
 Sun, 12 Apr 2020 14:10:06 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:10:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 2/3] various: Remove unnecessary OBJECT() cast
Date: Sun, 12 Apr 2020 23:09:53 +0200
Message-Id: <20200412210954.32313-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The OBJECT() macro is defined as:

  #define OBJECT(obj) ((Object *)(obj))

Remove unnecessary OBJECT() casts.

Patch created mechanically using spatch with this script:

  @@
  typedef Object;
  Object *o;
  @@
  -   OBJECT(o)
  +   o

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
index f0c35aa57a..bae9d2350f 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -288,7 +288,7 @@ void s390_sclp_init(void)
 
     object_property_add_child(qdev_get_machine(), TYPE_SCLP, new,
                               NULL);
-    object_unref(OBJECT(new));
+    object_unref(new);
     qdev_init_nofail(DEVICE(new));
 }
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c45fa490f..57af5fa5a4 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1839,8 +1839,7 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
 static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
 {
     GSList **list = opaque;
-    DeviceState *dev = (DeviceState *)object_dynamic_cast(OBJECT(obj),
-                                                          TYPE_DEVICE);
+    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
 
     if (dev == NULL) {
         return 0;
diff --git a/qom/object.c b/qom/object.c
index 1812f79224..9893cc5459 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -762,7 +762,7 @@ Object *object_new_with_propv(const char *typename,
         }
     }
 
-    object_unref(OBJECT(obj));
+    object_unref(obj);
     return obj;
 
  error:
@@ -1689,7 +1689,7 @@ void object_property_add_child(Object *obj, const char *name,
         return;
     }
 
-    type = g_strdup_printf("child<%s>", object_get_typename(OBJECT(child)));
+    type = g_strdup_printf("child<%s>", object_get_typename(child));
 
     op = object_property_add(obj, name, type, object_get_child_property, NULL,
                              object_finalize_child_property, child, &local_err);
-- 
2.21.1


