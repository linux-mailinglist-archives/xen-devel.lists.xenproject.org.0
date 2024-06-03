Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1F8D7B0C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 07:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734648.1140759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE0VF-0000yc-RR; Mon, 03 Jun 2024 05:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734648.1140759; Mon, 03 Jun 2024 05:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE0VF-0000wn-Oc; Mon, 03 Jun 2024 05:45:05 +0000
Received: by outflank-mailman (input) for mailman id 734648;
 Mon, 03 Jun 2024 00:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/YIx=NF=quicinc.com=quic_jjohnson@srs-se1.protection.inumbo.net>)
 id 1sDvhi-0007dJ-S5
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 00:37:38 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e5d704-2141-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 02:37:35 +0200 (CEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NgCVZ029983;
 Mon, 3 Jun 2024 00:37:31 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7djnw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 00:37:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4530bTpn029167
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jun 2024 00:37:29 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 17:37:29 -0700
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
X-Inumbo-ID: 77e5d704-2141-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gI23069akMvv2fLPXYYcSC
	TFV09EJupDQM5/X6eZXMI=; b=GtQviHh4QfXIpYC/XJTYu3uGqqDBP2fbEExWgT
	T9OP7YIdlxKV3H63+gq3RccikmQWrjzkIxczGEhHvuIB3H8w1Hx52RNKKY4+es26
	Qpj8ALOvEtDMuzd4XWsRUbozIjobUIpr4Y0CkJKf3wIm1TEgCs/5dJq8sLRXHp2/
	EoBzIDzBapY7YUY/8vy7MxW6fzk9vIFOfCecK0Cgzbg9LX/ShYMJm1NGk5f50Ser
	NFA/g2PTMT/UWrqGdO19rPElQBuhye/PB4qMZ/58zP6J51KgaYFbPqUhqLIe6gki
	0y/cugFGr6UGwoc5+Pz/814gdZWv9LKPAMl8oqBxXUgfZP3Q==
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 2 Jun 2024 17:37:28 -0700
Subject: [PATCH] xen/blkback: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEcQXWYC/x2MQQrCMBAAv1L27EIMwaJfEQ+bZGuXtqlsqgRK/
 +7qbeYws0NlFa5w63ZQ/kiVtZicTx2kkcqTUbI5eOeDuziPS8Y4r2nCxsVoimTscgzXkH3f0wC
 WvpQHaf/t/WEeqTJGpZLG32yW8m64UN1Y4Ti+leS1yYUAAAA=
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Jens Axboe
	<axboe@kernel.dk>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gIsLlGKjs2kiMEpeW4_9gb3LGjvCXwcn
X-Proofpoint-GUID: gIsLlGKjs2kiMEpeW4_9gb3LGjvCXwcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030003

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/block/xen-blkback/blkback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 944576d582fb..838064593f62 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1563,5 +1563,6 @@ static void __exit xen_blkif_fini(void)
 
 module_exit(xen_blkif_fini);
 
+MODULE_DESCRIPTION("Virtual block device back-end driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("xen-backend:vbd");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240602-md-block-xen-blkback-0db494d277af


