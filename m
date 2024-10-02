Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293A98D693
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 15:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808792.1220807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzbw-0001mH-1i; Wed, 02 Oct 2024 13:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808792.1220807; Wed, 02 Oct 2024 13:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzbv-0001kV-UZ; Wed, 02 Oct 2024 13:41:47 +0000
Received: by outflank-mailman (input) for mailman id 808792;
 Wed, 02 Oct 2024 13:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKgj=Q6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1svzbu-0001kP-Kg
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 13:41:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdaab1f-80c4-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 15:41:45 +0200 (CEST)
Received: from PH0PR07CA0051.namprd07.prod.outlook.com (2603:10b6:510:e::26)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 13:41:36 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::46) by PH0PR07CA0051.outlook.office365.com
 (2603:10b6:510:e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Wed, 2 Oct 2024 13:41:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Wed, 2 Oct 2024 13:41:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 08:41:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Oct
 2024 08:41:34 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Oct 2024 08:41:32 -0500
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
X-Inumbo-ID: 0fdaab1f-80c4-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIsBVZPGf3ZFKznco2wv+nJYU1sAd4rwsiPolXbHlEIou2H3LfJTw5zMD0lgy7uLqDBrEK4UpwSVtEGacJBNpt5JVfNGjI+l/tJhLOW/Rxk9/F+uvljmGjzx49C1j4lhLJoOUysLY3o2OTuhGF5aI3B4uI55ZYcmwFyGyMG1NrywgtG6HR4JTFBmCEj72QxpFsils4i/bIOH7sEJA5H3l3pZ3DX/uMDhnbjrG21YQWGVfgReIFwmdKSvK8c2GwOU/PKx+Knt+xnsDoj6BmmRjbBTpU9+ZVwH5qA8M+GuIY3UHUkry0XwwHXmZM9tADqu4udMnqN2XIv/Xp+eTKjY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVJo00h3ominfYVlQ3abMRqffcTEP869XveZHmn3nKE=;
 b=DiyebR3vTvYxPnyySl5/sc0RgJ83HgrmxNU0lwww1o2nOQQEV2c7aA0ayWQ7NsL3S6+LnhhSomEt6E/B7XZyDzEQNNFuU62rzO/waAO6anEgiWrRnStBzTvMT5B2HGlEVuGZymkiBZaRggFw0Nkt0Fktc/90sOndOndiwHZCfNpxG3k7+qZ83XFDzYhOUNJs5Wr2Pq5wmgEwWt1O/TIwXGvHQJLevdb9V/PksRmmNUdcNwUVjKdBIRd/gCc5Y/40a/NGkTus6kM7AoYo0BpybHYxrbIBHrNFH7nVyFEjqHaGbhylGZc5ae1+Feveg+m3SOG4k7d/ZNDheXWURB8zwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVJo00h3ominfYVlQ3abMRqffcTEP869XveZHmn3nKE=;
 b=yUlqJQyf/hUXxj5qBid5DMCwW4OHkeNcqb7vq/n9ihTVI51rPStIZfSciNZmWtsoK+R+ojIJLMfgv6zjCaMVYxE0olUSYMqSinTJFjx2S6rjUgYSwxqY+KWy+MsskNQxjqtiIbyvW4P/giWsy8K1YqnfjpKt/S0hRSmBmaIITwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1c930c7a-50a4-403d-a867-b569e1efced6@amd.com>
Date: Wed, 2 Oct 2024 15:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: move per-cpu area management into common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 31384350-8ffd-4550-24b8-08dce2e7ef5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0p3Mk1UOU10b1YxaUw4SmpJRXFpZSs0eERSMEczS3dReUgrVzAyTCtZNVo4?=
 =?utf-8?B?Zko2ZlRZbnZmTDc5cVlaU1hERHo3cVB0aHk4UkZoSUpPVEUwL0ZieHhXaHVm?=
 =?utf-8?B?Uk1hYnRZUXRROVNjNWRiQlBmMFY4WmxTYXc1eExJYWJpVG55MWpnczYyby9C?=
 =?utf-8?B?SHRSVHkvRkxqSzFvRUh4V3kyY3g1czVibFVTeHBaTm4ybEdKT2hjUUdOc200?=
 =?utf-8?B?Y211M1pKUElZNitabkJ3SklPZE5oeWNlWUIyQjY3VFdpenE3Tm9NYUx2VExB?=
 =?utf-8?B?R1MxRXFkNnhhRjZwMkJzT1VyMHFMWjZhTzB0aG1ENFNUYzBRM1YxekdIVC81?=
 =?utf-8?B?azRhN0FtbHpad0xUN2VFMEd5R1hFaUs0cjdwUnUvc0d5VHhRVVd2UXhKa2Uv?=
 =?utf-8?B?QjVwUlYrMGZqcEU4c3E5eER0NU8ySzk3bVFJKzRkbkd6RktKM1dqZis2RHlJ?=
 =?utf-8?B?WGQvSERma1JRMk1wdDVydTZpR0M1UFRVYWVzUFM4UHFOQ3czaE5Ed2E5bE9H?=
 =?utf-8?B?dWx0cVBnVHpBRm5Xck53dnRkREp3OVVvc1ByWkpBUzQ2OFlDOVdmRk5XZUxS?=
 =?utf-8?B?UlFMOGxJRitOS29rR0xoR3YvL2RoNkxDUjRGeVFJUDBJcVJ1N01EVnM4MTVn?=
 =?utf-8?B?WXVjeUc2dFpCQ2VvSENNZEJxbCt3SEplS1JVSklmT1BrYmxhZ2hnWk5PK0Mr?=
 =?utf-8?B?K0h6MW5FRGpWZU9zKzRYN3licWtBMWY3c2JLVFVTT2RMV3FZSmRUUWZVZDcy?=
 =?utf-8?B?WmIzWlprYjdRbTd2OFlOUFRKYmV6VXA4Tm9sNDJEKzBLcEdPN3FHM0RsZUt4?=
 =?utf-8?B?elNIMFJnUHowUmVsZ3E2S2hEQmJWejBBdGNmMHBmVHUyQnFDUFJRcmErVjBI?=
 =?utf-8?B?enNEZVJabisrV1BKdFZjNUdqWlV4YTczQk9KcllVY2I4OWpwZmVHOUN5NEhy?=
 =?utf-8?B?K3hzZG1ZdVBRKzd5WmR6OHN5NEpTa0ZmbHZiSEFBWUY2a2xOZ0dFRFJMMUt2?=
 =?utf-8?B?em04cHlhTjNMN3ljei81TFNybGtXcWRpUUZkZDVKWjZtdC9uQnJ0ZDZyRGdE?=
 =?utf-8?B?Q0JhNHZzWXMxbkx1Rjg0QVZoT2g5a0RrY0pSS1ExQVVPVDNaUmRuOFg3Q21k?=
 =?utf-8?B?TTJzUnY0NXI2ejZmRDBFcDgwL0tXSmU0dDBVSGtTbHE5TVNha0hyVW9hL3dq?=
 =?utf-8?B?aGJxZDFva05Cd0taaG95cVVGUjhqRFpTUTFRNnpPSTlBVS9hRHhvRlpTcnlL?=
 =?utf-8?B?YlZzVFpMMm5jejB3Y0ZTclYxK01uc282V1AxbkR4ZXJmWDhtUlNuQWV6ZWNh?=
 =?utf-8?B?RXErOXVuMG82Yzc3UW5DdkhWOVVBZWZkSDBKM1liUktEcTAxOUxPVWRNdXRa?=
 =?utf-8?B?SENrZm4yQkhHWkR5dzE0UW8ya0N1VWpxQ1VmSXlmNS95Qjhuc2dVcjk5MVJ0?=
 =?utf-8?B?VExCeGhNQmxOR0xTcGRVanlvT0o0Mnd4MlIrSmVFY3VuTWlRUjZmUitQT1Fk?=
 =?utf-8?B?MmVrNEpjdjVZRVBDcHg1emRRNHloTDZmYVlkcWJJRXNZYjhxOThpU2xGNklK?=
 =?utf-8?B?ODBzeFBmTVlpZ2ZtR0xHSG1hVWhzSXo2ZVZiaUhiRkZ1a2pzb3dNbm5QZkJK?=
 =?utf-8?B?cUdjVXRWVHV6UVJwbzdJZC9TSXZtVFl5aWJWU2hRZkczRm9KeGlPZTVnK3Ew?=
 =?utf-8?B?NzkwY1BSMmJaKzFyWHVucXFTZmtlNndBc1ozeUhlMXBFamV2T292Ulk2VE55?=
 =?utf-8?B?eEdLZTBsV1NlQnNNQTE1b0NuTXRvbEtrdFlGcWxXQUtGYWVlR1NoRGZsMHQr?=
 =?utf-8?B?VlhSSVIxYlZibU1RTVZOa2ovSHdSd3dMQ1VLdkxPVE1rK292YTFacC8rc0JZ?=
 =?utf-8?Q?/fX8v2oNlHUve?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:41:36.0233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31384350-8ffd-4550-24b8-08dce2e7ef5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432



On 30/09/2024 18:39, Oleksii Kurochko wrote:
> 
> 
> Centralize per-cpu area management to reduce code duplication and
> enhance maintainability across architectures.
> 
> The per-cpu area management code, which is largely common among
> architectures, is moved to a shared implementation in
> xen/common/percpu.c. This change includes:
>  * Remove percpu.c from the X86 and Arm architectures.
>  * For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS_VAR.
>  * Drop the declaration of __per_cpu_offset[] from stubs.c in
>    PPC and RISC-V to facilitate the build of the common per-cpu code.
> 
> No functional changes for x86.
> 
> For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
> percpu in the case when system_state != SYS_STATE_suspend.
Behaviorwise there is no change for Arm given that none of these actions can be executed.
That said, by looking at the code I realized that we never call CPU_REMOVE so it is effectively
a dead code.

As for the change itself:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one question below ...

[...]

> +static int cf_check cpu_percpu_callback(
> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_UP_PREPARE:
> +        rc = init_percpu_area(cpu);
> +        break;
> +    case CPU_UP_CANCELED:
> +    case CPU_DEAD:
> +    case CPU_RESUME_FAILED:
> +        if ( !park_offline_cpus && system_state != SYS_STATE_suspend )
> +            free_percpu_area(cpu);
> +        break;
> +    case CPU_REMOVE:
> +        if ( park_offline_cpus )
> +            free_percpu_area(cpu);
> +        break;
Aren't we missing default statement here as per MISRA C 16.4?
I think we only allow to drop it for enums.

~Michal

