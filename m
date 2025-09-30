Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E77EBADEE5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 17:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134350.1472277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cSU-0007LV-Im; Tue, 30 Sep 2025 15:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134350.1472277; Tue, 30 Sep 2025 15:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cSU-0007Hv-Fq; Tue, 30 Sep 2025 15:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1134350;
 Tue, 30 Sep 2025 15:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fONW=4J=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v3cSS-0006vF-E0
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 15:40:04 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba101e8a-9e13-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 17:40:02 +0200 (CEST)
Received: from BL1PR13CA0448.namprd13.prod.outlook.com (2603:10b6:208:2c3::33)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:39:58 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::d5) by BL1PR13CA0448.outlook.office365.com
 (2603:10b6:208:2c3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.10 via Frontend Transport; Tue,
 30 Sep 2025 15:39:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 15:39:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:39:57 -0700
Received: from [172.18.5.186] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 08:39:56 -0700
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
X-Inumbo-ID: ba101e8a-9e13-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPTJhLXcESIrOKdyr3LpwmhGAX3o8AnWvO6uJpTMjIGuPl0+onpvy0YdlVCd+IispaV2QRW073HV4eVWb7CN0I8P1CSq6CrftjfZgssUXgROyKK2ydtdNfJyjUof0wvcmztLc6Y+sEZ6AeNBiVkHrS1tAGfckZ9srTPijR68lOUjxmEAaWTMxHWGwF0WZK2prG4zwN0xMSOUZh54YMCSif/xOlUjG60apQDFHkjAHqAJQDAGQ5TRCoITNtdZdrlkpGDC6rMuAaX8UtXjVahM28O1vub+XjR+h/ifX6TfvGFsLpZ60+N1aQyFZIj27PnbowYQ/Yhvaw/URXOr0N4xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz9XH8Ox/al+ntoeOLZ0s/yoMY/BogCr6FnNBjGIFN0=;
 b=QoliXGaIY7DtB7dh0OyYR4eEMXYUsYFqok/f79Uf65NVxMhIhDdqBRDwPSSDJ+Bkotox83saB/M9p4Ib8EZl3EJRK/LfDTvIlFXCLcBCef1yXwb0E3J7iqOhnc42cR6/q1uiZ7fzOD52owQZxTHJgB1JvL2cuk2IXe7OKWk6pmvGNZ9NWlzb26iVCtjnwA5sMVLr9vCZEis+EoFNdoVOTr/z3YWP6Votj+P+SiHs/8c/k0zXGlt7ggkkNgADbzyZbLD0fag5IF1GmUtK9Qtaa1SO98so821HhIRPzjsZkifHYQvFkYV8P04dAe9Zont4l5QW6qoslV+ma3GlYAwn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz9XH8Ox/al+ntoeOLZ0s/yoMY/BogCr6FnNBjGIFN0=;
 b=5HIVZls5YXleBCUBsAxBtx2JwwEjT1KgfdEGXsakwb0W6hRKbfBzD6WXkYxXGPeUd4lfBidWZHpXrAcADCK5LD6gI4YcoRog/l9Qmd2X97GFvDKXp9Zn3QAkpqDExk3WuuGXsO1I3WF58y04XfiCVT7NFMdhjSlQFZWCThbuXco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5df3df3e-d3a6-4b84-a724-0edb1ce6324d@amd.com>
Date: Tue, 30 Sep 2025 11:39:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 7/8] configure: Use json-c by default, fallback to
 yajl
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-8-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250929120756.46075-8-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: ca193ce6-21ab-4534-db1a-08de00379c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1pXK2lKSWxjdVpNYXV3Y0thd1BjelJ3U3RNM2laQTR1Z3kwTCtiTit6K0hn?=
 =?utf-8?B?dytEeVBiaXlrTENHSyt0NWtTNnRuMjJGdE5yL2swRkNqU1J0OEFJYllDSTZy?=
 =?utf-8?B?M2xVYUEzanhQL3NUYTFaMS94Y1MyZUxDV1QyY2FpOG1HenZJL1JleVkwMmZ1?=
 =?utf-8?B?VVdqZHUyaGNFL2NwdWJrSW1HVXhzQTU1Yk43T3c2cFp6NXRmd0ZWUXJkbDl2?=
 =?utf-8?B?U3JVamNjQXdPR2hJM1hrc3ArSkxOR0plM2N3ZmJXR2sySU9VSENqY1VvbXA1?=
 =?utf-8?B?dWtqWTIwN3Z4RU82RXlwU0hJam1tVjdXNTRsSWJ0ZXZjUnNwK09rNU9pUmxo?=
 =?utf-8?B?VTVuMFZHYTY3aXJkdjBNK1pQQ1RRdmxtKzAwZDgzenlrbWJOTlVFajlHOVRQ?=
 =?utf-8?B?NTg1VWQwVmk1QzA2cHk5QVpVWmFEZys2NUtMS0FiYUtLY1RRMEorTVRhMUlC?=
 =?utf-8?B?bFlZbDFqeEFTRm5QWjZtbmZBUy9XSHo3bXdTZkE1eFFxajRmWXI4QS9rMzdE?=
 =?utf-8?B?Tm5nQmkxSGx4S0VRTFM0cno1cDdUS1Q4V0RFUWZVZ3g0ckw5YjZrQmhSRm1T?=
 =?utf-8?B?SXliY1dGUEVOWDFGNHNzN04rNkFpSzhyNXlWNTkveUtQeFFxY1NhNmNmMGF5?=
 =?utf-8?B?ekJiUzAxcGJHcjQxYVJTRDg1Q3FwUjNjSGhDKzNyV2g1NU1YcVBQRjJ6NDZ4?=
 =?utf-8?B?RVZWQ2wwaXJic3NIY2VoU0VhOVplekx2SlZVU05nSCs1U05sMy9SUkdSZW5I?=
 =?utf-8?B?VWxLdXUxTCs1MFhWQis3VTdJQ1NxOENMWVJBNmZEZXZiUXNJbUh3NUlxRC80?=
 =?utf-8?B?RXNJUTJoVitzSFMydnZtTEhmTWdXcXlRNXdETHFCaTc1TGZXbmYwVHB3VUYw?=
 =?utf-8?B?NjdqcWd5NFRDWGgrcE5hZFlrbkkwVGZUTlJGaHJtOE9OaWhaY3pGK2xOMXBR?=
 =?utf-8?B?aVcrYVdsTHlpUkp0TDVFWS9iMlVCMG05S1c5K3JRV0RrRTZIeHduVFE3dEYy?=
 =?utf-8?B?dEkzUk96Z3RXQkZzaC9UUHJQUC93ejNsZzNCSnZKSHdncERkUDdDTitwZnY0?=
 =?utf-8?B?UFAvWHNseUlLMTVUTW8xUU5GRlhOc1JKN0tEZ3NGMlUxUm1NcG1LeWNITWxk?=
 =?utf-8?B?bUlXSFY2MHRXeFhFeStWRmlQTGZnUTZXU0tsVlJTSDNHaitwS29xSHZwZ085?=
 =?utf-8?B?MTdWV3IzcHNQdStqOFBBRE5lbUdBMmhneSt5bGR1NklJcXpHZytib0NERFdS?=
 =?utf-8?B?MWlrcEZlNTA1WkU0bWttOXR5STVsem9DZFh6SlFtaUh0WTlsQjU1RWZLL0ll?=
 =?utf-8?B?bHNLRERXM2hydVdpckNxSE1ERmJqL3hmOFNweVNJektjVlZyM2QxQmhlbC83?=
 =?utf-8?B?U3R5S3FyR0RpeHF0RjM1MDlraDRwdjdkK0poL2g0bVR6VnRMN0tyVVlHMDRO?=
 =?utf-8?B?MzhJbTZqZVl3NzNOYXFod29JT1Q4WEVMUjYvZms0c2Nra2EyMVNONXFrdkEr?=
 =?utf-8?B?NndCQ1VpTGpvekwyeHcxOEhLTkt5cFZHaC9VdElraG5DdjJTVXc2SmsrZ1RR?=
 =?utf-8?B?Y0dwMXJBdGgvLzhOenFNZGZGWVFNVlRMaGtmUDM4Vk1iak5oUXNSOWhGVXh3?=
 =?utf-8?B?cUQ2TmUzK2xpT3VuSUxDY1k4SU0zNkMrS0NBaG9MYkJkcHJVak93VndFczZJ?=
 =?utf-8?B?OG9zZDRVVkZlU29EdHZESXhxeHovdDhmM1dpMUdjK1dzLzArZkZBRHljZEk3?=
 =?utf-8?B?cVNBb1lxTzlwMWRpWjhvVWZaMG54NkMvV2ZLaW5PaW5QMFAwbm1NSmRYT3lh?=
 =?utf-8?B?ODFoQzJvMFpkQTBTZGZmQ2FyRE43dEJMQTZ3SGxLRS9iVUhSNCsxeU1Hek9R?=
 =?utf-8?B?ZXlwZ0VmL2RlKzhCdnhpWkJuT2pyQXhJRUVkK3Zaa2FxdG4rZnFneWswQ1lR?=
 =?utf-8?B?ZWxqYzRPUUphODZCY2tsZ3ljTXlsWVVFd2toU3NnQituQnhTaUY0QUZuUk9n?=
 =?utf-8?B?bkNnZGVMWGZ5SytaQ0JZdVJxalJBU1R0Ylk3SVJtUlpuTFowVm5ZTmd0bkZm?=
 =?utf-8?B?TS9QSzBiY0xDVVpnSVhwOFk3Q0ZjbENaeVUzakhqdjRFdWNCekJHNG9vb2wy?=
 =?utf-8?Q?gAX8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:39:57.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca193ce6-21ab-4534-db1a-08de00379c4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961

On 2025-09-29 08:07, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

