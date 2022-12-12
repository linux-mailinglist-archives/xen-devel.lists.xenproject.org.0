Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFD64A582
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 18:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459881.717666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4mFz-0006Qc-AO; Mon, 12 Dec 2022 17:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459881.717666; Mon, 12 Dec 2022 17:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4mFz-0006ON-6o; Mon, 12 Dec 2022 17:06:23 +0000
Received: by outflank-mailman (input) for mailman id 459881;
 Mon, 12 Dec 2022 17:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYNi=4K=citrix.com=prvs=3386b37d0=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1p4mFx-0006Me-VP
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 17:06:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a95a57c-7a3f-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 18:06:19 +0100 (CET)
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
X-Inumbo-ID: 4a95a57c-7a3f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670864779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sMPzjY9YCDiCSf18nv+XYdrNotL4tPcjoEGZ13RJQys=;
  b=S+nqZ1eux+s7x3j5L79lWBmKg3X1kHY1X6PWE19IMl2XK7o5IhOvycXk
   hKmMycvIkiaxWHFIKxbffHS8sJdpUsUDYkXinAWX10oEP9oLeXvPWt+eq
   CjndMTLM3lwgUkyRQQL1S6G+buhSuUsYuDkJqIHj7NZIxGEMU8Cg0uEYE
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87954350
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rm/1iKBo8za6zBVW//7jw5YqxClBgxIJ4kV8jS/XYbTApGx33mNSz
 jQaWWiDa/aNZzT9KIh3aI/g/RxT75+DzNZmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlB5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0eRRIUhgp
 PsiBTlVVkGPpPnu8Ym+Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/MJ8k2s2pgmLyWzZZtEiUtew85G27IAlZgOe8bYaOJ4TiqcN9mHyyl
 H7/wk/FMhhdCfC2yWre0W29mbqa9c/8cN1LT+DpnhJwu3WI3XAaAhASUVq9oNG6h1S4VtYZL
 FYbkgIpqaUx70WtQsPKQwyjoHWEsxgfXPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqZ97GJvXaxNDITIGsqeyAJV00G7sPlrYV1iQjAJv5hH7SylcbdAizrz
 naBqy1WulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdkmnyCNQSt+iXaGhsWCK4dVbdLeiS0bU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bKhAgBc2B2y8nT3
 Kt3lu7yZUv28Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bbwPRPrtksvPf8FS9H
 zNj2yyikkU3bQEDSnOPrd57wa4ichDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/09qws8x
 VnkAhUw4AOm1RX6xfCiNigLhEXHAcwu8hrW/EUEYT6V5pTUSdz/tPtOK8VsI+hPGS4K5accc
 sTpsv6oWpxnIgkrMRxHBXUhhOSOrCiWuD8=
IronPort-HdrOrdr: A9a23:FB7TDqp+xM8KxmKDlMMcfy0aV5rzeYIsimQD101hICG9JPbo8f
 xGUs516faUskdzZJhOo7u90cW7K080lqQU3WByB9mftVLdyQyVxehZhOPfKlvbdhEWndQ96U
 4PScRDIey1N1Rgksbx7C6/DZINxNGG9YqshevY0h5WPGVXgw4L1XYBNu42eHcGITWvpPACZf
 ih2vY=
X-IronPort-AV: E=Sophos;i="5.96,239,1665460800"; 
   d="scan'208";a="87954350"
From: Per Bilse <per.bilse@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Per Bilse <per.bilse@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "moderated list:XEN HYPERVISOR INTERFACE"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2] drivers/xen/hypervisor: Expose Xen SIF flags to userspace
Date: Mon, 12 Dec 2022 17:06:05 +0000
Message-ID: <20221212170605.28192-1-per.bilse@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

/proc/xen is a legacy pseudo filesystem which predates Xen support
getting merged into Linux.  It has largely been replaced with more
normal locations for data (/sys/hypervisor/ for info, /dev/xen/ for
user devices).  We want to compile xenfs support out of the dom0 kernel.

There is one item which only exists in /proc/xen, namely
/proc/xen/capabilities with "control_d" being the signal of "you're in
the control domain".  This ultimately comes from the SIF flags provided
at VM start.

This patch exposes all SIF flags in /sys/hypervisor/start_flags/ as
boolean files, one for each bit, returning '1' if set, '0' otherwise.
Two known flags, 'privileged' and 'initdomain', are explicitly named,
and all remaining flags can be accessed via generically named files,
as suggested by Andrew Cooper.

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
v2: minor fix to layout, incorporate suggestions from Juergen Gross
---
 Documentation/ABI/stable/sysfs-hypervisor-xen | 13 ++++
 drivers/xen/sys-hypervisor.c                  | 69 +++++++++++++++++--
 2 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-hypervisor-xen b/Documentation/ABI/stable/sysfs-hypervisor-xen
index 748593c64568..dbc5eccce8ea 100644
--- a/Documentation/ABI/stable/sysfs-hypervisor-xen
+++ b/Documentation/ABI/stable/sysfs-hypervisor-xen
@@ -120,3 +120,16 @@ Contact:	xen-devel@lists.xenproject.org
 Description:	If running under Xen:
 		The Xen version is in the format <major>.<minor><extra>
 		This is the <minor> part of it.
