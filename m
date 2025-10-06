Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502CBBE29E
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138173.1473922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5l6A-0000sr-Ng; Mon, 06 Oct 2025 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138173.1473922; Mon, 06 Oct 2025 13:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5l6A-0000qT-KF; Mon, 06 Oct 2025 13:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1138173;
 Mon, 06 Oct 2025 13:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrnp=4P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v5l69-0000qL-Oj
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:17:53 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db82c574-a2b6-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 15:17:51 +0200 (CEST)
Received: from BY3PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:39a::12)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:17:40 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::83) by BY3PR03CA0007.outlook.office365.com
 (2603:10b6:a03:39a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.19 via Frontend Transport; Mon,
 6 Oct 2025 13:17:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 13:17:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Oct
 2025 06:17:38 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Oct
 2025 08:17:37 -0500
Received: from [192.168.178.136] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 6 Oct 2025 06:17:37 -0700
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
X-Inumbo-ID: db82c574-a2b6-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N47i8OyY1tomglRJgAPSFtfDXoHRmH0qyMpoa5e99EJ9+azQI8tHvjCbXKVNT9Vt44bS9QWmp2i2BNnVRJQOQ37uZi/b4/KpqSxV+CEsq/HXrX34j/1ZZ1QxMPgds8rnukNuvncqKDh2o1G2vCV86y3D2sX6RME22KlDpQMMIqcUVicBDlbqC0YsQ+JPMRCDQfS9T3VSH0ZbH6zqSIsdTza62zrvJfv15SC376IvrwV+9DzGCrfxXf4/trfsObM1lSGo94caluqSJ6Fv68mq9Z328j23ZsSSROi5ftVsJksjDMDhKd8LTMEU749q0mc6XuGTzDLPpnBwdi1wOQVSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJI+YTyaL4sD/ZNSkyggb7h+UOYpwjUzZLn5u4d72WQ=;
 b=SBeTIEe4emhtcW3b91vf00afMykKoACfiDtdWEpcufpaVi75uh6hUDl7ygviKVLg5Nczp+wc5+6YpXSdDpLci3dQbPdcsA1m/7kPBON4beWRmmH8hxbeqj7eGYKqxlB6iXpp1UnGCvDw2Mp1g2sBPEuiD8zaKeQu888hF7TYytsVxA0oUKgta2WBeqRE14rz9HLqsDwSAjG/BkkKhYc0TG2+RR/CKuOi9l5GtMqedC1C6pqLRb+4n2v5FGosqaC53yeY6a0Q2BhdZ/BLvQ7Xm8ksPVSO8JaTLDmE87HMcYxMgCszO2A7WjVCyB3zJygCYsiB+NFgauR6scuQLUjuVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJI+YTyaL4sD/ZNSkyggb7h+UOYpwjUzZLn5u4d72WQ=;
 b=rsOMfQiz3k2QmcAQQEn32Tzjx0aXnRK+9VLN6OHg9hUy8uJ6dTnGzcgbDXrXWpE8EroD8YhwlaBlGwyazDGwYL8JcrEmhi0ETRSm0AV5tKbZMtbCXMTiUYHezn7MC7Fn6vJlxT0E6wBQImFU/LkdeXneWVKdiKx9tmInzmqSp44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <356f0e42-40c8-4320-936d-4e94eb512202@amd.com>
Date: Mon, 6 Oct 2025 09:17:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libs/guest: don't use unsigned long as type for PFNs
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20251006055939.27286-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251006055939.27286-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a35071-5d8f-4df5-dbab-08de04dab9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFlBWkd4cHlET2lUWjU1TEZLQlkrSHEwTG8xWmRyd3VNWGl3UnhxWEk0M2RB?=
 =?utf-8?B?ZFc2bkVOWUdaSkR5aDEva0lqVEdnR2lZNEZYTkJiQjVOZCtPeHdmSXI5T0Zj?=
 =?utf-8?B?R2thL1NxUFBqK3hoSU9vZjg4OEZPak5qd0MwNmVBVmlsWGxYODA1U2VmTzdL?=
 =?utf-8?B?c2hlaWU5RXAvbHBuellzdHExNzVCZ2t1STc3TjhjaHFKVDQxdVNSaGI1UVlD?=
 =?utf-8?B?eXJFZU15WGc3Y2RvejkvN2ZrYmlSYlFzY3BKYzRERXdkdkVFWkpCaHRYT0o2?=
 =?utf-8?B?QXFhTVd0aEloV2ZMY0FkV3ZSdTJQUUsvdFNYeC9UUC9mQ1BPcHBFbWxPTjdY?=
 =?utf-8?B?aFdENUc1eldCb1dZSEVZUExrTjJIU0p1K3k5aUgxNWNpcWdLVW82OC91R3dU?=
 =?utf-8?B?VU1CQnczS3pLTTcycUxHUTdCTElUZ2ZKOWtEMmNWWGowVU0zN0p2U2tWcSs1?=
 =?utf-8?B?ZWk0bzdVNlZ1ZE9ldzFwSUNQajY2VFZTeDVBUWEvTUtEN0RDaTMrd0d5Wk4x?=
 =?utf-8?B?anFxcjdYQVNQR2YxVDI4U3Uyb05leEdFb00vMHBIK3lhbFF0WGYxNVJ1NDRj?=
 =?utf-8?B?QUJHa1pjRVpMbWRxclU3TVVId1RZYXFIU0pFcTNJUkVyaElRYXZTK2YvMnNP?=
 =?utf-8?B?N1dLdEpBN0p5T1VvNU1oMlBncVJBbUpmdTFpOVFQYnFLblJiWXBZNnBpeTVq?=
 =?utf-8?B?VHJwdjVHMzl3UUhlaGdsVE5kR3R1MHh2Zk9zb3ZVMk93NkVnVEZQV21GSHBj?=
 =?utf-8?B?NVZ6a0VhUk9MUlBnRkhTbEltcmlsRm5FUVVqNDRyMFRKblIxOWpXWnkxa2pW?=
 =?utf-8?B?YzRuOHdTSkJ6OEY4VzUxbnMvbU5heE5BbXV6MENWUnEyZmFwVUdBVGJmWEFm?=
 =?utf-8?B?TGxSZDdOdUlBeTloRFpsNG5kaCtpaWlneVIzQjZucEZzelV6Tjl0a0RxalFW?=
 =?utf-8?B?a2FtY0Rya1ZZZUxNZXllTnRVdlh2OXh2RFdYMHZtNXo0Wk1UeGd2R3p4UkRG?=
 =?utf-8?B?dTZVc0N2VmVrM25UVVJRY0xUQXZabW5UTEdJQVNvaW1PQ3Y2MjVncTZHU0NB?=
 =?utf-8?B?VWdtTjJLWU8rYmhTZVNNaUxDTVdvcHI4dkFZV3l4Q0pmM21GZmZtaXN2Z1hu?=
 =?utf-8?B?ZGlhSERCTGdyendtT2VaZ2NjWXhCbVV4THRpcGlwZ2M1THUwM2FxRU5WUFNa?=
 =?utf-8?B?aVpaS3pyS09NWEdYaGlTSllpTXd0NU03WithWGIwemRRUStiYThGRE5BZ2NR?=
 =?utf-8?B?eEVQNnBDM1kyQ0ZNQUVVdUVxWElWZis4M09zWGo1Z3hqZUN0dGhEdkZFR0Ns?=
 =?utf-8?B?VTFlckppVisxYmxlYjlIY0tLV29BdVlzZEtwU1pzRmtRWDE1Y3pFc3JyWUpm?=
 =?utf-8?B?TGhFV1NvQXNvN2ZVekdjcWpURDN6ZURJL0VZalYzN1ZKSHAvSjYxaStLZ1JQ?=
 =?utf-8?B?UW41dzVrVDRMWE00K091dEFIRGIzN1hoV2Y1Y0VWRytoL0x5eUJ2bUJhNCtI?=
 =?utf-8?B?RkhKMXI1WFcwVzNmaW91SDhwWXN0aEhkZmRVWHUyWXB3c0dJTDltNXBhU0gz?=
 =?utf-8?B?TjdKdHhXRklsd2t2ZklZaFR1OTZ6bnZIcHcrK3RvQ0VRSnFpNHZFYXN2VEpj?=
 =?utf-8?B?TjZQY2V3UWlTcUpyazZLM2pQUk0yeVEyVG90M2YzNzZIdGlmeEZqRjAwUEVJ?=
 =?utf-8?B?ZnA0WlNaL1NWcXJobVM2TG9rd0tTQlBCMldJVGVPdHhqTXdnN0EyT1hoZ28y?=
 =?utf-8?B?ODFZR0svcEJ6NVI2MFZGZER3MUtvS1RhYzU5NSt4VTZiK05JOTVKTEtscmVu?=
 =?utf-8?B?OHIxU1RNQ2VmK09CMDhqYUtEOHljampFbjFHS2lCMVlGWHF0b2xHY3BxNTJP?=
 =?utf-8?B?VVJmMHVjZUNHZFBvM2RXWFRNM2ZSYlBJNVB5cXdjQ3phNWhlZjVzeUd2TmtC?=
 =?utf-8?B?MUt4Q3JTK3ZQMzVYRUhBVktCYS9hVHdvcmZKLzhBR2lRbTE3aTJMNkQ2VE9J?=
 =?utf-8?B?c05qSnZDMWRPWVdIdkY0ZERtYUcxelB6V1JTQ0gwelpWQU9lRDZnRUhsREhP?=
 =?utf-8?B?Rnd1NzFQemV5NmdKUE1tYVljZUwvVndqcjBVMFYwMVlVUDgzelp0THhETzE0?=
 =?utf-8?Q?8IRs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:17:39.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a35071-5d8f-4df5-dbab-08de04dab9a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

On 2025-10-06 01:59, Juergen Gross wrote:
> Declarations of xc_dom_console_init() and
> xc_dom_console_set_disconnected() in libxenguest.h don't match their
> implementation in the library.
> 
> Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long.
> 
> Use xen_pfn_t for GFNs in the library to fix that. At the same time
> change the parameter name of the implementation to console_gfn,
> matching the interface declaration in the header and reality (it is
> a GFN, not a PFN).
> 
> Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
> Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - switch parameter name as well (Andrew Cooper)

Thanks for doing this.  I ran the original series through CI, but didn't 
know that omits an arm32 toolstack build.

I see it's already in the tree, but here's an after-the-fact:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks again,
Jason

