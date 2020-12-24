Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D492E2685
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 12:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58705.103459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPC5-0002oZ-PI; Thu, 24 Dec 2020 11:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58705.103459; Thu, 24 Dec 2020 11:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPC5-0002nz-KZ; Thu, 24 Dec 2020 11:54:09 +0000
Received: by outflank-mailman (input) for mailman id 58705;
 Thu, 24 Dec 2020 11:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kri=F4=merlin.srs.infradead.org=batv+2cb6e212460c613e05ba+6332+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ksPC4-0002WC-9S
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 11:54:08 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5766b6fc-144d-4768-b0a3-60064c394132;
 Thu, 24 Dec 2020 11:53:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPBO-0002ay-GR; Thu, 24 Dec 2020 11:53:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ksPBN-00Er3h-Et; Thu, 24 Dec 2020 11:53:25 +0000
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
X-Inumbo-ID: 5766b6fc-144d-4768-b0a3-60064c394132
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=CWqpgSCUvnrq7b7B+0yGpMLnZ4fm4PXiLP5Qys7ltuk=; b=ySAc82PpNgACuCCJH2KsZb1WdI
	ZDCQ0w2KrARzWMVIWhE0keS2Q458z/ZCf2x+2B2mq5ca6fYTcM/sqpw2J05peBINKJdEH129I1vvu
	8brIaIed6lqT6IM8NvBiWqHXdcok2hQ2dizUZ2WfhKviVo5MusF9Roxkt9wHu14xHSSPVC3PiV+Fb
	WxU+J2EgcAwtE2EXLgxGXGU1jc9G85qXtXpFDx6X/ADbZINSXFEnHlw9WJf6OjZgjk8Fu0TN3yQIV
	SHhtDzXt2L3L1H/O8f+B0Xj5C10gvsjQoShi8ukoPfHJ53Zm+HmgmsGl510+hdaWJAhJqI0gRiOFG
	YfEZfXJQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/5] Xen INTX/GSI event channel delivery fixes
Date: Thu, 24 Dec 2020 11:53:18 +0000
Message-Id: <20201224115323.3540130-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

Fix various breakages with INTX/GSI event channel interrupt delivery,
and add a command line option to test it so that it hopefully doesn't
get so broken again.

Karim attempted to rip this out in 2017 but put it back because it's still
necessary with older versions of Xen. This fixes it properly, and makes it
easier to test. cf. https://lkml.org/lkml/2017/4/10/266

David Woodhouse (5):
      xen: Fix event channel callback via INTX/GSI
      xen: Set platform PCI device INTX affinity to CPU0
      x86/xen: Add a no_vector_callback option to test PCI INTX delivery
      x86/xen: Don't register Xen IPIs when they aren't going to be used
      x86/xen: Don't register PV spinlock IPI when it isn't going to be used

 arch/arm/xen/enlighten.c          |  2 +-
 arch/x86/xen/enlighten_hvm.c      | 15 +++++++--
 arch/x86/xen/spinlock.c           |  6 ++--
 drivers/xen/events/events_base.c  | 10 ------
 drivers/xen/platform-pci.c        |  8 ++++-
 drivers/xen/xenbus/xenbus.h       |  1 +
 drivers/xen/xenbus/xenbus_comms.c |  8 -----
 drivers/xen/xenbus/xenbus_probe.c | 68 +++++++++++++++++++++++++++++++--------
 include/xen/xenbus.h              |  2 +-
 9 files changed, 79 insertions(+), 41 deletions(-)



