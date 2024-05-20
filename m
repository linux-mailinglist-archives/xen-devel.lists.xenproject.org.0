Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277538CA4F3
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 01:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726414.1130702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CJi-0000OE-5Q; Mon, 20 May 2024 23:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726414.1130702; Mon, 20 May 2024 23:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CJi-0000Le-2D; Mon, 20 May 2024 23:21:18 +0000
Received: by outflank-mailman (input) for mailman id 726414;
 Mon, 20 May 2024 23:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9CJg-0000LW-QV
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 23:21:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a610f54b-16ff-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 01:21:14 +0200 (CEST)
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 23:21:09 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::91) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 23:21:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 23:21:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 18:21:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 18:21:06 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 18:21:04 -0500
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
X-Inumbo-ID: a610f54b-16ff-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMqVKxYyb2f2ZHgg9VRsR3ANCwpOjnsTDHWucpnzn6x3jDYojO6Qs4SIP/fEPIeSJHayvI+H2GMQN1R4mvc822Tj/nnoGAtZLEpk2TcoIKFb0e/VvgvMz7NRc1mxb34Loeg4xOJLc9jQWdOwcMfiLEeXkII9LJizLzt2KaD7Q9e5GFbgflFGqnlGPxCQqbbYuMz8t+D2Tw0jElJp/ZVHqhIXjE7IS/xyB1z3P9jxSW2Q60FzLARd5hrNqdUzltM1DOdDcP36/9RU0raAnnxaLpOCSyj1zN6RZ7AbX2vNGiF7eZA/9iCfoCdCnSTNL/ofPkGupP2ufMLMwwe8xCDsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN3S4OosfqwRG9b51l+yCzFsbjpm/Dor86nu+LAVHcQ=;
 b=OLJGzgVbTgTZOwgnciE3yQz59YiA4g/H78uBMn7iGGdQwQK7uWWWdCKMxbrQXMXepRs3H+1Q5GprywlHydgg90c7mdpitFEIZdJrrdB98DvImqhBt9e9O2yTVD7wYtTg/el4mpEY90wiENaUkMpAIW2wByfeRr93Xa0/Xb6bfNXVwyj0FvDCxOqcNSJ1lrqL4LLqgCz4I71xlp4V9Ht6uihLwvYVwpvXEuLEhP6Sl5gtiBDgupUad7hHnZJvrO63cM7dU2zuUQE++0mWpsf4UMFyYqbgHKNCZ947fqQdL1CUvpNvcez2Q0LXXWAUjRiHNdq6V3jGIfb+lbke1/P0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN3S4OosfqwRG9b51l+yCzFsbjpm/Dor86nu+LAVHcQ=;
 b=K0TNfFFKEysyiKuLLxKk6droWutxAbjw5KkExQAyZPFKHqUdqfUhLwJDpAdC1DzI9SCYzkkvylnEc4LKXam6NXzCE92LQzZOUCY3MVUh4+Wy1h9LKegQTOtDtQV+B+hOVJeQD16iWHqewxE4JOTfGFiETijjHyK4slMZq1EQsIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d7bb6db0-e27b-491c-ab52-0294d59b26eb@amd.com>
