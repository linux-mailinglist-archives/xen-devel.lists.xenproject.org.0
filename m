Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E66B65B8
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508987.784082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPO-0003u6-UJ; Sun, 12 Mar 2023 12:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508987.784082; Sun, 12 Mar 2023 12:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPO-0003kE-Nr; Sun, 12 Mar 2023 12:02:38 +0000
Received: by outflank-mailman (input) for mailman id 508987;
 Sun, 12 Mar 2023 12:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPM-0003B1-Ql
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c57c7506-c0cd-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 13:02:33 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id cn21so7937347edb.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:33 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:32 -0700 (PDT)
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
X-Inumbo-ID: c57c7506-c0cd-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zx4WQ0rpWKtdmR92czSmYxtVfc9kMMG+Fa09pszRXII=;
        b=Kq0+PWIOx/dVZ15PrMf151vUjYkB6uw1jPdTgLlXYfQXbhvPC3e617ZPRfDQPm0p52
         D7BWiQFSoGlRTF9l4bCMsUCYx6VRorBIRy7q9oP5dTNrPeZB7QETmuW6FwDPYWAvNJb9
         oofS6MVVF9rjv7aBcUTfqOap5T6OHG3k8g58VIiS8sI1Y3/jT9pxCb0zV7FtIATh187L
         Bxog9AQv8s+toelMiZoQA4pkJ4D/gBJtBDJj6h7jmlccLMZB7WiNHLlNKBooCckMrGuo
         prxzTTi/98U/zrmf+c+sFw+Oc3v6PNtXvWK0M9wNPocVYkbhNAXbmddghY/34R+IxilH
         HTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zx4WQ0rpWKtdmR92czSmYxtVfc9kMMG+Fa09pszRXII=;
        b=3sWmejz6xi7kIkdsUhOpa7P5aXtRb7MYoJSka9WkY6JN+fp0YMIj46mUv8TcIlySMk
         RsU2VfeTYf2IbOD06BgsAIWJNyHwM4++Qg+WGYVuLuhJBKmjEPUTeifK0Gcam/xJaekR
         fOQXGLgaaGjvaiWVRzooifW0IDA3/dE3Gi5oAByW0VGlIZ6h91Gh+ewYC8HoUDoyA3I0
         Yg7r99taFoME9wj0l7HNaZsC78SPjfopawMRCjC4fv/OcnwxrxFxZiPZnCl54dsQTFMr
         1OT55JdFq7yA4Nh4EU+SOVCSE86bVAKsF0YXb88fFTSRTx/OPcSvwBeJQj5Hg2CwQ6/S
         SjKA==
X-Gm-Message-State: AO0yUKWq8Gj7hH3GTycRZfzSHCsG5tDu3tP1UR6aDkI69HehcQUrcUsx
	klo0Tyxs1ZcQ+bctSTORbEo=
X-Google-Smtp-Source: AK7set/yTkaiC/AD/f/M0Ng0EK/oMU6zvGaSDuWVsoHBKyUNqdpnuBumcPec5u1y/AC8bZR4Zq7YGQ==
X-Received: by 2002:a17:907:2beb:b0:921:5cce:6599 with SMTP id gv43-20020a1709072beb00b009215cce6599mr3576266ejc.41.1678622552832;
        Sun, 12 Mar 2023 05:02:32 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Sun, 12 Mar 2023 13:02:15 +0100
Message-Id: <20230312120221.99183-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is currently a dedicated PIIX3 device model for use under Xen. By reu=
sing=0D
existing PCI API during initialization this device model can be eliminated =
and=0D
the plain PIIX3 device model can be used instead.=0D
=0D
Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen=
=0D
agnostic towards the precise south bridge being used in the PC machine. The=
=0D
latter might become particularily interesting once PIIX4 becomes usable in =
the=0D
PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.=0D
=0D
Testing done:=0D
- `make check`=0D
- `make check-avocado`=0D
- Run `xl create` with the following config:=0D
    name =3D "Manjaro"=0D
    type =3D 'hvm'=0D
    memory =3D 1536=0D
    apic =3D 1=0D
    usb =3D 1=0D
    disk =3D [ "file:manjaro-kde-21.2.6-220416-linux515.iso,hdc:cdrom,r" ]=
=0D
    device_model_override =3D "/usr/bin/qemu-system-x86_64"=0D
    vga =3D "stdvga"=0D
    sdl =3D 1=0D
- `qemu-system-x86_64 -M pc -m 2G -cpu host \=0D
    -accel kvm,xen-version=3D0x4000a,kernel-irqchip=3Dsplit \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
- `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
v3:=0D
- Rebase onto master=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()=0D
  hw/isa/piix3: Resolve redundant k->config_write assignments=0D
  hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 hw/i386/pc_piix.c             | 36 +++++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  2 +-=0D
 hw/isa/piix3.c                | 60 +----------------------------------=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 37 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

