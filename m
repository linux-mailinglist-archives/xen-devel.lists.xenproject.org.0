Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615CA242F0
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 19:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879991.1290179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw3X-0004GH-2w; Fri, 31 Jan 2025 18:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879991.1290179; Fri, 31 Jan 2025 18:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw3W-0004EQ-W6; Fri, 31 Jan 2025 18:47:54 +0000
Received: by outflank-mailman (input) for mailman id 879991;
 Fri, 31 Jan 2025 18:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkmC=UX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tdw3V-0003fO-UA
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 18:47:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e03c3859-e003-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 19:47:53 +0100 (CET)
Received: from PH8PR22CA0007.namprd22.prod.outlook.com (2603:10b6:510:2d1::12)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 18:47:50 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::17) by PH8PR22CA0007.outlook.office365.com
 (2603:10b6:510:2d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 18:47:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 18:47:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:47:48 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:47:48 -0600
Received: from [192.168.195.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 31 Jan 2025 12:47:47 -0600
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
X-Inumbo-ID: e03c3859-e003-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkOTi/NZAqsfqVZ/cTvJNmkaFHLjyLECLN6nPrO/z66+LTclOHT91/KESy+oYr05iv+zhqK2kT5Z1yxohLi/+JEoStpNCYDK0W0ej03S763XV5GfsEoPKQHJY/Sh/JOlwefXnEOchXhHiBH10JzajYAjEijnALmN14m0MEcBOdeJYRO++8xOFNl6we5kcaWoB6VZ9ZT0nY9sUZC1ngPcTaZfVqzeryVRWD6WNaLUUiGnTR09SiN1jzJX0gysgyA+YEZ6XL6MsMxOo2eSsdFh9E4gWlT/Oh0sIVyG499SSDsoxgq6s2EDUUZ82jnCs7c84NYsgY0VlhS4HWZvAKvs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdW9BHmbZIuzIXj8SzYB/3tDcdqiTyB1q2jcwLykmxU=;
 b=A5wL/BJc3jNUkkhc8SZQ/92r5nEJJ8XP2cP+rtXxq5uIAAZylKKHHBEUZEG56csAL+GixHhGKJmayzJA7jqEcysAD2nBtUnlD4TVPtldX3gHcvLSSsyPd0YAy/QqiV6COvfCz7Rf6LBxDbDc5yKuWtSbaRBaaqzEzpsf1dDmbTw3oYJ4XLojGw4TClR2yx8blDpcKf0cBMPa+HpYCoFiO4neivbYms4wOPV8WCDRZK+gVmWGCjO2MX+ZCoPt8oIc1Xmg63Tx8eu2dKMNVawZ7Kr1zwh1wjpWsoHgEjOPsYgNiD1Vs389KXv9CBvnBbImNSvYj5zzh1IOclSJNm0IpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdW9BHmbZIuzIXj8SzYB/3tDcdqiTyB1q2jcwLykmxU=;
 b=bPteVIqNe3MGtg10eCwfXVtQ3dVO3TTiHwgUt5dFrRWLlG1Sc/rFu3uhOcsIyQ31Nv5aDiWpK2yw7NqwJzZ4FD10/vUEiX7XjXvfGCh0dFGz095L4ebNgeGWjno8fnMRWD0IPtgf4aOj/TLyPPeVrDLeVFU0zMRathOgpu/A/Jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9cc2c848-583b-4c08-a886-ffe3c7ca09c1@amd.com>
Date: Fri, 31 Jan 2025 13:47:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 3/3] AMD/IOMMU: log IVHD contents
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <b0b8c35f-5c88-46bb-a882-9ff737683367@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b0b8c35f-5c88-46bb-a882-9ff737683367@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: cd17cb9f-da9e-40e3-4b8c-08dd4227c2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDlsMldHWk5DS3l2TjEvN1dSak5oQUJVTzZqc0pFYk0vS1M3d2x5cTdjNmsv?=
 =?utf-8?B?aWJnVWxlSGFVWmVKbEUxK1YydWRkMVFhZVZQRXNVeVo4WkRLam5ZRVRUdXRS?=
 =?utf-8?B?YXNIcHIyMnRpeFFvVmlDUVovZ2xVQklOYjNHQytyQlM0eEk0VEpxS1RQRUVn?=
 =?utf-8?B?M0pVVHRBcDJkbUR5cTFxazZNM29jTGlwcGdZNVMvWEh5WTNaL0lmNkxFbUln?=
 =?utf-8?B?bG85NXBNcmc4cno3MTJKdklYWnhMTEdCK0hZdVJxYlROem5SNHB5NEpFRHhL?=
 =?utf-8?B?TXIxbW9NNzFIY2U5ck84NjcvdjNSbDlwWHVxRDlHVVNnVUNVaFVLTW5lazYx?=
 =?utf-8?B?RW9HWVQ5RXZZVFM5YmxTVFoxVFFOOG51WW5GQWg3OGcraVRPYnZ4N1ord0ZQ?=
 =?utf-8?B?WEdKWWMwOUQzVGd2SDQzOGlWZzFvVHF6M1ZJWkpNdC9rc2syamVMUE5iaERJ?=
 =?utf-8?B?ZW1rTVBxK21YeHN4QXNmWnE3WndhdzRyNGpaVW43MzlsVW13d0VqSTlOb2Vt?=
 =?utf-8?B?aGNtRDdHZTJaaFRUWG01TDcwZTZqUk5qZXp0bjJMS0xNWVB1ZU9BVm9HMXN2?=
 =?utf-8?B?amljYWFqQ0FLcTh4d3JaK2FaTGpKL2R3d1ZBdFo0S2FCQUNSR3RUSG5MZXNE?=
 =?utf-8?B?N0ZRVmJkMmVac1BpbXpvN3RqQ2hFa1F6bEFJOVJGbm5nRWxGbGVTL0hxRUdO?=
 =?utf-8?B?WVM1RTBoMldFc2NzQVA5cHl4aWcyM3VNVStFZ1dVbmhzUWpqb0NoVEprSDhy?=
 =?utf-8?B?R3p4U2xCdE5udHk3Y2Y0SitWOHl2ZDJ6TmoxM3NuWHN2SFkzcVMrVlpiK2dC?=
 =?utf-8?B?ZWpLcXlFMGtwamtycVNCSDdiaHh2T3BSUVY2c0FlZm5jZERKSHRGeXBEYVUw?=
 =?utf-8?B?WFJibVh3Rkt0WFR5dHZuWVlJc1ZRajBRZk9DUyt3a2pOTGx6ZEtLVEs0bWx6?=
 =?utf-8?B?S0cxSzlITzdJRUg2a2hOVVNyWmFrSG8wYWwvcTZjalpXVkszNEZVbmxmT2hH?=
 =?utf-8?B?ODgwSnpxekxPTmR4aUE2SzcyelhyRTFYNTNzUlFEdjJrbEtzRkZ6Rmw3UE5Q?=
 =?utf-8?B?KzBpeCtnK3FNdHE4WGI4OWFSSlRvSnZBOHN3M3V3NmRjTnNGTjVyMDF6cDhY?=
 =?utf-8?B?NDdTN3ZSRVVsb25KVzh5L3haOFhkZE5vODhKaWxJR2ZLanpxVFI2YVlXZlhU?=
 =?utf-8?B?LzVEenI3RkdYTzNtbUpmcVRqQjJEd2hJSTYxenFJdGp2SENSOXZSZEpsbTI2?=
 =?utf-8?B?VjE0b3J3UUFhbFZyVUFXOEVTazhSd0ttVmxpRmI4WDJQQ0RDcDBLamVoV0ll?=
 =?utf-8?B?eGdnYXNKLzVMNU9wUUUrRmtIS2RwT1FXbUlSQnEzeE5OR2ZMbGs4V0xzL0RK?=
 =?utf-8?B?R3pMY3lHUW90bGpRVEVwUk9jbzQ3eHpOY1h1eUdKNjQwaHUrbk5sTzQrcjB6?=
 =?utf-8?B?Vkl4ZHVsRlZ2Z0hiUWpFelpQYkFLdEVDUW9LSzQ1VTByeHYxNjB1WjlzVUk5?=
 =?utf-8?B?VDcvYm8zZmRIVlVFMXRGbTg2QjFLb29adFlycTA1RDBsT0JJMkVWcTBaMG5w?=
 =?utf-8?B?dGJtYm5LdjUwaHNMamd4UWhNYmMrOFpLSUY1S1ovYmU2ZW9nY0tTZlBhRnpS?=
 =?utf-8?B?bHlSS3lzZFFZSjNRdDZtcnk1QWYwc0pmT3loSGU2TXNteUNWTlpKQllOVitv?=
 =?utf-8?B?RlZONUJLSDZmTHJpNW1PUzhsT0NJaFQvbENTcjVZaEtTVklsZXBYY1JKeDE3?=
 =?utf-8?B?MmFTdk95N21HK0ZZWDJLSXdKb3g2K0ZkWitHY05Lek1lcFRFN2txb2ptT2tN?=
 =?utf-8?B?R0Z6ZElET2tVcjB1M3ZNMUQ3NnNOckZ4NkpNOW9SaUl6Wng0ZXhneTZIaTVm?=
 =?utf-8?B?UGlLNk1tY01lZDlyYU5NclZlWnJSSm9NVEd6dDRtMW1mb1dENVlndkErbnQv?=
 =?utf-8?B?QVA1dkFYVTRreGVvVUQydVdGcXU5akdzWW5rekxQeU15YzB1V01xUVZzU2R1?=
 =?utf-8?Q?/4xD56P6rJihNYcXas8J2Fw7/VU4G8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:47:49.2185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd17cb9f-da9e-40e3-4b8c-08dd4227c2af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571

On 2025-01-30 06:13, Jan Beulich wrote:
> Despite all the verbosity with "iommu=debug", information on the IOMMUs
> themselves was missing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

