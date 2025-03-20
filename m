Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F96A6A894
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922216.1326123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGwi-0003td-Om; Thu, 20 Mar 2025 14:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922216.1326123; Thu, 20 Mar 2025 14:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGwi-0003rF-MB; Thu, 20 Mar 2025 14:32:32 +0000
Received: by outflank-mailman (input) for mailman id 922216;
 Thu, 20 Mar 2025 14:32:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJiu=WH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tvGwh-0003df-6Q
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:32:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254b0ad8-0598-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:32:28 +0100 (CET)
Received: from BYAPR21CA0021.namprd21.prod.outlook.com (2603:10b6:a03:114::31)
 by CY8PR12MB7612.namprd12.prod.outlook.com (2603:10b6:930:9c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 14:32:24 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::80) by BYAPR21CA0021.outlook.office365.com
 (2603:10b6:a03:114::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.8 via Frontend Transport; Thu,
 20 Mar 2025 14:32:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 14:32:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 09:32:23 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Mar 2025 09:32:22 -0500
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
X-Inumbo-ID: 254b0ad8-0598-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+vX3Cj4Zfi7OdkbPnvaejObmxon1oVmv5MbDiKaG9s5aXE2TK7X+WFsqPIEDZymmgay29nAX4uH+xvEC77qcxSxHXs3paHIgnMJa0DdfobTBUMfuuyNluBc9moojO5X1wQbYPYxsqRLwW7PnfgrTf5+ODiz1HxmuF276QYi+16EaC24ZT9I4MSN8TYzusOK7AT8MgfYkb9AgOWKgnyFzvF1IOiZ1UtBvC47U83X0fgGhnpMwPNjIF7lWfRxAWfVqLclnvz9nu9yykybo+60rDr4f7iqBpGxz28A5AGjtNLn+b4dGvoSYXkLLQcPJh56le+dLSbTLpERbdwGabXr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oym/vjI4zTqLxIyTBUdgzlM8RFBRNdUGdIJPCa5fGac=;
 b=LmXd8uLo5jSWzL01nSBzwFUaak/VJDmzs1UL3DkQ+5asaWnd7PElfFOL9o6RrqpJhPhe+6pFyb75OCnH4X79Z+Vr1QBHDVvkYpXYdVqNZxRKH7mCxI6GJ9GinmWKHqifYSzQVn/f/vG++t97eVMdpaOfi5dSc8rEcVw/w+7YyyC0fK4xLxy7KzZwvQJ1+Yhr0pvu61SDc3r/euwyTSjunmcJfyG1pDAa1ax1tt2FJ5v6ISu41nEWuEqFlKopvGFpczLyvl1RszneVR7iMomD2UQJeQKdkT8gayWxJjgg48Be82FUBM1rtVNVjMp37kK+RsXJc9nIHHYjhEhWri66qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oym/vjI4zTqLxIyTBUdgzlM8RFBRNdUGdIJPCa5fGac=;
 b=5j+FjBnpvdpiCi6TsiM7Md9BLQX4LAmKbiKIt3SaaJMzMNYyv1UnOIxvn6eh3eqrm+GeukDI2dDAcs6xGvsoxoFPFvFrKxMi3Qf9mwEyATbuLCb31WK0C17gibnCOzPPlfd/d/w7QmH4sFcmbxpE1feTsJuCSUEbM/6/fe+dchs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2e1b2f16-4fa5-4e72-9cdf-50da8b8f9ab7@amd.com>
Date: Thu, 20 Mar 2025 10:32:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 2/2] 9pfs: add lseek file operation hook
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250320074924.8080-1-jgross@suse.com>
 <20250320074924.8080-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250320074924.8080-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|CY8PR12MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 318e42b8-7fa4-446f-7d2d-08dd67bc0811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmpSRVFMVHNxN1pWZFovWmRmK2x6TkdnR3VIK2owSVByVDcvMDRuRk1wdTFY?=
 =?utf-8?B?RDI2V1RwRkd1MUpiQjF3RGdDenZYaEZiamZmNEVMQzFuemEwLzhnbWNNcEpz?=
 =?utf-8?B?bWRsTEE2S3hUSVgzSTZDTWpMbW1ZS2pDbmhOU2dpOXYxekZDWkY4Q1dYbW9n?=
 =?utf-8?B?dFRHMkhnUkJEbks0UXdLa1BsSmIxakxQV1MyTmJ6OGZpckJxQTVUNkNITUJS?=
 =?utf-8?B?TkFja2R0RS8vOVo4RUQ2bkRRaXdPTHZzdG1KODl2UWl0eVN1T3hLS0dtdHY2?=
 =?utf-8?B?ZXJhaGNvcXRINFBOdDduTWplMlZOSTV0TDFHMVk1dC9wZHhDQTlUdytnTUFD?=
 =?utf-8?B?ZjIrejRnT0REeDFOWVVwb2EvYXNuSjdKRGJ2ZHR2Mkg3aHRkRXkyR01HZ3Vr?=
 =?utf-8?B?cHB6NkJXK3RXdkJUdG84Q3IyeWNEK3FwR01rNWMxR05JZjRhN1N2dTQvenVH?=
 =?utf-8?B?bUZSUkRyUHFmSDlIVVpJNlJTTERzMVBIbFhYRUdWclpVczJiVW9qbUl0Ukky?=
 =?utf-8?B?UWRab3lSUTl1MnlmRHBkb0s4ZGRSRVlQZ08xRkxNUnhZdE1CQ1J5NjIrUVJC?=
 =?utf-8?B?K0oxZjZCK242RkhrTjJPaGwvVVQ3VW9aN3hKNFZLR1BvUndJWlJPR2FJUEUy?=
 =?utf-8?B?aTV3aDU1OVJmdDNYRFVob2ZJTkdtMWl6WG1HcitzZjJ6cUtiTis5em9ybGx6?=
 =?utf-8?B?UnhOQnBORlp4dGFjQWt6Ulg2bFB3a2dsQk9yU2dZM045cFhsbklpRTJEM3pt?=
 =?utf-8?B?eEgrNGlGZXpCbytpMUZOZnAwMC9vc1lOS2g3R2daM29rMlE1QkMrWW5hajRK?=
 =?utf-8?B?ZDhZalcxZHA2OEt6ZXFacXdlZ1paSHF6Y0JxQUdheWxFL2FOZThpZzc4WVlL?=
 =?utf-8?B?SEtEdXpkSldBdGhINmlLWVBGaXZSRERlWUFRTVlVaG52L0VtcDhNU0ZKbCtJ?=
 =?utf-8?B?a2o4TlM2VDVFdEt5OUVZaWxjQXZvZmRFT3V4WExmd2RpM1ZxQk9XQmJYNFlq?=
 =?utf-8?B?TlUxb2V2ZzVRcFExWFNpMU9HYmowU0RxUU05T0VZQ1JEdnk2N0ZyNWl6Sjcx?=
 =?utf-8?B?VzRaNFp2Yjl5T2k4OFFTa1E5QVN4NE5OV1lDSitMUEQwaDdFWjgraUsrY0Z1?=
 =?utf-8?B?TUk2b1pybUZ6SndpNlhnL2pXNkZFNlJodng0YVRRTzRTMUtJbDBBKzhRZkps?=
 =?utf-8?B?Y0JQMGFPZWtpVDJieHpBcmgzWVRHeUJyeVJ1MzZxdVZUNWZ3Ym9Rc1JRRE1O?=
 =?utf-8?B?V0xCanY1SXRHZFR3cS9qQzYwK1RKTDhSeUxCY3NmZjB4blBMb0tLN28wVU93?=
 =?utf-8?B?N0hkVmhuYkthcWVkclJMTUZjTHlGeUlCREZMRFY4WTAvblNrYWVGTXpqRnRr?=
 =?utf-8?B?OTR5bjVWWDI5ZDVGd3NDZno3YlRUM3cwZUhEeTZQc0IwYUV6c1lITmRzUHBq?=
 =?utf-8?B?T2haL1hrcCs1QlJyeDdDenZ2UFZHWVpZWDFzZ0l4V0xaT1N2amZDTk83eHUw?=
 =?utf-8?B?UTNDQjAzaWgwSzZOaXZ0WVVtTU41MXNRbll5cDFFMUF6WlNrVXpoM05ZYVRh?=
 =?utf-8?B?eEJxRXdkaTdoT3JYaG1IVm14WEFxbEYySUJPNzZxOFplM1prM3VXWEZLMlJ6?=
 =?utf-8?B?cU1xck8xUldCZmJQaVJIVUJYbUExbTdJUXJaaWlVYkwrWG14MUJrMVFnSmRl?=
 =?utf-8?B?UkFxSVp1YTNmUm0yakRTY0haSSs5TW5iNlBpNXNCWjVYSm4vc05sSXRZeU1L?=
 =?utf-8?B?MEkrS3VLY1ZrdDhaMFZvRktDWnpEaHJTdEtTRE9NallmTjl0ZWNNVXl0elZI?=
 =?utf-8?B?aW5aUnF4YnBGV3RuZmxzVktBOHNaeGthNXhVRm1jZDZDU3JhaUpCcXEvbGpF?=
 =?utf-8?B?L1JDUExualViQ3BaL1NyekxRU0FOWFNPZDhCUXh2cUkvS2g1aXVlSElaVjcr?=
 =?utf-8?B?RE5KZWFVeHFQMURYOGdRRjZieWZDR092ajdueURYVXQrTDVpY0xIWkNQNTQw?=
 =?utf-8?B?ZHNLeGtXRW93PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:32:24.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318e42b8-7fa4-446f-7d2d-08dd67bc0811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7612

On 2025-03-20 03:49, Juergen Gross wrote:
> Add a file operations lseek hook to the 9pfs frontend. Just use the
> lseek_default() implementation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

lseek_default adjusts file->offset, and read_9pfs()/write_9pfs() are 
already using that.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

