Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5FC46522
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 12:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158284.1486641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIQF5-0000ZT-UW; Mon, 10 Nov 2025 11:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158284.1486641; Mon, 10 Nov 2025 11:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIQF5-0000X6-Ra; Mon, 10 Nov 2025 11:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1158284;
 Mon, 10 Nov 2025 11:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pRw9=5S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vIQF4-0000X0-8B
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 11:39:26 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e65e305c-be29-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 12:39:22 +0100 (CET)
Received: from BN9PR03CA0399.namprd03.prod.outlook.com (2603:10b6:408:111::14)
 by CH2PR12MB9495.namprd12.prod.outlook.com (2603:10b6:610:27d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 11:39:18 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::e9) by BN9PR03CA0399.outlook.office365.com
 (2603:10b6:408:111::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 11:39:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 11:39:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 03:39:17 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 03:39:17 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 10 Nov 2025 03:39:16 -0800
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
X-Inumbo-ID: e65e305c-be29-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSUqiKx8x+ssJQLwt34GK5Vw/L5R7njKUQW3xDguJ7S1iCoHK9mFFZBgd2s8B36hQftzqG6zLRTyJ6f/AhULsz82nb7MgiGq4+4Hokbw9a9aNCMdVGO9ISBsfnW0UGUuDkJkQmCLDeTHbwWd4WFYGkVe3J3DNFnzw5NnO7IT0gSHhbsKp42wdJBLOL4mg4nrggw56sOnTNDCDP7VEvIl/nVSd4XSJRuukWKB1ciV5dNT0mLhBnYQTNcQD8I6yfeCd5zE+LXXUN3M07KWLTDzd/HVFoOyYHYoV881Zdp4Ilz5jh6jOAfO8t7bx+u4gY8iiD81aRQSdzJNxplhl/X7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl+gm+3bPs5uAyz/cGBK6PuqjQ3RKuaPZ1eB12/9J5E=;
 b=L99rCkLr/IYm1opq/tMbwV2WpbV1e+3AyGY2gPMLw40+GhwD4/NoRX/Rh3QBZdMWMZMdrvEzmL7w41S8jX41E+bClxS3Vy0aYr4syNg21Sb/nTWMe6uXyPXKvR9lOYW5b+dUllGw4SvAxT5ngGrYlXivGffmRv3fYfGWImVP4s17z7/uwiF5MCruvktEhjkAplPET8TlyFaVWo5E6U6oHnByCx9+8N4hXHM4QEOaTNiKMIOEb1XMX7i8cOzTLJKyeMJ37WFunGkXKiUCylx9q9lWWYrs9wEmoeefro/nLTr42OcAbHYNj249Ky3W4zhsaxaxEgzLr9DbsH001YhXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl+gm+3bPs5uAyz/cGBK6PuqjQ3RKuaPZ1eB12/9J5E=;
 b=MIVXWOV62Vuk28Q5fu4pVYWdg5pMPQ22iBWp2NRT7fsD6yBfD9P9+O7zPkgAcNxzQXcr4D05sRBA5lS+hnBFmaItnBN8/cEvEBCMkLOfH7bp+cx0Lfs0tY9FmEWtm1N43pgWyIBAvc14br9Ke2Cnm6PhRbsm7fKSq9i2l/2OUSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a2204f38-e121-4aa3-bdec-efc2214a3925@amd.com>
Date: Mon, 10 Nov 2025 12:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dom0less: Remove redundant magic check in
 'check_partial_fdt()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <f624c6fd2e63ce92d764519922ec5cf39152fa91.1762772330.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f624c6fd2e63ce92d764519922ec5cf39152fa91.1762772330.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH2PR12MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7861419e-3234-4e97-e1d8-08de204dc875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0JoVjI3aU56MHR6QXgvcDZXOTRsNlBhOFRtSVVBbWhhcGduWDZGRWZuMVkr?=
 =?utf-8?B?VGdGa2JmbHFKU0VWUURyZkVMbFk2WDdaNXRpa0V0WGx6YkxPNVZPTG9oL0R2?=
 =?utf-8?B?Z2VtL1dwWWdkWi84RkNpWTFITng5WlIyMDQxc3AvandLMWtUM3BMWWZ2S1Fi?=
 =?utf-8?B?V2VBdzBNRmRCckZ3bzFJMFRhMTBQNVNyV2lPY2hLVmJLNEZGSmdSNzZNSzdl?=
 =?utf-8?B?QzBJeFRxMUhyZU1EYjkxaTF5TGR2WlJWV0ZFMzZsdkM3SitFQkJQeFNGTXZK?=
 =?utf-8?B?aUREeGwzOGllVHZRZkY0QVpuTTNpRTZ6eGZXbFV6akd1WEQ4Q0k4UFIrTUdY?=
 =?utf-8?B?bHJReDFoSEhqVE5Bc2w3blB0TDg4U3pJakZIOWtQRXBKRTZRVm1vZHZNSzFP?=
 =?utf-8?B?NlRCME96dW5pZmdDaTFZRWY2NndJMGwrbSs3bnpWQ3ZnZ3FYTFQ5WkpVeDY2?=
 =?utf-8?B?N2NYY3NnTUNndzNvK2xXQ0tyQnJlNW9SbUd1Q2FhQmhaTTh0VnZvZ0hXT1RT?=
 =?utf-8?B?SXJkWlczNWF1YjkzMm84SUs2L2tydnlaSGRDSWpXSnc1QU1XYjVWZkN3bFZk?=
 =?utf-8?B?a1d2TE9nYjN6bE1mSkhCS2hIOHVEL0ZrMGJlVERpdEJkY2h2eEFtSktLOUJH?=
 =?utf-8?B?ZlVtU0ZKZEhXUXhPM3JnQVE5NkZtcGd3WGtzOWM1K0V0NzlrdjZLdldoaHlv?=
 =?utf-8?B?cTgybmd0WEpDcWVubnU2VnorcTMrc3Nqb0JVR05GYlJGbGpMaURXLzc4cmlq?=
 =?utf-8?B?SE9CblArSlVzc1RiM2R0WHo5c242SldKSVBuV01yeE9vSmgvY2JNOHVPekJO?=
 =?utf-8?B?TjRadEQwK3d2YzlXd05QUnhNMmdteXdUczhZUkthU1NseDhONEJxSDdYb1Bp?=
 =?utf-8?B?U01iL0pxL1VVNEJsamRRcW8xMDRtaE9XdmQydVZESkFvN3ZxQjZPTDlVWHVx?=
 =?utf-8?B?UWUzZTJxZDMxc1BXV2xWL3llSXJvREJaWVA5eGEzZUIxTWQzMitQbEhBbURu?=
 =?utf-8?B?WXIvbis5OWZHQy9zVUgwYmZReWhqRjErM1A3NnJIMTR6WDY0Q0xSMlREWGJw?=
 =?utf-8?B?TzNIcE5TSDlweDdkdmNaNzRtUDVQZ2Jnc0FsaHhkbjFLWkJ1UjZqUHpvWi9O?=
 =?utf-8?B?UlZNbS9NajczbjQ0ekxQajVlRFVpZGtLMTFPS2pCb2xXTkRGM1BaSDhnK1Mx?=
 =?utf-8?B?aFFZcWQ3WXpzZmNlTENpQmpoUUduZ1lNM0d1d0ZQVEpQV3hnRjM4RVpLZDk0?=
 =?utf-8?B?aFBwNnROVG5rb3lyZnh1NDJFWUZ5c0EvWm93UlJQNmpHQUR4TjFnTHJISzFz?=
 =?utf-8?B?Yjgya25VbklWTWgzZUtUVGQ1aTM1Qll5NEhhbjBib1BFL1NqR1N6QTZTbGhp?=
 =?utf-8?B?WmRIanhzZzdEbHhHZGxIM2JtMHBBY2NBWVFBK24xSUxZVmJDWU01ZTRVUXdZ?=
 =?utf-8?B?T3VqeFhNS2RMamYyMWZlcVhEUDYyOGRqc0ZPSXRiTndQbzFMR1NVYlE0NCtR?=
 =?utf-8?B?N3picktrUnBac1pYOWFpUFRwR3pUeXVPc2xVNm1LRno3VmtVOUU5YmtxamJN?=
 =?utf-8?B?U1Y2YnphcS9PNkg2WTJaVHFLbVo2VExyenRNS0tOVmtXMHVYZEtZdGs5UEhz?=
 =?utf-8?B?S1prbjFUU3MzclFZREtQYnlUbU5jSWVkcXliazZqTUlKWUtSWHZBajZPbnJF?=
 =?utf-8?B?UVBNeVA1V1JEOTZKbHN2bXh2eWR6WTM0eWFNMkh3ZUZtSFM3MFZsQnpUM2ND?=
 =?utf-8?B?WXg1Rmhic0R2NXcyM1Z3V0JhU01HVWUxeWl5N0dSSGkxUkc1cjRkQldTcSt3?=
 =?utf-8?B?UmgrYk1pL2Zrakl2Q0lzVkxqYjArNjN6d0c4eHZJeXJGNXk4S2VHeS9MT3gx?=
 =?utf-8?B?WWhveVNDMW4zbjUzdXcrT1ZrdGVEVXZHVnVndmtHdFJyalhnYytuTGdtaG1k?=
 =?utf-8?B?NmVNOWVtOXpZaC9YK0wvRlJwL0xQZnQwRnAzcFNLQ0hibEY5YmdnUjB1MGpS?=
 =?utf-8?B?Qlp0Mnp4VEt1Z1ZNSnJGdFJYc2ZPRHNDQ01vbHJPbXkzNEgwSnNkUHhKdjh6?=
 =?utf-8?B?OHhybzFheHBvU1JTZkF4ak1BbVFON3lKT2MzS1pEM3dUNGNKMzFQVncwbEhr?=
 =?utf-8?Q?2IMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:39:18.0505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7861419e-3234-4e97-e1d8-08de204dc875
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9495



On 10/11/2025 11:59, Dmytro Prokopchuk1 wrote:
> The function 'check_partial_fdt()' performs an explicit check for the FDT
> magic number (FDT_MAGIC) before calling 'fdt_check_header(). This check is
> redundant, because 'fdt_check_header()' includes checking the magic number.
> 
> Remove the redundant check to simplify the code and rely on the library
> function to perform header validation.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


