Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED749B4FDFE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 15:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116941.1463163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvyii-0007yK-Oj; Tue, 09 Sep 2025 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116941.1463163; Tue, 09 Sep 2025 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvyii-0007vq-Lz; Tue, 09 Sep 2025 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1116941;
 Tue, 09 Sep 2025 13:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOFH=3U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uvyih-0007vk-AM
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 13:49:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2415::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f9c3f2-8d83-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 15:49:12 +0200 (CEST)
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:49:09 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::c4) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Tue,
 9 Sep 2025 13:49:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 13:49:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 06:49:05 -0700
Received: from [192.168.29.198] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Sep 2025 06:49:05 -0700
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
X-Inumbo-ID: c3f9c3f2-8d83-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAWfHIBTW/Z9di8PXNdUiB2nG3cEanApmDyW3tHo/nEzEjORlV99t1sUMR9C/MTW7R6JuyU2MDOv7E6g57U9dd3vzQqzRZeeKKu2jS9VI7jIqbO1n8FRtkAHxT1BCW2rZQ1FGDfW9FYoeClcTOQi9Qgn2MsSsUfd3YZWQBMWdR9DdFAIij+uC2MGnc30zFHNjw3MBl2U+1FP2uRnpP8EodyOGASy1Mc4vmJ4nbcPiJ1+AmbKmAoWSjUInzqtUMy8jbs4h+TeMsUkaQCbXDUwRLzVlr305Wj7TZXtnRLhbHIjR0apdfy0hv/5VbbsHwfUfJGt702YPa3PegARGFhwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeeoystyVUbnYS2u183/jG+eMUB6+ooMWgEdXGHSN1I=;
 b=efoev2ukoTPob2kyeuGQc+CdfOvq33PMZEF3ig8Y/6+HBzg6TUgXxaSjzNXIjjc1DmPT4+hExLN3sBnboYc6BtTHpwIWn+O9ag6NBliSrU9j7UM+vrpxCPjsppJrmTcVAMWZtAG05vYHYxTX61Wf7mC/+HUBxnCVfRS0bhjy1kcK1XtPFH+9BcETlOZkEQE+SZu93gFyw1ANwLoqukKPbi+gi+cxI8ekrPAUjeIsEbThZbG/vWok1TUn77IqlisITopc7cfLNpzpKGAVJDrspxd3AnKeflrg+uSxYbwJvSp6H+/s0G4OZs3z8l8QILSGaLwONR7/e/BbPPPRw00hLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeeoystyVUbnYS2u183/jG+eMUB6+ooMWgEdXGHSN1I=;
 b=bllSu4CFpB2muezLAx8TzJu4hoknniD3Ot96uqqwkds+MD6oPGwtbfHE3CSFfHKistpVovvrPeaCm427/O14Ku2mg930RpDv0mwELb+Lhh04cnamaPYPiqjL3Fi04KnwZ1eYmXD9HzjP3qkvqrDCN4OjwulDFrFavwMJfoubRWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <92222795-8509-42a3-9e4e-47958cfe47d3@amd.com>
