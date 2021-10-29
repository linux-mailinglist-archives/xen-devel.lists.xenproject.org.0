Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015BB43F81F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 09:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218417.378840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMe1-0002Kl-KE; Fri, 29 Oct 2021 07:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218417.378840; Fri, 29 Oct 2021 07:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMe1-0002IE-HG; Fri, 29 Oct 2021 07:49:45 +0000
Received: by outflank-mailman (input) for mailman id 218417;
 Fri, 29 Oct 2021 07:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3izX=PR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mgMdz-0002I8-U5
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 07:49:43 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c048f91-eead-4040-80f2-0b5ef99f4a1f;
 Fri, 29 Oct 2021 07:49:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13B7921971;
 Fri, 29 Oct 2021 07:49:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C937C13B27;
 Fri, 29 Oct 2021 07:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HHUYL5Wne2GPfwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 29 Oct 2021 07:49:41 +0000
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
X-Inumbo-ID: 4c048f91-eead-4040-80f2-0b5ef99f4a1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635493782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cEHSevouYw8lnbcB9mvJJwAH561ddSGhR9uQkll/Ybg=;
	b=ZmMFSg7HmY3N5x7iTSAMm4Y3XP4uycpYHsJ/QcagIeHfvd81YwIObys7En+h15ENPVGFm3
	oWCRhBglR/uMGpRzFe2Q/ZGTb/lHyzzufZBszoMQL5le4q4uYWgxPtsthnpAvypCTgPqgJ
	elxeVELo3y5KwimhI58Sg0m/AxIZTaM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] xen/balloon: add late_initcall_sync() for initial ballooning done
Date: Fri, 29 Oct 2021 09:49:31 +0200
Message-Id: <20211029074931.20657-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running as PVH or HVM guest with actual memory < max memory the
hypervisor is using "populate on demand" in order to allow the guest
to balloon down from its maximum memory size. For this to work
correctly the guest must not touch more memory pages than its target
memory size as otherwise the PoD cache will be exhausted and the guest
is crashed as a result of that.

In extreme cases ballooning down might not be finished today before
the init process is started, which can consume lots of memory.

In order to avoid random boot crashes in such cases, add a late init
call to wait for ballooning down having finished for PVH/HVM guests.

Warn on console if ballooning stalls for more than 1 minute, panic()
after stalling for more than 3 minutes.

Cc: <stable@vger.kernel.org>
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add warning and panic() when stalling (Marek Marczykowski-Górecki)
- don't wait if credit > 0
---
 drivers/xen/balloon.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 3a50f097ed3e..c0c1c754e515 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -765,3 +765,38 @@ static int __init balloon_init(void)
 	return 0;
 }
 subsys_initcall(balloon_init);
+
+static int __init balloon_wait_finish(void)
+{
+	long credit, last_credit = 0;
+	unsigned long last_changed;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* PV guests don't need to wait. */
+	if (xen_pv_domain() || !current_credit())
+		return 0;
+
+	pr_info("Waiting for initial ballooning down having finished.\n");
+
+	while ((credit = current_credit()) < 0) {
+		if (credit != last_credit) {
+			last_changed = jiffies;
+			last_credit = credit;
+		}
+		if (jiffies - last_changed >= HZ * 60) {
+			pr_warn_once("Initial ballooning stalling for 60s, %ld pages need to be freed.\n",
+				     -credit);
+		}
+		if (jiffies - last_changed >= 3 * HZ * 60)
+			panic("Initial ballooning failed!\n");
+
+		schedule_timeout_interruptible(HZ / 10);
+	}
+
+	pr_info("Initial ballooning down finished.\n");
+
+	return 0;
+}
+late_initcall_sync(balloon_wait_finish);
-- 
2.26.2


