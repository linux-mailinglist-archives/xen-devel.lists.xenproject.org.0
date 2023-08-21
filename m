Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9046782760
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 12:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587508.918897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY2Tc-00019m-W3; Mon, 21 Aug 2023 10:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587508.918897; Mon, 21 Aug 2023 10:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY2Tc-00016r-Sr; Mon, 21 Aug 2023 10:49:40 +0000
Received: by outflank-mailman (input) for mailman id 587508;
 Mon, 21 Aug 2023 10:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sik1=EG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qY2Tb-00016j-N7
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 10:49:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf31319-4010-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 12:49:38 +0200 (CEST)
Received: from DM6PR17CA0005.namprd17.prod.outlook.com (2603:10b6:5:1b3::18)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Mon, 21 Aug 2023 10:49:34 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::4b) by DM6PR17CA0005.outlook.office365.com
 (2603:10b6:5:1b3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.23 via Frontend
 Transport; Mon, 21 Aug 2023 10:49:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Mon, 21 Aug 2023 10:49:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 05:49:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 05:49:33 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 05:49:32 -0500
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
X-Inumbo-ID: 6bf31319-4010-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzzaOBbCjHgcXiooIYhdb7eilEXFv2wFszhrelEv5WLzo2iepEmg3OnDCWBk2WYrW2KZfboWzgN55o19mgiWSPywapVESeMoGKjQ3OCVyHGe6mCWn1Cx8qhxZ9vhvuc5vdGJIchwDNZRjgEGvD3iGNh4cSpTpqvwJS+H4ECc4N+SnZZaITMxfnlQraZFNdIq6pqFvMAQ4XUvbhArVB1JxguxDBn7TBEn+z98qJSLYnhaUqfP7eDWqQvQe5VZxf2f0TigBEmIKyTTaab72jHsTKZfQbKy3xiK+Ee3gODvqqn5vVwwHwwRTG14rrbZrxvTTIplISwlb/3Y/1g7r4/yGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSVLiKcBJDPblZpmJrHNhbojEefU3bY+AgfDCSTk7NE=;
 b=DV6TKfzhQEUDXaVfe6U/P1g0ffJF6rRS12coGwr3N05iK7oQb1aMPlhO8pqB1nIF8SoLTXsvqkUkT7xYSsxDuKEqMbf6M0JUOXHWADts23wEjNdHBGIa7uUj7aUsUm7ZRi0tW2Uqxkkk/w51HE4iizD7w5a5TUJhppCTYpz60sCkr9VC+dJDg8V1rXHdzTihD/akmYFShFVQRFM0/qWfIU/DjnvLzJHRghi2dmTEIjeShn4t3epuh/cH4+w4W4TLKkPK3OvNFAYGJcmgF23ZehCaj6O+Rs4YMtrNJj1ZTc3h07uNlr1jHpNs22tt/NGjlHTvQS/9BzOX0b8BiCbynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSVLiKcBJDPblZpmJrHNhbojEefU3bY+AgfDCSTk7NE=;
 b=QKRFrJRdBbLVrS3zCBHHok92qZpk50TicIXCKsYaEFMph+aqddmFJhgqawrYoXfMffn0c6nqQbeNMYfwRMnkTSB+zsZ5NA3Gp6Kxfoim6jmTSDQeCX+fRa/aJkvUBQ1895YjSl6KePhg8/zwb46G3j/jbmCiZQvq+ixZaYbvueA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6fcbab6a-7126-21ee-e1bc-aa7ba2b07fc0@amd.com>
Date: Mon, 21 Aug 2023 12:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/8] Follow-up static shared memory PART I
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230821040046.2965665-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d61396-d311-4cec-06bd-08dba2344ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dAG3vYwqX5xXLvXzxHv8zcKi2jJSV6lLFFTmqK5R/Fq92a1HX250C+675VIFoUPHf6AHzfbrht7OhPy5rkz6NvISR8l0PVPsBhtgBPymTidKEphVwgQ9JmSimT9/YJtWWkXdjgxWnLSVeGGF4/hl2VXQ1s78EYedd9AuvE9SBLXOeHguqkFA5/vMTGrS6f+paTVq5WJ8IsQx8BJG5nTwlxCa8riAAFcatgf8zKyRvP0k9lDaC2+TRCnKZivdqH2eUYCCreRkDndJObguu3mUvK1Ta6yRZgWgVOgf9g1K4ceslsfaH56krZcZ+vsN057DmAUIFXs9a9gT0D/O2MQmn94rg6uY1BkgophwTt4Vo3RWIBQRAyy2xLv6aRA4JlhousLwCcR1VJvwZTspXOiPxZAHQ8TtZSbQguMoGvCaWg4I7DRjO1ggEHepbyVZ0t7wDgiT058NVbISvN8pv0hojpL1PjBJXHbp9j/3SngjNl0/kmXXy3DsvZOTH+2amlWxHaSV/jHu/Y0EAKSGLgxGYQiIoLvoChkZnBXU6Rd2wSNk+4JkusKSRkyY1ysgpNLkTEks4ESULmh+1aobGtOhuY7U5ny5RhscNXO/7Z6EGFFD/Z0CWbmRtUbJMAFLB0yPFHr7ppAWWhEoWPeoaASRar13Nm3Rys2NRNGq2hcz4PKQVsMMVzjIvaeA4eFh5nuW2FjPSHMMRhuwIR5itkkxfp0G3lNyQkddqrLBvv6oDeFeG3ySO4GlwPkCXKisOAZHpLttroKCuJjWovG1zi6a55DLQcSZ5j+kBzJPL6q7vrF1R0G0ZKfBTsDEXup5AVDvZv4c20ji95J95mW4UeH9Ww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(53546011)(40480700001)(5660300002)(44832011)(336012)(426003)(26005)(86362001)(31686004)(36860700001)(31696002)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(16576012)(54906003)(70586007)(110136005)(966005)(478600001)(82740400003)(356005)(81166007)(6666004)(40460700003)(41300700001)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:49:34.3753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d61396-d311-4cec-06bd-08dba2344ea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351

