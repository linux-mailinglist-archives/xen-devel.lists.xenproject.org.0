Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9ECBAAC25
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 01:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133389.1471511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3NPX-0006G9-NF; Mon, 29 Sep 2025 23:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133389.1471511; Mon, 29 Sep 2025 23:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3NPX-0006Dj-Ju; Mon, 29 Sep 2025 23:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1133389;
 Mon, 29 Sep 2025 23:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yW6c=4I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v3NPW-0006CC-Re
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 23:36:03 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ddcd957-9d8d-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 01:35:59 +0200 (CEST)
Received: from BY5PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:180::34)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:35:56 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::9a) by BY5PR13CA0021.outlook.office365.com
 (2603:10b6:a03:180::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.13 via Frontend Transport; Mon,
 29 Sep 2025 23:35:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 23:35:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Sep
 2025 16:35:54 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Sep
 2025 18:35:53 -0500
Received: from [172.18.5.186] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 16:35:53 -0700
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
X-Inumbo-ID: 0ddcd957-9d8d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quGm0Up4sswlM/KECgcKMfgcxyHJyaShtbBEXM0PP3BFsWvPyDxIYuZCMtw8VDgJOeao6SHneaJmBi2o75lLhmPX/9FOA5tHR86FWeuwWf7ntIK93m3t2SaTbZcf5YLyWDxWa/+hAb2g7kqZ5ZR5DIGxehzxCa8nyAPuhmJFIRlUlAHwygu3ByuvEa3O60locukcghcxO54xbpzUMxHR0iPwnJoyurWCmqpV0ao9Qh9m63he15iw/rotM+xLrDMuqSlrV8aBqJSp+Lf6hpWKyMgnr3P+iaZqeI7NU/aajkMFuFF6S85b6RcHbXYswIs8jDgvWffw7SkdfgPw8PFMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkoHx2+S4uq+k0vWI6JD8rvHdJk0kuS9TDnXqa8RXu8=;
 b=KuXAutHiCzeOqa0KcDeyN7wVBGhc4E8E4ubJeVh6segvYD1K3cf490KvDeOkUZ493LHuOJwqVarH5yEfOUPounjoos9gPKus85h6jM0sMWO72bJA+I+s6E6wJ+fieGIaiB+onl2afwHcFFpFxFD16zxiWGUl7lrBRG7ijSmgy1eBv+5ON7zD+YzI9fmr8KxBwkqXqWBN4ugj0BAn1f2cp/biFitKAOP+l6UZWUUYmcuz0Vl7nPxupKr58H+w8/6+9zHYGnULTxbSmiS4AE+krqDJMbqkqeZvZe9FWhM/T6FZu5McK6L122bHA4gAnE09o7wPMdGDyX20K/4aGPodkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkoHx2+S4uq+k0vWI6JD8rvHdJk0kuS9TDnXqa8RXu8=;
 b=JcLPFLSb4KO1rxwuqM60ucGtKlr1f9vj/YC7knErXSm/Th8XOckPwNetLg3wmOyGGw+Uy29Wn4sM37+PTrs/H3F3hL1fH8cUZetw5QBflpTQqzb5EwFN63pQXyXAhu62Ny9siaUMqpLfm8bXr5FRs/zXP+jqrnzmEhH+Srurb6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f42bb989-c9e5-43d5-82e2-9b6f95c008fa@amd.com>
Date: Mon, 29 Sep 2025 19:35:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b228253-cd85-423c-cfea-08ddffb0efa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTFuZ0ptT0REOVNCZ3N1MW1mMEdjdVNVeE9rejlIMXRvYjUxT00zN3QwelJF?=
 =?utf-8?B?U1d6MW9MY3JuSENTTGxHYTVZbXY0ZGg3OGtRaHloNXZtVGlxT0JDNXNMM3RT?=
 =?utf-8?B?bjQ2aEJnYmw1Y2J0VXc5V0dUdHVadzFYc1RhS1JxNmJ1V0dXWGp6alBlbVps?=
 =?utf-8?B?MTl3T3RHbEppSWk2NFM2dzdNRlhCbk1WRnJjMHJZTFk4SWNER2QrR0NKeEQw?=
 =?utf-8?B?K25IaDdYYVM2YzNENWxVaHZHU1lGdjgycjliajNSZVQ0YXdCY2d3ZThlNDAz?=
 =?utf-8?B?eHFvYUtQejQva0xaa3duczA2ZDNNYlROTUFXK011WVljN0hQdEkzZkJ4K1FD?=
 =?utf-8?B?RDdOeUEydm9GMklMUldKZi9KWHVZdmd4RzlPV21DWnlwYXB2dHRMbTE0LzJL?=
 =?utf-8?B?OTBXL3hwcndpdzR3WDREbW4rbUxuZlNoY0xjeXU4d1dFRG1hK3ZtRU9lZnMw?=
 =?utf-8?B?WjN0Z3h2ek5LdVkxcVFUNzJxbDJFUi9ST0F1NVhUYlBBbnNaeVR3VmJsSkhE?=
 =?utf-8?B?NzNUNnJnT0xvZVJiYThnSzh4aGpCSGZrS0J0amgxQjBwc2ZkWGJCTng4WmhM?=
 =?utf-8?B?ODB3MFJOSjRINGpNV2l6K1BUOXhuZlZzUUUrODBvdHVoVGV4b3I2Vm1peXMy?=
 =?utf-8?B?NGhtYmhGNnFUbHVyQWNWMzI3N01scitlNkVaV3RpcXI3K05YTU1qVkVqczBK?=
 =?utf-8?B?QmJmM2N6ZjhMYVMwL2JhSkt6Uk9mUG9aQ25CLzFtYU1tRlZRYnpkRTl4akMr?=
 =?utf-8?B?MCtxVVVRbFhlWE5Rc1l0WnZxcnFmbG4raHAwWHNidlhhTE10QnFwa2FGMzlP?=
 =?utf-8?B?VTNWclBRWHVKSmlDOXRyUXJTdzg1N3pjREN3UnFGNmQ4UWUxWFBobkJUeCtm?=
 =?utf-8?B?MTBhUVlnd1crYzZ4OE5rL3hESk1xenlBWDI5alJlS2tlVURvNzBrMEVZY0tZ?=
 =?utf-8?B?VFZhaTFCTXJHcHFQVlFISFJPOFhxNjFyeVo1enB5UnVlTklvR2ZZODJvbjRP?=
 =?utf-8?B?dDFDbnpqZWpzYXNESDRTdEo5QWJ6UzVzWVNjTDFQVU8vcmxVaCtnRFZFd1pM?=
 =?utf-8?B?K3NHWmFZMDJFYlNxQXNDVzlyOXVQWXJscmhqQWhyd3lmZUU3WUNzNWRlVit0?=
 =?utf-8?B?UGlhY2l3bDgrb2dlb2FZaHRxaTB2SlpiSWJ4SEk4SmQ0MFN0ckNWMHlXVWZC?=
 =?utf-8?B?SlI4Zm0yQWQzZWxzUjZINm9yampJRVI0eHh6V0xEQkx1L2NxZHo5a1Ryb0Ir?=
 =?utf-8?B?MytoWVJjNEFYM3hjV1JodXlQbk52NUJGVysxSmt4eXNzN2xkR0l0Ty9FdUZM?=
 =?utf-8?B?b1YweFJ2VTNtSkhublN3enA4NCt2cjFNQjBzenNOUGVOMXhTV01EMkszNWE1?=
 =?utf-8?B?UDY4RkJ1ME1MZVdYL0lvYjNLdFlZTTNkRHh5Slovd1h1VGx3Q2JqdmcvNFAv?=
 =?utf-8?B?eHAvb1RDZXZKWDZZTjNUS3l5c09mR3ByRWo1Y1BJcktFZmlkWW83YXJnMWRQ?=
 =?utf-8?B?OGpvN2l0cHhpdFhTSGZPbSt3S2x6QnI4Qk5DNWZJLys1bnRUbjllL3NncFNx?=
 =?utf-8?B?c2pKR2szczV5M0lPNE9CNSt6ME9zNzN6bXdzNjFiUnF4akR3K2x1enVXRnVH?=
 =?utf-8?B?cUFBa3RCUGtNTkgyVUhUMFlRZmJRYTd1VFhWaXlkTDREYkZKR21qdTVLZHJE?=
 =?utf-8?B?YVAvemhvM1RFL1lxclcvc1BLZlJ2dkJRV3hhL0RpZjJuUUhldEkxc281bWFx?=
 =?utf-8?B?TXZDNnZ0Tzk2VlRmYlNvRjhTRkwwQ3ErcjN5QzBtRVhHTWZoZlRwVkZ3Ykxl?=
 =?utf-8?B?UXJpTktEbmNOVU1lYVNHWUxCdkRhb0Y3c0x0VzJISXlSTVJrR2dvN0tvYVF3?=
 =?utf-8?B?U09ud01sTXhxeThmVnI3Vk5OWEJLNVFPUGRNU3NHZHRwZTRROEk0WVJNb1N2?=
 =?utf-8?B?Z2ZTWFlxU25RODdTNlQ4RVg4ZzVZM3l6bWJMZVBmbTVwZ21XdFZnNFYyaWhH?=
 =?utf-8?B?Ulc2T2lpT1VqekpiVTcraVRYbmI3MkxZK0ZOV3d3c05jZk1PNzFESDh0bndm?=
 =?utf-8?B?cXlpOEhZYkUrV3UvLzhPd0tUYUErMnM2OSsrNTBNdjl1QmNDVFVyWTNuS2pN?=
 =?utf-8?Q?5b1Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:35:55.4951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b228253-cd85-423c-cfea-08ddffb0efa3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465

On 2025-09-25 08:18, Teddy Astie wrote:
> Le 25/09/2025 à 12:48, Jan Beulich a écrit :
>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>> can actually be carried out the accelerated way. Therefore we want to
>> avoid its use in the common case (memset(), copy_page_hot()).
> 
> s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)
> 
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With Teddy's suggested change:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

