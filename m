Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398748038B2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647119.1009855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnE-0005pY-BD; Mon, 04 Dec 2023 15:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647119.1009855; Mon, 04 Dec 2023 15:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnE-0005nP-7b; Mon, 04 Dec 2023 15:23:32 +0000
Received: by outflank-mailman (input) for mailman id 647119;
 Mon, 04 Dec 2023 15:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAAnD-0005Xf-6L
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:23:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13bc8396-92b9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:23:29 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CA21220CE;
 Mon,  4 Dec 2023 15:23:29 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 03EEE13588;
 Mon,  4 Dec 2023 15:23:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0LZJO/DubWUqJgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 15:23:28 +0000
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
X-Inumbo-ID: 13bc8396-92b9-11ee-9b0f-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Ren=C3=A9=20Winther=20H=C3=B8jgaard?= <renewin@proton.me>
Subject: [PATCH v2 1/3] xen/sched: fix adding offline cpu to cpupool
Date: Mon,  4 Dec 2023 16:23:19 +0100
Message-Id: <20231204152321.16520-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231204152321.16520-1-jgross@suse.com>
References: <20231204152321.16520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Queue-Id: 2CA21220CE
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]

Trying to add an offline cpu to a cpupool can crash the hypervisor,
as the probably non-existing percpu area of the cpu is accessed before
the availability of the cpu is being tested. This can happen in case
the cpupool's granularity is "core" or "socket".

Fix that by testing the cpu to be online.

Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving cpus to/from cpupools")
Reported-by: René Winther Højgaard <renewin@proton.me>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- enhance commit message
---
 xen/common/sched/cpupool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 2e094b0cfa..ad8f608462 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -892,6 +892,8 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
         if ( cpu >= nr_cpu_ids )
             goto addcpu_out;
         ret = -ENODEV;
+        if ( !cpu_online(cpu) )
+            goto addcpu_out;
         cpus = sched_get_opt_cpumask(c->gran, cpu);
         if ( !cpumask_subset(cpus, &cpupool_free_cpus) ||
              cpumask_intersects(cpus, &cpupool_locked_cpus) )
-- 
2.35.3


