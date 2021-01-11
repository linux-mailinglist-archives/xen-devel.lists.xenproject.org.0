Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B972F1980
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64948.114886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzh-0003eF-3F; Mon, 11 Jan 2021 15:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64948.114886; Mon, 11 Jan 2021 15:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzh-0003dq-08; Mon, 11 Jan 2021 15:20:33 +0000
Received: by outflank-mailman (input) for mailman id 64948;
 Mon, 11 Jan 2021 15:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3k0/=GO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kyyzf-0003dl-6H
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:20:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c35c0fa3-74b8-4a94-89fa-4708d838c4c6;
 Mon, 11 Jan 2021 15:20:29 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-wb_J_ZdHMcCabYFR_w4mJA-1; Mon, 11 Jan 2021 10:20:25 -0500
Received: by mail-ej1-f70.google.com with SMTP id m11so24969ejr.20
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 07:20:25 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id y17sm7157263ejj.84.2021.01.11.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:23 -0800 (PST)
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
X-Inumbo-ID: c35c0fa3-74b8-4a94-89fa-4708d838c4c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610378429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LM7AeLfQEqrU558zvQoXSQweJ4vkeUX1kaefzrhoJho=;
	b=YkxYGwGWOYWNGfrisMetuHVhx16PugXSCwnmAKLWECv7I5Db5amGX9G4uRIUxmWLNFob2O
	nlLcbkXXop51mSD7Euk/y56iL2CTxGAQkrWBi7I2/vIvpoy6qZJE+WXcEXb52O6No9vOIi
	3hV6dTsl8N81WeTn7wisiJ1oC854wvI=
X-MC-Unique: wb_J_ZdHMcCabYFR_w4mJA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ucd06r2eJPcCIqt9QCTk/uw4j4Vi5AVfWPojlXh2MWo=;
        b=llkQM5S/D8a/cVHFJr6vkg358/oS8RMmLd8EZCLBJnv/RmcONaUzqTTdKvEfIEmpN7
         cd3zfXOkR6zN5+a8Q48+k5xzyRg+klAbcdIQ2QSRdaggd0DQzWcVV0d4WVBvHeKHDsEw
         Cjhc11X/XTsqaeeFA5Dzho2ElSwSvxM2i0X/IAgNHBL2t+m8d2fVmjyIYtlZWZ+ZD8MW
         K3HBE8TiVIuCtaFF3ngCyRDnQ1HKwSteFwtBSJBpD/erU8uijYWS+SJMZ3H8mQruTmZX
         +3YkKOvZBvWRfDqFOTlhgYT4EeIJxKClpwFzUbLnZLxvZbMpKbX43LbSAC87vNUOWeJp
         BWow==
X-Gm-Message-State: AOAM533/vgalUVhiAgz0DBlgJCF9d0BH9HDzuT+/rBxPfSVcG3TSRZqs
	W6h8cBZ45dNyTBVqyIx2S4BFR6yEorqyYT1H6oJwdFZYkxiT+yahcm5pfT6Uf5RS1sKWfitV/FQ
	CrxG0DStopRd/hVQ58o++vIUGbkU=
X-Received: by 2002:a17:907:e9e:: with SMTP id ho30mr11282837ejc.529.1610378424338;
        Mon, 11 Jan 2021 07:20:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywxJElqigN/5jUO+VSUtxZXH9MfGPzYtOFdIcNPFnX2mDokjoLqsfHorN2m3Haq800FJrUjA==
X-Received: by 2002:a17:907:e9e:: with SMTP id ho30mr11282789ejc.529.1610378424080;
        Mon, 11 Jan 2021 07:20:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org,
	Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean 'running'
 argument
Date: Mon, 11 Jan 2021 16:20:18 +0100
Message-Id: <20210111152020.1422021-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Trivial prototype change to clarify the use of the 'running'=0D
argument of VMChangeStateHandler.=0D
=0D
Green CI:=0D
https://gitlab.com/philmd/qemu/-/pipelines/239497352=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  sysemu/runstate: Let runstate_is_running() return bool=0D
  sysemu: Let VMChangeStateHandler take boolean 'running' argument=0D
=0D
 include/sysemu/runstate.h   | 12 +++++++++---=0D
 target/arm/kvm_arm.h        |  2 +-=0D
 target/ppc/cpu-qom.h        |  2 +-=0D
 accel/xen/xen-all.c         |  2 +-=0D
 audio/audio.c               |  2 +-=0D
 block/block-backend.c       |  2 +-=0D
 gdbstub.c                   |  2 +-=0D
 hw/block/pflash_cfi01.c     |  2 +-=0D
 hw/block/virtio-blk.c       |  2 +-=0D
 hw/display/qxl.c            |  2 +-=0D
 hw/i386/kvm/clock.c         |  2 +-=0D
 hw/i386/kvm/i8254.c         |  2 +-=0D
 hw/i386/kvmvapic.c          |  2 +-=0D
 hw/i386/xen/xen-hvm.c       |  2 +-=0D
 hw/ide/core.c               |  2 +-=0D
 hw/intc/arm_gicv3_its_kvm.c |  2 +-=0D
 hw/intc/arm_gicv3_kvm.c     |  2 +-=0D
 hw/intc/spapr_xive_kvm.c    |  2 +-=0D
 hw/misc/mac_via.c           |  2 +-=0D
 hw/net/e1000e_core.c        |  2 +-=0D
 hw/nvram/spapr_nvram.c      |  2 +-=0D
 hw/ppc/ppc.c                |  2 +-=0D
 hw/ppc/ppc_booke.c          |  2 +-=0D
 hw/s390x/tod-kvm.c          |  2 +-=0D
 hw/scsi/scsi-bus.c          |  2 +-=0D
 hw/usb/hcd-ehci.c           |  2 +-=0D
 hw/usb/host-libusb.c        |  2 +-=0D
 hw/usb/redirect.c           |  2 +-=0D
 hw/vfio/migration.c         |  2 +-=0D
 hw/virtio/virtio-rng.c      |  2 +-=0D
 hw/virtio/virtio.c          |  2 +-=0D
 net/net.c                   |  2 +-=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/runstate.c          |  4 ++--=0D
 target/arm/kvm.c            |  2 +-=0D
 target/i386/kvm/kvm.c       |  2 +-=0D
 target/i386/sev.c           |  2 +-=0D
 target/i386/whpx/whpx-all.c |  2 +-=0D
 target/mips/kvm.c           |  4 ++--=0D
 ui/gtk.c                    |  2 +-=0D
 ui/spice-core.c             |  2 +-=0D
 41 files changed, 51 insertions(+), 45 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


