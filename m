Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D753D9F202D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 18:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857422.1269719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWL6-0001b9-U5; Sat, 14 Dec 2024 17:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857422.1269719; Sat, 14 Dec 2024 17:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWL6-0001Yp-RP; Sat, 14 Dec 2024 17:54:04 +0000
Received: by outflank-mailman (input) for mailman id 857422;
 Sat, 14 Dec 2024 17:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3ag=TH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tMWL5-0001Yj-LB
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 17:54:03 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66269740-ba44-11ef-99a3-01e77a169b0f;
 Sat, 14 Dec 2024 18:54:01 +0100 (CET)
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Sat, 14 Dec
 2024 17:53:57 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::95) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.20 via Frontend Transport; Sat,
 14 Dec 2024 17:53:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Sat, 14 Dec 2024 17:53:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 14 Dec
 2024 11:53:56 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 14 Dec 2024 11:53:55 -0600
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
X-Inumbo-ID: 66269740-ba44-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukekAscJmRLHJCKnwmsXpMTpcrB5qGmjXxuzgl1yBKhxYlPZ1sdYxAFiff9fbxAs0QRy/08W44gieukreyqstD7mDGyMNODm9Xk1OAATL3FDQAQp0abY8yv8mwgi7VyhErYCBDdNi63g9oVR86Kpj0SAc926Q/4mkNdo1pMFi1lLjteoVWFUcu/NBxQQNRkKnffI8E9MADInLKFg6Wbfj4c/9fH7jvb8/rwoX0jVhBzd5uDxPKJZvm1DDly7BrKCfwb/FNXjbCnHLXqiwqS5dF5oBtyB6HpPSMh3prkuI6qhFA9NI3KT1hjbxyDMGbuxgbaPODGY5gX6++7tiad1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GnafECtgxI2eDydWJ5XeykP2Zok967VY/jGtFS4mds=;
 b=dqCip/OqZpHBx54euI/FYHbVJ6udR2PO1CJqYNjf2kxgGeVxWCWLRHHwE/s0gfy22o4BO7S4WHLWnQ56ibsx3rp3vR2VuZt3Lz1mlHUOhyYX90Szd1d0qVBDJqtSjVogQmULqzc0KYl9OCrArPxxdj8pYBOBO9NPo6FBuCTtnW3zJCLCvgk5avzptgHhIx6JCOwYxt8TMDqG99in9dZCcDoWZCVzkyi26DoTlhoWP2mDG16JUlBbhAKKhM3OCv1J/CSVi2nS9RZCSPx1he1OlkwF4KIywLfU4wM93jNGiIchOOVcOlNKimCjrT/VFPftG9Nuz3rKevotu6kXjfHU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GnafECtgxI2eDydWJ5XeykP2Zok967VY/jGtFS4mds=;
 b=bBQpmvyG+ZrRGnA8AmSdpu+GYP0Txu4G+jAzs0lO/J5Pdq2sk79lVqGhONLaExiajcYpfN3Q5QP/lE+IOT5O6MSK9Gma2iTfxtKjV+3Xk/Akvjsn2aPl13ZxG56HFnK/WrPHwW1ennM4sHVuzLyWBeLFmQr+c9xjF0JxmHldRdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <981a2c50-c82a-40e0-a45c-783696a7bdef@amd.com>
