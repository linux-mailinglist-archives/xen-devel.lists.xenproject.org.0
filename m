Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D88CAE75
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 14:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726889.1131287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OpA-0001nt-Cl; Tue, 21 May 2024 12:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726889.1131287; Tue, 21 May 2024 12:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OpA-0001l8-A2; Tue, 21 May 2024 12:42:36 +0000
Received: by outflank-mailman (input) for mailman id 726889;
 Tue, 21 May 2024 12:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bu/9=MY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s9Op8-0001l2-TI
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 12:42:34 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973dc5cd-176f-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 14:42:33 +0200 (CEST)
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:42:29 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::b5) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 12:42:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:42:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 07:42:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 07:42:27 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 07:42:26 -0500
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
X-Inumbo-ID: 973dc5cd-176f-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoDQNKrZmS0HoXP8Mb1qiOu6WKB4Ilp93Y8Tjtwcjx+WlYhoE6TPOXDwXG5jYZ7asQMlXBwI2iAaL0eSRSyXghIm3G/t6twCY9W5rDKEImBVfrzzoOyI1uPIEL7SxQNEiG6bKp0XcAfpT4cEqAsodzZxNnN5KBvLGmTKiyWPv/Q3HQcj5VUKQNncthsL1bSW68CYT96AOsugQ37x3uVj3Wm3coJ3uKke1mlhMQRjRvn/vqvMHFz8tTsW6sk/r5C/RDO4y0aNaXF1tcaUkS8/VY4iui5oX7xJ6Kb7nOyORHX/F/aJ4C2PgbGHckw0J28jI3sjDM/AyZpzNwo47xzzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7ay0SUHqpEYLSQP/3icBteOkCZ0riAwLWh2u6rvs2w=;
 b=CzamKhMxCIUA0sNQg05Vbcg16cNWeB5Pw10O+VpqsDa4Vh44OffJT2nXImE/byLzpd0FqWox3QjAdfgwh7Yy14guD8x2uvxys6pa7qas4EpAkrj+LBw3WgBqeIKFdiqRC03Pqaf6PhZjX2Va+IWTNjXjgcnsVzbL33L8ootNsX4OJjTAx+0xKzGEojPk3EQj6/JAwzA0Q04cBpTcUQesn76AViXQk+ZpY9J6UqwzrIRvaBFpr8USWn1gITpBBY+yU1bD07qxStQMr5ZY6NcfQqvocr4LBIjQsglno79THHsasJC5jhe8jfxK+AnCQcln41BszSearXgroxoYD5iucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7ay0SUHqpEYLSQP/3icBteOkCZ0riAwLWh2u6rvs2w=;
 b=krmGyWUWz5G1qhi5uF6B7relDSrTAonexH8FDU6akZy+nPbDIUHgyw4HIQx2MyAc2RrH9nX7/SsAAqd+5SUDmVKdc7LX9oHNWaROyna8A9ZCO0i51/xsup2Qt4VXAaQR+n9YEdrxMaP6//iSmKeYjfFT0jqjqICbnOcdZgFJ5u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8fe9c039-820f-451f-a680-c04f3c7e44cb@amd.com>
