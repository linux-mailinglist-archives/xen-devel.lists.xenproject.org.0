Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28471309CA2
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79297.144402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYi-00012n-Aq; Sun, 31 Jan 2021 14:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79297.144402; Sun, 31 Jan 2021 14:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYi-00012A-6S; Sun, 31 Jan 2021 14:18:36 +0000
Received: by outflank-mailman (input) for mailman id 79297;
 Sun, 31 Jan 2021 14:18:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DYg-0000yx-SZ
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:18:34 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb1a473-afde-4b16-8802-6006f3f1bba4;
 Sun, 31 Jan 2021 14:18:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 7so13775572wrz.0
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:18:29 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y6sm18426517wma.19.2021.01.31.06.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:28 -0800 (PST)
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
X-Inumbo-ID: adb1a473-afde-4b16-8802-6006f3f1bba4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1iUBKmTUYZTioyGS/rhl1Ra2yNWVBdikWriqZM/Im58=;
        b=lXXSAE9J1Y5ZtYJKsoxwAqiFlt7+B7vFUBM09lA/IJOklFpMVJ+Dn4xC/d0qfON75d
         7d4LwlxtxhClhKgMvf1kP3SeqeEEqDvtrtPHjyymgq++vo6QXrCo/GfUPn37zmJs/dHB
         b/5u+ElRBF2MimMqSynaekRNxCEU6RCnK7UocZpH2jyH0Brxb96rsIpaJJec3gkqhvux
         yYPReeqiJWZtvpzXO082LrvouNKG/NveWCrLJhu2t6mUZOmNXiKRLEqfYFT0E4XZUgWW
         WZcBcMM+duaItsh2IpskfWv5f0QELPjiKDYUE8XdX+aJwU3RaZT0qp+UVmQf81NSIUvj
         iP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1iUBKmTUYZTioyGS/rhl1Ra2yNWVBdikWriqZM/Im58=;
        b=TW8oLLJPoKbgtjXxzSGoP/A+4whoD3nIHGlvgIqNWqpj2eWK5v/JmTR0pzUujZeA72
         5OiohvUgmVo1MsamwC3MADLv2Y34xk60nBmPqoYCldMldtcimAYoGiqeu5Zs/iUbDc+E
         4RxlEmqBF2rNhw8+RZIjExSAex7nldE6RxnDpHb/RH4e4atmhGByL+OXfXAc5rH0vL3a
         fbx1SBIpk5oCz+ArUtk9dhj2LLUSFAw268cZWezPC4xwuoigIHKmoGXxvVLlGYLf5Npk
         0OKqOXmDiFUAnZy6eOxgXe9StSoFF+AAwk65Hda8yp1IifQqSXez2C3JTPAOeUzBXL+a
         jjYg==
X-Gm-Message-State: AOAM532HQvSt6BT8Iu6z082Lrcf57iftHmvbOtZj//Xxd28a2QAP+NrI
	67q/BZQO3Ii2lnF7Zy6rqQg=
X-Google-Smtp-Source: ABdhPJxIgwNKaEHdqAJauuf3Ui5v/VP5KSWum8cYT2MZ2lfxJraZueLa/5/ANCkzhVlAiuHFjqsB/A==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr7567416wro.383.1612102708748;
        Sun, 31 Jan 2021 06:18:28 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
Date: Sun, 31 Jan 2021 15:18:09 +0100
Message-Id: <20210131141810.293186-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
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


