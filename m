Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C23B33E57
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093037.1448621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVgs-00067k-03; Mon, 25 Aug 2025 11:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093037.1448621; Mon, 25 Aug 2025 11:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVgr-00064a-SJ; Mon, 25 Aug 2025 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1093037;
 Mon, 25 Aug 2025 11:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8CB=3F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uqVgq-00063v-Cv
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:48:44 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20618.outbound.protection.outlook.com
 [2a01:111:f403:2408::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5c0f1a-81a9-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:48:30 +0200 (CEST)
Received: from MW4PR03CA0118.namprd03.prod.outlook.com (2603:10b6:303:b7::33)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 11:48:24 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::22) by MW4PR03CA0118.outlook.office365.com
 (2603:10b6:303:b7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 11:48:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 25 Aug 2025 11:48:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 06:48:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 06:48:23 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 06:48:21 -0500
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
X-Inumbo-ID: 6b5c0f1a-81a9-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD/LJE206aQRBGmdDDs29KNR2qNB154/Si9n54Gs1crV+SejJWt+t4u+46INiCPzx9ECayCZL/a3w+RnG3zLjmgCkwF5l7Tn6UTeB0Mlj6oayZ8LHlcvynZmRGfgIgxrJ4/vtGzk3wAIY5VYsHJIAzbR2SL+PloYNKPl7Vr0dDSUXz/SPfj2M5HMzXkSlz8Fk8846jPIQmsKFRWRuQa92/JrTFzK/59ujpudmzjyFRoFzSZhTu6N/jPdjr0pO1aJELSHmU+R5WMOTYbydfm0d0AmJWwdBkCvuRSclPP3iINwrUt2IOD6Q0qAQti+VEGQBm3Nf2hVZZ2X1/5LE086bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+2vB9Yh8cZsFhuuyXYV/KJRQJbXQx2ZP0o4Ye/uVsQ=;
 b=WFB/YKbizlGUfnkmR091c6T2L01FFf1DsK/XKgT3kvhjqLUp5SWKCYyFdN8/SCEcIXPMaTA89kLYN9F+Lp0MhlBUWVmjINbLs5KAycBtcyjViU0P9T4JOvuMQDxiCgvj2eO3vBwYy+QKffW1WwrGMFb97ZurjIsHBgDtVxmkYt+wa8AfR1POYuUUbaZ4dfZjFEpzEiSlmAGYixu78sZuyaMI0UVlMOd6gjPQaEsEYYPBwtdGUqVAz8xrlmmlravTBpTwSA6HqvdWZJH3R2jxoB/Im3tBrlJiAjNDI4p2oLrssnNWT9lFeYOg5euVVdy0Ih0nqcHewZah5SNdHOqJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+2vB9Yh8cZsFhuuyXYV/KJRQJbXQx2ZP0o4Ye/uVsQ=;
 b=D7Txe7f3y/nmEnTO5BAvqif7MfQtJrM8xUmhdiZrY0eGFoy38vmRJvZYPjFxUT+iz9EBUg139Oco+KmQW2k72z/yRyWngfwOoV0IpTYqvjGyyrJy9430hEmOi5aQtV7z4RJHm87zxLgnMl3JPI+8GtrmPDQtL0hi2gAUzvO6vno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ae832a03-0679-4809-bf01-34c7cdd8a72e@amd.com>
Date: Mon, 25 Aug 2025 13:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Arm: drop assertion from page_is_ram_type()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <753ce2a1-8d9c-41ba-a066-abf6f625cb60@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 740b21b6-8fc3-4d80-ce2a-08dde3cd4c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFdFQkIvclpTTzA4bVUzVFQwWk94MzdaMWRtN2xETW1UaTVKVXBuMFZEbTEy?=
 =?utf-8?B?bzdLMnlaUDNTYWljckpkY1J3TVZVaGNVREl2dlcvQVMrRFpjdGU1SFVYY2cx?=
 =?utf-8?B?V1JFbGlSZ0ZJUTlFV1JOeVN0TkdsbzVhR2ljM09Od3o0dUtqWTMxZWRHNmhi?=
 =?utf-8?B?eFZtUE9HaFlCQ0dncVJpbnpFaVdGSnRDK1B2emhPTG9LYU0zT0t1cEs3dDVQ?=
 =?utf-8?B?WEc0Zll1SXZCdHdRd2lBTUpBaWRaLzlDZGhpSUEzdlBWQ0xDaytUUHdmWmYy?=
 =?utf-8?B?OWRNWHk5aWtTKzlZUVZjZ0dhTHZDK1NGRTFqOHVoQzVFRC8xQm1YNENZK1dG?=
 =?utf-8?B?OWRuZTNFMnNIeFQ5eWpnZFMzb0FuQnI1eG9uc2hVVVc1RGVVdm9PcnNwMkxR?=
 =?utf-8?B?VHI0Rzh1NytpLzNxTXQzSU44eVZ5d3hHNytZSFZvT1U2dGY5S3ZIK3dvWHZx?=
 =?utf-8?B?VDhoYkg2dGVZRFJXekFYWWo4R2ttTGZGa1JNRkJYOFFWMStlVWJlbGU2dXpM?=
 =?utf-8?B?VFl5M2NFanZROXF2czQ0cGlzbnhNTW9HOG1wVWR0WHpXeXQyRkR5RDRsV1pw?=
 =?utf-8?B?TFpoVUhBcUVxUFgySEFWS2hmaXFtM0EraWhWVktNaHlzeklaTGgzKzZ4dm41?=
 =?utf-8?B?dlgydVZjZllnSnByOUlMRG9WM2JrN3o5WkhCSmxBcmhMTUwySTEvNUpQUXVH?=
 =?utf-8?B?aUFlc055S08xeWl6Q3g5cTJRRGcvempucDV2KzhYRDlIM2I1aGpGMUtDNitk?=
 =?utf-8?B?OFFEVUZoNFE1SXF6QnpvY1Q0NmlLakRsT1VxYXhJY1pzcGVRMFUvdkErTjNk?=
 =?utf-8?B?QlRQL0QzTkg3YkN6OVFOWFpQS1Y1cUl2V0VUUEJjRStYSTA4RGRWbTA1cDh1?=
 =?utf-8?B?QVNYUlhjemtFNm44MFY5OXp6bDY3dC84UGNiL3loZmthU1hBU1BZeVdYNTJL?=
 =?utf-8?B?Z3hvOFFuc01rSkJhc0dqaUpIWGtOVmhiV3NqMmpCdkwxWk91a1l5UTYvWTlG?=
 =?utf-8?B?dTRVdXBjc2p6VUxXZU8zYkJIY1lQOUVnSXRUTS9QelliYm42VVlhZmVnekQ3?=
 =?utf-8?B?VEVNTGFwQ2JESE9SZlhvTEhEUDVoM3duRDR3UWpJSzZMTG4xMlh3TVI0QmxK?=
 =?utf-8?B?NU9UdFp5WlA0NGtyeDhRbEhHRTB2K0NWcTl6OUpJWW5nVFdWeFM0VXNFUzVW?=
 =?utf-8?B?eXBRVDNISUxFbExUbXowMm9HRUtxa29pV1MwOVUyWE5NUHlIZTcwZ24xcEpK?=
 =?utf-8?B?YUVQOURocTdDalZYSi83eGVqVk9nNno5bXFOYW1PU0ZFVHR1WTBQTTdmRXpP?=
 =?utf-8?B?Nk91c1lZRlFnSU5qL0JuQW1BOTZBN0RCeGp5VVJNNk1NMjQzTWVHMVozS0Rq?=
 =?utf-8?B?WGZRWWtrbmJzYkNQYUNMV1p5QkxNV2FaRWdNQWhHeHZ3Q0NNSEErdko5bytk?=
 =?utf-8?B?eENTQ1RDRFJ5ZU54eE13MUk2Q1lnTFFGNmZLdVNINWR0ZWhoRjFHVUdtcU5D?=
 =?utf-8?B?UXRocWl4VXJJdDRlenhEVDgzc1NQczJmZFNhL3J1QS9Ea3NpN2U0OXNGakd5?=
 =?utf-8?B?cGMwYUJxWXFQZWVlVlVXN1VzeHVmeDViUEQxK3BKcnJYTEZMTis1TkNPR0dN?=
 =?utf-8?B?TGRJNlprUkllYXY0OVJnSU04WElwbVR3RHBGZ1ljTGdwb3pJUFFWaFhLcGt1?=
 =?utf-8?B?VUZCbnVubGNKc3pKZ0ZRU1RQZWJlVkcwMGhlVHAraS9iclhJMmdzaVFvRS9H?=
 =?utf-8?B?M2V3ay8rM2NoUllMVHNkZ1RjaElJdjBDODk1U0tMSnlIS1YxWHRPMEc1MFRj?=
 =?utf-8?B?UEVZY0NDUE54MFZZK2dLajgzWUxtYWVXNytEMWVGb1FTTDZZbFU3S2xRbytJ?=
 =?utf-8?B?WDhINHhSSTgvelpJS3psblhGd3N6SnVsVjM5ejdwVytXalFaSHlPbVlXTitU?=
 =?utf-8?B?M1huVEJ3RjVRTkNZMWF2Nkw3RUgvT2ZtY2NuMkEzKzhtYVZXd0E2QW1seTVF?=
 =?utf-8?B?dkQ3MWdNT09ySmsydU9tcWZIZTNVMUt4dFpiNGpFSlFTUnA0ajZTL3lycHJP?=
 =?utf-8?Q?GKNYbj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:48:24.0092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740b21b6-8fc3-4d80-ce2a-08dde3cd4c1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269



On 18/08/2025 09:55, Jan Beulich wrote:
> Its uses in offline_page() and query_page_offline() make it reachable on
> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
> code added. It being reachable was even mentioned in the commit
> introducing it, claiming it "clearly shouldn't be called on ARM just
> yet".
> 
> However, dropping the assertion from a function of this name is deemed
> problematic. Rename it to better reflect its sole purpose outside of
> x86-specific code.
> 
> Fixes: 214c4cd94a80 ("xen: arm: stub page_is_ram_type")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