Hi Penny,

On 21/08/2023 06:00, Penny Zheng wrote:
> 
> 
> There are some unsolving issues on current 4.17 static shared memory
> feature[1], including:
> - In order to avoid keeping growing 'membank', having the shared memory
> info in separate structures is preferred.
> - Missing implementation on having the host address optional in
> "xen,shared-mem" property
> - Removing static shared memory from extended regions
> - Missing reference release on foreign superpage
> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
> 
> All above objects have been divided into two parts to complete. And this
> patch serie is PART I.
> 
> [1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt

It looks like there is a problem with the changes introduced in this series.
The gitlab static shared memory tests failed:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/973985190
No Xen logs meaning the failure occurred before serial console initialization.

Now, I would like to share some observations after playing around with the current static shared mem code today.
1) Static shared memory region is advertised to a domain by creating a child node under reserved-memory.
/reserved-memory is nothing but a way to carve out a region from the normal memory specified in /memory node.
For me, such regions should be described in domain's /memory node as well. This is not the case at the moment
for static shm unlike to other sub-nodes of /reserved-memory (present in host dtb) for which Xen creates separate
/memory nodes.

2) Domain dtb parsing issue with two /reserved-memory nodes present.
In case there is a /reserved-memory node already present in the host dtb, Xen would create yet another /reserved-memory
node for the static shm (to be observed in case of dom0). This is a bug as there can be only one /reserved-memory node.
This leads to an error when dumping with dtc and leads to a shm node not being visible to a domain (guest OS relies on
a presence of a single /reserved-memory node). The issue is because in make_resv_memory_node(), you are not checking if
such node already exists.

I haven't looked closely at this series yet. It might be that these issues are fixed. If not, I would definitely
suggest to fix them in the first place.

~Michal

