Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D56D3E3F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517309.802451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEou-0000YE-7L; Mon, 03 Apr 2023 07:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517309.802451; Mon, 03 Apr 2023 07:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEou-0000V4-3R; Mon, 03 Apr 2023 07:41:40 +0000
Received: by outflank-mailman (input) for mailman id 517309;
 Mon, 03 Apr 2023 07:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEos-0000Sg-9M
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4e4850c-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:35 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id p34so16484258wms.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:34 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:33 -0700 (PDT)
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
X-Inumbo-ID: f4e4850c-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqktkp0iv4ik+R4dzmjAFeY0JZolWYG3VGRe4IrvPbY=;
        b=LVlZ2cuXFFwexXKoLI9ZG5QLEbGwOeE1vppWSymN0IQlwF89mbzooulggZ9QEfulr8
         PcmbIyQvJCwRAHRXGOCyARG18K25hcG1Z79E7hTODBbHIK5gRp8lt+RZ/NW7FpVGFaXg
         UiyqH4AVBIN7OzYQiYUpLFf0VmO/k9PzcY6G0ppf9uuG6chbW5qZDutq4dzRlzjqDcdl
         kBLiKAIa+gs0ikEQx09bluaV4HWsb28uN9XufuY9U6tt5vV79zff5a7CVVxoUUffTFnZ
         gomowXcFGaVrFrZduuwRYSaVlDcVSGOGAgvm8M/QM0eOxop+1AsCKWsROZrw7JaX9d3K
         eKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqktkp0iv4ik+R4dzmjAFeY0JZolWYG3VGRe4IrvPbY=;
        b=vrYHaRJ77eeVFnTy8dRZcjTnyvTC8iMW7LmhO+3LOUgLuVVdQcqGOnblLz7iN6WPde
         zEGaYmwdzRJJZjTE1FUBTFoCctw1wd1sG9SiqHdgdybPgHzN7DqZqlRjltaORpBAMxAK
         LFoVUOfDujp8BWuo+HRuXDNu28M3GvX8mzk2AJbzqL5Ch8hxlNFViZwFwU0LRGrXEruQ
         I4gjVp6NkF0vA2YhFx8xYS1HBnQu6greJzd7C5Q+msldCeHvHdhv4arTVQCwvLui1Cfu
         E8YZ//d8DVWDOD3TtSWPS34Pg3oNbJN6P8XGFA3y0E0da1QKEdxVDujgBiy0PSN+VOpW
         ooZg==
X-Gm-Message-State: AO0yUKX2Tl0QIY6URJ0kC2F+5ttB30r9j6EyLY+9KIIQrcpkhBO2wnCK
	EkBfQb7yS1D1PfjTv/t+EaM=
X-Google-Smtp-Source: AK7set+w4NV/Q17dNwmnKiNJ9TGNyLmYq7XLiiKjnzxMzffvXWPMfja/NHU/YbSqWzE9T9gy1AwaVA==
X-Received: by 2002:a05:600c:ad0:b0:3ed:abb9:7515 with SMTP id c16-20020a05600c0ad000b003edabb97515mr26505746wmr.11.1680507693506;
        Mon, 03 Apr 2023 00:41:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Mon,  3 Apr 2023 09:41:17 +0200
Message-Id: <20230403074124.3925-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
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
- `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
v4:=0D
- Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)=0D
=0D
v3:=0D
- Rebase onto master=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>=0D
=0D
Bernhard Beschow (7):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()=0D
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
 hw/pci/pci.c                  |  2 ++=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 7 files changed, 39 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.40.0=0D
=0D

