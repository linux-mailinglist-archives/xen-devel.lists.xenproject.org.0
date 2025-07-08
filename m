Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31565AFD9C5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037296.1409959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFpA-0004gq-Gv; Tue, 08 Jul 2025 21:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037296.1409959; Tue, 08 Jul 2025 21:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFpA-0004f7-DE; Tue, 08 Jul 2025 21:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1037296;
 Tue, 08 Jul 2025 21:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFp8-00049I-RS
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:25:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2408::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f4e381c-5c42-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 23:25:53 +0200 (CEST)
Received: from BN9PR03CA0619.namprd03.prod.outlook.com (2603:10b6:408:106::24)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 8 Jul
 2025 21:25:48 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::1c) by BN9PR03CA0619.outlook.office365.com
 (2603:10b6:408:106::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:25:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:25:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:25:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:25:47 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:25:46 -0500
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
X-Inumbo-ID: 1f4e381c-5c42-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJCZ2nRz6s6sBd2jC/M2Yj/Vkb3FNKeADkVY26xYIz/CjXgXogMKfNW/0v+JTCAFOMqSxn9WZffy5UZiD3vGvwxpC7FSG/3t0a6GR34/YGv2GI1MTesJ8rWywSyGORIUn73VywUVEWlbXuJDYPtOznrSpjxzwwgPglUP4jmoaHMmJ0WNqZEgs7tX5T4Qb4AU10RV0hR5FXwDBQFyUVT5/mGj6N01Br6evfJdM39uejym+oW51O+blFBvpWxZofyzVWN3ibljQ5WVfxikLGH/X22ft54tT9Tdy1cb77hC6p3t3VVEOPhLmpGKllRNhSZxOYtrZufZO+Smkg/QbmvGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPMeWul5rUf3T2TMz3BXWb4oFvA1Z6J41DkUd04ojQk=;
 b=lnRGcbBWDAyyxlZQTR9EBIEGUzlqXDibZE+XWNGYsypgtPksBTaXy2M3TLeNKoKYMne2x2onYznoOpZSTSZOc8r8WdMZIqZRqbZ8kC7rR5oU+Uxl6aMwAlpWmUrE5uLOh3VapI6BeZTMGu/zfSkVEx1TizhzwQRTqiKABtTGERNziJezLM6NZ6PvOdav2tkLSxtSPsx9pPAgMqld79cRCSYAoncnfSQoRxhXMzjlfhQj1fjgsd6q5QiUiBqpGpauKnRg6Uu1Z6iQaH4UYK3B1PxKoVxBlGobkFGyFmeHOM/USaIwiKdioFnIqgx7DUYAqVqOZqOgJNg33R3PS/AJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPMeWul5rUf3T2TMz3BXWb4oFvA1Z6J41DkUd04ojQk=;
 b=FHCZepdZhxwqJ44B2MQRICuhI3IXAywgy/Py1g9PC022f+U9VnfH1uj084tHYRBEO1LRKqVFSyV7oCXSHrntNe0rpVJZXPGDx1e5YXj+YK7JstHh76lRhxwdvJ6wEN8aUW23BV+Ki5PM/fxmLgyBDTpasECzvhWTwZQWc4AdCo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ba8cfe99-979a-4f57-9b9f-e9b0ebc34653@amd.com>
Date: Tue, 8 Jul 2025 17:08:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 03/19] mini-os: grants: support populated grant
 table at boot
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: e3323a55-cad3-4318-8ec8-08ddbe66018a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aStQLy9jMUkxTUFQb0tzaVd1QUMyOFRnSWZpOTF3MlJMQ0dQR1hlYmJZdGNs?=
 =?utf-8?B?b0IzNEhqY1JVN29kN0h0N090aXZqSHA3SnFSQ1VDaG9SMW9hWnowQnkrWVlm?=
 =?utf-8?B?alBqdGhYajZuWjR3MnB3T3d0UTd6YTViT0xMcko5dEpHUE0xa0psTlJNcW5K?=
 =?utf-8?B?OGs0NXluNGF5alo0OExWSG9ZQmVJMy9wZUFETWJhWnJkRFZPOFFWZlNzY1lo?=
 =?utf-8?B?LzJDS25UYWJZUzhWU1R1b055Nmc1MDNhRmh0T2xpVmV1eHM0OTdDQVpLNDd6?=
 =?utf-8?B?c3NEUlUwVEtzcjlFLzFKUUg1TWM1N0ljUTI3NTZmMGVOSU13clQrOEYyWjNU?=
 =?utf-8?B?ZDlqTWsvdkZtQzJ3YUZIVU5mcVJCMHE3OVlmOEpFcGZjeVg3TGpNSEZwZjNV?=
 =?utf-8?B?RXpPaHppaERDQzBMZFlMSU5vYXpndFpGTXd4aWpaN3czNEYrOER0d0ZWTCtU?=
 =?utf-8?B?a3NFcXFhcTh6Rm9IUzhlSE1yL3psYU5kckppKzlNd0o5eWdmYlFQU04vU2x2?=
 =?utf-8?B?ZXJuVmNxLytkQzdvMjBvZS81cDg4SnlkUnRpZXJBdzIrcVE0K25HdlJxWTRX?=
 =?utf-8?B?Ky9SdnBwRmVoUlNSbWxMYksyMFVEbGIrd3ZxU2lTaWFHcXFteDlpMU9XakxX?=
 =?utf-8?B?UDJCL0wxdTJuS3Rabnlic2pUelhJUlZuNUN2aE55aHVQcmU5a0dRS2NwdzdQ?=
 =?utf-8?B?L3p1V2FXV01sSk1PSzhxWWFVdU5MaEpFS2p4Q2RHeWd3L3dyRHYvRUNLNVdH?=
 =?utf-8?B?TVlYUU9hRkNwOUdYS2VPa3BiaXRsQ3BUSEJPM2YxNTRVVGxyMW1POWlSQ2dU?=
 =?utf-8?B?VDltRU9lczVOZm1vc2d1K1B6cjBrQ3UvMGJwbWFYVjB6YVM1eE5NTUF5TkNY?=
 =?utf-8?B?MG9rUHVLVGxXU3ZhZm9aWUdBckRVY3pucndhbHJEWFZZTXZHc21HK1NuT0R2?=
 =?utf-8?B?MGFkbTgyUlh6R0t4WFU1eldWRVB3d2g0bmt6czkxVUMyMmdibXJXV1cvYnB1?=
 =?utf-8?B?NWwzYjYxa0R1dzZ1cnpYOHE0YmhEYVExWXZOZWRhbkFKbng5TFlQRVdtYVFm?=
 =?utf-8?B?STdCbmdrcWxRVS85T3JwNTAwcVA1bFIrMGh0dTdMTW03bVc1UUV6RS8vT0lS?=
 =?utf-8?B?aGQ5aTE1WG9UTVZtOEVrcmxNZ2RRR1FHL204RzI0eGl0ZDFyc0ZGekFZdThS?=
 =?utf-8?B?c1BPWVYrL2NXSHJtcng2VHRYUExGQkVpd05Ga1JDRG8wZGRxMExqTnBtcnJm?=
 =?utf-8?B?dGwvcE1XVlBUQXRoUDZGOW1mQ1ZYRVlIYW1WUFVGS0hMVXVxY3U1eC9ObHl0?=
 =?utf-8?B?ZURlcGlRaDBGOHY5OHNIMytXb2RmYmZHZk54OFk0QnAvdU5qUDUwcFFpaHM2?=
 =?utf-8?B?MXY4T0ZOOVV6N3ROMVRWODZYMDBLcVdiZmJrdnphTkhiKzZpU1k0bUlyeDhT?=
 =?utf-8?B?bXZXOTF1M3RuSjdpMkhWcWE3RXRZTCsyMDhUZUhUNTNyeUdMcDhnd0Y5RUNw?=
 =?utf-8?B?c0ZQQnd5TFY3ZkEwZHpiWVZkUmFMdXVPVjZkUGQxS3dlWkV3NnhhVXdaYnBk?=
 =?utf-8?B?bkRvZHBzcUExVDhOTk55T1N3NHlrOWxWYTl6eW41UnBHQUpuSU1WdURIeExw?=
 =?utf-8?B?ZE0xcC9HakFucFpvMnl1ZmtNcFcxQ1doa0dDR1pUUjlyaGFQS1JyQnZ6bzlJ?=
 =?utf-8?B?MkxLbEkrV05vUXBTM2YwY1BzWXc3eWVROEo4SWljTzVLdkIwZFdZQ1c2dkxW?=
 =?utf-8?B?N0dPRVNpOE96ZWtvVWpBU0ZINUpBbHl6T01EaXQ2V1RzanZmYlQzQVRpckty?=
 =?utf-8?B?QVkvejZkOUxRdExPTkNlamRReXpOQi9vWWtvdExQelVnbHFudUR1TTJFUnNM?=
 =?utf-8?B?Z2dBNlZFakkwQ2sveVFKSmNVVHp2djgwcDY0NUpEM3l5SzJiVi9VV2tPZ3FQ?=
 =?utf-8?B?VlhCeGYxNXljOFZmd2dwYmtRRGVpUUFBckFmcnpvNmlBQllwQ3pjUVF5dGZG?=
 =?utf-8?B?Z0syZWMzOCt5aXI4TkhOK2toYkF3MnlpTmF4UDlibGdKYVhJUTlaUlVVbmdz?=
 =?utf-8?Q?j6q/G3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:25:47.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3323a55-cad3-4318-8ec8-08ddbe66018a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928

On 2025-07-02 04:12, Juergen Gross wrote:
> When kexec-ing into a new kernel, the grant table might still have
> active grants. Support that by not adding populated grant entries to
> the list of free grant entries.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

