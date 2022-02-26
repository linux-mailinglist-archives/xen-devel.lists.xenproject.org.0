Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507434C55B8
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 12:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279764.477580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfn-0007tO-2K; Sat, 26 Feb 2022 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279764.477580; Sat, 26 Feb 2022 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfm-0007rH-Up; Sat, 26 Feb 2022 11:55:38 +0000
Received: by outflank-mailman (input) for mailman id 279764;
 Sat, 26 Feb 2022 11:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r031=TJ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nNvfl-0007fi-CX
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 11:55:37 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f1a04c-96fb-11ec-8eb9-a37418f5ba1a;
 Sat, 26 Feb 2022 12:55:36 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id bd1so6888621plb.13
 for <xen-devel@lists.xenproject.org>; Sat, 26 Feb 2022 03:55:36 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:34 -0800 (PST)
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
X-Inumbo-ID: 01f1a04c-96fb-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OE8zP91owAdAv34uCdWfWeqWZ/xtaym8fiSm/ATXeO4=;
        b=AOn7rkPqO+IspT+ZlGbo+gCLcxuWJFl6lJHIw+WO6MFQfNH9SB+yrUYxFz8evfSX21
         PzBBZ/VyyVGgxwCvNAXt4VgBs72WZf8l4HUCM+yRnjjpomTB5U82AxsFXppli+63IbL3
         X2PGJyXQv/d9Lra5aj3+duZy/KYLbIBjoh6lYaUFFwayyWI97uHHGq/Y3qekq2HqRTYi
         nXHwCs/Sr3HiZCFiDqSxeZzk8Q4vRfH8ef+X09HyfWtcGWY7F05Er9xk8T36XlnX0RL5
         ot+nva2I4HBY2sfgGvX+X6ZOL9hRiZQidEw7rLIY06CDYpbqYHpjVXNa4Pbmh5lv4wiN
         TG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OE8zP91owAdAv34uCdWfWeqWZ/xtaym8fiSm/ATXeO4=;
        b=urtA61MJmLI+PzrC21RrXFRHDVSUWQ5hxjMk5beHgwFkh+H1nVABQdAt+alWYAImUi
         eSSpao5brLxWgFr6np3LJ4x90II+54Q32CyUMXgPml/z6/NLf7Evn7DOxnEsrZR28wV4
         AQTKjxczaNzv3QAirIJUXtvzph9C1fzSVYOSXa9rb0BY761+0w6rjckdyfmF8MMHTHUv
         QgD2GFEdXTbANWLpgOSflVaA6FIKBihrwnOvyC2BqXG2mNbArU3u2SWnpF3A6b0U3CLO
         InKHDdn8m74kZo/RkcmoV1/hBmYiQm3sIMoiR6ZhWO61P4hfZ75w3R2jOnLy/vc4p35i
         vblw==
X-Gm-Message-State: AOAM531PyE0EU6y8ch+nizwZoVy+rjfRmCR8HGFjKqiPEMErnVlFiaBC
	VmHQl48hZHjekMHpZbApYy0=
X-Google-Smtp-Source: ABdhPJxzxcwqMQgVSDEOScYTCQv+dVNrIoXxffPaEgtRBh3LH6zFDiaNBTknjegkmpJqtJsydO/sFA==
X-Received: by 2002:a17:902:d2c6:b0:150:128:b276 with SMTP id n6-20020a170902d2c600b001500128b276mr12050398plc.5.1645876535179;
        Sat, 26 Feb 2022 03:55:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu Developers <qemu-devel@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v3 0/3] virtio-gpu: Respect UI refresh rate for EDID
Date: Sat, 26 Feb 2022 20:55:13 +0900
Message-Id: <20220226115516.59830-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let virtio-gpu be aware of the refresh rate. The EDID change is delivered with
display hotplugging, which should not happen too frequently. Because of that,
this moves the refresh rate to QemuUIInfo, whose change delivery is throttled.

The delivery throttling also affects xenfb and this change does not maintain
a seperate code path to avoid the throttling because the difference is little
if it xists. Usually the refresh rate of display does not change frequently and
most guests are not prepared for that anyway.

v3: Rebased to the latest QEMU.

Akihiko Odaki (3):
  ui/console: Do not return a value with ui_info
  ui: Deliver refresh rate via QemuUIInfo
  virtio-gpu: Respect UI refresh rate for EDID

 hw/display/virtio-gpu-base.c   |  7 +++---
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        |  5 ++--
 hw/display/xenfb.c             | 14 ++++++++---
 hw/vfio/display.c              |  8 +++---
 include/hw/virtio/virtio-gpu.h |  1 +
 include/ui/console.h           |  4 +--
 include/ui/gtk.h               |  2 +-
 ui/console.c                   |  6 -----
 ui/gtk-egl.c                   |  4 +--
 ui/gtk-gl-area.c               |  3 +--
 ui/gtk.c                       | 45 ++++++++++++++++++++--------------
 12 files changed, 54 insertions(+), 46 deletions(-)

-- 
2.32.0 (Apple Git-132)


