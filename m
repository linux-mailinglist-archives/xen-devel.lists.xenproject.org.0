Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550E97BDC5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 16:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800309.1210251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqvOy-0007Tb-VG; Wed, 18 Sep 2024 14:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800309.1210251; Wed, 18 Sep 2024 14:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqvOy-0007RQ-SK; Wed, 18 Sep 2024 14:11:28 +0000
Received: by outflank-mailman (input) for mailman id 800309;
 Wed, 18 Sep 2024 14:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQyG=QQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sqvOx-0007RK-CL
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 14:11:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2cd5e4b-75c7-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 16:11:24 +0200 (CEST)
Received: from PH7P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::25)
 by MW4PR12MB5641.namprd12.prod.outlook.com (2603:10b6:303:186::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 14:11:15 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::52) by PH7P221CA0033.outlook.office365.com
 (2603:10b6:510:33c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 14:11:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 14:11:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 09:11:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 09:11:14 -0500
Received: from [172.31.119.228] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Sep 2024 09:11:13 -0500
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
X-Inumbo-ID: e2cd5e4b-75c7-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yatGcyxwIVcjGqktsGAp/tAFaHQq5fzEz98P1W6czr+uFwdaMv1W/UX9KM2eU2YEB2HzqJPgHdziSI8/uWcIdPMzwYBx1jWzK3ugs1e0WQNe4F/BcQiR3jrNbBfQxgShCQb2uOATnRN16gNAauiEaUAQV5PQdipFB/LnErTtACqElwjyrO2w0yiJGmxcd52IyZWqO8ahakmlN8lV5k1ASKTgViekQEMPEYorMqyGeFRzPE4O0nWo6RqThcR4LZ1pE3P57MsxbH3KzfSxtXABh56+/kYZFIEsOyqyO3849Exd3DtY0uCNgVW4+a/XPEv5SHrALDiBGVNDsNt9M2Zn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tVBfLY9awWvParslg+FQ+6B/EyqL0yQajWNCkd80W8=;
 b=hldf85TIfCtbbrTceg3S+HYNYNV6sP/CW+DFpSA+dX8AJttyU3moFTGkXWuwnUZwEq0gZ8OaQxSmgffCrmtNTb6vE0pFGkZx1jmHVfWUeyv9lRcZ4ILfnws6XLmoiqyiCt9BO8ZJ2Xsk7eIO2Zxy0t+q28G7riTns4mEUaySc8hw+hNpX+nXMHM3hVh+UFaN7vBv91xLmT8MmJS0OPW9+pk8McCJ+V5pKPCz0ClNKOQQ+e6k629dDkk0kttXwX3ZmiFMYcBTKBD+Xi9ktAgx2HWdzTJZe7LW1/3RN/NNtyLLY2AbzRjKKJ9IHd4719jorG3a7GMbkDMdeaA/fgFGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tVBfLY9awWvParslg+FQ+6B/EyqL0yQajWNCkd80W8=;
 b=ARb1QXhC7kae70uFA//LeHMy4a6HaEV+Cj8Q1q3cNtZ5o3lNzY1bpsPcGAfijDD012JgCbqFOE4vpu8Y82zdq3338OClXhEC4BpbVb75tfSmNOk7Xbhx/Ydfi03GDu1XumTxt3wYvhXIEuWbXeq1Xq4hpgVKBqoMAgJBzoy6uUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1afb1c23-a0a4-4d71-9a69-fdedd01e1e0c@amd.com>
Date: Wed, 18 Sep 2024 10:11:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
 <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|MW4PR12MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: a767cc88-6dec-4dea-fd42-08dcd7ebc1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnMwTUVub2M3cFNGVUhta0lvSm9pU1V2L1lmWnZ5Z0xmcXhDSzU5bVB6YTJV?=
 =?utf-8?B?QzB2bDQxV1JLYnREOWcxVVVyVkpXRmJwT29GRnFMQmoyYnZFeGlIQ1dFaTRx?=
 =?utf-8?B?NHhXNnptMGp3OEV6aloxV3FrNUEzeGowNW5hei8wUm8rOGRLS0FUcEhmR2ZC?=
 =?utf-8?B?Vy80bkZ6cCtjZjZYZUVHK0gxall5NXM3RDNrVnpzR2N3QUJqa1RPZDhvTEsv?=
 =?utf-8?B?TFhGSHg1bkMvQnlvSG91V3o1Tm1mZTN5K2VWcXU1emJkU1dFdkJ6c3ZmV1dw?=
 =?utf-8?B?OXc1SnY5aDdDeG52eEZKRXRnWHdoUXJONmFkNklES3ZHY3ZBeGc2QnVDWTNQ?=
 =?utf-8?B?UFdaMktiYlZEMjZ2TVN2L3loMFFGV2Nlc1FpTXc3WGsvdVRVSXFiVVRnR2hY?=
 =?utf-8?B?Q2JYTnlJMUJ6bng2NzVLZ1ZPYlo1V1Rid2YyeWErQlBPNDdLTDRVNlBKcmZt?=
 =?utf-8?B?OEgwZzRSZFptUjRyYy9kOWVUVDkva0RBWmMrbGUxRk9oZU11VVBzbEVsL2Yx?=
 =?utf-8?B?UDZsZUVjWElDQ002TlVSWnY3U2FvcVVLT2NoYXArTksrdjBtK1RiZTh6MnRx?=
 =?utf-8?B?bk44SnpKUE1tWnVkL0xGYStjN25YVE9Fczg0OUV6d3lKMUxlZGJGc0lLRkFN?=
 =?utf-8?B?amJzNWU3dEpPMXR5Y3BFbkg4RE1jZS9LTlU0WkZKa0J2dkd5YktpT1ZCWVVC?=
 =?utf-8?B?cmJJamVmWGtZQ2ZVRVc4K0RlK0U4RkVpeTFEbjZSdzlZYVEvNFRPOW5uQ3Ru?=
 =?utf-8?B?cXFrUnAwcVFuWndRVFJmRytQUk1ZL1ZZak94Mi9BZWFOM1h0dUowM1VaRmxq?=
 =?utf-8?B?RmtLSkUwYVYwalhURFJINEU3dkE5U3g3RDRIdHhQc1hMWk1BSmtNS081N09H?=
 =?utf-8?B?OUhnQ3g5anZ4akVPYTY2NEc1Z1JFYndqRnNESlBEeG1aeUhOWkp1Q0FuRVVM?=
 =?utf-8?B?eDE4SncrdVhkRkVkKzFZTUthdkxOVjI0MEwrSnFkdU9vT250Y3JOMHNoNXNw?=
 =?utf-8?B?YXRiZ2RjeHhhZzlsUGttQ2VLUkZJVnRoOTRQbUpidG9udFoyZDlxQ3BmTElM?=
 =?utf-8?B?ODNyck9qa2hHQ1ZMSmZacjZDV3BlYmRPTG1yWkxTak5aSGludEhvMDJxazBi?=
 =?utf-8?B?SEF1bVhIZDBvbkY1WVhkdnJ0UHYwZC9QQk41NXdOa3ZPNE5GZkJkWUlZVkFY?=
 =?utf-8?B?QndwOG43bE9vVkVXYTZFYlBZa0lHNjA2WU1LaWQ1bkkyejBLRGV2VUg2ZjdZ?=
 =?utf-8?B?MHdmakhvKzNNMzNKN1JCeURQUS8xSytZYnJFSU1TemFwWlg2clJHUDNaMkw4?=
 =?utf-8?B?MURieUtNL0JWVWQ1MkMwK20vSkd4OVZQN1hTU1BCdUVvQmF6bTFwVVRBbExU?=
 =?utf-8?B?UFE5cVprcGFjYWhBZDkzd0xxV1VRUHVkZCtvZmNmdGZQMkJ6ekZjUlB1YTFl?=
 =?utf-8?B?NEJzMkVXUWZXQmRTQldQdTBZVWY5NW81RFY1RmR4TU9LbWdJVFdPZUQ0dnZq?=
 =?utf-8?B?WkluOVJRQTZPeTV2UlUzeG55ZWlKNGFTZ2ZnSklHZUtMVFJVSE1tM1duSndZ?=
 =?utf-8?B?WkJSbS9zWEp6UkRrN2JLc2UxdWc2SkhYak1PUDhERmJJTmwzNUV5QXFDYU1K?=
 =?utf-8?B?bWJRL3IzbGFsWEIxZS96M1AyYjk5MXhKdWpwWVJrNjlUaFdSc1NvTTVyVnIx?=
 =?utf-8?B?TjBIblRLVEoyT1Rnb1lFNWs5VjFjRlhjUnc0V3ptK2FnYW1VclRHRDAyallG?=
 =?utf-8?B?YWJoaFRiem8zc1JwRVFpTUdGblJ2Ym5jNFM0UFhnWjNWRnlQZnlKOCtEdVUy?=
 =?utf-8?B?SW1yd2M0UTVnUG1Dc0RnUHh5QUg1SklaWWJDRm9oMEI0Q3FNbk1sbjdzazNN?=
 =?utf-8?B?RFoxcUhyOWN5Qk1VRjNLbVRGR3MrSUg5YXM4VkV1aEVzVnRLeURMM3d0ZEps?=
 =?utf-8?Q?XdQEbJHR/GZLY7Riwa/sl+Y808g1xUJO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 14:11:14.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a767cc88-6dec-4dea-fd42-08dcd7ebc1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5641

On 8/28/24 06:36, Jan Beulich wrote:
> On 27.08.2024 05:59, Stewart Hildebrand wrote:
>> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
>> +                                         virtfn.entry)
>> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
>> +                                            vf_pdev->sbdf.bus,
>> +                                            vf_pdev->sbdf.devfn) ?: ret;
> 
> And if this fails, the VF will still remain orphaned. I think in the
> model I had suggested no such risk would exist.

Are you referring to your suggestion "to refuse the request (in
pci_remove_device()) when the list isn't empty" ? [1] Or something else?

[1] https://lore.kernel.org/xen-devel/74f88a45-a632-4ca6-9cee-95f52370b397@suse.com/

