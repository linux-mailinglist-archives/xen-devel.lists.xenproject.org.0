Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DA5AF744
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400308.642014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRm-0005gC-3Y; Tue, 06 Sep 2022 21:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400308.642014; Tue, 06 Sep 2022 21:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRl-0005dr-U8; Tue, 06 Sep 2022 21:49:29 +0000
Received: by outflank-mailman (input) for mailman id 400308;
 Tue, 06 Sep 2022 21:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oVgIS-0000Cs-HU
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4020852e-2de1-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 14:41:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E83D338B0;
 Tue,  6 Sep 2022 12:41:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1E6F13A7A;
 Tue,  6 Sep 2022 12:41:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFyTOQFAF2NiSQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 06 Sep 2022 12:41:37 +0000
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
X-Inumbo-ID: 4020852e-2de1-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662468098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8y5B8SeVYhFEQ1i+eFOmTPV0zpAN2fLm9xCblFTGrrY=;
	b=WFFiWAmKMwR0GYGaGXHvkDhG/1Dz1fNnkG4tbPLcc1xbEwsY0clI9tciugJ147AZL/zfkE
	KLAniDghG6hgg4kCrLoKZhD/FH+QUoPQ5dHw+HCM3JBg2uOLfC4f0qzB/7OhXHbZipdzvB
	m8Yp7fnvvHIjhFUSdXgqb+hOOFRnH3Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen/timer: don't migrate timers away from cpus during suspend
Date: Tue,  6 Sep 2022 14:41:35 +0200
Message-Id: <20220906124135.12998-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During a suspend/resume cycle timers on all cpus but cpu 0 will be
migrated to cpu 0, as the other cpus are taken down.

This is problematic in case such a timer is related to a specific vcpu,
as the vcpus are not migrated to another cpu during suspend (migrating
them would break cpupools and core scheduling).

In order to avoid the problems just try to keep the timers on their
cpus. Only migrate them away in case resume failed. Doing so isn't
problematic, as any vcpu on a cpu not coming back to life would be
migrated away, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/common/timer.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/common/timer.c b/xen/common/timer.c
index 9b5016d5ed..6b5473e5f1 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -637,6 +637,13 @@ static void free_percpu_timers(unsigned int cpu)
         ASSERT(ts->heap == dummy_heap);
 }
 
+static void deinit_timers(unsigned int cpu)
+{
+    migrate_timers_from_cpu(cpu);
+    if ( !park_offline_cpus )
+        free_percpu_timers(cpu);
+}
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -655,13 +662,14 @@ static int cf_check cpu_callback(
         }
         break;
 
-    case CPU_UP_CANCELED:
     case CPU_DEAD:
-    case CPU_RESUME_FAILED:
-        migrate_timers_from_cpu(cpu);
+        if ( system_state != SYS_STATE_suspend )
+            deinit_timers(cpu);
+        break;
 
-        if ( !park_offline_cpus && system_state != SYS_STATE_suspend )
-            free_percpu_timers(cpu);
+    case CPU_UP_CANCELED:
+    case CPU_RESUME_FAILED:
+        deinit_timers(cpu);
         break;
 
     case CPU_REMOVE:
-- 
2.35.3


