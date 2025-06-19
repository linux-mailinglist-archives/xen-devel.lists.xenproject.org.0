Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF6AE03F3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019959.1396411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDay-00027F-2c; Thu, 19 Jun 2025 11:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019959.1396411; Thu, 19 Jun 2025 11:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDax-00025b-Ti; Thu, 19 Jun 2025 11:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1019959;
 Thu, 19 Jun 2025 11:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDaw-00024Q-L0
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e20a718e-4d01-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 13:38:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D41391F38D;
 Thu, 19 Jun 2025 11:38:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97D23136CC;
 Thu, 19 Jun 2025 11:38:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dzBmI6T2U2hdbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:12 +0000
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
X-Inumbo-ID: e20a718e-4d01-11f0-a30c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NoXCUJ5pbRtKgxow6UIhaYz4x9FU3aA2ofy2y28z+k=;
	b=l3NDVSZyBXd6Z+VTJoUNcoN2B3WvjsNPdkRVRQWhFK0pJsWRHgzBwTcB13hmLzohRjUtzz
	2vsI2QNXOpX3C3v+AEz0p927igtaque4yFWjg/T6BhYygHc9v2PQ74FyIkUAN54oKzAiT1
	nvj+a39NlLYIbihX7Z4yoGtKU3gcxoo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NoXCUJ5pbRtKgxow6UIhaYz4x9FU3aA2ofy2y28z+k=;
	b=qa9mkXZ37DVz9h4UFXq4IYoSZ84vVmAkzx3WRHkjyOpeb3DwFAoujOwgiXpAlQFPvq/VMC
	Ic/GnQytzbBCPPITry52MQgVXAplLeAKZclI5lDAntSzhJgu3L1+Fb/A7coIbS2wSaCeVH
	tZrwMBPfphLUwjxdyDPqYSryCId414c=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 1/6] suspend: drop crazy pfn handling for PVH
Date: Thu, 19 Jun 2025 13:37:59 +0200
Message-ID: <20250619113804.32694-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
References: <20250619113804.32694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

Suspend for PVH is doing some crazy stuff with the Xenstore and console
PFNs:

- In arch_pre_suspend() the PFNs are "translated" to MFNs, even if that
   translation is a nop.
- The result is stored via start_info_ptr, which points to a struct
  start_info only in case of PV mode.
- After resuming or a cancelled suspend, the PFNs are retrieved again
  and "translated".
- The "MFNs" are stored again via start_info_ptr, which is still not
  pointing at a struct start_info, and from where the data is never
  read again after that.

Drop all of that completely.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index b613083b..e30eb065 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -227,17 +227,6 @@ void arch_pre_suspend(void)
         virt_to_pfn(mfn_to_virt(start_info_ptr->store_mfn));
     start_info_ptr->console.domU.mfn =
         virt_to_pfn(mfn_to_virt(start_info_ptr->console.domU.mfn));
-#else
-    uint64_t store_v;
-    uint64_t console_v;
-
-    if( hvm_get_parameter(HVM_PARAM_STORE_PFN, &store_v) )
-        BUG();
-    start_info_ptr->store_mfn = store_v;
-
-    if( hvm_get_parameter(HVM_PARAM_CONSOLE_PFN, &console_v) )
-        BUG();
-    start_info_ptr->console.domU.mfn = console_v;
 #endif
     unmap_shared_info();
 
@@ -262,17 +251,6 @@ void arch_post_suspend(int canceled)
     } else {
         memcpy(&start_info, start_info_ptr, sizeof(start_info_t));
     }
-#else
-    uint64_t store_v;
-    uint64_t console_v;
-
-    if (hvm_get_parameter(HVM_PARAM_STORE_PFN, &store_v))
-        BUG();
-    start_info_ptr->store_mfn = pfn_to_mfn(store_v);
-
-    if (hvm_get_parameter(HVM_PARAM_CONSOLE_PFN, &console_v))
-        BUG();
-    start_info_ptr->console.domU.mfn = pfn_to_mfn(console_v);
 #endif
 
     HYPERVISOR_shared_info = map_shared_info((void*) start_info_ptr);
-- 
2.43.0


