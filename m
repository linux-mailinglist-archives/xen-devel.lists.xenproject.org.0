Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754FC4AA19F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 22:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265795.459341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG5rw-0006Ga-JT; Fri, 04 Feb 2022 21:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265795.459341; Fri, 04 Feb 2022 21:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG5rw-0006DJ-FV; Fri, 04 Feb 2022 21:11:48 +0000
Received: by outflank-mailman (input) for mailman id 265795;
 Fri, 04 Feb 2022 21:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6K1X=ST=xilinx.com=stefanos@srs-se1.protection.inumbo.net>)
 id 1nG5ru-0006Ct-DA
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 21:11:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe59::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bfc378f-85ff-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 22:11:44 +0100 (CET)
Received: from BN9PR03CA0852.namprd03.prod.outlook.com (2603:10b6:408:13d::17)
 by CH0PR02MB7881.namprd02.prod.outlook.com (2603:10b6:610:ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 21:11:38 +0000
Received: from BN1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::68) by BN9PR03CA0852.outlook.office365.com
 (2603:10b6:408:13d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 4 Feb 2022 21:11:38 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT044.mail.protection.outlook.com (10.13.2.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Fri, 4 Feb 2022 21:11:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 4 Feb 2022 13:11:37 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 4 Feb 2022 13:11:37 -0800
Received: from [10.23.122.228] (port=52490 helo=ubuntu-20.04.2-arm64.shared)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1nG5rl-000H0f-H4; Fri, 04 Feb 2022 13:11:37 -0800
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
X-Inumbo-ID: 0bfc378f-85ff-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axUw5Lv6ohylH+zcN+33MWvQtd4+Firg7qYDkA57iIQZKn2XXK0WKDl0elAp5GTMmHUohTwt29kozU5R+w7tLI3R9+GxP3sZss42w5ImoiPGGfz78ARbaZbHFRiaomSnkEZhhvm4+HxvyxCGGdHMEFHOy/16l4d9AxJcyF9yoieQlWVt6Iu9+ZBBiD264JYH17J5wQs0AemOg5lqiTFBCXcpHwfDUksDMNpTFa7C921bods4y+H6nl6klHPX4yiLiJt+dKK0E6kAaBAoC2Ib8PdoHOWWPCmrLW4j/EW9rWIuGNlYgmNKk6cFIxZDINDqo3A44r8h7JVxzTkU/4vSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8to3lxzFcc9fGY7nC5OQK6nQEmZeZxr61EA19JNvnXM=;
 b=BuPZ8qyMglmDKO0LQy7uo7ITruXD0DKQ1rYyx3n0jIOPuSAlmRY5XeaX4jmIQgGOYAMWMEukrDQa2YlsrAicHFRR7ZEc1ew834VlmTvNOxsLXEF0AkNDk5ZQf7N8+ib+wV2SUdYXWGJzQUha3sNekKzSxoaYzox3Q18pnOKalzodLHxOTT1z0ct08y4ltF0xGF7Sb88ZuiL+FWZSZsgiiLfGHzHSr8KNj597FTkeyP/r8HtiQwBuyYMXIWhxFNDLkTrTkfE3TvrJD114cUnmqmaLtpKk6IV7p9JKftQHT8n6qD3DyCkjgyg/f4iEAY2uQlc7pC6/z754jqiTfLziWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=walle.cc smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8to3lxzFcc9fGY7nC5OQK6nQEmZeZxr61EA19JNvnXM=;
 b=nTtIeUJEY71VtLL8ciiAAUFKu8n0YtlxEcOPzjfRzotrwe+B2r00aC4vJtCiOIas+P3hc5I8Dd9LPHz86jxjNCAtt7R7UgGIrNzQlgjDVO5iCk4wKdYtpqx+mk8FlGrl4qx+tLVk1mYgc984QXKpzMYAJMyuEL9nB4uO4G2klL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Fri, 4 Feb 2022 13:11:37 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michael Walle <michael@walle.cc>
CC: <stefano.stabellini@xilinx.com>, <Bertrand.Marquis@arm.com>,
	<Zhiqiang.Hou@nxp.com>, <brucea@xilinx.com>, <cornelia.bruelhart@zal.aero>,
	<julien@xen.org>, <leo.krueger@zal.aero>, <oleksandr_andrushchenko@epam.com>,
	<peng.fan@nxp.com>, <xen-devel@lists.xenproject.org>
Subject: Re: Xen data from meta-virtualization layer
In-Reply-To: <20220204135814.1033356-1-michael@walle.cc>
Message-ID: <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s> <20220204135814.1033356-1-michael@walle.cc>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edc270d0-b2dc-4dc8-3629-08d9e822eea9
X-MS-TrafficTypeDiagnostic: CH0PR02MB7881:EE_
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB788111846CC217013F053636A0299@CH0PR02MB7881.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WNda5XoKS7m6Czcx2R0udCs+4hwyUke1Fyw5uzyWah2OtGNiA/keYFBlgW+WeBsfd5iCxfJl4W9jE91QbyzzoISQUM81cr32wD2smpubC33eE8kG01HNdSi/qb2Tq8t5tZVbThw1QwYAvLPL20bqGi/SfsR1eC7K11xIOPpXWyXnf2NzSEsptac3m9vY8eZ2ryW3XCJK1r4fokTmNISzYcUScfj/WgeYSDDKNm0SX6Pd2oSdxv2ip4+59pd/zh2ZpsDE2adBspAc4xjLPJyGr5/NtKtnNEPWeSMwcHtP/7WWmOI+Os57AdVIhyaoV6kecVADuRCNNo2yNdEU70YDzgkAJD9zb/VkWfhYvsFIaTDDeR8x87HLZM0dV9TqdUjSLO5DjxSEhKYn0IH89weBqf54fmgQOjkxmOF7vr8TW5AFAJZlS4vnZhhaqmKoFsrpL29NXPvNvHEHLLKTrnUhSfNpJb4Fc24JV+/wrbmsRNe8WX0oq+oQL691APa8zlofoM+4hN8cHMyqXc65FIZEDUdhHgLh6Wwf1YsznAjqlIhiIN6amgiXUz0f7ZJv46ssoJ7MaCJk7DQU15YTCVOy9eN9eGCykcGDGTqDPeEdXZDzsv742zchQnhv2om9Z3YXSOkRIG8UMg/x/f1xSIwV+g==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(7916004)(46966006)(36840700001)(5660300002)(70206006)(2906002)(47076005)(44832011)(9686003)(36860700001)(508600001)(336012)(426003)(82310400004)(186003)(26005)(33716001)(316002)(8936002)(4326008)(356005)(6916009)(9786002)(7636003)(54906003)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 21:11:37.8828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc270d0-b2dc-4dc8-3629-08d9e822eea9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7881

On Fri, 4 Feb 2022, Michael Walle wrote:
> > In regards to the reserved-memory regions, maybe we are not seeing them
> > because Leo posted the host device tree, not the one passed at runtime
> > from u-boot to Linux?
> > 
> > If so, Leo, could you please boot Linux on native (no Xen) and get the
> > device tree from there at runtime using dtc -I fs -O dts
> > /proc/device-tree ?
> > 
> > 
> > However, the name of the reserved-memory region created by u-boot seems
> > to be "lpi_rd_table". I cannot find any mentions of lpi_rd_table in the
> > Linux kernel tree either.
> > 
> > Zhiqiang, Leo is trying to boot Xen on sAL28. Linux booting on Xen
> > throws errors in regards to GIC/ITS initialization. On other hardware
> > Xen can use and virtualize GICv3 and ITS just fine. Could you please
> > explain what is different about sAL28 and how Xen/Linux is expected to
> > use the lpi_rd_table reserved-memory region?
> 
> I actually stumbled across this thread after trying out Xen myself. I'm
> using lastest vanilla u-boot (with pending PSCI patches), vanilla kernel
> and vanilla Xen.
> 
> So far I've discovered, that xen complains that it cannot route IRQ64 to
> dom0. That is because on the LS1028A there is a dual UART (two 16550
> with one shared interrupt) and xen takes the first UART and then tries
> to map the interrupt of the second UART to linux. For now, I don't know
> how this is solved correctly. As a quick hack, I removed the second uart
> node from the device tree.

This is an interesting problem. Removing the second UART is a good
workaround for now as there is no obvious solution I think.


> But what is more severe is that the iommu isn't set up correctly. I'm
> getting the following faults:
> 
> (XEN) smmu: /soc/iommu@5000000: Unexpected global fault, this could be serious
> (XEN) smmu: /soc/iommu@5000000: 	GFSR 0x80000002, GFSYNR0 0x00000000, GFSYNR1 0x0000042a, GFSYNR2 0x00000000
> 
> If I decode it correctly, the streamid should be 0x2a which would be one
> of the PCI devices on the internal root complex. Probably the network
> card.

Yes there is DMA transaction with an "unknown" StreamID. I think the
StreamID is 0x42a. It means that there is a DMA master on the board with
StreamID 0x42a that is either:

- not described in device tree
- described in device tree with a different StreamID
- the right StreamID is described device tree, but it is not picked up
  by Xen


> This is the first developer experience with Xen, so please bear with me
> :) It seems that Xen doesn't add the master to the IOMMU. To me it seems
> that only devices with a 'iommus' dt property are added. But in case of
> PCI devices the parent only has a iommu-map property.
> 
> And it makes me wonder why Leo has an almost working setup. Maybe I'm
> missing some patches though.

Xen 4.16 is able to parse StreamID in the "iommus" property and also
"mmu-masters" property. But It is not able to parse the "iommu-map"
property yet. So if 0x42a is described in device tree using "iommu-map"
then the error makes sense.

A simple solution is to replace iommu-map with iommus in device tree.
It is possible that someone in CC to this email might already have a
patch to introduce parsing of iommu-map in Xen.

