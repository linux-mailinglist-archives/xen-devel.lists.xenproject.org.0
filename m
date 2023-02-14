Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D800695830
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 06:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494958.765192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRnXY-0007Z9-3f; Tue, 14 Feb 2023 05:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494958.765192; Tue, 14 Feb 2023 05:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRnXY-0007XH-02; Tue, 14 Feb 2023 05:07:40 +0000
Received: by outflank-mailman (input) for mailman id 494958;
 Tue, 14 Feb 2023 05:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fg6=6K=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1pRnXW-0007We-Hh
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 05:07:38 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1664ff-ac25-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 06:07:35 +0100 (CET)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 18BBD18000B2;
 Tue, 14 Feb 2023 00:07:34 -0500 (EST)
Received: from localhost.localdomain (c-73-126-95-14.hsd1.ma.comcast.net
 [73.126.95.14])
 by mta-05.privateemail.com (Postfix) with ESMTPA id 6059718000B0;
 Tue, 14 Feb 2023 00:07:24 -0500 (EST)
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
X-Inumbo-ID: 7e1664ff-ac25-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1676351254;
	bh=LPH/xf231W5X/KC3fQVF1Wp17WKoMNP0q+BN8zwfIbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LolOQG8tMtpM4vaSAopvlzPqvCfHDsvbsXQrXXg9O/fyMX+Nqwb904Fl8CMpB3guc
	 UIMESDru24/g5UBpwTgdwg23gO+a51yMDNxKCggOQDDeAHTR2RH4VFATpeQaxyTQLO
	 sZv+1KT3m12kRAB56Cpw7uG0xUcnYDHJ96yNIcTk9QSDOXct39Ft4iVZiN/SIcfo2p
	 lQgqQs6k5dR0WKBro5YTBjBaew+7KD8SRgV5WkJExsFzwXMknHX5R1DwB5agfnZg6Z
	 MrR2AM0idUXdQUd9nQcWx4YkkptuqN0KZ7OT5AINegWN29ywmotEjcRxQYaQ72MGoW
	 sixgYWPzkbjFQ==
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 2/2] x86/mem_sharing: Add extra variable to track fork progress
Date: Tue, 14 Feb 2023 00:07:07 -0500
Message-Id: <348063358f2ded237334b3cec7498a36296fd408.1676351034.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

When VM forking is initiated a VM is not supposed to try to perform mem_sharing
yet as the fork process hasn't completed all required steps. However, the vCPU
bring-up paths trigger guest memory accesses that can lead to such premature
sharing ops. However, the gating check to see whether a VM is a fork is set
already (ie. the domain has a parent).

In this patch we introduce a separate variable to store the information that
forking has been initiated so that the non-restartable part of the forking op
is not repeated and we avoid the premature sharing ops from triggering.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/include/asm/hvm/domain.h |  8 ++++++++
 xen/arch/x86/mm/mem_sharing.c         | 10 +++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..76a08b55f9 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -33,6 +33,14 @@ struct mem_sharing_domain
 {
     bool enabled, block_interrupts;
 
+    /*
+     * We need to avoid trying to nominate pages for forking until the
+     * fork operation is completely finished. As parts of fork creation
+     * is restartable we mark here if the process started to skip the
+     * non-restartable portion.
+     */
+    bool fork_started;
+
     /*
      * When releasing shared gfn's in a preemptible manner, recall where
      * to resume the search.
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc54..b55c5bccdd 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1888,11 +1888,12 @@ static int copy_settings(struct domain *cd, struct domain *d)
 static int fork(struct domain *cd, struct domain *d)
 {
     int rc = -EBUSY;
+    struct mem_sharing_domain *msd = &cd->arch.hvm.mem_sharing;
 
     if ( !cd->controller_pause_count )
         return rc;
 
-    if ( !cd->parent )
+    if ( !msd->fork_started )
     {
         if ( !get_domain(d) )
         {
@@ -1905,7 +1906,7 @@ static int fork(struct domain *cd, struct domain *d)
         *cd->arch.cpuid = *d->arch.cpuid;
         *cd->arch.msr = *d->arch.msr;
         cd->vmtrace_size = d->vmtrace_size;
-        cd->parent = d;
+        msd->fork_started = 1;
     }
 
     /* This is preemptible so it's the first to get done */
@@ -1918,8 +1919,11 @@ static int fork(struct domain *cd, struct domain *d)
     rc = copy_settings(cd, d);
 
  done:
-    if ( rc && rc != -ERESTART )
+    if ( !rc )
+        cd->parent = d;
+    else if ( rc != -ERESTART )
     {
+        msd->fork_started = 0;
         cd->parent = NULL;
         domain_unpause(d);
         put_domain(d);
-- 
2.34.1


