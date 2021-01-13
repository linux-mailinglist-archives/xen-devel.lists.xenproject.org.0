Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF02F4C31
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66527.118229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgB2-0002yW-Dy; Wed, 13 Jan 2021 13:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66527.118229; Wed, 13 Jan 2021 13:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgB2-0002xt-9Z; Wed, 13 Jan 2021 13:27:08 +0000
Received: by outflank-mailman (input) for mailman id 66527;
 Wed, 13 Jan 2021 13:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anHs=GQ=casper.srs.infradead.org=batv+0dec5b2398d3e162eee7+6352+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kzgB0-0002b0-IL
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:27:06 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1abdab93-9a2e-42bd-b5d0-d45bbfac2a82;
 Wed, 13 Jan 2021 13:26:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kzgA5-006IZQ-9A; Wed, 13 Jan 2021 13:26:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzgA4-001m34-Rk; Wed, 13 Jan 2021 13:26:08 +0000
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
X-Inumbo-ID: 1abdab93-9a2e-42bd-b5d0-d45bbfac2a82
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RgJEKIJvp1CJSJD/xsngXv/80JYTP0DUOpwXum6oyaQ=; b=Cds9MKfjQ3VzitZkonf2QEjdMS
	mh6FbxX1WqTPwZuzc8LjtSXpoeK5vdx1e5f9jA/82vV3Z4LrtmNDbgWTJm5j8aT/CIbnQj1EMBoL3
	lAWII0BepLo3uC3YWN6PMrdpg3jPuUF0fgTxctGOdZTs2c21RCK69IgYkT0L9yshhVVeUhiVssCw9
	m70J3HtzP5tXeoRGyRzv93yNHGIyhe3MkGf3eontbW3nM8kkUUT178em7gKfgLrS33jCAiEboWPyS
	G8y2e6Et+C4YqUTH6Mwfwex/2hCkPWsUvfyGpJ/ff2SjFnKrAoT8TN6QGGxJTSs+7DZIw1jtWnTIu
	arDexRwg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v4 0/5] Xen INTX/GSI event channel delivery fixes
Date: Wed, 13 Jan 2021 13:26:01 +0000
Message-Id: <20210113132606.422794-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Fix various breakages with INTX/GSI event channel interrupt delivery,
and add a command line option to test it so that it hopefully doesn't
get so broken again.

Karim attempted to rip this out in 2017 but put it back because it's still
necessary with older versions of Xen. This fixes it properly, and makes it
easier to test. cf. https://lkml.org/lkml/2017/4/10/266

v2:
 • Add no_vector_callback to Documentation/admin-guide/kernel-parameters.txt
 • Further fixes to conditional smp_ops initialisation in xen_hvm_smp_init()

v3:
 • Rename test option to xen_no_vector_callback

v4:
 • Fix unconditional references to xen_have_vector_callback in Arm build

David Woodhouse (5):
      xen: Fix event channel callback via INTX/GSI
      xen: Set platform PCI device INTX affinity to CPU0
      x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
      x86/xen: Don't register Xen IPIs when they aren't going to be used
      x86/xen: Fix xen_hvm_smp_init() when vector callback not available

 Documentation/admin-guide/kernel-parameters.txt |  4 ++
 arch/arm/xen/enlighten.c                        |  2 +-
 arch/x86/xen/enlighten_hvm.c                    | 15 ++++-
 arch/x86/xen/smp_hvm.c                          | 27 ++++++---
 drivers/xen/events/events_base.c                | 10 ---
 drivers/xen/platform-pci.c                      |  8 ++-
 drivers/xen/xenbus/xenbus.h                     |  1 +
 drivers/xen/xenbus/xenbus_comms.c               |  8 ---
 drivers/xen/xenbus/xenbus_probe.c               | 81 ++++++++++++++++++++-----
 include/xen/xenbus.h                            |  2 +-
 10 files changed, 110 insertions(+), 48 deletions(-)




