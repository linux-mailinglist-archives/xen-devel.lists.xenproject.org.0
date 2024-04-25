Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B08B181E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 02:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711737.1111948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznCy-0000Fz-P0; Thu, 25 Apr 2024 00:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711737.1111948; Thu, 25 Apr 2024 00:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznCy-0000Dm-MA; Thu, 25 Apr 2024 00:43:28 +0000
Received: by outflank-mailman (input) for mailman id 711737;
 Thu, 25 Apr 2024 00:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rznCw-0000Dc-L0
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 00:43:26 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b800b8-029c-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 02:43:24 +0200 (CEST)
Received: from SJ0PR03CA0207.namprd03.prod.outlook.com (2603:10b6:a03:2ef::32)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 00:43:20 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::9c) by SJ0PR03CA0207.outlook.office365.com
 (2603:10b6:a03:2ef::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Thu, 25 Apr 2024 00:43:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 00:43:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 19:43:19 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 19:43:17 -0500
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
X-Inumbo-ID: d1b800b8-029c-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjUDdMX6yRQ/3atrz8QXBsbgWog8M4GuXqQFi1hvlefZRUJ6gvLGlSloWkhF5BSuD6vFk0nKkhXQGF9B/RF5dLjDlpfO49dHb9PybIdXwtUa5Imp9eCo4CKtF6zbD8WPagw8ViTs2noW/7FM7GWjF/1HQUDDF6UVNXGMkmKqtqNDos//n3+hkT+3wui6n7tJZwWL9rbPOxQv2LnnqTHMJPEhVOMqW0rZBMxOMcPpoYaeVmUfsnnfZMPRfAqg3Fgium6HbE58f5Ihy7jbT400C5hSl3Bk/JW+64MQ/LZEpn4QhslEdJGAlYzR1lE+Ku4kLFBlJmdIRhuwVaZoKeYx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf+UpPWT9R0F1txmyoaz6x9cI+SS2KLqJDeA7s0ACrg=;
 b=kIbgbNb7ObnnWTeAAhpaO0xMM84+/Z7+wfvmUDOnFhiuvidiiN4mhj23YngeFGVtgA/P0m66IvbIGNK8VtndGRy1hZmzFwAbmLHSEAv1ZcNTLqmqOC5wCQkV96UWc+4HjtN3FMpvF87PJlcxLl0dSK/KaiW1pk9TGKYL1d67pVPkh6tJ+o5kStuzr0BGsHbPHMaN5oip5qbFiSW+6TtI4YpyzGPsbvxAYi9EsN0ASrZrasKzXUjdssEbPxf8P8hEQ3gn5KOb1+u4Uj37OsZCWS2B8a403IqdvSC7HGY5cja3wyO3KSdmN8s6d8XAx8XCMZQ/M2qxGsXmL+78mfZNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf+UpPWT9R0F1txmyoaz6x9cI+SS2KLqJDeA7s0ACrg=;
 b=mT5oEJxp+XP7CNGQ6cSZQQu+Dq7Hxh4HlTpNNOyVzs/MkjSLYTkI93IYCxPJ6AEa3AA6oOcj8CF0qmJlMtLfD+C+9wFALFCo2EY+YaZepUKNjUktU6KcniaWb3DL0nyQEPD4n4xM+iaj7fhyN8cI8YCWFuXGjJSM6WcwBfsRzlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0d94b108-63f5-454d-8204-7a01ba8bcb7f@amd.com>
Date: Thu, 25 Apr 2024 08:43:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] tools/helpers: Add get_overlay
To: Jan Beulich <jbeulich@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-12-xin.wang2@amd.com>
 <c8228db9-6bb6-4115-9cc4-bcd8f49319e5@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <c8228db9-6bb6-4115-9cc4-bcd8f49319e5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a09899-735e-4311-d7b2-08dc64c0b440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400014|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGVaRFNnbk16THo3NW9OUUJ3V1pkUi9ESFFYSGZHM1VGWXdxU3BwclhoN1Qr?=
 =?utf-8?B?ajc4U28wM1ZTc1NzZ3htRHpMbzl6QUlmUDJvS3gva0hMZXpaZlVFWmdOY2dk?=
 =?utf-8?B?Z0p5bzZZUm5OaHliRGdGdC9rT0NRN3VsaDZ2Q2RDNVhqZkZJeUhuMUpPVkZX?=
 =?utf-8?B?a0R6V09NOWN2YzRhZFRHL2VVOTY1eGlXWlRUNDJ6VXgzUTVralhmTDhBWmRM?=
 =?utf-8?B?aTIrd1VMZGpjcFRiYVIzZFgyVG5BbzZoZTlzWUlkMTlkam5lVE1QOXNWUzA1?=
 =?utf-8?B?bnRMMVVLZ293d0hYYnFmMkU0SkZQaDdCMHBlaGtpRkVxblBwL3RRd0U3d25t?=
 =?utf-8?B?V0NmSTEvUHlKRXNoZVIvZnpHakNtdnBsblZERjVGWkQzbzV3MFk2Q1Q3THZX?=
 =?utf-8?B?VkRxZUg5MGhNZXNqekY3VzdzbjZCR25xZU44TWo1dE4zWnd3TEtOYTJRaVJw?=
 =?utf-8?B?K000WEtRZkU0aXNNa0poc1cyT1NCOXp6UFBzdVpoWE9uNU5wQ3E5NFQ2a0ZS?=
 =?utf-8?B?VjlrNHB2TzRsWXVRRzFxWkx5QkZFL0RQRUNiL0l1Z2tTcDlLMmJOQndob2hp?=
 =?utf-8?B?SkxuN1RISldYZWs4NnVSZmtWczgxcGJsVEFrVHRMZ2ozUUY5b1FrVGxWVHgx?=
 =?utf-8?B?MWJIUC81MStRTi9YaE05clVKVEt4a3Q0bmx5eWxmaUUvMlVVTzVkM1I4N3Nz?=
 =?utf-8?B?cENRRzl6bk1NVFp5Wmlla3ZKRlc0YkFoUW5UN3lONmE4Wnh5RWlBQ2x2bVBv?=
 =?utf-8?B?ait2a3laYkIrQmV1K2VibTI5bVFTQnUyMDd6SjVjalIwSEV2ajdJcGdUZXZ6?=
 =?utf-8?B?L1p0UEpWQkx2U3dWZDR0UWM1emhWSzJhdDZXT2VnMlZOc3prdVBnMHVleVJr?=
 =?utf-8?B?VlQ0dWZleVNhRnBCVzJRUnFZN2VOV2IvVGV5anM1QUQ5N1lqa2xSRkd6dVVt?=
 =?utf-8?B?eUxvWEdMWnJRVVZabTR5RXdjcENpN1BndjJ6dldvOEtSaG82aWJZUUY5bktQ?=
 =?utf-8?B?QXpiTW5YbEM0MVdXK3ZCdGRVNnlHMlB6ZHd1aFJvRWM1WEZkeUJSbFR0QlBG?=
 =?utf-8?B?dyswNXFPNDFKblJUb0dYdndDMUNGSGF4a3NPYUJXNTdraTVpc1IxWm9vLzE2?=
 =?utf-8?B?aGIyWmZwNjd0c0E1YzdMbmdaeHFjSXd3b0ZaOWw3dWk5eXBlQlBWMEpTVjYr?=
 =?utf-8?B?S1hESGRTd1IwUGVkQk93dWpxcm1YbVZpbXhaSXAyYkYyaUdreWQ3TmNHRkxK?=
 =?utf-8?B?RGlFTFNpRzNUektBVjFjR3hBYks1R0hPc1hNZFJ2eFlSU2RRYnRGWDJuM1Ux?=
 =?utf-8?B?Y0VodUw4K285RGxpWG12L0Y1TFRjaVVQMHR4Y0RZOGhkWkp5eVloZnNOM1NT?=
 =?utf-8?B?MzZ6Z3BzWUlLMCtxOCt2b2NiSnlQcmFaYjZDOEd4LzF2T1ByaGxjTEFLby9D?=
 =?utf-8?B?RVBrd05GQ1ZlL2pLbjNyKzh0YjJrV21LeEl4SWR1KzlabkVSMjVia0FCUFpw?=
 =?utf-8?B?MWlyVCtHTWRLRUdua1Z6NHFVa2JxYVlmUDRsTzhwRFJUMy96elZuQWFSY3JX?=
 =?utf-8?B?NmVZdnE0dVBHMWFydk9DZG83OW9IUEUxUjRnSTRMQ1pIbUdneDJUalZZQnUy?=
 =?utf-8?B?YmFqdjVTZVhKd2JWRDZHUE4rMEFMNmV1bWt5S0phS3dJTVU1Zng2b0RIRVZO?=
 =?utf-8?B?VXc1MXZlcHk2b2Y4R0JoRVU4UTIyb1V4N0xDa1RlSU5FSEo5UDBSTWphcmJq?=
 =?utf-8?B?NFRzTUtrZXowTmF6Mm9jNHNaNUxtNG16ZDYwZFU5S3prWUl1ZnA3bkgwblZM?=
 =?utf-8?B?TlhsbTR0a1kvUy9WMjlVWkZ1cUk1bXNtMlQyL0JIMW5qK0tKNXZkSGZkQVEr?=
 =?utf-8?Q?a+t1cFPqE69kg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 00:43:19.9008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a09899-735e-4311-d7b2-08dc64c0b440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331

