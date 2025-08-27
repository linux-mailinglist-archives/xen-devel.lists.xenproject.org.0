Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D7B3864E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096349.1451090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHw9-0004ev-Hc; Wed, 27 Aug 2025 15:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096349.1451090; Wed, 27 Aug 2025 15:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHw9-0004ck-Dl; Wed, 27 Aug 2025 15:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1096349;
 Wed, 27 Aug 2025 15:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urHw8-0004cc-93
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:19:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2415::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4112b470-8359-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:19:42 +0200 (CEST)
Received: from BY5PR17CA0027.namprd17.prod.outlook.com (2603:10b6:a03:1b8::40)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 15:19:37 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::1f) by BY5PR17CA0027.outlook.office365.com
 (2603:10b6:a03:1b8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Wed,
 27 Aug 2025 15:19:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 15:19:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 10:19:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 08:19:35 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 10:19:34 -0500
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
X-Inumbo-ID: 4112b470-8359-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOFRqn7N7zJm9b2X5u7BViTs0IPX3UzmT9wl61V1tjfrDSjRaGG6ELk/VNgqNWenVIrYre1EfRxweiWTqOVnNX5eRhqivzP4vWftHUn2l1916D/mWb0UKtPe8u7ccq4qFkewU19jFwLmGbYCvJtC52gXfryTV+ESGux/ALl/vS2ryihRI8/9Z+bl8VJ6MmYdHPr4qi7uBYlPaClTLFBrw75t5vDsxKT4nstKDJuJb5ZGqjzsDjGwklqADKEDas94LFSzQySsL10WuzReWYyFUTaNUqHw42eTNEUECb9RuyAeqIylVPckWwKM4092FuRAxooLzMglOsIiIwqbzR1/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq7t4CFeYpTKx+HpZdNzNTHOoZc/ADz8Ato3v3qUJ8U=;
 b=XTS0s9N3alLyzsDIaNJklxlUTvMw4uORaE+ZmxG6JhUuUrSP8Yi370R6jkplXtHoKuxgFgOqnQH/Ezr4jCJwZZUmn/kXI9B7W30zVhshovawUVOF5dbe2yyqydb/VkhJYelB1jBA3gDRZYhPU8ztd6SshKJ2L/6L3PHueu72TriNf3e4cRsS5meYDRBRT9goOCPb/30uDpqAivvZ20lao1ERSEBblzkFXJdC3vfYQCzgiM8KwrNot8xqG0pK+aC62RW0ozkZA0z20K4YAAbIWNVOcNdwa1qE3MHoSqQQx50m82oCQbu4eEkZVSgVooHOSFyEH0UTLypTY7p5aSwPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq7t4CFeYpTKx+HpZdNzNTHOoZc/ADz8Ato3v3qUJ8U=;
 b=GNoOBw6ZpGi1JPOYfi10S6CrYjgF8lUzcAfuxoWEiUwgwoDcx+4/32IL+c3se+1RtRzMfD5hpYubL+Rx14W9vXx93KT8KjF+y+qHdaHc/9EfZkPN9zkd8kyBlzqP6p0Zct7owPv9OMqVHjDfTTiaAveFqPcXWfg1nGlAGRK7i7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0faeaa8f-7b91-4116-a470-1a313fc08430@amd.com>
Date: Wed, 27 Aug 2025 11:20:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/11] libxl: Convert libxl__json_parse() to use
 json-c
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-6-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-6-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c05d9b-5378-4932-b579-08dde57d2222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzhrSXMvZFR0M2NFU1drWnhiRkNXOUlybmRFSkFjWUxWVmxad1FZZzgrdllu?=
 =?utf-8?B?UzNSQ200Nm8yWlRHWHRLQStvOW8zWkFzMjNidVhzbXVkRkhNWmlPT1hVMGQ1?=
 =?utf-8?B?S0w4aUpPNjlQSldFYzRDcFdZZ2tyWkRaWXhYMStrYTZaSTlMb0JoM2xVeW8z?=
 =?utf-8?B?eUxqZTlkeGM2d1NOYmMxZ0ZIanUxUU5jbnErcGtLYTgzVVNjc09pTHlONnBw?=
 =?utf-8?B?ZFFwaDlmVDVHZnplY1krbEZHcUFFZ20zN3YyMGE4djlEcXRNZGZ3T1dBTjl6?=
 =?utf-8?B?VEtYWVBQQnp6T1FxNWhoZzFNbDVUbWF2WWhqSDdkMVd4bVhKQ1ZPQngrNWJk?=
 =?utf-8?B?WnJtQkNzcDlZSmRJUVM2S3p2MGJtVmpIVElIajYvVzR6UFd1dzdldzd3WDBq?=
 =?utf-8?B?bGg0bHkzSE84VnJwV1MzeU40MzB1U1F1Qk0wQlJJQlB4b3hyUXYxb3grbnk2?=
 =?utf-8?B?WE1DMEN1Z2t6RXIwb0YwZ21ZUENnQThNSEQxaVl0cUdITGxEd1V1VldXdG9H?=
 =?utf-8?B?dzhDVURIUE8rSFFZbmFOMnV6MW1DTU8yT0FFLzhlblVuQ3c0OHZsakxic3dK?=
 =?utf-8?B?dmNPMTBDQmlWYmc4d2dFUmxjVllrK0dLTm5CbksweDR2U2JwVXUrUSs2aENn?=
 =?utf-8?B?MlZhVnphWkUwWld0U0tSVnNpR0llM1VKN0ppbGxmZ3ZXMDFBVDcrOU1nVWty?=
 =?utf-8?B?ZkYrUFdmQ1d6cWdVVDZ4T3pnTi9qU0YvYVpSMmhrb3MwOVJwVEFWS1hYTWFq?=
 =?utf-8?B?MGtSUTMvZHNjd1duSlBnM3B1d3c1R09NYTN3U2xwZWFtdWkxTFNxOHlNb09y?=
 =?utf-8?B?SVBuWnd6aW8ybk91SEhMNjB6Y3dUQkQ1YmhVamM5eGJxK0JxOTJ5TE1aWnZ3?=
 =?utf-8?B?L3NRcG1nQ2J6b2ZWWWZReWtWVzkvenZYUzhwSm00ZzloRmxBdFZJcHdoQ1FU?=
 =?utf-8?B?ZWdHRTlRdWEyV1ZneXVVam55bERJTDdXMXNMWDdnUVF5N2IvSUcwVmlNUTlC?=
 =?utf-8?B?QjdzWU53NHltZVZsOHd4d01TcVRtUUxXODZKZ2IyMlIyTVphd1NVbTRveGJI?=
 =?utf-8?B?SEhDaUQzL0hzZXZLU3k4OW1WbDI2dU9EeHpkam1sUGU2RGgxSTN1ODhyVzFs?=
 =?utf-8?B?cE9uOEIraUtNNyt2R2R6eHpHdFFMLytuc0ZlT2x6ZnhXR24wTHNYT1lVcHVN?=
 =?utf-8?B?eG9WNEVJSGZ3bUhUWlZ0RGNsYUtiOTJZUGlrbmZQMHVwZXF2Y3QwU3k3dVVL?=
 =?utf-8?B?NDROZ2tYRllud0VlM2E4Tkp1cFB1eld5cWppcUk5TVlqYVJjTnhkdVZXaXdN?=
 =?utf-8?B?emdjMlR5cWM5ZkZadTQ5cEpjZlNLVk9ITy9SZkc5UHdLT2tXbXVENjh0N2ww?=
 =?utf-8?B?M2U2djZYNktkR2VmSkhmRUNCZVcwdXBvODRlRFRRRUVTaHdvalZLRS9DSkRW?=
 =?utf-8?B?by9VU2oyeDBpZTQzamdjaGl2VWZDYjl1dkkxbVc1ZUlNbnlNN2FCeEpTZHc1?=
 =?utf-8?B?VkF0MENoMmMwTlFRSTF2WGVmNDBNZ3RadzZLbCtMenBHWktzbjd2N0hWSmsy?=
 =?utf-8?B?bndsb0Y3b0t0R3hCVjBJYVhVOTIvcUYvbU1ZdGxrekZpM0djZ1FhdE1zOGpW?=
 =?utf-8?B?bURaUnlJcWNvd2xBY05lSDFDZStBOEhudzltRllYNUJSUnd2eHA1WHgrdlJT?=
 =?utf-8?B?Qm02b2c2YjJRd2dYeENoYWlkUTBKQWhxV1grMVFlWGlITGZGK2IrV1kxL3R6?=
 =?utf-8?B?d0NGS0lOcmtzYmJHR0dES3dhamNFRUgvcm9xaG0vL3czVUQyS09xR3lBNjBp?=
 =?utf-8?B?aE5XSC9OeWNOc2hxU3lEMTRMaGFTMHdndnFuSDBzeFBnNHpCeXJKRVJ6NS9B?=
 =?utf-8?B?SDI0Q3FIQzZFSGtlV0dRVzB6VDBaWGRMTjFZc1Zma05DMmRjMW9CeElCVmRC?=
 =?utf-8?B?ZEoyYjMzY0JyTDBnOCtTa2ttR0c3LzZpajgyRU84LysxR2tKdUZTRzhsUVAr?=
 =?utf-8?B?eHRidy9wK29qNU1xWDJ2MlMwVUM1dHVRTnRsMTlHTzdaWVNKSW0yMUtUME5w?=
 =?utf-8?Q?lQ5RxG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:19:36.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c05d9b-5378-4932-b579-08dde57d2222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> This reuse the "json_callback_*" implemented for the yajl parser as
> they don't really need to be changed. It's just awkward to have to
> cast between `unsigned char` and `char.`
> 
> Replace few strncpy() by memcpy() to let the compiler know we want to
> copy the string without the terminating nul, as we are adding it just
> after.
> 
> Also, it should be possible to keep using YAJL parser when json-c
> library isn't available.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

