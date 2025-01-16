Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A7A135B2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873243.1284251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTo-0005ke-O1; Thu, 16 Jan 2025 08:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873243.1284251; Thu, 16 Jan 2025 08:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLTo-0005VY-Dm; Thu, 16 Jan 2025 08:43:56 +0000
Received: by outflank-mailman (input) for mailman id 873243;
 Thu, 16 Jan 2025 08:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SegZ=UI=desiato.srs.infradead.org=BATV+b63efa7a8ebec188a7bb+7816+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tYLTl-0004BI-8i
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:43:53 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b8a977-d3e6-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 09:43:49 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tYLTe-0000000B1PZ-02zV; Thu, 16 Jan 2025 08:43:46 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYLTc-00000007pHU-1vM7; Thu, 16 Jan 2025 08:43:44 +0000
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
X-Inumbo-ID: 00b8a977-d3e6-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=cRHcaJ8qr8tMPnLKEmxRjL10dz3nijScrW9hqSSprGI=; b=a0JdykAwXTVMSDZdFhhN4Z7cfQ
	+hkqZYOFUzj70KfuL/shYChBrPpS9OMTKdQKym7SM9hE75EgIt1beZsZ0VBiTWMBI1q73n2/jeldh
	vAyBP6Ntre/VpAlcAU3eiPuyy5qA+jQDwXdNq9JuAEyohhdwg3ByFzsHqoGk9rO54aFoxmtz2SyuI
	u871I5zV6ZqIPcS/EyGJfbpuJvQy+1ZQOdWvTJ9iELFBkqicl4xAcN3C2b9ooQu696jWtHhpgL56+
	xGUEtMxgXnjleq3ScpuIxnmoVy21iSD4zLs19jrJgW9gRgdLYTZj9x6/4z7LYj1Lhz0ANBOHl2keZ
	915QaGmQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PULL 0/8] Xen regression fixes and cleanups
Date: Thu, 16 Jan 2025 08:43:24 +0000
Message-ID: <20250116084332.1864967-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The following changes since commit 7433709a147706ad7d1956b15669279933d0f82b:

  Merge tag 'hw-misc-20250113' of https://github.com/philmd/qemu into staging (2025-01-14 12:46:56 -0500)

are available in the Git repository at:

  git://git.infradead.org/users/dwmw2/qemu.git tags/pull-xenfv-20250116

for you to fetch changes up to e7bc0204e57836b3df611b73d2decc56ed698c4a:

  system/runstate: Fix regression, clarify BQL status of exit notifiers (2025-01-15 18:05:19 +0000)

----------------------------------------------------------------
Xen regression fixes and cleanups

----------------------------------------------------------------
David Woodhouse (6):
      hw/xen: Add xs_node_read() helper function
      hw/xen: Use xs_node_read() from xs_node_vscanf()
      hw/xen: Use xs_node_read() from xen_console_get_name()
      hw/xen: Use xs_node_read() from xen_netdev_get_name()
      hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it
      hw/xen: Fix errp handling in xen_console

Phil Dennis-Jordan (1):
      system/runstate: Fix regression, clarify BQL status of exit notifiers

Roger Pau Monné (1):
      xen: do not use '%ms' scanf specifier

 hw/block/xen-block.c            |  3 ++-
 hw/char/xen_console.c           | 56 ++++++++++++++++++++++++-----------------
 hw/net/xen_nic.c                | 13 +++++-----
 hw/xen/trace-events             |  2 +-
 hw/xen/xen-bus-helper.c         | 37 ++++++++++++++++++++-------
 hw/xen/xen-bus.c                | 14 +++++++++--
 hw/xen/xen_pvdev.c              |  6 ++---
 include/hw/xen/xen-bus-helper.h |  9 +++++++
 include/hw/xen/xen-bus.h        |  1 +
 include/system/system.h         |  1 +
 system/runstate.c               |  1 +
 11 files changed, 96 insertions(+), 47 deletions(-)

