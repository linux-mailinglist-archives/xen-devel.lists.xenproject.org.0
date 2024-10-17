Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328FD9A3132
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 01:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821423.1235234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Zg6-0000Dc-JX; Thu, 17 Oct 2024 23:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821423.1235234; Thu, 17 Oct 2024 23:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Zg6-0000Ap-Gl; Thu, 17 Oct 2024 23:13:10 +0000
Received: by outflank-mailman (input) for mailman id 821423;
 Thu, 17 Oct 2024 23:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1Zg4-0000AU-Te
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 23:13:08 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2406::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cefb1ca-8cdd-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 01:13:05 +0200 (CEST)
Received: from BL1PR13CA0070.namprd13.prod.outlook.com (2603:10b6:208:2b8::15)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 23:13:01 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::5e) by BL1PR13CA0070.outlook.office365.com
 (2603:10b6:208:2b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.8 via Frontend
 Transport; Thu, 17 Oct 2024 23:13:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 23:13:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:13:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:13:00 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 18:13:00 -0500
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
X-Inumbo-ID: 5cefb1ca-8cdd-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcD1VtBkpy/NBooz7xa+w9Zbv752m0TOQdAn9e9T9cEuv3hlD7GTzHCmF/CuOnfRrSpm7I1ROfMjYTZHMSFXt3ZFtu9tPQrHScYGsIY4rGxQler0fnJmfXeTq1ZHAoewkR6SxL99JrGicK3+LNF/8xQ5+IQV/PJjdHAxt7DzANoBQpRaQwGKcziDFFZBd5zIKnQo2bmZrbJPzrxXgJnx0bYPDDT8WlUIWGw9TuMw6F9hDx01v8pFaZ69ooHCjg0C2gdJ06RhB/cupDGaIS+X3qxAATS6nDXSS9Z1x6aFddS4lbDnr7F5eSpIHf6lsrt2Ed0hFg30am3xbG2fX12GpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB+CrNJ2+x2Ays8w4baPV6mTqog/lvZm6DwxS8oVzVo=;
 b=fnL0osKip2gUPfE+ll+q4xN9w3W9JknBpMPatWkz9zBuoBmclMqVkyJhaeovzUxMomvkUqdIGxT7ThZWcWzCygh9G50imWZoSr4QDIJlaL5pNeXhG8cQIEqp0qHazsHdZA0KqkoOPHcM2GCaVLRjOBAE8kLioObyuanIvyWWGmMRmeRQW2f0aYg7riOSiY21ziAIIB5A33FcSU7yd7B+Vl6NIqOIwIATBE5iL5WlfFP/n1t2QU9/6nNy1D8CK7+wnfcIrirdomohsP+34P72S4jqkEop3h+kWGtEKA/TEDTOaWBY17hNfF6EXoQXaIfdPjI8vLg7VKf3ZdlOPmX8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB+CrNJ2+x2Ays8w4baPV6mTqog/lvZm6DwxS8oVzVo=;
 b=eA8lyR0hDmIO550tHh9ki+qFLlOLGToTCQ7NoxrRHxi1HI3k6d1yJrkjxnmWV8Nu853St6j/5Jg0mHoldXVMG4W3wblcGEVtNJiEkZo8N2zsWGeYknLJ7Ok2X2UU3aokqXPSkiOf+Goq/vTl+/BPp5+mBjlBeuRiLbhBMX1ZC70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <394f8083-a6c9-4ccf-8e01-cdc1e6767214@amd.com>
Date: Thu, 17 Oct 2024 19:12:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/44] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-12-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1bbd21-846c-4e54-c2f1-08dcef013f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1FySjIxWTRqNzJobkxGaE1HZVpyWi9Ob28vRTN6YVd3NlVEbVZ2NkkrUnBV?=
 =?utf-8?B?dzI1YXNPQy9oTzI3L2FidG94dlVsMVAxY1J3ZHFiMDRkc0RKbmFIMnBRNysw?=
 =?utf-8?B?QjR2eDBnUUU2ZFJoQ2UxR01EMWhWSTVNanBpSHMwL25hMzF6cGdmd005M1Fm?=
 =?utf-8?B?OFRvS3R0aTlBamhxUjRnemY4ZkNCb1BGaVdDdStNNU83MFhNL05SSm11Smgw?=
 =?utf-8?B?Q3Bjcmx2UUk0ZC9aMGhnZHNYblYwN2RWdUQ2M2FPYWx5N1RYTkRFa1JjRlhU?=
 =?utf-8?B?V1V1SDZZaGVRdys1allkNEhiNzVoWXpvMjhWSjRMQWcwRHNzUWU3WURldkVu?=
 =?utf-8?B?NHF3OEFrVjMwVnVNczlOSEFmQXBmTWxlMnI1ZzN2ZUg1WFVFZ0tlckpRYzVD?=
 =?utf-8?B?S0lnV1FXUTBwYkNIL0FEUXhCaGVqYVRuMHpRY1Qvbk9uTG14anNWUVBrZUNJ?=
 =?utf-8?B?ZDkzS1VwVlF6WFRCOWo3Skx4R1ZkMDBUMmtFa09vaXFmNDRWalRlQUlJd0JW?=
 =?utf-8?B?R3BGTFJ2VE91YWd5ZFRqVk1HMEVWYWlyVThkVXhVdWNuTFl5ZkMrQTdpRGtN?=
 =?utf-8?B?enJscld1NTdKY2dsOWtrQjhROXVFM3d6czdIeDYxQStCZ1R0T1hZMmZXZElM?=
 =?utf-8?B?VXpuRjhOd1JsbU1iMkxWYTdTeWh4enJDa0JpMGxWUklEUk1mMVhWN0k1MTBQ?=
 =?utf-8?B?WFo5em9USXFOTHN1RmRmZFQrMTMxMkxJT3YzWnltSTd6S0FwNHp4MmxUVjJV?=
 =?utf-8?B?MEcySEhJZGZub3ZBYlVDSDdYQnVORFdpNW5XQ1Y0YStUYjgxbVJoNEdaQnhJ?=
 =?utf-8?B?UEZ2U2UvRVFEWE5VSEZxS1lvRk1IVnhtSS9UNmJQTFJlUHhBeSs2SzBvejlv?=
 =?utf-8?B?Zmo2R3I1UjI0bmdnRHRjMGllOXN1b1lKdjJNZHNGYkEyRis2c2hpdTNJRktZ?=
 =?utf-8?B?S0VRVWc3Zi9ZSlNUam5kZXJWS0tZbXB5TS9BSXBmK0hHdDBuejIzZDRtTmhW?=
 =?utf-8?B?WmhYcjNDNG5aNnhibHl4dHRSTlJMZXZsaTBVMjZDMlg5MTh1bGUxVHp3SGVt?=
 =?utf-8?B?dC9tc0VPQnRuc0hYT1NlRDE1OEw4cVhlblZHWFlyLzUrVmNTMjloWEphMHJi?=
 =?utf-8?B?bFZHRy9vOGpPS0t3b1ZWdmlRbnExUFBJV2F0ZUhYOFEwOVI3VDN2VmpaajYw?=
 =?utf-8?B?bVo0bndpaGwxbmNEY0JreHBoRTVmU2RrL3BRV2txbFFpdWxwbnJ2TzhvTGdJ?=
 =?utf-8?B?WGEza1JUZTRNRkJCNjc4bUFQbUtScW0yZHIvSHlKWmgySDhsRDVuMXpxeHNy?=
 =?utf-8?B?Vm44UzUvM0Uzb0VoUXNrRG91SXFRd2J3VjV0WmNNS0RYTDY0UjdjdURkTkU0?=
 =?utf-8?B?S0dFTWl4cGxKREw3U2hqMnF4bTNlNGtlU1dYbmI1cFYxa1lJY2xEbExWeW9O?=
 =?utf-8?B?bHJxTmQrNDJ0d25JWDJhYnNpR3FKM1hCb2wyUG9RL2pseWt4WG9Xd1pIT2Nu?=
 =?utf-8?B?RGdreFVYRndOZEswalo3YktId0E4OEF3WitEVkN5c2ZYbEVGUVBsT1M3ZDRj?=
 =?utf-8?B?eHRDR3RKbEF5Z3c5ZGZ4amEva1VSZWdtL2lnQTVEUEx1TncwaWtVSE8xSEJ6?=
 =?utf-8?B?U3U0V3ExaG51clFlYjN0cWpkWkljT0haZGpCNHJlVi9CSVdKdURMZ3VRc3k0?=
 =?utf-8?B?WWlxOHhpRDdRaFQ1ZG1yeUFaemdNVTBsU0dxdmFsaTFidjByWFArVkdLb3ZU?=
 =?utf-8?B?b29VMkFUZjh2bXRTOFlXOUlhUEhCRWZaQldpOUdpOFBrMDNteXlvS1NQQVdY?=
 =?utf-8?B?UGphMXlCNkF1dW1EWGs4OG5DM3FNeGg2NzJWWlB1RTQ4OTlHQnA5T2Y1a2I1?=
 =?utf-8?B?blFBZ092S1hZSDI5cUdMUzJkRFIySlA1a2VpamplV1pLVEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:13:01.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1bbd21-846c-4e54-c2f1-08dcef013f4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078

On 2024-10-17 13:02, Daniel P. Smith wrote:
> This commit introduces the start and size fields to struct boot_module and
> assigns their value during boot_info construction.
> 
> The EFI entry point special cased itself, and pre-converted mod_start and
> mod_end to mfn and size respectively. This required an additional test
> in the coversion loop to not convert mod_start and mod_end when the conversion

conversion

> was done for both the multiboot and PVH boot entry points. To simplify the
> logic populating the start and size fields, the EFI module population logic
> was coverted to using start and end addresses.

converted

> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

with that
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

EFI now gains the alignment check, but beforehand it was just silently 
truncating.  Seems better to check :)

Regards,
Jason

