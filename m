Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D9444E71
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 06:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221228.382836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miVXH-0000qx-41; Thu, 04 Nov 2021 05:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221228.382836; Thu, 04 Nov 2021 05:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miVXH-0000oU-11; Thu, 04 Nov 2021 05:43:39 +0000
Received: by outflank-mailman (input) for mailman id 221228;
 Thu, 04 Nov 2021 05:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTzK=PX=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1miVXF-0000oO-CC
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 05:43:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ceec0f-3d32-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 06:43:35 +0100 (CET)
Received: from BN9PR03CA0777.namprd03.prod.outlook.com (2603:10b6:408:13a::32)
 by CO6PR02MB8753.namprd02.prod.outlook.com (2603:10b6:303:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 05:43:31 +0000
Received: from BN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::da) by BN9PR03CA0777.outlook.office365.com
 (2603:10b6:408:13a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Thu, 4 Nov 2021 05:43:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT018.mail.protection.outlook.com (10.13.3.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 05:43:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 22:43:30 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 3 Nov 2021 22:43:30 -0700
Received: from [172.19.2.115] (port=60174 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1miVX8-0001OJ-53; Wed, 03 Nov 2021 22:43:30 -0700
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
X-Inumbo-ID: 25ceec0f-3d32-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBBvrA7bSXKT9FtkCkYxnBOSZrlHu0/iapqtYgp/KonJlnY3vCeKKYB7bg/gz93CmjDEs8Qr/8xLYCG8bNidngUGuSH49kfPH4FaMe3l2qGCpdkP2Mj95EUl92E4/mb0rDC0K2TFpFQNsBURO5o0TF/EAnLTzyh5HySgJHXyZ41Z6vnfAB2rTwjyha0sAYgVRgkEA/YMF4a0cZDtSa87x32kfYVN0Vyr86dRENXOtlNayaqY+UBZDI9ztYOdAAsvr7fFDbCHmjIEw16OUq0dKU91DyeZb64ZpJ5FAVB44IHpzUdn6S/a6PempkCHzhlT/ow3Ke0zzHwzFJMcyVTMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWMRBqd3yfJugKLPOYJKViPfzC8e1kdNt05Z6GfIEW8=;
 b=l5t6cLlL0YJdO3RF8LDw5gFsOckS+5hKEk6e28dEzDo9xbmm8TgXW+EVjq6mxJ4V+w2dnJRuJ+yF6Y5z9T9qq4CDmhS9iIRNOhiVMiLxczUvBSbrGuyD8mD2KpG17whyl08RzhSlDCD0FppJBJF3la+2l0atw7BNmt7+RGGOp4UDXhfR5rzlEnJQO+mxnosonLUJ28If5xTdeDac+bR/CwRyfj0vc71/M26Ei7hcBAYtANdDTrY4Nae72mWZWeFOUkcxX/DQYVhfJYUVxp0BjCnUeJPOaA3IUoAe/x/jiTadPUqlhUErWVUWHUiBUtuQ1+31VNrV4KN5Pc0OrMdIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWMRBqd3yfJugKLPOYJKViPfzC8e1kdNt05Z6GfIEW8=;
 b=dJEv5SeTq+swFV82EM63RUsZ+ZkCsRVFRl0fYJkhapdRTqRJtoD3b942b4D/AVlRLOMvF1KuAkd4O5wXfzKaWzjWnNo21svM8dphRJ0Kzy1/uvGuPresuWacQuqPON/4YIPqlEPb8lCaMmcpfPgHdSLXF0AWw2RvyYnO7j6/eXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][PATCH 0/1] Update libfdt to v1.6.1
Date: Wed, 3 Nov 2021 22:43:21 -0700
Message-ID: <1636004602-258775-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d043d38-0dc7-4f4f-4674-08d99f5608bc
X-MS-TrafficTypeDiagnostic: CO6PR02MB8753:
X-Microsoft-Antispam-PRVS:
	<CO6PR02MB875319F601FF2DBCD16AF8ACBC8D9@CO6PR02MB8753.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zx1ZwSl+HRrkz1ivA2RCWsfaI+lytweTO+GycBS6kLOuRzne2Xsq8yUzfzFwRL/bsnto1CFYvlw0pLiOyQf/VYCznL/x8Ez9/u1dKtmL65SL/GlFCx7KfMB/f1NWWA9ONMIEapy7V90fhS6byx2ZiimX3uC3nxX1Sudm9WdxOEhPTJDkYWcXROpp+v6IJau96cKV/kAL3eZiXtiukOgxNI9PuoCCRQjO7gJrhUHYcdnAbWkTv3+8V/iFPee7KZNUEEIEGLIJN1Vh4QyCvtiF23yYvEhl4BB0ZaBVqGGkZ37O7K3GsWbFh+1zqd40JcGuODXKicPOnPDxQNb1eUgrumujQt84gowP6LRI2KMWQinYIND/eyrX7+45ooR7m6N7HWSRAAZurHNGctOptqD93Lpwf55UjPvPkrrh1YNsU0Ub7d+6AGdwmAr9BSl8qDj2taDtWZdU2ZLFzwt53FEirwYTdOQP3M33PzPylih6Nf4dsdsw0gbOm9QoBTKwO4xm5SsHLnOm7gWROZirn1VbJMz9wcYFTHb/8Uzm4TsyuhTgsf9xzzrcbEE3JL8wBji1/rfYiuXGs6ID6OxREeisonVRu3UWMIyw89SztqJ5mO4qzcKAPCI8r536AbsOJ0jpu8INTMhxj7r+7YCEDD5+IE752n2ObXncE7o+VhM6gOeHE9mt5YIw4kVg4ABpgjGqIEh0CTBEMD3ks3Ku38BU+ObQcF5NA1SHt8Q6+dlgmza0TL/npHuVoQQx3F1L2L4IrKDg6BIqm8xdQ2b4d0REz7/6Bc6bQi3s3DPv5siBUUykfoWOfOdb1TqfWhCmpCZt
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36860700001)(47076005)(8676002)(70586007)(2616005)(6666004)(83380400001)(82310400003)(7696005)(426003)(70206006)(186003)(356005)(2906002)(508600001)(7636003)(15650500001)(54906003)(36756003)(6916009)(4326008)(316002)(26005)(36906005)(107886003)(336012)(5660300002)(9786002)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 05:43:31.0876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d043d38-0dc7-4f4f-4674-08d99f5608bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8753

This update is done to support device tree overlays functionality. This is taken
from David Gibson's DTC git: github.com/dgibson/dtc

Regards,
Vikram

Vikram Garhwal (1):
  Update libfdt to v1.6.1

 xen/common/libfdt/Makefile.libfdt   |  10 +-
 xen/common/libfdt/fdt.c             | 226 ++++++---
 xen/common/libfdt/fdt_addresses.c   | 101 ++++
 xen/common/libfdt/fdt_check.c       |  93 ++++
 xen/common/libfdt/fdt_empty_tree.c  |  46 +-
 xen/common/libfdt/fdt_overlay.c     | 884 ++++++++++++++++++++++++++++++++++++
 xen/common/libfdt/fdt_ro.c          | 514 ++++++++++++++++-----
 xen/common/libfdt/fdt_rw.c          | 249 +++++-----
 xen/common/libfdt/fdt_strerror.c    |  55 +--
 xen/common/libfdt/fdt_sw.c          | 312 +++++++++----
 xen/common/libfdt/fdt_wip.c         |  88 ++--
 xen/common/libfdt/libfdt_internal.h | 223 ++++++---
 xen/include/xen/libfdt/fdt.h        |  51 +--
 xen/include/xen/libfdt/libfdt.h     | 858 +++++++++++++++++++++++++++++-----
 xen/include/xen/libfdt/libfdt_env.h | 100 +++-
 15 files changed, 3025 insertions(+), 785 deletions(-)
 create mode 100644 xen/common/libfdt/fdt_addresses.c
 create mode 100644 xen/common/libfdt/fdt_check.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

-- 
2.7.4


