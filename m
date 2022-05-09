Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23851FEDE
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324578.546691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3o8-00084j-Gq; Mon, 09 May 2022 13:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324578.546691; Mon, 09 May 2022 13:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3o8-00081H-DH; Mon, 09 May 2022 13:52:16 +0000
Received: by outflank-mailman (input) for mailman id 324578;
 Mon, 09 May 2022 13:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9uc=VR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1no3o6-00081B-FH
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:52:14 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9fb32f-cf9f-11ec-a406-831a346695d4;
 Mon, 09 May 2022 15:52:13 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id l19so17106722ljb.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 May 2022 06:52:13 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a2eb790000000b0024f3d1dae7csm1817440ljo.4.2022.05.09.06.52.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 06:52:11 -0700 (PDT)
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
X-Inumbo-ID: 3a9fb32f-cf9f-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=8UNXwi7En+f6mmpMgmfaP7ZbRHw3s6lmPr0wkjJTWaM=;
        b=P1cUqIcKS0Pz77ERJTJIQfingexbjURyhZ0OwewbC1M1aOsav69UutqdBtMfQ2HXDU
         zwMc4ZqdjbbEZed4ctX0ISGY93zAHp+FkVsiizCineeISfdlHBWkxxYTA0u/59FHnYL4
         +N+Xi1zvo4muTCVv7U54Y5d/VIpAlFFjqBUH0fPhjOPM7u+sC0MedLFgN+Bw1y1tTQqa
         6tlQgIGVvMEZ2SElF+ZcQb1FjKEGe7QWDp6QRC8kG64/7JRbCq4DfHWoZtIurPkbhK80
         9PjzRN96KbCSEDRXZA79tahFCEynlyePLykguWyKDG2ziMwLn6TxgZy/2S1GIERvRUrc
         klng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8UNXwi7En+f6mmpMgmfaP7ZbRHw3s6lmPr0wkjJTWaM=;
        b=YEZukwkVkonWFhZwyxYzwAopS+cmoASh/5qhrZXZRgcQXL9q8maG7AxC1CVc3OwiaX
         nuyXCBl6UMe1pPlaGxXG0dVj+zcohIQIbnXmFkY3knKxBKTUkrQlJ2C5sYudjAbjKi+a
         +Zc0GrO2Za1IAIGpcXGppDLWctzR3RopFNI7p1nTT+9GkKjGl2L7TvuC2R/DjVx4fDO3
         X1K/UNNs3F829gtkBJ7G3SNAlZwF+Slo3yWS2bQlTJiNy+bohBUtjqr0X0NDp0jwanJQ
         GoqqLHQwVD6Cp3CtuZQXsFkvYT/zFW1jp/HdTWsYB4iYgdJ0sdz1KrCJVPI2ptaCrwHS
         Fbxw==
X-Gm-Message-State: AOAM532L0HqXSZvNurpKF+qQnrqC2s9QqAcQ4qQoLw4429K/o5CDUEV0
	kupvVBKPrrb6eMYk5Pbfkb2vYkRdi7g=
X-Google-Smtp-Source: ABdhPJzJiKpFr+qJniu4vmrliAJnDQM5Cx7W/ly6EkrD5z16nFtffkMwE9R1AM8IQBk5F/7wNvlTTg==
X-Received: by 2002:a2e:a7c4:0:b0:250:5c78:9a99 with SMTP id x4-20020a2ea7c4000000b002505c789a99mr10624317ljp.10.1652104332211;
        Mon, 09 May 2022 06:52:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	dri-devel@lists.freedesktop.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
Date: Mon,  9 May 2022 16:51:43 +0300
Message-Id: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

With Xen PV Display driver in use the "expected" VM_DONTEXPAND flag
is not set (neither explicitly nor implicitly), so the driver hits
the code path in drm_gem_mmap_obj() which triggers the WARNING.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
This patch eliminates a WARNING which occurs during running any user space
application over drm (weston, modetest, etc) using PV Display frontend
in Xen guest (it worth mentioning the frontend still works despite the WARNING):

root@salvator-x-h3-4x2g-xt-domu:~# modetest -M xendrm-du -s 31:1920x1080
(XEN) common/grant_table.c:1882:d2v0 Expanding d2 grant table from 5 to 9 frames
[   31.566759] ------------[ cut here ]------------
[   31.566811] WARNING: CPU: 0 PID: 235 at drivers/gpu/drm/drm_gem.c:1055 drm_gem_mmap_obj+0x16c/0x180
[   31.566864] Modules linked in:
[   31.566886] CPU: 0 PID: 235 Comm: modetest Not tainted 5.18.0-rc4-yocto-standard-00009-gabe87d78bbc9 #1
[   31.566922] Hardware name: XENVM-4.17 (DT)
[   31.566940] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.566973] pc : drm_gem_mmap_obj+0x16c/0x180
[   31.567001] lr : drm_gem_mmap_obj+0x78/0x180
[   31.567026] sp : ffff800009d03bb0
[   31.567044] x29: ffff800009d03bb0 x28: 0000000000000008 x27: ffff0001c42d43c0
[   31.567080] x26: ffff0001c42d4cc0 x25: 00000000000007e9 x24: ffff0001c0136000
[   31.567116] x23: ffff0001c0310000 x22: ffff0001c4002b80 x21: 0000000000000000
[   31.567150] x20: ffff0001c42d43c0 x19: ffff0001c0137600 x18: 0000000000000001
[   31.567186] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000035c81
[   31.567220] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[   31.567258] x11: 0000000000100000 x10: 0000ffff95d69000 x9 : ffff0001c435ac30
[   31.567294] x8 : ffff8001f65ce000 x7 : 0000000000000001 x6 : ffff0001c24de000
[   31.567329] x5 : ffff800009d03a10 x4 : 0000000000000090 x3 : 0000000010046400
[   31.567365] x2 : 00000000000007e9 x1 : 9dd8cb7c02b1bd00 x0 : 00000000100000fb
[   31.567401] Call trace:
[   31.567415]  drm_gem_mmap_obj+0x16c/0x180
[   31.567439]  drm_gem_mmap+0x128/0x228
[   31.567460]  mmap_region+0x384/0x5a0
[   31.567484]  do_mmap+0x354/0x4f0
[   31.567505]  vm_mmap_pgoff+0xdc/0x108
[   31.567529]  ksys_mmap_pgoff+0x1b8/0x208
[   31.567550]  __arm64_sys_mmap+0x30/0x48
[   31.567576]  invoke_syscall+0x44/0x108
[   31.567599]  el0_svc_common.constprop.0+0xcc/0xf0
[   31.567629]  do_el0_svc+0x24/0x88
[   31.567649]  el0_svc+0x2c/0x88
[   31.567686]  el0t_64_sync_handler+0xb0/0xb8
[   31.567708]  el0t_64_sync+0x18c/0x190
[   31.567731] ---[ end trace 0000000000000000 ]---
setting mode 1920x1080-60.00Hz@XR24 on connectors 31, crtc 34
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 5a5bf4e..e31554d 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -71,7 +71,7 @@ static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
 	 * the whole buffer.
 	 */
 	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
 	vma->vm_pgoff = 0;
 
 	/*
-- 
2.7.4


