Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3754AE5664
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 00:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022823.1398676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpWB-0005Ll-O3; Mon, 23 Jun 2025 22:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022823.1398676; Mon, 23 Jun 2025 22:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpWB-0005Jm-LP; Mon, 23 Jun 2025 22:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1022823;
 Mon, 23 Jun 2025 22:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jg=ZG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uTpWA-0005Jf-4g
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 22:19:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2413::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5a6484-5080-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 00:19:55 +0200 (CEST)
Received: from MW4PR04CA0057.namprd04.prod.outlook.com (2603:10b6:303:6a::32)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 23 Jun
 2025 22:19:46 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::2b) by MW4PR04CA0057.outlook.office365.com
 (2603:10b6:303:6a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 22:19:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 22:19:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:19:44 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 17:19:43 -0500
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
X-Inumbo-ID: 2f5a6484-5080-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl6fjI8TSVNOZ9D7zcLCyX0VV7/tb64jJKdwFlmy74tkX+QJqlhkq7/v13IpyvuK7x+teb55tABU/jKEnOvKWAf0Mj9sG5GH6Y5EATCsvZrVQQstfoHUQt2iPkkBqDMFn8uGS97oBpMnqJUYQ9qmbUWFhjfUtIAkWX7KueTTxVRRKn43HbrPa40T0Sc/Zb9oiEldLy8ZIXRdOYmzr45MGwQ3YtL9l7F7Bz4q9iKJBLBj1G2E8tmPKEF53WBEz2tu4u+SYUcbpF/+hvVxmPReoqISMUajb9WXfV0D6HLqsaPV4yBRFYUmD1II9UnXwo68hwt5J3A3wzV0xRY2Z5FHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rt0UPu+S261Zn1+GKpqfNJa+/PTYivDgXJFkd0z5YsQ=;
 b=XBR1lsyh6qQnw5cgje+UVhYy7eSRB+8ezjtnPdvNw4SFpZQuW9YEF/43y2s7LW1tkhVIQnV5Cpb2pJOshQDfTGwNcLS9Xh/rnjXeXOG81PS/nmhjYhTmbF5gie+9fyUyGNaJ/4ztOnPZcQTwQZmzn7FiV8wstrpN0P91dLIG1uT59y3JvavHKAByzPSPI0JtYH5RQ78qY/vOZlG5rmryn0q/j8lL6xamXtUxnHR3dpXje9LLseywoFyaPnxa+HMMxYveUX5zw0+5poFWvdtW+N3fzPGOUSdcXDw6alV0dzqFwGYQ7wtva2pImnzorSidTbw0uqPKbpBuTYoL6u5Qwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rt0UPu+S261Zn1+GKpqfNJa+/PTYivDgXJFkd0z5YsQ=;
 b=FW5QfYXur/8wDDPiUVN6yNTucWY757woMN5lQUlU2FIeMnzSxAoT7iDNY8TcVxycBb1UYwcL9lxyl5v1j8YpFlkOT0HSJGolIdIgZOm0QmFWLDcaWVxo91bcNZSHaJv8IwiEMLKdJoqm2evWTNkgpcGPrfhy7CB/Qhr4YNyZ3Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d0e520df-51bf-46c5-b2b4-41f9150dab3b@amd.com>
Date: Mon, 23 Jun 2025 18:17:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <fe4920a2-4add-4e07-80f3-50eb37de0754@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fe4920a2-4add-4e07-80f3-50eb37de0754@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: be7c3f6c-607f-412d-ec29-08ddb2a40f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXM1dnhHWGpsdHpHbnNtOWlvWVluTngvNHJaR1BHMWpWdkJqTnVTMW51d09i?=
 =?utf-8?B?cG4xbjExUjg5WmFDdmQ3T3daZk5IVEdNSk5XR3dFaGkrK3RXaUZ6K3Qzd21M?=
 =?utf-8?B?QVpzNFA2dSs2ejJZL0FhVXNJWkFJaE5tT0FDcEQzUjdEZTFMc1J2dzFJVWND?=
 =?utf-8?B?NXBkTXhFaWMwVFJxb1phMEptRVY4M0FwRTRreWJrWU9GbHBRaWNWMGdZU0p2?=
 =?utf-8?B?cGtJVTVOeGpmY2kzelVHcUJLUmhUT1I4Z2ZOSjJWbmhRQ0NJek5yVFowRHZw?=
 =?utf-8?B?QUgvVXlXOFJMejFKQy9vUEcvRUM1dXdmSmMyREhzSUtVWS9jWEZwV3lINjBn?=
 =?utf-8?B?ZXdaNk1YM2owRGYxSEFOWWY2Yk9JaG10VmpjTEhkRnFYYmZ2bklVRjQxcmw2?=
 =?utf-8?B?cjBDL3NjWE9QNEtWUm5xQTBqdk84dzduTklsdmZPUkpmU3V3OURUVmJ0Y2Fy?=
 =?utf-8?B?WHo2WUNZQ210ZmRYclFKMk1vS2N1UmFJeDZHZy9nb2w2QVZuTnRCM2k1TFl3?=
 =?utf-8?B?MUloWU1jb2RMQ1d2Qm1LNjBQWkpZd0MrVThxRmhMcDRqMkE0UGhnSTNGby9S?=
 =?utf-8?B?ZStaaGZ5MGl0cCsvV2xWeHlPa0R4L0pERHB2SUZLWmVoN2tGQUpTS09zRDZZ?=
 =?utf-8?B?RzNSVklKNHlYWFFhSWpkaHVBdC9Rd2pnbG9mMGh5WnkrOGdQMGxrTFJ6SmNO?=
 =?utf-8?B?d1pnS2l2SHBvM25NUDVpemhTbnZudThxeXRUdGFyQVl6RXN0VVAvTGRmdlcr?=
 =?utf-8?B?SVhGQkUvV0hPaDdmTUJnL1lJSmk2OGQwaEd0YXJkaWpJYkp3dHl4TlFMd3ly?=
 =?utf-8?B?QWR0WmlHdGE2d1hlR3l0c1RyUHRKbE9BdStpNVJYZ2VndlNRdi85c01HWWc3?=
 =?utf-8?B?Wjk2L3VJay9VL0pPWlF5Wi9mWC9BZnpIaWlsWEJESm43dVZaaGxmN00yOWxT?=
 =?utf-8?B?Sm9lMnFWWmFzbmZDR3o3Q2hTRFFrVTB2aHdpZDREVHdpdUtiV1AxbHJMMzFp?=
 =?utf-8?B?bDZGbFZxTkN5TmJzOVcvYUhESDErMnhXVUN5TG9LOEtDWFVFM0NiV2x1Vjhz?=
 =?utf-8?B?bnJodzJ6UHNPQUZKTTluKzhYdlVhVFdldzZKVHZzMGtBclZ6RkVvVTRDcnYw?=
 =?utf-8?B?NzFSM21OWEhCOUpmcmVYSXhaUUpGN29NV0xNd2kvQ1RlbTdFTzRkSHRZc0Q4?=
 =?utf-8?B?a3hlaGd4aVp6U1RuR0pWU0srRFAwREs4NUNCYlV6c1NVTEZWZktCU3J5UjJX?=
 =?utf-8?B?UkhtZHYvUUZLM2NEZ0FQS3htc0lGWkpNQ3FQUDZtQTJ6bHdreG5HeThaZndv?=
 =?utf-8?B?ZUJLN3ZKYUZ3THlwbjJ3ZE51cWhLcCtBZnFYcWNmR0pDakxDZzRRT0RRM1dM?=
 =?utf-8?B?V2hhRitDQW9EbkxEaCtsK2ZoQlZLL3lXK2QrVFcwd2VhNFBWR1ZRSmZQVEh2?=
 =?utf-8?B?M1k5ME1RWkVtcjUxZkRZNEdsU3JLZUl4M01LcVJ1eTlLbGlhRVRMTVM3ZS9C?=
 =?utf-8?B?V2dzM0pmT0I0ejlzZmJ3NTl3enRWMmZGU010b0dGUXlGbVgraU1lTnhYRVJC?=
 =?utf-8?B?NXlyQTNlMkhvcjJTS0o4YlR2UDJqakFCVk80c2lnMW0rK2lMZ1hnNGk0YWtM?=
 =?utf-8?B?ampSS0IyRHBobE5SR3RUd1FqUGJNTncrNC8xUXViME5kU2RPaldDbTBnWU9U?=
 =?utf-8?B?dGpydFJ5NGpzOHhlOWRBcjVpMllzbFByV2FlUjgwYktrOWNwWXVPZi80RXpC?=
 =?utf-8?B?eU5IdW9Uem9zdmo2VnhCdC9YQUxna3pRZktIM0hVSjl1M2VlMlBJeFA0bjc5?=
 =?utf-8?B?ZnRLSG1CZTZjdWlrbWJBTStQdDh1OWZtYW1McnRiVFRvdElLc2N6MldlMzZK?=
 =?utf-8?B?NzJVV3pSNHJ4cFBCbzQrWFUrbTVGRldBd1Y0cHRqejJkS3JrYXA3WnQ1RVZZ?=
 =?utf-8?B?R1JYZ2xRbXp3aE5pY2NiU3BwUS95UFhVNCszd1UyNHNxN1RTTWpLekQ2UXRl?=
 =?utf-8?B?Z2ZodzFUYnFpTFpCSFpUSXVBeWFXNG9mMnhIWTNFQk1kVkJ5USsyUXJTd2x5?=
 =?utf-8?Q?XJtwCu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:19:46.1066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7c3f6c-607f-412d-ec29-08ddb2a40f96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261

On 2025-06-16 08:59, Jan Beulich wrote:
> Before we start actually adjusting behavior when ERMS is available,
> follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
> REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
> bit is clear. Don't extend the artificial clearing to guest view,
> though: Guests can take their own decision in this regard, as they can
> read (most of) MISC_ENABLE.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

