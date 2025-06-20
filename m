Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46668AE243C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 23:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021307.1397312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjUQ-0005up-VG; Fri, 20 Jun 2025 21:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021307.1397312; Fri, 20 Jun 2025 21:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSjUQ-0005sZ-Rn; Fri, 20 Jun 2025 21:41:38 +0000
Received: by outflank-mailman (input) for mailman id 1021307;
 Fri, 20 Jun 2025 21:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZSV=ZD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uSjUP-0005Ia-GI
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 21:41:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550febba-4e1f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 23:41:33 +0200 (CEST)
Received: from BN8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:408:ac::47)
 by SN7PR12MB8789.namprd12.prod.outlook.com (2603:10b6:806:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 21:41:29 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:ac:cafe::65) by BN8PR07CA0034.outlook.office365.com
 (2603:10b6:408:ac::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 21:41:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 21:41:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 16:41:28 -0500
Received: from [172.17.97.97] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 16:41:28 -0500
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
X-Inumbo-ID: 550febba-4e1f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbTtYgG68ctedPap1NpxqGcpiDpzti0UaU8rUdUKXAx1d74peks02lMC/R0mu42aTcMCiWXtll0aTU6fbOmMJmuO+WrvAat3XGTqIDYionhYRw+2oU6NDZLLYWNqEvhMk3KOEt6YytRKIJx05TV4ky64mxBRCGz0/YABr6+hFHi81SXyDaZlVxyJLszwOV3lpAP1NqdMGQQEXvMnXUVgcR54ZjjcigwjWsvS+GQEX0GKAoghw6eatB1DX+O3ScFS4noJAYzg5CDzoMrADwf0U8Za6dTUuYi6Lrl/cfspf+cgWYfgZd/m9b1EV1HCVFkI0bgzySALJDX9507VHKXdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnWtiEgKIUpWLHi4r9fsJLbrakgE873JK2R6onI6AZk=;
 b=kJDYCua13aLLVjvR2uZk6p0TeJjs0z2g6I+xzAfgkmSGebvK9W8SCDwRmvLFZICL8fkviYDtEgVz+NF9NYGNNv98Vnd1n5VoAXqQuyQZs6A7pxdxHTMmv1FNNRHquYw7ygzXziCNtYi2zY3TMIKrXtWGnSppEn09cY8vGVgEtSeSISNFdQnWdklj8kU21R++YXY2CVGfcCBqKUbI7jXnhyFPsbq7WSNaY/IvbmwJHh7YOb5pcHYzXoYssduNj0jq6nuwznUi64ye4/SOdey6ylxL8+a7uY2VN0HHgghc7NcLdzBdpWrpzBtCQlCXKffEbm0+c7scdgu8wdU9p7gLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnWtiEgKIUpWLHi4r9fsJLbrakgE873JK2R6onI6AZk=;
 b=u4DXy4A3RPZGJCYMFI2jYUTmhTGar+uEk/LTJauxTxNf3VXNoAdl7+LHfDgRA209TiFLdvPs6t3cF/12JQ5uyenlW2FG0g+cVdEMZhK28+P60yF0Di9lO7f9RE2sRu7qkVVCRTM2lwCx8RoHNuha89wY0m7qsBU3bjqAf49sP5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <20d2338a-015c-47f0-b341-d561e0ca1005@amd.com>
Date: Fri, 20 Jun 2025 17:41:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 4/6] console: drop parameter from get_console()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250619113804.32694-1-jgross@suse.com>
 <20250619113804.32694-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250619113804.32694-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SN7PR12MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd6b741-8939-4cea-091d-08ddb04336fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U01SV2dmSENGcU5EN2c2Z0xYb05EQTBid2VrUHNVWWJZSkRyS2JieW9RVEZ4?=
 =?utf-8?B?MDE1TFhuRVM3dFA3dDNzV1dha0wvYkFZTjNSb0pjcFhySU80Wk5ZWjkwa2NZ?=
 =?utf-8?B?V0VUWUNLRWZWR2Z3WUE4d2J3SHgvVmYwZWNtaHZpR0pUUmswNmp2YzJTREcy?=
 =?utf-8?B?K1FwdjUyWURYYW1ZUjd1U0FjR1dDWnY2OGw2UnNjd3dvTzd0bFNydEdLcHNZ?=
 =?utf-8?B?S3c1VUdCd1pzMmlYQkwwUEQyWkpWa016UlJ5dW02R1ZuM0ZOeWFTcEFMVGdy?=
 =?utf-8?B?TEh5dHlaZlE1d1FCNjJtaXhUZ3l1Q3FjQ3Nna1dGWDVRV25mRGhjaGVkZVJY?=
 =?utf-8?B?TkRWMWNmcWE3Rnc4UU85dkU5YzhybXZqZ1J5UFhZUVNaRmJ2RkxiZ0lhSmJF?=
 =?utf-8?B?Y1JvU3F0eGc4OG5zc3cycmZOMXkydzR1R0EwWStodHJXQU5rNExDcE9va25V?=
 =?utf-8?B?RDRIbGNsdFZ4MVc4bTFvTXlTa3ZQZktpTkZPdS9KUzJ2bUtGU0NjVHgwNnZq?=
 =?utf-8?B?M2tnWWhsYXlpUlhoWGE2NGdJQW5leHZvWHFkcE1TQldZNHlyT2xCUGc2djE4?=
 =?utf-8?B?VWcrOFYxdHlHai9PNWxVQXEwK1JzSUprbTNPbHdpTmw5dVpld1d3VjhlRXA2?=
 =?utf-8?B?SXRUOVFMT3RNTGJibWVVNFpLZkNsZlM3SGFNMW1sa1J4NWFPa254WlNTSmhU?=
 =?utf-8?B?VFFxZjBwdklEWTNyYlJrdXl4UjlXMGd0VDZUaVNLVUpFUDBTSkh0cHJGWXgr?=
 =?utf-8?B?ZGV3dDhVQlphSTRKci9HT2djbDFtcEtJLzNKVjU0cDc2QXkvelFTQW9nbTE1?=
 =?utf-8?B?MStKclEyQUFLeVIyUDBvMDRMbS9xdVNmalBzMGlLWmF2K2VlZDlVMUVEbmtJ?=
 =?utf-8?B?d2NVcHNrd0hyeStFcW5vQi9Ic1ZwMHVNRTNlQWs5RUtNaGlPOHRyUHlZVWwr?=
 =?utf-8?B?NVUzRkdWTG1GUnNxRzBwK2dPYVlHYkd1OS9pSVNxeFBhdWkyYXdJUm9HeXNK?=
 =?utf-8?B?cWxsNDYwc3lwNlYxT3dNdk5SZ2w3SXpmdEZwekQxU0Y0dTBhOUUrRDhLcUZJ?=
 =?utf-8?B?c0paMEtYd2k5UVFpRHErNG5mTnRMeFU0TnA2Z2hWMkRjYXZCcWo2WkZjWUFz?=
 =?utf-8?B?dU5vZjJVOTZabWVoelpidEd1VlZUejBWSUVWeFNDSEtlcnlnK1E4Vk5PNXRP?=
 =?utf-8?B?ODFtN2hWRVEwZnJFMzRzdWNUN24vL1Z1dEFiRmN6djlwZE5TTnZYVDNFSVpN?=
 =?utf-8?B?aVJDcEhOTnFacGt3MzlGQVdsTHoyYmVwN0N2ekl2U0FEWW5MaGxqdW9CUEFS?=
 =?utf-8?B?M1R3YmpweWliNWtrYWJjTVBPMSswcTgzY2pacTFISDZ0d2g1Z3FrUTZ2ZjlY?=
 =?utf-8?B?NGxLcVN5RDUyenJMbjgrM1llNFFJWXhOUCtFblAveVJYOUZTK0pEdWU5N2Zr?=
 =?utf-8?B?UGhMcDkzTzJxbGxTTU5EaE5FV0NobnZEYlVIS1VXTEJBc0N0VnZaZmhMSkRi?=
 =?utf-8?B?bk5hSmlFQ3NIMHRFSHVLZEtnaEtza21XR0tlcFhmRjJxeWs5UTBHdU9EMGMr?=
 =?utf-8?B?bXd3MTZiK04wdHh4eURocTExaFJBTUdrVHhPR2FTUmtwbnAvMFo5NkV4U2xC?=
 =?utf-8?B?ZVdwQ0dzZWNveGZFeUlWcmZEb1QrK3hYdEFobE1JQzVYTGtudGxXOTlVdTZ5?=
 =?utf-8?B?ZXFLMEpSTkE5Qzd6SzdSU1oxQ2FjR3RMMFByaUxzcGEvZkVVdGhtc3VscEtQ?=
 =?utf-8?B?QVZ3VEM0ajlNSm8xa1JESVBZb01hUUM0bTBiSVZRWGxRWnBoTi93bVJVcS81?=
 =?utf-8?B?ZVg2WWZzdU1BeEtTUFlRbzBleGFMdktUU1lUd2JlSzBzSm5HWitYYzhadkVu?=
 =?utf-8?B?R3hTNHJ4M2pUVUhMSXJMV01hbWlMYVR0NXRUcEN6dVFtdUo1a2FiWnZKWTRO?=
 =?utf-8?B?dWRPdDI1U2xEUy9SNGdQaEJHTi9nSDJFTndaNkF3YlN1Zmk3TmN1OHcwTGYv?=
 =?utf-8?B?RjM1RU9idTJqUVcxYTA0ek1BQ1lSKy83RjAzTGpOUktDOFFlUEhDMjJVSVpn?=
 =?utf-8?Q?iP9yNB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:41:28.7970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd6b741-8939-4cea-091d-08ddb04336fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8789

On 2025-06-19 07:38, Juergen Gross wrote:
> The parameter of get_console() is used only when running in PV mode,
> and it always has the same value.
> 
> Drop the parameter and use start_info_ptr directly in the PV variant
> of get_console().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

