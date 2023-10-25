Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746F7D745E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623228.970978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjcK-00048P-Vv; Wed, 25 Oct 2023 19:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623228.970978; Wed, 25 Oct 2023 19:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjcK-000458-SI; Wed, 25 Oct 2023 19:32:36 +0000
Received: by outflank-mailman (input) for mailman id 623228;
 Wed, 25 Oct 2023 19:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lpe5=GH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qvjcJ-00044H-6G
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:32:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee90218-736d-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:32:34 +0200 (CEST)
Received: from MN2PR22CA0017.namprd22.prod.outlook.com (2603:10b6:208:238::22)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 19:32:28 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::37) by MN2PR22CA0017.outlook.office365.com
 (2603:10b6:208:238::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Wed, 25 Oct 2023 19:32:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 19:32:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 14:32:28 -0500
Received: from [172.30.200.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 14:32:27 -0500
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
X-Inumbo-ID: 3ee90218-736d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISAnZKwR3xHGwsFrWJyMY8yxpGWFuMhmC/ZJ3OkotgXExI6A3JRfljSeSCZ59xePdKgUo0bB8tC2sx6PfiJnkdCiSnPe1SMPOaHd3PAUNMIIIJo9wcX/YvhOdXugI/sj1xIuNTqrESsFUyhi5apFP+fU2AP4ZznA+Ib43nDzItxB5XoTn4gKcqfJZ2w7KgriNXC+0qYHFTSZaS+NES2Gpz/1/60g+QiKbBOqlzf2JBpnFyA+qgT1MlMNlMZ0Pifdd31iLM0Of7jEqo21pO+U4r8JLpCEx7n8Ly2+KJUXXZJ2f1sc4RxjYR6bLZ56WRS3L6gz2EALzlZlNYZqGSd8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQm9qLEtiIOT8W5ejlBLBEidgM2aFzVM7WxqrAwHOgo=;
 b=bQAZB5NYsE5IU4qN1RnHlrIRKI3XHxMah4RMyDhcDddCpnjqaDFkpXH5YbKBYeHErRUnj3jjU9lVluMPwuA8V3hhD5YzdGuhjQm9iXWU6dEe+lV218lAH40x9LjfRnuQiwGYYvp2WjFISvxD/rpvIu+gquMjNCSboIQKyl7vYm6NHRTidn9fzYlOXOyDzak4ehRP8d/Bkynsyc726zmndrHrpImdT7sPlKDpNpwgCEhn75qmD/DVnu8leMS7rriGZpdyap/larH3Jcy74WHS9tML3c1HoZKNzcpV4LtAVlVASa/feMBzjah89k37HThDv6l6ilYHfhRsCSOgk2/E1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQm9qLEtiIOT8W5ejlBLBEidgM2aFzVM7WxqrAwHOgo=;
 b=WreXo00gHjnJRo3Z2r//+1CZsjQca8U2PKxgjjaeeAaK8LGy49mz+B+WIQor2L8NY/xJhvGz8kJjDotz01+3zyCRsrNB4vlrEnUltPX9cuj4+WM9uNjDZ/jK62vaDHIcVChszyYfRHp3rxY9ZvrxDXttsrlwjHe2pmv79VPigfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eb2c06fe-6a33-4484-8632-fcf1b26beebe@amd.com>
Date: Wed, 25 Oct 2023 15:32:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/arm: enable vPCI for dom0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-5-stewart.hildebrand@amd.com>
 <6b446a2d-ac23-4cb4-ad6a-1a816b497023@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6b446a2d-ac23-4cb4-ad6a-1a816b497023@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8271ff-52db-45cd-de18-08dbd5911fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFKPd3isR44e8qH5mn77I+I2R7raMt0XBHD6xhQiZJNdicBVWUJgHVFJyS1ivOroOa0rutXFP+6hzRdcjLUBNuoDOMpkvM5xh6+lIU0ddriLG/MwnbFehYBA0oatj4+W/thJZO3EY1FKgmLzcwdkDQTX9EmsRFfmOzAch+E5K7ULLyHS7r3sHDXjc5hKgiiKZ4e+uAGt6LW/BxuOS5BZaPPGh6EWBVPljhRS+0nYJguoQIviOFJyygF6IRYjxaebT1D0EXj9z8QYPnIpY5azQigMRHmwS7SlWeSAbwhHRdF/a1JCsyWmiiQbBHzlZMX2gMXBI2xKNntx1SlxKeA2qQ/lbvls53LlZYv/5Krvtjqwd8mRps8H6nd6GL5nFgqdHkq/hD4X5bsMVJh01V5yGu8S24uPkL4NWlP4Kh6bSWaJefD9iAQalGb123FmPZGg3+56mDMpnZnHBBeJCk9TYfBuMs7eSAtKM69WUCiz2t6UsHCWBG4sQhIeWTcIVCW8RfWRWUtfRbAdafmR2yQ24o+dm/H5Kbmd8rGSVz4JCZ+bOpRXFK7W8XzkRAAmYi52pV38Yty/yZpoQsIFvyZLNno/Q517oqFlluIY5DZ53Is6/DuhM1fXeYQokqBuqtH0RXEyX0FycsqZNq/oIyWrt/E41+gkSl1HOKHxzLM8xJlSGS5zErOkaOfRDQUU+cE0yBbJhLeevVPIHQdJODW5uBTbMr7dOZvks4X3JDCMf7YUlJzvyoTBZMD1ItYETmehSJGjchbIYzliMWwzGFeI05+YXwHXWXclbOBlP8jEH/vToWvg3oCdQ6tgvJFDN5TX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(54906003)(8936002)(5660300002)(70206006)(70586007)(110136005)(16576012)(41300700001)(86362001)(478600001)(31696002)(316002)(8676002)(36756003)(4326008)(53546011)(44832011)(81166007)(2906002)(36860700001)(426003)(356005)(2616005)(336012)(26005)(47076005)(83380400001)(82740400003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 19:32:28.4327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8271ff-52db-45cd-de18-08dbd5911fdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

On 10/20/23 13:33, Julien Grall wrote:
> Hi Stewart,
> 
> On 09/10/2023 20:57, Stewart Hildebrand wrote:
>> Set the pci flags in xen_arch_domainconfig to enable vPCI for dom0.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Julien had a suggestion to make this conditional on pci_passthrough_enabled [1].
>> However, in v5 of the PCI ARM SMMU series [2], we propose removing the
>> pci_passthrough_enabled flag. If pci_passthrough_enabled is gone, the conditions
>> under which vPCI should be enabled for dom0 aren't entirely clear to me (other
>> than CONFIG_HAS_VPCI=y).
> 
> I think it should be based on whether Xen detected a PCI hostbridge in
> system. I haven't looked which variable/function could be used in Xen
> for this purpose.

We can slightly tweak pci_host_iterate_bridges_and_count() and use that.
Also, a full revert of the pci_passthrough_enabled flag over in the SMMU series probably wasn't the best approach, so I'll add pci_passthrough_enabled into the mix too.

> 
> Cheers,
> 
> -- 
> Julien Grall

