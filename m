Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F939AE2442
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021318.1397321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjV5-0006SD-6p; Fri, 20 Jun 2025 21:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021318.1397321; Fri, 20 Jun 2025 21:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjV5-0006PY-3Q; Fri, 20 Jun 2025 21:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1021318;
 Fri, 20 Jun 2025 21:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjV3-0005Ia-92
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:42:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2406::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d227d1b-4e1f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 23:42:14 +0200 (CEST)
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 21:42:09 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::21) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 21:42:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:42:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:42:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:42:08 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:42:08 -0500
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
X-Inumbo-ID: 6d227d1b-4e1f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4hNrikggmoD0dyyIg8hvXWXKIQt/4Nn7DJWQ9RLHkse/cspz1pFeV1tSxp958KzFXsplYLJ+yv5zhvYtebTbXyOgiLZLTDzVA3IeGW2LIGwv8AACKKOiUmiOxPi/qn8IB58xSlerASh+SqnCJge0TCyn3/ZFJRZqOeSdJuCQcAGVrsz85H54xeKWCaIlmHlrSGi5OpqdL8fkD8EdXSg79nxXVd8EmBokT3kYl4H8meEdagxtXewpEboJnEl5ATvSQV2cZBIMOQCVj6e4fb5wLhV5QbkU3UpAb2yjfwmqGEXmaL5jdz410rka2avhaMpJEncFA5rXPm9NzxdczB5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9zDJO6/fOEV7xX/ZIsWH1ryc7bzxtbx+F6ex67VRlQ=;
 b=p8AIVf+i6N5lqH4Zlq3Ows2TgWewVXyS5/JoxKHR6q3nrA9E5U1X5VLOlQ18VY4tYdqiueUd0mZFue6Ze2DWa5QMXmh9lN5WwDQHbrjJdvz71p2YXZvFN3PQzr187Mtjt0agaCniJcnvjcG4Y1dL8MMHvnGMZrALBPuNiKAvfgpQKpNVGY78DZEfgdcyUK/pElm6ZVSuvRYh9hx3RBIXk5sbFA3Z3KIIbN5BHnVbf7AsvIYUR/5Dkruy4k2k8wgYZNh3axN+7/HUDjD/TPt8yja92wE/mCwB3Nv27cVTHJwjAi94d97NlGppUWkQ2loMa2B8jrznpncSyyZkhOzs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9zDJO6/fOEV7xX/ZIsWH1ryc7bzxtbx+F6ex67VRlQ=;
 b=V7I1PIzp/HDdR5qMQBE8THb++sSkNt8yzOTAUZjBEkpDHE6dbsQCfWnrEli3a+NdJxWY7ZyCxFpLvFM1X9Z86CV28S+UqfB2qFRnnwFRQcR0D4YSeeSdO9WF4Wqobdvb8+7HLWTaOclxPbonnHwMQ66ifMD/GKGF9aZKoqUZlEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8f208946-a69c-4e9d-af92-5a6278b01418@amd.com>
