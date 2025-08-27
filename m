Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5251B38585
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096248.1451013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHYj-0006Aw-3s; Wed, 27 Aug 2025 14:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096248.1451013; Wed, 27 Aug 2025 14:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHYj-00069o-09; Wed, 27 Aug 2025 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1096248;
 Wed, 27 Aug 2025 14:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urHYg-000691-Rs
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:55:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf11d7d-8355-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 16:55:28 +0200 (CEST)
Received: from DM6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:5:190::18)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 14:55:24 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:5:190:cafe::c2) by DM6PR11CA0005.outlook.office365.com
 (2603:10b6:5:190::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 14:55:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 14:55:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:55:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 07:55:22 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 09:55:21 -0500
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
X-Inumbo-ID: ddf11d7d-8355-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciJe9IKyctf0u77Y+mrCOYR3VljjHgPhBxsj/PraJ9TsBPap1Nf7FhTxgDSInZrLoJLoeFpC8FS5zhl5Uk3MOIbhGYvRc7V0qg8rOeU0NKmL1/IsDUjlI+LZiOwQkK2Ku8o9D8eCiwHMEM2mFlAxWHJo8Fh5LHVfLJVDvn5k7GviRuMVPzbdm34EdZ42vJwG65C09Ro6KsGoqH0Q0MurnsAmoUL6IYRIXREY1e0qDB8UKj/sBkUZg3ALdtRYcznS1VKNJ1DjPRfOl+gaNTSbXxfM8qA49WHJ3AXGzEIImmA+35XIrrU4hXEMOgJehBxr9d6XAu1o1cnOhxGhJ+rxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNfKU4GWh5flFGI2AzG3Eo3XRpidf3UhFzbgjNHV+sA=;
 b=nhYVJsEgF3CRkpKoKp5sdRr0e+JJ0RJ5Kw72EEngE6GN6vUjRZO8Nw0Ugdb4v0FN3Gkm7w5jHQInVRFdG3LRGF5RMdT1LuDTdnnMjg30bsU7vccZr8vJpO0snADfH51gGXow5urMSmJ+MZ9WSmfHRW68PqLM3jLqvq4CxfcHtz+AVljcPlKnHB4wEP3R/ktwpixpbHD4/SStB8qm7vVZ0w441SUkPt0jsGAFRz/MatK9/KQJlQbJXa9LvOPQTlesJWZ4IdveZXpjPk5vPzvDyDiHHDeRUHe/WxWLW9NcATEbs6F0mvU29SeC9pV7/D60bmTTMKEePpdgY92cOHBlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNfKU4GWh5flFGI2AzG3Eo3XRpidf3UhFzbgjNHV+sA=;
 b=M5nViirZgzwbxGdpaljIr+cv5ygOr8TgXyfcxy0WXjdhLznxL4x3O0Pqjlu81BAjCXWu67pbDkgWvceu3dTb4DLR55mOPvMyeIm5DKp4ffydXW29hHQIM9WP5FAb7h0q6S4SByl/ExSZq8nhWS54Hgo/Tb7hve0492hnCW4N440=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e3d4960f-935f-4b0b-a987-e6850aa51d63@amd.com>
Date: Wed, 27 Aug 2025 10:55:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/11] libxl: Remove duplicate
 libxl_domain_config_gen_json prototype
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-3-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-3-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6326eb0f-7f8c-4428-e5d9-08dde579c01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmNVUEZPeVEyR2hhUXNmZmVTeVFlQ0pRUFRqZUszenhJMUhXS2ZENFhXL2R4?=
 =?utf-8?B?UWRIMUhuTzFqWUxFVjdEYmREcDN5R2NZU0V4Y0tyLzhkdkh5bE5tdjRhSmlu?=
 =?utf-8?B?WGdQSnRTa05QUEdYMFJxbWFuS3BNbTd6b2JENW1wOHZBMHVONnY5dStqa0R3?=
 =?utf-8?B?YVNNZE82ak5tUWRPZUdaejUvWnpMNlBFL2Z5ZFgydVFnVUlrNk9IMWxKYjF3?=
 =?utf-8?B?WTNYK09wUDhJU2NSY1V6QmYwRWpaY2R6R25FRUhaSnVBZEc0K3l3WlpHaXVW?=
 =?utf-8?B?UXd0NjJWTnU5UW9NQ0xJYTl3K1FOMHgyK29xZDVRdldpV2xlbFFiamYxUmtY?=
 =?utf-8?B?cUlKSjlJUGplcXp0Y3Z0MzlkMmxUWmh3S1ZvaWl6Q2l0QUdjRStGQ0NaM0t0?=
 =?utf-8?B?ZjlTa2NQbkhwNjRzc0R4cFMyMnF2dlh6dXF5TDVWN0JYeHcwam1vQ3lPV2ta?=
 =?utf-8?B?Ky8xbmZMdU8vdE9JTXVGWGg2OW9TQkJzTjZpTUl3cENjOGNIUllOVXdyNXd4?=
 =?utf-8?B?YVAxYzRkRlZjdHlBMjVyeTZiMFRwUmU4RzhuUUhlVERTZDZ0ekZpVy9YQ1N3?=
 =?utf-8?B?LzZOY3VDNWtJb3N5QituWFMyRXVvQllNYkxtM1VpWXNIamxQRjRTRWtUeFFM?=
 =?utf-8?B?S05jZFU1aVhqWFNrVlhKZUxuL0JXSkc1N0pKbnNTK09QWVdDb1gvV0pVYTBW?=
 =?utf-8?B?aHpnVGRINElsR2tOZGpJcWs1ZnpNaFFMVmtjZ2pQQm9ucXhTV0JlcWY1Wk9q?=
 =?utf-8?B?bnBuaVpiVXYwS2VOeUg2NmVXYXVmMlppRGR4NFhZREVOM2NUY3RuRC9BbGph?=
 =?utf-8?B?ak9INkg2SVZhYUZ5eUJWNDdEZVQ2MmJqNCttUXltOUZJWlkrT2lrK3lvNGZ5?=
 =?utf-8?B?TFFoWWRxUnZMb2J1M1pKYXBwY0JRZ0dqNWdKM3czYzJRQno1ZW1UNDVIWTB3?=
 =?utf-8?B?WFpSKzE4OC8wZ3VTTjZuVEtDd1dCWE15RW1mYmZibWl3SzF5RDE4RE5TUDh2?=
 =?utf-8?B?NUt3QzlydGU5aWw4RVM5ako0R05OaDZKdUJEUTdIbHRBTllMSzRuVDk4L1R2?=
 =?utf-8?B?bi9rbDUxYkx0L0JTYWhVT0xuWUdBWkdFUkRXUlVDTkFMVkVLU3dkZnM2Zjgr?=
 =?utf-8?B?VVUrRWp3ZW4rcndXejFoaE1QbGY0cEJ0UWNvbkEvMHM2YXozODZNOFI3T0xz?=
 =?utf-8?B?Zkp1RjdZYU1kTlVWM1o0Y29MeWVKUnl6MEhVSVNTNEVENzB5eE83TElEZGJp?=
 =?utf-8?B?eUN4dmwrS2VmZjd0RHh2SjhsVWNXRHdLZnBJUFBEZWJqa1lwUGVQM0d1S2l3?=
 =?utf-8?B?VWFmd3ZJeWJUSnliT3J6L1Y0SENTb05URnZFUjZrSFhCLzBzWDhHUmZadmlk?=
 =?utf-8?B?eHBXYjk3VjdTeG9PV3JqeUYxR0dxNHhnWitvT253U0JEajlvRXU3b3U5Zmpq?=
 =?utf-8?B?VHFwSkJTbGJ0UWJ3QzZURUlLWE1iZy9Fd0lTb09ZOEVYRHdWaWdjOWZjaGUz?=
 =?utf-8?B?cU9McDdlWm9HdVV5NjdScmRaYlRNSTFXQlJkTFZ5Zi8zaFEyS1IxeGFyanFP?=
 =?utf-8?B?dnpESzh2MmlXWTR0cjZtRi9aWlgxTHBqUzlQb3ppbVpYeXU2dS96cW40K3pJ?=
 =?utf-8?B?NW1mN2Y1NTlkOWZOdjRCRWdrYXp1bUZvRDEzUkJOZHh1MlVZYXZjSUprSGg2?=
 =?utf-8?B?YU9BaXMyMnFlVisyMFovd3VaRG5WZE50aVpkU29DNlFZM0h6V3RxcW51WlA5?=
 =?utf-8?B?VWd2aGl3TkxWN3ZZbHFZellKcUk0R0s3dTJaaW11YUNjWnl1RVlWZ01vWnNP?=
 =?utf-8?B?bElSRk1sV0xwMjdVSFNubGo2Tng4OHZSaG0wWHRpK1Zmd1pROFo2aGxldzJi?=
 =?utf-8?B?ei9wREVLSm8yYjh2UXRpWjVmN3pKNDIvWGx4ekJOS29pMmFnRHlRQTF5QVAy?=
 =?utf-8?B?ZC9uM2lIOUtsY1RFelB1UVUvU2dIckdraHlSajdTdUl4UTREdm1WVGNtZzNp?=
 =?utf-8?B?SG04Nzl6S2ZxaTFtcnJxZ2NJMHpUMTdkNzNCejhmUkpwSjhKREc5TXNGajcw?=
 =?utf-8?Q?JCeUHd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:55:23.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6326eb0f-7f8c-4428-e5d9-08dde579c01d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Since f9e681d3d1b8, the prototype of libxl_domain_config_gen_json is
> generated from IDL in _libxl_types_json.h.
> 
> Fixes: f9e681d3d1b8 ("libxl: move definition of libxl_domain_config into the IDL")
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

