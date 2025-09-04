Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5717B43CAB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110165.1459480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9k8-0002r2-EJ; Thu, 04 Sep 2025 13:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110165.1459480; Thu, 04 Sep 2025 13:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9k8-0002op-Au; Thu, 04 Sep 2025 13:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1110165;
 Thu, 04 Sep 2025 13:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9U0N=3P=wunner.de=lukas@srs-se1.protection.inumbo.net>)
 id 1uu9k7-0002oh-2v
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 13:11:11 +0000
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f793a94-8990-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 15:11:09 +0200 (CEST)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 68FB82009D10;
 Thu,  4 Sep 2025 15:11:08 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 53B8B3FAE00; Thu,  4 Sep 2025 15:11:08 +0200 (CEST)
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
X-Inumbo-ID: 9f793a94-8990-11f0-9d12-b5c5bf9af7f9
Message-Id: <22453676d1ddcebbe81641bb68ddf587fee7e21e.1756990799.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 4 Sep 2025 15:11:09 +0200
Subject: [PATCH] xen/manage: Fix suspend error path
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>

The device power management API has the following asymmetry:
* dpm_suspend_start() does not clean up on failure
  (it requires a call to dpm_resume_end())
* dpm_suspend_end() does clean up on failure
  (it does not require a call to dpm_resume_start())

The asymmetry was introduced by commit d8f3de0d2412 ("Suspend-related
patches for 2.6.27") in June 2008:  It removed a call to device_resume()
from device_suspend() (which was later renamed to dpm_suspend_start()).

When Xen began using the device power management API in May 2008 with
commit 0e91398f2a5d ("xen: implement save/restore"), the asymmetry did
not yet exist.  But since it was introduced, a call to dpm_resume_end()
is missing in the error path of dpm_suspend_start().  Fix it.

Fixes: d8f3de0d2412 ("Suspend-related patches for 2.6.27")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: stable@vger.kernel.org  # v2.6.27
---
kexec suffered from the same issue ever since it began using the
device power management API in July 2008 with commit 89081d17f7bb
("kexec jump: save/restore device state").  It was fixed this year
by commit 996afb6efd1a ("kexec_core: Fix error code path in the
KEXEC_JUMP flow").  All other callers seem fine.

 drivers/xen/manage.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index 841afa4..1f5a7a4 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -110,7 +110,7 @@ static void do_suspend(void)
 	err = dpm_suspend_start(PMSG_FREEZE);
 	if (err) {
 		pr_err("%s: dpm_suspend_start %d\n", __func__, err);
-		goto out_thaw;
+		goto out_resume_end;
 	}
 
 	printk(KERN_DEBUG "suspending xenstore...\n");
@@ -150,6 +150,7 @@ static void do_suspend(void)
 	else
 		xs_suspend_cancel();
 
+out_resume_end:
 	dpm_resume_end(si.cancelled ? PMSG_THAW : PMSG_RESTORE);
 
 out_thaw:
-- 
2.50.1


