Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1F9047DA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 01:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738774.1145628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHBJh-0006YH-Hv; Tue, 11 Jun 2024 23:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738774.1145628; Tue, 11 Jun 2024 23:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHBJh-0006VL-FJ; Tue, 11 Jun 2024 23:54:17 +0000
Received: by outflank-mailman (input) for mailman id 738774;
 Tue, 11 Jun 2024 23:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MXno=NN=quicinc.com=quic_jjohnson@srs-se1.protection.inumbo.net>)
 id 1sHBJg-0006VF-2U
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 23:54:16 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6cca60d-284d-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 01:54:13 +0200 (CEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBa1Zo008217;
 Tue, 11 Jun 2024 23:54:08 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8s08t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 23:54:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BNs6iK022456
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 23:54:06 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 16:54:05 -0700
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
X-Inumbo-ID: e6cca60d-284d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0Y4GBa+TXFeSS85sJfdH9J
	Pc3l5l71wn18Ou06XOFkE=; b=e4TLos3dK/YG8S+9jMfoo4Wu+sKGwfLL4fKyS0
	xiEXEYx43KDh9ay6ggX33lNeVg28igFxu4fUTQAZvQVmgwiBy0kn4F56a/FQg0Rx
	inxz72fZKXyRAvETnJDyzm2JR6M8j8DjKgCkUBTWwA/PFphcnsrUw/qI3gMk0Okm
	Et9HdGp4QNmllsaHDj+xp7juIvfMgwK5tADIZhw4Vsw72eH7EQQO52A60s28JtP1
	/xa2YAbW7mskRvXdrSyGva+1+lOhKxy/UGof3JXoyGFH1zt4KhpIrIbSTtTC/aYk
	qWMhE3YiSkFHy/MpZgqrzJk1qBrFGajQlYLwgfRyy1/Wz6+g==
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 16:54:05 -0700
Subject: [PATCH] xen: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-xen-v1-1-1eb677364ca6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJzjaGYC/x3MywrCMBBG4Vcps3YgCV6KryIu0uSPHbBRZmopl
 L670eW3OGcjgwqMrt1GikVMXrXBHzpKY6wPsORmCi4c3dl7njJnlQVqvKLyKYSSelxQXE8teiu
 KrP/h7d48RAMPGmsaf5un1M/KU7QZSvv+BbPmCuV/AAAA
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y8hV1AhieqTHTlSwvyJF07qR0S-m50t2
X-Proofpoint-GUID: y8hV1AhieqTHTlSwvyJF07qR0S-m50t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_12,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110162

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-pciback/xen-pciback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-evtchn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-privcmd.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.
---
 drivers/xen/evtchn.c               | 1 +
 drivers/xen/privcmd-buf.c          | 1 +
 drivers/xen/privcmd.c              | 1 +
 drivers/xen/xen-pciback/pci_stub.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index f6a2216c2c87..9b7fcc7dbb38 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -729,4 +729,5 @@ static void __exit evtchn_cleanup(void)
 module_init(evtchn_init);
 module_exit(evtchn_cleanup);
 
+MODULE_DESCRIPTION("Xen /dev/xen/evtchn device driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/xen/privcmd-buf.c b/drivers/xen/privcmd-buf.c
index 2fa10ca5be14..0f0dad427d7e 100644
--- a/drivers/xen/privcmd-buf.c
+++ b/drivers/xen/privcmd-buf.c
@@ -19,6 +19,7 @@
 
 #include "privcmd.h"
 
+MODULE_DESCRIPTION("Xen Mmap of hypercall buffers");
 MODULE_LICENSE("GPL");
 
 struct privcmd_buf_private {
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 67dfa4778864..b9b784633c01 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -48,6 +48,7 @@
 
 #include "privcmd.h"
 
+MODULE_DESCRIPTION("Xen hypercall passthrough driver");
 MODULE_LICENSE("GPL");
 
 #define PRIV_VMA_LOCKED ((void *)1)
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index e34b623e4b41..4faebbb84999 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -1708,5 +1708,6 @@ static void __exit xen_pcibk_cleanup(void)
 module_init(xen_pcibk_init);
 module_exit(xen_pcibk_cleanup);
 
+MODULE_DESCRIPTION("Xen PCI-device stub driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("xen-backend:pci");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-md-drivers-xen-522fc8e7ef08


