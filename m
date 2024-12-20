Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEA9F8D4C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 08:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861629.1273600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOXVF-0006cr-WE; Fri, 20 Dec 2024 07:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861629.1273600; Fri, 20 Dec 2024 07:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOXVF-0006Zz-SS; Fri, 20 Dec 2024 07:32:53 +0000
Received: by outflank-mailman (input) for mailman id 861629;
 Fri, 20 Dec 2024 07:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djjC=TN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOXVE-0006Zt-60
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 07:32:52 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2405::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d6fb508-bea4-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 08:32:50 +0100 (CET)
Received: from SA1P222CA0043.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::17)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 07:32:47 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::4c) by SA1P222CA0043.outlook.office365.com
 (2603:10b6:806:2d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 07:32:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 07:32:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 01:32:46 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 01:32:43 -0600
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
X-Inumbo-ID: 9d6fb508-bea4-11ef-a0d8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxNPFgsauePVW0vzuiU3pGnuKEaYaYH3izg2OvoCKN4eb8K+/7wh7ULxCrxJ8Qh9DxcEOwwZEAMqI38UmFEOaku2MS1TT5LH4y0gQ4hKM5c2r9Nvg2Cx9C8ZZmu4U1Psq2rYWuw6ogwgPGOkZQx4hbhQdx2juXiFrNDs6i5wr8HbxrPkDUUF1EjuyqgotqOSCScrk5aIhuVUhTy63D3VxfKKc5AR0NqGua+H1pL9kRcsvBQ51oceu9yIiVMZQ46okhvYFehMcnieenzdRXTmvzaU/tL1bhCibgb07Fr0AqgGgx4IOkh0y9VZSpiLDjYaGNXfb1L+qX2h42DlD/vvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wn0j2ifLlH9A9NOXGHhC/TuPhOJHo9dP+Mts/DDRek4=;
 b=JAfFaKjWIDk8LxABN/f3jsqM27vig3mHZQA3JQAIgaEfPPHV1zNJFEiK55Pgkj1vtN48nTwwj768OtrcJPSDvVx3Pq2/aZB+3UIJIAkcmBCYVy6xE5ol46UnJ2BEtBf6B2yBXVMSJ6nBoTNxZ4fzE7YFveKj7X78xR9mADChFtsXhT78maj2TIrcp7b5GSMDTEejDSyyc7hA/j7592mnLD568Bdmb7HaSq5dgPAQz1PH0QXm2sUtgXU30nC2eGDEQgkx3RVLMwoZGMcdNojj6/2YmUQRKzroh9lj2ipdbBb5E7FqKrZnCzFciTR0+fibtlEddtsbYHwRHDfGPc+vaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn0j2ifLlH9A9NOXGHhC/TuPhOJHo9dP+Mts/DDRek4=;
 b=Nn0/rt7noTpEw9AX9FFxTWWapG/y2cLXjuUWxw/iiof+hPJv2OBon7qH+JZv1dGxcvETBTtCnFRgE0G07aJgccrNNZQbGiG6600Mt5/nrLT5B6UNDUSCFHvLpdeUm4wV1bbAC3i9VKiFBGjoKaa8XOrWs9Gn0Vtz1SySeLzCYuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1b85e268-a06b-4e40-b652-99ffc874e10b@amd.com>
Date: Fri, 20 Dec 2024 08:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] xen/arm: Add support for S32CC platforms and
 LINFlexD UART
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 03409c1a-e05a-4c30-6efe-08dd20c88002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2hiNmJPZzNlRkdNMHlKbUd4SjBhay9MSDZiTDFHUkZZaWkwWldQU3ZOQklP?=
 =?utf-8?B?a3RYMTV5RWtsb1hnS3Q1WGhVbklJVFpJamM1VmFFNFMrMW5BaFl6aU56aVRL?=
 =?utf-8?B?alE2NFprcTFyZmI5OGlZM1pIK1Q3UDc1ZnNINmtKTG5aQzhLWWZSREY3Vlhz?=
 =?utf-8?B?cG1VMlFvT1BvUkhMaG9XNkd0bEVqN1ZMMmtzV1BJMFlYMWhKZ01qdmJHTHRG?=
 =?utf-8?B?M0VqYXYvT0hMclk4Mnl1NUsvSTkzTG5od3IxWkdLb0tyUlFrL2l1T1BrditZ?=
 =?utf-8?B?dlRsdm1maTE3dkFySzhLdW1ZTlk4UFBIa1IzUy9yMC9nVEhPQVJwL0NFUFZT?=
 =?utf-8?B?Nkwyb0g1SzFvUmxPMVVJYzJSR1JidXZ1ZWY1VlVjazByQU5YRXYzVXdiSUxI?=
 =?utf-8?B?djNFYXVDc3p0MEQyQ1pwaHBjOE01RnBMT1FwL1RUMS9oWVFnVCsvSVoyT1Bu?=
 =?utf-8?B?STJ5ajNacHpHNkEwWllFY0Y2bUdOUGRPRlkwQndKZnZOUEI2UERDZVVNOE5z?=
 =?utf-8?B?Wm1laGJCNUtIcHg5aHlTZGNOUGh1V2xPcWdCN2s5VXRmY3YzbHRDWitabnVJ?=
 =?utf-8?B?Y3ZxNFZ2SlRNRGl4VklHRTFzalNXWGkyK0pmOU9rUDd6b3hOZGxZN2IwaExm?=
 =?utf-8?B?YlhaWitsK0R2WWNuUXdGQXE2SGxLNTVBZ1JWU2RnRnVpYTVVQk9uL0gxeFVu?=
 =?utf-8?B?SmhPQXdMb2p6WlhwM2hUNUhRTkdWRTlLWksyT2NwaGhWRG16Z3ZzRUdNNFZT?=
 =?utf-8?B?dEhsZFJlZklFdnJYMXVxYTFEOHFuOExOV25rZVMzTW9Fa2RRWkJ3T1I1cWho?=
 =?utf-8?B?VE0xNGxBZjR3ek55S1pXWmVOMG52MzUwK29veGZxOHRHOHZ4MzFQbExnRXFm?=
 =?utf-8?B?ZDFCK3U0ZFd3cmc1WGtqckk4RXRaVXhDUHlIS3ZQeDNsMHpiSjI1SW5HenhE?=
 =?utf-8?B?VW0ySGxwbTlWNWhROVErT0d5TC9TZUlsdFRjYkRWeWlsRjUzMndIamV3SHEz?=
 =?utf-8?B?OFBWN3JrcGxLZCtCcHZMYURHeDVqWDl1eEJJd0JIL3pDVHBlaHJyd3VtOXpp?=
 =?utf-8?B?WkUyUlVmRkZETFcwM0xPZUVUU1BTOUhjd1hJTXl0UzVvQXJNMzI4cmRZZWg3?=
 =?utf-8?B?NmNvaUpSbHYwazNGeVh0UFJjNjhXNElocWNOTGdGaC9kZ011Rk1jRnRoOG1P?=
 =?utf-8?B?SEVvMzgyajhYZXhMeWdwZjJXVTczbVA5RU9iZzlYdTNteXpJZUhGVzRhcDY3?=
 =?utf-8?B?ekF1a0d4cXYwd0V3Y3dyN3BuS09obkhpNHh3SkdiTk5yZSs4Z1Z3ajVvdzk4?=
 =?utf-8?B?NStsY0EyYldDazd0Zkk3dkRuSEplOUZ1elJGNCtvS1R6YjlySk1sR0xqVFdB?=
 =?utf-8?B?VWZXdThBVkxxeisvNnVMS3p1eFlCazB3Ui9ZRlVoQ1Z4SzYrQTI0eWtBdU02?=
 =?utf-8?B?VitCQVFKQzM4ekwxK21uci81TVJ0Ulp3NkdFRk9Wc2ZOOUhUNGQwTmZBUkRZ?=
 =?utf-8?B?UUZIK0V4TnNvSEE4a0hzYzcrODJtb1ZWTC9FOWVQeEZIQmsvNGx6am5YekJU?=
 =?utf-8?B?Tkp4ZlZrU21tWjdZd1R3SlNkMHFWR1ZySjlMZU5aVlNuUGtERnJoWkRWM1Y1?=
 =?utf-8?B?eEpya0FsbmI1YTJWV1JHaUlUVTlOdERHR0FyR3p2eW9jWmFzVjJQVTlEYXFC?=
 =?utf-8?B?anAyVHZWUVVYQjhvcGxLY3hwakhSVGtBN2hQN1JONWlyV2VocEYxaVNxTFlV?=
 =?utf-8?B?c05hZ1I0dWtGTzl1THRqbUVIM2hlSGJoenoxYk9zc045OEdxaFJmeXBETld2?=
 =?utf-8?B?cHZGRjE4dHZtYzNNWXpkVmQyaDhjMHdpcEZGcEJhOEdBcTY1WGsybDNwcmVC?=
 =?utf-8?B?cHpldmJrTHEyeUxDTHhKNnE3TmpMWi9lbXVHU2dtWkUvVm1wYjZmNXVBK1ZJ?=
 =?utf-8?B?Q2NhNGh6eTJ6NElac0ZrWFZCZkFVUG5pUVlKaVM2VmN3WCtMa0xqeCswNEdu?=
 =?utf-8?Q?QtnpHxeadhADE4gT8YuS+0eHUPlRok=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 07:32:46.8732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03409c1a-e05a-4c30-6efe-08dd20c88002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236



