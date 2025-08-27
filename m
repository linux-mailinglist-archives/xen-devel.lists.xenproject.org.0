Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA5DB3858D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096269.1451023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHZk-0006yu-GR; Wed, 27 Aug 2025 14:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096269.1451023; Wed, 27 Aug 2025 14:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHZk-0006wZ-Dp; Wed, 27 Aug 2025 14:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1096269;
 Wed, 27 Aug 2025 14:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urHZj-000691-QC
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:56:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2414::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 053bf6a2-8356-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 16:56:33 +0200 (CEST)
Received: from MW4PR03CA0165.namprd03.prod.outlook.com (2603:10b6:303:8d::20)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Wed, 27 Aug
 2025 14:56:24 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::41) by MW4PR03CA0165.outlook.office365.com
 (2603:10b6:303:8d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Wed,
 27 Aug 2025 14:56:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 14:56:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 09:56:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 07:56:22 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 09:56:22 -0500
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
X-Inumbo-ID: 053bf6a2-8356-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRw9DoQvv/hmSZ/o+FfbC2twQhbjs3WAFpxzGwCl9gRc8ohl84psOzSLc8h8pOkaao1UvqEc+NRhoTUg6RSbgOzHZJvrshubfylJNyGBupgNjaoVwx1WySncp52oP/7WU6ZCR8QglvsG+5Y9gS3cJPDMKLW7igayeYQ552hzeTxjZCEMbyONMHsBwRSG2lDLOSMOSsDqYiTqDmqRHoV0kc2k8k8e3vaaGAqMOqOPI8CsG03opW7lKEWRtCIZmfBUXMigC0vD3/13cKL4Y4jG6ML1P4fHd6g2OAnZ+3kdLC+A9rI5Ajb5kAMN61odAJ8m8noDjgxtEHP6uCwp71vaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cho+oUs+S7C8wL8gf68F+liw/ZLX80fv7zLO82Tdep4=;
 b=W+zh0t2HL0hy7Uex+YVbvMxP1WCfAQg6F5NnEsFrmmah4gBLfqVgt1S7kUV7wh586/jD+cQ4KysksQ7nQeKkh+5yExYVOho1Z7TMTWG/eZ/sVplqJXeP6CGRAZMMzRtCj/exbpOp/Iy4iFNhSWVibZfuxNhyEr5nBLb763BPJTScgUd7ZjlZPb9FaYPZaEVyg1UPPf6iWCOyLqQ+7KjLmF6bUXP4QsIsXg4BxtgEqOiaw592xrYEhWvqlPQoWgnHj9EZvZjNbCl+zzWw3iLU+fb1S4YFHaZv5uYJo2tU61KUF4V10vBgWK25RSdRT4XZS8x/xGuYEufwKGIeMf+ldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cho+oUs+S7C8wL8gf68F+liw/ZLX80fv7zLO82Tdep4=;
 b=qqY0d1dwNmMjhO29QA5kixZzt2MRluMTW83QNKahJu7immIr8bDDsBaFA4QRsCFPcBdLE6fsTfV8igVP0oUe163E6RWuoMIc/RCgEPE6iPRj9PP2F4nnZHHPSaRrCpx/dgO28b4g6r502PckiZz+PcEIq4XXuyDNi3vKe4L/Isc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e781aa45-3ad7-4904-b68f-457f6f46476f@amd.com>
Date: Wed, 27 Aug 2025 10:56:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 03/11] libxl: remove duplicated
 libxl__yajl_gen_asciiz() prototype
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-4-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-4-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: fb42233c-0889-4ecb-1f84-08dde579e3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0x2cVdHcmVrcTMvN3YybDFPUzFtdWp4bVVnYU8zRjFaWlMzWnJEWWxJUkJO?=
 =?utf-8?B?ejRJU2x5aW5zMFVMUnNDUlhIY1ErQUNXWDhBeC84aEE3WmttZ0YrM1RqZm54?=
 =?utf-8?B?MDRqRTlYYUNZb3RuSGVNTGNDNDhab1B0YjRtdktXdzhWcXMxU2NMS2V0c1BO?=
 =?utf-8?B?UTVaTXloQWZsWFNoQWxOZHFNMXNOM1dXTERGMnFoOXY2WDZiVnR5STVnUXk4?=
 =?utf-8?B?cW1nSGZpU012SHhMNE1KWlBwMDROT3JhUmxRbElpNDRSYmFpOXlkRmJsOGV4?=
 =?utf-8?B?QlBVU2NUWE9OYnRCMDg5OXRSMURreVI2cjE4dG1uR0dCazNiOU5DMmVXcVBo?=
 =?utf-8?B?TlhVL0NqbStCMG8rYzN2aExOT3JON3ZwZnJLQlp6RUltaHB5bnFJbGRMVjdp?=
 =?utf-8?B?NW9xakxTN21CQjJKeWtYaHc0UkhBR3NMOWlpdUw1QUVvUzI3VE0ycFFDMUNY?=
 =?utf-8?B?RXBrZWU0bjBNR1Z4VlJnckJGeVpreXVzSUt5c2NZTndpQklqN0JQK1NwZ3Jj?=
 =?utf-8?B?cUZmZmViTzRsZUtrZkFjRVgrRHJLRjZtNjd6eG5GM3MzQ2dGOWRLSUFmaUxR?=
 =?utf-8?B?VTR3NWlQSGFuZVU2UDc0N256S3Z1Q1RjSlV1dHdUaUxZdU5VSnlnMnNiMUhG?=
 =?utf-8?B?aWY0dTNSRFgvMlg1eWp1c21kcUhDcFdybktPbk9DK25ocXNlS3VYY25lblVo?=
 =?utf-8?B?VVQyTWYwMnFmcGViS2tKTnYxdVgyMnA4STU0TUUzRmJrb0N2blN1MjZud0E2?=
 =?utf-8?B?SnpHRjBYVjNZeTNKeStXUmdoR0NEeUE0WldFVyswc2RzS0N2b0QrQjhKNE9P?=
 =?utf-8?B?VTZUc0JIUE0yeTk3R1Frdk1hT0tDTmQ5NUFCTG9hcnB3QjFTZC9MOUNVVWN5?=
 =?utf-8?B?NzcxUFlaSEhMK1g1d0Nlcm5oQ1pzaTd2aTJuMlAxY1NMdTRWS2I2VUljd2lK?=
 =?utf-8?B?NWZscHErRjM1SktGbDdON2ZNQi8yRW9QdCt1cjBmcGh5SzkwMmNBRHdFdDJG?=
 =?utf-8?B?ZW9FSUlrMFFBVERUWlk1emlNR3lPcFIrL3o1VG5YMWNvd1dIeG1leFNHZ3M3?=
 =?utf-8?B?UXpMS09mNmRpUE1pZy8rNytKZGNZOVc1V28vbkNuNm5VL0M3d1pxWHg4VFFU?=
 =?utf-8?B?d0twRFk4cnMyQVJDdjkvT0ltOThqbklwM1hMc0pDYXZTaHFlTTBiQ1ZIL2ZC?=
 =?utf-8?B?NFBWK1hPYW10MktHVWlPWkxZSU9ZZGRBZTVUS0cyZjRZMHJacVFOTHRKVk1Z?=
 =?utf-8?B?SUlGcUswOVJIenVUSGxZZkY0MGgxcnpvanE3Tm5pemNhZEdoQ1UwV0pxWGZM?=
 =?utf-8?B?UHpwbGRMQXRuUU1HTUlVbkdqaSt1ZWRXdFB0QU9TWU5KQkc4U0NtOVk3NW5a?=
 =?utf-8?B?N2t6MlhwZWhEWjVsMWc3VDVmQmROdGNLa1RKVDNaUHJyOC82RFh3M1gwS25C?=
 =?utf-8?B?cFJxaDJLMzlKQjNlTnBjc2YzaWF3VW9mcWgyR2I3WGNnenZGdTRreDlJZFpB?=
 =?utf-8?B?Vyt1ZCtXMGlYTXYyd1lqRUpCb3VUWGIrWjMwZWdiSmNmT29xTzRLaWVCcldy?=
 =?utf-8?B?MTViTlc1ZDVLeXJrSHY2V2IxMVowMitjMDNPT1V4M3g3MlJlNnBpUWJVb3pz?=
 =?utf-8?B?UjFVc1UrMUVNcUxXUEFjckRYYUVQd204c0IzbzE1R1lkNkt4VzFsbXdoNWNr?=
 =?utf-8?B?RzRDQW45ZDJNQlFxKzJ5Y1FaWnl3dU1EcThrQTdrV0ZuZjlwSDJMY1ZDdTZQ?=
 =?utf-8?B?MGhFNjJIV0dTM3ByRGhVTkpJWmd1a2Y4SG1paG5mVTlCOHFlQWEydGw1N29w?=
 =?utf-8?B?RXc4VU9TekVuWlg2THlqSjF6V0FVZk1xZnQ4bzdxMk1aUys5WVJyc0Nza25h?=
 =?utf-8?B?dUhDNlFuZmI5TDFhU2wxVkl2WGlqZmZUQjZqbjUvcVNCc0pVSGt5azkxUUtI?=
 =?utf-8?B?RjI5UGl3bm9mdHBQQ1pIcnNKZlFQOXhJZEhHUU50a0lXVkJhc0krZFZRZHN1?=
 =?utf-8?B?TzJVMlVYUVNEQlFENjlGSEo5Y0VFSnVxbEpJVTJRa24xNkpQWEdPY09yMWxx?=
 =?utf-8?Q?PXwbQc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:56:22.9676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb42233c-0889-4ecb-1f84-08dde579e3b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

