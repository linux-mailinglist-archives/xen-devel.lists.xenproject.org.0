Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8325B1A25E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 14:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069289.1433168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuk7-0000sD-7V; Mon, 04 Aug 2025 12:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069289.1433168; Mon, 04 Aug 2025 12:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuk7-0000qR-4s; Mon, 04 Aug 2025 12:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1069289;
 Mon, 04 Aug 2025 12:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY6Z=2Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uiuk5-0000qJ-In
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:56:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753322b8-7132-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 14:56:39 +0200 (CEST)
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by SA1PR12MB9515.namprd12.prod.outlook.com (2603:10b6:806:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 12:56:35 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::2e) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 12:56:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 12:56:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 07:56:32 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 07:56:31 -0500
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
X-Inumbo-ID: 753322b8-7132-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdV0SucYqnuHxMyPNFaRkJGJRV8PjY7vJOMbrbVjvVcAhSAzUiNrcLhk8cBtWp3UCotVZXSzCt3CX/uiyRYfG6TYCyQDRwJyl+wpE57fBvZWtJ+Om5bWyd2xVFWKrJP2mljgDmm7grm3dgULSZgzFdr2YzbHKCtZrvUFcszfYdLVm6Mk25uv5sz3fNHeOdFOs+Q9sWbSSx9nvMAISdVplEzGJtZRQuiGRdtMcpxhbBYCVjNepckl1/+aAo2sOo+tU7WvMcfQjca3rl7vXeL6sSyyEN9yAHQhekt3SOu8RCpGLXZUKzwuCpsbeVxjrVZ2kKcHSCgAOAwOOkhC9efppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8jbsFFrcx6WeJJtmTA/I51ObKrXb0k2J4e1Bak5mr8=;
 b=oySNV9AET57vdtz2kx20esMHW98j9Wed3QmB2FLm1dtl+E2bE2WiziCPjcqFxKEzSs0AWcouiSJruJ8OW9t32lbBz7kWM6G1wqWzmFkZZrj9ot8GlzUd3f3snxIXpNRQ/qDJmXA1DjQVhgzRXkT1YnPGz0Wl0gsgoE4MOEN4tp3go54v1FokOUn6kK1jNcsWMlXsqAG3NQjknsm2G+r0Z1VisgyEEicf88p6nD3/2/iexvMg2bqjaU9VDCWX7C6C7T4q0ipzcysyO1Jvej8VtL8Px8/gp2NpqJhKmNS7Cx5/vk0ERt64U+e3Pil3DMoEFX1q4ga/3aW0Xj2/FF1iPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8jbsFFrcx6WeJJtmTA/I51ObKrXb0k2J4e1Bak5mr8=;
 b=SxC7YWo8OkRsi6iN5wHXVkA1+As5VIUzgE9sl9/UG8ndpn0bhbYj3qXvSFcsqsBuIfKGTgVF2oj5L/+hZXEUkE/H3aOVv0H12GzG15QEVvprEyaau9SRPQfDTvd8u0Hwi1v+0nh8JkwvN9tS6oCo6JCvH7UJOVe/LPpUU0byOWo=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <fc9e4345-3dd5-47c5-8052-c95ff67a49ca@amd.com>