+
+What:		/sys/hypervisor/start_flags/*
+Date:		December 2022
+KernelVersion:	6.1.0
+Contact:	xen-devel@lists.xenproject.org
+Description:	If running under Xen:
+		All bits in Xen's start-flags are represented as
+		boolean files, returning '1' if set, '0' otherwise.
+		This takes the place of the defunct /proc/xen/capabilities,
+		which would contain "control_d" on dom0, and be empty
+		otherwise.  This flag is now exposed as "initdomain" in
+		addition to the "privileged" flag; all other possible flags
+		are accessible as "unknownXX".
diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index fcb0792f090e..f5460b34ae6f 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -31,7 +31,10 @@ struct hyp_sysfs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct hyp_sysfs_attr *, char *);
 	ssize_t (*store)(struct hyp_sysfs_attr *, const char *, size_t);
-	void *hyp_attr_data;
+	union {
+		void *hyp_attr_data;
+		unsigned long hyp_attr_value;
+	};
 };
 
 static ssize_t type_show(struct hyp_sysfs_attr *attr, char *buffer)
@@ -399,6 +402,60 @@ static int __init xen_sysfs_properties_init(void)
 	return sysfs_create_group(hypervisor_kobj, &xen_properties_group);
 }
 
+#define FLAG_UNAME "unknown"
+#define FLAG_UNAME_FMT FLAG_UNAME "%02u"
+#define FLAG_UNAME_MAX sizeof(FLAG_UNAME "XX")
+#define FLAG_COUNT (sizeof(xen_start_flags) * BITS_PER_BYTE)
+static_assert(sizeof(xen_start_flags) 
+		<= sizeof_field(struct hyp_sysfs_attr, hyp_attr_value));
+
+static ssize_t flag_show(struct hyp_sysfs_attr *attr, char *buffer)
+{
+	char *p = buffer;
+
+	*p++ = '0' + ((xen_start_flags & attr->hyp_attr_value) != 0);
+	*p++ = '\n';
+	return p - buffer; 
+}
+
+#define FLAG_NODE(flag, node)				\
+	[ilog2(flag)] = {				\
+		.attr = { .name = #node, .mode = 0444 },\
+		.show = flag_show,			\
+		.hyp_attr_value = flag			\
+	}
+
+/*
+ * Add new, known flags here.  No other changes are required, but
+ * note that each known flag wastes one entry in flag_unames[].
+ * The code/complexity machinations to avoid this isn't worth it
+ * for a few entries, but keep it in mind.
+ */
+static struct hyp_sysfs_attr flag_attrs[FLAG_COUNT] = {
+	FLAG_NODE(SIF_PRIVILEGED, privileged),
+	FLAG_NODE(SIF_INITDOMAIN, initdomain)
+};
+static struct attribute_group xen_flags_group = {
+	.name = "start_flags",
+	.attrs = (struct attribute *[FLAG_COUNT + 1]){}
+};
+static char flag_unames[FLAG_COUNT][FLAG_UNAME_MAX];
+
+static int __init xen_sysfs_flags_init(void)
+{
+	for (unsigned fnum = 0; fnum != FLAG_COUNT; fnum++) {
+		if (likely(flag_attrs[fnum].attr.name == NULL)) {
+			sprintf(flag_unames[fnum], FLAG_UNAME_FMT, fnum);
+			flag_attrs[fnum].attr.name = flag_unames[fnum];
+			flag_attrs[fnum].attr.mode = 0444;
+			flag_attrs[fnum].show = flag_show;
+			flag_attrs[fnum].hyp_attr_value = 1 << fnum;
+		}
+		xen_flags_group.attrs[fnum] = &flag_attrs[fnum].attr;
+	}
+	return sysfs_create_group(hypervisor_kobj, &xen_flags_group);
+}
+
 #ifdef CONFIG_XEN_HAVE_VPMU
 struct pmu_mode {
 	const char *name;
@@ -539,18 +596,22 @@ static int __init hyper_sysfs_init(void)
 	ret = xen_sysfs_properties_init();
 	if (ret)
 		goto prop_out;
+	ret = xen_sysfs_flags_init();
+	if (ret)
+		goto flags_out;
 #ifdef CONFIG_XEN_HAVE_VPMU
 	if (xen_initial_domain()) {
 		ret = xen_sysfs_pmu_init();
 		if (ret) {
-			sysfs_remove_group(hypervisor_kobj,
-					   &xen_properties_group);
-			goto prop_out;
+			sysfs_remove_group(hypervisor_kobj, &xen_flags_group);
+			goto flags_out;
 		}
 	}
 #endif
 	goto out;
 
+flags_out:
+	sysfs_remove_group(hypervisor_kobj, &xen_properties_group);
 prop_out:
 	sysfs_remove_file(hypervisor_kobj, &uuid_attr.attr);
 uuid_out:
-- 
2.31.1


