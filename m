Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D259F2A2B49
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 14:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17641.42408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZZdd-0007rp-Bb; Mon, 02 Nov 2020 13:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17641.42408; Mon, 02 Nov 2020 13:12:45 +0000
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
	id 1kZZdd-0007rP-8Q; Mon, 02 Nov 2020 13:12:45 +0000
Received: by outflank-mailman (input) for mailman id 17641;
 Mon, 02 Nov 2020 13:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZZdb-0007rF-9m
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:12:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e6f08998-ba57-4cb0-b617-e8048056c0f4;
 Mon, 02 Nov 2020 13:12:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98FD6B8E4;
 Mon,  2 Nov 2020 13:12:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZZdb-0007rF-9m
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:12:43 +0000
X-Inumbo-ID: e6f08998-ba57-4cb0-b617-e8048056c0f4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id e6f08998-ba57-4cb0-b617-e8048056c0f4;
	Mon, 02 Nov 2020 13:12:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604322761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2E8DyD98Ac4pDiAkzO0onJ0vvorQRsLItcjw4sbcAOA=;
	b=g2SX6IO7NtiWY/T/JCrKCwH/FknIsXtCCowAfOc8vFserqcrfAErCX8WJX9sMP9dJ332mf
	8q2jgNwf1UECS/tlrRK30ZpXHX6FWgeUpGF8msz/YdzLLyt0xvRxwzv4oFlpF6D9gvEkOD
	u2TTxW6Ye2/aFyx75jZXDsjKJZxCMvE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 98FD6B8E4;
	Mon,  2 Nov 2020 13:12:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] xen/locking: fix and enhance lock debugging
Date: Mon,  2 Nov 2020 14:12:37 +0100
Message-Id: <20201102131239.14134-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series fixes two issues with spinlock debug code and adds
lock debug code to rwlocks in order to catch IRQ violations.

Juergen Gross (2):
  xen/spinlocks: spin_trylock with interrupts off is always fine
  xen/rwlock: add check_lock() handling to rwlocks

 xen/common/spinlock.c      | 17 ++++++++++-------
 xen/include/xen/rwlock.h   | 11 +++++++++++
 xen/include/xen/spinlock.h |  2 ++
 3 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.26.2


