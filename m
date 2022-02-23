Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624274C1E82
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 23:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277825.474663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN0Aa-0002JD-Ak; Wed, 23 Feb 2022 22:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277825.474663; Wed, 23 Feb 2022 22:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN0Aa-0002H1-7T; Wed, 23 Feb 2022 22:31:36 +0000
Received: by outflank-mailman (input) for mailman id 277825;
 Wed, 23 Feb 2022 22:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSY2=TG=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1nN0AZ-0002Gu-LU
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 22:31:35 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a0ec8f-94f8-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 23:31:32 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>) id 1nN0AV-0007ER-IA
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 22:31:31 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id F3F312E32C5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 22:31:30 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECmEUpid7VVP for <xen-devel@lists.xenproject.org>;
 Wed, 23 Feb 2022 22:31:30 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id DE85A2E32C0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Feb 2022 22:31:30 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id DB18A72C; Wed, 23 Feb 2022 22:31:30 +0000 (GMT)
Resent-From: James Dingwall <james@dingwall.me.uk>
Resent-Date: Wed, 23 Feb 2022 22:31:30 +0000
Resent-Message-ID: <20220223223130.GB1752541@dingwall.me.uk>
Resent-To: xen-devel@lists.xenproject.org
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
X-Inumbo-ID: 59a0ec8f-94f8-11ec-8eb8-a37418f5ba1a
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Wed, 23 Feb 2022 18:08:59 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: [RFC] kernel: xenfs parameter to hide deprecated files
Message-ID: <20220223180859.GA1412216@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have been investigating a very intermittent issue we have with xenstore
access hanging.  Typically it seems to happen when all domains are stopped
prior to a system reboot.  xenstore is running in a stubdom and using the
hypervisor debug keys indicates the domain is still there.

I have come across some old list threads which suggested access via
/proc/xen/xenbus could cause problems but it seems patches went in to the
kernel for 4.10.  However to eliminate this entirely as a possibility
I came up with this kernel patch to hide deprecated entries in xenfs.

I found this old thread for a similar change where the entries were made
conditional on kernel config options instead of a module parameter but
this was never merged.

https://lkml.org/lkml/2015/11/30/761

If this would be a useful feature I would welcome feedback.

Thanks,
James

--fdj2RfSjLxBAspz7
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="xenfs_hide_deprecated.patch"

diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
index d7d64235010d..d02c451f6a4d 100644
--- a/drivers/xen/xenfs/super.c
+++ b/drivers/xen/xenfs/super.c
@@ -3,6 +3,11 @@
  *  xenfs.c - a filesystem for passing info between the a domain and
  *  the hypervisor.
  *
+ * 2022-02-12  James Dingwall   Introduce hide_deprecated module parameter to
+ *                              mask:
+ *                              - xenbus (deprecated in xen 4.6.0)
+ *                              - privcmd (deprecated in xen 4.7.0)
+ *
  * 2008-10-07  Alex Zeffertt    Replaced /proc/xen/xenbus with xenfs filesystem
  *                              and /proc/xen compatibility mount point.
  *                              Turned xenfs into a loadable module.
@@ -28,6 +33,13 @@
 MODULE_DESCRIPTION("Xen filesystem");
 MODULE_LICENSE("GPL");
 
+static bool __read_mostly hide_deprecated = 0;
+module_param(hide_deprecated, bool, 0444);
+MODULE_PARM_DESC(hide_deprecated,
+	"Allow deprecated files to be hidden in xenfs.\n"\
+	"  0 - (default) show deprecated xenfs files."\
+	"  1 - hide deprecated xenfs files [xenbus, privcmd].\n");
+
 static ssize_t capabilities_read(struct file *file, char __user *buf,
 				 size_t size, loff_t *off)
 {
@@ -69,8 +81,32 @@ static int xenfs_fill_super(struct super_block *sb, struct fs_context *fc)
 			xen_initial_domain() ? xenfs_init_files : xenfs_files);
 }
 
+static int xenfs_fill_super_hide_deprecated(struct super_block *sb, struct fs_context *fc)
+{
+	static const struct tree_descr xenfs_files[] = {
+		[2] = { "capabilities", &capabilities_file_ops, S_IRUGO },
+		{""},
+	};
+
+	static const struct tree_descr xenfs_init_files[] = {
+		[2] = { "capabilities", &capabilities_file_ops, S_IRUGO },
+		{ "xsd_kva", &xsd_kva_file_ops, S_IRUSR|S_IWUSR},
+		{ "xsd_port", &xsd_port_file_ops, S_IRUSR|S_IWUSR},
+#ifdef CONFIG_XEN_SYMS
+		{ "xensyms", &xensyms_ops, S_IRUSR},
+#endif
+		{""},
+	};
+
+	return simple_fill_super(sb, XENFS_SUPER_MAGIC,
+			xen_initial_domain() ? xenfs_init_files : xenfs_files);
+}
+
 static int xenfs_get_tree(struct fs_context *fc)
 {
+	if(hide_deprecated)
+		return get_tree_single(fc, xenfs_fill_super_hide_deprecated);
+
 	return get_tree_single(fc, xenfs_fill_super);
 }
 

--fdj2RfSjLxBAspz7--

