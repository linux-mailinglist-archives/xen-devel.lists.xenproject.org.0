Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9950A613
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 18:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310351.527155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZvC-0004st-JA; Thu, 21 Apr 2022 16:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310351.527155; Thu, 21 Apr 2022 16:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZvC-0004pQ-EP; Thu, 21 Apr 2022 16:44:46 +0000
Received: by outflank-mailman (input) for mailman id 310351;
 Thu, 21 Apr 2022 16:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CjG=U7=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nhZvA-0004pI-Ky
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 16:44:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573eba30-c192-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 18:44:42 +0200 (CEST)
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by MN2PR02MB6864.namprd02.prod.outlook.com (2603:10b6:208:1d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 16:44:39 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::b4) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 21 Apr 2022 16:44:39 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 16:44:38 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Apr 2022 17:44:37 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Apr 2022 17:44:37 +0100
Received: from [10.71.116.47] (port=17504)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nhZv2-0003Qq-PW; Thu, 21 Apr 2022 17:44:37 +0100
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
X-Inumbo-ID: 573eba30-c192-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhQGjpNHdBbNN5KSYzMhU9PvZ3pSzB6f7NT/ky+at45uzUmkHRrKowThQC0X9515FnxVcDLIRYW5DJbhGSkxm3WsjiSEWaGzsiGqsSAe2u+n66Ec/UcHBis7m8Tynde6P7vnPmwRpWyts2SGTFZ5wyVlGcF/Gono+0cOOt2IDmpYhCzcBPixyHuKZzRQ6N0GtUCWbtucpFM9DN3CeCZEaItvk0PFHrZLjdZDYBL6cbOeWptarJYLXN5I06OnvE5m0FHxiYQ5yC6WtmWgDoyEdCDQI1NgRYvRWFwImSEILBY1r8HbDGdAgIz4ZN4B2gFgaoRcHRPgF0GuguShH5+zoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rc/q4B2PL62CdSpzDBHeQ51IVQxGPHtDCltT2xqS1Y=;
 b=caOZE1C75sS7OoUkJBcHP+ZYAK+fq8JV/NcRpMzWZ9SLrdX0PoVsOII5w69scQXWPHEKD73tD8hOO6n6N3/pxD4vMd+seiwquO1Bn83qW/CiYdcbJdsyvLpQyOVU5xXIe4pysYUGmSf/safHfcgeQ6L/oebJxcJPL2YbeupTzzq+HN6bDMfbtpZOZfQ+xqTCKC+bn9dic1jwHkSSR9ckGqEz3GXfHyor18Yc4HoFhbNx5ENFnKLUPbNhTdhBvBqYFbSOik6PQLj0gAKkDiwvhxEYpL9KxtrC0MSWFgnZapLGnD+STc2g1VgEPzibVhkLeX5+rWo6v/s1MsgSwmAzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rc/q4B2PL62CdSpzDBHeQ51IVQxGPHtDCltT2xqS1Y=;
 b=kST1HjKFZ7JxEWdRDw/GYOkUCKKfTymSqcVX8Hhu0fjCTK0XY7hi6TmaysR72hI/sHCzXN4fuZhRTf/BDx0EuVQKohWCyzBRADhVFkCgN0QXnYlGF3MO7/Avz6F36Yb2EDnkNGbkBqm1K2A/xZ8KL5ZfxqN4cGUwLunBLze8rHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <f1a12f24-cc41-e731-b711-c1bd8e5cbfba@xilinx.com>
Date: Thu, 21 Apr 2022 17:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: Need help to debug Arm SMMU issue seen on guests with passthrough
 devices
To: Rahul Singh <Rahul.Singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <022fb545-9295-1f10-6caa-01813cf0a646@xilinx.com>
 <98FE5BFF-4201-49F1-9F17-42E26FBE3FAF@arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <98FE5BFF-4201-49F1-9F17-42E26FBE3FAF@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771c8053-03fa-4b9f-458a-08da23b63a03
