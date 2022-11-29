Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6363C355
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449480.706249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02HB-0005WA-4k; Tue, 29 Nov 2022 15:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449480.706249; Tue, 29 Nov 2022 15:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02HB-0005TI-1D; Tue, 29 Nov 2022 15:12:01 +0000
Received: by outflank-mailman (input) for mailman id 449480;
 Tue, 29 Nov 2022 15:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lf4Y=35=citrix.com=prvs=3251faa97=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1p02HA-0005TC-Ac
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:12:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29caf6a0-6ff8-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 16:11:58 +0100 (CET)
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
X-Inumbo-ID: 29caf6a0-6ff8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669734718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FKAcdCfqcGrJYFfhNECxRdqUbzNbMUCLFKQUQIe3/uU=;
  b=OXU0NGo4VmiLgzd+iZwLE5+GDf2eu/yfHdmL0deZymzf6WCFogQE6Zkn
   3TfJ2mo8QRCJuJSdZdqowRGx8qtwwFkrGy6CdsGhz8yQjqxjTIKLxc9NZ
   oceRq4Agy9nJd15tQZHqe9Lrpnzn06CyPPjeMqPMJYi9KUL9kfbNnBj9x
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88308420
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sWt9j6354+v2TVIF5/bD5VVxkn2cJEfYwER7XKvMYLTBsI5bp2ZTy
 TMcDWqHb6zZNGb8Lot/bd6zo0MFvZXcmtNnTQtkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJnl/+
 +AaDA43SwGC3dqKg4iCGulRv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWpOqywFP+dyZVgFmUubA28y7YywkZPL3FYIqOIozWH509ckCwq
 Wno8WX7WC0hNsHEyn3Y3nyPvtHItHauMG4VPOLhraM76LGJ/UQZDwcXTh28uuWjjVClWMN3L
 FYd8S4j66M18SSDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHt7mYSmmU8LuOmi+jIigeLWIEZigsQBMM5p/op4RbphbOSMtzVa24lNv4HRnuz
 D2Q6isznbMeiYgMzarT1VLImTW3vbDSUxU4oA7QWwqN9RhlbYSoY4ip71nz7vtaKoudCF6bs
 xA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP0pkZeEYUj0wqX3m+iJ7hsowtHdEdUC5NREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa6NMIcXCnRlXErepXw1OxbMt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ3Ye1dWLdtRrpjhE9hnOky2
 4g3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT9/WqGPmehwK9M6wcy5c9skG
 VnkCidlJKfX3yWbeW1mlFg8AF8QYXqPhS1iZnF9VbpZ83MifZyu/M8im2gfJNEaGBhY5acsF
 ZEtIpzQasmjvxybo1zxm7Gh9t09HPlq7CrSVxeYjM8XJcQ6GlSXpI+8I2MCNkAmV0KKiCf3m
 JX4viuzfHbJb1QzV646tNrHI4uNgEUg
IronPort-HdrOrdr: A9a23:2/a/mqlzZccVWZBw3+DcwPBe/xjpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7Ar5OUtQ/+xoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="88308420"
From: Per Bilse <per.bilse@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Per Bilse <per.bilse@citrix.com>, Juergen Gross <jgross@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, "moderated
 list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: [PATCH] drivers/xen/hypervisor: Expose VM SIF flags to userspace
Date: Tue, 29 Nov 2022 15:00:57 +0000
Message-ID: <20221129150058.266943-1-per.bilse@citrix.com>
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

This patch exposes all SIF flags in /sys/hypervisor/properties/flags,
which will coexist with /proc/xen while dependencies are being migrated.
Possible values are "privileged", "initdomain", "multiboot",
"mod_start_pfn", and "virtmap", with "initdomain" being the equivalent
of "control_d".

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
 drivers/xen/sys-hypervisor.c | 26 ++++++++++++++++++++++++++
 include/xen/interface/xen.h  | 13 ++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index fcb0792f090e..7393e04bdb6d 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -379,6 +379,31 @@ static ssize_t buildid_show(struct hyp_sysfs_attr *attr, char *buffer)
 
 HYPERVISOR_ATTR_RO(buildid);
 
+static ssize_t flags_show(struct hyp_sysfs_attr *attr, char *buffer)
+{
+	static char const *const sifstr[SIFN_NUM_SIFN] = {
+		[SIFN_PRIV]  = "privileged",
+		[SIFN_INIT]  = "initdomain",
+		[SIFN_MULTI] = "multiboot",
+		[SIFN_PFN]   = "mod_start_pfn",
+		[SIFN_VIRT]  = "virtmap"
+	};
+	unsigned sifnum, sifmask;
+	ssize_t ret = 0;
+
+	sifmask = ~(~0U << SIFN_NUM_SIFN);  // ...0000111...
+	if (xen_domain() && (xen_start_flags & sifmask) != 0) {
+		for (sifnum = 0; sifnum != SIFN_NUM_SIFN; sifnum++) {
+			if ((xen_start_flags & (1<<sifnum)) != 0)
+				ret += sprintf(buffer+ret, "%s ", sifstr[sifnum]);
+		}
+		buffer[ret-1] = '\n';
+	}
+	return ret;
+}
+
+HYPERVISOR_ATTR_RO(flags);
+
 static struct attribute *xen_properties_attrs[] = {
 	&capabilities_attr.attr,
 	&changeset_attr.attr,
@@ -386,6 +411,7 @@ static struct attribute *xen_properties_attrs[] = {
 	&pagesize_attr.attr,
 	&features_attr.attr,
 	&buildid_attr.attr,
+	&flags_attr.attr,
 	NULL
 };
 
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 0ca23eca2a9c..762a348abe3e 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -648,11 +648,14 @@ struct start_info {
 };
 
 /* These flags are passed in the 'flags' field of start_info_t. */
-#define SIF_PRIVILEGED      (1<<0)  /* Is the domain privileged? */
-#define SIF_INITDOMAIN      (1<<1)  /* Is this the initial control domain? */
-#define SIF_MULTIBOOT_MOD   (1<<2)  /* Is mod_start a multiboot module? */
-#define SIF_MOD_START_PFN   (1<<3)  /* Is mod_start a PFN? */
-#define SIF_VIRT_P2M_4TOOLS (1<<4)  /* Do Xen tools understand a virt. mapped */
+/* Text strings are printed out in sys-hypervisor.c, we guard   */
+/* against mix-ups and errors by enumerating the flags.         */
+enum { SIFN_PRIV, SIFN_INIT, SIFN_MULTI, SIFN_PFN, SIFN_VIRT, SIFN_NUM_SIFN };
+#define SIF_PRIVILEGED      (1<<SIFN_PRIV)  /* Is the domain privileged? */
+#define SIF_INITDOMAIN      (1<<SIFN_INIT)  /* Is this the initial control domain? */
+#define SIF_MULTIBOOT_MOD   (1<<SIFN_MULTI) /* Is mod_start a multiboot module? */
+#define SIF_MOD_START_PFN   (1<<SIFN_PFN)   /* Is mod_start a PFN? */
+#define SIF_VIRT_P2M_4TOOLS (1<<SIFN_VIRT)  /* Do Xen tools understand a virt. mapped */
 				    /* P->M making the 3 level tree obsolete? */
 #define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
 
-- 
2.31.1


