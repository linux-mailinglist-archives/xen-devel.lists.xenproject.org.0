Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167254B03C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348863.575052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15T3-0008GP-A4; Tue, 14 Jun 2022 12:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348863.575052; Tue, 14 Jun 2022 12:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15T3-0008F2-5s; Tue, 14 Jun 2022 12:16:21 +0000
Received: by outflank-mailman (input) for mailman id 348863;
 Tue, 14 Jun 2022 12:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15T1-0008Ek-4g
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca390d91-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-L15e5m9TNUyMxihfL8XLtA-1; Tue, 14 Jun 2022 08:16:13 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F2D1C0514D;
 Tue, 14 Jun 2022 12:16:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44AB1492C3B;
 Tue, 14 Jun 2022 12:16:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1A291800084; Tue, 14 Jun 2022 14:16:10 +0200 (CEST)
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
X-Inumbo-ID: ca390d91-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6LLN3PRRdurbe5WDvmvbhPsA1qOqsjYEdVF0UsvlhBQ=;
	b=ONZhyRikfdnThs445SmVSytwMaLt9vjU0OW37LoO0Ir0qzoWP4cFwLP0RDTv7VzdBm+aw+
	9tVQeSq0sjK7MAQDtRYysyt+wq8rimLzgJ92uVv/MWYGFmTp+fqG3JL67e0awAiDdbH2lD
	tVPob/Ffoot1Jt/9DSqBOVOSQTCbJqY=
X-MC-Unique: L15e5m9TNUyMxihfL8XLtA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 00/15] Kraxel 20220614 patches
Date: Tue, 14 Jun 2022 14:15:55 +0200
Message-Id: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:

  Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/kraxel-20220614-pull-request

for you to fetch changes up to b95b56311a0890da0c9f7fc624529c3d7f8dbce0:

  virtio-gpu: Respect UI refresh rate for EDID (2022-06-14 10:34:37 +0200)

----------------------------------------------------------------
usb: add CanoKey device, fixes for ehci + redir
ui: fixes for gtk and cocoa, rework refresh rate
virtio-gpu: scanout flush fix

----------------------------------------------------------------

Akihiko Odaki (4):
  ui/cocoa: Fix poweroff request code
  ui/console: Do not return a value with ui_info
  ui: Deliver refresh rate via QemuUIInfo
  virtio-gpu: Respect UI refresh rate for EDID

Arnout Engelen (1):
  hw/usb/hcd-ehci: fix writeback order

Dongwon Kim (1):
  virtio-gpu: update done only on the scanout associated with rect

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

Joelle van Dyne (1):
  usbredir: avoid queuing hello packet on snapshot restore

Volker Rümelin (2):
  ui/gtk-gl-area: implement GL context destruction
  ui/gtk-gl-area: create the requested GL context version

 meson_options.txt                |   2 +
 hw/usb/canokey.h                 |  69 +++++++
 include/hw/virtio/virtio-gpu.h   |   1 +
 include/ui/console.h             |   4 +-
 include/ui/gtk.h                 |   2 +-
 hw/display/virtio-gpu-base.c     |   7 +-
 hw/display/virtio-gpu.c          |   4 +
 hw/display/virtio-vga.c          |   5 +-
 hw/display/xenfb.c               |  14 +-
 hw/usb/canokey.c                 | 313 +++++++++++++++++++++++++++++++
 hw/usb/hcd-ehci.c                |   5 +-
 hw/usb/redirect.c                |   3 +-
 hw/vfio/display.c                |   8 +-
 ui/console.c                     |   6 -
 ui/gtk-egl.c                     |   4 +-
 ui/gtk-gl-area.c                 |  42 ++++-
 ui/gtk.c                         |  45 +++--
 MAINTAINERS                      |   8 +
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++
 docs/system/devices/usb.rst      |   4 +
 hw/usb/Kconfig                   |   5 +
 hw/usb/meson.build               |   5 +
 hw/usb/trace-events              |  16 ++
 meson.build                      |   6 +
 scripts/meson-buildoptions.sh    |   3 +
 ui/cocoa.m                       |   6 +-
 ui/trace-events                  |   2 +
 28 files changed, 707 insertions(+), 51 deletions(-)
 create mode 100644 hw/usb/canokey.h
 create mode 100644 hw/usb/canokey.c
 create mode 100644 docs/system/devices/canokey.rst

-- 
2.36.1


