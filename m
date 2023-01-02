Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05865B762
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470398.729891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCST8-0003Yu-8V; Mon, 02 Jan 2023 21:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470398.729891; Mon, 02 Jan 2023 21:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCST8-0003Ww-5r; Mon, 02 Jan 2023 21:35:42 +0000
Received: by outflank-mailman (input) for mailman id 470398;
 Mon, 02 Jan 2023 21:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCST6-0003Wk-Nl
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:40 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6627f758-8ae5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 22:35:38 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id vm8so62327859ejc.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:38 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:37 -0800 (PST)
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
X-Inumbo-ID: 6627f758-8ae5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThcfWkzyxbomQpjRZA7dc6wiEsJYQ4EhFUJkZuMYNh4=;
        b=l3DiR+ii5Hfw71WDsiNsQdM2zwr5EVsEEAGGOTU6ym+YOnTFgyDMg9p3kAGMFm2Uf/
         aQS0jZyQnqxtYSMIPattFYbm1mdsvpSJ/GGsEEd5HhYrEEeJ6+2Fu38VF4NsSG6Y21lK
         AHtxfwQOcsVklKIdAlVyxuFr1pmDQodVdZJhWtiAToFJemLAUAaz3oFSXvJAQTBCumzf
         fXIh9eI0mnzZ2IHGNbfvZOC7FxHI11aH6DYlMAaKv7fdbr/Awo02oZHlRFHMG503UjCZ
         k9Rxs77JgBKr5BTE3jl29v3+IbSrFZHhEs8IwI6z+tCMLssBEMwiOSRQih7t0fPjl1kG
         WoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThcfWkzyxbomQpjRZA7dc6wiEsJYQ4EhFUJkZuMYNh4=;
        b=vUCrY0uGT43bpAGlD3s/VcRla72zCXlf/OWrx9ChDsvBLU/JR3PfE+/WtfB5egh+X7
         b6cPuaiOjWRK+DaTVqIMv5Fs04ijQT0dPW25OKudhXq5TlPVmltUGdgAg4e7q5yDtqm1
         zQLGUeWB+1yQFIitxUGIMSB5+FVWQVy1WvDiwSZITlH/hVHZe6uRGJcP4XYXfMqwkAIK
         1VVEwusu+xsjcSbal7bFCB94SOz/Xmqbzpr2sTO6Jzr1Jh0P6t3uXKeJx8/S+/Kg+NOU
         RhEGgleYEIMOBWKtk0sf1lg1DVjFWFvQdyBJqEK4XhxHRejbPzF1fs83O6CujQE6Pjb3
         g99g==
X-Gm-Message-State: AFqh2krQFiPQyZpmz2ktSeSv2x+pZ0aMssNz+shn6kKNlW7+tVypr/wQ
	BRTfUy99YtpjE+RVpfyeWJM=
X-Google-Smtp-Source: AMrXdXurMjYiz5Hum/Tzox9GBdNJ4/Pvd6hcKQmZX141+8/hdih4/lbxpie9ZEO4sSmtCYEFcdoKug==
X-Received: by 2002:a17:907:3ea1:b0:7c1:7f84:10ac with SMTP id hs33-20020a1709073ea100b007c17f8410acmr61151091ejc.33.1672695338100;
        Mon, 02 Jan 2023 13:35:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Mon,  2 Jan 2023 22:34:58 +0100
Message-Id: <20230102213504.14646-1-shentey@gmail.com>
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
Testing done:=0D
None, because I don't know how to conduct this properly :(=0D
=0D
Based-on: <20221221170003.2929-1-shentey@gmail.com>=0D
          "[PATCH v4 00/30] Consolidate PIIX south bridges"=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it=0D
  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()=0D
  hw/isa/piix: Resolve redundant k->config_write assignments=0D
  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 hw/i386/pc_piix.c             | 34 ++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  9 +++--=0D
 hw/isa/piix.c                 | 66 +----------------------------------=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 40 insertions(+), 74 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

