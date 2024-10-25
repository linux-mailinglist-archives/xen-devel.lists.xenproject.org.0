Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482E9B074C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 17:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826095.1240448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lxy-0001bC-Py; Fri, 25 Oct 2024 15:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826095.1240448; Fri, 25 Oct 2024 15:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Lxy-0001Zi-NL; Fri, 25 Oct 2024 15:11:06 +0000
Received: by outflank-mailman (input) for mailman id 826095;
 Fri, 25 Oct 2024 15:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jrJ=RV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t4Lxx-0001ZT-7f
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 15:11:05 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2407::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59684f04-92e3-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 17:11:03 +0200 (CEST)
Received: from MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16) by
 CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.23; Fri, 25 Oct 2024 15:10:59 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::e3) by MW2PR16CA0003.outlook.office365.com
 (2603:10b6:907::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Fri, 25 Oct 2024 15:10:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 15:10:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:10:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:10:57 -0500
Received: from [172.26.85.121] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 10:10:56 -0500
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
X-Inumbo-ID: 59684f04-92e3-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Upa06y0IuncoO6qXOtaPIMZy1RnkW1YgJ+drNX0RVZYYr2ParKC6OevFc3M4wyZ3uPICbbwiLS2RVlAeN/6sUa6godW2BukRt2JRWtImKrr8N1N2F4FBWwgZjTv7mRxTbKaHb13f+OuL5C0pEqQQLB6ugKZ1HcmP8X+8OWNhmyEWEGsthI+gT6e/IuF4DkAvlK6GNjVGLnuOqLENLEbAagkeC/NLQQ7hNxO8YUv6JkcGkZ7GfDTifmpMdFLUThGr0d8PJbsKKgoZabk5Jkg/JzU44NXWzX4rDzegQNvChhxKamgaW0hAaC+DMGFtZ8zf2jQl7xQLiNjecIyr83kZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRBu56+NVsuKPYkH2gqVN4N+jXnclsYoveSN9L+DaFc=;
 b=aXWsE379TTazhYV1gXTG7c3ZGRfHN1oH1+rFQIJm24RTahoou+sYyfgLa3PoXXkSy7j4CaeZEyYWRjsN2jB+iZ3ztty+lcCy/pEfCpU9mhA5nQgipUVTpHbeVnS2jOGBugJwAjqk+qMK1r4PhXpy9/JTm/DgFgNXv5dtRpYPGQYglbgSpWnt/vEF5RYaT3o3YL/uEFI3lx12XLuNwUUCPlvX/S1KbGUyuzD1NGPD1pKlnkOauE6SbEus4/RJzPMxz4D/n/QkjySsCfI7CFyyNlt8p3uPcBqiSQD0bKouINrVKuZdFaDczDamLRJJzoKWVRvLDRYZvKQlf0qm6FJD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRBu56+NVsuKPYkH2gqVN4N+jXnclsYoveSN9L+DaFc=;
 b=QLKjf4mXGFXc2K3TRClX1lejBPB8pnKQ0HjaP6Pf9fRg6ZrJL+xut258ffrqPrQ/JEJrpZP4voh9gvn9Bk/TGC6oyc9R8rPKcALu7NIc9xzeWQCCqZoB1edRuvwdqRWTcguEGWJ6F+apcDmtQxI58jmlxQ7JBb7WuacZ4reKoXE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <643e28be-5d54-42f4-b6fa-08ee73093914@amd.com>
Date: Fri, 25 Oct 2024 11:10:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Drop the match_reg[] field from AMD's
 microcode_patch
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-6-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241024132205.987042-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4b3af3-9fd3-4f87-2a7f-08dcf5073b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K09EYmlMSnB4Z2p0c2JlK1NMRmRHM2FPQnF3Z1M0MzdIMWJoMlVJWTdoZUow?=
 =?utf-8?B?enRYaTlpV3Z1cVNuMHNrZzZlQlErR1poM25BOXVEMmZXanVEQU9HUFRCTkhC?=
 =?utf-8?B?QldTMUI0elNRdU5FZFpQbTlObzJnaHBEWUZhZkNqUlUxT1RiSUFOcytwQ3FO?=
 =?utf-8?B?YktZYWhlenRReWtzSlhjaGp6YmJHM2ZSK3BiZm8weGQ1aktybTNFRkV2VERh?=
 =?utf-8?B?ZDdmR2d2TFExdWFpaFA2eGFxN1NTeTRkaWFWQjlXYTRDTG1wNW9zQ01QWC9p?=
 =?utf-8?B?SWFnQ2VTZnpacUZhd3ZUMmtGdnFzTmF3aGIwODhSK2lzZThRazdrZWU1cTU3?=
 =?utf-8?B?OFM1Z1RwMlU1UFFZOVBGZlVXZmM3YlRJNkJJb3BydFU4bks5MTR6TzJYb21C?=
 =?utf-8?B?REFoZWV1TVBIeXNrVUhNOW9hSWlPK1lVc1RlTDNLU21CWC8zL25weFJxZnJk?=
 =?utf-8?B?cHFqZkQ5ZWkzK0lJWlEzaXlxaFVBSjN1Tkh0QzVpNldxNG9tTUZDaWlITVpJ?=
 =?utf-8?B?UUNlemIyWlpXZ1QwYXIvZHk4MXhYUnZ5b3A4WGxGNEdRN296VVA2dmZ6UzhJ?=
 =?utf-8?B?Slk2dUxJS2lHSlpKL0xGU3EvMEIzeTFXY2poeUNBV2ZGWmlhSGtHWUVSUXc1?=
 =?utf-8?B?UzlKV1BtRGthcks1R3czZmFNbnA4cW4rMmRBSVpnR3NhUUxFcGFYZjFSblFl?=
 =?utf-8?B?RTJXNms4YnhJR3Q0RzBXWDJ5dGtzU3pwd0RKRE92VzgxbFd2dWgrVWYyRXlW?=
 =?utf-8?B?TlVSdm5IbDc1Z3JwNld0Tks1L3Z1NGJBVFo1WDgyeVViVCtGeHNtT3pWMHBY?=
 =?utf-8?B?Vmc3a25xdVV4Ky8rOXNaM2tZN1krUDE5UU1NOGw4bjZCS1dlS1BWamkxdkJN?=
 =?utf-8?B?Z2xueDVJeWJEcmFTbERVcUlJN08rbWpFYWxPTVROT2RTNmxaYm9GSFRrTjJt?=
 =?utf-8?B?eVNEZmlJU3NKV0RoYzM2R1ZqTWNFYTJ4N1RDMVRPVWw1TTNiR29wTno3ZEJi?=
 =?utf-8?B?Y0JyRzFvdTJmRklWMXhjSUdyRFpRWktMYjFUSHpDZzNYSEU5YkpNOW1NamhO?=
 =?utf-8?B?N3liZzl0R1U0cm1LMjk3N2MydVJGa1krOHZOVzhMTXY0WFJqMjhyMzhmY0Vl?=
 =?utf-8?B?cnRnQmI5WXJWOVlGaGdiL3NlZHdaL2UrSlorZnNNcGZ0WVd4ekxMeUwrZ1ZM?=
 =?utf-8?B?djBZaDhVQWtGbm02dG9OMHJ3YUtlaGR4dXZNZjdMbnNOZlUvaU1aZ1JLOUFs?=
 =?utf-8?B?Wk5rRHlNam9UZ3pPUU9ZZWkxamlqV01ITWc2ZUF2ajFZVFRmSXBoREJEayty?=
 =?utf-8?B?YWQ2SnJjNVVzNk1HSlJscDNqWHhLdERoRmtWdm8vZVFMY1Z4NXJUTzVOck5v?=
 =?utf-8?B?T3o1bkhtTCttZTZ2K2JqRWFPeUpFUDFGd093Q091RDlWYXZDVFhrQzlxWEl6?=
 =?utf-8?B?dFdZUnVWbU9rZmJxb2c1VnRWaUl5SUZ0V050Um5xQmpwTk5qRG1Ba04zMWVD?=
 =?utf-8?B?dk8rb2FJMWNhVlJxcmNRd2hKZ3lJS3U0eWp5bHQxSFFRTHlDYXRoZXNMTHpj?=
 =?utf-8?B?aHo1TytRK0RuWTFtYmtXRGdPWXNaSHhNRTVTeDV6WmZUS0UycXpVZXo2cnpU?=
 =?utf-8?B?WlY1RFdNb0tSRnNHTCs2T0pJVjJ6YmZUaUpPUnR0bkJzcHNyb2tsaXBlZjRP?=
 =?utf-8?B?Wk5zcnkyREJSUWRrOGZrc0RoZlNiUkpTZGkwazlIT2QvcWE0MWVnTzdCcXV0?=
 =?utf-8?B?Q05oejhuNEI5YzUxdUcwa0w1c0N5WWl6ekxYYmp6YnBrM0tYSnFvSUl1OTFx?=
 =?utf-8?B?OG1LRHVZM0p3QnBsdUdYREVZWkZmbnI3NEVXcmpTeUU3UGdGbXJXQ0FZaFdM?=
 =?utf-8?B?UGc2TUQvR0V4UVhsdUpKOW5Cb1BHbUFlSnlRTkw3aTBTeGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:10:58.5817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4b3af3-9fd3-4f87-2a7f-08dcf5073b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

On 2024-10-24 09:22, Andrew Cooper wrote:
> This was true in the K10 days, but even back then the match registers were
> really payload data rather than header data.
> 
> But, it's really model specific data, and these days typically part of the
> signature, so is random data for all intents and purposes.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