On 19/12/2024 12:23, Andrei Cherechesu (OSS) wrote:
> 
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Targeting: Xen 4.20
> This v4 version of this patch series finishes the work left to support NXP
> S32G3 Processors [0], part of the NXP S32CC Family. The LINFlexD UART support
> patches have been merged in v2. Platforms using S32G3 Processors are not
> affected by the TLBI by VA erratum (discussed in v2), and are security
> supported without a workaround needed in Xen or guests. The workaround needed
> for S32G2 [1] / S32R45 [2] will be addressed in future series.
> 
> The 1st patch introduces a generic mechanism for forwarding SCMI
> over SMC calls to firmware running at EL3, selected via
> CONFIG_SCMI_SMC. The 2nd patch refactors the SiP SMC handling in
> vSMC mechanism, to rely firstly on `platform_smc()` if implemented,
> then on the previously introduced generic SCMI handling/forwarding
> mechanism.
> 
> The 3rd patch adds S32G3 platform config to enable the required drivers for
> S32G3-based platforms.
> 
> The 4th, 5th and 6th patches modify the CHANGELOG.md, SUPPORT.md
> and MAINTAINERS files, respectively, to add mentions about LINFlexD
> UART support, S32G3 Processors support, and the new SCMI-SMC layer
> introduced.
> 
> [0] https://www.nxp.com/products/S32G3
> [1] https://www.nxp.com/products/S32G2
> [2] https://www.nxp.com/products/S32R45
> 
The series is now committed. Thanks.

~Michal


