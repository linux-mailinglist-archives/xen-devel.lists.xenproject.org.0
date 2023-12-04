Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B98038B0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647120.1009865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnK-00068m-I5; Mon, 04 Dec 2023 15:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647120.1009865; Mon, 04 Dec 2023 15:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAnK-00066L-Eg; Mon, 04 Dec 2023 15:23:38 +0000
Received: by outflank-mailman (input) for mailman id 647120;
 Mon, 04 Dec 2023 15:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAAnJ-00064x-5w
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:23:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 175903ae-92b9-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 16:23:35 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B29E51FE58;
 Mon,  4 Dec 2023 15:23:34 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8151513588;
 Mon,  4 Dec 2023 15:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id m6VRHvbubWU4JgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 15:23:34 +0000
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
X-Inumbo-ID: 175903ae-92b9-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701703414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06xhZUNn8wMG33vXmrBvLhXQYrmhEPNGSLjT0D5WEEg=;
	b=PWqbjIbCKJRmP9IpOQuHXskej2+0oGva+bYoAGrvQJ+rp2189LjzkCSVJ+EZFpKT6zIBF5
	8bp/TeQ8C4bTZe2wSSloWLJ5kTg+LLYwDNfmEf0CkaVcmKZ8z/KFXscbNBZ4NRkhVIVohV
	zUDGXhksYfpzJ46Nn4KeW9sKOLnXP8M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	=?UTF-8?q?Ren=C3=A9=20Winther=20H=C3=B8jgaard?= <renewin@proton.me>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH v2 2/3] xen/sched: fix sched_move_domain()
Date: Mon,  4 Dec 2023 16:23:20 +0100
Message-Id: <20231204152321.16520-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231204152321.16520-1-jgross@suse.com>
References: <20231204152321.16520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.10
X-Spamd-Result: default: False [-4.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[12.34%]
X-Spam-Flag: NO

Do cleanup in sched_move_domain() in a dedicated service function,
which is called either in error case with newly allocated data, or in
success case with the old data to be freed.

This will at once fix some subtle bugs which sneaked in due to
forgetting to overwrite some pointers in the error case.

Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")
Reported-by: René Winther Højgaard <renewin@proton.me>
Initial-fix-by: Jan Beulich <jbeulich@suse.com>
Initial-fix-by: George Dunlap <george.dunlap@cloud.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make ops parameter of new function const (Jan Beulich)
---
 xen/common/sched/core.c | 47 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index eba0cea4bb..901782bbb4 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -647,6 +647,24 @@ static void sched_move_irqs(const struct sched_unit *unit)
         vcpu_move_irqs(v);
 }
 
+static void sched_move_domain_cleanup(const struct scheduler *ops,
+                                      struct sched_unit *units,
+                                      void *domdata)
+{
+    struct sched_unit *unit, *old_unit;
+
+    for ( unit = units; unit; )
+    {
+        if ( unit->priv )
+            sched_free_udata(ops, unit->priv);
+        old_unit = unit;
+        unit = unit->next_in_list;
+        xfree(old_unit);
+    }
+
+    sched_free_domdata(ops, domdata);
+}
+
 /*
  * Move a domain from one cpupool to another.
  *
@@ -686,7 +704,6 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     void *old_domdata;
     unsigned int gran = cpupool_get_granularity(c);
     unsigned int n_units = d->vcpu[0] ? DIV_ROUND_UP(d->max_vcpus, gran) : 0;
-    int ret = 0;
 
     for_each_vcpu ( d, v )
     {
@@ -699,8 +716,9 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     domdata = sched_alloc_domdata(c->sched, d);
     if ( IS_ERR(domdata) )
     {
-        ret = PTR_ERR(domdata);
-        goto out;
+        rcu_read_unlock(&sched_res_rculock);
+
+        return PTR_ERR(domdata);
     }
 
     for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
@@ -718,10 +736,10 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
         if ( !unit || !unit->priv )
         {
-            old_units = new_units;
-            old_domdata = domdata;
-            ret = -ENOMEM;
-            goto out_free;
+            sched_move_domain_cleanup(c->sched, new_units, domdata);
+            rcu_read_unlock(&sched_res_rculock);
+
+            return -ENOMEM;
         }
 
         unit_ptr = &unit->next_in_list;
@@ -808,22 +826,11 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     domain_unpause(d);
 
- out_free:
-    for ( unit = old_units; unit; )
-    {
-        if ( unit->priv )
-            sched_free_udata(c->sched, unit->priv);
-        old_unit = unit;
-        unit = unit->next_in_list;
-        xfree(old_unit);
-    }
-
-    sched_free_domdata(old_ops, old_domdata);
+    sched_move_domain_cleanup(old_ops, old_units, old_domdata);
 
- out:
     rcu_read_unlock(&sched_res_rculock);
 
-    return ret;
+    return 0;
 }
 
 void sched_destroy_vcpu(struct vcpu *v)
-- 
2.35.3