Date: Tue, 21 May 2024 07:21:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] tools: Introduce the "xl dt-overlay
 {attach,detach}" commands
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-8-xin.wang2@amd.com>
 <6a04ef17-2580-4f62-b377-aad2ebbcdb5b@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <6a04ef17-2580-4f62-b377-aad2ebbcdb5b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e6291a-0712-4f10-caf0-08dc7923868b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mlp6UG44QU02U2I3OXNyZUE5QUVIWkVpY1d2cjNDZXZ0dWMxM05scHBoalVv?=
 =?utf-8?B?WDEva3lvbTBlb2dPU0poL1lYVDc4K2VwVXp1SDFTUkpUcDgwUS92ZU05Zms0?=
 =?utf-8?B?QUxkTFNGYmU5bXEwSm95WlQ2eWN6OEtPMzFjSU9NWG5sL1VNTGwwNEFSRzIx?=
 =?utf-8?B?VzZKT1dVc2J4WmNFNmJWUzhJck1KL1pDNTgwUWJFVy9uaEJoVmxIOVpYTm1y?=
 =?utf-8?B?ZVdEVVlINVVqMVZFYjdGQmVoMEFFUUdKTlNjYWRwSXZ2U2V2T2NWdng3V1hB?=
 =?utf-8?B?S1hxWWl2WEZtdG9KQzdTeUx0ZzJJb1hZd1pFQUg1NHBqN25vR0ZVMlBzK3Aw?=
 =?utf-8?B?VWxuelJiUFFtZ2Qycis5WGhBdzRxZlJPRDBqRksybXFHUzArUC9oY3RBNTlM?=
 =?utf-8?B?UTlvd2dJWHdSQm42WFlMdHpPWHBQdkxiTGJodFBzY1FSanlRT242UmpqN0dU?=
 =?utf-8?B?TEJIUDkvYkxMa2pMQ2N1VFBabWZTZmQzU3pJTWppdXROZ3l0VFN5eUVQTVBw?=
 =?utf-8?B?UGVqV1NPRkVweXJZMGpwL01WWWZUbldBS1kxRWs2ZHAzOXRPempCVzF2VG1v?=
 =?utf-8?B?T1pEcFFHWFByQlNNd3JxM0JSNnl4VzJZcU1PTDN5T0xPY0YxcnJnM1R6VzZz?=
 =?utf-8?B?Tk5vVk5ud1VueUNHNVRVSXBEYXlrVUlNMEdra1NTUGo5SVFaVXg3WUpCQ2RY?=
 =?utf-8?B?Z2Z2Wml1b1RvS04wZERHdjdscVlWU0hCdVJxQTR3eCtRTUtjM0hhNElsWUV1?=
 =?utf-8?B?U2EzVlpPZTFSN0FoQ3RvUU5CbjB2Z0xBbEY3c1NZMW12ZzF0Wno0cFhCSUVJ?=
 =?utf-8?B?R2RTSGNMOW81bW02bGgzMTJ4Q3R3TmhHY1BjejEydXViRThQV0x0OXdBdkNo?=
 =?utf-8?B?VXRUSm9hdFJMeS9hdXhGclFqMmMweXBMNmNFTU5SclJpbWozOWtBM3prWWVp?=
 =?utf-8?B?RWdqWVFCM2lzZ3hVamFoRVRsb3Qxd1MrVlBPQ1kyaytzRCsxQzh1NDVhMkZz?=
 =?utf-8?B?UEdJYmJwMHQxL1BWaFhiYlVlVkpwSkhPRnZ2TTBMQmlhSEkvcnBoQi9JZlA1?=
 =?utf-8?B?QXhZWmN4TnAzQWhzRGIrMkE4dEprNkpQVldvcjZod1NZOUczZElaMmFJNzV6?=
 =?utf-8?B?Zkw4Y1pXWFN1QlBveGtXWThGQnJUcnFwRk9HRHFsNDE5SGRRNEFHQ0ZEMmll?=
 =?utf-8?B?a2RKdERlY0N0QXgzcVVLelJYVVg3RUozdlgrNjJmMXB3aVNKNHZSV0diTFBF?=
 =?utf-8?B?RURNOVk3elNVWGRaSU9aNG9DdWpsL3BZNFliZCtNYW5iMGZZY3lFWFJwK2Ex?=
 =?utf-8?B?cTkybFpSZG8zQnV4M3prdk12cEpxa0JlYmlMWXBJMlJGeHNpM0FNTXo0U2Vm?=
 =?utf-8?B?SFlHeUtEWWJEdW5KYjhHdWdwdGk1RjVjcVMzVTJLY2g3dWdLakh1TGxqZDdY?=
 =?utf-8?B?c3gwbjlWS1pQa2xLQ24xMW1USUh5QzZqRjZUalVkeFpXUlEvMFBMWjZCYnVt?=
 =?utf-8?B?dkV3eHZveDQwNmI0WHlOWEQ4V0NsRU44ZFJHb3N3djJ4WlZ2SHpWYzEzSXhp?=
 =?utf-8?B?RXdpQnE1OWUrYnR2MWxnZ3dvTE0yWUJuWnJIckJDNDdWTHFZRHZpUEtEOTlY?=
 =?utf-8?B?dkNsMUllcndkbEROcVdBS0FnYW9oSjM2S3FydmNPR0RVRTkyazJEWEtNa0JF?=
 =?utf-8?B?NGdmWkJVRU94Q2pvbXNhbEs2MGcyTU84T3Z1dm4vRkJuSFZVQ2psemI5RkNB?=
 =?utf-8?B?bXkyclJUMlVLSE5mQjdNeXhWQmpIZFVLZkxZTkorUSszNUx4bWdYM0o3ck4x?=
 =?utf-8?Q?a1gA7w3JqH94verFT7eOEGZGRERFWdSWtk7Eg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 23:21:06.7423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e6291a-0712-4f10-caf0-08dc7923868b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467

Hi Jason,

On 5/21/2024 3:41 AM, Jason Andryuk wrote:
> On 2024-05-16 06:03, Henry Wang wrote:
>> +            domain_id = strtol(argv[optind+2], NULL, 10);
>
> domain_id = find_domain(argv[optind+2]);

Good point, thanks. I will use the find_domain() in the next version.

Kind regards,
Henry

>
> And you'll get name resolution, too.
>
> Thanks,
> Jason


