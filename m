Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B020C7E1E8A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627882.978786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1j-00025v-8j; Mon, 06 Nov 2023 10:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627882.978786; Mon, 06 Nov 2023 10:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1j-0001t7-1d; Mon, 06 Nov 2023 10:40:15 +0000
Received: by outflank-mailman (input) for mailman id 627882;
 Mon, 06 Nov 2023 10:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qzx1h-00010s-1n
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:40:13 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db3f9ead-7c90-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 11:40:09 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qzx1R-00ARzt-0U; Mon, 06 Nov 2023 10:39:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1qzx1P-000qFu-2O; Mon, 06 Nov 2023 10:39:55 +0000
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
X-Inumbo-ID: db3f9ead-7c90-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=8hFASJ6FJkP5+9JiryopkqrFh+wE1Upzc1d8akCwXKw=; b=HsrZzoi7oxWmojvdJbVOfncH0N
	LbE/oaY1cF3jW518bYSyd7CXECURPhDuOuFEE8NyoL8eFV3GGox+Hzctzdk+/TrfqieRU1enW9yFr
	9QS6NRkLSjfqmAQLbcdxS3Gb1+iD4xJilLEbyoaeMSg2pJ4JawL966SDpIEVrq04r+qmKAXrLxj4e
	ZX45hY+bYHsbjDE//upJSGdIXJBW9tqgCeakGBy0fTLvjj0NoQi92EG8h6lsFZHgKf7HrBEqMiegB
	Myb8iENcsbB7PG7qHQYJleGczojpxfri7o1i2f3titfD/eMwazbQ+Pf+kPbTTzWI8D2JtXw0NnvD8
	By83/WAw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org
Subject: [PULL 0/7] xenfv-stable queue
Date: Mon,  6 Nov 2023 10:39:48 +0000
Message-ID: <20231106103955.200867-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

The following changes since commit d762bf97931b58839316b68a570eecc6143c9e3e:

  Merge tag 'pull-target-arm-20231102' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-11-03 10:04:12 +0800)

are available in the Git repository at:

  git://git.infradead.org/users/dwmw2/qemu.git tags/pull-xenfv-stable-20231106

for you to fetch changes up to a1c1082908dde4867b1ac55f546bea0c17d52318:

  hw/xen: use correct default protocol for xen-block on x86 (2023-11-06 10:03:45 +0000)

----------------------------------------------------------------
Bugfixes for emulated Xen support

Selected bugfixes for mainline and stable, especially to the per-vCPU
local APIC vector delivery mode for event channel notifications, which
was broken in a number of ways.

The xen-block driver has been defaulting to the wrong protocol for x86
guest, and this fixes that — which is technically an incompatible change
but I'm fairly sure nobody relies on the broken behaviour (and in
production I *have* seen guests which rely on the correct behaviour,
which now matches the blkback driver in the Linux kernel).

A handful of other simple fixes for issues which came to light as new
features (qv) were being developed.

----------------------------------------------------------------
David Woodhouse (7):
      i386/xen: Don't advertise XENFEAT_supervisor_mode_kernel
      i386/xen: fix per-vCPU upcall vector for Xen emulation
      hw/xen: select kernel mode for per-vCPU event channel upcall vector
      hw/xen: don't clear map_track[] in xen_gnttab_reset()
      hw/xen: fix XenStore watch delivery to guest
      hw/xen: take iothread mutex in xen_evtchn_reset_op()
      hw/xen: use correct default protocol for xen-block on x86

 hw/block/xen-block.c       | 10 +++++++---
 hw/i386/kvm/xen_evtchn.c   |  7 +++++++
 hw/i386/kvm/xen_gnttab.c   |  2 --
 hw/i386/kvm/xen_xenstore.c |  8 +++++---
 include/sysemu/kvm_xen.h   |  1 +
 target/i386/kvm/xen-emu.c  | 16 +++++++++++-----
 6 files changed, 31 insertions(+), 13 deletions(-)

