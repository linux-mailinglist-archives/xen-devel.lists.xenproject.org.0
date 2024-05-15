Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A198C699F
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722491.1126500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GVm-0003ch-2A; Wed, 15 May 2024 15:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722491.1126500; Wed, 15 May 2024 15:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GVl-0003aV-VG; Wed, 15 May 2024 15:25:45 +0000
Received: by outflank-mailman (input) for mailman id 722491;
 Wed, 15 May 2024 15:25:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8u5V=MS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s7GVk-0003aP-VP
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:25:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65336009-12cf-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:25:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2384333CBF;
 Wed, 15 May 2024 15:25:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8227136A8;
 Wed, 15 May 2024 15:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /eAeN/bTRGaQZgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 15 May 2024 15:25:42 +0000
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
X-Inumbo-ID: 65336009-12cf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1715786743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=j3CjhN97k6PpzDWO9RwH5pVj4WdhyqdEUtnghfTzbUA=;
	b=QZZ0E2eYd1pEz8IYgr65VMi7Io/yWe3pNagFN9Pr2b7x+n9MFPN2YQMceiqDtWpEfqYu38
	NdT8WqBdmBovXp2uGE5ZZ+MpnbBE9AfNwJJQduXPsPkMVJw3FClYGUwN1ukPo0zWrTVguI
	bPuJSXOXi6v9LOl/MmnHBmh3ZIPHUXY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QZZ0E2eY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1715786743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=j3CjhN97k6PpzDWO9RwH5pVj4WdhyqdEUtnghfTzbUA=;
	b=QZZ0E2eYd1pEz8IYgr65VMi7Io/yWe3pNagFN9Pr2b7x+n9MFPN2YQMceiqDtWpEfqYu38
	NdT8WqBdmBovXp2uGE5ZZ+MpnbBE9AfNwJJQduXPsPkMVJw3FClYGUwN1ukPo0zWrTVguI
	bPuJSXOXi6v9LOl/MmnHBmh3ZIPHUXY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/sched: set all sched_resource data inside locked region for new cpu
Date: Wed, 15 May 2024 17:25:39 +0200
Message-Id: <20240515152539.18714-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2384333CBF
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

When adding a cpu to a scheduler, set all data items of struct
sched_resource inside the locked region, as otherwise a race might
happen (e.g. when trying to access the cpupool of the cpu):

(XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
(XEN) CPU:    45
(XEN) RIP:    e008:[<ffff82d040244cbf>]
common/sched/credit.c#csched_load_balance+0x41/0x877
(XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
(XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
0000000000000000
(XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
ffff83103723d450
(XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8:
0000000000000000
(XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
0000000000000009
(XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
ffff831037253720
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
0000000000f526e0
(XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040244cbf>
(common/sched/credit.c#csched_load_balance+0x41/0x877):
(XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
8b 4e 28 48
<snip>
(XEN) Xen call trace:
(XEN)    [<ffff82d040244cbf>] R
common/sched/credit.c#csched_load_balance+0x41/0x877
(XEN)    [<ffff82d040245a18>] F
common/sched/credit.c#csched_schedule+0x36a/0x69f
(XEN)    [<ffff82d040252644>] F common/sched/core.c#do_schedule+0xe8/0x433
(XEN)    [<ffff82d0402572dd>] F common/sched/core.c#schedule+0x2e5/0x2f9
(XEN)    [<ffff82d040232f35>] F common/softirq.c#__do_softirq+0x94/0xbe
(XEN)    [<ffff82d040232fc8>] F do_softirq+0x13/0x15
(XEN)    [<ffff82d0403075ef>] F arch/x86/domain.c#idle_loop+0x92/0xe6

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: a8c6c623192e ("sched: clarify use cases of schedule_cpu_switch()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0cb33831d2..babac7aad6 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3176,6 +3176,8 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)
 
     sr->scheduler = new_ops;
     sr->sched_priv = ppriv;
+    sr->granularity = cpupool_get_granularity(c);
+    sr->cpupool = c;
 
     /*
      * Reroute the lock to the per pCPU lock as /last/ thing. In fact,
@@ -3188,8 +3190,6 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)
     /* _Not_ pcpu_schedule_unlock(): schedule_lock has changed! */
     spin_unlock_irqrestore(old_lock, flags);
 
-    sr->granularity = cpupool_get_granularity(c);
-    sr->cpupool = c;
     /* The  cpu is added to a pool, trigger it to go pick up some work */
     cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);
 
-- 
2.35.3


