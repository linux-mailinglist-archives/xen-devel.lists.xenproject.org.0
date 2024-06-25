Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F519916124
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747443.1154855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Wg-0000AC-OZ; Tue, 25 Jun 2024 08:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747443.1154855; Tue, 25 Jun 2024 08:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Wg-00007k-KL; Tue, 25 Jun 2024 08:27:42 +0000
Received: by outflank-mailman (input) for mailman id 747443;
 Tue, 25 Jun 2024 08:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOoF=N3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sM1Wg-0007Rh-4G
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:27:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9972316-32cc-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:27:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E98471F7D3;
 Tue, 25 Jun 2024 08:27:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC76E1384C;
 Tue, 25 Jun 2024 08:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YHjdJ3t/emZKMwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 25 Jun 2024 08:27:39 +0000
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
X-Inumbo-ID: c9972316-32cc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719304060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/4oITqv9kow5eWJF+EmzzvlqgGGbQrnXWUG1giZinw=;
	b=ncs3tGxFL5adzxRa2jbp0KQhw4htEpEpxTv0Y/3Jm8aBEW4bULj7aOi7qxn9aPqc2a50Hq
	Pl2GAf136NEU/3hWzQJH8+CXbyKmGff0sdickbfMNSWW3mbVd3S0Pt7bRIbkkHzy7K9QwA
	11eoNb3ppGYCi1Eg9PHAGL5bYuoTW1E=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gbODfjTg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719304059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=E/4oITqv9kow5eWJF+EmzzvlqgGGbQrnXWUG1giZinw=;
	b=gbODfjTgcSBnklRzY0Jf/i8rwpioNG/WfEi0P+/ZdpBW7/L2TFp/yn+nbqSb3s6GoKwszE
	NGaKonAngMKqbyOpcv9S+KwrS7LkZD8z3Zze2yppP4M1beZNkCG8XQju7Ps0aYs2Hi36RB
	Ugg+h2o3PVRaOIaGdRVeoOLLXYAy40E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/sched: fix rare error case in cpu_schedule_down()
Date: Tue, 25 Jun 2024 10:27:36 +0200
Message-Id: <20240625082736.7238-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E98471F7D3
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	BAYES_HAM(-0.00)[23.48%];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

In case cpu_schedule_up() is failing to allocate memory for struct
sched_resource, cpu_schedule_down() will be called with the
sched_resource pointer being NULL. This needs to be handled.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d84b65f197..0dc86b8f6c 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2829,6 +2829,8 @@ static void cpu_schedule_down(unsigned int cpu)
     rcu_read_lock(&sched_res_rculock);
 
     sr = get_sched_res(cpu);
+    if ( !sr )
+        goto out;
 
     kill_timer(&sr->s_timer);
 
@@ -2839,6 +2841,7 @@ static void cpu_schedule_down(unsigned int cpu)
     sr->sched_unit_idle = NULL;
     call_rcu(&sr->rcu, sched_res_free);
 
+ out:
     rcu_read_unlock(&sched_res_rculock);
 }
 
-- 
2.35.3


