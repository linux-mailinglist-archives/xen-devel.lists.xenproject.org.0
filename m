Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD0D1BB4A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 00:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202391.1517970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnkP-0003d3-AO; Tue, 13 Jan 2026 23:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202391.1517970; Tue, 13 Jan 2026 23:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnkP-0003aW-78; Tue, 13 Jan 2026 23:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1202391;
 Tue, 13 Jan 2026 23:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfnkO-0003ZP-7x
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 23:24:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fded9486-f0d6-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 00:24:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0598F60018;
 Tue, 13 Jan 2026 23:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E72AC116C6;
 Tue, 13 Jan 2026 23:24:21 +0000 (UTC)
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
X-Inumbo-ID: fded9486-f0d6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768346661;
	bh=KgQbc3VLgN7FcqOfwIdsTARgz+mso4XfSHtrhZFGh5g=;
	h=Date:From:To:cc:Subject:From;
	b=qsQcVicRbRyhAVtmSTEmkbGAw7ETuJxTQjDLCGiCRTU1YVjEGoTy1NikL39zKLjIZ
	 Gap/pOnYQtOXYvPNrZodODmmH9tgwF2S8VlTlBQjslcq1kMz2s48k2xQWXeRPMMnjQ
	 9bdbzmKpdf4ji4de40sI3ZmRSPVcPHqaFSAH96kvlOaU1CoEAmy8DpZ4ChIpJ7QDlH
	 h8tRNOVHnDojPIvCWw0YuQi9L8p9vOcs1/meo8fGcvWhsWDOwl0C+Fh8ObwziSAiGH
	 61onOkoiWbeHPoRY/elmeOQQUZQyhUxNbfn1QvPqln9OHLsUWNr/Fb3clDPVJdV91B
	 kcGE4nlSS/yWA==
Date: Tue, 13 Jan 2026 15:24:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jgross@suse.com, oleksandr_tyshchenko@epam.com
Subject: [PATCH v3] xen: introduce xen_console_io option
Message-ID: <alpine.DEB.2.22.394.2601131522540.992863@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Xen can support console_io hypercalls for any domains, not just dom0,
depending on DEBUG and XSM policies. These hypercalls can be very useful
for development and debugging.

Introduce a kernel command line option xen_console_io to enable the
usage of console_io hypercalls for any domain upon request. When
xen_console_io is not specified, the current behavior is retained.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- mark xen_cons_init as __init

Changes in v2:
- use kstrtobool
---
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 drivers/tty/hvc/hvc_xen.c                     | 29 +++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85a..68ab6fa72b685 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8414,6 +8414,11 @@ Kernel parameters
 			save/restore/migration must be enabled to handle larger
 			domains.
 
+	xen_console_io	[XEN,EARLY]
+			Boolean option to enable/disable the usage of the Xen
+			console_io hypercalls to read and write to the console.
+			Mostly useful for debugging and development.
+
 	xen_emul_unplug=		[HW,X86,XEN,EARLY]
 			Unplug Xen emulated devices
 			Format: [unplug0,][unplug1]
diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 388a71afd6efe..95ec01b1aacf0 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -51,6 +51,22 @@ static DEFINE_SPINLOCK(xencons_lock);
 
 /* ------------------------------------------------------------------ */
 
+static bool xen_console_io = false;
+static int __initdata opt_console_io = -1;
+
+static int __init parse_xen_console_io(char *arg)
+{
+	bool val;
+	int ret;
+
+	ret = kstrtobool(arg, &val);
+	if (ret == 0)
+		opt_console_io = (int)val;
+
+	return ret;
+}
+early_param("xen_console_io", parse_xen_console_io);
+
 static struct xencons_info *vtermno_to_xencons(int vtermno)
 {
 	struct xencons_info *entry, *ret = NULL;
@@ -331,7 +347,7 @@ static int xen_initial_domain_console_init(void)
 	struct xencons_info *info;
 	unsigned long flags;
 
-	if (!xen_initial_domain())
+	if (!xen_console_io)
 		return -ENODEV;
 
 	info = vtermno_to_xencons(HVC_COOKIE);
@@ -369,7 +385,7 @@ void xen_console_resume(void)
 {
 	struct xencons_info *info = vtermno_to_xencons(HVC_COOKIE);
 	if (info != NULL && info->irq) {
-		if (!xen_initial_domain())
+		if (!xen_console_io)
 			xen_console_update_evtchn(info);
 		rebind_evtchn_irq(info->evtchn, info->irq);
 	}
@@ -601,7 +617,7 @@ static int __init xen_hvc_init(void)
 	if (!xen_domain())
 		return -ENODEV;
 
-	if (xen_initial_domain()) {
+	if (xen_console_io) {
 		ops = &dom0_hvc_ops;
 		r = xen_initial_domain_console_init();
 		if (r < 0)
@@ -647,14 +663,17 @@ static int __init xen_hvc_init(void)
 }
 device_initcall(xen_hvc_init);
 
-static int xen_cons_init(void)
+static int __init xen_cons_init(void)
 {
 	const struct hv_ops *ops;
 
+	xen_console_io = opt_console_io >= 0 ? opt_console_io :
+					       xen_initial_domain();
+
 	if (!xen_domain())
 		return 0;
 
-	if (xen_initial_domain())
+	if (xen_console_io)
 		ops = &dom0_hvc_ops;
 	else {
 		int r;
-- 
2.25.1


