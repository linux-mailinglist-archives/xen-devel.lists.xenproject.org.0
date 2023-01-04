Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04C65D665
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471202.730953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51C-0007Cv-UW; Wed, 04 Jan 2023 14:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471202.730953; Wed, 04 Jan 2023 14:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51C-00079m-Qr; Wed, 04 Jan 2023 14:45:26 +0000
Received: by outflank-mailman (input) for mailman id 471202;
 Wed, 04 Jan 2023 14:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51B-00079V-BY
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:25 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b14eac9-8c3e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 15:45:23 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id w1so21082853wrt.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:23 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:22 -0800 (PST)
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
X-Inumbo-ID: 6b14eac9-8c3e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AWtfe719mk9eM2p93lKeuen7Jx5n1pIewca97MBqdc=;
        b=OwFsjrcMxKj1s4H/fotfYoCBwsygaVEcANDEtkGKlRyfBhRTz2OCJEfvXLHdpvGD7x
         1UEQXKL/fkPiuknoLjoM5DN7aY70nsceK2OJjfdaAgw9ncTN9zqwANYNKuVh9/VYPIav
         Gxa5DzQLOhl4wRP4fdUdJRo0/0J+NooIx+ufMBgihzp8h8ReOBqkfcMdo5OIuU7w6C1T
         xeIFvIeZUCH0v04IqmRX6RWe7b9aT6myshNL5uBQppaZzdT6fjevlsqcM0Ali9GqYGyM
         3aA5vHjcTLoKc3+eO5xe3fGq8g9ZH0qb1jafzvK3ILB8i4T2FQ5zM5m/u/LZkPbBN/GS
         +UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AWtfe719mk9eM2p93lKeuen7Jx5n1pIewca97MBqdc=;
        b=Y+BI5Lx0ljBGFGeV01i+XvUq18IBuXCIzgOikKUY5CTWVKZ5eN1rQwNuOyL5/N5/mj
         pwgwec873LDLleg5xtmK420SbNUBb+7XTPmD9zQdwoeqGc0ggFMk7mq2xSy+MOiNsJlo
         fdwap9bmVJLFp5Qr0qcX6SZb9gxPPb03fCQSJjiJ9IxPMKDV7fPuXFv4RXhsGWQjDDwN
         lFxKLxfjsxF58VmbSGy1sModkypnlygJll4KSvuDBGCMwMV+vxR6eypfFsQlJmt9dFQ3
         b/ArioVeZJEbqiM18IdYP4bXocxprc8HlzAoiTrPhn78GCPrkJeQLgQlA4KcR6lwUInO
         A63g==
X-Gm-Message-State: AFqh2korvb/y1hK+QB8RwuTWj3WabA+qKQ5+2Om5tPdtsg0MAXTjGKMW
	jfIVJJmtiAKRlP8SE0mR8SE=
X-Google-Smtp-Source: AMrXdXvIETTxnaRaRvm9hcFDe31cy8g3McWj56E8OyCHBH1xc4SjLtjj5azN8me5MaQQNXaIHCKkjw==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id ck1-20020a5d5e81000000b00244e704df2cmr34565713wrb.57.1672843522692;
        Wed, 04 Jan 2023 06:45:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Wed,  4 Jan 2023 15:44:31 +0100
Message-Id: <20230104144437.27479-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally remov=
es=0D
it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in th=
e PC=0D
machine agnostic to the precise southbridge being used. 2/ will become=0D
particularily interesting once PIIX4 becomes usable in the PC machine, avoi=
ding=0D
the "Frankenstein" use of PIIX4_ACPI in PIIX3.=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Testing done:=0D
None, because I don't know how to conduct this properly :(=0D
=0D
Based-on: <20221221170003.2929-1-shentey@gmail.com>=0D
          "[PATCH v4 00/30] Consolidate PIIX south bridges"=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()=0D
  hw/isa/piix: Resolve redundant k->config_write assignments=0D
  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 hw/i386/pc_piix.c             | 34 ++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  2 +-=0D
 hw/isa/piix.c                 | 66 +----------------------------------=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 35 insertions(+), 72 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

