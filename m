Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFC9A9263
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 23:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823934.1238015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30Po-0007sh-7T; Mon, 21 Oct 2024 21:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823934.1238015; Mon, 21 Oct 2024 21:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t30Po-0007py-4a; Mon, 21 Oct 2024 21:58:16 +0000
Received: by outflank-mailman (input) for mailman id 823934;
 Mon, 21 Oct 2024 21:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5C8l=RR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t30Pm-0007pr-Mh
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 21:58:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9036638b-8ff7-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 23:58:12 +0200 (CEST)
Received: from MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::21)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 21:58:08 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::9e) by MW4P220CA0016.outlook.office365.com
 (2603:10b6:303:115::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 21:58:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 21:58:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 16:58:06 -0500
Received: from [172.22.159.229] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 16:58:06 -0500
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
X-Inumbo-ID: 9036638b-8ff7-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz9PKll+DURNBvv2kQBmUvsEVD6WKYicz5j8am5CuwmAK0zY93EczyB1kO45u3Ets/57ZAH3LxTzujzRiJrr/yxdElYmbu+8npaYAOY46aYviqWF79LMBcGFUVQOnquZwvJcN2V9YKiBfvaaItGAB8g8AmDZCFQbLSUCpQNo2u9tUMUONCEDXEFi4gFvfMioWclSrJJdwPTbbbejztDmWbQKCPaoyKSTapSOONgsWBZvL0vJNsFJ9+pJkhFEC6Gbl44upgLXSAkmxRJvlwvtPUiMU98xOEWta/IkmzLIE3Ypws7Lm4XJI78bHMe3+oXDQcA1+FdlkiAVsIthU8M5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7tEg6u059lt4v92kfx6fnn0P6MF2ZWSBam88+HweZo=;
 b=swHjv6oIG55MqmEQUttZRHPohGcf9KmMOKIsV0pxpp18Gk3ptCzCs2dcJWXIDcvAeZKjwRClRMBETdrA5DQ/afnH/As+0byF8+2d0s1jCLpTH36tdbJUxt7/ntDC8rTsmPoAT8UC9zho0RrXAPdJFW6yRyOsUqdyoPS93W6wA9JuMyg9Gj0vBsf8DLjOSg3kSIP9zYusohlwNFmqiYOuQkqq0izAlajukuQXI3/gBkBFV4Dz8CVyby6cqqxf0gL2jfVy3DYOT1kYa9uNa6EzvrE4HZ3JWny0R+wwRGjY93W6bua4HAPYfLvCDk9/kj28JAv+y88vOIuSlurSxPQcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7tEg6u059lt4v92kfx6fnn0P6MF2ZWSBam88+HweZo=;
 b=Ikm82Y4BT//3ZRECUFtfqrV++H9cBp8PSYMi+PSDIHw8ZwP9uhBmSaBLYGqPrliFN0PNLVteA1//2jF1RDeLRU61Sl9/6WmSs/p/kMmGBZxpMaySjld16vvRXN8KHmG/6+bAffHoEDIljz+AwFzvDjnrSvPaB9XY/hY6kEPDJfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <76bfa4fe-bf09-4667-968f-890c8d917780@amd.com>
Date: Mon, 21 Oct 2024 17:58:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] Fix device tree node naming
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
References: <20241021110446.8633-1-michal.orzel@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241021110446.8633-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 9582ba8f-3a85-48b3-e872-08dcf21b71ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1M4dlF5SDZNMUY4Y1B6WUh3SEpESlZrVHJDbUVTVmcrOVphcXRzdnpnS1RB?=
 =?utf-8?B?VW44QjhvbGIxeVkxVXhMdnNGTmZiaWlsN1psS0N5VXlOQThORTVHdGp4b0hk?=
 =?utf-8?B?KzNFRlFoRnZ2RXpoNnJjcFhDc3hpVXZxeHhKQXVzVFBDaXk3azlmZlovWWph?=
 =?utf-8?B?bUpkc25PaFJVazF4RHdzVmVncDNiRlh1S2NZOExJZitiNUQ0enNpRzg2ajhp?=
 =?utf-8?B?SElaR0RQQkUxbTNNVUsvN0lvUzVmQkUzN1ErejQxb0JTc0VCeHRpQUl2VW91?=
 =?utf-8?B?VVVqVDY4bHV5U1JSY0NGUEUyOEFod1NCWWhTUlI1bGFHdW03N3k4c3FHMTdh?=
 =?utf-8?B?eHZ5N0lnVGRFWGNYRHczZXA2L2JON1RMTTkrU1VDNzlqUVpwZ2dMVzJOb0g1?=
 =?utf-8?B?ZEJ5WTBsd2NQWktsNVNNS1QyMmN0bUIzZTM2bS8raDE2cTBWM2wrSloxTktn?=
 =?utf-8?B?dUVuM2ZrT3cxUVpYZGlCWTdNME8rV2RNOHEzUU5WZ011UFA4WjRKMnFiL1hU?=
 =?utf-8?B?bGVGbWU1cW9jMDU4dmd3YkdSOWxMQnErZmZzaXRKYUpPcFBwaWlMQ0tkanlG?=
 =?utf-8?B?Mk5BbEJyd283dEZaOGNydVU2a1k4NkVKbjBSSGc1cEppWnQwa2ZRNWpqTFRR?=
 =?utf-8?B?Zzg5Yjh4R2NZMkErV1VFMkhCQk9uM05TdmRZTThnbDlEczRqTEJtUm9PQTdn?=
 =?utf-8?B?aW40bjVONEhmMnZQc001TUhCTUszL0RvMDFwNDNJMGhlRjEyKzF4VjErTjZa?=
 =?utf-8?B?ZlMza1dCeUdIVjF1eWRWeWUxbmZDYmVSQzkyemg1Q1c0STlMZTdZdmo5SUwz?=
 =?utf-8?B?WTRYcSthang4c1VuUXFJbGxWMm9JZ0F1Yi9jbDF1d09Ja0psdnhjcXF2L1lz?=
 =?utf-8?B?cURvVmtDL3BycENOT1BWVURRZUxWUkVhYVFqMHRoVGRTU3NJTGZtQmRpNW5L?=
 =?utf-8?B?VDQ1SWExTXYzSFdWeWI5QzU3UEFHeHlxMG5aTktVNGxpRGc1Q3Q5ckpEb2dn?=
 =?utf-8?B?ckpiVW1rWnJ0OHdmMUZlWlB0ejBLUE1wK0p5SHByeFpzaisyZmNjbGlBSmZy?=
 =?utf-8?B?YncrZnh6b0JkUFlNSWNHWGRZL0psSkRPbFZyOW1DYndSTzZXRUNpQ3JTRk9W?=
 =?utf-8?B?UmVSYk9xVndBdWcrc3NsQkxhVHEzd2lqMkw5eERNZDhSRlFGSzdoOENQczlI?=
 =?utf-8?B?RW5ybzVOcWlEYnFMZ0NyNGxpMjhha1MvdmhMa3FPNHhLNzE4YVJvMXM5YUl4?=
 =?utf-8?B?bVRJNzlqN3ZybktXdVJGQVVMaGFxcEtVOERJcVZuQkU3dTBwcVBIbHdrc2hw?=
 =?utf-8?B?OVVsdG1QeGE2TFlmbmJOWU1rOHB4NUszSXFqT3FZWml1NS9PNi9wbWV6VVVS?=
 =?utf-8?B?QURxTExXcDdSOW1BNDQrOTdUSGFNOVhpZXppQ1JpcTlhcXJJdS9SMEJZbENL?=
 =?utf-8?B?UVhNV1JodnFWUk9JVG9vdGtJcFBQQXhsNnB0SS9YaVFEZ3hiWkRKc3pzMmxL?=
 =?utf-8?B?QmJiYnIwcTdFNEpwYkI4OHBSUG83UWVTb2QyK1hERU5zZWRobUNLZEtlTDls?=
 =?utf-8?B?MVR2NnRjaFJ1M2JrQmdLekprVXNCTFcwN1BIRVBoYjdvckxYOENWUWJRTGRq?=
 =?utf-8?B?aTQycmthMjB0ZnR1VjdzaTkyRmJZNURLek5MWDQva1hiSWwyTDdTQU53bzA5?=
 =?utf-8?B?ZUY2NWh1aHllcG5OVm9LMDk0NDIycWFCOUFnWVFMc1lyVUMyamszK09wWTU2?=
 =?utf-8?B?YUdPSlE5K09wS08yVlR0ckNWa1ZhV2RLaUZpOG5BY3poWitNSFVIV3JmUE5t?=
 =?utf-8?B?K1Rmdm0xQnBKSzZoTUxDM2JBSVJWTDBtNlRhVnVVSlFCZGMxNlpiSDhtUkha?=
 =?utf-8?B?QXNRRld5cHVFc2JPZnd3TWlWMGRNbGZla1hjUitSM0Jjcnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 21:58:06.8598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9582ba8f-3a85-48b3-e872-08dcf21b71ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098

On 2024-10-21 07:04, Michal Orzel wrote:
> A device tree node is named as follows: node-name@unit-address. The
> unit-address must match the first address specified in the reg property
> or be omitted if there's no reg property.
> 
> Fix the following issues:
> 1) domU modules are named as: node-name0xunit-address. Fix the naming to
>     follow the device tree spec.
> 2) dom0 kernel and ramdisk, despite having the reg property do not have
>     unit addresses specified. Fix it.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

