Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB67B33E58
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093052.1448630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqViC-0007bG-F1; Mon, 25 Aug 2025 11:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093052.1448630; Mon, 25 Aug 2025 11:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqViC-0007X9-Ay; Mon, 25 Aug 2025 11:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1093052;
 Mon, 25 Aug 2025 11:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8CB=3F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uqViA-0007SZ-K7
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:50:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2f5aa5c-81a9-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:50:04 +0200 (CEST)
Received: from SJ0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:a03:39c::23)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Mon, 25 Aug
 2025 11:50:01 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c5) by SJ0PR03CA0348.outlook.office365.com
 (2603:10b6:a03:39c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 11:50:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 25 Aug 2025 11:50:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 06:50:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 06:50:00 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 06:49:59 -0500
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
X-Inumbo-ID: a2f5aa5c-81a9-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnZrLB5XdPXM27x92J9QVeDRDSN0MMqIWA8iw3rVV+5qTaxgIk5a3h6zXEk1NfSRXh80V5sA03gzE+XfIb/x4WvAMh/NlA/NBggjlGi0TABUDNx+AiUO43nUyIh3gfbHrTlbEi8X1gBis2U8ZQku50SUOgjvppk6mjGpo5Y0xMxYoATP34Gcd8RHR5h+OPI4J++Z3qZOoa1NvoXsfdKQLJ4XuDee09Izan8uWYss5BxOam5+Zngjwv9vp6JQsEdbPq0CCXAtNI6Rli+xqJi5DlhBotrb2HVaJeGAC4xzQMtUZQUm54u0T3Qodjc0rlhtl/v1UjGR1T3MNn+DpO4dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENBro5P2W8Xr/J22F5UVkx3ik5KVgbJX9nJoDlKSRAU=;
 b=D52SzxYUB0Kl0rpoK+uEXAMBPJrEb62e6hycT44SMdLn3s6R394Gd5Doz1eDL6YNlpPmgLtZF49mdU7xp+ZKENeTTlIwYb9AdU95Tw79p9Un5IOKtu6IygU49jrKybeffzvc7ZDTBUhvsiY9zdOiNlTFCfmNEBS+clIR4aQ7r0Rtos0BIQudf0QVx3TqJCEvjILj1g+/nJeh6zlOYOCB2Z78VLyHzeEMmIf9IQHPuKqBjfbXQnKniyhzNfSD6md0/srK3WN5v6MI+W++OXuIgiqrFDbvtJuS5+P2SJjUbCfZJsl6VgyDDBQKiovZWv+ZJjsHaf2HU9P0izOiTjelgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENBro5P2W8Xr/J22F5UVkx3ik5KVgbJX9nJoDlKSRAU=;
 b=lAWL3Zl8KEbrxDFtVkChqXsLrJZXMhFkAnqEkw0H6ywnmE93cOvQL80BpEzdRuurn2MzKlkrEIXBWkK/w77uIjnJ4p9UKuX9yqt2osP6PpGuc1lX1Eu5tImHRh2B8Cvk3W4SNz1HCAmcCgbv7LShN3ekmf8uC2wpLTJtm44CKxA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5f0c13b8-ea3d-4893-94dc-4a44a29669e5@amd.com>
Date: Mon, 25 Aug 2025 13:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm/platforms: fix build with gcc15
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <0ebb4f2d-31b6-4536-91fc-75b5a9aa7dfd@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0ebb4f2d-31b6-4536-91fc-75b5a9aa7dfd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: c23834d6-ac54-4e10-ab99-08dde3cd85cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0RhZkhST0puSklvUGVUVnFwbHhBSDJzWmxxNjRnaXZ2OHNzUHlHbE1MQktQ?=
 =?utf-8?B?TTBIci8xSUFiRFBXNWRsWkRsNSs4ay8wbTZPMiszTjc4Zkl4WmU3UDg5K3Bw?=
 =?utf-8?B?U1F5ZnNTckRFU2lWWnF6UzgvZFFSVDhhZXgycjV5MTkxbHo0a1VqSmtFZEl6?=
 =?utf-8?B?T3E1SXIvTDNCY0EvQ1BuSDlWKzd5R01ZdURhM3g4amlRVGNCOUo3N3lMVHhG?=
 =?utf-8?B?UE1SejllTUxYdElyL0kzcHdlaHJlWXQxb2RQbTFHaGdrcGNydDloZG1BMVJM?=
 =?utf-8?B?R0o5a0VRU3BRRDFrMGo5bDRDbHM3eWNFcktZVzAyNFBjUjI3bVkyNmR1ampw?=
 =?utf-8?B?S1A5Z0FHa0xWTlVNT1hUV2E4bVFYQld0bENtaSs3MkRmUGVDVkJyWGxsa1ds?=
 =?utf-8?B?cEpzM051K1djSWZlQVZueHdpTVFpK1dIZERRRk9vSVJZd0IvUEZ4Q3hsQ3Qx?=
 =?utf-8?B?Wk9odUdOeTNYNy9FdTZGQS9oajZUTm5WQXBteWNodXo2cnRJQ1VPdXVyNzZj?=
 =?utf-8?B?MkJDRkxaZWtEcFZKc1liYUk1VmxFWlZnRFJ4bkdGYmwzU2l6V2puMTJScjVX?=
 =?utf-8?B?MVArcW53OGtSOU9ubTN4QUp0dXNUcmNWOEdISGc2Vjc4bWtzTTlJejl5NVIv?=
 =?utf-8?B?TnpXemFJdm02bm1mMUZSVTJlejR2ZWNlOXB2Y3hWOUFMNjR0WFY2cy9BU0Fq?=
 =?utf-8?B?SWhpeitoNXJCTDdRRnhZVTlua01sZFhyN3NKUXZsL0hoL3NRQlhoS2c5dEtB?=
 =?utf-8?B?U013eVRFS1JQTlJwUXNNTXBKUWl1ZXJ2V3FhdGFZRTBGRVhWOGZVdWYrdmlq?=
 =?utf-8?B?SDMyVHdlMXltS1NPVXArQkpXdko2eDg5Ymc1OVJDdDNrTnJUL2RWRFBabnNQ?=
 =?utf-8?B?SjM4N0gxaVNoNUV4WFpEcW9xRkllWFY2eWxJZjdLRXM5R215QTVQZzA3c3RZ?=
 =?utf-8?B?cTlkVFVOZ2pQbFBrdjlDeGVQZERGQmNHU2lNTWl5Uzl0cXN1WFBiZm9Jd1Nt?=
 =?utf-8?B?S0hWVi9tOTNvRit0bGU2VW92aDRtbWZ1eU9TR3VrM3lHZlRHZE5hRWp0V0hv?=
 =?utf-8?B?T1RIcnRxd2tJS1lmMHhhSk9HOEUyRFVDcUpHSmZEVVhSZVVRSVRpSTdXMTR5?=
 =?utf-8?B?dUlwNzlxOWg3K1JRNUhJekZkOUVReWlBUWtkdW5ZTWNBMHRZSjU5U3E4dWt4?=
 =?utf-8?B?YkdaU1g2MmRlazRYRVlqcEhWcWp6QUNmUktYNEYrbGN6NkNXOHg0Z0lMa01y?=
 =?utf-8?B?b3ZocEJocEN5bzI5cWZKeVhTTVNOcWoxOXpKeHJkYlRlTDJjbFdXRjYxQ29P?=
 =?utf-8?B?U2FZMHE5blFqMktXYTBPRDZYSmxaTlZ5ZmF1OHVBeGdzYU5qQnplVjlXa2pw?=
 =?utf-8?B?d3RsMk1MNEdEaXFEUGt4ZWR0RDM5WGx3MFNMZVR4cHVJKzFOQTFyK0RobkF3?=
 =?utf-8?B?N3p1dmw2QVh2d29JaUNiZ1dla1k1SmhvOGcwYzk2QWxWTVhIQ1lTVXNBNldk?=
 =?utf-8?B?djdTb0tqWXBHNUUybk1xZzNOdXd4aVh6azBwZVVJV3VieGRxZGNzZmoveHkr?=
 =?utf-8?B?dG00WTdLRGpQZ3hndjVWWVRHRlpHZ3RxYzk5KzNKV2RpSkxMME55UWdRRU0x?=
 =?utf-8?B?ZU1pcTVsYTVvK0ptY09URDNWeFcvNHZBaTJ4aUZFTE1UUFd6SHFPRVF0ODZV?=
 =?utf-8?B?YmtJdWtDWlZYeXhnYzNQUnZzanlwTDZmNnUxeEthM2xyeGR1cy9Eejh5RW1W?=
 =?utf-8?B?WXhzOWdYZGNlbCtKUk9CSkp4VDQxTkxqdXRlYkgvMHpGUVU1TDNGakMwZm1l?=
 =?utf-8?B?YUttbnMyT0s3TGFlOTMvS1FoMHJRSnNheER2Z1k1VWtNMU9jc3Y0YXZQNnpx?=
 =?utf-8?B?TlhsdUROaDdGc0dKdU0xTjlTYzRLQlpKYms0eExHdUdsWFBXaUZBcFhqVEl0?=
 =?utf-8?B?YXVWUG1Wejgzb3lMdGY2WTN4dVlLZzBJb2lBUkZJYWIrMFlRSkl5SDVyN2g4?=
 =?utf-8?B?RHpuSzNlcnJDcldzMkkrdjJUZHlsZHF6YStXLzc0Z0dZRi9wczZCNEdMd2Rp?=
 =?utf-8?Q?BcGIqr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:50:00.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23834d6-ac54-4e10-ab99-08dde3cd85cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428



On 25/08/2025 13:14, Jan Beulich wrote:
> For two of the headers gcc15 complains "header guard ... followed by
> '#define' of a different macro". Misra certainly wouldn't have liked
> this either, if these headers were covered by a scan.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