Date: Sat, 14 Dec 2024 12:53:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 68/71] hw/xen: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213193004.2515684-1-richard.henderson@linaro.org>
 <20241213193004.2515684-6-richard.henderson@linaro.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241213193004.2515684-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6769f826-ff98-4d25-849a-08dd1c68487f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFZNKzZjWFJDNlByS0lXU2cwUGtrK1E1emVKWHE4RWlXbk1qNjRuSW1DOFFJ?=
 =?utf-8?B?SVliVk1BRkJ4MStaeHRnWjZVdk1KdTFabG1GR2RCUmh6NzJpQmVOS0M2SkxI?=
 =?utf-8?B?cUdocGxCbks2Nk00T1dMRFd2K1FFcGFXWlRUYnkrYTQxbnNFMU1LYlh4eVhk?=
 =?utf-8?B?ZDR4RkJITkhzZDVsbXBDMHhDdnBGcXU1c0hyYm83SS9QWGd5QXYxTWEwNVE5?=
 =?utf-8?B?VnhGT3BVczZGZm1IRHdlZzdJMGthNnhHcjFabXlCMHUvQVp4WVYzbHFDRmV5?=
 =?utf-8?B?SnpBNVNjWFdndlFVTXRMRStLUzhCcXp2Z1pXVzhZeUNwMHJaT2Vhek5kNjdI?=
 =?utf-8?B?TmJ1c05iVzkrVXBJUEQ4Q3Bsamt2SERnbEZYU3BlZ1Q0ZjIvaUVFcG1XaWQ3?=
 =?utf-8?B?OGxac3UzYjBNM2lsUFpTeDdXRi9xUUE2cFlzUVZrNDgwOXRpTW9GVUphSVRS?=
 =?utf-8?B?RWc4YUJsTmV4ak5LSzJ2VFBxcFBSTFlIRGE2OGdlWWZXc0Q4NkJzV2Vaem1N?=
 =?utf-8?B?TS9qcEdRVDYxb3ZrL3gvTmRLNDY5eEg4UGRDREp6aTJDRHg3TTVnR3FRY1Nr?=
 =?utf-8?B?d1pGR0VGTVN4M3VKYko1YitoSjFSb1ZNa3hzOXcwZDVLY3ZqZVdHRWJMeGZ2?=
 =?utf-8?B?ZlQrTU1XbWw0TE9ORmwrNUxYbyt5UVN3WDI0VXF4LzBPcC9kWml2WXJjb3NK?=
 =?utf-8?B?bjd5b2Jib2ZSemhHS1JHWGxhSXlWdUNzSWZCTlRFMmNXUVpjRlE4ZTNJVWg0?=
 =?utf-8?B?ek43eVcweHgwTTNSUHYyWDVGQlorc0FKeEEzcHF4L2lPR0Z2a1pRenQvMkFT?=
 =?utf-8?B?WEU2dzJHV2t5VTRkWVJGazFWazh2UFhhNU5xaldQa3MwamRPenFDRmtEZVE4?=
 =?utf-8?B?VWF5T1dSQWMvazZRL0RvNHNMdVdKbnphV0FDRFdFUW15SzExcDhuUTNoalU1?=
 =?utf-8?B?SFRTd1gyT3dYckdWS2xMQzR2L05UUk15Y1I4T2RHY2cxbStiOTF6QVRkSnht?=
 =?utf-8?B?N3FMTVc1UVJlQWpsRHpVRG9uVEs0akN4bmx3TytXTkZ6L3RuREZhdjlnRzdQ?=
 =?utf-8?B?cXZObW0yUE45V2E0cHdEQ3lJNU5xQk1YNTk5UlBjRldHbTFaR2dQQngwRUE3?=
 =?utf-8?B?bkpKdEloR0Q3WkN5VjdSUU5yZWxRNkRpc2gzRmp1NXpQYkVzVjEyTkVPdFk0?=
 =?utf-8?B?dldTaS95ZzVDUDBTV245MDhTTGUrUnlpak9xYTJJWUJjMkluQ0Vla3pncHlF?=
 =?utf-8?B?bnBQeGNmekZHVkw1WTM5aUU2UmkxQnlhTWZDQkgvOTlwekNaQTg0S3hWbDNY?=
 =?utf-8?B?UDdwNHhJZXBiNklTL1FmSzNkejFTMnNxSkxiR0JIdUxlOEJtczFqSFg0dFBH?=
 =?utf-8?B?bXRZeW05L05PWDBJdnZnRitTdDBHalZhYXU4ODBuSDR5dXZIUVlvSUJ2OU5v?=
 =?utf-8?B?ZG80QktaSnNETDBHU1J4UitjaE96VzQzYUNsS25NUEFGU0dYVTdpV3VtOTA3?=
 =?utf-8?B?VmpmQzVQM3RjcEY2UXgrZkdOQnhIeHp2cThYZXp0V1dEMnBkZEp4OHU1enZP?=
 =?utf-8?B?Tnk3aDQ4TE1jY1dTczRvTzU0a09tN3RYKzExeGQzaTF2bHFjcUtXZXpmeWhI?=
 =?utf-8?B?bXFlR3VzQkd5bHRCd1dVSVE1QlFtcGM0MDBGNGEvRzdkcklvZms2bE5JMWY1?=
 =?utf-8?B?QitGZGx1S3ViSm1zSmF1dmo1OVB1a1paS0ZsTDAvZ2lVcWp5WDlWRnU5RjdX?=
 =?utf-8?B?WGxIZVFFOGd2YVJXQzFSQVpxSmx2Q2tpR3RkQXBCSk1wVTczM1JpSzY2cGh1?=
 =?utf-8?B?RUowY3EzclZ3NkpPVjBDczNuTWxFVkdsWGF2Q2VES2JzbXdvOVlnY1dlTm9Y?=
 =?utf-8?B?ek5LSkpIMmlZbXMzcW9TQm0vN1N6UGVsZ25NK3YyVFIyQ0tlY29hNlpiWTJs?=
 =?utf-8?B?TVRxempSbUpXVG5WOTBsRGhZanJ3aytlOEJVcVh3TTkxRDBBREJ4VU9CVkFX?=
 =?utf-8?Q?nvUebqZbVdL3GL/+Kwo0wicEm5OqLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 17:53:57.4034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6769f826-ff98-4d25-849a-08dd1c68487f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067

On 2024-12-13 14:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