Hi Jan,

On 4/24/2024 2:08 PM, Jan Beulich wrote:
> On 24.04.2024 05:34, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> This user level application copies the overlay dtbo shared by dom0 while doing
>> overlay node assignment operation. It uses xenstore to communicate with dom0.
>> More information on the protocol is writtien in docs/misc/overlay.txt file.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/helpers/Makefile      |   8 +
>>   tools/helpers/get_overlay.c | 393 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 401 insertions(+)
>>   create mode 100644 tools/helpers/get_overlay.c
> As mentioned before on various occasions - new files preferably use dashes as
> separators in preference to underscores. You not doing so is particularly
> puzzling seeing ...
>
>> --- a/tools/helpers/Makefile
>> +++ b/tools/helpers/Makefile
>> @@ -12,6 +12,7 @@ TARGETS += init-xenstore-domain
>>   endif
>>   ifeq ($(CONFIG_ARM),y)
>>   TARGETS += init-dom0less
>> +TARGETS += get_overlay
> ... patch context here (demonstrating a whopping 3 dashes used in similar
> cases).

I am not very sure why Vikram used "_" in the original patch. However I 
agree you are correct. Since I am currently doing the follow up of this 
series, I will use "-" in v2 as suggested. Thanks.

Kind regards,
Henry

>
> Jan


