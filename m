Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11730B1154F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056741.1424748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6RH-0007OG-LO; Fri, 25 Jul 2025 00:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056741.1424748; Fri, 25 Jul 2025 00:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6RH-0007Lw-ID; Fri, 25 Jul 2025 00:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1056741;
 Fri, 25 Jul 2025 00:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6RF-0006uM-W2
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:37:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2418::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a42208b-68ef-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 02:37:28 +0200 (CEST)
Received: from CH0PR03CA0435.namprd03.prod.outlook.com (2603:10b6:610:10e::9)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 00:37:21 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::5f) by CH0PR03CA0435.outlook.office365.com
 (2603:10b6:610:10e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 00:37:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:37:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:37:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:36:59 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:36:58 -0500
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
X-Inumbo-ID: 8a42208b-68ef-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSv3i/kQfNcCVGuzEw5nv7esXvh2PtqwWwQ5/4eKR/ok9Simbe6PMw4A1g5xKVtx/siG9l6PU/aGVCvAuPv5bCvEwyE5qPS66SfYR5avFmKelfyXq6fmMvs8/wG4SVzFJ7kIl80TAf2tqZBBwsa26a83i0qMI9Y20kj/hV5vybc9vcnWsHjJ7CiqO8vWmvP555eNTAWncfuALMwqkk9Nbd9nHIqbgJzkYQrx5hJhi2TIbbkFFFLqTk85itClJqp1q/A4Ir6OYl1bvUkjyFWHAdR5m9vXwschAx0nJmvucfoIlDcbhaGGNuiwKgksoH4uP0qdXMoHky2R1IZI6AOnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwrpvUcyvjRmqtvupTb6RNKWd9VNnv3M3ywwXJRGRnI=;
 b=N1iudjUhYevZBtRmQWVE2VF7YGVXnrUVLXLPwzlo5qG9IPh4kZFfoHDBu/VT+h6dw0DSTRr9MURBIKGuMFq0PVMumy2Pw214aVYo5mQdjFQjyA9na2f04I8JG8jyHe8lMIpZ/fPh0axUyl9WfZ+FfivU7MC+sKGnytlf9cscLEFIDfAs4evGyQPWiEy2OkyhmbfQqM/+uGqA6qsuSjR3Byezdu8UfK+refQr2uEhUVFUThmLd7zPUa2Hq/cDh2IaqdDrFa4Nby2r/P0xOBn8qPVDmzTJhuUMZGauFEIi2HbgdUfBNdWdDLoTyU1Pbc6fmEwQ86WuU+4w8XBasartoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwrpvUcyvjRmqtvupTb6RNKWd9VNnv3M3ywwXJRGRnI=;
 b=e7PBLZ9ildiAcS5pw0/TlIRcRvQgxNnY+gdPzs1xqWtNaUgiz1bRsWSn7f/W+DTyCPBqj8K74qqVUcDXF4JGh2bNgcBchjb3FbEEULdhLydAEONKBHwOw1gqVsIThEpwKR98q2NlIu4PrF0tbeTr/g8Mp+ADn2hmatOjClrP5I8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6f6b6916-615a-4130-bb2a-8dd6f97a751b@amd.com>
Date: Thu, 24 Jul 2025 18:54:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] tools/xl: add available Xenstore features to xl info
 output
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: d7cae50e-1c34-44e0-bcbd-08ddcb136a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzdBMnFlbzZ3VUtiMDh0YmZacG5aL0JFOCs5K0FyWlJ0d3NBVCtndmg5VjJn?=
 =?utf-8?B?Y210eXlkeks4eGRzd04vbUpZeER0K0lOU2doR2VOeUxyZ3FNcVo3QmFoY3hT?=
 =?utf-8?B?dWh4bVllMGlvQ0pLTjZuYlFTUW5iNGkyczFaamNBQ2M1dE1SSCtzNXE2N05F?=
 =?utf-8?B?ZnFxNU50bmVTY3h3dnZBbCs3SFJDOUpkcEdZK2dEbGNkR25NdUpyVXVsbXZS?=
 =?utf-8?B?d21jbUFiMzVRYkkyMllrRDFBRy8yeU1nVEYzY25SSmlVUlgxSjZvcXMrUkRT?=
 =?utf-8?B?YU9PbFBQQ1NqZTJzbFN4bXlkaElhbUhkV0Q4ajBNeHRESWN4Qjd3WENxVmlQ?=
 =?utf-8?B?cWJsZ0N0MWVmQXVzZjJTQkJlWlJMdHh5QVpPUVRYQXVZR2NOaE9jQ2FYVVYz?=
 =?utf-8?B?RXJLYVdhUVFvUmErcFFhVFk4bS8zVlhMZGJJOFE3ZlVUbTFFbGxtekVQMTVR?=
 =?utf-8?B?OEtEWGd2YTh4dFVmaHNoTVJoMENmdEZBZDZ6Ui9IUmhvaE9xckhLV0g2ZktW?=
 =?utf-8?B?enFaNjlVNVY4RnVmdnVBMzI0ZlpNNGY4eVNqSUJXdWtvZ0lHd0JaRU1aYVgr?=
 =?utf-8?B?Mk40OTNydG9pa09Lc2xDWk5rT2x5YmpWaERrcDBNUUhzcm9sV1JJcGwwRUpz?=
 =?utf-8?B?ODBObDVSN0JFcmRXeVovU29VSXcyaWJsQzVqejlYR285NlN5TWtTUXo5Qkl2?=
 =?utf-8?B?d3ZRL0k3Mlk5Wnh1VEs2WEs4S1M3bUova1JpZEsxMjI3WU1UZWRJTkZQQlNs?=
 =?utf-8?B?YSs1TEhmNnBDaTU4Ym85NGpoZnMrOW5qWGZlVW4wUG03ZVNLOGl1eGgxZjBP?=
 =?utf-8?B?c203S21jZkRCeXluR2NRMWxxRGphd0NsZ3o4dDk3VC9jTlQrMXdDWEhQZUxn?=
 =?utf-8?B?eHRPcHJTSGYzM0Rla3dmNjlTRXFFM3lLSjBUeHZ5SzM1QVlObHVTT1ZFRkV0?=
 =?utf-8?B?KzBWQ2htZncwOGN1Z09jdTBkQmE5aXFKTFArS0x2WWVlSkVOTWY0ZGMveGQy?=
 =?utf-8?B?Ky91bUd2R1lsSlA5b3ByTDdPVWZXaHhEaEducTdjUnJBajA1d3NEUjNVLzNI?=
 =?utf-8?B?SGtvRDBzZWhDbGQwREIxZkRydW1EWk9LWGk0eFI1d1NNNUlOTUZBYnFPa3l1?=
 =?utf-8?B?UFY1VVB5NkVaQ1c4WFpCZmJsL2N0ZGdMb1ZsQnlpZUMxVDdnYTJtTEZObUtT?=
 =?utf-8?B?c0JnVGorSmpjZmhORTRTOTNzVDZmdjBmM3JlZ0NGcGhvV3QrTElmS2JGdzdT?=
 =?utf-8?B?eU5NTlRQdS9VR3RSdlFqTm81WW42d3RCM0R3UTRQV0tuWHJCSjZvZFRkakFz?=
 =?utf-8?B?SGRvVkJSS1dvRFZCRXdRRjJLMTluQkF6K2lNZmhKMVRGQkkwalplMlQ5dTI4?=
 =?utf-8?B?V005cmVNMjRoSy9GWUx4VHR1SXQvVlNVVTViWW9DZzd5ZkRyQkd4dnNPWEht?=
 =?utf-8?B?Um9jU053MmorejhOMFp0UkE4QmFQZTJ3cTNnaDJZbTVkSjFsYTVxT2Y4Y1Ex?=
 =?utf-8?B?UzFWS1JnenNpNGVQeEZMLzV5ZXNKS1l6cjFDQi9Bck9pZ3l3dloxVWRPNTNI?=
 =?utf-8?B?ZVNlVjBuNEtxTTQrR3BhRkhYMWRpK2s1U3ZwOXRqb0NWaEpGUFZsSzBJeDRZ?=
 =?utf-8?B?enMzOUtwNzQzSGU1ODFaalJvT0k5ZVkzT0ZPWlVFdU1FL1FJSm56MU1ldWxN?=
 =?utf-8?B?eUl1S0hCL2dtZzh6S3l3N1NHWHhjamtHRkt4SGJYb3BJa3JXaklWekF4a1VH?=
 =?utf-8?B?MnJLNjFKZTlqWGRXZHBIR3o2N0F2aHM5K2Z3YWlZcUtGSmJHdHpFYzFDUGhQ?=
 =?utf-8?B?ZnNKYXdMaDdiUlZaMjd5dzZscDF5Rnh3ajN4SGY0RjNCMDFYa1dPaW1BUVcx?=
 =?utf-8?B?UTNrY3gvd2VqK0o0ekZOaElFN1pUTzY3RHhiWTdxUG92MmljK0dLSXdlUUx3?=
 =?utf-8?B?c2FOVDNBeGpkQXZObmVZaThhOG5wY2hGVTRPR1dhT1RiQko4T3MxOXIvc3Jt?=
 =?utf-8?B?bGNabWRVd0JGVFFRS1dYM0ZVK0ZFaklPbjBhWlJydHNOWFo3R2I0d0ExNlJW?=
 =?utf-8?Q?m2VIyu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:37:20.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cae50e-1c34-44e0-bcbd-08ddcb136a54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084

On 2025-07-22 10:06, Juergen Gross wrote:
> Add the Xenstore feature value to the output of "xl info" in order to
> prepare for a future capability to limit Xenstore features visible by
> a guest.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

