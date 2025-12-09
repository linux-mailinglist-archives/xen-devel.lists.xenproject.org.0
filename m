Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92827CB1498
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 23:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182242.1505146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT69X-0001hC-Fl; Tue, 09 Dec 2025 22:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182242.1505146; Tue, 09 Dec 2025 22:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT69X-0001ey-D1; Tue, 09 Dec 2025 22:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1182242;
 Tue, 09 Dec 2025 22:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT69V-0001es-6p
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 22:25:49 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021a4779-d54e-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 23:25:47 +0100 (CET)
Received: from BN0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:e7::15)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 22:25:42 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::31) by BN0PR03CA0040.outlook.office365.com
 (2603:10b6:408:e7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 22:25:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 22:25:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:25:42 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 14:25:42 -0800
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
X-Inumbo-ID: 021a4779-d54e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PygTmMo11cOQryW/V6SQOODycw//GIuBEpXWWCxJ+Kh63i+7hhE+k3P4LFvhkTibXwOIjt/FzKzSYdW06AwcQpAA7wjQlmA43HLmqHJG1ZOfg2QN/6dWYCDSWjI9K/f0u82i3HsmbaeY8yOmYieyxv2JgAZuME3Yvrpd1amDhDwRiyK2UwSTFangsMF8E4gXBrGUPc2qm6EsHa+FE9TvflVeXTtjZEKtlx0JTVS2kfokB27A0gbZEucOIs7fGvU+oaWaBblyS5OYyltgF1XEOAPr2PgvlZmzkAurIvOiblO8NS6bEsBuGG7+Tak51QE9dsJLF+WfrqmLqegzeEqvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Np5JzxUzLP/JTvzTj/S7a0GNCLFJKbV5/wGNiSYpNw=;
 b=AD8ArDDvjPbXdfzVFCyvNMdOzoHooi8jAfUzz7GnqdXZ/ykw8A0DnS0tD75f5R5jEsmTN93oMjk7maCafTvd0VWbPtgZcTRETuKt54lHcNx37XTQvnWkOb+W+W2rTPQa0EPJIvcSQ5FUxiRb0cE513Ctu1uQRhewJFsEGy1oBoKfMpJNH85LINvKsDS363oEH0og98NBflrdHlYj0+g/41U+Z/XzwUTO4dxA451/oAAc86ZthggfzTp6Nzup4eDH1j+AwrgvfeHctCUL0ltlYULtK/Xz5ri1SbuNehIlAzYEt6/5XPW2jgS4kCk3j/vms7ebjWXTE7MX78vcUxxnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Np5JzxUzLP/JTvzTj/S7a0GNCLFJKbV5/wGNiSYpNw=;
 b=wYq8FJfJjTIfoDMJfzdtwkdczDH9P1IUb9tzXGzC2YauG3n4C2u07VwN8N5zBlYYdELuznawSUA1KOrUdLLDx0NX1A0+ChXJaHr9uHxa7xzQbElU0rcE0wMhRfPXIXf3HVxBK46Fg+vIKOWmqWCqM1MdJ5DPK1jZyAqRZrIhoC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <273aaff8-5e97-4319-882a-5cb35822908c@amd.com>
Date: Tue, 9 Dec 2025 17:25:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/6] x86/cpu-policy: define bits of leaf 6
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
Content-Language: en-US
In-Reply-To: <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 19baf9d4-38b8-40ef-1920-08de3771e3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU14TERNL1hlWW9UbjE2ZWE5clJjWjdOM1hsSWRtdkZvOHBqcHRod1NJUTdO?=
 =?utf-8?B?ekorZi91U2cvT2FZNUNPK0Q0ekZ5Y1U5YzVpM3B0cEt2djJaZXZkbzhyTlh1?=
 =?utf-8?B?WVNPL1hac3M4K1hQRDdEb1Z3NnkxWVArdUgwQzFVbFpyalNlTnI4cEVtNUZ4?=
 =?utf-8?B?cUVYbDZXYzdKdzVjZWx5VjgzclVCOVpXVEJJUExLMUVHUTF0YW5maGNZNE5v?=
 =?utf-8?B?NWgvUVk4MEFncnV4NkJwRTFvMGN5UWxLRjBoOVRwcVpDVXRpRjZNYlliaElq?=
 =?utf-8?B?a0w4OTBWRVoyK2ZNTFQwbDYvZzBGYS9NdGJkY1dGZmp0ZVJ3WG54dktZdEcx?=
 =?utf-8?B?cGhoT3ZueUFpWldaaHI4cDNOOHVpOWxZeUNvazd1dUk0djhPUU5VdGRQTEcv?=
 =?utf-8?B?VDhFV2pRU1oyb1ltR292QzJBd01kNXVGQVA5dk9zd2dZWGJhSjhqMEg0WDMv?=
 =?utf-8?B?Z2IrWG53WjVxRjMyOEtxd1dXemphK0E3NHFVb2FHeVpiN2g5cFUxOUwwRHhx?=
 =?utf-8?B?L3pKWUpDdGEyYS9FcHhxai95S0wzVDQ5d2JvcHEvMGxBTXRYcjJJaEVJMjY4?=
 =?utf-8?B?OHp3cnFUdVBUWE1FL1p5WElvdERmdEJ4MXNMWnBMT2ZicW1ZT0ZVWTZDRVF1?=
 =?utf-8?B?bW1SMXNkeUVkbkEvWkErQVVVMHU4WkZIT1hDOUp0K284ZkVZUUFSNmZTdm8v?=
 =?utf-8?B?TVJaellKc0lYNi9iMWtWNjViUFpWQ3RJY09YVk9oMkY5cGVOeEEwYW1Pemky?=
 =?utf-8?B?T2dLc1NuQUt1dEE1UitsL1V4TEpLM0ZiaUpGKzNZa0JjNG9YdUg4a2FRUTVi?=
 =?utf-8?B?WGpqNll3VktjSVcrd2NpZG10UGtoTWtJZVFqQitJZytQMmh1L2krVk1OVkhy?=
 =?utf-8?B?L0xWeHdMeUkzZXhicUVYU2VmQVlSaTZhaHdOamQ3VDJCTlFUL0pJeTVld1kr?=
 =?utf-8?B?dG50S3M3VFBwVWdPVCt4bXlkKy9GcHRuSHYrNkV1ZUJSNUppOWppSXV2d0tL?=
 =?utf-8?B?T3J6T2w2ZEpSYTFQd3FuMkJ0QmxISUxNL2VsZURodDlPWTVVZVhueVVjVzJ5?=
 =?utf-8?B?QTdNNXhvV24yVkRIZG9FSGpuOUhRWXpBNlpEcGMwQWFjeUNRSzN5cm00Qkt3?=
 =?utf-8?B?RU1PRHNFcnVZYUNpaE9CWnVQQVk5YUlKZDBPY0R1SjhpZHRiZ1Z0Q2F2c1Fm?=
 =?utf-8?B?VlF1c1pYbU9vTm83MXhtQ2doNFM2Y2pLakdhUmNWSmFDT0FkM3JtODIwaTJy?=
 =?utf-8?B?eVhwb1dwTTB0eFFWN2M3SXpuUDhKUDRJNkh6S1dqZGZwayswMDEvYjdWSlQ4?=
 =?utf-8?B?ckJjcjl5ZVBRNXI1NHUvMHFnZlRFSVZpdkhzRTJHWFptaXBKQjI4OURvditM?=
 =?utf-8?B?VTRsSy9HNVVCc2Uydjd1NklLQlZIb0lzK1NEUW5lYjlqSWRJMEdVYmk3UDlt?=
 =?utf-8?B?dmM4b1hZeHpiZlhqK1hlUnBERUJMcHlHL2ZXM2R2RlcvbEM5RFovWDlweWlC?=
 =?utf-8?B?ZStKaVlYWU9YSm5MM3BzWVhRSUZTZW0yRHg5SC9DOTc5VEtYc3lOcVNLNGYy?=
 =?utf-8?B?bVVuREJUMWJaYlJ0QktJMVhDbW4zYzdDb1pWS0J1bERzVVhDcEZ6YnZLRUhi?=
 =?utf-8?B?UWJiQnM5WnRUYnYrWWxkay93OGRSZE1tamJvMUZ5bm1tbURtc1VuanNOOW1t?=
 =?utf-8?B?NngwT3pWWnNmdWM5SzV1ejU3amdjVW80SkoxUHhaN0wvUHRIVUthcXRkUWgr?=
 =?utf-8?B?SFd1VVRrU2labkhTWm1CN1ZMYVEwOTcyaENZdDQ3VDJIbVVLSGpHRHJqdzk4?=
 =?utf-8?B?eXpOdjZNWlVtUjl4R2ZtQTJsMnNkRkRNUHlRdW51eUxzZVhqUitCajduK2Nq?=
 =?utf-8?B?UVplTW5QYXc3ZVUwSkJHcko2Mit6VDJsaHV3b2ZJTzVHcm5tZWRHNFdiZGpp?=
 =?utf-8?B?UkR4cXFUMXZoYWtrTFY1RWEvVGxEMVFLS0pMMGtxVFA0VVpxVWRqZmNWTjE0?=
 =?utf-8?B?UmJGT0N6S3krZWk3RjMyWWlEZGNkNUtwUTZuWndSK0xVWHhHcGZQK2dyUDdT?=
 =?utf-8?B?L2JFTWtPU2VuT1BmZG9LdVROV0FMRTVYM21kWUdhc3UvZEpBSUQvM3hzQjR4?=
 =?utf-8?Q?aAUs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:25:42.8144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19baf9d4-38b8-40ef-1920-08de3771e3f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566

On 2025-11-24 07:23, Jan Beulich wrote:
> ... as far as we presently use them in the codebase.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

