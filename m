Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46621509E51
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 13:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310054.526677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUjX-0006qN-MU; Thu, 21 Apr 2022 11:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310054.526677; Thu, 21 Apr 2022 11:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUjX-0006mn-If; Thu, 21 Apr 2022 11:12:23 +0000
Received: by outflank-mailman (input) for mailman id 310054;
 Thu, 21 Apr 2022 11:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CjG=U7=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nhUjV-0006Gl-So
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 11:12:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe59::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8727001-c163-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 13:12:19 +0200 (CEST)
Received: from SA0PR11CA0012.namprd11.prod.outlook.com (2603:10b6:806:d3::17)
 by DM6PR02MB5244.namprd02.prod.outlook.com (2603:10b6:5:48::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 11:12:16 +0000
Received: from SN1NAM02FT0023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::71) by SA0PR11CA0012.outlook.office365.com
 (2603:10b6:806:d3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Thu, 21 Apr 2022 11:12:16 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0023.mail.protection.outlook.com (10.97.4.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 11:12:16 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Apr 2022 12:12:15 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Apr 2022 12:12:14 +0100
Received: from [10.71.119.153] (port=55901)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nhUjO-0002gU-SQ; Thu, 21 Apr 2022 12:12:14 +0100
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
X-Inumbo-ID: e8727001-c163-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpdknWLIhQ+uQuDGKtIoEprSMA0lEil3zC3eLjonucVVO2/AWreKejSgbvQEz+QPh4sFCv3VAX0/EU7RTDENn4FHgPjBrNYrpYECNAaoQUKuU3HKrD40mtEtjdx5tr7WoEVH4Yv6r6twAJhivIUSc+/fHnsL21X/XP61QKX3AzJROQXHfnUbKZNdT7lVf1NRkO2rsHSgf2rO7vi4KT+7fxPksTibHhnQiEc101INzxeBZYHjFYsmoam+QehjoKloqVvseMJLkJLeIkqLDMNBmHp5P/PkcDS16kK03YHTWSM/3rtgr22A2G9dm7Or229WTVr2UXvZ5CZTQ2D+1ZqiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayjYtlWkn1QhSNk4ar55+UT61YtxMb725DAP9tz1D/M=;
 b=lGQ++RfIUcJrgWYnKrjYNjLEkWz7IatiKwlNVDRUOb700m9tnN7OMef+ur5GPil8QLBuJY94Je5jouBMK59U2JqhX/SyxrTxsCXQwV3gziY6f3kREYdb8DAulxm55XgHo7pi0oczl2+LLZAK281SQ4FjQ041SeDEpJemeCqr0P6Tww0IvoDkzlsg9rwewt518v55g4KR1MS8S+POjlIum8tnEkF9IFkZ/PtoFxvArsoqEqwiLx0ceZ4GGIOX/Cw4cuAD8HUlgyWlBcDSJqvT4AGit6UCeMecSRACU9j0SUIS7aTqyjS4P8DUNvpN+YmuO7/hjCB3wyTmmpVbdyHPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayjYtlWkn1QhSNk4ar55+UT61YtxMb725DAP9tz1D/M=;
 b=LTarhVGy0IzdUUYXDjtQP6p66EOv2YDiFqkNdDWds/SzXrmvHqkUBC+NoA07YBhyaP/zVMEgqoN+pEvapFjX1c5OKFp39CFPERYnhbmi2ciObftYQUxMzvmVgs2E2rVgocLO7f7p7YDwl7NEMS628yCP2hYWRN/l6AF9AW5OS64=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
Date: Thu, 21 Apr 2022 12:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Rahul Singh <rahul.singh@arm.com>, ", Bertrand Marquis"
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, ", Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Subject: Need help to debug Arm SMMU issue seen on guests with passthrough
 devices
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d42424-42b1-490a-c3c6-08da2387cb67
X-MS-TrafficTypeDiagnostic: DM6PR02MB5244:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB5244E9DAFD0C896A03A9CA50B2F49@DM6PR02MB5244.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dzpZGy228nYtOL9kIMVHgwwCkI8/Y87KGWIeRnar7IbfACEG2I6MwZA3B4yDHEYfvzWmjd6B1p4XaoHbWRR8K8lWowrZlr7RSNz/pZaDXmgLrAjAv/GqORvIiq9A54WYkIpUv/bfs520lgVG1y1JhOpm309n3HQj0nd89/GZ9Iid2iQiUAAc5Pn4xj6kKBvPzIsI7TOhHXiLpKYN5VXwCml39vCrp4v0QGEFkOULnhr1E62IEQmyuYcfrdoIJUOq+ovnfbH5IeYlBaGf3aKNneqe6kOv/u3v5GeEsWWffgS7OXJ+0Z8BHdxRj8lwWtxAM9BItWj6uSxtYkwiNwx3orn+Ix6mH7+KonWZP2Ie8ZlHcbx5u/5lCgmz+h7Lcgg2Um3ylHMYFIj8g9pQtB2TCJHp91pw+q923yjGiSj3KptoFZHOrVdoBlDerL6cQP08CRi5FCZJVvjr4e+a+VUfeTOIBU0TMVdEVnLpHwBKrB+9T6A3+WWlJGj2kONkzDECnFGauLTI3YRXmHoIcDOKXcfNpKFb5MRgvBc2Y9fs03hN4zU1mMcaO6WhlplOMR6FO9qKM6fvjPX27WeB3CjAjClWZhP7XuxMvvutBb1mQ34m7GnDthc8rW7WQYoNl/XELZ4Q7lH3nToF9FHIo/r03Py5nGab3liOc5Davu2YeqAHsRolpFLvgdzADFXnIWMoHsBWTY7fpq7s3eGQIy4NUDYdAhH7TnkV9urgXchuqGA=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8936002)(82310400005)(5660300002)(9786002)(2906002)(36860700001)(31696002)(26005)(31686004)(4744005)(70206006)(70586007)(7636003)(4326008)(8676002)(356005)(47076005)(336012)(186003)(2616005)(426003)(316002)(110136005)(508600001)(40460700003)(83380400001)(36756003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 11:12:16.3666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d42424-42b1-490a-c3c6-08da2387cb67
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5244

Hi Arm/SMMU experts,

Scenario :- I am trying to assign a device (eg mmc) to a guest which 
uses smmu. I start the guest using "xl create -c ...". It works fine for 
the first time. I am able to access the device.

Now, when I destroy the guest and create again, I see this issue

(XEN) smmu: /axi/smmu@fd800000:         GFSR 0x00000002, GFSYNR0 
0x00000000, GFSYNR1 0x00000871, GFSYNR2 0x00000000

0x871 is the stream id used by mmc.

We are using SMMU-500. So from the Arm SMMU v2 specs, it is 
"Unidentified stream fault" for stream id "0x871".

This issue is seen regardless we use 'mmu-masters' or 'iommus' property 
in xen device tree.

I can confirm that this issue was not seen in xen-4.14.3. It is seen in 
our (Xilinx's) latest release ie xen-4.16.1.

I am using our downstream fork of Xen. I can't readily use the upstream 
as we use lot of EEMI codebase.


Can someone try to see if this issue exists in the latest upstream Xen ?

Any pointers on how to debug this further ?

Kind regards,

Ayan






