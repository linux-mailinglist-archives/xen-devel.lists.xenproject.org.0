Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200E950448
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 13:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776179.1186324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdq9k-00011b-R2; Tue, 13 Aug 2024 11:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776179.1186324; Tue, 13 Aug 2024 11:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdq9k-0000zC-OC; Tue, 13 Aug 2024 11:57:40 +0000
Received: by outflank-mailman (input) for mailman id 776179;
 Tue, 13 Aug 2024 11:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDAI=PM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdq9j-0000z5-0F
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 11:57:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2418::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b9693d2-596b-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 13:57:37 +0200 (CEST)
Received: from DM6PR07CA0129.namprd07.prod.outlook.com (2603:10b6:5:330::23)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 11:57:29 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::50) by DM6PR07CA0129.outlook.office365.com
 (2603:10b6:5:330::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Tue, 13 Aug 2024 11:57:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 11:57:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 06:57:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 06:57:28 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 Aug 2024 06:57:27 -0500
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
X-Inumbo-ID: 3b9693d2-596b-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jymJ+4Tyy5dIsAMswQlh7hFPvz4hQcWUGFR3sa+uQ69RcL+ucmkrc/zHx53ENjp3gWfUheyElN7reB4lL969870CegQpZiTQCVxh2PJtZc/5+h7Y3L54wCeJ9SGBB2sc6LlaLoLJlT54JDPNJzdK/1f9sbkTY+Y4umu15l+ICl50KpcX2vvso2tzfspyUCkyfAxGr5XFG36jCs+Qo7j7nrVSb7Yj0Pb2oPtXUYRmh7+pPT45DioZK51Jynu8YHGnmQ2IFW9sVdWjmaXtrdasGH0TEZd7XwcOM+SlWhIiwfANpmjGX3O5lasVlfjobe6QpWn/d5t7mmF9gLgCWQuTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmZoc6IWSHgbKkmrw1x+dETeDdHC6oQl8M2amGDWB1g=;
 b=iSkHpUkf6V66HKWQaRexd3sJddc7Nq1Nn1etHPtJv39KuwQEfDE/7CDm57bryKdRlzuh5ake74blBZgLJObzBbrprEB8pbpqaKfgWMMFCWQ/OGL19BMK4ARWT9W9XmiEC30UrFrW4qhRpPGM7W+zyhr4BnDm5cZYIV+AyCRttWYiUSWui53G1S6DRfE7dMPHuFzO+eWBOkCY8jAb7eSLlnLiDaUIhYVLQZcr06q1EIrfFikClqahi1WAw4YLDd1qnkRJMISKoOp4agW+1eefT/C02P6Cy6/f57DVGs8PZQwp1yIF6/OVzqhm/LH6Bfryv218RePxlBojnJzTKXr0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmZoc6IWSHgbKkmrw1x+dETeDdHC6oQl8M2amGDWB1g=;
 b=33nzKOdbDBaPEiZnSkJJo2V+1yT8rFk1qs2HwlLTK/x5xGF1JoXeT739F9T76xYV/XCdV8RKNP3wkVcHaXLn6TT8/fjGmU8hWR41lbx7v0zVUguDHCPUWpiTiMq8tPyxpHBgmcdeNbGaFnlY9rX9pPnRjv09Xj8JwDDorfTmbvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <42b02774-c941-4903-be74-d58bf6b93b81@amd.com>
Date: Tue, 13 Aug 2024 13:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Arm: correct FIXADDR_TOP
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <5b097aa2-7ced-4971-bd6e-96618bb6f2df@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <5b097aa2-7ced-4971-bd6e-96618bb6f2df@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 8615068e-ca2e-4fcf-0f5c-08dcbb8f1ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ZhZVlub3VCR29VVFp3WGlISU5WY1ZZL3JaTFdaRnQxZmw5TnJpc3R6Sk9j?=
 =?utf-8?B?QUpYUldNRDJkRE9kWUtvbUdXMnU4R3N3RHhmc1FyazlINjA0cFV5b211VHJX?=
 =?utf-8?B?NWRtakhSUEZmUUVWZHpLNWF4V1pNakxLa0pkMFFTWkRUQjVJNW9XS2pjdWZx?=
 =?utf-8?B?Q0g5Z3NzcUtFT09TRGMra0RraE9QbVBvaTJMMk50SWpzYU5pOGlVQVZvRFBO?=
 =?utf-8?B?cTJSbXhKQ3hoS0pKQWVQWXB1N3Nlem10eWtreWRnQVRtY0VBelNBNkUxZmVp?=
 =?utf-8?B?Zyt0cXZ0dVY3TXd6OUxPSHg0N29NVktmbmFTQVRHcmttaGFYL0xEZi9uYldz?=
 =?utf-8?B?akNCLzJ1bVJpcWkyME5ITmM1T3dYM2pIa0VYVlFRWXg3a01YbmlsL1JHbTBn?=
 =?utf-8?B?K1ZITnlCYmZVR1ZwVWNQVk1peVNlbStVR3hKckUybkY0S2VSaE5sc0JSbi9h?=
 =?utf-8?B?NFpVaHZtb3c3SmppMEhSVmNBeWNUNUFqU0VuSWNyVEJNNTdkODdDaVNHbmEz?=
 =?utf-8?B?ZVhvdE02dGkzeFZmTXBFVlJPc2MwQlppZEV5VitELytxd2pPSmlNSVArYUxB?=
 =?utf-8?B?c3d1WGZlYkhXbk0vQWNucUNvY3Fib2dhQU43ZEZzd0lHL0RVaTRTRWY2T3Ns?=
 =?utf-8?B?eUZ2MTZQRXlzN2luUkFDcWFDZElwTUZkRkpsYWcxSEhwemJLbk1uRk9aVFJR?=
 =?utf-8?B?MnEzWVZYWHJvVWJXVDZZTkpMVUJDam1PN1VOVTFJdTdNTTdFak8rTkdPdHBX?=
 =?utf-8?B?YUdwMFI4VlJ0eGRxbTA0TCtxeko2WjRSOVFXUEFIZTZPMTVFT0ZnNit1S2xy?=
 =?utf-8?B?WTJ2YXJFRlFFTnFBeU9kRkFnVmxtZjN0SmlueDhKZDNxV29nV0lGMUVUMlda?=
 =?utf-8?B?WEJBMGZONDR5d09rRVlZNG8zUGRDR2dlWmNuZTU3Q3lzdnJuZlF3Y1NLeG9m?=
 =?utf-8?B?VzFDUXpaRlRicFIrdTBROFExeW91YkNseFo2UEhUYXcyaU5NYjJ3b0xuWm5l?=
 =?utf-8?B?TDlTa2o0Rk9UdU9tb1lFeFJ4ZWtPVStxNll5V1BFUHFJM253OWRncnJ4M2lF?=
 =?utf-8?B?b21FaVlLbGRlTU5nbGlTU1lYK0J5eG9MRG9UbzBLMjVlYWMxWTViZitPWUlJ?=
 =?utf-8?B?U3JzOGV4UC9TT05JMCtlYWpEMGJTdS9uMi9uTlVFTG9Yc1g3Z05hTVdGekNM?=
 =?utf-8?B?Y1cvMHRGUllGNldFaGx5NnI1YXdkZFg3UWE1TDBsRGlFRHh4TmVNOXdaa3hJ?=
 =?utf-8?B?dmNqeWI0MmFLYzJtUklpUXd4eUl6Z1drUmlJNXhnOGZ4ZUFyV3ZweWI0UDZy?=
 =?utf-8?B?OGx5T3FMazZFYXExMVJ3MUhWK0VDd2ZySG1zb0dxOTZnTStqQjc5UlRwTjBo?=
 =?utf-8?B?UkZCR1k3b2J5cDFmTTgwaDVDa3YxS2Nxa2ZkaFF5MFpJUzUzanFLK3d4NlRL?=
 =?utf-8?B?ZlhIL2hDdE1aeGYydkxTNHUyUUtxYkxXYXE4SlRHQTJEcEtGUFBidDR5NUIr?=
 =?utf-8?B?dkJySUtKSXJCSTlzRklmTFZSUjhEYUpvYlRkQ1JFRkdMTEJSM21CdWZWdUQ4?=
 =?utf-8?B?N2NhbE1RN0NETmErRHdHNUV0V3hhVU1ud2V0YWZpaWdtaGFaMnJDc0hZZEQ1?=
 =?utf-8?B?TXpMUUViekZXNlEva1BXUGZTSnhDRmNqME9KMjFhVVUxL0VRYkxMOTEreWhw?=
 =?utf-8?B?RnNEKzdoWmlyTWsyejBaZjlJNkcyemVpdElaME9pRk1wRS92VEh1SDRuTTJy?=
 =?utf-8?B?SHlJKzR1OFJNU2hQVVoyci81VE5OL01JT0NIV2JodERUbzY2YURQZnhrc3Nw?=
 =?utf-8?B?WTNveFExNnlNRnJDclR6dlF3bXoxWjNoUU5uZHJLaWxyRERXNkFsdlJuQW5M?=
 =?utf-8?B?dVAzb1NsaXp5NmdMWEFndE1UMURXVjVBZ283T0hLbDBPS2lDb3VKdWF5UVRT?=
 =?utf-8?Q?rJh6LOtKFAUqfTueKeErhVLq72swZ/Xv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 11:57:29.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8615068e-ca2e-4fcf-0f5c-08dcbb8f1ba4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089



On 13/08/2024 13:49, Jan Beulich wrote:
> 
> 
> While reviewing a RISC-V patch cloning the Arm code, I noticed an
> off-by-1 here: FIX_PMAP_{BEGIN,END} being an inclusive range and
> FIX_LAST being the same as FIX_PMAP_END, FIXADDR_TOP cannot derive from
> FIX_LAST alone, or else the BUG_ON() in virt_to_fix() would trigger if
> FIX_PMAP_END ended up being used.
> 
> While touching this area also add a check for fixmap and boot FDT area
> to not only not overlap, but to have at least one (unmapped) page in
> between.
> 
> Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


