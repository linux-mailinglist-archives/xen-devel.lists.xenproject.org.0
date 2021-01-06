Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE782EC08A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 16:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62535.110813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAvB-0004sr-8I; Wed, 06 Jan 2021 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62535.110813; Wed, 06 Jan 2021 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAvB-0004sS-4o; Wed, 06 Jan 2021 15:40:25 +0000
Received: by outflank-mailman (input) for mailman id 62535;
 Wed, 06 Jan 2021 15:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BkQ=GJ=merlin.srs.infradead.org=batv+c1eea7d49f76ef5ed0ab+6345+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kxAv8-0004s7-Ba
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 15:40:23 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e57598-53c7-4bd2-b736-f1dfe1bd3601;
 Wed, 06 Jan 2021 15:40:17 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxAuo-00024K-KE; Wed, 06 Jan 2021 15:40:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kxAul-002S1u-Sj; Wed, 06 Jan 2021 15:39:59 +0000
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
X-Inumbo-ID: a4e57598-53c7-4bd2-b736-f1dfe1bd3601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1k3xgbFuPVzu0CuW7Xww0iUFLc1cyUBUTPqcc5SanOM=; b=skzKdipohNRIK45Bwb1L54ppnd
	1I9XW6+2s++nEKGjRPH4N3KYttKiz/7yPbnyLnvb1UWH0KnT/vR+Wly5TWdkLEyNeTERg8RzHcqRN
	LLJJL7NXALHlmvZCtVRn17VOH9mD2tVgcw7ZyKEsWuI0F8PjASP+OZzXzzAAR8Wj8+HYReAY8zw5d
	J0H8H5g6uxbJ/c8xiyC0il+g78euDDlhz+Gpr293FnfyFg3l/JOKqyJhqhf50owdM44ftmV9vfIS5
	lms5Uy0tY0HIh+N3KyMEDydE48QAao6HcQeaVMrEMHtIrtiqVSP5chnw2McYWcwr9NlpWysY7G8A0
	NRyXr+9Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 0/5] Xen INTX/GSI event channel delivery fixes
Date: Wed,  6 Jan 2021 15:39:53 +0000
Message-Id: <20210106153958.584169-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

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

David Woodhouse (5):
      xen: Fix event channel callback via INTX/GSI
      xen: Set platform PCI device INTX affinity to CPU0
      x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
      x86/xen: Don't register Xen IPIs when they aren't going to be used
      x86/xen: Fix xen_hvm_smp_init() when vector callback not available

 Documentation/admin-guide/kernel-parameters.txt |  4 ++
 arch/arm/xen/enlighten.c                        |  2 +-
 arch/x86/xen/enlighten_hvm.c                    | 15 ++++--
 arch/x86/xen/smp_hvm.c                          | 27 ++++++----
 drivers/xen/events/events_base.c                | 10 ----
 drivers/xen/platform-pci.c                      |  8 ++-
 drivers/xen/xenbus/xenbus.h                     |  1 +
 drivers/xen/xenbus/xenbus_comms.c               |  8 ---
 drivers/xen/xenbus/xenbus_probe.c               | 68 ++++++++++++++++++++-----
 include/xen/xenbus.h                            |  2 +-
 10 files changed, 97 insertions(+), 48 deletions(-)



