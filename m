Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE879C5CAC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 17:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834767.1250598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtKO-0008WG-GT; Tue, 12 Nov 2024 16:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834767.1250598; Tue, 12 Nov 2024 16:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAtKO-0008Ts-DN; Tue, 12 Nov 2024 16:01:16 +0000
Received: by outflank-mailman (input) for mailman id 834767;
 Tue, 12 Nov 2024 16:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0y=SH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAtKM-0008Th-Q3
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 16:01:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2414::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 519f8017-a10f-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 17:01:04 +0100 (CET)
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 16:01:01 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::de) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Tue, 12 Nov 2024 16:01:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 16:01:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 10:01:00 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 10:00:59 -0600
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
X-Inumbo-ID: 519f8017-a10f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjA0IiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjUxOWY4MDE3LWExMGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDI3MjY0LjkwNzA3LCJzZW5kZXIiOiJzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1B4aNqD++eRWkPQjPyac+6m6fvrVNusrFdFdvCSbvFNd/TGvd/qViSE6HT9vXU+0r1j7sINIBPWQWfOtC0ZJr3cE0pf10qLZWqX+Dt9WVycQOs7wpuKxaE70WN0T/FG32renFahBD6A+IC5yx1rHhidNgG1UYf1LXNBDLmQGNlGvfoKETYeX8JslCBLWtt1fsOEoDV6MxvGlQRuMFe6cB0E/8ukns1DDpgCuRmLpBRJcXqlMVaWR+XfMpQeZ9NPROCDbm6xrAlfv7I8imDYG59LILXpx/AVeN/CoinW26w0pon9h7iGT16f18XqmW2m0IeakABmbpTgwd/xs7p/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTZLk1iieylWAST39twh0thxYLbnNl8fkf/YLFcoGEg=;
 b=qddeETldBE0o8Ckj4eoaL4dBUolJ6/Bxpd92Wgr7he7Z0lD3NG4VyxeOwVpYn9HkaXDB/z67DM7mmr0OMnNsComsw4YTRaMWCAMAHWJMISG5ul3om25K/V/dlR2AImUjhXFgpPg7QYqn5bFH0Y5+vIxVt9lu8KnT/xMfPslFFo784yF11l5tKajxrtVx+vh0eliz45PoVJp6CMto5SK42Huf6aKvM5FyWgOdKQSFFDb47rW5LUNZyNB9erVXy4EsaJaK7ac8kfbkC+XkQ49FNbc0dp9qJk/NEYHi/avhqD7wGa0HpDVVoMHwQ/TO6eQq89FyvRkhhifNw2NumZUEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTZLk1iieylWAST39twh0thxYLbnNl8fkf/YLFcoGEg=;
 b=G2r2Op50BsSP/YBo3UftrPBYzQLm3t/MJl/bcSSrPXOMG5NfZ5Kr23WwJ7dWg44jeC9TjRKGyzyY4EFYWXCvesmoGYDvE5Jn3zzV/fE7bLnlQgT6EOTqFooh6Wjj2NQHbd+xMrGcRCxt8ZAVmi3OMgpNogpZmSEORqnaoUJ2GjY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com>
