Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81FD0C84B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jan 2026 00:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199259.1515850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veLkb-0002zW-G2; Fri, 09 Jan 2026 23:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199259.1515850; Fri, 09 Jan 2026 23:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veLkb-0002x7-DE; Fri, 09 Jan 2026 23:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1199259;
 Fri, 09 Jan 2026 23:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T30I=7O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1veLkZ-0002wy-L8
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 23:18:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83811437-edb1-11f0-b15e-2bf370ae4941;
 Sat, 10 Jan 2026 00:18:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12EFE60052;
 Fri,  9 Jan 2026 23:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34351C4CEF1;
 Fri,  9 Jan 2026 23:18:30 +0000 (UTC)
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
X-Inumbo-ID: 83811437-edb1-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768000710;
	bh=/pIlUHnomRLXkxg7uCnGEwQ46UlBpSTXqN7vfY7hMfQ=;
	h=Date:From:To:cc:Subject:From;
	b=kwuVzJ2MJ3QgBem3kgciEE+Jpg2jREU1Ggbb47D24d0PsA23XPAUxOiuEDuSd28Pf
	 k+RBePVhHjn+q+xZrR1yfOArDwEgoOT6uVl3yzKdzVxD/MCmg7aRkfWhX7SikZQ8C2
	 KY0/9bzu4HFHoT2skCU0Bq7lLTiPmhVMwXXVUfLn97r2CwSthSBd1lhU2iyI0WAtB0
	 X6IxvQT0RTRiBbd0eL6zN/Lb+tt+oVTTSBYuMpHuYDiECudf2B3HdmT0DD2XiN+KMn
	 4hTBhnE4RXJOS3cVuRJHhfe4JaG75Xx6kmJi0p4I7GhI3xrf/EPymciLlVUAO72jF9
	 7/0LSj+LBGArw==
Date: Fri, 9 Jan 2026 15:18:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com
cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org
Subject: [PATCH] xen: introduce xen_console_io option
Message-ID: <alpine.DEB.2.22.394.2601091515310.992863@ubuntu-linux-20-04-desktop>
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
 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/tty/hvc/hvc_xen.c                     | 33 ++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e88505e945d52..953d3f597f007 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7620,6 +7620,11 @@
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
index 388a71afd6efe..299b08c90bab1 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -51,6 +51,28 @@ static DEFINE_SPINLOCK(xencons_lock);
 
 /* ------------------------------------------------------------------ */
 
+static bool xen_console_io = false;
+static int __initdata opt_console_io = -1;
+
+static int __init parse_xen_console_io(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strcmp(arg, "off") == 0 ||
+	    strcmp(arg, "disabled") == 0 ||
+	    strcmp(arg, "0") == 0) {
+		opt_console_io = 0;
+	}
+	else if (strcmp(arg, "on") == 0 ||
+		 strcmp(arg, "enabled") == 0 ||
+		 strcmp(arg, "1") == 0) {
+		opt_console_io = 1;
+	}
+	return 0;
+}
+early_param("xen_console_io", parse_xen_console_io);
+
 static struct xencons_info *vtermno_to_xencons(int vtermno)
 {
 	struct xencons_info *entry, *ret = NULL;
@@ -331,7 +353,7 @@ static int xen_initial_domain_console_init(void)
 	struct xencons_info *info;
 	unsigned long flags;
 
-	if (!xen_initial_domain())
+	if (!xen_console_io)
 		return -ENODEV;
 
 	info = vtermno_to_xencons(HVC_COOKIE);
@@ -369,7 +391,7 @@ void xen_console_resume(void)
 {
 	struct xencons_info *info = vtermno_to_xencons(HVC_COOKIE);
 	if (info != NULL && info->irq) {
-		if (!xen_initial_domain())
+		if (!xen_console_io)
 			xen_console_update_evtchn(info);
 		rebind_evtchn_irq(info->evtchn, info->irq);
 	}
@@ -601,7 +623,7 @@ static int __init xen_hvc_init(void)
 	if (!xen_domain())
 		return -ENODEV;
 
-	if (xen_initial_domain()) {
+	if (xen_console_io) {
 		ops = &dom0_hvc_ops;
 		r = xen_initial_domain_console_init();
 		if (r < 0)
@@ -651,10 +673,13 @@ static int xen_cons_init(void)
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


