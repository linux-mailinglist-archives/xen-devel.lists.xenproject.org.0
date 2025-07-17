Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DFB095A5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047455.1417959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV8y-0007OX-VX; Thu, 17 Jul 2025 20:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047455.1417959; Thu, 17 Jul 2025 20:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV8y-0007LY-Rp; Thu, 17 Jul 2025 20:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1047455;
 Thu, 17 Jul 2025 20:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucV8x-0007LQ-3X
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:23:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f14a7e88-634b-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 22:23:47 +0200 (CEST)
Received: from BY3PR10CA0025.namprd10.prod.outlook.com (2603:10b6:a03:255::30)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 20:23:42 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::1e) by BY3PR10CA0025.outlook.office365.com
 (2603:10b6:a03:255::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 20:23:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 20:23:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:23:41 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 15:23:40 -0500
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
X-Inumbo-ID: f14a7e88-634b-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQJICbt4JP+YHOwFR5wVUI8KParDq8NqaKqNFki2eemMsukmmeZSoSdY2dGJ18advpmYJiZiyI8lDt98GjXHcXCWlCorVQsbQDWYzcD3yPqNL9zxlud7U964RywxayQ82S0lRbEV4ystj7rqbi8XaUWNX7NXYkJJvrAIR/Irf0lh2lGC4fWgyFugyGT5U+BF1OeDFWn5spcMeTApvrRwnrlU0M6Axpall4P2lJ7bsudhMjIxQ8cDc/GorPlfySUU9OvJ0eK5z1/5bDKbb8NAhE+VKVVkjysAx/BiGC1iBA/2GaT8tC3rTFcMcx/VWavUIr9Rc2agWzMHvATp1PZM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noUPZK2FIbMbwliafFif4zyI9P97qb6ifpiVLNe1ygI=;
 b=J3EDo+96P1Qu6FmnhCZx+SG8n8NX1zRSFt8NQDiKRt4FpwJmWK6gR+poOMRsxOIYr+m9jLYQAOvn0ucl9Vwq7GNvaksnS/P9TO7eAsCFehP5qfvCtJnn7w5p/6H+sf1wAqqDtsatnEGyw5pZPGHbpXbXdRnYaxvMkx3/kWPKFoW/RXQVbq95qdMDcJqjL8s6oUWunlqRfD1s31pQ55ji/PzmddjspGtUQqqmTJlBZUc17U12n5WJHBIOK35k9pbOgg2i6dVNNadITbt+K2OaN6P/9c0SN7+IERIAfOJo/us6yAzLa7xxAn/7sHwsg3wl4+jlQMmInOm6ny8THHc4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noUPZK2FIbMbwliafFif4zyI9P97qb6ifpiVLNe1ygI=;
 b=ISxA6ehcLiJq3ZSnmbK4+in4rXKqJfe+eUObJs4mkkusTeKJVKas53U41LOWHJBay3lUJH/gH0vrFYcU9JEE61S9HOjI8KSChL8ytQ0RIm/X3pzuvc46aqibYVr8k0tmJTnVODh0JwyZrQr2fLbp7Wh/ToeBPo+hYMhg5TcBVps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <319ce63b-fd4b-47ba-b970-9d2d2939da81@amd.com>
Date: Thu, 17 Jul 2025 16:23:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] tools/manage: Expose domain capabilities
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-13-jason.andryuk@amd.com>
 <47a5f34c-7d69-4094-8c60-df1a007713e1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <47a5f34c-7d69-4094-8c60-df1a007713e1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 1473f01d-bb15-4dc1-5e49-08ddc56fd29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzVTWi9mQndzUXl4NktFSmVFNklxTGwzcUtYWSs2TzkyYWxyYXpHQmNwNGJt?=
 =?utf-8?B?R2t5YTlPeWdnU21xYmN6V0MvWExCM0NDeFYrUlVPV0t4R0JEbEFIc2FaK2Np?=
 =?utf-8?B?c2ZPK0xsamkwRDMwdDY0bnFSN3o3M0toWXFSWHpMMFQ5MTFVR0FoaGpZaUtR?=
 =?utf-8?B?dHQ0R01USlNvNUFuUXNyZjMvMjM5OGJuYy9SUnRSZzAvWTQxVCtmeU5BbDAy?=
 =?utf-8?B?UmUxSHJwbHNML3NTeHlOZ0IyNURDcHMyWWxyME9jVnpxQUF2YVdZdVF5b3o5?=
 =?utf-8?B?KzMxQVpiQkRDMEdIaTNzVjFSVlpvM2Z3K0VyYmRCYWtZL1FXRHVGU1BaRlF6?=
 =?utf-8?B?bTdhWFc0Qkl3a0hYNW4yZFhzZUFZZzd1SW9NMEhRWndNdUVWeFI1Tlc0UVd4?=
 =?utf-8?B?RGl2M0cvZ0FyODF1RU9IU055VU9INXR6UHVOVEJDNDRxZCt6V0hHbGhQTEFi?=
 =?utf-8?B?TFIzdm15OEgwdm5wb0FnS1lBeHd1MldFbjBWTHFwR2oyUXRUVXNBRUliZFIz?=
 =?utf-8?B?bXFQcmJ1a2xmdk9Selg2c3JONWs2VXhtaEFZNUpuM3R5Rmc4eGVpWldoNzJi?=
 =?utf-8?B?WWhBL1ZQU01LUk1Pc3NsaXN2QkkrRTJuZHZXbm9wSkZGL2hwOFFEb0k1enJw?=
 =?utf-8?B?YWRWaDV5QWs3OXpBOWNTeEhsL0Ribm9kd3ZHR2JNSmZzdW1yYjEwTExiS0pY?=
 =?utf-8?B?cHBiQllYeTRGL1FLMUhjdUZ0RUxXVTM5SnRBb0hwMUFqS1NTSlRPcGVlbFhQ?=
 =?utf-8?B?SkxDdTd6cjZQR0RybG9ML3RQZS9TUktTUDBMNXdFNDVXN0U1MkY1cUlwMXVT?=
 =?utf-8?B?U1RXeVIrYlJvbVFmcTZ4SVJoQkkrOS9hSUlINzQzbGVUbmlVSU5CeEJMbk1t?=
 =?utf-8?B?WEdCQ2EvMzJtNFFJSWFxMFo4bFdDTGluUXd5bUR5c1RteWlwVmN0WkZMWFpX?=
 =?utf-8?B?ZnpIY0RVTTR5OUhJVHFzWEtsdGMvT1dGdHlhdS9tVGJxdnlDUnU2WWJLemJQ?=
 =?utf-8?B?eFNPcGtySmdoRFhmNXRLZ2VCZjF1enN1VDZHSDNOaXFrdVBPeUkyM0VnNVBm?=
 =?utf-8?B?Sm5uQXlkbU80aStYK043bXZWVmtQdlBnNURVcTJEcDh5b2tGanR1dVFsdTlY?=
 =?utf-8?B?NEVEV2JkbFdmeW5LSms0NjAxTk5YNWF5NzIxY3ErMmFob3c4ZmNkWm10STlj?=
 =?utf-8?B?b3p4eWwvVEJtbE1rQmtTUkFUenhsN213WjFQL3YvUG93WmJySGxrYStMVHBN?=
 =?utf-8?B?emZWenRUQnpVeUwrVUVYejRnWjZZL1RQcGtoOWR5Q2hCdHhXYkttOWx0TExQ?=
 =?utf-8?B?bk1rTEUyQUdCeURDN3ZJTzJRajJLWkUrdDdHdUMzc2xMcUFod0tGZ01Ody9F?=
 =?utf-8?B?OHpNMk54R2d6aGtnQkdFbXVVaUgxcHUyZmFKWW1FalpUc3hXc3pNNHdjZFlH?=
 =?utf-8?B?amFoOGZ3dVdmTmdUZVVjNTJVZEtEYmU1ZW5BUlNUUVYrek5ERGw0TjJDOUhT?=
 =?utf-8?B?VGdhT0VsZzV1UUtCVHQ5b2dEc0QyK2ZFY2hrWW9aeFl3SGtsM0xFZUlpZVY4?=
 =?utf-8?B?dGFLR3RDT2J2Qlc1RitxR1dYLzd4MGs4ZGY2UFlOKzZmakJCOXFBcTdadkhk?=
 =?utf-8?B?eFFmK1JUT0ZFdE96OFhwSlhXVW95K3Z4aGZIL3VwdXVWYnlGTm52dXBnRFhY?=
 =?utf-8?B?VVdHL1drZnpGcDV3VFZERElwMGd1RGJ2Qml1YlM2R0NWUGdzaGRFT21OeXp6?=
 =?utf-8?B?N01CdERnU3Bod1NtbEhDYlRMRW9qUElMU3o4SmJUeXJmZkg1V1lrSEJWaTVu?=
 =?utf-8?B?L1RxN3NmM1YrMnNSRGxZRno0bkErQzVCc3ZaUUhuYTJzZTRWRTJSTUVpLzlB?=
 =?utf-8?B?K3ExN1NPTEVOOUhwaTRadDRVa2VnS1g1T25IM3BudUdac3NqUHhSZy9kUkVo?=
 =?utf-8?B?dmVBWEgwNnFsWXZic0tHWmZpc1p0azRFTFJabUlWZUVnUlBsMzVsYXZIRFZR?=
 =?utf-8?B?UDU1QUNod25Yak9sWEdQSStYdG9sRHZNVEVQdlNuUlJqWkNtWVl6WnZGc0JR?=
 =?utf-8?Q?wFnrMN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 20:23:42.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1473f01d-bb15-4dc1-5e49-08ddc56fd29a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840

On 2025-07-17 02:28, Juergen Gross wrote:
> On 16.07.25 23:14, Jason Andryuk wrote:
>> Add an additional "caps" argument to the libxenmanage functions to
>> obtain a domains capabilities - control, hardware, and xenstore.
>>
>> Update the xenstored callers at the same time.
> 
> Luckily the interface was only introduced in the current devel cycle,
> so no need for playing "stable interface" games. :-)

Yes :)

Having said that, for compatibility, will we need some way to query Xen 
for a mask of valid capability bits?  That way a caller can 
differentiate between "this domain doesn't have a capability" and "this 
hypervisor doesn't support a capability."

>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks,
Jason

