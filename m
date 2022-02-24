Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C14C29ED
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278151.475297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBll-0000jz-Jo; Thu, 24 Feb 2022 10:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278151.475297; Thu, 24 Feb 2022 10:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBll-0000gt-GI; Thu, 24 Feb 2022 10:54:45 +0000
Received: by outflank-mailman (input) for mailman id 278151;
 Thu, 24 Feb 2022 10:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNBlk-0000gJ-2G
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:54:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bebbe0e-9560-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:54:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62AAF1F37F;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2258E13A79;
 Thu, 24 Feb 2022 10:54:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LvENB/JjF2L2SQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Feb 2022 10:54:42 +0000
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
X-Inumbo-ID: 2bebbe0e-9560-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645700082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NoMWvYoXeFUJUeVEWMst2TYHSjWrHZfKY2PIDx5QSCo=;
	b=RSKAWO1sYuGsWqAc/ZFWYVq9vG+99/SGIh9NsJ31sT2wFbkSqY/0B4W5KsRBHc1aKPgVpj
	H4ewfp/OJnVaUQoYYHxxEfZ+1q/JPw3niwvwyNvAmwKbsRC2Sbf/Pyj2OQm0qNsiB8U4/N
	5Da3R3Zt9Z/NxWnOLD+lX3TmZuG7bI4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen/spinlock: cleanup struct spinlock
Date: Thu, 24 Feb 2022 11:54:34 +0100
Message-Id: <20220224105436.1480-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock data structure contains two cpu fields for storing the
cpu number of the lock holder (one for debug purposes and one for
recursive spinlocks). Merging them removes a build time limitation for
supporting higher cpu numbers than today.

This series is NOT using more bits for storing the cpu number, but
doing that would now be possible. Taking rwlocks into account it would
be possible now to use 14 bits for the cpu, allowing up to 16383 cpus
without growing the lock related data types.

Juergen Gross (2):
  xen/spinlock: use lock address for lock debug functions
  xen/spinlock: merge recurse_cpu and debug.cpu fields in struct
    spinlock

 xen/arch/x86/mm/mm-locks.h |  6 ++--
 xen/common/spinlock.c      | 70 ++++++++++++++++++++------------------
 xen/include/xen/rwlock.h   | 10 +++---
 xen/include/xen/spinlock.h | 53 +++++++++++++++++------------
 4 files changed, 76 insertions(+), 63 deletions(-)

-- 
2.34.1


