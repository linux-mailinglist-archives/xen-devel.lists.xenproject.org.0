Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46365C067
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 14:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470615.730167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgwH-0007pL-5K; Tue, 03 Jan 2023 13:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470615.730167; Tue, 03 Jan 2023 13:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgwH-0007md-2C; Tue, 03 Jan 2023 13:02:45 +0000
Received: by outflank-mailman (input) for mailman id 470615;
 Tue, 03 Jan 2023 13:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hIZ3=5A=citrix.com=prvs=3603a684f=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1pCgwF-0007l1-8g
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 13:02:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e58a8ef3-8b66-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 14:02:39 +0100 (CET)
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
X-Inumbo-ID: e58a8ef3-8b66-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672750959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q3pBHOUVWnIYdWgJPflbM7j5UuiigUvRijYwk8CcALY=;
  b=Y+L66T8d29bwOBvqTqhebby2KXA8TbrA2Y4g3o0Z66L2hJ23k4uujweF
   Clcb2od2n8Ab5buAbi4v1N0oPCrH0J5JWjh05/yUmE6aZaLKERtUVfcVc
   9zUcMK6uh9qqF5O4RLyDbiyKedfeo1VNJ0lAVH/fO/3OE8r1mqliSB4gr
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89911226
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D7kuqKjbAIKAlgz3YuoRr//OX161qBAKZh0ujC45NGQN5FlHY01je
 htvWWmGM/iCN2XxedBxad+/o0xTusfSnIBnQFZs+HwwFCob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ6cmo0RCGJodirg/WHFdhIgYcFFsDCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHHficeglORvqcf6GnP1g1hlrPqNbI5f/TaFJQMxxzC+
 Aoq+UypAi88bv6RzgDcrHGC2bCUoSChB6ANQejQGvlC3wTImz175ActfUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZt75Uh6jqXiIpCkASsFQGO037gKK4qfM6gPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESwUK3ISICwJVw0I5/H9r4wpyBHCVNBuFOiylNKdMTP/2
 TeRtwAlmq4ey8UM0s2GEUvv2mz24MKTF0hsu1uRDjnNAh5FiJCNRdby0HLq59B6McXecgawm
 H9HvfKXxbVbZX2SrxClTOIIFbCvwv+KNjzAnFJid6UcGySRF22LJt4JvmwnTKt9GoNdIGKyP
 heP0e9EzMULVEZGe5ObdG5Y5y4C6aH7XeroWfnPBjalSsggLVTXlM2CiKP54owMrKTOuftjU
 Xt4WZz2ZZr/NUiA5GTeegvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3b+luFr
 4oBa5bVkH2ztdEShQGOqOYuwa0idyBnVfgaVeQNHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1w
 51JYWcBkACXrSSeeW23hoVLNOuHsWBX8ShqYkTB/D+AhxAeXGpYxP1PLMZvJOJ6rLELIDwdZ
 6BtRvhsy89nElzvkwnxp7GmxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:Va8EVat2YcnzdA9hxSrePiDE7skDzdV00zEX/kB9WHVpmwKj9v
 xG+85rsyMc6QxhP03I/OrrBEDuex7hHPJOjbX5eI3SPzUPVgOTXf1fBMjZskDd8xSXzJ8j6U
 4YSdkBNDSTNzhHZLfBkW2F+o0bsaC6GcmT7I+0854ud3AJV0gH1WhE422gYyhLrWd9a6bRPa
 Dsl/Zvln6PeWk3cs/+PXUMRe7Fzue77q7OUFopBwMH9ALLtj+j6Kf7Hx+Ety1uKA9n8PMN8X
 Xljwe83amos+i6xhjAk0ff4o9bgsGJ8KoyOOW8zuYUNxTxgUKTaINtV6bqhkFMnN2S
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="89911226"
From: Per Bilse <per.bilse@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Per Bilse <per.bilse@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "moderated list:XEN HYPERVISOR INTERFACE"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v3] drivers/xen/hypervisor: Expose Xen SIF flags to userspace
Date: Tue, 3 Jan 2023 13:02:13 +0000
Message-ID: <20230103130213.2129753-1-per.bilse@citrix.com>
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
v3: update assumed availability in documentation
---
 Documentation/ABI/stable/sysfs-hypervisor-xen | 13 ++++
 drivers/xen/sys-hypervisor.c                  | 69 +++++++++++++++++--
 2 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-hypervisor-xen b/Documentation/ABI/stable/sysfs-hypervisor-xen
index 748593c64568..be9ca9981bb1 100644
--- a/Documentation/ABI/stable/sysfs-hypervisor-xen
+++ b/Documentation/ABI/stable/sysfs-hypervisor-xen
@@ -120,3 +120,16 @@ Contact:	xen-devel@lists.xenproject.org
 Description:	If running under Xen:
 		The Xen version is in the format <major>.<minor><extra>
 		This is the <minor> part of it.
+
+What:		/sys/hypervisor/start_flags/*
+Date:		March 2023
+KernelVersion:	6.3.0
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


