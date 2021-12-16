Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9F4769E2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 06:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247720.427166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxjZn-00056b-20; Thu, 16 Dec 2021 05:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247720.427166; Thu, 16 Dec 2021 05:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxjZm-00054d-UW; Thu, 16 Dec 2021 05:45:10 +0000
Received: by outflank-mailman (input) for mailman id 247720;
 Thu, 16 Dec 2021 05:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mxjZl-00054V-5l
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 05:45:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b0bcf5-5e33-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 06:45:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B99B212C8;
 Thu, 16 Dec 2021 05:45:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFFBC13BE1;
 Thu, 16 Dec 2021 05:45:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mzKOOGHSumHbDQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Dec 2021 05:45:05 +0000
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
X-Inumbo-ID: 52b0bcf5-5e33-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639633506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7oolKMpaSQxd85FFwYfxPvPQTAnBdWoIFTsi9p/rRdw=;
	b=UOol0YEz+0/MWvzrQvIE+kJXYxegUV4G222i78uCPMuN4d3tZa/jKch/bkJypjlnFmsLGd
	bzjFjAMEySmAfliUjHGuTJGAhsb6J6/E5S3/y344sOWxZABmKfod/6frjHdvWZezZ1FGLH
	Nrh1CCBBTmZOkzZk4cuRSSf/FnhPN88=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen: make some per-scheduler performance counters sched global ones
Date: Thu, 16 Dec 2021 06:45:02 +0100
Message-Id: <20211216054502.14085-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some performance counters listed to be credit or credit2 specific are
being used by the null scheduler, too.

Make those sched global ones.

Fixes: ab6ba8c6753fa76 ("perfc: conditionalize credit/credit2 counters")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xen/perfc_defn.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 672b51c456..0027d95a60 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -34,6 +34,9 @@ PERFCOUNTER(tickled_idle_cpu,       "sched: tickled_idle_cpu")
 PERFCOUNTER(tickled_idle_cpu_excl,  "sched: tickled_idle_cpu_exclusive")
 PERFCOUNTER(tickled_busy_cpu,       "sched: tickled_busy_cpu")
 PERFCOUNTER(unit_check,             "sched: unit_check")
+PERFCOUNTER(migrate_running,        "sched: migrate_running")
+PERFCOUNTER(migrate_on_runq,        "sched: migrate_on_runq")
+PERFCOUNTER(migrated,               "sched: migrated")
 
 /* credit specific counters */
 #ifdef CONFIG_SCHED_CREDIT
@@ -55,7 +58,6 @@ PERFCOUNTER(steal_trylock,          "csched: steal_trylock")
 PERFCOUNTER(steal_trylock_failed,   "csched: steal_trylock_failed")
 PERFCOUNTER(steal_peer_idle,        "csched: steal_peer_idle")
 PERFCOUNTER(migrate_queued,         "csched: migrate_queued")
-PERFCOUNTER(migrate_running,        "csched: migrate_running")
 PERFCOUNTER(migrate_kicked_away,    "csched: migrate_kicked_away")
 PERFCOUNTER(unit_hot,               "csched: unit_hot")
 #endif
@@ -67,13 +69,11 @@ PERFCOUNTER(acct_load_balance,      "csched2: acct_load_balance")
 PERFCOUNTER(upd_max_weight_quick,   "csched2: update_max_weight_quick")
 PERFCOUNTER(upd_max_weight_full,    "csched2: update_max_weight_full")
 PERFCOUNTER(migrate_requested,      "csched2: migrate_requested")
-PERFCOUNTER(migrate_on_runq,        "csched2: migrate_on_runq")
 PERFCOUNTER(migrate_no_runq,        "csched2: migrate_no_runq")
 PERFCOUNTER(runtime_min_timer,      "csched2: runtime_min_timer")
 PERFCOUNTER(runtime_max_timer,      "csched2: runtime_max_timer")
 PERFCOUNTER(pick_resource,          "csched2: pick_resource")
 PERFCOUNTER(need_fallback_cpu,      "csched2: need_fallback_cpu")
-PERFCOUNTER(migrated,               "csched2: migrated")
 PERFCOUNTER(migrate_resisted,       "csched2: migrate_resisted")
 PERFCOUNTER(credit_reset,           "csched2: credit_reset")
 PERFCOUNTER(deferred_to_tickled_cpu,"csched2: deferred_to_tickled_cpu")
-- 
2.26.2


