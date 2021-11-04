Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8244558C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221581.383366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midx2-0008MX-I5; Thu, 04 Nov 2021 14:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221581.383366; Thu, 04 Nov 2021 14:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midx2-0008JQ-Ez; Thu, 04 Nov 2021 14:42:48 +0000
Received: by outflank-mailman (input) for mailman id 221581;
 Thu, 04 Nov 2021 14:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1midx1-0008JK-C9
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:42:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d25066-3d7d-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 15:42:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93AD71FD35;
 Thu,  4 Nov 2021 14:42:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 725DB13BD4;
 Thu,  4 Nov 2021 14:42:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kovGGmTxg2HRVwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 Nov 2021 14:42:44 +0000
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
X-Inumbo-ID: 78d25066-3d7d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636036964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N7uP8qI3LyZgnDWEU0EWoytM6APluRGPXr/31WyFdvk=;
	b=JQN/zxv36m+io0UZr9tYgkauzKPXznWDfoLlFSdlTz4ruxRCmjJG1Ok0AjPoFweyxaWQAs
	iPRkL11XpsRg3a4z//eVGMzcbIWTIVEXnP+BN9kyv8XHAtE9LUUP5dDCuhWEthRee+iupK
	EBm/iorpfMpEPvUot4rmgmOovrNNen4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.16] tools/helpers: fix broken xenstore stubdom init
Date: Thu,  4 Nov 2021 15:42:42 +0100
Message-Id: <20211104144242.14351-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier
into xc_dom_parse_image()") broke starting the xenstore stubdom. This
is due to a rather special way the xenstore stubdom domain config is
being initialized: in order to support both, PV and PVH stubdom,
init-xenstore-domain is using xc_dom_parse_image() to find the correct
domain type. Unfortunately above commit requires xc_dom_boot_xen_init()
to have been called before using xc_dom_parse_image(). This requires
the domid, which is known only after xc_domain_create(), which requires
the domain type.

In order to break this circular dependency, call xc_dom_boot_xen_init()
with an arbitrary domid first, and then set dom->guest_domid later.

Fixes: 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier into xc_dom_parse_image()")
Signed-off-by: Juergen Gross <jgross@suse.com>
Release-acked-by: Ian Jackson <iwj@xenproject.org>
---
 tools/helpers/init-xenstore-domain.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..a79662bd1b 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -132,6 +132,13 @@ static int build(xc_interface *xch)
         }
     }
 
+    rv = xc_dom_boot_xen_init(dom, xch, domid);
+    if ( rv )
+    {
+        fprintf(stderr, "xc_dom_boot_xen_init failed\n");
+        goto err;
+    }
+
     dom->container_type = XC_DOM_HVM_CONTAINER;
     rv = xc_dom_parse_image(dom);
     if ( rv )
@@ -214,16 +221,11 @@ static int build(xc_interface *xch)
     else
         snprintf(cmdline, 512, "--event %d --internal-db", rv);
 
+    dom->guest_domid = domid;
     dom->cmdline = xc_dom_strdup(dom, cmdline);
     dom->xenstore_domid = domid;
     dom->console_evtchn = console_evtchn;
 
-    rv = xc_dom_boot_xen_init(dom, xch, domid);
-    if ( rv )
-    {
-        fprintf(stderr, "xc_dom_boot_xen_init failed\n");
-        goto err;
-    }
     rv = xc_dom_mem_init(dom, memory);
     if ( rv )
     {
-- 
2.26.2


