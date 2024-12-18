Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801649F688F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860490.1272507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv7W-0005we-7Y; Wed, 18 Dec 2024 14:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860490.1272507; Wed, 18 Dec 2024 14:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv7W-0005uX-4T; Wed, 18 Dec 2024 14:33:50 +0000
Received: by outflank-mailman (input) for mailman id 860490;
 Wed, 18 Dec 2024 14:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNv7U-0005uR-8g
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:33:48 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2413::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15d8fc54-bd4d-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:33:46 +0100 (CET)
Received: from CH2PR14CA0001.namprd14.prod.outlook.com (2603:10b6:610:60::11)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:33:41 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::9b) by CH2PR14CA0001.outlook.office365.com
 (2603:10b6:610:60::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 14:33:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 14:33:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 08:33:40 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 08:33:38 -0600
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
X-Inumbo-ID: 15d8fc54-bd4d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wq8lb3c6nWOflW7DCHv9YCe8BTbf9a6qS53YFkjeua6FXSr5KYbUDrWLWw4FOp7f1dKZ3HU++mPc55wDnMXLmpLOlDC8HE0+8a/ZdigprDO4otrhiYoe84FNb86O0qvkV2ldau+QeVyH9gkYMiTJZA8RE75oWloKEl0OhUGlGg30H8XifYfznx6oqq8XnHn207P3NNdov9GgYa/c8kfW8AWnv+LBtYvBsP2KAoOu+9MQi4ohchSb7sA3YwiyzYVE2mWKM4WapRqNt9ncZB6k8RAo9jHYudRCPgrN44c0X6UpHGedaXdJs45j5pFsMLLI5scgLu0hSn3LN6FY33I35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHiEYzmaPPql9175PNmfWDDddZ+K5Nc9EIMG1jrdtNE=;
 b=Q/4v2v+l0nqqmrszTH3E6yUXvIjZ52pwCIHFZxrQ8rfBmyN9edyIlmToZort+UvbdgUap5/gLq8d/3cwmGQ4dDSPxBHKf8M/qVH2bBPgNiH3Nt2xZw80ss+PRDXRu3lUR65dKWrfh3BT6aCo/gtW6vn+VyLJbSZJFFJZ+OBdNgIcNbi9Ojbvgr04wwD6nKE+5k2MbDzU5SH4WtuZ+h2Qn//DIw5gsgufgeFIKDOOJ5r3lhwm0xppPRydFo7h6m1lsb0RUphuSci6kacJhxs8SpjCjmp5nuqZAP1vT+jn52HFiHaagOY9xNEsAFWmKaWYxtx2CuIj2MXvAL/UWowEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHiEYzmaPPql9175PNmfWDDddZ+K5Nc9EIMG1jrdtNE=;
 b=AJK+LFmSABsiiFEnweOnnw1xDajsTG5L6f1GAqOiR8A6WcChgayETkwC6w8y/xJDP5czaQqxMHn/nJK9PcWH31uaCwWZRKMHMzFeE4O47yZOmxxPJ2ZV7F3C4LwnhiyxmJtMlS0dPuyrgg0Yy+uZd8zear9Lk8/KuzkifSDx4f8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c90ceea2-e677-4358-b7a3-7e8fb6890110@amd.com>
Date: Wed, 18 Dec 2024 15:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] SUPPORT.md: Describe SCMI-SMC layer feature
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-6-andrei.cherechesu@oss.nxp.com>
 <9806AD58-30DD-41B8-BAC8-F408A9BB16D5@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9806AD58-30DD-41B8-BAC8-F408A9BB16D5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: 56bee664-e0b6-4c92-872b-08dd1f70f82b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTc5bDVGSHBZZTViOWJIQklqRkM3T3dmTkxqYy9OZ1VkNU5YSCtoSXJsbFVT?=
 =?utf-8?B?ZTU2THVkeUJ0THNZVFBNaFFjbFlJb0twSkc4S3ZKUVkxY0tFdU9SZDdJR20z?=
 =?utf-8?B?OTFkclRLVXJwVEl1RjhhMlR2L3dBNld0KzF3WXR6aVIyYzhNN0NNRllUT0hB?=
 =?utf-8?B?cGJrL2o2Ti9FNll2RmJIa1NjWTlWOXFGMmJncVRLY1liZmg5MFpWYWxYdS9S?=
 =?utf-8?B?UVlCYmxmZTg1cS9od01JbDdsc1o1NHorcHIvWkxSYTd5TUlWMEdNZGY4dEgx?=
 =?utf-8?B?MmpISkZBcFd5cE1teHpRWE1uV0NnN3dxUEpwVjg0L1pseEtPMFErMEVwR3l3?=
 =?utf-8?B?d2hqUVEvY2ZkRVpzVTMrWExvd2FqKyt6U3VQTlM4bEF5WmJxNGZ1dFZBdzll?=
 =?utf-8?B?MDAvR080d3dtOVVGRERCcWVnbHAxenFuRzFia3VkbThRZEdHblZvdDZKeVdo?=
 =?utf-8?B?M2NuWk9iQVJiY2tOUHVNK2I4WkZIa0VCSzNETWlqdmJva3dxWFVnSkh4ZjYr?=
 =?utf-8?B?ZDQzaWZtdkhMTm5JeUUxekx0UXlkMDNFYmY5S3dra2tnb2xJMlZwOXFKZEd1?=
 =?utf-8?B?Q2c2aDZVeVoyeDU5NlR2QlRrVHdjbzdQemtDbEp2ZzFZOXBpdy9GTjhGbE5s?=
 =?utf-8?B?K1FSQ0ZWSi9EUGI2ZTdTYW5Uckhxa1BWUzdsY1F3U0pFbTNUSDYvRW82QmlB?=
 =?utf-8?B?SlNhN3hKM1ZyclY0U2VjR3VVYWhNb1g3dWF0Vi9ha2NtUW1GeGZ0WnpSOUxP?=
 =?utf-8?B?YmhUNnh6dXh0V0twTWJOMmcwYVA4bGVPYXQrTU1OODg4c0t3SHE2bUFwUVk2?=
 =?utf-8?B?MnZoTUZlSGZ3cXlTeExVeHI5TitKd2c0dm5lTE5uVHoyalZYUG1jK0xyRWVv?=
 =?utf-8?B?Wm85TFdoOFhGTmYxOHdQQTRHOTl0NWRkTFkySzJCN0RyZkQwcTF3R3YxUFR3?=
 =?utf-8?B?Um90MUxaZnNnMTZCTUZWZGhXb0Q3ejRmTFdCNHA5QzAwYUhXMkNOQjdQcFVt?=
 =?utf-8?B?dURLV2ZaZWgrZE5Wa3VIWExMdEhWS2xBamNrY1BldjBjaGhudGQwVUIrK3lh?=
 =?utf-8?B?b0gyN3MxOC9mYWdkWkJ1NG1QeTd0bVAwZU5vS1lhbnByWnZFL3Z2YmM1QTBW?=
 =?utf-8?B?cEg4dmRmV20yaGY3T1o3ZjM1ajlGbWNYWWpFZ0w5UmNwWmh0NkxOTEtQZkpp?=
 =?utf-8?B?Nitselo0SU5nRjlibEFnY1pWSmhLSkdkcld3R015NmF3ZWZqdG5LWGl1bTcx?=
 =?utf-8?B?bDBkY2oxTFpWN2hranA2V28zamtZY25iS21QejV0VXdyYkd6Uzh0cGQ4TnI0?=
 =?utf-8?B?M2hBL0dobGV3RHJ5Z3RuUW5xSENISUtvK0haTHh3SFp0eVY2U0FkQkJpdkla?=
 =?utf-8?B?QmpZd3hodWxGc3EyQWZEVTVRSjF3MDFRMmgxOXpGQlRLK2hIcmhIY1NaMjh3?=
 =?utf-8?B?R0M4WjZuQnBZWjR5UmFkSnYwanZsWUZxOHBoVE9jb1UxVFBKWkJ5RzA2bjZR?=
 =?utf-8?B?YlJhaWwvM2s3cVNjUGtIdWxYZTJyWktjT0g3VTdCc0t2ZFJyVGJTMGZ2UStW?=
 =?utf-8?B?YXBsWUlEYlFRalJpOEpHbDdOWCtWMmdHL0hzZ2RtT1hlRnpRdmhxM2pnYmNk?=
 =?utf-8?B?VDVIMW5VT0lsd3hJNHV5RUwwaXFPWFRpTFYvL1gyMS9QQzcxOFBNMHd4blVN?=
 =?utf-8?B?WXh2aVB1dlN2aU5zNGpLZXB3R1BkUGF0dU9NRjUzenpjamxnakkza1NtSDJG?=
 =?utf-8?B?ZXdPeWpkdTB5cXk0ZU5UMTZuQXpxUEVWRFdzOUUzYWhyRC9WcUVrKzhGSXVK?=
 =?utf-8?B?bGZ2akNVSGVaNlR2THVQZ1dwL1lsc0YrRlhFeVdyeGZMZlJRRFpCOHVBWHFY?=
 =?utf-8?B?a1hvNkRyMWJsbjh2ZE1URHJaOHVCMmdOMzBrU3hGQXpzaG1wSmV1Y2E1OVJP?=
 =?utf-8?B?V2JqZkRTSEJWR2NlMUV5RGd2cUJrZjFqeW02aWdsN2tyRGwyYW1DbUNZRzFK?=
 =?utf-8?Q?Pj7X1dlXFcjcTYRkiFBgx16eg8/meY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:33:41.5941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bee664-e0b6-4c92-872b-08dd1f70f82b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434



On 18/12/2024 11:29, Bertrand Marquis wrote:
> 
> 
> Hi Andrei,
> 
>> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Describe the layer which enables SCMI over SMC calls forwarding
>> to EL3 FW if issued by the Hardware domain. If the SCMI firmware
>> node is not found in the Host DT during initialization, it fails
>> silently as it's not mandatory.
>>
>> The SCMI SMCs trapping at EL2 now lets hwdom perform SCMI ops for
>> interacting with system-level resources almost as if it would be
>> running natively.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


