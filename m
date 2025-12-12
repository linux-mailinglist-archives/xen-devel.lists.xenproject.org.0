Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C961CB9337
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 16:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185521.1507634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5Tn-0007G6-R7; Fri, 12 Dec 2025 15:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185521.1507634; Fri, 12 Dec 2025 15:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5Tn-0007ED-Nh; Fri, 12 Dec 2025 15:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1185521;
 Fri, 12 Dec 2025 15:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL34=6S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vU5Tl-0007E7-Us
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 15:54:49 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e224c1c6-d772-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 16:54:48 +0100 (CET)
Received: from CY8PR19CA0038.namprd19.prod.outlook.com (2603:10b6:930:6::26)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:54:39 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:6:cafe::72) by CY8PR19CA0038.outlook.office365.com
 (2603:10b6:930:6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 15:54:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 15:54:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 09:54:38 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 07:54:38 -0800
Received: from [172.30.226.132] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 07:54:35 -0800
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
X-Inumbo-ID: e224c1c6-d772-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7XCwrYS51FqlVwtAf9x152Po4YEsM7fyQHE2QpbPXskOHsVJvsw+xvpLt8u8YC8PBkLS/e+ov/aLlcfLBy6lLe2ihvZFYRtrqtOnqMT4hnMqKq990Px95evCqqdQVm8XOYRUY99ogMYvyculXaBIlmmX116OLlZghKUMNUN8vkQ//m5imwOP7D1TdPwbF0hFd9rkMBuhF8eaTI0cj87ZZUVehRnV+xQMbyZS02fDhtIvHdzHG/4zkEkXTxs4Ops9NTIgn/M5p/nERgNmhw0ZBebcv2bLNmXN55N7a9YruFLhiyhulgeYpxSUuDf5Y+wbbLs4UO/jZp0tOn1lTBYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01jBEKH/XDWcfVq8+WPJkmX/jFaIwXfoYHW2nOowWog=;
 b=Ayo8wd0tjdZfjPkknKQSk87/8PExsnESO3RyVP+b3eElCfusk60FJjIV7lM4peP9wcjZleudJudfD5RXEc6TAaVG7P7OrITdu7a78KouPTQYzHA1/sPILIkreoiVar2DGWjvhFnRKTBXmSa4SKZVslaGNMee6Luca21myBIPd23d1qxtnM/Vi2vmkOTyE44dqJ+bX4c07HZfy62tZU4cuV6yHVdZV7XI0rxfNbL8h/nuN9yetblZOHIwh2YwQ+jllh+76c+oTyxXXuMrDyZlEmrq+EfcmofQLWXGc2WAWS0C6GIyvpww3DY8Cfi9S8/k5r63ajL4mi17R4xfw8xeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01jBEKH/XDWcfVq8+WPJkmX/jFaIwXfoYHW2nOowWog=;
 b=Fm1B8Chf0Uyxvs0ELHT0bmwOvKZFH33j2+LhJvTk3m/WbT3wEbTJgsPnOd1keRsNFmEQPv+N5JQSe+5FajCWMLSgoBql69PQuV3T45tIjqzY1i2aPY680WdIQptMptVf395VYB0g9kS/ik4NTrd1HkSSxPZHqeMdkzljy0pHVHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a36141ad-cde0-49be-88f9-0f17cdf04ecf@amd.com>
Date: Fri, 12 Dec 2025 10:54:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <b162424a-0ef1-46a6-bb3e-85aab5bb5a4f@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b162424a-0ef1-46a6-bb3e-85aab5bb5a4f@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 621d195e-c035-4fc4-eb25-08de3996c1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG91UklXMlpoVXF2MmNMb3IvYjlQVnY4NFNIdVFBeEpxd3hkRzRRaGFvbnM5?=
 =?utf-8?B?bnI4WjZaZkdJMDIrOWZ5WTdTQkdCb01tbGp1eFBCNms3elY0djI5bml2SjRK?=
 =?utf-8?B?cmc3ekN3YkR6cGsrN2JXeE9uTWUwWmtIYlNUUlNDL0k0cXoxUklzRGhOa3Iw?=
 =?utf-8?B?SkhTNkk1RWk3bEpuZUplRlFhWW9NUjEzTCtVRmx3RFdKUTRNWlZPdkdTWlh5?=
 =?utf-8?B?K0NBQ2theG44eGJ4dW9nUkluQmU5MGpESHpySTJkR1RMN0wweERRNU1yRFRI?=
 =?utf-8?B?Tklra1NLYys5SzhvNi9yclVKZXNGcWlVMGRocGt3VGtIWWhmaDBtSGpkRm9D?=
 =?utf-8?B?THJkSUh2ckZtRklRZzY5MDF3cC9yV01WWk05Q3lKVzk5Z2s0dDZNb1pWZ0V3?=
 =?utf-8?B?blEvT1pIYVdrSWZPTEVtTmVCTC80ckg5SjNJSHJzaHNRUHRRWHo5VStPTVda?=
 =?utf-8?B?NW1HN2dqOERQQ3lJMEJIRjlmcFJKV2krRGM3OGhOcm9jc2FFcTVuQi9BSWtF?=
 =?utf-8?B?a21IbHNMbHRUOERMWmhFZERXVFNzM3BBUUlWWXpkUTByaXRFbTVJdUNJaGVN?=
 =?utf-8?B?S0VIbkVYZE9tS0lqU09NWW50OFZpdGlld284QW1LN2g2NUh3MTVmS2E3MG9C?=
 =?utf-8?B?cVFOaTFFck1mc2ppWFFoQnpMZ1p2RFVaYWNmRmQ3bnhHa01XaWZncllkMndD?=
 =?utf-8?B?YlZhT3h4b05qR3JJMi9qZzZFYnhEcWlReG1nck8xcDk5T0VQcXRNNlZEajlh?=
 =?utf-8?B?aDRnQmJyanVxUUlLMEtKb3o5NkZsdFdhSE52QTRiZXhaeG9pM3RqYnRkSHQw?=
 =?utf-8?B?WXppVEppUjgra1FZWlhrMjJTREZDY2x5b015dWRybXJWQ1BaQzcwMS9wMGVv?=
 =?utf-8?B?Z1FmcnplVjdXUHVSUXVHczdpZ0ZwQURZMmw5bEZuT3Z4QndnL2FZNFYyY1E4?=
 =?utf-8?B?L2QrOE1pQjRsSHhpdlZQOWdXUm5qdFBJYTZRY29YL084WHBLbzJPdHdXY2tQ?=
 =?utf-8?B?aVM3RDBDYWNwRm9JREd5Sm5XcnMra2laSzVZMTgyZXdqN2ZOUmQ5ZklvMnp0?=
 =?utf-8?B?Nm0rMHRkWkcweVBUQ2pPY2RaVnNCRTlxWGVZNEh2alVTZi9TejltbVJNZlBK?=
 =?utf-8?B?SHBzVGQ5bms3a0dZS2dKOUdTVDExNFVRSEFHenk4Mk41VzNLVmwwRWs0QWR3?=
 =?utf-8?B?Z2tFZ2V6Y0JmRnFxaHdqTmU2SlkrVExOdEg1N0pNaDIrMHNZVnJLYXI4Mi8v?=
 =?utf-8?B?bTFtdXQrbWFqZ2tiOTQ5UnBjRnp2V2d6ZU5ua1NMemU0bEdrYkQzTUVlY3h3?=
 =?utf-8?B?ODhKdjE5cVgxbUp3VXdpbGlPNXA5TXU5K2VrQjNxa2JyLzRuZmdDSlBlZ1Jt?=
 =?utf-8?B?bFBlSmJvK0JBakllSnU5ZEsxZ3BUWUhnVjlyU2o0SkEyTkhQcHVNNXlocXFH?=
 =?utf-8?B?S2JIZFI5QXZ3bW15RDBiRXlLbE1qOEJ6VGpVS1gyQmxBTmF5d2pEa2ZmMlBh?=
 =?utf-8?B?OVJReXJua2tudVB0ai84ejFvQjg1Y0ZXVmRLQTJ2aERCWGxyNmVERHczVnJE?=
 =?utf-8?B?aGc3ZXc2SUhDelNOWWhGSWJnUnp0Y3ZJWFpmMXN2TSttVGRxd0pBUEFiOUFQ?=
 =?utf-8?B?b0FLNVJEMkxETWxsMitJcmltSDZJbmkrL3JMSlpDY0NLTHBvc0o3clZkNFFr?=
 =?utf-8?B?T1U3WXM5MjFXU0RKVHduUGgrRFBqYm9WUEZsZDM2MUZ5SG44QzVxbUh5SXhl?=
 =?utf-8?B?cmtoemQ4ZE1Dd1VvQWhJbnNjNlY1eDhKRlFQcS9jL1NxRUVwbXQyYW5XQmpI?=
 =?utf-8?B?bnhsVDF2ZDY2U3NKZHNUVzNLbmczOU03ZVh3bXVYcEV1cThFV0xCY0J6OXc2?=
 =?utf-8?B?K0NobDFDL0NPMHJndzR4ODZiQW9Ba0V1UlF6S2xpRTJVZkVYWnJ6SzVKUDVU?=
 =?utf-8?B?dy95b0s4OWNZK1JONVNzYXNoeU1DdU5Dazd0QUtaMjYzNE9jeTZDV0FEd2hK?=
 =?utf-8?B?Z29FUmthRXN6elV3Sm0wMzdpWVltckM5N2VnK0RobUJuVmxMcEovTGZaSEw1?=
 =?utf-8?B?NUxoUWJwYmw0NkNxckswcmMrdFRlWmNrK2gvK0VmU3h4K0NzVlZKQlFmOC9T?=
 =?utf-8?Q?kSN8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:54:38.9573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d195e-c035-4fc4-eb25-08de3996c1ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503

On 2025-12-12 05:42, Grygorii Strashko wrote:
> 
> Wouldn't it be reasonable to do the same here for "initcall/setup" as 
> was done for
> "schedulers_array"?

Hi Grygorii,

Yes, I think you are correct.

Thanks,
Jason

