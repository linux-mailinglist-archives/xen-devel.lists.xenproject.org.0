Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7BA86883
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 23:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948021.1345552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3MKC-0006m5-PJ; Fri, 11 Apr 2025 21:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948021.1345552; Fri, 11 Apr 2025 21:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3MKC-0006jw-M2; Fri, 11 Apr 2025 21:54:12 +0000
Received: by outflank-mailman (input) for mailman id 948021;
 Fri, 11 Apr 2025 21:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4v6j=W5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u3MKB-0006jq-NQ
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 21:54:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:200a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e0b4dfa-171f-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 23:54:09 +0200 (CEST)
Received: from BN0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:408:e7::12)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Fri, 11 Apr
 2025 21:54:03 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::c) by BN0PR03CA0037.outlook.office365.com
 (2603:10b6:408:e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 21:54:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 21:54:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 16:54:02 -0500
Received: from [172.17.237.105] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Apr 2025 16:54:01 -0500
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
X-Inumbo-ID: 7e0b4dfa-171f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn41ANiPmrUx1jZvDozeBWxcnDQcFMYVGI54inOqAwqsZ0LOKo2Z4swoY42tgIGbMSnJMx6gwLemn2T1j65y+SI5UeizQbb3s3kBzy/NriPWSaIHJnH/UW5r+TTJc0y6Qhz30jUXjir6DTdP23/UlbEVm/JT/EhKLuoJZtj8Hmemt82bsBs0PWo+T4b9yTx8PkAfXPT7SkMn5MvSO9A2DF/YFWQhQK/8Q0QsHOZU012+60gBgJrij1McujphxkWM17j4A95LKIw1HMRHHUjcSLrA4Fgc4hQv3ucS8n5l5Qp1T5hgfhL6HaZ7BRMeNjJAfonBw4AF8LYcQHH4+sf//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yl18vg+t37mOGSn9f8IcceF0UPmnno4miT3YnFixqg=;
 b=ZUnSoTBYFd//W9M3hmlai6eIEzoJl8Nsb2MJ4CNmEQjsjjd9Gdr750RJACxG+TrTdqYC9l9+KnqP3re29h0BroWGyAuutRomhr9m2tTwr6kV2pZEeoYgo2ltPtuXaojA+vEhiFjpV/nANu8Z9zD3fFld24iIobnCGHpW5YNsWIPTeZhbCQ+HMKdTDPfiSDY3malOU8bnWTxfDheAkxdmOsv/kaXbob/vXVA314gMqug6vxz8Y9RTml7CCaFgOesge6EpFNGR0aLiSGCWHHbxY/6U99RZOYW2iDHkFbcC2gYAo7ZRYLoR5/04uTgpZU69oT1L3veyGfxHTXFpnwE5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yl18vg+t37mOGSn9f8IcceF0UPmnno4miT3YnFixqg=;
 b=1CQOymh/+OOvGqMnscImf345Q0dINt/c/Iymcz3FkU/5FXv24t+dyD2PQMD0RokzTXPwY8z7DZMaNXxj1qQ1sEV1c/6AhyYBysjByKpqxJFJ76mf3ELiwolvSv9JEVAqxs+r35sDG65zDjb3RdbmuGJf59o1cabp0Z2f/tmnENM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a914e308-864a-477b-83ef-d90f8ce6e348@amd.com>
Date: Fri, 11 Apr 2025 17:54:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Package microcode for the x86 hardware runners
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
References: <20250411195914.2256882-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250411195914.2256882-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ba3bba-e70f-444d-6d33-08dd79435f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWZaelpDM2owZjdUQmRBeThCOUVaWWFDaUhiQXdSWDZpZ3M4elY4VTRvL2tP?=
 =?utf-8?B?aVJNbCtQTll5UDNnSlhsSHpSMVE1RndobktSZjVHOG5ELy9UZmxoSjRBUTVv?=
 =?utf-8?B?UW1sVEJ4eXVVY0NEMEsranFkYisrS2E0alFnVzVyWTB2eHJEczRyS3lsd0tT?=
 =?utf-8?B?VkpjT2RrRkR0TXFsbk00eXhMU0Z5NEZ6OUtvVFBBdWMrSTFObmVCQktqbjkx?=
 =?utf-8?B?RnNHa293VU4xeGw4Y0U0V20zSEhTRGh5Sno1UStCYlRtRGdJZXNpdkxWdnNj?=
 =?utf-8?B?Q3hxcGtWTkJueklKZGpZM05pS2hCbkNvL3c1d0Vzd2V5bVNySmlZT0JiTHRz?=
 =?utf-8?B?M3pxb0ZMU2lvUUFBQkdGTkNXV0ZrdmNoRy91bDFtSzBEUnVicnN6a2x4VEFS?=
 =?utf-8?B?LzlYR29mbkdCc2ZHSkpnQnJSZEVGVTloalg3N0Qzck1QUXVlTStERU5KWEM0?=
 =?utf-8?B?UmNmQU9GNUlsUFQwR3lXTTc0NktKT0ZYYWJQUzk0THl6TDVjNitGdW5sV05S?=
 =?utf-8?B?SS9VZnI2amx6Z0pOc2txRlhDR053ZjNuU1l3MC8yd0RLYjJIdTJtRVBscHdJ?=
 =?utf-8?B?aHdYajhLMHJ2Qm5PdHRBV3QvWEJWRGovNE5nTnM2ZFpCVVk2Q2FtdjVrWDJD?=
 =?utf-8?B?eXZSYjZYd3l0c1czSS8yNy9FS2VlcCsybW91Ry9QaEJGVnp3LzRFZ1NJcWZF?=
 =?utf-8?B?eWFyTHJkSlZZK3dneDVsRmZRT2xkdE9zZ245czV6RmRtM2pLSkRZNEdaSU43?=
 =?utf-8?B?NGtzck15RjRiS280KzJXekJkY2RQeVoweWp2dmtEcDZhTkRqTlNNejFBMktB?=
 =?utf-8?B?ZGhrNzliOVhnMWU2QlpCU3ZxUWhRaElJajhDVDRXZVh3R2I1ZUtwemNabkZu?=
 =?utf-8?B?alFsRlhpalY3ZDd5MGdzdXVNK2JmMFJid2EySWZSWkY5bDl3RjdDWk9ZMFpK?=
 =?utf-8?B?SWkzZUd4d2RzamFQcUJ3VlUrZ1FhVXJLY3pCSVVOS3ZBeHhCYW9iMXd5QXV1?=
 =?utf-8?B?QWNIQWVlQ2dYSkNyd3g3a05uVlBjQk5FOHZHc2FDS0drLzNWMktoVUVlR2Rx?=
 =?utf-8?B?KzNyRENDRDZoRGpPcGNqZGFXZ01QNVllRlZRdS93L1NHUFM0U0xUakxiMml1?=
 =?utf-8?B?NTRvQlM2V253YjBRR2phZ1BpODlwajd3VjhLMVRBTHlhcTl6RDZrU0dlTmcw?=
 =?utf-8?B?SzJUQStIL1htc0NJTDUwZkpmdUZBSWhjUnZkQmR6amVIU3dyWnlHVkFHK1Fl?=
 =?utf-8?B?SmIvYmp2Tjl0UXhOV2RmTkpyOVlJNnRiNXI2U1B0T1VuUk40N0E4YUxaSzVH?=
 =?utf-8?B?SVU0Tmh0VXhHcUtpMThsL2kwME92RWpHMG8zWnNIaGxyZXFRRC94bXY4ZWlV?=
 =?utf-8?B?enFzeFBFR3RMM0ovSFdIclZ3RXJxTGs0dm82S21nMitQcEt4NjI4S0F3Sk1h?=
 =?utf-8?B?eGxFemQ1emc1a2NOMHlJckI5QW0vbTVTVnM4eTlpNHZpQTZsdFNWVXRKNVpT?=
 =?utf-8?B?N3NMMjEvRDZiejNRU2VvRCtGTDRXRS9oRGpaS1V4dk1ka2h3UUxhZGtPZTJF?=
 =?utf-8?B?emFBRU0rWGgzWHBlTHN3cDVFT3lIcE5GT3FKMHhUSWF4SjAyY0pZOEpKMmI3?=
 =?utf-8?B?Z1o2c1lDR0dHMTM1S0RyWjYzTXR1MmFualFzUHQ1YmFrV2RJMFlMMG1rREJ1?=
 =?utf-8?B?c244UDVzUFdFOHBOTG0zMFY3Q01ZNEhHYlBnK09nL2d5UU1FZXdncFZoTnVm?=
 =?utf-8?B?cGo1SCtTVGVOakk2dHNXa2IyZmdWN0tXdkdQMnFFY0lDQTJmT2d3NkJEeW5M?=
 =?utf-8?B?cjcvTXJIdGtLUGZwTlFiMFVibW52R2h3a1lmVjNNb2hGOVJHclFYYTNId3Bx?=
 =?utf-8?B?NllvVVJwL2t3T2gwU3MwZmR6bVhNYTg0Q1pCdEQ0SjZzN3hnV2h4OEtxcHJY?=
 =?utf-8?B?TCtlUFBiZlBCOFNBZ1Z5d3R5ckJVZzlQcGx2VWkrWmpKVXp3NVphUXcvMy8r?=
 =?utf-8?B?WEhOaWhJNXJpTTRmbFhsU0g1ayt4RHpObUNsUHM1NnVxM2V0WDhlVks4OUJN?=
 =?utf-8?Q?zF0as8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:54:02.9276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ba3bba-e70f-444d-6d33-08dd79435f93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On 2025-04-11 15:59, Andrew Cooper wrote:
> They are all out of date, to different degrees.
> 
> Install jq into the x86_64 build container so we can parse the Github latest
> release information in an acceptable way.
> 
> The resulting archive must be uncompressed, in order to work during early
> boot.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

