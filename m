Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED52B0614
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25845.53882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQp-00060u-Ey; Thu, 12 Nov 2020 13:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25845.53882; Thu, 12 Nov 2020 13:14:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQp-00060A-AB; Thu, 12 Nov 2020 13:14:31 +0000
Received: by outflank-mailman (input) for mailman id 25845;
 Thu, 12 Nov 2020 13:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdCQm-0005zc-S4
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23a42ec6-0214-4142-b0a1-782f1d295f5f;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC8ECAC0C;
 Thu, 12 Nov 2020 13:14:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdCQm-0005zc-S4
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:28 +0000
X-Inumbo-ID: 23a42ec6-0214-4142-b0a1-782f1d295f5f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 23a42ec6-0214-4142-b0a1-782f1d295f5f;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605186866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/NumeyEIq/GYgmAInoQJWuElqUDY9EWBkwA0ORU3Hug=;
	b=MPp3qQnDiV9oqyNZqnoKSYdeGjLbMaaYWIblM2YWnpD7mCsCn19g9bG2R5GMeKH2znFXHt
	48AVpaNjql/Krfyb9YFGE3iRQ6N6HrtY6/+sC4r2ftlZDkwN5JOU/wBZwtJS1nSwf4wSjU
	qOujLawr0Dg0hXpmZL+iInWbltmZaz0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CC8ECAC0C;
	Thu, 12 Nov 2020 13:14:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/3] xen/x86: implement NMI continuation
Date: Thu, 12 Nov 2020 14:14:21 +0100
Message-Id: <20201112131424.9930-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sending of a virq event for oprofile to the local vcpu from NMI
to normal interrupt context.

This has been tested with a small test patch using the continuation
framework of patch 1 for all NMIs and doing a print to console in
the continuation handler.

Version 1 of this small series was sent to the security list before.

Changes in V3:
- switched to self-IPI instead of softirq
- added patch 3

Changes in V4:
- use less generic approach

Changes in V5:
- addressed comments

Juergen Gross (3):
  xen/x86: add nmi continuation framework
  xen/oprofile: use NMI continuation for sending virq to guest
  xen/x86: issue pci_serr error message via NMI continuation

 xen/arch/x86/apic.c             | 13 +++++++---
 xen/arch/x86/genapic/x2apic.c   |  1 +
 xen/arch/x86/oprofile/nmi_int.c | 19 ++++++++++++--
 xen/arch/x86/smp.c              |  1 +
 xen/arch/x86/traps.c            | 46 ++++++++++++++++++++++++++++-----
 xen/include/asm-x86/nmi.h       | 11 +++++++-
 xen/include/asm-x86/softirq.h   |  5 ++--
 xen/include/asm-x86/xenoprof.h  |  7 +++++
 8 files changed, 88 insertions(+), 15 deletions(-)

-- 
2.26.2