Date: Tue, 9 Sep 2025 09:49:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/IO-APIC: drop io_apic_get_unique_id()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <80c035e0-54f6-4632-a5c2-a10d2c1c8422@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <80c035e0-54f6-4632-a5c2-a10d2c1c8422@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a41b91-0129-4685-3e53-08ddefa7a6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2VDT2JrcHJFdHd5K2xSaXVVRHprWjlQYWh3azlOQmRiOE40bTczZ085aEdP?=
 =?utf-8?B?am1QWmYxREdQTVczSnpIQ0dHemZZV2FzVVRKellldDhrTk5GRGpLdUg4Zkpm?=
 =?utf-8?B?ejhvNUJjVUZ4bmxGZm95Tm5IaVVkUDlBdmVCWDNLcGcyVHBBY0R5d1NPVW15?=
 =?utf-8?B?VkNBNmpLYmxTMUJoY2JuUDNjS2VZeG5INjV2RFU0VDVQSkxkNlBMZWRCaVhS?=
 =?utf-8?B?LzhqUWdwVmlFUUY4cWNQZTZaUU1FMHlEeFR0bUtUNlZ0eDRudE0wRzl5Q2xx?=
 =?utf-8?B?K2N2dG9WalplQTEvcndIK3RudVlPQ2hkbFVOeFNtR0NqbHFHVlRuT3pkSFZM?=
 =?utf-8?B?RlQrK01iYjYxeU9DQUxLa1RhMGl4bk8wa3RlbmxvenlTOXNkNG0vL1d6aHNE?=
 =?utf-8?B?RWxJSWpQZ0pheWh1R2k2SzVYeGtiOC9tREUxUVdZakRCNDhmQUVkOUJpcm5r?=
 =?utf-8?B?eHRKK281UTVvSUp1VkV1Ni9JbXZsS01WcXFHeXJGbEtyMkF5ZDhJeWNXSHhh?=
 =?utf-8?B?VENzRkxrMERKSXowSHh5Z2crM2VnOXlJMGdVcGdaV1JzcmkyWDN5VzRCSHBo?=
 =?utf-8?B?UXZzUmhSV0hrdVBsRi94NEJwSks3d0Q5MlR4SVVhZmV3Tzg2bXB0bk1wTnJ1?=
 =?utf-8?B?QitjZFZESi9wbnhaMXVqejBnWFdxaC8xMVJnOWgvM1Z5aVlNcmJyT3k4cXNj?=
 =?utf-8?B?TjVqK3Zodnp1ZjlaNEQwTFprQlN5dndOamt2b3k5aWI5RVJhTjhsWEs1NEha?=
 =?utf-8?B?SFBaRk5iSHlma0FSSTNJVVBiM0J1MW45LzUyRUJBMkozOVRGMW9xbDJLSTEy?=
 =?utf-8?B?U1BiVTNhd2NMQkFsVmpZZTZaTXpQUkkxcVNBNjhRb1BiVUlyL25SdTV2SVpx?=
 =?utf-8?B?TVppMmRacm52blZFNkNhVGJULzlMVW1VcnNORTV5aXlkVWFkRlZHaFNiMW02?=
 =?utf-8?B?N3UrRUtvZm9McFJMTEQ2dE1lUFRpQ2VwaDNFdG50RUZXdHBBbzVSMk8yV3B5?=
 =?utf-8?B?YUJtMVQ1bS8rVzFlc1M3MWhZd0Z5eEJ0RE5oWFMwNEVVWnlmWlNKL1ZrQWVx?=
 =?utf-8?B?WUdiMUcxeFZBVlV3bm5WODNYUVlzaHdjV1R1TmQ1Y2h3V1hIOExKWW9ZZ3VM?=
 =?utf-8?B?V2dVL1IvSGNScFU1c3NOQ21qNEUvQ2VtMldXdnE5S2VMbXRyVWM2R0ZINVpZ?=
 =?utf-8?B?NnZUckgwdElBcENpOXBjT1licmoyTWE0a3ppNEtpSWk2T0JieG5RZUdPZkZ5?=
 =?utf-8?B?cUZIS2pyeG13RTFZcUtMTHg5dVRLQUg3dC82MTF0QVVuL3BoYTM3UHhNL09I?=
 =?utf-8?B?eGZhaThWZmhnak5BSjhlb3NhTXNEdzJWZHp3OVgwbjZvYkViNkN6TGNkUzEx?=
 =?utf-8?B?NTBsRG90dU5jWlNFTHJSeEFaQnpxSE5ncmM3YUlYWkplNkJRbi9KWFZ2Q0dy?=
 =?utf-8?B?bDNTaE4wZG9zODJqQzY2Ky9vUUJSQlNhY1VHcEFqZEFpNGFzaDZUM2Z6U2g0?=
 =?utf-8?B?Z0xvZXNNUHZqZDZReFVJaXloZDA2eFVMYmZ1eTdDekp3OEpaNnBsaUJxSnZt?=
 =?utf-8?B?TnZJbU15OEhtR2l0bzhMQkVIK3Q2NWZ3YzNVMHg3dGQ4dHFTdmdtQVppUWFP?=
 =?utf-8?B?WHhkZS9YQzRYK1UreHJnc1lWK05Ma1VReHQ5UGVxVUVBUUNndGpva0JyUkhl?=
 =?utf-8?B?Z1ppQmErekpyamhLZWxQenM5c3RyekVTTTZpRUZ3OGZTRVd4cWJYMmJKL25Z?=
 =?utf-8?B?czdHNnp4RHNrcStnTGxJTzNpcEx4RmwwR2JYOWVjZjZSNWI4cmo3RmtxejRE?=
 =?utf-8?B?TFZNL0xkbFlkRzZBS3FFLzZGRkZDRUpEWEFpb2libkdCelBMWnRpYXpURWhj?=
 =?utf-8?B?NURIc0lRc01ibmtub0NyTlJKQjZvQ0NPb1BmYTNVdnZYMXNZM2ZyR2MxMFkv?=
 =?utf-8?B?a0VZWmhBKytMREJ4bThOanR3dlNycGY1S21rc2s1bkZNY1c4UERBeE5VcXAv?=
 =?utf-8?B?WkdFTjU2MFpxeHBVV0xML3NxUFNEMVo1ZWNndENCODNpa09ta2Q5L3NxTC9k?=
 =?utf-8?Q?UjnBQ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:49:09.0220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a41b91-0129-4685-3e53-08ddefa7a6af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

On 2025-09-03 03:56, Jan Beulich wrote:
> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
> said, the function is dead logic as well: All 64-bit capable Intel systems
> have (at least) xAPIC (if not x2APIC).
> 
> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
> code; we didn't accept that yet, but - where possible - we probably would
> better follow it). Depending on one's reading, this code may actually be a
> violation of rule 2.1 (unreachable), which we did accept:
> 
> "Code is unreachable if, ..., there is no combination of program inputs
>   that can cause it to be executed."
> 
> Otoh it's "only" __init code.
> 
> As this removes the last user of APIC_XAPIC(), remove the macro as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