Date: Tue, 12 Nov 2024 11:00:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>, Anthony PERARD
	<anthony.perard@vates.tech>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf168d0-fa4a-4689-1e70-08dd03333423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NQVU9wUm94VlcxVlhmZ0xnNERSZ1dTdDR2TWs5bXJBSjZ1QzQ0OVNqMmJt?=
 =?utf-8?B?VWt1ZDBiWitlakFrb0lPOW5WaVBLQVFqRDhmNmFNTXFPQ3ZiNmNuVG0wdjRy?=
 =?utf-8?B?aXh6Zk16UGJTRUsyVHNhNVZGc2VZMnJ3cXZWck5Lak9RM0xHL2d4RWQ5WnJC?=
 =?utf-8?B?UEtsN0VtTHJKYm84MUh4QnEwNExtR3o4S2tSL3liUU9LS1ZsOXlWYzlWSXZY?=
 =?utf-8?B?cDEzNjQ4TUVrczZuWlg1RGtQa21IUW8vTGl1elRoU3lJTVRjODhnRlVqVEJn?=
 =?utf-8?B?ZmNMYnZ1anpWZnI0QWlwVzZxUC9oS3JUV05PeFpIVThTNGFSR3BLWWtXbEJk?=
 =?utf-8?B?bEVGRlJOVkZ5NzlCRnd0Q3pQYkFpd3d4dzRtcUtRUWtkdjJGZDBxNjR1MTZt?=
 =?utf-8?B?SU4va1ZtQk1yYk9zVGVMOVR3ZURDeHlxeXJaMzJhdmlrM0lKTDU0UTFyWGth?=
 =?utf-8?B?YjZvNVlsWDBzRFVJdUEwNkltYzZxSVpDaFNwSTgrV25XOC9VSUNoc0xzSFVC?=
 =?utf-8?B?eFU1RjByMkZyN2tmUW9BRGRDdm54a1hMbmpMV1BaZHhuR2wvdkJnQko5MUtL?=
 =?utf-8?B?eEZCaTlNdWFaRDhkRjAzZVQ0N1BHbVBjQjVRb2grUlk3dnVQS2dpQXBGV0pl?=
 =?utf-8?B?cjQyTWo4OUVnUzlMMncxL1VISklXc3AzWUNYVElOK0RHTGxITE1BNDAyWVNj?=
 =?utf-8?B?UUFMOTcrRjhCZWhPOXUrR3UzaUszRDVKa1RDcmVqTkQ2SHZSWmxKa2xwY3N5?=
 =?utf-8?B?aFp1a28wUjlrTE5xRUdXd1RjQzVIcFJTZVhmVU0xYzJtbXduRTJyMWVCOWxN?=
 =?utf-8?B?VGptdDhEMjVGd3BpcHRLTFhDZGRKRlFuTTcxekZXUGkzeDZ6MzhydG9zUmx2?=
 =?utf-8?B?VGk1Q1FZanZ3UWtTUmEwWEhJSXBHay9zYXozT2VROTBweDJqb0VjUlZ3NUtL?=
 =?utf-8?B?QlZ5N2hQdVk0NVpiUEtiS1BpV1FPbDVkazBGblZtQ3ZLNWxVUUhTRWZGMmUv?=
 =?utf-8?B?V3pwRzA0Q3BWNTR0Mm01VWhsYStvT2tpVjZVRTlwa1h5dmFERzI0RCtzRWtO?=
 =?utf-8?B?eGlSMjF5MitlVVNVUEJBTzc0MEg0MlY2SHpoMm1FRnV0eGExbjFzWVlGWUxL?=
 =?utf-8?B?RlFuQXlVSE5jYlN3bFNmc2lESm05QUhSLzhQUjBwR1VzeTJiT2ZlRUoyQlR2?=
 =?utf-8?B?UUtIMS9hWUlhaVc3UnBlaHNyYXZuQ25XbktEaWVXd3oveGs4aE5CQlVGVHNL?=
 =?utf-8?B?Sm1sRXNXK09uU0NCT3JqdFdzREM5dFNUVnJFelIxeGFhcTRTSCtrdlo3VFJR?=
 =?utf-8?B?SUpycGY3L0xFdGhmOWNFSHdHdG0wRmxVVXZMOGpZb2FzVUJsS3B2cUxGR05K?=
 =?utf-8?B?akQ3V2NjZC94YkUzcWN5bEp5USt0ZkVkbkMrVlVST0l2bGdtQzNZTnpSeGNt?=
 =?utf-8?B?M2s3S05RaFZqYVFHRDRWMjVyb1hZdFNxeWdtS0pobktZQjN3N1RPR1Z6c1U5?=
 =?utf-8?B?UWZSUlFXWGtUMWdpamJPZW1PVm1QeXg0azNqWlhDYlowTzcyLzdqSUk1NnRD?=
 =?utf-8?B?Vml1KzRJaUJBbDJkQUhra3Z4bnhFTElFUk90MzFzc1lWenJ3QzhXdnFSOVdD?=
 =?utf-8?B?SFJaWnZFZzJIVVQrVkU4NFQxU1BZeHFxZXY3MUhkWTJGT2ZaSFljSU00eTJK?=
 =?utf-8?B?Q1FoM2pCL1NFemhUWlgrWWpGUUNLUkh3YTVTUzFYY1Z3YmxnUEVLSnVTQldj?=
 =?utf-8?B?MVdGR1c5RHVPd3g1ajF6aEpLYUZ5Wms2RmtGdy9TeGtjR2wvcGdRSW5iYy9a?=
 =?utf-8?B?S1pteDJhNmUzZ0thdmo4UG5OUHFnY1BvUGhKYW1SUm5GRlRwcmtLNEN5SEZC?=
 =?utf-8?B?V2M4MVpmODZwMmJwNS9HdTUzbDRKTnlJZ040a2x0TitwTGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 16:01:00.8629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf168d0-fa4a-4689-1e70-08dd03333423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121

On 11/12/24 08:00, Jan Beulich wrote:
> All,
> 
> the release is due by the end of the month. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant.
> 
> Advance notice: 4.18.4 ought to follow about two weeks later.
> 
> Jan
> 

Looking for Julien's input on this one:

35c64c3dce01 ("xen/arm64: entry: Actually skip do_trap_*() when an SError is triggered")

As mentioned in the post-commit notes [0] it's a candidate for backport.

[0] https://lore.kernel.org/xen-devel/20240806124815.53492-1-julien@xen.org/

