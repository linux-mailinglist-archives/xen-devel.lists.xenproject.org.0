Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95D963CF2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 09:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785512.1194971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZaT-0007Vx-ES; Thu, 29 Aug 2024 07:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785512.1194971; Thu, 29 Aug 2024 07:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZaT-0007TL-BK; Thu, 29 Aug 2024 07:28:57 +0000
Received: by outflank-mailman (input) for mailman id 785512;
 Thu, 29 Aug 2024 07:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/9N=P4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sjZaR-0007TF-3m
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 07:28:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2414::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f5392d-65d8-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 09:28:51 +0200 (CEST)
Received: from MW4PR04CA0222.namprd04.prod.outlook.com (2603:10b6:303:87::17)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 07:28:46 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::6) by MW4PR04CA0222.outlook.office365.com
 (2603:10b6:303:87::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 07:28:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 07:28:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 02:28:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 02:28:45 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 02:28:43 -0500
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
X-Inumbo-ID: 55f5392d-65d8-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaJBDgwP5Ok6e5wfc6elFBVdOhCt3kETSANWowtGLL4Vj66pafaJ1geyXKL0QrYpdX3yRVpMyd1IAgtituIrla00YdsZm2qLQyT4vRmqqHDbaR1QyiMcZ8KcpxITmtn/MXo/IOv5kvMP+UyGI9cosvOA1To+5sRmVwdGNhl7zXTJ0/xzRLedeg0N10UJpnIpTIvanGofjS7+7u2BRLsvrjm1RsT8dIhYncBo+tiqb2f6R1azkf+/CU9qXrLkh7UiZXplyIxW3/KcS8oTS1C1bOZzQCOHjvZ0qNoudBNcIObHSYsXVWO1nweU7FeWTAlWEAlxxkhIoRiSupO0x8AcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvDgCUlzTqKh0t/JzhHySZPFUzHRBypWW0m9/XxgAAE=;
 b=XYrh0iVc42g3KGPlQQotkRK+xzK68ka4o4HzVY4XfNDDOy6o0bo7QXmBsmtW6gGeg5D7ytMgqDTUy2LGH9+coJMjptzWD8gTy35C0IpEPerRv14uO6WK9cSWvyLtCQycsYe1tt7dqIHp3q7TrRE7H0rSTZlns1Ch89SBm/cxEGw9J8VF6/36daRTCRhUPkxNiOvYgjOUEU+wzbOOHFb/yOpdN6jgLe/kiMEkC6YLYB9kSfIP+s/qZWam0qygCuN5rSPBn38CfEZ+QZiJ7OfrJlkEkqJfClS/3NP7kdTk7TS9rx+NX51wCvmz4+ohLZruVm+Wr2G7uP+chfgIitXw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvDgCUlzTqKh0t/JzhHySZPFUzHRBypWW0m9/XxgAAE=;
 b=l/bAymd8XMLwrL0pDlL7kXK1JqCDZP3x5Zrlxk0w6+cM11ywVq3HzXCdKzwXNtdbp3u/GcMNizVZV+JwTxbiCzL3oY6y5erTgSg5OoLzRmCE/ZwNv4Grryup4uUji6D9HA3RVOifbcTO8usJzCMrLJp1I7QvKYE2qWy2VrsADy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4d895ba4-bcf2-472d-be7e-d9747382301d@amd.com>
Date: Thu, 29 Aug 2024 09:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm64: adjust __irq_to_desc() to fix build with gcc14
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <9cc9e16d-a4b0-4902-9f12-a7cb337b1763@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9cc9e16d-a4b0-4902-9f12-a7cb337b1763@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: e7566635-ae38-4ce7-9726-08dcc7fc37c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFI2bXBVd0hOejNJUk9YeFV3L1dYYzVyUzUvUHBOSTRCN2FNYjdVem1ONDh0?=
 =?utf-8?B?R3FueUR2T3R4TzB4YVUvVjgxUGpmcGhHc05xbmJiY1V6VnJRNVNydkVheEl4?=
 =?utf-8?B?ZWxGbktWT2k3OWtLUCtya1hZbGd3MFc3YXY4TjFuMHFOeUYvZ05GS0Urbk9z?=
 =?utf-8?B?R2xpc3F5Kzcra1VZR2YwMWZwQ1lLVXAvaGxacmpHMXc0ZkpnTm5Fd3g0M2g3?=
 =?utf-8?B?RWE5OVc0L24vdFlsdVIvOWtST1dUZjhyR2h6dzdkdEtBaGlpbTNFQ1ZHeW5v?=
 =?utf-8?B?d25HcWRlZGgvL3o2UDRCSHNpa2dKbjQwaFB2Mjc4cEs2MlhtZ3kwajRkSkl6?=
 =?utf-8?B?L0RUWjdtSTFYV0dhTC84djNqd3JPb1U5UmFFTEZjTjI0Ly9tK0NsSVFTVFNh?=
 =?utf-8?B?YVJYZ1NJWm5OZDBFcnVNRUx5OHZNOXo3L0FDWEZKMUFuK0d5TDIyM3duWnpY?=
 =?utf-8?B?eUJxV3p0UTBEd3hLR2FRNE9hVEszdmpiK09zc2Q5SHVlS2ZFaHZIWHlFT2ov?=
 =?utf-8?B?YWpBY1FkZ2lBZVFvWEpIMFhzcmROVVNGWnp5OVltVWJJY2I4dks2NFEyanNo?=
 =?utf-8?B?MWo0ZStFcGIwa2R0dWpHUi9hcGx4VXE5cXBYM3M2TjBUZkY0bmFpYUV0NEd5?=
 =?utf-8?B?cGFNYlZ0V0NYSG5DdUlxQ1kycVg3Sy9pUEhCWHNDR3d2cng4elF4eDB4NTJI?=
 =?utf-8?B?Q1RlNFlrZFBpbHpaa1lBd0dCTHVJZVMvY3Q1VTdMMkpsVmpJYjFQYndKUlY0?=
 =?utf-8?B?dWF5SktOK1FlVVd2VDBocmhQMkkxTENzaEllTzNQdVlUOE56RjQ4U0JqOGVQ?=
 =?utf-8?B?Qk92Wms4SUZCNDJWNmkwaWlVUkN3eGhUZENKdlp6eFprZ0k0WHN4aUdWUFdF?=
 =?utf-8?B?Q0dTcHY1TmJDU2t2SlJQY09qWno1dm40Y1JHeHlJSUEvVDBXdi8xRGpzYXJn?=
 =?utf-8?B?ZkJ6NnhTTmFkaFRFMlJvaWIrNGJDNlVSK3dDVHhUK2JLajczM2EwaHdyNkJ1?=
 =?utf-8?B?V2J4L1A2RlBvZTMyK0Y2VDREYmtVMjdMQnA0WGtUOGlzM2JGTDJYdEdRZjdw?=
 =?utf-8?B?UDBsQW5XYVl0MWVFbFhXQWNjcDFQSUtEMXYxeVA2R016NnVDTjVEUEVhdG5q?=
 =?utf-8?B?RWIzamZTRXdYR3JyYWdiRm4vRm8xL2hDTDl5R2pwVTB3MEtBbnVMQnN5VDZS?=
 =?utf-8?B?Z21FcXBPeDQzK3BmLzJOQ0Y4SjhUU1FnSnR0QlZIYk05TVBJZVJPRXY2Vkwy?=
 =?utf-8?B?STNmb0JkL2p0SHJRb3pibzMvemVLbUdiQ3BTN3dST003N1FxTmRLVmZjcTAv?=
 =?utf-8?B?eUROUE5rWnFBd000ZGxjTlJqM2ZQYkY4RDFubDh6M2dXbzJxZGlUSG13R0lT?=
 =?utf-8?B?elMwT2laSzl2aHRIR2I3b2ZZTHRuK0hNSitaaTd2R1p0dEo0RVZ1UXJZUTRr?=
 =?utf-8?B?K2ZzUTFxK0VzdysycFlTM3BJNGdVR2s4UjdMdHpjeWJKb2NqbmFnS1h6SlBw?=
 =?utf-8?B?MktIK2N3dHB2c0t3OUZWbndpU3V6bmNLc3QwVzhpemVpNHB4eTAxSFZpWEdy?=
 =?utf-8?B?M1NablliQXliNURMaVVtREE5cEJRY2d1cEo2VzFlUlVRWnBhSlJUNlUrWlJy?=
 =?utf-8?B?bCtFcG9HeVdGSUtQRTBiVjdwT0hJanlXMzI0WXc2VHZhS1gvaDRBbkFoNjV6?=
 =?utf-8?B?a09JRCtxVXN2QUlRWmxqTjNFbzViaEt6SXdTNUFmUGhQQVlmZHpuZExWTEFx?=
 =?utf-8?B?cjlnYmIvZ2EzbjFSQXJ5TmhWam1yZkJtYll4ZnQvRXV4ckR0aEtNUk4xWkla?=
 =?utf-8?B?VlNNeHJtNmp5NWpXSlVNMFRjTlJrS0liSDJuR0k0NnM1SGUyUzdQbUZlMUZa?=
 =?utf-8?B?TS9Bb0UyYlYwMUNzOGxycmhoeFM0b0JjZGRSWnZUMEMyb3BzQjdhL2V6R0M0?=
 =?utf-8?Q?lhXxvhzDRZhjcvKfjL/SrRxig7r0e4KK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:28:45.7425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7566635-ae38-4ce7-9726-08dcc7fc37c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011



On 29/08/2024 07:55, Jan Beulich wrote:
> 
> 
> With the original code I observe
> 
> In function ‘__irq_to_desc’,
>     inlined from ‘route_irq_to_guest’ at arch/arm/irq.c:465:12:
> arch/arm/irq.c:54:16: error: array subscript -2 is below array bounds of ‘irq_desc_t[32]’ {aka ‘struct irq_desc[32]’} [-Werror=array-bounds=]
>    54 |         return &this_cpu(local_irq_desc)[irq];
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> which looks pretty bogus: How in the world does the compiler arrive at
> -2 when compiling route_irq_to_guest()? Yet independent of that the
> function's parameter wants to be of unsigned type anyway, as shown by
> a vast majority of callers (others use plain int when they really mean
> non-negative quantities). With that adjustment the code compiles fine
> again.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

Are there any places where we still require irq member of irq_desc to be signed?

~Michal

