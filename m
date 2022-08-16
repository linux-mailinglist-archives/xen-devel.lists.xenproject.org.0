Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD025957C1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 12:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388165.624758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtZa-0004CV-T1; Tue, 16 Aug 2022 10:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388165.624758; Tue, 16 Aug 2022 10:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtZa-00049c-PD; Tue, 16 Aug 2022 10:13:22 +0000
Received: by outflank-mailman (input) for mailman id 388165;
 Tue, 16 Aug 2022 10:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNtZZ-00049L-5y
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 10:13:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d6452d3-1d4c-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 12:13:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FFA33520D;
 Tue, 16 Aug 2022 10:13:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C1371345B;
 Tue, 16 Aug 2022 10:13:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2k5CEb9t+2IgEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Aug 2022 10:13:19 +0000
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
X-Inumbo-ID: 0d6452d3-1d4c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660644799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Asy5Kgw8PlveUfT7VJ0We2wZuRDth5FOcqrG2UrqP/o=;
	b=b0q0mWVJNkLW8gRJtsLydg9U6/MGkDtxA/2eJfR3PXudV9seHL/zderMKX7oVnMngYUNpL
	Ol/8zOJ6vK2hyx2rUncdFkj2S7zlpbBuIkiYYcA/LZ7UjTISxxEipNEFiuaNDSCNYfk5GR
	Mi9l4eQR/ZRp9obtuHYB1arg4cQFXEY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/3] xen/sched: fix cpu hotplug
Date: Tue, 16 Aug 2022 12:13:14 +0200
Message-Id: <20220816101317.23014-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change in the hypervisor memory allocation framework led to
crashes when unplugging host cpus.

This was due to the (correct) assertion that allocating and freeing
memory is allowed with enabled interrupts only. As the main cpu unplug
operation is done in stop-machine context, this assertion triggers in
debug builds.

Correct that by pre-allocating all needed memory while interrupts are
still on, and free memory after interrupts are enabled again.

Changes in V3:
- addressed all comments

Changes in V2:
- addressed all comments

Juergen Gross (3):
  xen/sched: introduce cpupool_update_node_affinity()
  xen/sched: carve out memory allocation and freeing from
    schedule_cpu_rm()
  xen/sched: fix cpu hotplug

 xen/common/sched/core.c    | 214 ++++++++++++++++++++++++-------------
 xen/common/sched/cpupool.c |  91 +++++++++++-----
 xen/common/sched/private.h |  21 +++-
 xen/include/xen/sched.h    |   9 +-
 4 files changed, 235 insertions(+), 100 deletions(-)

-- 
2.35.3


