Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391CB386C3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096423.1451129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urICk-00015R-OU; Wed, 27 Aug 2025 15:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096423.1451129; Wed, 27 Aug 2025 15:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urICk-000133-Lo; Wed, 27 Aug 2025 15:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1096423;
 Wed, 27 Aug 2025 15:36:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urICj-00012x-9q
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:36:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a56c1126-835b-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:36:51 +0200 (CEST)
Received: from MW4PR04CA0102.namprd04.prod.outlook.com (2603:10b6:303:83::17)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 15:36:44 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::d) by MW4PR04CA0102.outlook.office365.com
 (2603:10b6:303:83::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 15:36:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 15:36:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 10:36:41 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 10:36:40 -0500
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
X-Inumbo-ID: a56c1126-835b-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX9Ub0LI0CKeK8OuiOYtKCPaoig5Ua7Kq9vrIjWsMy3Np9naSOoIIadj3eM7Vku6dag/pDYjdmYnTaUxDiK/RUsC9MsLjnx/Miy4TjaTxKZIV8p4vM3RPhurMfw3pdff5zoirkw2zIByBhZatcOeovMmcqBiqov9ApOL3yBXfcuz8+GYRQZQKFMGyY/rg4k4LAvFGGIe/F8M+TqmyuazyPiKN4iAdiUuZYKrwzDjBqFCdOxzIN/6zdpbdM300+V80tWXeP7BJaVJACavIYvqJLpBzEdisFg7bV6gKs3/0FuyUVmFC5NF8MvL25NTSTM+mLaHu7ewbutyowMEJX19jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cauu/1sD6x5Xsm1QY3slDeJ6UwWu5fLIFTlv4uWdWQ0=;
 b=q5Ngb56HzQllnfAf/CB8ERft6HXKAk98XEco24ZMPvNt05fKO7OkQLH3zlSFBbFItvn4pVXANUnxJ3e44+6SLfzlfPEj6dozTlI3IQBeEiSo7xvfAbMh+RlEz5wg/mQGsS1f+HS3M7pxqElqyELK3zs1VKh8ILloaKmbjffcBm/fRKWuUbbYHkeSeWHwqup3/3H38OtbSFy92RK6RAcfmPS9PhoJLtlK36yp3NWZ6dxyGEl+bObPx1dpGP6z0CzUlnN+FaJQmE9Bw+RLWgfu+HXhvPGkDqlc6K95frGG+AB6cJB028rgl7VjQhI1TiIlxA96Q4GmCinLAiLh9POftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cauu/1sD6x5Xsm1QY3slDeJ6UwWu5fLIFTlv4uWdWQ0=;
 b=SsCwM58lYlKidV1qYVhup/n78vKsJ8zy0um06K445Gn7muCMYGMz0KL9bhitCPt8kUoKB2vR1ToKAXz2gofkkWq8/xfW2S5vjPdEYDw/vEdomBkEWD/wn67y2kWP9yA//a2f6UVpusRAioF6FlCS38L0ENQzZgU8ObJDNwuz55o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <10a60455-a4d2-4c58-8a80-d8b264d27efd@amd.com>
Date: Wed, 27 Aug 2025 11:37:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/11] libxl: convert libxl__json_object_to_yajl_gen
 to libxl__json_object_to_libjsonc_object
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-7-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-7-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SA1PR12MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e631ab8-2eea-4553-d913-08dde57f860d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG1GbzVLYTVBNnFja2FEK2gyOHZoSUozUnhwZXZwYmFTRjdGc1VjRXM4ZTBy?=
 =?utf-8?B?WU5hc0FISTNNMjRycHRwQ1N2ZmIwT1greFNubXNmeFZXL1BFTURRei8vY0dG?=
 =?utf-8?B?amVVUFdvR1B4TGZNcXFFYXl5RXluMXI3Y1UrUGJqNXdYcU91eHkxT0ZuV0l4?=
 =?utf-8?B?dXRGZWNJZ2M5YnZMc2l4WXowLzJwME9SRXJIczNOUDdHekQ4aGxQZXN5bzBo?=
 =?utf-8?B?QUl3MHB1aXBpR1N0U0NLNkNwQWpNd2M2UjIySFdTVzFNclN0SlZJaHlvbmtE?=
 =?utf-8?B?ZWVCelcwb3dyNDFBWXBlQXB0K05uMnExOFQ3Z0NLUWFJVjZqeEsvZXFyUG9M?=
 =?utf-8?B?WjdkL2puR0lTRm9EYnBPdVdvWFoySm4zK09NV3dvMCs4OG1PV0ZDbnZVY1hj?=
 =?utf-8?B?ZUMyb3g0dUVzUmQ3b0lGZFZjVUZ1c2ROU29XSGpsK1JablhzWVMwOTFLTFB0?=
 =?utf-8?B?T0pJL3U4aVIxS0NTYlhhYjhmU0JrdThrT1VTZmp6OE4wZ1M0UUc1Q0ljZkRV?=
 =?utf-8?B?OVRaSkNnRUU3NXdIbjZQUTdLc2ZvNUpDdy9NaTNhVHlLNWFhNTgxTjczOFg0?=
 =?utf-8?B?THhQU0NFbVYzNGI5bXZONnNWM2RMdGJ3b2dJUDZVbkQ1WTc1ekQxQ3ZQR2Ji?=
 =?utf-8?B?VUhFRWxsT2pESlJhcVhmVm1vL0pKNXRFNFFuVC9YVHR1UHdkMU8yZW43dmVh?=
 =?utf-8?B?ampQdjExWllUbmZ0N3A0UU5YZllJTXEraEZJR2JtYVdpcUlGMVhleDJwNEM1?=
 =?utf-8?B?WGgwWTJjTFZ6SGNXV0FuUkJHUXZGbEdvMXlqVkFBT2dEazEyRzZ5ZCswVmp4?=
 =?utf-8?B?K1VMOFNHSEl5L3lOQ3R1dStiRkFXbmZLRjNDTFZHbzVpdU1IWGFrdnd3eUEz?=
 =?utf-8?B?YXZvcUxEUFMrMUdCUjFCVUcyOUltRko4TFlnWndlM0tlb2JuS1R0NHpRLzVI?=
 =?utf-8?B?SkZBM2Q2NEV6bHNVUmUrRWJaTmhvUy9pUy9xUGp4blFHTVVadSt1aS9rSkFC?=
 =?utf-8?B?eksyWDJGM00vWGN3SEc2M2RtQmxCRVJ5RHloRUhFcy9zMFhidkhmNk9MYURD?=
 =?utf-8?B?WVZKSGhMUVVwSTNvb0VmT0hlR2FFUmtSN1pIRXZZYWEya1ZMNzd6VlV5WldQ?=
 =?utf-8?B?SU82L2tzT1FURTYzOXNpKzV4Y2UydFRCV3J2dEdkVU5sR2dsN3FkNWVDcUc0?=
 =?utf-8?B?M0VHMWh6enJiNlJLQzB1SEFHNkQ0TTZEMTkzdHRDRTR4SHVxa3NTRFRwZ014?=
 =?utf-8?B?aTRkL2RpT0FLMklVOGZxVUVQMWxNN1Y3WU1LVEtReGMvVzU1MUtPTWs3Rk9v?=
 =?utf-8?B?b216c2FoZkNGR1Zhb0tCWWtlY0o0Ulp6VG9nZURKYUZrQnVUT004anIvYURO?=
 =?utf-8?B?MDlHd1AyTUlqYk4yelVXV2RXdHl1QVpWUXVZKzZaVGwyWGxVSENEOGExRWpN?=
 =?utf-8?B?c3psNUo3REFGK2svd3VLMGFKRlVDMDZQTUJMSC9leG5vR1dlamw2Rmx1YXdo?=
 =?utf-8?B?ZTFsSU5UZ0l5OUVVMktaYjR5OWRFbkdSQ25YTWhjTDF3NXBqM2FqM3B0YmR0?=
 =?utf-8?B?UG9SMzd6UlV3a3dvbExOcUk0c3ZmbzdaWU90VHd1NXBPNnpWZG03Wk5tbHJO?=
 =?utf-8?B?K2lJSlk4V3VIUTRFL1lXRkVIVmtWNnRsU1FNV1k5ZWd3emZrUmY5aFNhZ0ZK?=
 =?utf-8?B?VkVLN0g5WHg3TGR1NXgzaDJqWXZFWk4vSktCVzFNQ0JjVjRrQWlERURMV1ZO?=
 =?utf-8?B?TzVneHlpSEVWUmkyOFRaMnpoaUdUc20wVDMxcmtPTVg4dnh0b0hWZ0xrMW5U?=
 =?utf-8?B?SzBLN0tEMWU4djJ1aXIyTTQ4Zk9UYUFmRlIvVExBRGM5bFQ3Tm9LSW1lVjF0?=
 =?utf-8?B?NHZmMCtnRDNIK0xSY3NrYUJVSlFKM0pwcVR5cHNDV0RQWGdFaS90OTM5Si9j?=
 =?utf-8?B?WmxsU1dDek02YWFUUGlLdVk3V1BhZ1MraWswSG9QbHpYZktBQkxWekVSTFIx?=
 =?utf-8?B?WWJyYjY2TVQ3c1JNVGtzdXAxbFc0cVk3TFBFa0dvdENkWjcxa2F0MzZyaDF4?=
 =?utf-8?Q?9HPFMQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:36:42.8270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e631ab8-2eea-4553-d913-08dde57f860d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Convert yajl_gen to json_object from lib json-c.
