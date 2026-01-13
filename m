Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F908D15FA8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 01:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201019.1516767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfSDR-0006G3-RQ; Tue, 13 Jan 2026 00:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201019.1516767; Tue, 13 Jan 2026 00:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfSDR-0006Dy-Nh; Tue, 13 Jan 2026 00:24:57 +0000
Received: by outflank-mailman (input) for mailman id 1201019;
 Tue, 13 Jan 2026 00:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfSDQ-0006Ds-Af
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 00:24:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47ae45b8-f016-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 01:24:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76ADC436C1;
 Tue, 13 Jan 2026 00:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FC5C116D0;
 Tue, 13 Jan 2026 00:24:51 +0000 (UTC)
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
X-Inumbo-ID: 47ae45b8-f016-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768263892;
	bh=LBbnNiXXF6SclRkMeM12iA6wEoNZB+xJTpKWfGbDusw=;
	h=Date:From:To:cc:Subject:From;
	b=WOPvHi6mujQxXx1EFQ7JefvrxhVbJfGcRcCvMAkNh9LMV8jAlBObiJZA7X1UeDDi0
	 CGPp1kRgCCsBzLwOFaY7b91HZnHxcd9DhWnMNdw8sWG0WtQv7f+olx/vkv5FQfiO1p
	 60FPA5nOqvxvWLGm1SjeNe1CXTECyON44faA7ggjNL7EOYv8Q6REC/7Vhez3mYGYfp
	 ZKIp1aLcc07O1syieVMFbJMs0hyqt6792Fpt19MEEDa2+ojS3slbsP6YQm+EhSLmBo
	 F+YOkN8YFH6EUKCi9DLgI4bwBTDGroHjqch3lwCikgM9J6Exm3jeCet7lYr7+KxH+t
	 8E3qhPrspMb6g==
Date: Mon, 12 Jan 2026 16:24:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com
cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen: introduce xen_console_io option
Message-ID: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop>
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
Changes in v2:
- use kstrtobool
---
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 drivers/tty/hvc/hvc_xen.c                     | 27 ++++++++++++++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

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
index 388a71afd6efe..c94cc7df78d36 100644
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
@@ -651,10 +667,13 @@ static int xen_cons_init(void)
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