Date: Tue, 21 May 2024 08:42:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] tools/arm: Introduce the "nr_spis" xl config entry
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-5-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240521043557.1580753-5-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: a329b301-3183-463a-46d9-08dc79937987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkRDblE4T0h4bHBiZStVOFNpcjMzMHNRZDVWMzB2bnQzOFQwZzRkdml2YXJR?=
 =?utf-8?B?OGxueUJ5NmptVFZKZ1ZYc3NRUmRVcTVtVTlWSmxNSE0vVFB1Z1RtaWY3cUlF?=
 =?utf-8?B?WEZGMWZkMzhUeUhzenYrL3lLUW1YRnRMUmhTTllTdEx1dHBtb0NRTit6dmx5?=
 =?utf-8?B?SU9JY2VnM3N3MUFNeUpaOVFnU3NKcEd3UjQ3NmJDanQ4UGwwR0diSGRsaXdU?=
 =?utf-8?B?ZzJ6L2s2dU56ZzRBQWNLT2trWmI4U2NMVUU5UkpCb0dQbGQvem14eUlGQmcv?=
 =?utf-8?B?eGxEQnp6d0lycDdBcDFnajBkdjg3ZlZYck5jYWdEcHhQR2ovY25uMW1ERWVp?=
 =?utf-8?B?bjdNcGtreWxicmJFVDZiQ3pta0lVSUp2T3h5SGVzOVdnU1dzWU5ZdklRMTdQ?=
 =?utf-8?B?dThJT3dtR2tQNkY1cEY4d0VVTGNkazlxaHQzMDNaaExacVJoVEpuZUNhZmda?=
 =?utf-8?B?RjRFaG1YdGFucm14S3N3T2orL0NDS012QXhsTFlFUExhUU1zTmVmRy9IZEN1?=
 =?utf-8?B?MGVjZzN2ejVyRGExSUdwZ3VvN01BQk1yTmc2N3FKbUU0emwvOTBMZzVOZ3Fv?=
 =?utf-8?B?clFIQkE4ZkVmazJBZTk0dmNmdmVueUxjQkZmSmVSSUVJamJkbjVEemxEQ0N6?=
 =?utf-8?B?dkZOM241Qm1Id1lFb1VQa05oTU82WURVOGdaM0U2NEliaU8yUS9xTFZDZ2Zw?=
 =?utf-8?B?NFVnZFlESDRsRGZjTm0yRTRid2x5MEVIY0k2ZVp1cXlpT3g1Ky9wK1Y4VWdE?=
 =?utf-8?B?c1BPdWxVdm4xNFJsRmFvL2kyN244M3lTYkkydUNIYk4xT3RLWXVrbm4xaWhG?=
 =?utf-8?B?RGhQWmMveWFwYkF1SG9EL25MZFJ1VDl3OWNkbmR4MTJyeDkyOHNSeXJGcXhn?=
 =?utf-8?B?OHB3K2dNRXZXUmk4NHNMOGlIMjJwcUcwS1ZVQk5vNE12Y1NuVHVDbGtRNks0?=
 =?utf-8?B?LzM4U1kvanZYcUlXSkIrSHo2c0krQUVxNGkxVW1yeWlxK3k5Tk1vMzgwQUNx?=
 =?utf-8?B?T3VKdGpqUmFwUlRzS1hKSC9lYmdrSVU3Z2dCeWVrYTliL1Y3dG9tQW1ZTDZM?=
 =?utf-8?B?eGtsMmVjZm9LWnBQVy95ekVFUytMVHU5ckYrZzhhamExUEdTR3AyR3l2Lzlk?=
 =?utf-8?B?YU1pNzhIOHg5UmpUcGlVaDl3b1hYUG9LV01MOFVzdFo0RTUzcGdUY0lCVE8r?=
 =?utf-8?B?bWhZK2dMMFdJQXY1Sy9OOVNWUkYrb1oyU0p2bVVCSG5SMk1jVVBBekU0aHoz?=
 =?utf-8?B?RnY3SjFVUnlsQ2tvekZyNGEvb2J1YkVJbE5oMklDc0FJNjVKNEFVc1dIVnU1?=
 =?utf-8?B?YjM2dUk1R1JMT0lFTmJxNFppR2pLYnlaNTFLOWk1VkdacUVNZjV6eWF5QU81?=
 =?utf-8?B?UElsbmRpaGxOMjlCSTJvMG9WUncvRG5DWnZ6TWVCaGR5ZEZrU1FLbU5BeE1y?=
 =?utf-8?B?Wmt4c1E3WUF2SVBDeHcrTjVvUGM4MnJLSUtYcmN6SC9aZnpSY3ByY3hzT0U5?=
 =?utf-8?B?eERFcU11UjZ2SUgreStFVmVqQzhMUzhlSXBlQlJBYUJYQkRrbitTWXNXYUVW?=
 =?utf-8?B?UFV5dDdiZVB1VzI2d0l4Z2F1WitGbFp0NU92RHlEaEN5WnY5bHZWK1EwZkZy?=
 =?utf-8?B?cXBFZHlKNjdJSHpXejgwamVaTFRrRHhESDc5WDRzOEZZV3lYenhWRGVsZ2Fh?=
 =?utf-8?B?UDVGY3ZlZEJJZm1XVk5pNXdkNXA5Zno4YnlJN3ptbUh4bXRIQ3hHNm55dllO?=
 =?utf-8?B?aTEzdXJiKzNkeDZ1WXZzWUgyalFlMTltb1B1TmUvMDVKS3g0K2ZkUlFCVnpG?=
 =?utf-8?Q?2H4HlPe547Zwu2F7T8kKFL3F1kKEjQYL9xe3M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:42:28.3798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a329b301-3183-463a-46d9-08dc79937987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

On 2024-05-21 00:35, Henry Wang wrote:
> Currently, the number of SPIs allocated to the domain is only
> configurable for Dom0less DomUs. Xen domains are supposed to be
> platform agnostics and therefore the numbers of SPIs for libxl
> guests should not be based on the hardware.
> 
> Introduce a new xl config entry for Arm to provide a method for
> user to decide the number of SPIs. This would help to avoid
> bumping the `config->arch.nr_spis` in libxl everytime there is a
> new platform with increased SPI numbers.
> 
> Update the doc and the golang bindings accordingly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

