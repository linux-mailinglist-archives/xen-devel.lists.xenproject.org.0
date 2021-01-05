Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A173A2EB69A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 00:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62250.110142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwwEj-0000y8-SC; Tue, 05 Jan 2021 23:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62250.110142; Tue, 05 Jan 2021 23:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwwEj-0000xj-O2; Tue, 05 Jan 2021 23:59:37 +0000
Received: by outflank-mailman (input) for mailman id 62250;
 Tue, 05 Jan 2021 23:59:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kP6e=GI=casper.srs.infradead.org=batv+73a5e258de49c44b2502+6344+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kwwEh-0000xb-Fo
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 23:59:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fb065a6-6b15-4fc7-99b0-dadfee89b7f3;
 Tue, 05 Jan 2021 23:59:33 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kwwCy-001o4U-Da; Tue, 05 Jan 2021 23:58:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kwwCx-001NA4-3l; Tue, 05 Jan 2021 23:57:47 +0000
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
X-Inumbo-ID: 0fb065a6-6b15-4fc7-99b0-dadfee89b7f3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FcK3fhrVznEbdRpdT0TicGcDBRlISczcfsEo7T/B7GI=; b=ptbcejzVld5w0aflODeTYUC8zk
	QWC/7DZfjWwCRA0eyFONKDZ9OjxbrRCysiOiRXhnf1ZLjMzTOrfvwLwrdSKR6TkfXI6eyZDS7DgL5
	xSwwrdzI+k2f+vNyVNQ5YeNVKdFKjwntffK4+ykgJfZAZYCtR9WHPLQx7BLtX2JjwsXPi8M/F63va
	r7+zkdTW3cLRzlrZhKx7H9lyDMpLm/I6GkwNq/wYoWcTP1ciUOzBooBE5iN40xQNBX7u4W6Ql42sS
	XuJkL+broUup505O/sLoJy0BGlyLA1eNsOJAZjnDZ2deJX4uaAxq6zb7jTA8Bco5V/X8MJZn2+QHg
	OYWYKAbg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/5] Xen INTX/GSI event channel delivery fixes
Date: Tue,  5 Jan 2021 23:57:31 +0000
Message-Id: <20210105235736.326797-1-dwmw2@infradead.org>
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

David Woodhouse (5):
      xen: Fix event channel callback via INTX/GSI
      xen: Set platform PCI device INTX affinity to CPU0
      x86/xen: Add a no_vector_callback option to test PCI INTX delivery
      x86/xen: Don't register Xen IPIs when they aren't going to be used
      x86/xen: Fix xen_hvm_smp_init() when vector callback not available

 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 arch/arm/xen/enlighten.c                        |  2 +-
 arch/x86/xen/enlighten_hvm.c                    | 15 ++++++++++++---
 arch/x86/xen/smp_hvm.c                          | 27 +++++++++++++++++----------
 drivers/xen/events/events_base.c                | 10 ----------
 drivers/xen/platform-pci.c                      |  8 +++++++-
 drivers/xen/xenbus/xenbus.h                     |  1 +
 drivers/xen/xenbus/xenbus_comms.c               |  8 --------
 drivers/xen/xenbus/xenbus_probe.c               | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
 include/xen/xenbus.h                            |  2 +-
 10 files changed, 97 insertions(+), 48 deletions(-)




