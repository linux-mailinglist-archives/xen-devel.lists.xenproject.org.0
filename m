Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F16917863
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 07:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748353.1156044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMLc3-0001la-6P; Wed, 26 Jun 2024 05:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748353.1156044; Wed, 26 Jun 2024 05:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMLc3-0001iV-3e; Wed, 26 Jun 2024 05:54:35 +0000
Received: by outflank-mailman (input) for mailman id 748353;
 Wed, 26 Jun 2024 05:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sMLc1-0001i9-Fr
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 05:54:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df143aa-3380-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 07:54:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBDD021A56;
 Wed, 26 Jun 2024 05:54:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8944713ABD;
 Wed, 26 Jun 2024 05:54:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id P71zHxWte2Y0LgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Jun 2024 05:54:29 +0000
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
X-Inumbo-ID: 8df143aa-3380-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719381269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=clV7ss7HqK/u0Op19fT3KuCZ48T+wC3u7mMBevY6n7k=;
	b=fYjwqLOiQF4qpYPIFNEqhl3vUV66nUDlg/6CNhMb5/R+64wLtXf/Fwgq8mUezsQn4vfWFd
	bAodLrsXmYHjGqqWOEZ6OUT9ZmViinmja/0MZkYHqjYZtznk4E22CBj4/LO4si1MPwF2c/
	ZGwIp0uHwt0E+wyuI38eRJNXBpLKoqo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719381269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=clV7ss7HqK/u0Op19fT3KuCZ48T+wC3u7mMBevY6n7k=;
	b=fYjwqLOiQF4qpYPIFNEqhl3vUV66nUDlg/6CNhMb5/R+64wLtXf/Fwgq8mUezsQn4vfWFd
	bAodLrsXmYHjGqqWOEZ6OUT9ZmViinmja/0MZkYHqjYZtznk4E22CBj4/LO4si1MPwF2c/
	ZGwIp0uHwt0E+wyuI38eRJNXBpLKoqo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xen/sched: fix error handling in cpu_schedule_up()
Date: Wed, 26 Jun 2024 07:54:25 +0200
Message-Id: <20240626055425.3622-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.04
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.04 / 50.00];
	BAYES_HAM(-2.24)[96.40%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]

In case cpu_schedule_up() is failing, it needs to undo all externally
visible changes it has done before.

Reason is that cpu_schedule_callback() won't be called with the
CPU_UP_CANCELED notifier in case cpu_schedule_up() did fail.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- undo changes in cpu_schedule_up() in case of failure
---
 xen/common/sched/core.c | 63 +++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d84b65f197..c466711e9e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2755,6 +2755,36 @@ static struct sched_resource *sched_alloc_res(void)
     return sr;
 }
 
+static void cf_check sched_res_free(struct rcu_head *head)
+{
+    struct sched_resource *sr = container_of(head, struct sched_resource, rcu);
+
+    free_cpumask_var(sr->cpus);
+    if ( sr->sched_unit_idle )
+        sched_free_unit_mem(sr->sched_unit_idle);
+    xfree(sr);
+}
+
+static void cpu_schedule_down(unsigned int cpu)
+{
+    struct sched_resource *sr;
+
+    rcu_read_lock(&sched_res_rculock);
+
+    sr = get_sched_res(cpu);
+
+    kill_timer(&sr->s_timer);
+
+    cpumask_clear_cpu(cpu, &sched_res_mask);
+    set_sched_res(cpu, NULL);
+
+    /* Keep idle unit. */
+    sr->sched_unit_idle = NULL;
+    call_rcu(&sr->rcu, sched_res_free);
+
+    rcu_read_unlock(&sched_res_rculock);
+}
+
 static int cpu_schedule_up(unsigned int cpu)
 {
     struct sched_resource *sr;
@@ -2794,7 +2824,10 @@ static int cpu_schedule_up(unsigned int cpu)
         idle_vcpu[cpu]->sched_unit->res = sr;
 
     if ( idle_vcpu[cpu] == NULL )
+    {
+        cpu_schedule_down(cpu);
         return -ENOMEM;
+    }
 
     idle_vcpu[cpu]->sched_unit->rendezvous_in_cnt = 0;
 
@@ -2812,36 +2845,6 @@ static int cpu_schedule_up(unsigned int cpu)
     return 0;
 }
 
-static void cf_check sched_res_free(struct rcu_head *head)
-{
-    struct sched_resource *sr = container_of(head, struct sched_resource, rcu);
-
-    free_cpumask_var(sr->cpus);
-    if ( sr->sched_unit_idle )
-        sched_free_unit_mem(sr->sched_unit_idle);
-    xfree(sr);
-}
-
-static void cpu_schedule_down(unsigned int cpu)
-{
-    struct sched_resource *sr;
-
-    rcu_read_lock(&sched_res_rculock);
-
-    sr = get_sched_res(cpu);
-
-    kill_timer(&sr->s_timer);
-
-    cpumask_clear_cpu(cpu, &sched_res_mask);
-    set_sched_res(cpu, NULL);
-
-    /* Keep idle unit. */
-    sr->sched_unit_idle = NULL;
-    call_rcu(&sr->rcu, sched_res_free);
-
-    rcu_read_unlock(&sched_res_rculock);
-}
-
 void sched_rm_cpu(unsigned int cpu)
 {
     int rc;
-- 
2.35.3


