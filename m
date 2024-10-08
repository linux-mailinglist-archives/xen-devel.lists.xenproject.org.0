Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685619957CC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813471.1226424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syG76-0001H9-FY; Tue, 08 Oct 2024 19:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813471.1226424; Tue, 08 Oct 2024 19:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syG76-0001Dy-Cf; Tue, 08 Oct 2024 19:43:20 +0000
Received: by outflank-mailman (input) for mailman id 813471;
 Tue, 08 Oct 2024 19:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syG75-0001Ds-78
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:43:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90661be5-85ad-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 21:43:18 +0200 (CEST)
Received: from MN0P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::28)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 19:43:14 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::e5) by MN0P222CA0021.outlook.office365.com
 (2603:10b6:208:531::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24 via Frontend
 Transport; Tue, 8 Oct 2024 19:43:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 19:43:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:43:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 14:43:13 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 14:43:12 -0500
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
X-Inumbo-ID: 90661be5-85ad-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO4/MQ3RPjVzakP4WIRbEXvJSTkPTv20yMxbuD8YZ+EpJXvLyoIfhY96x9+G6i/pBHadAG4Fs3Sa+Pl4KS+PNWzit797XiWy4oIGOpkIoNp2POVhEIDTmC3pdvS8ty8qHPxHrswRHurhySdTMI9af+8yzeq27Gkr+xNVAipS1/xUeUI04vBiL+BBC8NB7hcsfswg1i7QrKilbLuofCvmLw84E1R12vGTpHcyXhLCyoxm9rPUo4RhBl1w0dHoOcbzk/L+yd9UUzNVWalxhsVCYq+0qkjysrZiMdSANa/xNdd/YRiGn3bVzuJHvzrpF3xzv/ydkwJ3XnN0M4HWp+TtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSmFVhzLLBKIjVX/jOp7rkFwXounODZnJUDZfLr6Zuc=;
 b=HSafqj2XMAlIqzxQfo+Bz1vHHbErSawVYsaZ8Gqi2+n4HEFZUvgyRYw3RQcBfFPYQEiBYk+zB45/dHKOmJ7TmBrCdIUV3fb+1yFSgEJMUQ8B4OPz6FWFHV990poz6I3vrOcsy17xNPTzVxZIfd4tc4XJfFUNhNAUKBWvenIB5arBlhq4fH40Hh6i3LsrYENPJvbSuuxjeR+/Mwzblyb3fblUtWiuwCXDein36jvrp/jIrqNm239EC6LAweuk13BN2oeLko7RyekgVtD0bMPTBBhIfAg8IRiyFwBeSrIjD+G88iAP/ZoGBh6nAGoems+X6f+Wug4/+cbcbVcwQ2FyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSmFVhzLLBKIjVX/jOp7rkFwXounODZnJUDZfLr6Zuc=;
 b=ESjmbpLOYUKtZ0JEqL83MMoAazwvwsQ5SUYopz6cF1akxA97cuv+vqkJGuZ0+xfe+Ei3dwEvMRvKDFQo7+VfhOmcDGAT20+kVxlYEBscQ+w3Qvtl5mpkcw0OFKpEfKnhH1aa7qqX6UszOgRf/OsxC2dg22OTrADKCp871QETlvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c39062b5-f344-44c9-b61e-b8281d8ab6c9@amd.com>
Date: Tue, 8 Oct 2024 14:42:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/44] x86/boot: convert pvh_load_kernel to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-33-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-33-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f02840-844f-45ce-7d4a-08dce7d172d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNPa3NiYzlkK1VIb01scHU1RXZrWU5na0RWNnNSRnhDb1pvcC9lTVpnQjAw?=
 =?utf-8?B?a0pHWUZWYyt0a3A0MWZLSzc1MmZ2SXEyY21wcGQ2NHJ6YzZrZTlZNmRQanJ6?=
 =?utf-8?B?cVN5VEl2Q0w2b3A1bVVqM290MFBqc3R2ZktvQUhGS0daenYyNTNNeUM1VmVJ?=
 =?utf-8?B?TWN1SzZkVG5YYzQvTU5uaU8vWlkyaTN5Q1hZVDhlTHRSNjdVL0ppOHZlMmxQ?=
 =?utf-8?B?eG8yL1lwb1JzZmRnUTVPTklxb0IzRDRXRXRpaFhwTEh4Q3ArR1JiS2ZEWGNI?=
 =?utf-8?B?bi80K3QzN1VEN1BEWW9NeVVaQVF4dHZXd2Ixa3RNZGM2QnNRbmN0RGYrblNX?=
 =?utf-8?B?Qk14cnRaR0FOUzVEMmllWlR1dTRyV25pOXZkc25MelNJS3hWN3FJaHMveExD?=
 =?utf-8?B?Y0Q1TXdzdytwckMzd3ZPazliMnRFK3ZLZjRadkpOKzVCVEpiZy9aM2s0YUEx?=
 =?utf-8?B?aDQzamhZdmFzVC9wQ0VVem51Uk0zczRBKzBJdTlyS1ZTNkdEVEN2bFd5T2RG?=
 =?utf-8?B?OG03bXB6ZDhNNW5YbnFSME1za2VFK3VqVzZEUEQzRS9ObUlJWUVOWTk0TE1n?=
 =?utf-8?B?a0NETlJSTDZZYmY0YWdyWU5OTW1MQnY1M0cyb1JzT091bGhGNlQ2N3FNM0d4?=
 =?utf-8?B?ZEdibXl1OGZ1WCsyWmcrQS9PQ1RHSXE5TFpWREdqYmpSdThHVVlCd3B2T2lp?=
 =?utf-8?B?Um5iQXJFeERPUThvOEVjSXJISDdrVjBNUlYzNThuNDJQNGpOakV3U3JCT1dZ?=
 =?utf-8?B?c0Z2LzNvTHdSVHV6WnpRb1hEVFVUa2hvRlV2RUFVZEN3blJiUVgyUVpPRjFR?=
 =?utf-8?B?bWdrR0hrTUxmblM1VUN3cklTOXhsc2dTRFVXbk5yTjl3QnBrR0hIRkNMd2U2?=
 =?utf-8?B?eXUvZ2dMZ2svWWtiYmd1cmVvZit2M0hwTnN0VGFXc3hjUEtUODB0ZzBkVlJW?=
 =?utf-8?B?TytLdnNaYXN2RFBOYytSR2xvY2diZ2VVVDk0a0ZLQkpubEhQR1BEaGRaNmlY?=
 =?utf-8?B?akUzOFArS0l5NU9UQW91enF6VTU2VEdja2FiK09RS2d3d1BDckhLRjM0UmpB?=
 =?utf-8?B?WnFEN3RCaC9PcUM5dDZPK0UvUlBIbkZKMEUxNVUveGtTWWFrempCVXVDOWZ4?=
 =?utf-8?B?QlRlREVTLzFJM3FrRXdvdGFuVFB1cGlGWUhQdHVSdE5qUC9NYWpZY3FuRk1I?=
 =?utf-8?B?VVRSVGxOVkQwaHVGaVN6QjBacXNKSDNic2Z2bHM1NlpqZ1l5YTQ0U29vMm54?=
 =?utf-8?B?VkZvNDdFVU1FcVF6aitFOUhkS1RKMitFNVphdzhvUVBMTE92THBQN3h4cURM?=
 =?utf-8?B?S1ZOQ05lNWlQa2IzVWpranBZaHpIWGR5V2pUQXRPVkZvd1NOYm5nRXlMZ0Yw?=
 =?utf-8?B?TG5JN3lYT1htZ2ZzSzBBRjczUnoremIzZkdsbURMS0tOelpTck03dmxjUlhQ?=
 =?utf-8?B?M0VrdUNvUk5LTzJyeHlseWE2SUkwUnRQRklmSnlLODJwU0dHNVNiTWtTQ2V5?=
 =?utf-8?B?d2c3dnJVMkl3QnJRdUFxWjUxR0t4K2VjWEVEdVNPSXFtQUNRM1VkTkw1L3lB?=
 =?utf-8?B?K2dLb2NEVHNKZGE5NjFNbkRCc3ZlSGEwRVU0bXJiZFlMcjhnZHJhdktpeW1F?=
 =?utf-8?B?eThIN20vSnd6Z2RFNHVqSUlmM1JPM1B1WVNTYjh6MkNXUkFaTWg1bXY0RWRv?=
 =?utf-8?B?V0hqOVBMeXE0UzhWYXl5U2d2enFWNkxobjlnNHByR2FuM1JvVys1cGRvQXVX?=
 =?utf-8?B?RkdYVkhDV2hYRXN2K1MxYjhJcHR5YXJVQ3lMK0l1VUVNTnZhYVZXem9QMlpS?=
 =?utf-8?B?ZHdLV0tOSHIxcGt5NWI4U1hVUGlxVjN1cHNmWlRIQTJMbkEzWHdpRkQzYzNm?=
 =?utf-8?Q?s2Ghhnx1XsNUG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:43:13.9852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f02840-844f-45ce-7d4a-08dce7d172d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This changes both the kernel and ramdisk parameters over to struct boot_module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

