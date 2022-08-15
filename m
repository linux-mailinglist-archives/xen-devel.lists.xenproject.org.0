Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D2592DD1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387255.623416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXtI-0001XA-Qi; Mon, 15 Aug 2022 11:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387255.623416; Mon, 15 Aug 2022 11:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXtI-0001Tl-No; Mon, 15 Aug 2022 11:04:16 +0000
Received: by outflank-mailman (input) for mailman id 387255;
 Mon, 15 Aug 2022 11:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNXtH-0001TU-2N
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:04:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee88ed6-1c89-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 13:04:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D204D337AA;
 Mon, 15 Aug 2022 11:04:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A47013A93;
 Mon, 15 Aug 2022 11:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 05dJICwo+mLHBgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 11:04:12 +0000
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
X-Inumbo-ID: fee88ed6-1c89-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660561452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lc22WrfxTsd+Zrwt7FMEj+OB2Evxs9hgxovNPNGYDJ8=;
	b=inr1PsrcTBuHJVo8w7Bt7QY22RHYmX/mRx2KY+c+ufCw22kMUW/ZPrHWH0ms3ignJDRQ81
	ThWYjyLzD5RBkozKLhEL3IYcHHkU21WCHI5PK/FVz2j6MIdiaGiaf7jIUGcfJocrwjtlSm
	wKs3LPB7JlwJrCDIuef9rlQXMwL1cFM=
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
Subject: [PATCH v2 0/3] xen/sched: fix cpu hotplug
Date: Mon, 15 Aug 2022 13:04:07 +0200
Message-Id: <20220815110410.19872-1-jgross@suse.com>
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

Changes in V2:
- addressed all comments

Juergen Gross (3):
  xen/sched: introduce cpupool_update_node_affinity()
  xen/sched: carve out memory allocation and freeing from
    schedule_cpu_rm()
  xen/sched: fix cpu hotplug

 xen/common/sched/core.c    | 204 +++++++++++++++++++++++--------------
 xen/common/sched/cpupool.c |  91 ++++++++++++-----
 xen/common/sched/private.h |  21 +++-
 xen/include/xen/sched.h    |   9 +-
 4 files changed, 225 insertions(+), 100 deletions(-)

-- 
2.35.3