X-MS-TrafficTypeDiagnostic: MN2PR02MB6864:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6864D6C76C689790866E9D76B2F49@MN2PR02MB6864.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6puBU5Pw58p/1F14uIRdAMdacmExePaFWHT1pnen7q/tcmIlug05ZiDIxBE5/Nb/TiKlUHURlF5GqvS09TO/4WMcFNgtxinlYXQNjRp3fQ3soGySutJ4fg3jkAh6TekoreCOpyPJHv81RM43RyrZ2g1VAPHEARHKeDHG72iR30NW3G6Nfy7RhDf/TqyiUIC7YuDzVO7/uAuqtVpxqTZGlOsZVb0RUbhIEe2+QOIRfrd5YS3qLtHW8htyYq2W14TIIIHbJrVaWcDr5aBPVMOBEw4DA49htFUWXEYsz+nigqY9tt5mv2PHFBm26pMkKuGiFV8kpaeLCB6XiFW1ZOXNLNgBtqj2TF0nyCZhRWTu0e0CgFeXUyOYdx7KsipzvX4J9XM6PMMzmlzeQa2Z6HLiTStfiSd3Hd3mmIHA3eTO6MqonFUMtsdvgMOB81lXwtla5j4Hgaz44z8Bx+7OYkZTn8qDLbuPLu3VQ4W6DfjbsHzKPD4D358H3hSaTazuUIZaSUnd4ipYzlHk9Lo3QJ6ykw5kVyoQYa+DyIHHU2/YDOO1WkjJfi9LDOH1/MJkuTUyEBkcYFz9WcPR3P6zCSKDxV7kqqc3y7jgNdmldQECDf9ipPSYaDUCHyriXz35+QsEgLC+Y4Wse3rwM54p4aePTSHATBXnYlRvnODDLeB6S21lH4GqybeIiJjoSSexOXi8AyFjF6ETpkhGbjbf4BM7jwUO945LV77l0sToIyXCtI=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(426003)(336012)(47076005)(54906003)(110136005)(4326008)(8676002)(70206006)(70586007)(2616005)(31686004)(26005)(36756003)(83380400001)(53546011)(356005)(7636003)(40460700003)(82310400005)(36860700001)(31696002)(2906002)(9786002)(8936002)(316002)(5660300002)(508600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:44:38.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771c8053-03fa-4b9f-458a-08da23b63a03
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6864

Hi Rahul,

On 21/04/2022 14:21, Rahul Singh wrote:
> Hi Ayan,
>
> > On 21 Apr 2022, at 12:12 pm, Ayan Kumar Halder 
> <ayan.kumar.halder@xilinx.com> wrote:
> >
> > Hi Arm/SMMU experts,
> >
> > Scenario :- I am trying to assign a device (eg mmc) to a guest which 
> uses smmu. I start the guest using "xl create -c ...". It works fine 
> for the first time. I am able to access the device.
> >
> > Now, when I destroy the guest and create again, I see this issue
>
> Did you observe any other Xen error while deassigning and assigning 
> the device ?
> >
> > (XEN) smmu: /axi/smmu@fd800000:         GFSR 0x00000002, GFSYNR0 
> 0x00000000, GFSYNR1 0x00000871, GFSYNR2 0x00000000
> >
> > 0x871 is the stream id used by mmc.
> >
> > We are using SMMU-500. So from the Arm SMMU v2 specs, it is 
> "Unidentified stream fault" for stream id "0x871".
>
> Yes, you are right above error means that Unidentified stream fault. 
> That means SMMU hardware is not set up for streamId 0x0000087
> I just try to go through the SMMU code and observe that this issue may 
> be related to iommu group but I am not maybe I am wrong.
> I just created the patch that is not tested. Please try to apply the 
> patch and test it once.

Many thanks for looking into this. With your patch, the issue is resolved.

Are you going to send out this patch for review ? You can add my 
"Tested-by" tag.

- Ayan

>
>
>
> Regards,
> Rahul
>

