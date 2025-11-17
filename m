Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E90C64464
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163873.1490924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKywl-0000l3-Qo; Mon, 17 Nov 2025 13:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163873.1490924; Mon, 17 Nov 2025 13:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKywl-0000jC-O6; Mon, 17 Nov 2025 13:07:07 +0000
Received: by outflank-mailman (input) for mailman id 1163873;
 Mon, 17 Nov 2025 13:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/DW=5Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vKywk-0000ie-EY
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:07:06 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f075dce-c3b6-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:07:04 +0100 (CET)
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 13:06:59 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::97) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 13:07:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 13:06:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 05:06:57 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 05:06:57 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 17 Nov 2025 05:06:56 -0800
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
X-Inumbo-ID: 4f075dce-c3b6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1STjdIC/P0IWD/Tya03pLQYf9gL1ySM7q7adAOhRZ5gV8EravdPE0mfnXrQvynfELICwmX0/9vPQ+9y4Hsk5ZIeAqcUTprOdqHmT/jny7xPTg9X/FWueTc42aoTbDf4sUSGFkv1C2tRE1mLQGhX5H3kbP+OlMP7K488RJQBznTq0sP7+dONff5h5VRCdk1hpvYTnuuY4LiiAfw5WVvmqA/jNPdobMRKNfMWyYCBTk7Fje3vsYWjoGBEwEVSYz8z2aaxAhUC6vf0J2zT07cZDwkDsWTNMglCDt9zg2U/PTu7Bj1giDacrKiSL3r8UlvaLYjEevJ10OiAtyT1yhIoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUZR1v0jMVF8lMdPbzh6ssywow+wI33uJw/bIoS2Ye0=;
 b=pTVAGVHqpmFOV1zoasPQXhMsbwVorhcNsaquEcy0dpkZ+QOjy2mDiepUydLif7Dr7uUmAwKc4f+XGfhN5H24pmVxMJRIJacB2GrIJQHoThoxYckiKhsPOZIWrgKlE7ox7vUDs4nN/myKvUF40lwJw+2eD4IldtX4hYadTkbDgXRKOADkAET73zZaNzsVMycMwjLuhAwsZIAARtzzEbgR/dnKFDL/cw/jhS5Ua+70rPuY5GJbOfqEEnu5xdK769C3a0rZMbUk/uaaRc6p8bN5pKCORfti94HxckvwtlQo9qjlIkXEecRNujw+LwyuCzDq9ANcET2YyWDXb5xyCuiZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUZR1v0jMVF8lMdPbzh6ssywow+wI33uJw/bIoS2Ye0=;
 b=ZkJ8BQrphW9h/OjS72C74SgkH4BmcByduV6LwP/bmklh08cUpl1QSGzFrjbq0ol4R/ZcTQcvAtBYDsPhVBGdALvvxDfYZwKyV4Tp/qP8ucgLFNv2XH9gc4v0jLfJUrMBNJK0vH8MC5mcfoWmy4FyPdasvPo+5pPL42Oi1CkY4Uo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f8d609b6-a3cd-4685-95ce-6fc1f0b307ce@amd.com>
