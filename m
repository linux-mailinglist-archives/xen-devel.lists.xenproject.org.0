Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457BB11513
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056670.1424687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf66u-0001L3-KG; Fri, 25 Jul 2025 00:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056670.1424687; Fri, 25 Jul 2025 00:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf66u-0001J1-HH; Fri, 25 Jul 2025 00:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1056670;
 Fri, 25 Jul 2025 00:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf66t-0001Iv-Jk
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:16:27 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20620.outbound.protection.outlook.com
 [2a01:111:f403:2409::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 994e911e-68ec-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 02:16:25 +0200 (CEST)
Received: from BY5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:a03:167::28)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 00:16:22 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::6f) by BY5PR17CA0051.outlook.office365.com
 (2603:10b6:a03:167::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 00:16:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:16:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:15:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:14:44 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:14:43 -0500
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
X-Inumbo-ID: 994e911e-68ec-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHbCVA+0J+Tj2kibNfRk1Ekyq1FzJZF31ghbf/NxfGlZYR/qfhbufSxNADfg7T1urGnOUVRZzeO6GBdrZpauExO/PIWHUB9HD+HJRR8M/wwsmm+QnufCQ4EvLAwUvclLhWtIWCMYS2tkxhV9o2uRldFGIdeeNYmCNTWTWkBSwc+yiMraYvbuILOC07F0aT2i6du6qm6MSBLoI/AgY1FCebRTGDUJPR3MAsYH0iqzpqG1r+q9F6Ieh28X1SWyASUB5tVgQQbbLc9E6zJLZ18yna7oLSzeMky0nE8f5g7xmG8+028Xem0RIhI+j/xy1M00AQGlbnIyEY3Y/GiO29GZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcBeyMg0EuuF4q/pOmdqvwEFpKVTrktHkIJT4nmMAmQ=;
 b=k1N3tPpQBQa6KCWnLsDXh+q9sG0MHEPx35qiVxm042mUT817mHecjJ20Vy5yrgekbAEof5zvy5nVuI34G8Ytur9H81/Uaq8lAPlCzGFxVuUvA0YrVCWT9Wx9MioX7JDC8szBevxyOYrNGouI6rworSIAxfBMjGEQspYGaOHQmcFue0ZUZW0zewSU9jPmFxedb01VZYlhN1hvsH/e3lldPn6oldk2aVjypSvJFcoLWYz2Uc21Wrx1ZNWfcUVqypvo9NNEwKB41i6xEid23vMVEIKXpLWmqgPGP89MUK/ng2yWMm9P2VCEglLY3Y6wT+C1nwweRGAp1QPGJt+xQQzbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcBeyMg0EuuF4q/pOmdqvwEFpKVTrktHkIJT4nmMAmQ=;
 b=QlUT9vDvugXLLgaclPNQk75IFTuVaF6OTrZw24cATR693czqPg9PxocFKEzy1ljCvVlSiFrANPq9BIz/PvU9i2B8X/Rc7vFH3HsvJcFsP5dmO81g+DcVlRZIm7XX2HmOy7ALGjUFAjiHm6Uj/eFQQUDJjMvIWwa6DuxI6z6ED6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <48335a12-533e-47cb-b4a1-e9f965287718@amd.com>
Date: Thu, 24 Jul 2025 18:31:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tools/libs/store: add get- and set-feature related
 functions
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: cda8e1aa-8b8b-44ca-fa0f-08ddcb107c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck53dVhETmwzUUJzdkVtT1RtbmE4aGZ2Qk04MUVjbnlhS3lVOXhyVGI3dWRT?=
 =?utf-8?B?MXVjZ3lwUjZJNjBrNjdTQlZ2R21jelNoejJWODkyUmlVTGQxZ0JIbVhPWWR4?=
 =?utf-8?B?OFhmdG5lYUlzalJCa0pjZ3EvMndPT0FGMk5mZko5S3BFb3l4SHRKQlFyRlBr?=
 =?utf-8?B?SWRvMHVWRzNNcHFTUFprL3lWaU5XaVM3bllUR1RLQzdjeTBTR003SHQ4a3d0?=
 =?utf-8?B?Rlp4aFJ5eDR5OFhWRnN0L0czcTNNVHdPSTIxK25OV3k0U3dDS3NzK0NxdGdl?=
 =?utf-8?B?azBqdjJxVVo5YlhBazJCYjZuZVVlZS84QlJHYnpoMnc2QkNiVWdNU3Y3Vlox?=
 =?utf-8?B?UUFOYW8xSC9NWC9xMmUwVE5NMWtmMmE5akVOUTEwczVFem9CckNlRm9aTi9O?=
 =?utf-8?B?UzVFU1QxTFd6NDl0ZXc3UVZNOElvd2ZNNjNsVXBRZVNkdU5sQ283MW82bXJh?=
 =?utf-8?B?S0NsdVhEQ1NMajR3bU1pK2lBZEsrRjVTbTQ3QkNhKzczMy9IQTFvVEpOSURN?=
 =?utf-8?B?L1lnSDR6ZXZlN3R4RG5PbktDYStZVUVxbFp1T1F3NHpId29JeEdaNFZJZ21C?=
 =?utf-8?B?UHVQN2YvbzY2aUpHRHE0KzBZeU9mTGFBQmkrbDVuSmVzYjcvVnRIMXoxeENS?=
 =?utf-8?B?dTJ1M3ZBVVZFSFdmdzBoWTE1eEpKbmNxNW9NVGQ3dUpncExqY0kvbktmalRO?=
 =?utf-8?B?d0RuWTgrbFl3N21MbXE3ZGxHVHdwU0E2SU1nSkpSVHFRM1UyN2RER1M5MUVk?=
 =?utf-8?B?dklRZUlOZmd5Um8ydWd5dmVBNkFHSHpXRVNnNVQ1cXVka0RFNXJ4OTVBV0pH?=
 =?utf-8?B?TllhSVJicUkxbEJSV0R5RlVZdFhTMEFSSVRhN2xrS2hNcjVySDdqRmIwZm1l?=
 =?utf-8?B?V3FrOXZUTE16STRYdGo1T3NvaDNjd2twSzJyZFhzUUZNdkdiZDU4QWI1SFFQ?=
 =?utf-8?B?eGxBckwzRC9xa09sTFBwRVMvdjRqV2M5ZTZmZ0s4V0twaXZnR0RTTE4vN202?=
 =?utf-8?B?c3FLc0xHaGRZMktYZlY4eDBZU0xUQk5ObExLWm56b2x6ZTFMSHAvcm4yREti?=
 =?utf-8?B?UEJKKzlGZFR0YzZ1S25IK01tQlN5Y3MvNVJZc0o3OHZmVmpWcFpCTXFlQWN0?=
 =?utf-8?B?K2lLQmF6anVBME9CczlwRXJBeXlheG8xZzBoMG0wOTR1V0JrdWRJWXZsRkp2?=
 =?utf-8?B?K1ZaNVE5QXFyVjNGZHl0b0dCWGRSdXhlUndxN2F5bEplQVJDNUR2d05tU2Jn?=
 =?utf-8?B?RnFGeUJBK1dDWnNNK25POWZzWks3Y0tJSFBucXBadExHdlJJT0o5L1JPa0tn?=
 =?utf-8?B?Q1M1emZOMlNacE8wU254aUNQNm1WanlUR0ROL2hUYjZ5VXFRaWZFL3I1MlJI?=
 =?utf-8?B?L1Jqa3J1anFvSGxpTlRiOHZ3V3hPcGMxMUs1cVVLRGg4R2IwdG9zWnlGZzkr?=
 =?utf-8?B?VWt5Y3oyaSszUERpS2VRdFZQMVlSR21sdFJydlhMSjNWaDhNSG4yeE1qelBU?=
 =?utf-8?B?RHpLSUNhYUg1QVFrV1d4bkNxb3NkWG5DbGZMY1d0UzlPZzNnT1hjVXlKOWpZ?=
 =?utf-8?B?aDVadjRZK2VPR0U3TW45TEFoaDRjdUdMYXhqSWwrYUN6STRlYXoxV040Sjhm?=
 =?utf-8?B?NlgyOWFtcXN3RXVhZ2NIMHM0UThQbVZVLzlQTEIwV2RHUmVjNG9JNS85UVZm?=
 =?utf-8?B?Y3JwT3V1WGQ2djRrcUJObGtKRWpRRCs2TkRBQ1dnSlhtdHY4cEMzYjlpSkdY?=
 =?utf-8?B?TVBUY1JoRzk2Vm1kTEt5a0s3cFBPYnFkZjZIZHZFMTdRSXdNU2g3R1V0VVV4?=
 =?utf-8?B?Y1RlZmRicUQxT2YwSlFMaml6OUZ6Y3lEY00vUkNCdzhKZWZOSTJjNkJQNFFH?=
 =?utf-8?B?OEMvQ2xMWktPNTN2VFVXY3Bock5KQTdqaloyWVc4N1lEU3ovUmFCTnNUU1hs?=
 =?utf-8?B?b2laekx3NUJabXFPTStNQmk1ZDFDUjc0V0hMRENaVDU3aTdVTDhiaFArbXJJ?=
 =?utf-8?B?UFFhbWlwa3dMdGc5MFluVjkreE9neFQ2ZjBzSyt4dGRHTFptbTJwdWx6QWVO?=
 =?utf-8?Q?ywmjpG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:16:22.0277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cda8e1aa-8b8b-44ca-fa0f-08ddcb107c49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740

On 2025-07-22 10:06, Juergen Gross wrote:
> Add functions for getting and setting Xenstore features to libxenstore:
> 
> xs_get_features_supported(): return the features supported by the
> running Xenstore implementation as defined in xs_wire.h via the
> XENSTORE_SERVER_FEATURE_* macros.
> 
> xs_get_features_domain(): return the features offered for a specific
> domain.
> 
> xs_set_features_domain(): set the features available for a specific
> domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

