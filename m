Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5731FDF7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87023.163940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9k2-0000Te-1q; Fri, 19 Feb 2021 17:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87023.163940; Fri, 19 Feb 2021 17:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9k1-0000Rn-U0; Fri, 19 Feb 2021 17:38:57 +0000
Received: by outflank-mailman (input) for mailman id 87023;
 Fri, 19 Feb 2021 17:38:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9k0-0000Ri-9A
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:38:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0fd09e82-fd04-4ca5-9e4a-7b9c9199383d;
 Fri, 19 Feb 2021 17:38:54 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-RFoionfWOYKhv2EUOAg6gg-1; Fri, 19 Feb 2021 12:38:52 -0500
Received: by mail-wr1-f69.google.com with SMTP id d10so2747603wrq.17
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:38:52 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm13785629wrm.6.2021.02.19.09.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:38:50 -0800 (PST)
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
X-Inumbo-ID: 0fd09e82-fd04-4ca5-9e4a-7b9c9199383d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4SOncT9Fo54yUG54/z2tFe4UG2s+CTajIRyeydICZjo=;
	b=YZFlL6hfULqIyWQb/z3hlSqI+0d7XDhxI+UD3ulqt3+SsPKHXd9ZhttbYlzjjwfEjvDr+0
	OS5dhGRn9X+jz+YmEHCxkkIgo9z0nNb9Eg1yRcKHJMK2DgeYY39auP1HBisnrvlIVyWzM6
	wOVfVEafosJYWkb6t+gRvciSL9Ml7Vg=
X-MC-Unique: RFoionfWOYKhv2EUOAg6gg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lykBUd6DAhrahT8nCJAC5FU9Ql8oesKH07nupx8xYdk=;
        b=PXYwu88UteB0XRvP8XWSdaKEHwc0upbUMaRE8SdHzbNnj15Xf9XMYwDB7c9x6fPYT2
         w4T1MKdRgMFxSftZd7IdEjuUtof6nIT4xi5nOg4DWYM0dq+eaJqJTTaecPA/l6yG+jkl
         e+S99jUQAmnNzUxIQtkNt8FdYMm/PGnRzSFWiSwTzjuHiM6wmYzwEVo/pzmq6TyAgMVQ
         FaZ0RkAsffRkwEbXk0eXwaSCQe+DghFMKQBTcbc9LgIbdj9SmLDmVfEOyQGZCy4nUGrJ
         JapDHdtaKG2iQVLp9PrOMP2MnEM15oCyjyIRh94wyePDkK78yXSE6NdH56jq9rX2lmeb
         7HJA==
X-Gm-Message-State: AOAM532/bXznZXY9MLMVOqgXAMi9ujKs1/w3DXYo0U1WOg67QPyoSO5z
	JtkXvfoQI5HzyhsMTZTLOAEiDbiHrre6MFFV1Tm8lp7cYX4M7gzAHlI+POgiRDQVTX3CtTJRWba
	O8o0yASpWEh4ItxVQLwD3x7vNjp4=
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr10542032wrm.210.1613756331025;
        Fri, 19 Feb 2021 09:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI/byrZ/GWSkkhxlUrl1Omb6LyZ4OFFS/CSa2qXI7tP50C7ZajzgipQ5EfU9sygOtDbt6r2g==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr10542005wrm.210.1613756330876;
        Fri, 19 Feb 2021 09:38:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 00/11] hw/accel: Exit gracefully when accelerator is
 invalid
Date: Fri, 19 Feb 2021 18:38:36 +0100
Message-Id: <20210219173847.2054123-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
This series aims to improve user experience by providing=0D
a better error message when the user tries to enable KVM=0D
on machines not supporting it.=0D
=0D
Since v1:=0D
- added missing x86 arch (Peter)=0D
- consider all accelerators (Daniel and Peter)=0D
- do not enable KVM on sbsa-ref (Leif)=0D
- updated 'query-machines' (Daniel)=0D
- new patch for XenPV=0D
=0D
Supersedes: <20210219114428.1936109-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  accel/kvm: Check MachineClass kvm_type() return value=0D
  hw/boards: Introduce machine_class_valid_for_accelerator()=0D
  hw/core: Restrict 'query-machines' to those supported by current accel=0D
  hw/arm: Restrit KVM to the virt & versal machines=0D
  hw/mips: Restrict KVM to the malta & virt machines=0D
  hw/ppc: Restrict KVM to various PPC machines=0D
  hw/s390x: Explicit the s390-ccw-virtio machines support TCG and KVM=0D
  hw/i386: Explicit x86 machines support all current accelerators=0D
  hw/xenpv: Restrict Xen Para-virtualized machine to Xen accelerator=0D
  hw/board: Only allow TCG accelerator by default=0D
  softmmu/vl: Exit gracefully when accelerator is not supported=0D
=0D
 include/hw/boards.h        | 27 ++++++++++++++++++++++++++-=0D
 accel/kvm/kvm-all.c        |  6 ++++++=0D
 hw/arm/virt.c              |  5 +++++=0D
 hw/arm/xlnx-versal-virt.c  |  5 +++++=0D
 hw/core/machine-qmp-cmds.c |  4 ++++=0D
 hw/core/machine.c          | 26 ++++++++++++++++++++++++++=0D
 hw/i386/x86.c              |  5 +++++=0D
 hw/mips/loongson3_virt.c   |  5 +++++=0D
 hw/mips/malta.c            |  5 +++++=0D
 hw/ppc/e500plat.c          |  5 +++++=0D
 hw/ppc/mac_newworld.c      |  6 ++++++=0D
 hw/ppc/mac_oldworld.c      |  5 +++++=0D
 hw/ppc/mpc8544ds.c         |  5 +++++=0D
 hw/ppc/ppc440_bamboo.c     |  5 +++++=0D
 hw/ppc/prep.c              |  5 +++++=0D
 hw/ppc/sam460ex.c          |  5 +++++=0D
 hw/ppc/spapr.c             |  5 +++++=0D
 hw/s390x/s390-virtio-ccw.c |  5 +++++=0D
 hw/xenpv/xen_machine_pv.c  |  5 +++++=0D
 softmmu/vl.c               |  7 +++++++=0D
 20 files changed, 145 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


