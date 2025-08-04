Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA6B1A2A5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069323.1433198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiur9-0003oY-Fn; Mon, 04 Aug 2025 13:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069323.1433198; Mon, 04 Aug 2025 13:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiur9-0003n3-D3; Mon, 04 Aug 2025 13:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1069323;
 Mon, 04 Aug 2025 13:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY6Z=2Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uiur8-0003mx-6J
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:03:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:240a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a57c7f8-7133-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 15:03:56 +0200 (CEST)
Received: from MW4PR03CA0137.namprd03.prod.outlook.com (2603:10b6:303:8c::22)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 13:03:52 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:8c:cafe::3e) by MW4PR03CA0137.outlook.office365.com
 (2603:10b6:303:8c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 13:03:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 13:03:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 08:03:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 08:03:50 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 08:03:49 -0500
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
X-Inumbo-ID: 7a57c7f8-7133-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfcHviwfmCWlCFdj0KWOSrOcqUBd+lnpHZV7YZNNppTVTYnWaCVJywXasxJ2OQd4tnmnoZxhz0RBz+NXmGzDatU8Ufq1IPvt7pWtD+7D1lE86YKKbpg0hh40eq52WbmtRx2KwIrIjII9oa+klwwadPwcip8xOk+LWR3o80xjPjo4hlDRImqR5bGDuQ6lLyhn8amj6S+yiFC75ubwBPfd6OlYrhGPfDK+cZ/6buWxfqWdGKw3cMjW5cMOW6SuedLnofffR2mcxC/6F4VqapYhtM7O+RtLPzUaooqhwlhlfTXbPiw9ft8L2yCHh69eNiDN4FyEmRVmsMvJoPcJrN1VOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW10x64aSYhluYGdKOeYklIiFyevOtNj18XdlURBPJ0=;
 b=yJb9qN6EjJsV51u2caUqD8y1STdmQColNyF124MpM6eC7iOOcwXSb5LLU6JOh31wuEeO7yC0JkzI0818eSMpMPiEL8PgXgA1PE1FXM+zxiYyovQZKc7sYFp2nbz6Lx054Xxf6D0YWgsPDQSyXuC4qPSyz65zQSWNF+2Jza0ynp7rom1hfnFbwa/x/lyKG6CkrOjlAp0WDBm4bGNCcbVIr1d99vkD5/pdb3WoF1ak1qnq0QLmqwmAizsdcSN8HZjaCFeTIPbWs4+v1GfJ95w09TZk0l0209eZsATKW5Qq2RIk7Vwi0r35G4eOUzzr34u6h9VpFHvxONtyRIcu73DNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW10x64aSYhluYGdKOeYklIiFyevOtNj18XdlURBPJ0=;
 b=nEGn10p1xWo6dj9p2HYcES9qCo0cRDG88m0SIjMCBNq9xr2uQ0k2yGbRPtdECdHVfX//hBRSAXB9kAtHuwajkyoBfyc48FlOcEKv3dE1WfizMr66nVfDQ9k07nnpiW75FamvKlGZKusec5+UUJCa63PP0ixDnpEgY1fnbmKbWmI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f4e5d6fd-26c3-441e-bd56-e84627edafe5@amd.com>
Date: Mon, 4 Aug 2025 14:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm/mpu: Implement ioremap_attr for MPU
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <ad8cc76fb027efa52e0eb51f6ba7a918fad0ae52.1753864612.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ad8cc76fb027efa52e0eb51f6ba7a918fad0ae52.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: a7281cb1-e082-4af2-534e-08ddd3575bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFBxOGNYV3ZyRWRBZ2psM2Rmc0gyMlNVVUphQmt1ZVIxb1Z4cEpyWkhQbUds?=
 =?utf-8?B?K2FVN0tlb0pkL1hDaVpDSFgzekVqbXBhV0I1YmszWm1xaTBCa3I1ZnJlYnFx?=
 =?utf-8?B?UFhYUHVMSEFVVFFSb24xcWZzcjJFa2VIemhaYkZKcFJ6NU9BZFE3MTYzWVZM?=
 =?utf-8?B?NDR2bGxOTXF3UkhCY2hjbDNSY0FPWk11U0tWdURqbVh2YTJveVNYV1JvWGtM?=
 =?utf-8?B?bnoxNU5FSmRTc3F1dzREbUxLdEZKSTRhRUY3eUZ0YWtTazViVXg4d1o0UW0y?=
 =?utf-8?B?NkZ4SlRMb3dkbmoveUY5Z25BdmVPQXVpOExPdzJPaUFVWUIxSnRBaXA1WHNI?=
 =?utf-8?B?b1dKb01xcFhKOUN6RXE1cGtQNWpaZ1VKU0R0b20yd1JsdkVCRGIvcFNzUHdB?=
 =?utf-8?B?K3cyTTNhTjlYN3E0V0ZXWnM3T3ZrdkJ5MEFad1d2akpqQlBidGhZNHJOVUU1?=
 =?utf-8?B?aGlMUG9JSVBpaDI5ZmZqRkxUaVhTMXpjdFJRQWxyNzFsQk5vSGU1K0tXck9x?=
 =?utf-8?B?WjVQeTFYT2pnclJmeW9EakE4M25Hb0l4YzZOSTJuM1FzQTZrNlpManZueTl6?=
 =?utf-8?B?V1BGUmE1NCtTVjFhNVJreU5XS1ZzdzlrRzVDTnZqcXdnUDlDMlk0UldBUmIw?=
 =?utf-8?B?MHR5aFZEcUQzbUhhdnFtZWNIVVlYRVV5ZjBzLytiSUdEaUlub2pYSE1PWlBr?=
 =?utf-8?B?cTdmK1RVTWROYWJtM3Zibldpek1hVHhHb1ZvWDdpY3lBV1VDdHNIUFliVWVW?=
 =?utf-8?B?Ukw1OVNEZDlYdkVtajB4OHNDODJCemx1WTRTb3QzM2dKOE5tcmRWTEZ0YlRH?=
 =?utf-8?B?RmxtTUlGbUVhYXpBVzUxaDJuZHViUHVMQWpCQjJteThWR1lNWGpxU0lMOEdi?=
 =?utf-8?B?OVhjVDYycVhKcGVnYUI4YVlaZXdobzZkdHluc0R4QXplSEZVQ1dIanBwR1Rl?=
 =?utf-8?B?MDdxTlhJZFBFR0U3SWloTWgzVzNYdjBoMDdRVHFkd0M5ZFVLK1RUUlZ4bThI?=
 =?utf-8?B?M2RaT0VoNFFaZTJ0L2NxTFpuVFlGT1dKRHYwOFp6bEVOcHhTRSs4dUF6U3ZW?=
 =?utf-8?B?QzJZZENiblRPVThUbnI1cUNsZ09GM1cxUVc3b1JmYWcvZlZWOVlkMVNTZ01w?=
 =?utf-8?B?MzJTOUU2MVMrUU01c2JaUmFUR1BVaVZNRVJvdzRDakRzZk03QlNnZE9CSGdm?=
 =?utf-8?B?c2JHZWRqL0JwSFZocUVjTllHVlhrR1NKeVFtTHNDS0Y3VHM5dzAxTFYxb2M5?=
 =?utf-8?B?ZktmMTkvbm1CSENEcThTL0V2VTZrMzIzN0svVWE3WTQvS3VuNTF2U1hNanBD?=
 =?utf-8?B?N0J1VTB6c3dUbTEvYWtYM285MWRDMmwwMzh4Y0VlSTM2UVVwaFNlTi9VZ1NW?=
 =?utf-8?B?ZG1kRlJvdVErTU04dVovYlhmTFhoMmc4VkFkNlFrMnlzTmN6dTJxSW9SVUJE?=
 =?utf-8?B?UEsybjBXR3BwU3p6c3NUYy95ZW51LzRoWTduOW9HK0g1aVgrUS9MZStRcXhM?=
 =?utf-8?B?OFRlbFQ2aGtYU2h2YlMrWTVTZ3FGTDNCNDhCRnpMQTIxRG13d1lqRHNZU1lo?=
 =?utf-8?B?VmRHV21TY0oxMnFHTU5wL25KRVRDZGZSdFY5Qjk3aWFTVHl6ekFBS2IzZTlV?=
 =?utf-8?B?OERweW9YTDc5M3N1UkVwc0c0SXlhbDkxcGM1RTMyNlFHbzdrRWQvN0pqWHRT?=
 =?utf-8?B?dE1PSVBUcEZPajYvOURxek9VR0xVaFRtdm5xQ2E5Y0xHWXQ2ZG9wbFo0UFRC?=
 =?utf-8?B?OHk5Z0x0R3lScDBibTJPZXlZNWY1OW1kdnNjY21mN2UzLyt1emJNYU9FVXQ2?=
 =?utf-8?B?cjZTVW9WYUl0NU1wLy9vNW82TU5xb2FSak1MbGdwRFRITGtWa2RDMUlpcHN1?=
 =?utf-8?B?VkJtTnNHTVVWYldEaXNJUC91Z0VVZjU4NmhHTEJmcW9FdE9TQitzbzQycm9a?=
 =?utf-8?B?UUE3Y0dneFdrQkx2ZEQ5SXZSa09jK3pIWFNKRFl0N0FOV3Y4UEhVcHBWcDlm?=
 =?utf-8?B?RmczOEtxS052M1crT2VyN2dZVzNxSUlVczZYa1NFK2FmZkpnZk5OQjZXWmtH?=
 =?utf-8?Q?GeRzbw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 13:03:51.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7281cb1-e082-4af2-534e-08ddd3575bc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714

Hi Hari,

On 30/07/2025 09:45, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Introduce helpers (un)map_mm_range() in order to allow the temporary
> mapping of a range of memory, and use these to implement the function
> `ioremap_attr` for MPU systems.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

(On R82 and R52 with some additional patches)

- Ayan


