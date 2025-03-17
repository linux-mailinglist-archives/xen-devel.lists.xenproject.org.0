Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFBDA6544E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917089.1322091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBnN-0004Hi-ML; Mon, 17 Mar 2025 14:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917089.1322091; Mon, 17 Mar 2025 14:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBnN-0004Ez-JM; Mon, 17 Mar 2025 14:50:25 +0000
Received: by outflank-mailman (input) for mailman id 917089;
 Mon, 17 Mar 2025 14:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4wc=WE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tuBnM-0004Et-Nm
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:50:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26945e04-033f-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:50:22 +0100 (CET)
Received: from SJ0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:33a::20)
 by MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:50:16 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::b0) by SJ0PR03CA0015.outlook.office365.com
 (2603:10b6:a03:33a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 14:50:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 14:50:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 09:50:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 09:50:15 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Mar 2025 09:50:14 -0500
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
X-Inumbo-ID: 26945e04-033f-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/OYPpT5gbeCfV6TzADYGinQR17VzTigWFXBbQcR8+VEp71g7i2nHvjYwA/TT98jXtWR0evpFBdhmGW/s+SdjupEaOHU22aos7obQFZEmKdIV5RnSNxL0mr9aJ9C6eW1b0Y3BmYNvX8nnMDGZRlLj7NhdAwTa/APezh8apy/MO/I586mAsimSOuhqyHqsAiitWsrHL6P7u5B6qauPnsnzfLWZi3cqsI8H8Pk9tP6u5yNFxO+SAiqfRNVbAnwix9u1v2QC4bniO/qlM0pM0Y7sqU15xOvFW2sWZ/qUT/IuiBgzgePzoEX48Zlzi1ARZSGU/W3l6WtfHUwuKP4pgqZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0lkKx3Jb2DU2LR95VJ95PvkUFyW+EpqbP/Cn9ITtY0=;
 b=hg/PCThikwPE2zmQqWD0kZ2U+5Z5ZH0mEiA4MUY9BOWnqh5nwg5bgiwkX+odmw+YsY09m0nTSkUdWXtzXA8AnFR6vs61TEPmsukFF0O7kLBaDM24UpuAxv5vAGk6E240V6UhOCHRPuIcW8ws32RdIacCFtq1NV+QUdtLS4jg6f3moWx37RSi0GcOnRnMMU2QhzA529aDbQGLcYTFOpHeONob2sMLVOXPsfcr6GrhXUWXrTrwAcxDdsY4/4/a4thAqtDCu6He2zhvtUc8h1PyEwSNYOdooXsTew74XAaba02/OahUpbNRYu07KjMuAIi/nO+NKY+fKI6tlIJaLgH4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0lkKx3Jb2DU2LR95VJ95PvkUFyW+EpqbP/Cn9ITtY0=;
 b=gT1dxNEVT3HBmsg1WJqrTjPJ3l0YXHskmMweUz5sn65Y/5VN6M9zgZzTd8lfF3FkGTGoDBigNM7OWqTPKakWmb0MnGUn70UhlKci8xPvLDGRwxHn7oHQpRozts9Q9fBN78euICRBr7kr5wEu2RiRD7pbQLD0P88HcvVDDsrtrws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
Date: Mon, 17 Mar 2025 10:50:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-15-jason.andryuk@amd.com>
 <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a64cdcb-9af6-4cd0-6933-08dd656307ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGQyMGoybU5mOVA5OUppZWRqRm9MTFlEQjU2ZzVrU3RYMGV3NmFqZHVUbm9a?=
 =?utf-8?B?UUliRU5nbXdRZTVUUi81WW5iZWZxL1BCUXNNcU9OZjdpV2F6Q3c0ZWhaSVNn?=
 =?utf-8?B?eDBhTnA5VDBMQkZ0V1VpYjU0SlF2Ujl5czByeUtDRmt5a1NnSzNHYU5ZeFBj?=
 =?utf-8?B?Qm84NlEyempFWm5BNS94STVHbWhITkZYNnpmSjN3UFV3bW9XV1lma2FudE41?=
 =?utf-8?B?Y1lBZFd0R3BuQlR5TmZvSlJab0JmOUdiRndUZXJwUXlnTkw0N2gxYngzc25z?=
 =?utf-8?B?Qm9oazVLdEhpcTB5T1BocHlrZDR2U2ZHcU5adnkyYzNQV1c1dW9SOGRJMlM5?=
 =?utf-8?B?dUo2SjU0a3VUYmNHNGQ0ZGpDdDJQMEozUzMwMmxVTEgvWGZJd2J1VUlRSWtW?=
 =?utf-8?B?SVA2MDZ5bnZhb2twdy9MV3ptZUJXQlZucWc5K1l0ZEZXcVZiS3ZrZWppUzdv?=
 =?utf-8?B?ZStJUUNtc2I1M2QyYjF3dXBlbU9jMEwyanBqR2xIckYyd0o3VVFwQXVRaHFa?=
 =?utf-8?B?ZEw2QTZ0eEFiU09wYjNBRUpPTllZK3Rqd3M1WmlodDloSFU4MUpaWjg0SEhu?=
 =?utf-8?B?MWxnSm9KVlh1UVAvODhLRzJtcyt3WFZheFVXRkc1Q1VkY3VKTzdCM3R3QjJo?=
 =?utf-8?B?N0d1dHlpb01xM2JHTlpTeVBCZmhLbUF4OWZCQS91MTAyditpbys2UTZuKzQy?=
 =?utf-8?B?OFA3RTNmUUluOGJJUU1GUWwxT045a1F0UWdlK3Q3eEkweGtRWm5hemFiT0NZ?=
 =?utf-8?B?UnZIVFJTSHhkd3NSYmxQU2dmYWZ6RU9xMjFMZkR3dDQweGdKMmpiOXpJTTZY?=
 =?utf-8?B?UllObDJ4TWRPS0JMQ2RQSkNvYzVTR2s3SGovZTFEeS9pVm1adGxGV0xUcjNF?=
 =?utf-8?B?ZkdUcW8xb0ZrUXZRaHk5MkFwQ2p3YnNtUUVHTFNPbGJhVk8xcWl6d29aSUtz?=
 =?utf-8?B?aDNSUHdVcllaZmdMdnN6SFAxYlNJbXFDS0ljNDJnVlZ2dGJpVWpXTXIwblBm?=
 =?utf-8?B?T1pSRUVLMW5kZlhDZlc0RlUvb2ljdC9ZcWRZcFBaK0RadXlFU3dCaHAzVFYx?=
 =?utf-8?B?dE4rL3dOa2ZQNUNzNzlqaWU5czZNdHdYSGl5ZkZSN2RhejB2Uno2YktzeUxm?=
 =?utf-8?B?ZWM4L0t3VTB1QlRKeTIzd29OUTZad3NIMHowcWlKLytsL1FKclNnYnExOUFN?=
 =?utf-8?B?N0grRVlUUDdiRm9SU1JxV0M2aHh4Q1RFS3ZhRitralJIU2dTUjhIRU9YTC9Z?=
 =?utf-8?B?K21jVjI0cUtRWE9FOWR1UTVWNEl0QS9JWkJQaEF3bm1jUDRhYXFRZWo0ZHRR?=
 =?utf-8?B?c3hhcXdZeThUdXhnY3RuVVNxajZZTFYwUnlFZzZSakFIQU1kWlZoamY3ekZM?=
 =?utf-8?B?Mk1TOFJZcy83V2JCK00yZG9rNzZpcXZwa3dxdy9uZmhpN3JaRVlMYVRRVDRD?=
 =?utf-8?B?ZHI4VDZSL0hFVGRCNG9sRnhSaExGT3MxeFdLakVQc21zQVVwcURBVEZsWE9w?=
 =?utf-8?B?eE1Lb2V1d1VKeXo3M1NYU1NOT3RUY0dQMkhudnA2ckhQV3N1ak5zbEREaURK?=
 =?utf-8?B?MFBFNVFsMVd3TEEyVDdQZGtGd2FFOGlIL0JVaGxpYm53S0p4dzFGTFlMWDl3?=
 =?utf-8?B?dFNhTHFOa0dnNU90K0JNK0FUdjRnZ3ZIMUtlSUdXRktKOG9zVVcwVVpldDFN?=
 =?utf-8?B?bzVNejJOa1pyY21RRzVxT3NFbVVtdUh3Unh2TUpod09tek1ENG5ENWQ2V0Nm?=
 =?utf-8?B?UmtWNUVjMlJxaGZudTJ4Y29Cb2JUZHFja0JzL2VhOW5vbHZQU25tNGdlQXpy?=
 =?utf-8?B?RzU0dGtQSmVkZ09vSUU5N2I0VGYxbnM1Zi9Yc3dVSGJMNS92d1ZpMEFuNU9O?=
 =?utf-8?B?VmpMaUhoakNLdy8rTlljazRsMGNIcWZ0OG8xTWpCaGNzZlFkNjN6ajFvcUk5?=
 =?utf-8?B?SU9xMzhZREMzYkkrUEd5MFJUZDR6NFV6blJzcGFzcFI1aGs3VExsQmUvNDRV?=
 =?utf-8?Q?Kfw3WOXIKWIgSc5BzmFPJGgT9mnDsE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:50:16.2101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a64cdcb-9af6-4cd0-6933-08dd656307ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296

On 2025-03-17 10:18, Jan Beulich wrote:
> On 06.03.2025 23:03, Jason Andryuk wrote:
>> This is useful for a combined hardware/xenstore domain that will run
>> init-dom0less and xenstored.  init-dom0less calls xc_hvm_param_get() to
>> retrieve the xenstore event channel and pfn to configure xenstore for a
>> guest.  With a hypervisor-allocated event channel and page, the
>> set_hvm_param is not needed, and the normal domid permissions will allow
>> xenstored to connect.
>>
>> Similarly, a hyperlaunch-ed xenstore stubdom needs to read a domain's
>> xenstore event channel out of hvm_param.
>>
>> This allows reading but not modifying the guest, so allow the permission.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Since this is exposing the entire param space to Xenstore, what I'm missing
> is a security discussion for existing as well as potential future params.
> There could well be some that better wouldn't be available for Xenstrore to
> fetch.

I can't speak for future parameters, but existing HVM_PARAMs didn't seem 
sensitive to me.  The safest choice is to just pass the index to 
xsm_hvm_param() and allow just HVM_PARAM_STORE_EVTCHN (and 
HVM_PARAM_STORE_PFN) for the xenstore domain.

This works for ARM and x86 HVM/PVH.  PV doesn't have a way to determine 
a domain's event channel port, FWICT.

Regards,
Jason

