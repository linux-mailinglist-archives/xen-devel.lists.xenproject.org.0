Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA082AB3F9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22267.48527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc3og-00033S-Hz; Mon, 09 Nov 2020 09:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22267.48527; Mon, 09 Nov 2020 09:50:26 +0000
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
	id 1kc3og-000333-F1; Mon, 09 Nov 2020 09:50:26 +0000
Received: by outflank-mailman (input) for mailman id 22267;
 Mon, 09 Nov 2020 09:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc3of-00032t-7a
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b17111e1-d52a-4b74-9f3c-d5d1117e0620;
 Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA563AC1F;
 Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc3of-00032t-7a
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:25 +0000
X-Inumbo-ID: b17111e1-d52a-4b74-9f3c-d5d1117e0620
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b17111e1-d52a-4b74-9f3c-d5d1117e0620;
	Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604915423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FbiVz3bZ42jiEwvKXSrzs/ujY9m/oaZbmYcqH7Jl2W8=;
	b=LJ+u9AbRSLGFjuUb5obEL4y/43RnWgWBmG3ijmXb/e8qP06iCqhDaUUPiKOjquPY49bRer
	BjNSX6RpDozboTHDXnWP3KfBtkQjDYj3Jk8vNNnDZtRBWXUJXl924XEWBkbcV3RF5MMNas
	KLTEMlY9VSF2F8azRD5v99Zwwsl2m/M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA563AC1F;
	Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] xen/x86: implement NMI continuation
Date: Mon,  9 Nov 2020 10:50:18 +0100
Message-Id: <20201109095021.9897-1-jgross@suse.com>
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

Juergen Gross (3):
  xen/x86: add nmi continuation framework
  xen/oprofile: use NMI continuation for sending virq to guest
  xen/x86: issue pci_serr error message via NMI continuation

 xen/arch/x86/apic.c             | 13 +++++++---
 xen/arch/x86/oprofile/nmi_int.c | 20 +++++++++++++--
 xen/arch/x86/traps.c            | 44 ++++++++++++++++++++++++++++-----
 xen/include/asm-x86/nmi.h       | 11 ++++++++-
 xen/include/asm-x86/softirq.h   |  5 ++--
 xen/include/asm-x86/xenoprof.h  |  7 ++++++
 6 files changed, 85 insertions(+), 15 deletions(-)

-- 
2.26.2


