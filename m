Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEE5BD812
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409018.651887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ29-0005Op-1Y; Mon, 19 Sep 2022 23:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409018.651887; Mon, 19 Sep 2022 23:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ28-0005LK-Tn; Mon, 19 Sep 2022 23:18:36 +0000
Received: by outflank-mailman (input) for mailman id 409018;
 Mon, 19 Sep 2022 23:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ27-0004vz-P6
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62212fbb-3871-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 01:18:35 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id y17so2189841ejo.6
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:34 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:33 -0700 (PDT)
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
X-Inumbo-ID: 62212fbb-3871-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ScsUFIDAHrm9/OPFECQYAYLcM3exK8eoaXsBNG48BMc=;
        b=bklrnXC+Q9cSo2FFOWfTXPpVHkz7irXkFbdyd6/BCU2xuyoZleDIoNMU8HijhM8/f/
         12oHjj6bdYlh8ovjo9fbo/AzzIKh/s88xDprTDDu6uVtD36FZCWsn66rd086C8EY+gRS
         b3PgE5tctP66cgHs7ldVIlsIuNOVQEBmmny+GbC5huXVVzJ4n4/hjoj0ooNBMuoyC7+/
         IwvCtApFdCbrV78O3C5mq3mtM7+Rv7m08+xwa8/kKzar8suXKXKnclqYu1UxttLqEop6
         3JIuCuLhTHc4skzYus3eB+AmX/fOGOrCA9D1UqE8mKBQsr1TgwZu8W5CRb5gZpTnS7Dn
         LqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ScsUFIDAHrm9/OPFECQYAYLcM3exK8eoaXsBNG48BMc=;
        b=SD+EpRo2IwRLrb91fLjcpIpSLREmrgQv8WSV6zsPiHmrnFJXW6RExsNwS+spciltHQ
         inEYruF8RKbIdstWDdLIiCUnKYl59b0qwNbvuyUsFsA3iVRKLc+4NxRntKEwN4pL1t8w
         9vEtgN88vMuCdK+wuS9cLKpYo02zmKCF0TxNAgMOPvL1d5+yt0P56d2iGP+SjfFkbIIG
         srBVDYjo0rcqdEoD/hsb0T8hgK8m+C+8yqaUc5X0GSWkqJDCTYiuih3BtFiltTRkLzBD
         c+1X/W3hNo/IomwvekZaXAncqus2ZSHlqBgaWhgZ7tbGjeXiQPp7VB02VbMlSuM/H3rj
         6plA==
X-Gm-Message-State: ACrzQf3Qn4lmojsr4aQvXIvrVNaLF/CPjqCHS3VHivRYwghH6Z7upxqj
	FFRJNL4ZneHe/jjR/GlqDsw=
X-Google-Smtp-Source: AMsMyM5zOFXr+h5fB5zVLEWuIudF3jkOWN1HVQ7NnRGDLPPjOGxYXkHu7b5fRJV74nWfwRAhpeBFrQ==
X-Received: by 2002:a17:907:7207:b0:77b:3647:c24 with SMTP id dr7-20020a170907720700b0077b36470c24mr14030221ejc.417.1663629514343;
        Mon, 19 Sep 2022 16:18:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bandan Das <bsd@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Sergio Lopez <slp@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Cameron Esfahani <dirty@apple.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Greg Kurz <groug@kaod.org>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	haxm-team@intel.com,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Helge Deller <deller@gmx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-riscv@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Alexander Graf <agraf@csgraf.de>,
	Thomas Huth <thuth@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eric Farman <farman@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Alexander Bulekov <alxndr@bu.edu>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	xen-devel@lists.xenproject.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Snow <jsnow@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <alistair@alistair23.me>,
	Jason Herne <jjherne@linux.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/9] hw/core/sysbus: Resolve main_system_bus singleton
Date: Tue, 20 Sep 2022 01:17:14 +0200
Message-Id: <20220919231720.163121-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In QEMU, a machine and the main_system_bus always go togehter. Usually
the bus is part of the machine which suggsts to host it there.

Since tere is already a current_machine singleton, all code that
accesses the main_system_bus can be changed (behind the scenes) to go
through current_machine. This resolves a singleton. Futhermore, by
reifying it in code, the every-machine-has-exactly-one-main-system-bus
relationship becomes very obvious.

Note that the main_system_bus attribute is a value rather than a
pointer. This trades pointer dereferences for pointer arithmetic. The
idea is to reduce cache misses - a rule of thumb says that
every pointer dereference causes a cache miss while arithmetic is
basically free.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/core/bus.c       |  5 ++++-
 hw/core/machine.c   |  3 +++
 hw/core/sysbus.c    | 22 +++++-----------------
 include/hw/boards.h |  1 +
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index c7831b5293..e3e807946c 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -129,9 +129,12 @@ static void qbus_init_internal(BusState *bus, DeviceState *parent,
         bus->parent->num_child_bus++;
         object_property_add_child(OBJECT(bus->parent), bus->name, OBJECT(bus));
         object_unref(OBJECT(bus));
+
+        /* The only bus without a parent is the main system bus */
+        assert(sysbus_get_default());
     } else {
         /* The only bus without a parent is the main system bus */
-        assert(bus == sysbus_get_default());
+        assert(!sysbus_get_default());
     }
 }
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..ebd3e0ff08 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1097,6 +1097,9 @@ static void machine_initfn(Object *obj)
     ms->smp.threads = 1;
 
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
+
+    qbus_init(&ms->main_system_bus, sizeof(ms->main_system_bus),
+              TYPE_SYSTEM_BUS, NULL, "main-system-bus");
 }
 
 static void machine_finalize(Object *obj)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..16a9b4d7a0 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
@@ -336,26 +337,13 @@ static const TypeInfo sysbus_device_type_info = {
     .class_init = sysbus_device_class_init,
 };
 
-static BusState *main_system_bus;
-
-static void main_system_bus_create(void)
-{
-    /*
-     * assign main_system_bus before qbus_init()
-     * in order to make "if (bus != sysbus_get_default())" work
-     */
-    main_system_bus = g_malloc0(system_bus_info.instance_size);
-    qbus_init(main_system_bus, system_bus_info.instance_size,
-              TYPE_SYSTEM_BUS, NULL, "main-system-bus");
-    OBJECT(main_system_bus)->free = g_free;
-}
-
 BusState *sysbus_get_default(void)
 {
-    if (!main_system_bus) {
-        main_system_bus_create();
+    if (!current_machine) {
+        return NULL;
     }
-    return main_system_bus;
+
+    return &current_machine->main_system_bus;
 }
 
 static void sysbus_register_types(void)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 311ed17e18..7af940102d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -346,6 +346,7 @@ struct MachineState {
      */
     MemoryRegion *ram;
     DeviceMemoryState *device_memory;
+    BusState main_system_bus;
 
     ram_addr_t ram_size;
     ram_addr_t maxram_size;
-- 
2.37.3


