Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489CB3892C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096676.1451309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKRe-0003bY-UY; Wed, 27 Aug 2025 18:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096676.1451309; Wed, 27 Aug 2025 18:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKRe-0003ZJ-Re; Wed, 27 Aug 2025 18:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1096676;
 Wed, 27 Aug 2025 18:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urKRd-0003Z6-Lp
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:00:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3904cf6-836f-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:00:23 +0200 (CEST)
Received: from DM6PR21CA0010.namprd21.prod.outlook.com (2603:10b6:5:174::20)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 18:00:16 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::77) by DM6PR21CA0010.outlook.office365.com
 (2603:10b6:5:174::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.6 via Frontend Transport; Wed,
 27 Aug 2025 18:00:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 18:00:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 13:00:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 13:00:15 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 13:00:14 -0500
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
X-Inumbo-ID: b3904cf6-836f-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzrLCUZ2g6FdEegjkq7wJ9IoBL4Wt5TrE156t1PghEQFRvedqim3qQOik0CzbUxUfY0/KNtrsKaosiw5PmZjEarV8J/2di9x+z0kVE01ciV3hksHb/ZrWduCDabhEtwAM/lUsfcmH0Olog8UjZ7oM0dvXPFGWNzWuQQr4SkBHylbNqAzeAkYsKLrsxZBvOamfAdn0Xvfrax+pM6uQ9nySlmha+SRmrV/MEOyd+zJ6paNrD10vXBxeRHfowjHszENbSSNl0C5WuW1ustcHJ7xm2EEisClaRlGqzpipFIr4Z6CxrOPqrYIHATWUj9HTrK/lv6Js7NB/q84vqkWOPJYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij5/r4B0K3cb02flsbpmmzcS91Y5DTS3nBtZ5KhTF7o=;
 b=XV/8hugfC2Z2wJFAlzgo1HKOowZ5eH0NEWkKCqxz9WolnsBDdqO4AP5a50KpipHbQRUEffUN601ulIOwids9EYxBKRXyXF/JGPdYiZKlOm0nVfilnRNgMXK7iewCjbGvgMGCQCPhMQLGtIdF4wpg3nGOzZW19S0MahVGX2tO/P1mDTu7gcqV/O2D9kj75d3/J9rd/sDiOw9Qww03VJ4E2q6o+idBRR0OMFLgZVWXMhV1LGZEf6hZtcqRpMjMIueuL8Y+leASRafPpk/KPS/UwxbVGs+dLHJfhRr2mVs/wyp9Ky8HfQU2x/RlEfgyjT4rYVcBtHJsDkLPlHoBBj/jZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij5/r4B0K3cb02flsbpmmzcS91Y5DTS3nBtZ5KhTF7o=;
 b=mMfLJLB8yhfIfOHJmd5MqcHmlUN0c+4KBXDIyar1pPVEORvDJx8h2D4bl6f5ShwO3otUn13yj2bmG9t9aLQS1A5gAz7DEfmAPx8wCOMcqd41DVOb5kEt5wT6uS/ze/U75MTZVLbJgdyF8y1GJKQrRIwtNGkHYnYGoM/bCCsLduE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c6f33861-7042-457a-8ca7-217293e47d7c@amd.com>
Date: Wed, 27 Aug 2025 14:00:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/11] tools/libxenstat: Use json-c when available
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-10-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-10-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: b57390f3-dea2-4925-6a06-08dde59393c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjhBMVZsK1NwcHBESFJ5TUN5L0VscE9lekQxUXNOQVN2dFdHMU04SjgxcnlQ?=
 =?utf-8?B?TWtDbVlMWVRtRmtNZXZ4UWpJNFpTUjBBSm4ybWtxcWx3a2lna09CSlhzTkVK?=
 =?utf-8?B?N1JyMURCY0NoTnJ1cWpQdWtydmxWMDl0cjVmUjNRblA2cDdQNEdwb0FPMnY5?=
 =?utf-8?B?QlpkUDFaaDIrMXVhbzdOcVZXMjJudlFvV05xN2Y1MGdzM0dNakJXK2pXNjA1?=
 =?utf-8?B?TitzTXNycENJVWhGUmNoWnZYVWl3eXdsdVlhTmlmV0lmZEhNQ0o0N09GWjUw?=
 =?utf-8?B?RnhQT3JkOW4rMTUrK25KUFc2Sk85TS96WFFveVhIbVluOTRybFU1YWZjNlRk?=
 =?utf-8?B?eW1FbGZxTmNyNGpONFdKUWlCM2xqUHJLeDFWQWk0T3IwZ1FINFp1aDErcmwz?=
 =?utf-8?B?dTZvM3hGa0p4QUtTTGlhRStPZHpkZ1hMWVpxVUVTZ1BkVnA0RHVPWEhzT21C?=
 =?utf-8?B?TW5MTXdjemxESmZWb2hoa083SUl3ZktjakJzc0toSENnMUVWUjJLRUxaWVhE?=
 =?utf-8?B?TU52ODlaUTFiQVBsUVVxVStIOWFpczB0MXVlTy91UGJVb2VKYmYwK3R0Mmd1?=
 =?utf-8?B?QlFoQVpHZ0dYUGVtbGxnNDAxeUVKaHo2Y3FxZVIyWXZHZTFGdG10WHdTZFcw?=
 =?utf-8?B?NW1pK2xvTEdtejRwSVRabFNNZ0M3TEZQMUFPTjBWZnY0YnIwSTlZVS82SGhF?=
 =?utf-8?B?K2dGRndBZ0lxaTZTN0VqeHN4WDNaNmR1bW9GNlhUVlE2N2RuL1JoYUN3aUhO?=
 =?utf-8?B?L3hOYjU1NTB0cmd5cW5ZSlhOMUtFMmxyY1JCU3Q1VXliTy9NT2k1L2RoQS9o?=
 =?utf-8?B?R2YyQ2hRbmdKRU9zdk9semo2VFJmOHFhbnNMVlF4SnEwSjB5SVdydTZmSzhk?=
 =?utf-8?B?SG9nVXpnbTZzNHp0dTltVTdXaDlIL3U5bFZYY0pWRkxVU3FnR3lMSndGanQ2?=
 =?utf-8?B?ZUlvRGVwbnlOTHlTU1lCamM0cUpZN0pxb29HNGpqMll5U0lNNzdQUWcwdEZw?=
 =?utf-8?B?cjYzQmtRQ2NaTnRKb2pGQTBHMG9iZ3RBckRuVHE3TXgvSDkyVEFGMC9rOVRY?=
 =?utf-8?B?emVsY1hWTUxZeU5NLzV0L2VGOW93T0xSZndHTU51SDhQR2FxcTVWbWpjNnBB?=
 =?utf-8?B?N1VHcUhHNVJwKzE0TUxPTDJFeW45eS92UTYzd3dRbFBRSFdWcTIxdjYwMysw?=
 =?utf-8?B?a3U4azdmNmxsaHpYVHZibkZ1cFZSWHgwV056RkczUUs2TDZMUnJNN1NhekFo?=
 =?utf-8?B?WGhlbGlsdFNmNGk0a3VCM3IrREJSbDdzY2crL01XWGYvS3p3NWdtejdyQ0pI?=
 =?utf-8?B?Z1dGOTVscGZMZ0dyM01EcUFrMTNheEVtaTJRWTlCdVdiaFVqaDgvU1M4VXlH?=
 =?utf-8?B?OVBmN04rN1VBeGk5MXFTdGxEWXhwU0I2akQ3R1QvSWhvT2xkWnlWSTVERFZ0?=
 =?utf-8?B?dXQvaXlDb20rMFJvOHc2T3VtTVVIcSs0NUZMajU0ZUZXbXVySjFwazB1TVVn?=
 =?utf-8?B?K0lxK0ExSVBWWk5jWHkzZ1BQeVBGL0RuRGtiOEtNN0lqNmR6WVp2UDF5a2dJ?=
 =?utf-8?B?UjVZRmIxRC9qYlltbEdhRTBjYlRhb3FIQVE2cFRxaVMzZHE0NTVLdm1NY2V3?=
 =?utf-8?B?WnltbUpmd3FLd2E3U2V3eFBkVG5ZYVpkaDEvSncwb3NDcDNkUzU3d3M0UHV0?=
 =?utf-8?B?OEdmNUVaS25OSmtLWXN6L1I4SzJTQmFZd1VxQ2o4M01PaUJmdWVXNzF4eVB3?=
 =?utf-8?B?TmV6dnBWTEZwNnByV2tnYTBvZHFIcnVnZUtuYjJLR05INmtCTnJGWGpQMVkv?=
 =?utf-8?B?emx4RkdXUzVSbXFVdUtDZ0l0Z0pxRmI5YzJMSFRSdHU0Y3N0cmxhY1pXZEww?=
 =?utf-8?B?ZnVuVTJxTW9DVDFsdXRxVGJSb2FUbk5qWTA0eVg5djEvUFF1KzVzVTV2bjFI?=
 =?utf-8?B?enB3cXRoTGVKTnVHUTNiSU15K1c5emR0Q0dMQ005WnViNjBPWVNSd0wrdDZX?=
 =?utf-8?B?Q2ZqYm9jOE1nbUhKSGg0eHhVYUZHNTB3bHI5L3cxb2QvSTcxT2VsUHNCa3h4?=
 =?utf-8?Q?cGFXCJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:00:15.7434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57390f3-dea2-4925-6a06-08dde59393c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742

On 2025-08-08 10:56, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> This is mainly a copy of the existing code in yajl and use json-c
> instead.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

