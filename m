Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E4738498
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552722.862959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdq-0001kz-11; Wed, 21 Jun 2023 13:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552722.862959; Wed, 21 Jun 2023 13:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdp-0001iy-UA; Wed, 21 Jun 2023 13:12:57 +0000
Received: by outflank-mailman (input) for mailman id 552722;
 Wed, 21 Jun 2023 13:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1p5=CJ=suse.com=petr.pavlu@srs-se1.protection.inumbo.net>)
 id 1qBxdo-0000hv-BO
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:12:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d4e730-1035-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 15:12:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5964221D0A;
 Wed, 21 Jun 2023 13:12:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3ADDA134B1;
 Wed, 21 Jun 2023 13:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kMubDVf3kmQKYQAAMHmgww
 (envelope-from <petr.pavlu@suse.com>); Wed, 21 Jun 2023 13:12:55 +0000
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
X-Inumbo-ID: 55d4e730-1035-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687353175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VXZNBzf99S/Re0auqUhITwZGbKoAylMdpUpWJfqNnEs=;
	b=YxAXnBaeIC1QLya4c71Dnd7MWnN52zRwCYzAtlWAE1NHH/N5NDQTX4/Tu+fwhotb14VGCG
	URAvGQ6eet0QlZYOf2jJtyU9IHTDmMRbNEO7uwZOqD1L1estEo4vZi/CpAF1XL14d0hTFy
	hBOb1LXDca9g4Jek6AAjAjXHtcKL6j0=
From: Petr Pavlu <petr.pavlu@suse.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 2/2] xen/virtio: Avoid use of the dom0 backend in dom0
Date: Wed, 21 Jun 2023 15:12:14 +0200
Message-Id: <20230621131214.9398-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230621131214.9398-1-petr.pavlu@suse.com>
References: <20230621131214.9398-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When attempting to run Xen on a QEMU/KVM virtual machine with virtio
devices (all x86_64), dom0 tries to establish a grant for itself which
eventually results in a hang during the boot.

The backtrace looks as follows, the while loop in __send_control_msg()
makes no progress:

  #0  virtqueue_get_buf_ctx (_vq=_vq@entry=0xffff8880074a8400, len=len@entry=0xffffc90000413c94, ctx=ctx@entry=0x0 <fixed_percpu_data>) at ../drivers/virtio/virtio_ring.c:2326
  #1  0xffffffff817086b7 in virtqueue_get_buf (_vq=_vq@entry=0xffff8880074a8400, len=len@entry=0xffffc90000413c94) at ../drivers/virtio/virtio_ring.c:2333
  #2  0xffffffff8175f6b2 in __send_control_msg (portdev=<optimized out>, port_id=0xffffffff, event=0x0, value=0x1) at ../drivers/char/virtio_console.c:562
  #3  0xffffffff8175f6ee in __send_control_msg (portdev=<optimized out>, port_id=<optimized out>, event=<optimized out>, value=<optimized out>) at ../drivers/char/virtio_console.c:569
  #4  0xffffffff817618b1 in virtcons_probe (vdev=0xffff88800585e800) at ../drivers/char/virtio_console.c:2098
  #5  0xffffffff81707117 in virtio_dev_probe (_d=0xffff88800585e810) at ../drivers/virtio/virtio.c:305
  #6  0xffffffff8198e348 in call_driver_probe (drv=0xffffffff82be40c0 <virtio_console>, drv=0xffffffff82be40c0 <virtio_console>, dev=0xffff88800585e810) at ../drivers/base/dd.c:579
  #7  really_probe (dev=dev@entry=0xffff88800585e810, drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:658
  #8  0xffffffff8198e58f in __driver_probe_device (drv=drv@entry=0xffffffff82be40c0 <virtio_console>, dev=dev@entry=0xffff88800585e810) at ../drivers/base/dd.c:800
  #9  0xffffffff8198e65a in driver_probe_device (drv=drv@entry=0xffffffff82be40c0 <virtio_console>, dev=dev@entry=0xffff88800585e810) at ../drivers/base/dd.c:830
  #10 0xffffffff8198e832 in __driver_attach (dev=0xffff88800585e810, data=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:1216
  #11 0xffffffff8198bfb2 in bus_for_each_dev (bus=<optimized out>, start=start@entry=0x0 <fixed_percpu_data>, data=data@entry=0xffffffff82be40c0 <virtio_console>,
      fn=fn@entry=0xffffffff8198e7b0 <__driver_attach>) at ../drivers/base/bus.c:368
  #12 0xffffffff8198db65 in driver_attach (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/dd.c:1233
  #13 0xffffffff8198d207 in bus_add_driver (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/bus.c:673
  #14 0xffffffff8198f550 in driver_register (drv=drv@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/base/driver.c:246
  #15 0xffffffff81706b47 in register_virtio_driver (driver=driver@entry=0xffffffff82be40c0 <virtio_console>) at ../drivers/virtio/virtio.c:357
  #16 0xffffffff832cd34b in virtio_console_init () at ../drivers/char/virtio_console.c:2258
  #17 0xffffffff8100105c in do_one_initcall (fn=0xffffffff832cd2e0 <virtio_console_init>) at ../init/main.c:1246
  #18 0xffffffff83277293 in do_initcall_level (command_line=0xffff888003e2f900 "root", level=0x6) at ../init/main.c:1319
  #19 do_initcalls () at ../init/main.c:1335
  #20 do_basic_setup () at ../init/main.c:1354
  #21 kernel_init_freeable () at ../init/main.c:1571
  #22 0xffffffff81f64be1 in kernel_init (unused=<optimized out>) at ../init/main.c:1462
  #23 0xffffffff81001f49 in ret_from_fork () at ../arch/x86/entry/entry_64.S:308
  #24 0x0000000000000000 in ?? ()

Fix the problem by preventing xen_grant_init_backend_domid() from
setting dom0 as a backend when running in dom0.

Fixes: 035e3a4321f7 ("xen/virtio: Optimize the setup of "xen-grant-dma" devices")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/xen/grant-dma-ops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 76f6f26265a3..29ed27ac450e 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -362,7 +362,9 @@ static int xen_grant_init_backend_domid(struct device *dev,
 	if (np) {
 		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
 		of_node_put(np);
-	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
+	} else if ((IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) ||
+		    xen_pv_domain()) &&
+		   !xen_initial_domain()) {
 		dev_info(dev, "Using dom0 as backend\n");
 		*backend_domid = 0;
 		ret = 0;
-- 
2.35.3