Date: Mon, 17 Nov 2025 14:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm/mpu: Implement ioremap_attr for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-4-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251111101601.4171120-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8dee84-c89a-4a21-e827-08de25da3133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUkyazBGNGZDbUpuOHN2ZHY1bFFoMWJ0cjBLTGtqekFFVzVYTnZBdTV0RU9S?=
 =?utf-8?B?Nlp5OEFoV1hHWDJMbDhiSUlKdHN3SGo4U2FjVlhlZVVVVEE0THU2VU5GSWEr?=
 =?utf-8?B?L0ZtOWJZVFpXV2dIUmoyV1NKbmZuekhTT21NSzUycW1xZTIxekwrK2hMbEVF?=
 =?utf-8?B?Q2p0eURqdXhIYmZpYXJSQ1NyWU9TZy9MOTVrNVJnMDhwdHY0K051MzlKWHNs?=
 =?utf-8?B?dm13VDZaK2I4ZFlEdm52endvaDJQSWJBakhUY0Q5b0VxcEh2N0ZwZi9ubHpa?=
 =?utf-8?B?RzBTbnJocS96Q0srK1dXRVNlb3cwZ1gyQTRUS2gvNVNqS2JwdHZMaFA0ZWtp?=
 =?utf-8?B?K0FGdGFlaEFaK2phVlNWQXFUZWl4Yml5SkxmK0J6My8wT1Y2ZVdGWjVqNW9v?=
 =?utf-8?B?cko5MzFBN1I1aDVLRUFNMWpZUzlHd3VVZko5STVXWStpbldnTVhCTE5qcHZm?=
 =?utf-8?B?bEovS1RWdFM2TUxBbTdlSU8yMW5IYUFLRFNraUp0UXpCNHNMcHZDdnBCNU1K?=
 =?utf-8?B?RmQvcXE1VDZ1aWJUNW80UDBDckVKT3VvMzNWbC9QYStGY0VpczhhTERVWHp0?=
 =?utf-8?B?SVRnZnRHdmNldW10dFIrcFF4TU5NWXVqRkVFN1VucDlWUEwyS3hyOHVHRjdO?=
 =?utf-8?B?QmMyUnpPdThzVWYyd2FkV0lnVGQ0c0hoOWJIK1VXdzNRMWpvOUZEOFJCUEFF?=
 =?utf-8?B?ZEZnWlFMSjZjOXhMRjdndUJPT1VhNUtLR29PTWFadUtsMEw0bXNrYzA5Wjd0?=
 =?utf-8?B?bG5BUWp4TU1aczRQK1FnbjJhMi85dDBqZUtaMmVBWkxRVGJFWXpmQTUrYzUy?=
 =?utf-8?B?WW5SM2sxVXNtRXByQjEvcjgyZm0zSDloUFg1NW9NdDJCYUVVSEV3T1U1dGNZ?=
 =?utf-8?B?d0orMGVRcDN1Tzhjd08xc0YyREJYMXFpSXJyWUtLVTV4UVZNb1hqZWVoL213?=
 =?utf-8?B?dlcrTDczSXM2T1p3bzk1NnVyZ3pDbTBRSGRMc0pJWFB6aDUvR295bGtKelEx?=
 =?utf-8?B?UjZWVTUvZEE1ZksreHN0RmJybjR4d1lxVFpmeEd0L1dDVGIwdFJxYmlwWVNt?=
 =?utf-8?B?SWE4clVKckFZM3hyS3JnSVZpMzJUODNXS1kzdHhTQkVINyt1eWFRbTFUQXVJ?=
 =?utf-8?B?c3FRME1XTllKY25TRndnak9zWjdvZmkrOXRsOHpRRFI0K2R1MWc5Wjdza3NP?=
 =?utf-8?B?WVVvU2ZrenpBdGk5ZiszYjAxbTdoQnd4YkRzOVhEc2RnWk9zUkhkanJzdWh0?=
 =?utf-8?B?QXVlZGgxbkFDeUI4YXBmd0ZIOEU2L2QxdnFIbDhWVFRSWjc1d2RIeWJkdnB6?=
 =?utf-8?B?RDlXY1FvUDBkUi9KeldDam9XaHFZYkNLMko5cncxNURFZmRoREYyNmFOelV2?=
 =?utf-8?B?eWRvZlhFbUJXZXJROUtsRVd4OHY0bVdyRmdRYVJwaWFSNEw4bU5heDlvRXIw?=
 =?utf-8?B?RDltSkxjV2gyV2VEY0EreGx3QXFHTUcvazI4bU1RRi9HdFMxRWtSZVE0K0I4?=
 =?utf-8?B?ZXVEWDRBOS9SQlMwQ0c1MGNKVWJJSUxOZkZ5K2hDVUtWUlJ4SHZWTXVIWWhI?=
 =?utf-8?B?WVQrZisyNmRqaFVKbVQrdXd5blB4ZExwZWE2eHovcys1VjdFQzR1ZE4wNHhw?=
 =?utf-8?B?Tko1b2plTnBuVFZaVUJuOVZDL01ZamtXbFp1UVVETEt6dDhGZWNkVzN4SHcz?=
 =?utf-8?B?ZFllMkFVSlVRR2RRdXRUbXhSNmk3ejlxZzYvR3pQRTZJNUVYeVVmUnRYUG0x?=
 =?utf-8?B?ZVpWeVd4cXllMzl2dXFQWjVVZUYyN0xsSGprTXJOb3JGanFLUkVpaUc2U1Qy?=
 =?utf-8?B?eDVFZGZiOGFydVlzSzRWdEdxRGw4YWdZMDA3eU5la1lvdUh1MlE5dWVNL0xj?=
 =?utf-8?B?aHJqMDF0dWxDNHBVcURMZ1ZJY0ZJVzVaQnc1NTgvanRSMnhPWXhmejNucGxE?=
 =?utf-8?B?TGpIdjNmY0VrZStDeFhyOFQ3RmZydW4raHNoSlU3UnJIdHhpOCszeHpIcmZY?=
 =?utf-8?B?SG91OVlma2hjNkI0OGFFNHdCOTVtWCtlNzlrVWxscFNBWmMvdnBOdVpFK2ZG?=
 =?utf-8?B?NmVidmVZZUFrd3ZtRm9IcDZWdmZxL0VNL2pHenV2SUJ4VWlITlNLMEl3cXFP?=
 =?utf-8?Q?9OGs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 13:06:59.0408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8dee84-c89a-4a21-e827-08de25da3133
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136



On 11/11/2025 11:16, Harry Ramsey wrote:
> Implement the function `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