Date: Mon, 4 Aug 2025 13:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm/mpu: Implement transient mapping
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d6bd97094991a08fb5ffb48f2642b510b55693e8.1753864612.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d6bd97094991a08fb5ffb48f2642b510b55693e8.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SA1PR12MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: ada36b5d-2fae-4ef3-51b3-08ddd356574d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFJvc1VIblM0Mnl3TEg2QmQ4M2JNcXhXaXFaWktGZ1Z4Vll6Ylc1dEZraXhi?=
 =?utf-8?B?WEdISURDMUdCQ3JmbEZhdnk5Ni80L1k0dzVxc3JYZ3FKVll5ZmR1WjNSK2JX?=
 =?utf-8?B?SnN6S1NYRTYzY1paL2V2RDE3ekR2SjFONkE1bFZoa0RTeTNkSS9iTDA3TDlt?=
 =?utf-8?B?b1EyZUlHZnRCZGxOYW5BbTkxdUlUZ3RJZFE0SnhhVUVJVGdRTW50RzM3UTZn?=
 =?utf-8?B?S0gyaVdadVZ1cGhYeWRuQlNSdXhhWHNzd2h4ZHV6V0ZBMGtwNzJKN1hHUWVy?=
 =?utf-8?B?UjlUdzFSb1lEa0xUbHpReitDSGI3M1RzRlBkK3FQSmtVMklTVzhReXREbkNQ?=
 =?utf-8?B?OFA5TE5rSW44R1c1eWJEdHlzUzBGVyttTWVKMU1PYzJZL2NYR1JwZW1KampC?=
 =?utf-8?B?ZmpCRlJhOTd5d2JuK3E5Vlg5UHlDdE5MRFU1aHh0NXo0L0I2RUlUSWZwL0Iw?=
 =?utf-8?B?dVg5ckxvWHd4SWhvRDFkUHpNYzd4RlRsM3lrQUxOc1cxRWZ1TzVXN0ZuYjNJ?=
 =?utf-8?B?VFNnclBVWkVtbUNwVFNFc3M1UXNhNjkwZUdLNEtkTXFGaXI0YTNyM3RxZnJI?=
 =?utf-8?B?WHFsV2lUN25peFpZbmxDVnJoVG4zTXN4OE1qdmhhM1dlMkl4RCthemFla3dI?=
 =?utf-8?B?WmNaU1hYQ3B2L2NQOFlSRkFFS0lkRzV6NENodUkvUEJCMlFNQWIvTjVaRmVT?=
 =?utf-8?B?MmpITzZ1WE1qWlEvR3lobVN0dnIvM3ZCeEF4bEN5cWd2M01VSkI5TUU3dmMx?=
 =?utf-8?B?SXV1bHNLOGQ1bSsyRHk2b1A2QXk4U3N6TUpLWVlrdllaSlJpdFFhQ3ZRaFYv?=
 =?utf-8?B?Y2VSR2dGeGhmSmlSMTZxeWttdE9vdFVIZm85YmNwREpwT3lLNG5sOVBJbWlP?=
 =?utf-8?B?TTRQVWo3WlNZOEkvSDNFOHd0WWtlQjNLL3FjUlZrMlFoK3J3U2IrWVJuSjhN?=
 =?utf-8?B?a2xPYSthSzlPay8rWEVUc0gzYnhrNFA4bTREUTQvbVVqRjd3aG1wTno2bkRx?=
 =?utf-8?B?UFdTZ21NenZPNDRsVzg1ZTNrUWJxMUlobkFMMit4NGEyR1ZCWXNzaFEzT282?=
 =?utf-8?B?TzZZTWlxU1Y2Q0xkV05HbmI5eFlPanRFeUZoMUFwS0p5ckpSTGVYVmlJNXhE?=
 =?utf-8?B?aXJrOUlCcXYvZUVQVkYwQ3JTdkdyOXBWaWxjZGxORjd1SkNINDF4SERTM2Mv?=
 =?utf-8?B?ZENHcEZXRml4WDdyMVRsR0lCdFZZYm4rSllaT3Z2MXAwQ05nRXdIdkhzeFpR?=
 =?utf-8?B?OUFFa0xZOG1EU2VrOCtjN0FQS0wrWTBRKzFEaEZqdklIOGlGbHlWK3I2QWt6?=
 =?utf-8?B?RlBaQjh0aWRwQlNaMSsyN0NtajFhRXJVOFRwQzNGcnhHRFc4a0MzUnlqNWdL?=
 =?utf-8?B?ajZiQlJTS3Z2NzQyZE9BcWNrd0NhNVduNTNhWFVJOTJKbXI2ditXR3FyeGp2?=
 =?utf-8?B?aFdHbnpYQ3BWSkY5RzFTdGptTnhkWGcycjlHTDl4MzBCbUR5akN3RUpZVS9z?=
 =?utf-8?B?QXM0c2xPZmxrbUJTS09aTkdPWFM2RS9NRHBjTVZUYzUzQ2Rzd3MrS1JjSTFQ?=
 =?utf-8?B?VVVpYXN6dCsvYTdzOE9NTnAwSnY4blpMMVZCcWgzL3lpeUk1Y0xtRU9rT3N2?=
 =?utf-8?B?a2JLVjRFK1lDRWQrZUJUMFJHbHlLWTQraEhLMkdMVjFiSm9rZDBveUpydWxG?=
 =?utf-8?B?eHJrWTREbk02S1VLemo1cG94MjIzTWsrSnZtUUZnYnlFalRnVmlDMU1va3Ez?=
 =?utf-8?B?UTNwWmVSbUVDRWIvS1ZkSTUzRUMvTFVEL1R5bWRCQUNzUm1TSlJKV0sxcUxa?=
 =?utf-8?B?Q1ZOZ0lnV053RjRkVFF3Mkp6YWxEbFhHdGVjYy9MRU1ybFZpdjRFVnN5WjdE?=
 =?utf-8?B?M0lXdnlyMVJ4QUtWRnpZRG9UVndpY2JERzhURzAxUkZ3Skw3MjN3aXBXSkVF?=
 =?utf-8?B?OFhZMFlNRmRmSm8xZ0dqb0t6LzM3K3c4WERWMVExWlZRN2NWK3RnRDczUzB4?=
 =?utf-8?B?dktYbzNGSHFhbFd3MEdBQUdtUUtLcFhTOVo3MUFwQzk5TGIwQTZlQmFhVGkx?=
 =?utf-8?Q?fSSW0T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 12:56:34.1386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada36b5d-2fae-4ef3-51b3-08ddd356574d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9515

Hi Hari,

On 30/07/2025 09:45, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Add a scheme to distinguish transient MPU regions, to identify MPU
> regions which will be mapped for a short period of time.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

(On R82 and R52 with some additional patches)

- Ayan


