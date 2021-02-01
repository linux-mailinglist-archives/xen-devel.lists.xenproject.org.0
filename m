Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A505D30A688
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79778.145361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOw-00039H-Pu; Mon, 01 Feb 2021 11:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79778.145361; Mon, 01 Feb 2021 11:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOw-00038c-Ko; Mon, 01 Feb 2021 11:29:50 +0000
Received: by outflank-mailman (input) for mailman id 79778;
 Mon, 01 Feb 2021 11:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOu-00036P-Gi
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:48 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02531718-cdf8-4ae8-bf42-0f67091f6174;
 Mon, 01 Feb 2021 11:29:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a1so16191228wrq.6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:47 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r124sm21261633wmr.16.2021.02.01.03.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:46 -0800 (PST)
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
X-Inumbo-ID: 02531718-cdf8-4ae8-bf42-0f67091f6174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s9rQaS8UMqNJGneEaOHvqNQyzFShTSgQ9o1efcMMfnw=;
        b=vN5Dbc8LEBoxXzt4TOZpKQUfFP4d0DUrmJzsY8jZ30ugvsjqLnSTGDuzM7H5Fyrk3f
         abS4D3Ay2zNaJBSGMTGCJOBMPB0RMUXJbL6yqIkQ/k8U3aKlUwIlyhW30wiOETsY+lUU
         VJdwwEkBARJ7eV715aeJDCjTlEzuJ7ft/zc1y32IFpIdtIEhNETmDDSyBCzd5/cL7xO9
         U50ggDjlwUQVizGN8vef1jmyXmIUVrOW/c4xcMiNqJGCJsnBZXQULkYBB67vLBH/7B24
         jEj/VTilekOmxsfiANyo+i9GfbpLzhVXb7nSmdL0Jut2lRCZzFBDzUvdQG9EI5wxHfm6
         AB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=s9rQaS8UMqNJGneEaOHvqNQyzFShTSgQ9o1efcMMfnw=;
        b=jdxjho9T4umlDKls6BvODSQVlQZWgKQkYvkyHmHHJQKQIo9obKP6GCIQGFBMyrVmgq
         kDx6V+K1XacEXF+AepqwU4DfAyEW1OoExll6AsaWM8Nn/6nLc+1VuSM971aJQnV/ltVG
         haTnvI3A5yhjp6GWdCtRndse8bflVq3CuFWZorUb55fB4iHedpK0Y93gJH73bfJO5Vpc
         DO/g5HwAfWIFuU07APb4q7bcubrKFjndQ7A1hXrt93vZuTJrmGtWGXwDQJhnh6XI00R9
         eCviMTI+zqrlDxNoUVRnhMVMoN5mja5/WvxOwTtnNVpfZptodUTssqm4puva+8DFJTpF
         SdlQ==
X-Gm-Message-State: AOAM531YiuG4fBemiDDLQvLjiThwpGpUHofdTYWPCzZRyuG/buoglurk
	5th8ePDKR8CRR99IwOsW9rc=
X-Google-Smtp-Source: ABdhPJzAYGwF+J2Ou4s+1HcJL36utLf3MJcMRSzDMAwMwQQaTKhKo5Am9QETvwv7os+GbvBC+C3N8g==
X-Received: by 2002:adf:bc4b:: with SMTP id a11mr18119220wrh.260.1612178986887;
        Mon, 01 Feb 2021 03:29:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 7/7] NOTFORMERGE hw/xen/Kconfig: Introduce XEN_PV config
Date: Mon,  1 Feb 2021 12:29:05 +0100
Message-Id: <20210201112905.545144-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xenpv machine requires USB, IDE_PIIX and PCI:

  /usr/bin/ld:
  libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
  hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
  hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
  hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Unfinished:

/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `ram_block_add':
softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
`cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

TODO another day: Paolo's suggestion:
"modify xen_hvm_modified_memory to become a virtual function in AccelClass."
---
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..f2a95591d94 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -39,6 +39,7 @@ source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
 source watchdog/Kconfig
+source xen/Kconfig
 
 # arch Kconfig
 source arm/Kconfig
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 00000000000..0b8427d6bd1
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,7 @@
+config XEN_PV
+    bool
+    default y if XEN
+    depends on XEN
+    select PCI
+    select USB
+    select IDE_PIIX
-- 
2.26.2


