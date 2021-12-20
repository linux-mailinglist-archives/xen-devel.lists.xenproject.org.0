Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FAE47B0E2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249865.430341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCF-0006zt-QO; Mon, 20 Dec 2021 16:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249865.430341; Mon, 20 Dec 2021 16:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCF-0006tV-Ed; Mon, 20 Dec 2021 16:07:31 +0000
Received: by outflank-mailman (input) for mailman id 249865;
 Mon, 20 Dec 2021 16:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLCC-00055x-M2
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e994da1d-61ae-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 17:07:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 964191F3B2;
 Mon, 20 Dec 2021 16:07:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B20A13D6B;
 Mon, 20 Dec 2021 16:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WF3cGDiqwGEUTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 16:07:20 +0000
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
X-Inumbo-ID: e994da1d-61ae-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwQ4mRiosEanvExB6LuAnyU1/Dqqja/tWJzhJY5Y3Ms=;
	b=fHEmzq/8xHjjE8HlcsZAhETWt6xchVyelqjXalZEawE5P2CesILBUlsexQGDAgwxM+PkCb
	fszdw2vuUHFFe49W4v4AsgaCYhYm6bhruP2/Iz3zsYKPY6x0XV65JzElA4X34mMFIQE5Eb
	WxQb8SqipT8QPtMfbAL58Zu4qkIek3w=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 08/10] mini-os: add proper pvh grant table handling
Date: Mon, 20 Dec 2021 17:07:14 +0100
Message-Id: <20211220160716.4159-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Grant table initialization for PVH requires some additional actions
compared to PV mode. Add those.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 arch/x86/gnttab.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/x86/gnttab.c b/arch/x86/gnttab.c
index 56e59d7..281c207 100644
--- a/arch/x86/gnttab.c
+++ b/arch/x86/gnttab.c
@@ -22,11 +22,15 @@
  */
 
 #include <mini-os/os.h>
+#include <mini-os/console.h>
+#include <mini-os/e820.h>
 #include <mini-os/hypervisor.h>
 #include <mini-os/gnttab.h>
 #include <mini-os/mm.h>
 #include <mini-os/types.h>
+#include <xen/memory.h>
 
+#ifdef CONFIG_PARAVIRT
 grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
 {
     struct gnttab_setup_table setup;
@@ -39,6 +43,33 @@ grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
     HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
     return map_frames(frames, nr_grant_frames);
 }
+#else
+grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
+{
+    int i, rc;
+    struct xen_add_to_physmap xatp;
+    unsigned long pfn;
+    unsigned long frames[nr_grant_frames];
+
+    pfn = e820_get_reserved_pfns(nr_grant_frames);
+    for ( i = 0; i < nr_grant_frames; i++ )
+    {
+        xatp.domid = DOMID_SELF;
+        xatp.idx = i;
+        xatp.space = XENMAPSPACE_grant_table;
+        xatp.gpfn = pfn + i;
+        rc = HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp);
+        if ( rc )
+        {
+            xprintk("could not init grant table\n");
+            do_exit();
+        }
+        frames[i] = pfn + i;
+    }
+
+    return map_frames(frames, nr_grant_frames);
+}
+#endif
 
 void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
 {
-- 
2.26.2


