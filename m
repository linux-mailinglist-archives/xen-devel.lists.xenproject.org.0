Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5475366CC
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 20:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338101.562852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nueFk-000517-H3; Fri, 27 May 2022 18:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338101.562852; Fri, 27 May 2022 18:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nueFk-0004z4-E2; Fri, 27 May 2022 18:00:00 +0000
Received: by outflank-mailman (input) for mailman id 338101;
 Fri, 27 May 2022 17:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MjmU=WD=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nueFi-0004yy-TS
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 17:59:59 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0465e15-dde6-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 19:59:56 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RGA4KE007173;
 Fri, 27 May 2022 17:59:16 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tdyqhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 May 2022 17:59:15 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24RHo4Sm007602; Fri, 27 May 2022 17:59:14 GMT
Received: from bostrovs-us.us.oracle.com (bostrovs-us.us.oracle.com
 [10.152.12.19])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g93x1xpnr-1; Fri, 27 May 2022 17:59:14 +0000
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
X-Inumbo-ID: d0465e15-dde6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2021-07-09;
 bh=GwnebTzOd5wOseRW/GGVCpRp/qP0tcU6Vg3nLISbrpI=;
 b=dBeVkQgnGItGMNHBJL0tjsELF0e8bXbIOqUVfyOImmsOCfxgThk+2JuKYK7JS5vm702S
 QprPYaXZ6F2iOFs7u9Vz5NfFMfHD3p8Yv7gyLKWJFbeErlIp3X+C+EwlkIgXdAU7nZL/
 StXbY81etx7TS19rhA5gP4hRKF1PONehdsrAdMEeyglVncgk5J/QsFTRZTHEgjx6hF5M
 bZzI1vqOrGwnrNKCoQTOhAQXzc41jjFILuiR6extRG640ZMSA5nRmW1hU/f/35MrBvqF
 uZEfrJrl3ORTamL52r+iaC7TNxXn7Lk67u9eblY4pMPVGB876b2Z9vBwdZxNthfAD8S8 Pw== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com
Subject: [PATCH] MAINTAINERS: Update Xen maintainership
Date: Fri, 27 May 2022 13:57:05 -0400
Message-Id: <1653674225-10447-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-27_05:2022-05-27,2022-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205270087
X-Proofpoint-GUID: QhWoUm9D1nSCVjvVtXBiIk70L5n3x3dH
X-Proofpoint-ORIG-GUID: QhWoUm9D1nSCVjvVtXBiIk70L5n3x3dH

Due to time constraints I am stepping down as maintainter. I will stay
as reviewer for x86 code (for which create a separate category).

Stefano is now maintainer for Xen hypervisor interface and Oleksandr has
graciously agreed to become a reviewer.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 MAINTAINERS | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6d879cb0afd..b879c4e6750e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21549,23 +21549,29 @@ F:	arch/arm64/include/asm/xen/
 F:	arch/arm64/xen/
 
 XEN HYPERVISOR INTERFACE
-M:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
 M:	Juergen Gross <jgross@suse.com>
-R:	Stefano Stabellini <sstabellini@kernel.org>
+M:	Stefano Stabellini <sstabellini@kernel.org>
+R:	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 F:	Documentation/ABI/stable/sysfs-hypervisor-xen
 F:	Documentation/ABI/testing/sysfs-hypervisor-xen
-F:	arch/x86/include/asm/pvclock-abi.h
-F:	arch/x86/include/asm/xen/
-F:	arch/x86/platform/pvh/
-F:	arch/x86/xen/
 F:	drivers/*/xen-*front.c
 F:	drivers/xen/
 F:	include/uapi/xen/
 F:	include/xen/
 
+XEN HYPERVISOR X86
+M:	Juergen Gross <jgross@suse.com>
+R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
+L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/x86/include/asm/pvclock-abi.h
+F:	arch/x86/include/asm/xen/
+F:	arch/x86/platform/pvh/
+F:	arch/x86/xen/
+
 XEN NETWORK BACKEND DRIVER
 M:	Wei Liu <wei.liu@kernel.org>
 M:	Paul Durrant <paul@xen.org>
-- 
1.8.3.1


