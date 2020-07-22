Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2AB228EDC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 06:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy5w0-0001jk-Eo; Wed, 22 Jul 2020 04:00:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEGq=BB=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1jy5vy-0001je-HG
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 04:00:46 +0000
X-Inumbo-ID: ead26da3-cbcf-11ea-8613-bc764e2007e4
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ead26da3-cbcf-11ea-8613-bc764e2007e4;
 Wed, 22 Jul 2020 04:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT1oRzAdGKkb51iBxvW1zfuuPciEuRCBTB+/EhqZuivualIlH3AJWCBCtE3my58VqUn+eenIXmHEv9XsjPrJoiwR4MSDyZ3qg+C9wSK/BuQdvE9jWk30ZoC9u372DQ2XN+bOwmRV/11AsEXD91L9vuVIYTiuRBRBCerbnVIWdqP+Cj6HC3ftsVf3p7dKTbrn9yvpzCRCIIp8deUcQP+l+jat2vJpWA3wdwOGEbmy5eYIHfe7gDtYTlEn8WUtKYC6SbMC+jA0Ouq6MXDVvnvPZXhK1Dn5IM/qLABD3bBmiKvBtEdxbsp/LJLgIrc+Fx6azwERHl7nM3e/uwNID1Qsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uM6KTWH/QLynHj5webgiJtYpsdqo/HTl87VcEalPow=;
 b=lZj3fcLPNbVPq5VJSwzABFwR5Xr4Dug2O5aH2w179WXVbdph+6+/jDbN56TnaY3s4xg65NK8DlRMlPKTBIyoDwFhDtlmDzhWEFrgdYm8X8R+CPwS6UJO4Eq9GrgoLpaWACx7xKtYn6Wj7Rb296hZ0xpf2alFz91I7ONJq8MhMYPAvN71A+M/8nBnqsNI/Qs5Jxn3B5nQM4XppNQZB/a4+AsUo24kJhcfqhYRypE8MIIiK+6bvRFJaXBEGclLH73ff64Dxbg1E/WvGxFuXXJ9ZsC643gvrtIgAOeVyhOL+/Fx5UyAbZwUmax4+ZLjHYhucAbp+IOoxG5I2p97ML3Eqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uM6KTWH/QLynHj5webgiJtYpsdqo/HTl87VcEalPow=;
 b=Qnjw70VgbdQT7xOKqyFPwV3iWD7642M5q5iTKDVlg6P0qIeNHFIEFBplVDmhustJhmzEt2cfhB73MaEQUrmUCrRhm2ldCz+bgHhnlfk7OrzZmznMTywHaOG2WXwlPNBA4DXTvao5ne58uqUALP76HB4rCUr3sWdqwU3S8Y22+7U=
Received: from DM5PR06CA0031.namprd06.prod.outlook.com (2603:10b6:3:5d::17) by
 SN6PR02MB5582.namprd02.prod.outlook.com (2603:10b6:805:eb::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18; Wed, 22 Jul 2020 04:00:44 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::75) by DM5PR06CA0031.outlook.office365.com
 (2603:10b6:3:5d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Wed, 22 Jul 2020 04:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 22 Jul 2020 04:00:43
 +0000
Received: from [149.199.38.66] (port=50077 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5u7-0007kZ-LT; Tue, 21 Jul 2020 20:58:51 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5vv-0002vJ-LF; Tue, 21 Jul 2020 21:00:43 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06M40eUD012816; 
 Tue, 21 Jul 2020 21:00:40 -0700
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5vs-0002u2-Mh; Tue, 21 Jul 2020 21:00:40 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [RFC v2 0/2] Generic SMMU Bindings
Date: Tue, 21 Jul 2020 21:00:29 -0700
Message-Id: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39850400004)(376002)(396003)(136003)(346002)(46966005)(81166007)(83380400001)(6916009)(82310400002)(36756003)(4326008)(356005)(54906003)(8936002)(8676002)(82740400003)(478600001)(316002)(9786002)(6666004)(70206006)(70586007)(47076004)(26005)(2616005)(336012)(107886003)(426003)(2906002)(7696005)(4744005)(86362001)(5660300002)(44832011)(186003)(41533002)(42866002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb10d107-ab50-4916-7294-08d82df3ce8e
X-MS-TrafficTypeDiagnostic: SN6PR02MB5582:
X-Microsoft-Antispam-PRVS: <SN6PR02MB558224B544556DDA86A61747D7790@SN6PR02MB5582.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFlxy1JT7JnI37VlO9TA4Mu9lcS+1bnFKYMS6GQQtpRgBZCo+kqlHDDnWXuwz01/RdeTk4ckM6MWBh3ow+M38JfSMrd1rnpflDULdofefKN4CU06bAc1b8kSFkLLlFH6Zb5Fngqu+wNc9hS3wPuNoDsUVJWrO19y+UeILj+/sbWyCJijVzS6ES2wtuOcCcg+IVN3WQ0FHERmjuIZbsqax91297CR6Praon8oVLU1ir30VxdrYNRxQm9dM2ulUv//zX9d3h6ls0rD5g5dCvvynnkGqrSjFqcp3qKXwAcp51gsGbior7AO0kpc1iVw1iphO6mOE+yz0+q8NnkYOzV/l7bFeE+afIzT3BtMDpmmPPZYNoAWcYUWfjklRZoPenifKXdXWAEQXQxlJ9OMOPTEmFmCgKRuXLGOAFzCbyAeIELslE8UL36cMLZUe3euOkAJ
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 04:00:43.8600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb10d107-ab50-4916-7294-08d82df3ce8e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5582
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Brian Woods <brian.woods@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Finally had time to do a v2.  Changes are in each patch.

Brian Woods (2):
  arm,smmu: switch to using iommu_fwspec functions
  arm,smmu: add support for generic DT bindings

 xen/drivers/passthrough/arm/smmu.c    | 147 ++++++++++++++++++++++++----------
 xen/drivers/passthrough/device_tree.c |  20 +----
 2 files changed, 107 insertions(+), 60 deletions(-)

-- 
2.7.4


