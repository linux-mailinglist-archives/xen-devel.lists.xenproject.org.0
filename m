Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9997CCA98
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618330.961851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsold-0005NK-AW; Tue, 17 Oct 2023 18:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618330.961851; Tue, 17 Oct 2023 18:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsold-0005HX-5N; Tue, 17 Oct 2023 18:26:09 +0000
Received: by outflank-mailman (input) for mailman id 618330;
 Tue, 17 Oct 2023 18:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qm1H=F7=casper.srs.infradead.org=BATV+e442e50539a6073fd887+7359+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsolb-0005FN-Gv
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:26:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a22994c3-6d1a-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 20:26:05 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsolL-00DrCr-Or; Tue, 17 Oct 2023 18:25:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsolI-000Pai-1v; Tue, 17 Oct 2023 19:25:48 +0100
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
X-Inumbo-ID: a22994c3-6d1a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NhekjLfYAXI/NswduTKtqNt6rro27mlB+ofHaT2pumE=; b=B54+8xbjN1/D65brxO5gvxQ/+T
	BriBIf5aZLrtEU81d1kSwxCW/2Q3v3Lm07bwmbgF3SCQH8JSxQmJKe5uGO79WY9e17xke6XBjjdug
	5JeG2ysM8oz9d5Gh1rP3rYRl5P74ainBs3yT5G5gthMXGADJTxMAEXPvN+uAvHvF6R4zwYb/AS9Gf
	Cz3UH+oaZQFcSOb2gFv/lXdjJAR36Chk/aNPxjE6H3aijnuu9hYbb4ShIkb/Fkral4HJdgGYifV2n
	jMd/JJwseJX+XdSnaIEPMqA4DDn7AruHt8gpN98o1fSI3bEa9k+BVu+66Reaw/Kf5dh/gqJK5/1UB
	SW5sUDdg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/4] Update QEMU qnic driver to "new" XenDevice model
Date: Tue, 17 Oct 2023 19:25:41 +0100
Message-Id: <20231017182545.97973-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

This has been on my TODO list for a while, and Paul's since 2019. Having 
converted the console driver just to get PV guests booting, I figured I 
should do this one while I still remember how.

The fact that net_cleanup() frees my NIC from underneath me confused
me for a while. Not entirely sure what's going on there. Other devices
seem to survive just because they aren't cleaned up at exit. But XenBus
devices really should be properly cleaned up on exit, because in some
cases they leave detritus in XenStore, which outlives QEMU. So "Don't
Do That Then" doesn't seem like it's the answer.

The default NIC handling is horrid (I mean, before I even looked at it)
but that isn't today's yak to shave...

David Woodhouse (4):
      hw/xen: only remove peers of PCI NICs on unplug
      hw/xen: update Xen PV NIC to XenDevice model
      [WTF] avoid qemu_del_nic() in xen_netdev_unrealize() on shutdown
      hw/i386/pc: support '-nic' for xen-net-device

 hw/i386/pc.c               |  11 ++-
 hw/i386/pc_piix.c          |   2 +-
 hw/i386/pc_q35.c           |   2 +-
 hw/i386/xen/xen_platform.c |   9 ++-
 hw/net/meson.build         |   2 +-
 hw/net/trace-events        |   9 +++
 hw/net/xen_nic.c           | 434 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------
 hw/xen/xen-bus.c           |   4 +-
 hw/xenpv/xen_machine_pv.c  |   1 -
 include/hw/i386/pc.h       |   4 +-
 include/hw/xen/xen-bus.h   |   2 +-
 11 files changed, 373 insertions(+), 107 deletions(-)



