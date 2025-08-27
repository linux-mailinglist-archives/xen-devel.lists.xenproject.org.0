Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC81B388ED
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 19:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096654.1451291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKLl-0001VW-55; Wed, 27 Aug 2025 17:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096654.1451291; Wed, 27 Aug 2025 17:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKLl-0001Sr-14; Wed, 27 Aug 2025 17:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1096654;
 Wed, 27 Aug 2025 17:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urKLj-0001Sl-SY
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 17:54:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2009::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9d9755a-836e-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 19:54:18 +0200 (CEST)
Received: from SJ0PR13CA0108.namprd13.prod.outlook.com (2603:10b6:a03:2c5::23)
 by SA5PPFE91247D15.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 27 Aug
 2025 17:54:14 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a8) by SJ0PR13CA0108.outlook.office365.com
 (2603:10b6:a03:2c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 17:54:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:54:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:54:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 10:54:10 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 12:54:10 -0500
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
X-Inumbo-ID: d9d9755a-836e-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARAut7dQncewEtMgIwIz9XBck8UpppYZiTy1ko3mEAq2HHsLTliJ5fI0L0TIk2PNvKINpCpRiBYmZkFq0HVoNFxFKlTBTa+jw64DOwSXWB1FAUcFIYHTDIqB+jHOxn90IM65k6AoT7/edCwQRNN/Jfp5LSV2SYJYKMDAX0aoiYQt3j7K7o81v0ueUVvsPHL4mO8UWdvX+NGjV4JkN9P5KafmkxsVEfHjxMHuvVgrrhUgtQKrw9ECLPKJW8qYD/Q+2GKbWzueqgNA7XaT9xK02LN+sz9yLGg/aLSEvYqE/X+MqelktHW9IcdftvXSyJNrK7KBZ+q3yGihs4DuChLznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPeXV9WecEI1cPsKm6NwAWath1WDYBCeRo9RVpajFCs=;
 b=v2v9NKjTjAsGDgEbfexqsLaS3ulMSfgB6ccr7lFpk+LMa8CfgbDJIz9TW1q8+BF/qUIeFzA/PKrJnmEX2xObAfjbHFmwnBdG8tWc4gtWstU/woeZheWRcv0JxP2LdHtxKBt373BiMSIWdxGrlrg7nDTCkcsStx707cIc/75C8PADByVdEkZ4tV45fUro5JIuJdbGAnrVK3DWgTWKd6yGj6In/Ec+fVHg3DvdKjRe1kjLhzBOddQ6q3hJmw0PUfTnql9lsKw0WZ6RjZRXBaPTMCIJE3TcQiLoX5RvbMwsnlRH4sW5RmbclQkIJSSaBteSuKatAznb54pkpZx0Ry92zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPeXV9WecEI1cPsKm6NwAWath1WDYBCeRo9RVpajFCs=;
 b=OTGbFCDz9cAPidZNYV8MuuJ8naNIJeCwmvnDRiCX+tgrCgrUhkX8dTjFjkHxgazvUbECfJie6iRgsZ7z4VzmU+uzaYbTrOgXbe9DGH5g9dEssAKm5uO3OGNpp+gFFM86pQVheIco9Iut/FXAeATHlyzigGbf2FvPpVQXWu82Uc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aac8be7f-8eef-4c19-965b-d5cd9d7d97ce@amd.com>
Date: Wed, 27 Aug 2025 13:54:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/11] libxl: convert libxl__json_object_to_json() to
 json_object
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-9-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-9-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bbd66f-f87e-47f8-ceff-08dde592bc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlpiZ3RpemdDelNrdGx0N0VZdVZmaWx0ZGJNOGpLeEpKd091TmUyNmlNMnFM?=
 =?utf-8?B?NERTcm5MYnczZmt2SmdrQnJWcGZPcUJRZTNpWDR1M20rUG9KdzdWb2N0RGZq?=
 =?utf-8?B?WkV6NTZhd2NFbVo4b2NMdGFpVkNOKzZVWHFaYVZUcS9sblNQR2x2Mk12VWdX?=
 =?utf-8?B?SkpZak5xQUplWG9qUXJhNDhwUk55OEh0RDBheitma2lvalUrZ1ZSODl6LzNB?=
 =?utf-8?B?SGIwb1ZuMmhLb2FwbFI1SURNSUhLanl2SUNyVTk4ekRremFYLzVjRDRwWGNo?=
 =?utf-8?B?SmhmN1hUdmxKaUgrT1c1QnYwT2ZYQlBVdnhKN0JKSGNmSjV4VzRKcWlrVWl6?=
 =?utf-8?B?VUZ0ZklJTWNmUVlTUk80d29YK01zWDhFNTNiQnNJNU1lcHdyS09SYUxOZ0Zk?=
 =?utf-8?B?aXBLS3BVcHVtTG1kNDlGd05TVjcyTlhHOUJWcnBLdysrQ1pBTE5uWG14VW1G?=
 =?utf-8?B?L3FKSEFxUUxySEs0UWNEdWE0L3RDVmtqcmQ1ZFpDa2VzbDBXRHRRTmxpTU15?=
 =?utf-8?B?TE1ETlllekRGQnhDTFd6RW1FVnh4bzU5ZVVoVGJqUXdKNnl2ZDhnQ2JsZWNq?=
 =?utf-8?B?TS8vTVB6TWs5NkV1NVpyY0tpZlZjd2pMVG4wcGw3MDlPSHZkbDR0NG1NU2Nh?=
 =?utf-8?B?WXdmOEFiR3FuOGgzNjA0TXBGS3FrMEJqNkxLcTdkbmMxNGxZYThPclhIK3F0?=
 =?utf-8?B?R2ZFSFdQZnlQYkhtWEQrRE9qZkUxZk94dkltN2RxRFlialJ0Q29GYm5OZ0NE?=
 =?utf-8?B?YkRtajJ1VG9QdlNIVEM3YmFBZURYMHpVdWRZelpRa1JBWEdOZzlUYlZuRUtm?=
 =?utf-8?B?dmxaTkhyeTdPYWhyRG5LTVJIdnhlRjJQd1JHTUpSMGpYdmRKZVdkZ2diVmZP?=
 =?utf-8?B?TXBPdXdObHBPckhGODZadnZYejhlRXFXWGpvbGQ4K296YmwyMU9kUFpGYVc5?=
 =?utf-8?B?R2VVTm1yUS93SlUwckt0LzNtbDdxTVFZS1VySnNObDZ0U2RzdS84QXcyTE1O?=
 =?utf-8?B?ZHZkOFZ5czY1M1p1N3ZMOFlwWkJJTGE3TVBnWTJFNUFDbGlrMXEwdFZUOTFv?=
 =?utf-8?B?RWZldzNqeExKQVM3cWRxQXJWb3JJdGxwYTdsSTV4VkRYQTc0RzFqZHRiT0RH?=
 =?utf-8?B?aWFWV2pqS3puTjBPbjVQQWtLbkNsdTVzOWlYYUU5ZDBKRjlVT2U0MXZwZlln?=
 =?utf-8?B?K0xJOEU3YzhmeGlIV0FPbVJzNWtOdUZRSGxMMVlSRjZMWEdzSjE4UDRNdXRk?=
 =?utf-8?B?U2VLRVBUanJ4OUttZlZ1ZXU3dHFqSk4rRTBQM0xINTBkc1JsaGx3U1FEVU9V?=
 =?utf-8?B?aEFoY21udDNCR2oyaktwVTVrTFJ1NEkzS1lIK1g1cVZNSUQ3MlM0S0c0QTBR?=
 =?utf-8?B?M0s1aHdiUStGNFF0RCtiNEV4eDVFYTU4RU1KUE5pR012elFobDI4VGJlZzJ1?=
 =?utf-8?B?Nll5Mk5weWF6ekx6QVd0M0pUTXZvWk85MmVHOWROWDhaK0VLOWh3a0hlUjQv?=
 =?utf-8?B?NzFoTDN3eGwvQjY0Vk9WVWY5bHpmT1pDRTdya3pSZ295NXUwT3NoTno4NWZo?=
 =?utf-8?B?TXg5aDRUaEhpdWJ0L3NyaXd3YkQ2NDR4c1FtNWhBSG9TWTB6cHdkQ1o0NldX?=
 =?utf-8?B?aFFYVUk5WlptYk1EQ3JZdnlweEJXdEJqdUZ1d0duNm9USVhaUHFlZkhjNzZW?=
 =?utf-8?B?NndsQXZtZ0k0MnlMaXFpT3RjUGhsNnhrdTh2aWxLMWtTcHVFMm96Uy9BSUxz?=
 =?utf-8?B?SmExbXRwK3NvQWtKUzFjQk9ERlVybjZJZ0dYZnczcWlNTStOV0tMNXBHQStN?=
 =?utf-8?B?QzdocUhBeDUyclUvSjNRNXlXNmxFTko4SjN6UUoxNkFXZnBxWVc0aVFSaGNW?=
 =?utf-8?B?TzNvVFQ0S29yZ3RUaEZiZ0oxQ005QkY5RWIvNFdFeHlXTW1nbkVnL0FOaW85?=
 =?utf-8?B?Rnc1K1ZWYWtUeEhNbWFobDNoMW9oVkxVN0czVWltRFcrZVhoZTc1Q1EraE5H?=
 =?utf-8?B?Y1g1VXk0WWtiY0JCb3hJWVRrQnpUU3UzYlVLb2hGdXROSWhsUitCazMvL1Ra?=
 =?utf-8?Q?XY6WL9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:54:13.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bbd66f-f87e-47f8-ceff-08dde592bc16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> But keep the implementation done for YAJL.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

