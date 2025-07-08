Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA1AAFDA2E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037422.1410071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZGBL-00047i-MQ; Tue, 08 Jul 2025 21:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037422.1410071; Tue, 08 Jul 2025 21:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZGBL-000450-Jg; Tue, 08 Jul 2025 21:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1037422;
 Tue, 08 Jul 2025 21:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZGBK-00044p-61
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:48:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 564bb0d5-5c45-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:48:52 +0200 (CEST)
Received: from BY3PR10CA0026.namprd10.prod.outlook.com (2603:10b6:a03:255::31)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 21:48:48 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::8e) by BY3PR10CA0026.outlook.office365.com
 (2603:10b6:a03:255::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:48:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:48:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:48:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:48:46 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:48:46 -0500
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
X-Inumbo-ID: 564bb0d5-5c45-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJFIjPJfNRRYnlqeIBv6Fy5RrgMGxtYTmlHnM9dD8aBW8OaZ+NgchMFBKCfe26rrncS78o5CYIeozNz1Xq5t/AhOpF/rIcXLhCfe+uXWlc6McEMgnSaM+YqSyrBHIpWXBsv3HhitDdklUDk9O0dpLrH6oMLG9v3r8Yx1a/RMFCAHehkPCVxWu/o2p01GlmIj9zoz/KwN1n98OCepIPkh2guxCUZk7+XewLXl3bJYNB8/5IAksAobmfUjgR8d8q1HHeYIwBhuybqoJvu+bamDaazEPNftf9RcqiJcHFILmbezCcyxsxvterfmXuPxFEPfk6HncsIInTczwN5vChDHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VTuvi/1iVG24eOeiUxjBhbanE8EmZdneHeCPHZ28Nc=;
 b=K/pgwV+zFP8u+19YuUUqnuBVdqt4BmRQmp+1OgmduwteKIw8dUo7bPu5rQkInSsb6BpjG3UJsnivwqn83p916Lcp3YR52WddaZJ/DHS+tXn0rtKiW3M6J2Lw87xkUeursgAyTWp3QiQ/CiuuRbQrQEwNk+qnwzF+6oVTdWyv5/6ZuqqeNIvfVycZPK6HhzG4bl/+qFk77ziA7SH5zJd0rHdJrUPkgZIGzU4cNY8LlA3vaupDtNnwie5Q2lmLj1aCo45IGjxjItLRqp/jknl53qNgfIrGUI5d1Zg3JtzvFVf4iJZ4nOpioqfbCPJWhtbuxc0FKmCK/To8MBkLvK7w7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VTuvi/1iVG24eOeiUxjBhbanE8EmZdneHeCPHZ28Nc=;
 b=JaKf7uLGSa0xLUGxAmL9V1jU4AtZiZJhLZjgg9D3m2LXkpfxv79ILt2D+87p4IwqEJ5R12BBhzFz1c2/Ltyxfmr4EpuwfmzpX99Qjid4pN+PP1lPCt+HrifG89kQG/guVYsdZX6ZY88sFGkJB9HwYTYG2wqFPN6VqhuI1+7ppSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4defdb32-8897-4c4f-a105-15744e470b19@amd.com>
Date: Tue, 8 Jul 2025 17:31:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 10/19] e820: use special type for software
 reserved memory
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-11-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-11-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 0920a6ca-fdf2-467b-9b09-08ddbe6937f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWRjUVQzUEkrOFUwNFYrVXpkOEtXeS9yU3hPZFB6Ym9hejZEM3R1VHZzTmp3?=
 =?utf-8?B?VVBGK05udHpIcFJBdGxBSldueWxtbDdFZ2R2VGdmSkpHUWdlVEZPSW5zUTl5?=
 =?utf-8?B?QWIrSnIrVGI2T1BRWUd6SU1WZDB6T3hHbWxEYkYzdGpmajJJSXc5V1A1T0Ju?=
 =?utf-8?B?VTZRbjR6UnRRV2xud2ZJLzRSWkhGTCswSWlvOVFyTTZiNThjeStVK3NveE42?=
 =?utf-8?B?aEdiOHV6b1NWRFdMa2ZmQ1lIdlUrZkpKbWYyV2Noa0EwSGV3SHVmUmIxNGZM?=
 =?utf-8?B?cHpCMk9yWnp0enBpcmc5T29uQUNDYjh6eE5tMHE0aFVHTDVWTHRXajVEN3dZ?=
 =?utf-8?B?QUNzUG40RVZrcGZpaGRQdEZDTlRyc2Fpd0ZaZXZPYUlzemE2Wk1oeG5qbTFB?=
 =?utf-8?B?anJxNERmeWdzSkpGc0ZKUWlMK3RyeDYvTkh5a3QrYXNTUnowa3Q1VUxYN2h1?=
 =?utf-8?B?TGVWK2I0OXpJa2d3SlA5dzlwMEhJektpUURXRUFEL0ZRWHJoMjJCUysvN3Bx?=
 =?utf-8?B?ZHM5SkpaL01mNXRWaEtrclliWTB4SXVoU0xwMzJ1d2pLKzdUMHhxbmNVRnpP?=
 =?utf-8?B?Y0k2VldZakVjTVBMRXJoa3Y5cHdkR2k5OEpJcXY3NFExNis1SnEyYm8zRUNy?=
 =?utf-8?B?SmkwT3VtblVmNXRUWDMveHE5clBNcjJGSGpNZ3lOcys1VFdrc1RncjJ3aWc0?=
 =?utf-8?B?eGRlODkySkFIVFhqZG53K0xmQkl4VXN3dTVtZDhpZFVaOXIrWkdvRGVsMGtT?=
 =?utf-8?B?OU1ld2JPM0pxWmlzTDFsd3JDc3Z0eXlaZWdCM1dKQ0JvaUtkT0UzYmZXN1Fl?=
 =?utf-8?B?Y3lEMit0ck0rcTlSRlFlaFZRZ1VjeGRUVlhkOXVsNkt0dVZmaGhMK3BQU1hU?=
 =?utf-8?B?QTlPYm02R3c3MVdqNVdUUktJWkdGL05VWldKMmxHempDZDdhNGp3VUlmeklx?=
 =?utf-8?B?cVNYOHJ4Sm8xQjQvTVZYZ09rMTdYTDlxdzV6UXlMemlYRTV5NkJNam5mZU5a?=
 =?utf-8?B?aEQzQUVUVmJKM3I4T0lMVnIwYUFjaWh3N3pRbURHV0hZcy84clMzcGI3RXhJ?=
 =?utf-8?B?NVFTTUt5Q0FBMmt0Uzc4K2JqeTFzdGY2eWpCVG1UMllNR2RFYXdUa3NDbzhQ?=
 =?utf-8?B?ZW9ITk03cTFZTFFWOERSYkgvd0F5YWVjb1dCUWZIc2ZON2szczdqZVdBaTJM?=
 =?utf-8?B?ZjN3QnBVcTNqbE5kNmxwNENUeUJCOEwyajU2UFlDUFVlT2xSSTRoUWN5ckFq?=
 =?utf-8?B?UXBkRTF1L3FQMWtMdXVacElKbkc1NHFtU0o4YUZ2enBwc3NtbmZ0VXlFK3V2?=
 =?utf-8?B?VjBlT1ZEUVE3Q0Nsb1h5MkdZY2VmVFY3ZU1jVk9DeFYwckJtbkJ0WURlL0la?=
 =?utf-8?B?aUJ6bjgyanBBZ0ZraFE3ZDVQd2JpblBxN2x6TWd5Tyt2MEVEcWhuQ291L0Rj?=
 =?utf-8?B?OFNJeVZoMEU3cmFhNy9tdHNZcnhMVE5WeE4vM3g0a3VZa0N1NEN4anZYdWQr?=
 =?utf-8?B?NWVrR1dWYWtodjNhd2dmeTFVeU5VUzZpUnJnU0FZUnJhTE5jRTFJdksxWmY2?=
 =?utf-8?B?dmYrRHhnRzdkeS84RTN5cUF6di9UcTYwL0o2Zys1Y0xGN1praFhpZjB3Zkpn?=
 =?utf-8?B?d0hueHFFRitiVWlzV1JrRmRoZTNSZWdSSGlFamZrT2ZPZVFrVG84WXBpdmRR?=
 =?utf-8?B?WFNRQVoxbk5VcDlYWVhkUG0xd0hTdEl4N3N6NWxhR1VSOG11TUlWdG1qL2sr?=
 =?utf-8?B?Y2NrdDY4aHcyZSsyRDlTcFhTWXZqYjdXRjlFdzRIcm5mdjZwWnYrMFg1NjBv?=
 =?utf-8?B?blhmT0RLVGdIbWFpSzB5UFRESTEvYXNTZzc2ZWZIVHZKWmRLQ0xDTjIzMTVl?=
 =?utf-8?B?M09rbk4yd2ZSUnE5TWhvRGVYaEt1SlJMQlIrSkVuMWprd08zSGFnSzZuTDc2?=
 =?utf-8?B?eEloRUt3U1lWcmF4WEtJK3JNQXhsdk80QmZjYjNMWUZwQlhFaU5RenFCemcy?=
 =?utf-8?B?aHZQV1Ixc0p3QlZPL0c2L3FTNVByOUpJRFVlclVWUWRwMlkwU20zUmdlTmZP?=
 =?utf-8?Q?9U7EMC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:48:47.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920a6ca-fdf2-467b-9b09-08ddbe6937f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

On 2025-07-02 04:12, Juergen Gross wrote:
> For memory areas used to map foreign domain memory Mini-OS is using
> the type E820_RESERVED in the memory map today. This is causing
> problems with kexec, as the new kernel should not see those areas in
> the memory map. Unfortunately the sequence of actions for calculating
> the size of the memory map and the removal of those reserved areas
> can't easily be adjusted to do the removal first, so another way must
> be used to avoid passing those reserved areas to the new kernel.
> 
> Instead of using the type E820_RESERVED, which might be used for other
> pages as well, just use a new type. Areas with that new type can
> easily be filtered out when building the memory map for the new
> kernel.
> 
> Introduce the type E820_TYPE_SOFT_RESERVED with the same value as the
> Linux kernel is using for the same purpose.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