> 
> And make use of it in qmp_prepare_cmd(), which can be compiled with
> either lib.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---

> diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
> index 44ee6e213f..b26ac901d6 100644
> --- a/tools/libs/light/libxl_json.c
> +++ b/tools/libs/light/libxl_json.c
> @@ -631,6 +631,100 @@ const libxl__json_object *libxl__json_map_get(const char *key,
>       return NULL;
>   }
>   
> +#ifdef HAVE_LIBJSONC
> +int libxl__json_object_to_json_object(libxl__gc *gc,
> +                                      json_object **jso_out,
> +                                      const libxl__json_object *obj)
> +{
> +    int idx = 0;
> +    int rc, r;
> +
> +    switch (obj->type) {
> +    case JSON_NULL:
> +        *jso_out = json_object_new_null();
> +        return 0;
> +    case JSON_BOOL:
> +        *jso_out = json_object_new_boolean(obj->u.b);
> +        if (!*jso_out)
> +            return ERROR_NOMEM;
> +        return 0;
> +    case JSON_INTEGER:
> +        *jso_out = json_object_new_int64(obj->u.i);
> +        if (!*jso_out)
> +            return ERROR_NOMEM;
> +        return 0;
> +    case JSON_DOUBLE:
> +        *jso_out = json_object_new_double(obj->u.d);
> +        if (!*jso_out)
> +            return ERROR_NOMEM;
> +        return 0;
> +    case JSON_NUMBER:
> +        *jso_out = json_object_new_string(obj->u.string);

Is JSON_NUMBER calling json_object_new_string() correct?  It looks like 
the yajl code falls back to a string, so that is okay but surprising.

So I just want to double check.  If so:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

> +        if (!*jso_out)
> +            return ERROR_NOMEM;
> +        return 0;

