Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A5587D13
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379311.612660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrw9-00025o-Fj; Tue, 02 Aug 2022 13:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379311.612660; Tue, 02 Aug 2022 13:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrw9-0001y7-BR; Tue, 02 Aug 2022 13:27:53 +0000
Received: by outflank-mailman (input) for mailman id 379311;
 Tue, 02 Aug 2022 13:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPAu=YG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIrw7-0001vW-Pa
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:27:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e76c1724-1266-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 15:27:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7355320488;
 Tue,  2 Aug 2022 13:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BC031345B;
 Tue,  2 Aug 2022 13:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9ZcREVUm6WLWWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Aug 2022 13:27:49 +0000
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
X-Inumbo-ID: e76c1724-1266-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659446869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zJQ40xMxOuEwvjn9yp7ihnm9ndksopcSIKUbpJnaJQs=;
	b=NgvjluxAQh0QrvpbCUYQPoAiEyw5j9eQlG9Lb0SHZemABJ1kRJKzWxSR/WCSKg8ziGqJNS
	BOI6t/CED0ZjBeiFFjKk8x8olTrihSHjNjcThr0rX+Ymjm0YQYorFl8E2atqBUjYrVDXEF
	tkomIBBD/fedWsAZ86hzytllMpwY5nU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 0/3] xen/sched: fix cpu hotplug
Date: Tue,  2 Aug 2022 15:27:44 +0200
Message-Id: <20220802132747.22507-1-jgross@suse.com>
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

Juergen Gross (3):
  xen/sched: introduce cpupool_update_node_affinity()
  xen/sched: carve out memory allocation and freeing from
    schedule_cpu_rm()
  xen/sched: fix cpu hotplug

 xen/common/sched/core.c    | 198 +++++++++++++++++++++----------------
 xen/common/sched/cpupool.c | 119 +++++++++++++++++-----
 xen/common/sched/private.h |  21 +++-
 3 files changed, 229 insertions(+), 109 deletions(-)

-- 
2.35.3


