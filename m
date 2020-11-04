Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E52A5F2F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 09:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18836.43865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDxU-0000S2-5t; Wed, 04 Nov 2020 08:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18836.43865; Wed, 04 Nov 2020 08:15:56 +0000
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
	id 1kaDxU-0000RU-2b; Wed, 04 Nov 2020 08:15:56 +0000
Received: by outflank-mailman (input) for mailman id 18836;
 Wed, 04 Nov 2020 08:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaDxS-0000Pk-3t
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:15:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 06b591f8-6124-46e8-9693-126333d10666;
 Wed, 04 Nov 2020 08:15:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DA8DACB6;
 Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaDxS-0000Pk-3t
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:15:54 +0000
X-Inumbo-ID: 06b591f8-6124-46e8-9693-126333d10666
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 06b591f8-6124-46e8-9693-126333d10666;
	Wed, 04 Nov 2020 08:15:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604477751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t0nui2j85lczmOaB6wvrDxMdOES61kNj5LWlu/C7qc0=;
	b=n6NChhe8h/R0Eli5x84sYWWmkbcjIZvdWwYZY/We62l16UTqmbbV7McACk35CFCye39EMF
	kp4CBCXxdsBCHFC0dpUPqrja7jnhBS2SVV1RlgxYWMmqHY2OxYi/I6hl9+m9XCXpdd3+0b
	udN9I2E78uWUwIWzuor4bj5rfnuWG5I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4DA8DACB6;
	Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
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
Subject: [PATCH v3 0/3] xen/locking: fix and enhance lock debugging
Date: Wed,  4 Nov 2020 09:15:46 +0100
Message-Id: <20201104081549.3712-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series fixes two issues with spinlock debug code and adds
lock debug code to rwlocks in order to catch IRQ violations.

Juergen Gross (3):
  xen/spinlocks: spin_trylock with interrupts off is always fine
  xen/locking: harmonize spinlocks and rwlocks regarding preemption
  xen/rwlock: add check_lock() handling to rwlocks

 xen/common/spinlock.c      | 22 ++++++++++++++--------
 xen/include/xen/rwlock.h   | 15 +++++++++++++++
 xen/include/xen/spinlock.h |  2 ++
 3 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.26.2


