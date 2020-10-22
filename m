Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A429596F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10198.27033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVEz-0006L9-PU; Thu, 22 Oct 2020 07:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10198.27033; Thu, 22 Oct 2020 07:42:29 +0000
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
	id 1kVVEz-0006KU-J9; Thu, 22 Oct 2020 07:42:29 +0000
Received: by outflank-mailman (input) for mailman id 10198;
 Thu, 22 Oct 2020 07:42:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVEx-0006JQ-D6
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cac8e64-9e80-4c77-ab36-e75ad67bb889;
 Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDAE6B1A0;
 Thu, 22 Oct 2020 07:42:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVEx-0006JQ-D6
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:27 +0000
X-Inumbo-ID: 4cac8e64-9e80-4c77-ab36-e75ad67bb889
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4cac8e64-9e80-4c77-ab36-e75ad67bb889;
	Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603352545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FBBqK8HW3BIG0quz5o+GZ5G2pN19linyD06f3Ehf/3E=;
	b=Ku/7Poc7X6u54p4uLBdhgxlQmb+7ztGf4Y5XEcudfV9uDHBPLfP+yYzYjwltr+6HoxAx00
	U8V2bJtnD3lNNDInjMXYmr+eYx10+JmswutopyP/xpQsysO6ymER2ClLDV3NEERFMUEHlX
	yGSnKxIue8rBtuqwUSMoyv8L2q/GI+g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BDAE6B1A0;
	Thu, 22 Oct 2020 07:42:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/5] xen: event handling cleanup
Date: Thu, 22 Oct 2020 09:42:09 +0200
Message-Id: <20201022074214.21693-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some cleanups in Xen event handling code.

Juergen Gross (5):
  xen: remove no longer used functions
  xen/events: make struct irq_info private to events_base.c
  xen/events: only register debug interrupt for 2-level events
  xen/events: unmask a fifo event channel only if it was masked
  Documentation: add xen.fifo_events kernel parameter description

 .../admin-guide/kernel-parameters.txt         |  7 ++
 arch/x86/xen/smp.c                            | 19 ++--
 arch/x86/xen/xen-ops.h                        |  2 +
 drivers/xen/events/events_2l.c                |  7 +-
 drivers/xen/events/events_base.c              | 90 +++++++++++++------
 drivers/xen/events/events_fifo.c              |  9 +-
 drivers/xen/events/events_internal.h          | 70 ++-------------
 include/xen/events.h                          |  8 --
 8 files changed, 100 insertions(+), 112 deletions(-)

-- 
2.26.2