Date: Fri, 20 Jun 2025 17:42:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 5/6] xenbus: drop parameter from get_xenbus()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-6-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-6-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c15c7c-aefc-416d-9ada-08ddb0434ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXYxb3pHOUdYWTMrVnFka1lYTS81WlR5MVlvblNDOHVxalFaQ0NaZ2ZHWHpr?=
 =?utf-8?B?L3VJTkpxSmhkSlVWOHlnTElTRGJtdkJKelUyanhVY3hSQnVidHZ4d0JhSFhU?=
 =?utf-8?B?SVFiQmlTUTJabnJFOVhNSXFjUWNiMm5LQWtZdEJSRGtZNUNVTis0S1FIcUwy?=
 =?utf-8?B?UkxnbXhxSUVFcWFYY0g5NFhJS0ZtRGY3NTRCYW5mcm16RUhabkZLZTIrLzdP?=
 =?utf-8?B?RFhUYlY1dXhmS2QzTDdtdk9JdHJ5bG0wYmEyMkhmOUw4UlhOS3NUUkMwY0NP?=
 =?utf-8?B?RmJRelE0cVY1SGhkZGt4Q3pjWDdGN0w5WlNvaWRGSEVHblNkcnpNMlVTWXYr?=
 =?utf-8?B?VllRTytNK2VNVVFXdURjNlZvblZTSkF1M3U3UHlZSkVBV0hBeWJMSFlLYWNI?=
 =?utf-8?B?YkZDQWJUUjU3NWpRUmJyM0lEUVFHK0tkUEJaTWR5UjFaV3k5MzIrMHJuNklh?=
 =?utf-8?B?eUJCRmNxUzZSSC9weXl2MW0zaWNqR1dkc3NaM3JVekFieUphQi9NS1QxdW1h?=
 =?utf-8?B?VUpsOWRxcHBGYVh3YkZmYkFlK2s0UDduSG5mSTJaZFNaeUMybDBldHgwcHNl?=
 =?utf-8?B?STZWTmNveDFwMG5uT3Z4UjZsdHFoa2g1cFQveFlQY0NIaXVhc21PcXcwWk9l?=
 =?utf-8?B?TkQxN0UyRHl6UjJYcHRKYisvUHhvSm52cllwWkRubER3a01kcURxOGlRYWp1?=
 =?utf-8?B?RHl5WDF5eSszeVNpSFBXMC90a0RkU1l1cE0zU2FoN2FQRm5PbXpqMGRUT0Na?=
 =?utf-8?B?SCtidFhQNEszeGUwcWJ3RGtFWDMrNElGQVEwS0NEc25yWWxnSkpyUVZvbnBo?=
 =?utf-8?B?TjdBVUViTmg0RjFuZmNLbGRGSi9EeFdvblZ6R1NwamNrWVZ6S1lGRllTcXAv?=
 =?utf-8?B?SlNoM01vSnFJOXZ5MkMxTnI2Rm9say8xbTRhU0RwTW9ScWFZdVlwU1FrQjNz?=
 =?utf-8?B?eWx6dHkwbEpXV2N0Z2lFZFZkZ2pLaGdlQ3c0b2J1MWhiSHVKWDdNY3I0RDJ1?=
 =?utf-8?B?WmJheVJ1ZENoZExVaStGU1FUZzN1K3p3SjZEK0xVOGxnVzhhK0ZVeHN0RFNI?=
 =?utf-8?B?bGowSmJCck56VHkvVFJwU0dKeEdzc3pLQnRCNWhHcHdUdFJkUEowVGZUdldp?=
 =?utf-8?B?c3RBRWluTlpXWnVrbjVMTjE0V0FnWFQ5bEc0NkJhdlFpY3EwNGx1R2ZNQ2ZY?=
 =?utf-8?B?SGJZb0h4Vk5RclIxOThpb0l1dVhwbENYbjNLZEgzNnN1WWVRam1YK1J2Uysy?=
 =?utf-8?B?MDZ1RnpWWEZSbnZvd1BxOXREUnFySWN5bEs0VnZmSjZ4a3RzOGEzcUd1N0N3?=
 =?utf-8?B?elBZanNpM1U3aTRQQkVDemsxMnpUdUNyWnhheDB6OUlmdk5PODFUbXp2TERZ?=
 =?utf-8?B?VHBySncvalFKdElFSEdZQi9vSTlpTnQ1bzUyQ0YxemllOG5UWHhYMEVpSlFX?=
 =?utf-8?B?M0FTZzY2WWs5NGI5bUV5ajdJWVBEcFRTa0RZNERBOHZBYmVUWkJ3aVZBTzFh?=
 =?utf-8?B?NzRrNjU0VGNSRXFROEV5UTJLbUlEd0FrUXhZYm45ekJHUk9rdS9EU3E1U3Av?=
 =?utf-8?B?bnlKS0hleDF3VitVUmthR2ZDVlNab1RjT1ZLQ2ZmUlpPN0xrdkZBU0N2a3dF?=
 =?utf-8?B?NkRqTjhpUkN3YTNqcEk5OVMvUERFUktkazNnUVpUT2RNMU1Jb2FpcVVUWXhK?=
 =?utf-8?B?blA3S3gvUFJyKys4allnMldlYWJzVzhDblFmOXZ3NEcyeVdLQVhmZGF6ZGhX?=
 =?utf-8?B?ZllkVFU5ejYzOFNqUmpkNjI5eXNjdmd0RnFnTU1UWTJyMHE3SXZnM21VSWpW?=
 =?utf-8?B?UUxadzFQb1Z3clgwc1VEV2ppMDJnRSs3Z09HMFRBQ2dPZmovNDRpTUxOb3lw?=
 =?utf-8?B?N1F0Nyt6bllJQlVuUWcxU0tnU3BlVTcza1NmWTEzT0tsTmZxRm9YMzc1aEl2?=
 =?utf-8?B?YmFwc0tWUEpHM2Nzd3RzWEtUbTNKMTBEb1VyeHd4bngwYktUTnBMcDFjRUE0?=
 =?utf-8?B?NDFvNWZqNFFKY3BjdVBsWFVtMWxrNkpYMUVaK1VubnBWNUwwREwzMVVzbzY1?=
 =?utf-8?Q?aupmUY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:42:08.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c15c7c-aefc-416d-9ada-08ddb0434ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265

On 2025-06-19 07:38, Juergen Gross wrote:
> The parameter of get_xenbus() is used only when running in PV mode,
> and it always has the same value.
> 
> Drop the parameter and use start_info_ptr directly in the PV variant
> of get_xenbus().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

