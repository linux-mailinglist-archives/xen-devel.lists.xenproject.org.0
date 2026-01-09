Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47813D0A573
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198764.1515597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCMh-0006kJ-8I; Fri, 09 Jan 2026 13:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198764.1515597; Fri, 09 Jan 2026 13:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCMh-0006i2-36; Fri, 09 Jan 2026 13:17:19 +0000
Received: by outflank-mailman (input) for mailman id 1198764;
 Fri, 09 Jan 2026 13:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1veCMf-00064g-FG
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:17:17 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b3824c-ed5d-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:17:16 +0100 (CET)
Received: from CH0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:610:77::31)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 13:17:11 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::9f) by CH0PR04CA0056.outlook.office365.com
 (2603:10b6:610:77::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 13:17:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 13:17:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 07:17:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 05:17:11 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 05:17:08 -0800
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
X-Inumbo-ID: 84b3824c-ed5d-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd/3U2e5NZXTp4a79zwf1Ev2TzQN6g1ZqB/vlKjWADUqoCaD/TYBj6OCqv0qGEUDsyYHljc2SZ+JWyttW3RO1TTJzlcbNi7++K1puwSKY8Bhbig/T/Qc1w7+2HAU1eMfcasHbJe29xyF/3BkZL4I4h/ZUeZNjdl/D3GTQrhdNHykZ8zd+1Gk3/Nfo3MTGeNZmqZ74KfG+O4h9+e6l3Wu2zyUxqVTGe9dRO97q5ppD431bYfM18V3V6Hhnaz3xDWSvW81eSD69Oq7G2roBqBZpNeKEQ6UsPpMrOYTsg9CRX5HonOBTCTx8TUTMCwXJ748fmq9aWJZ3hTUgoWEw3zQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXzj5snBkHhZomySM8tnBeVK9MbSz5xlbWA1TLEawqs=;
 b=uf34DKLDmtxDCcEgOlwQdXL3IvNgdrjiciCjS/iW4W3dtz8f9ggTelkitMJ3tO5HqdIzyPI8MgA0Ip/l3i/XqFH1b+WsFnqTEqSpc9fpadEVRKruTkKJgPoKSS2yU97+wimNjTdzMnVrbWYP3fBBuhH53L08B8vGwQz+XqFpYMo5MA9iQT/Po1IK705IjdYMj/UwCwgGNWJZugorXk2avvN+Gl2GC8OKJNsQPBqufFIQyCaqEN52XsQiphm2aafV74iX3NlBvL4s/s3F/GmcEJVGgGoEqXF8uR0R0qZOa/DUtyMQh6TVogpKVTTFtTp43ca2Ym0bGyKpHiknD4tppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXzj5snBkHhZomySM8tnBeVK9MbSz5xlbWA1TLEawqs=;
 b=Hto/FGQd3DZ76hHswATxL+7FPtUk3naQAgKtiFEeKuNlRJotn1jJhNKKvnGXqtOp5fChTd+IDPrevLebZQyS5AzDdX5quEFGGO0U7tcGCocJKcNVA2qncfeB4oJfzFjFV9m1IuyLA9dMM73MWIfX+IgBiceO6CWRcaWDwpDy9AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4b2e9f4c-ce8e-4090-afd5-45af183b9497@amd.com>
Date: Fri, 9 Jan 2026 14:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
 <fa8d4daa1ebb1b27dd9dd56f671bde2aa7beb58a.1767803084.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fa8d4daa1ebb1b27dd9dd56f671bde2aa7beb58a.1767803084.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: f711b839-d560-4e4c-72cf-08de4f81661a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHlHN0djMXBZWHlpZU1saGJEdVpLM2hrNitWaTlvZGcwV0k2Qm5NRUpQdTlL?=
 =?utf-8?B?SUNiQlR5eW9oZ3NmVWVsTG1XOTdIQkc1ampvUllwNUJIWTNsbm1YdldWdzVG?=
 =?utf-8?B?YzV3cWFaUlFhLytuRFFJWkVmWlNWSUJlWGszMmx3d0VGSWxkZ1JlQWJ3TW1V?=
 =?utf-8?B?ZXc5L2ZBeFBhdk1DWU5CRE05Mis5bVlzZm1DQUFabFFrU1BFckxmdWtuUFBJ?=
 =?utf-8?B?SnA5VHlmZjZEYnVFNjNtM0N1dnQ5V004OWlZV1hiWEw4QzVmcjdIK2lOeGRD?=
 =?utf-8?B?S2VmTmV0dERzWEYxWFg0MmM1cVB3UFpaVURUajJJUlRoZmxQVnhScm9GL2ZL?=
 =?utf-8?B?UFFNYzM2UTEwRk5aZ1NXaG1IclBBTkhDVmRwZUZoaHVieXdzWU9uZ1dsdE1t?=
 =?utf-8?B?dHN6UFVoSDdhdXhJQ2ovZ2l5Y0Q0Sm1aNno4S3pTRkpSUDFJcXAzeVA1Szcy?=
 =?utf-8?B?eGJyZTA5NDZYa21rNmw1SkJPYllHdjgzNEkzYnpZSElmWVAwdENsQ0RqUmJr?=
 =?utf-8?B?N1JEdzVxSzZXTzEvU2duTStIQ0UwOU04Q1BHV3h0N1BjVERnaHYyZkRjYTJu?=
 =?utf-8?B?QUNoQnd5ZjJWZFVPOUFKTmFHYXlXQkZDLzlwN09rUlE4Y09pZlFaNWdDQ2p5?=
 =?utf-8?B?Zm5PTEpVbHBualRhVFU4VmxzNDFGQ2JkakpNcHNEU1RYZm90SmJkMHJJd1gx?=
 =?utf-8?B?ZGRncVdpeHhkOFVjK2grWCt6Z0lpckx3M3d5K1AySmlOdjE2WSs4SGltL2Qw?=
 =?utf-8?B?QmZKL1FEM0IrUW4wWFFuU3p2WHh2aDJTVmcrK3lXTWxvMzM0T3ZHWDRoU0ZX?=
 =?utf-8?B?YmsxYzVGZGJNcXNBTFdadm1yZ0h1SW5aM3FNZzN6dU5xQkhXSnJkWE5QMEVo?=
 =?utf-8?B?YmEvQWR2Mmd6NHp5NUhLeFdVem1zenJZVGZIOTJ4NnplT1FiMXF5Qklid0Jh?=
 =?utf-8?B?algxb2MxQ1U0RXpFVGhqejB1RkZhL2hNaEt4STJXdkJqUUFzQkV4M2RMTGNy?=
 =?utf-8?B?bXQ5R1MvSC9FS1pRd01BMmZwcGIwdm82YzArWlBHb3F3eHlqQWNwZ09IREZI?=
 =?utf-8?B?ZFhEdFFzeE1wYVNNNlBjcE84UnFKK0JyZU50S0pseExpbWl4Z1N6MTZ4cGFZ?=
 =?utf-8?B?ZGZqbTlzYm1OWEkxNDc4MFlFY3BlS1dtV0Q3ODFhL245aFByMnJwRUpsUjcv?=
 =?utf-8?B?Tk1Zd1F2ZlpRTzQ1RjRNcE5LcER1M0VDbno4c0FMQWJlZzhZSFFTZDhMY0J4?=
 =?utf-8?B?UWdacC9XMiswL2tjaFlRNEt6SjVQcDJxeVREV3FYK0txUTVWaVpHdHZDTzJV?=
 =?utf-8?B?aVl2RGExTnFLQ0JUcDI3VFR0UTJWbDhTamZFeGFva2RNTVpVWnBZaElidnA1?=
 =?utf-8?B?SFdKT0J6THBCc3pMTldEUzBGTkx5c3hxSkhhVlliM3FGNmpUSGVnQ1c5VmlH?=
 =?utf-8?B?MlYvZHBNQkREZ0xvR1lEQk9EZldTMVV1bU5jMEsrb01UeW1WZjJ5VlhVYTh3?=
 =?utf-8?B?Uyt0Mjk0MWwwOHdvRERmajAyTXlWNlhmZUZmTWNESkMzZnJQU2wyTE84M1hD?=
 =?utf-8?B?UE03Y2pIUngxWmxoOVBlRmpGRzFTazk3RTlpOHVBZnppUXkyZWlhaUthNVRh?=
 =?utf-8?B?Q0grOElFcENtcUxoT0FKMTJzdE5XbkVNUlRRQWsvZlNLQmdFcmRvemdHcm9o?=
 =?utf-8?B?aUF1NG5zU3NUcGhoRW03aTFtNWMzL0t2QytrV3gxQVJHSXZWc0VUVDNNNWlp?=
 =?utf-8?B?bUtlUzFwL1dIRlBHZFRQNUp3WS9ObFhoT0JCQjF6c2xPd3Y2ZDMwQ09zRW5O?=
 =?utf-8?B?T1VyQkF6OVRpZ2lSY1hDUjJGZUNiZ3RlaGFCVXAxRVlsTGErYjhnWVpHQUw5?=
 =?utf-8?B?anFnWGcwckRDYWhkcm45OVRCMVZ4QXVUbE9BZWhaRGNyZzJTK3R3MVMydTFX?=
 =?utf-8?B?c282WGdKcUtCRVRvMzRXbTJEbitEd2NaV3p4RHdmMWNIVm94Qm4zMm5ORHJQ?=
 =?utf-8?B?VEZsdUNxalQwNkp2SmwyMmo3bmJFWFczQ3NlOGFScndKcDRIKytsVVBKV2dr?=
 =?utf-8?B?ZURpYU91ZWdYalAxbWR6ZTJXTkJCQnR2UXVkU3V0NUpoUERMNEs5RUt4dWlw?=
 =?utf-8?Q?NlsE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:17:11.4834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f711b839-d560-4e4c-72cf-08de4f81661a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F



On 07/01/2026 17:28, Oleksii Kurochko wrote:
> alloc_vcpu_struct() and free_vcpu_struct() contain little
> architecture-specific logic and are suitable for sharing across
> architectures. Move both helpers to common code.
> 
> To support the remaining architectural differences, introduce
> arch_vcpu_struct_memflags(), allowing architectures to override the
> memory flags passed to alloc_xenheap_pages(). This is currently needed
> by x86, which may require MEMF_bits(32) for HVM guests using shadow
> paging.
> 
> The ARM implementation of alloc/free_vcpu_struct() is removed and
> replaced by the common version. Stub implementations are also dropped
> from PPC and RISC-V.
> 
> Now that the size of struct vcpu for Arm64 is smaller than PAGE_SIZE,
> MAX_PAGES_PER_VCPU is no longer needed and is removed.
> 
> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
> common/domain.c, as they are no longer used outside common code.
> 
> No functional changes.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
In case you need Arm tag here:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


