Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546D9EBDD7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 23:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853372.1266872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8kP-0002R9-Ge; Tue, 10 Dec 2024 22:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853372.1266872; Tue, 10 Dec 2024 22:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8kP-0002O9-Do; Tue, 10 Dec 2024 22:30:29 +0000
Received: by outflank-mailman (input) for mailman id 853372;
 Tue, 10 Dec 2024 22:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/ZW=TD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tL8kO-0002O3-4x
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 22:30:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 595237aa-b746-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 23:30:25 +0100 (CET)
Received: from MW4PR03CA0143.namprd03.prod.outlook.com (2603:10b6:303:8c::28)
 by PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 22:30:14 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::37) by MW4PR03CA0143.outlook.office365.com
 (2603:10b6:303:8c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 22:30:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 22:30:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:30:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:30:11 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 16:30:11 -0600
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
X-Inumbo-ID: 595237aa-b746-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t29HFYiotTPks+eMFbLznKA2FZNhzEjgZtRFu8ZuX+vUR1XR9SajH2QV3mWdlPRqpY8WAkmKGHHiDMq1dLaPf3q8EVP3etzCjjfuiB2GOC+x3+Ynxk5RW+/uRGfJ208fSwQ/xeUFiobjeChPH6/MhgNx8R6p1GTIvYUIEImoRoLg30qGiL2TyoPf61X4jJ1CHIV6csQS+4l/9lheshj8paEbI7Ks43nMmocmKhMO/7I3oSzlISscmNDNhw84nUTsEy4isuz/7VqZUnLEvcV/pvxfOBC5ioQEri0bFfMUYcQV9JLgBHAvLLq+APcfGd5WG/gWUyB6yvBaXT1MqeP3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80MVolOrC1kIq5fwE9Wbt7KtU7fQQfhWlNkf6dCDonk=;
 b=oiBhJ1gpZeSNYIWI52U6QRpex0gjfMYGf97TshnD9sXoA26VKCqk9rhau3XiM8VnBXUagiT7PDpuiVKjVkMYk39bvrJM1pJek8i1zCK7TtIpt2jhYk+viko84pui9LMua9KL8PYXMnbu+2kKJGnMrjj+K8pt12bteJtr+WsUEjJsX/0yRC3vemm9wlK0U+72OwHVRO+pTSD8grrEUUcBZjXxF9UNocbuOSSxWD6Iof8PipN3jMRfVfOKBAmxg77pltZPrK0f9s38cXU3IEuFPGsyvIksS4pxKUp/DZXxBowOBkAKm3T74hMPyiLPeCkoES4M+9olZDIg5VGGNpjPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80MVolOrC1kIq5fwE9Wbt7KtU7fQQfhWlNkf6dCDonk=;
 b=EOkunJQ6oZ/l0f5ZO74rfZhlGk6LXYzKwvOof8ruPNozaRkrjTq6PFcJ3kF26gpyZgfGTZT9V8mhlIgchGFA/4fpVUOksF2EvMcyKFhJoKe5o0kw+DQzm8LD4SNS+neGuBE8YG/1wAQ8XP7OgCD+UKasY3YpOyYNRTG61ld41Fo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c570a153-e482-4a42-9af1-fe837091a156@amd.com>
Date: Tue, 10 Dec 2024 17:30:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/35] xen/console: introduce console_init_owner()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: 276c4c6a-bf0e-4194-399b-08dd196a374a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGpkREtPRUJicmFJcnJyL0VnaGU5eFJSelM2S3VSRmFJUzNhMVhGVFNLM1Z3?=
 =?utf-8?B?dXNSS3lyeXlJdlJ5NCtKNW93M3JEcm5TcHFxdWc2OVlWUlFYaHQ5bThKdm95?=
 =?utf-8?B?YnlWSXBGQ0V0c2ZHOFRJQUxzZHJVY1NxR1hVSVBsaktSbXJrcUZtSndCODhB?=
 =?utf-8?B?bS9RNlkwVUhPak9FRnRmSk1Qam1MYUsyeXZpSkFGZG1hWXFwNDh0ZlY2OUVT?=
 =?utf-8?B?UTRMc3h0YThrS21sRDF2Y2lIQzVNanBITFIvWUNKSzJKTURMSkx6MU1oZXRX?=
 =?utf-8?B?dXZPM2JRVElKajZIQTF1NElRaVB2U0kxMCt2WWFGaEcwUHkva0tRM3h1Uzdi?=
 =?utf-8?B?ckwwYWx5bVlsMnYxQ0dCQ3JsZ2xmR1FURW9wODNRNUVhNnNuc2F6NDkwVEJq?=
 =?utf-8?B?WGlsdmlqbXpmVjdVcUkwZEVsVGVNbzlyRGZHTzR4dnNwNFM0V0p5YkRFT3JY?=
 =?utf-8?B?Wm5iRzNwMlZGajBqRFQvaHAyUTNLYXpFSzF0L2FIdWRuRTh5YzFKMDVFV0Vi?=
 =?utf-8?B?cWZ3bXJKSFlhSUd5eUhEN3QzSDdTUXdzNm1TNDVEL1Mwa2RDSWg1cWJjK2Nl?=
 =?utf-8?B?VXJTeG8wOTJrenZrV3NmK0hxeFk5Q1NVTmFmejcrdW56RSttVkZ2OFZ2TklT?=
 =?utf-8?B?VzdNejJhc3F1dWwxL0k0SFlEcWlHeDlXYjlaeHJXQ0hPZyt1Z3JManorV0pV?=
 =?utf-8?B?VHZmTlk4Q0FXWnp6REczSXk1eGFHelUvMDZpM1NGMm5ZM0RwMDFzR0FRRWtp?=
 =?utf-8?B?QUdPTGl4Zk0zMnBMSzJUbkQ4MWFoVmk0aE1LZFNaY1Q2eS9Ed1YvZWVEeVJS?=
 =?utf-8?B?cVI5NndLd2VxQzFTbHNPcXFLanNTRnlmWllheHUyWmZwRGltKzkzZEc4RnFa?=
 =?utf-8?B?S0JVcVpxdkpiajFOeUJ5ZlZjRmFRNWhKZi8ySUZMb2lRWHdtSEZaUElZVi9V?=
 =?utf-8?B?WElQTmQxYi9BYlVJWHBqSWszOUxRS0ZSMWVnL1RoNjFWZVIwVWpCWkpwR1Qv?=
 =?utf-8?B?UHRLcW9NU2JGdmRRNDNYZituTkxTSWZ5NXZTZFdYUzhrTXpoTXN1WmZTcGM2?=
 =?utf-8?B?czhxZ2U1Z3FoV2hMVVV0MVZHTG02ZFhKNVF4Vm9GY1JqYXBUMXRRZ2lzem4z?=
 =?utf-8?B?aThuQmpHL3FFOU85d1pYS3Ewbm5WWUtVVHNMQVZwbVhCUVowN2RxdG9HSlhF?=
 =?utf-8?B?YmJHSVdRWDBUTUNGR3pvaUZOa0tGTGQ1Ui9zU0Z5RnZ6b0RaSmlHak15cU1t?=
 =?utf-8?B?c2l5b2Rla3J3TXJPQzQ1dVJNRkRQeWdmT2g2bFAwTWtKUVJoaStMUXFwa3pF?=
 =?utf-8?B?VlMvYjVWTW1rOUhPaEs4aDRSamI0VG5RRVpFUHU0dHh3Nmo0ZW15ZU55M3Ju?=
 =?utf-8?B?L0I4UG8xVXd4OUcycnVTVkM2YWVSK2hGODBTSnhRalVLWjBGSG8wNWdHd09w?=
 =?utf-8?B?Q08xdEFTSWxST3B5dHNKcThRakk5dVY4UzVXT0hwaGdsb0xDTkE0My94Smpk?=
 =?utf-8?B?Nmk3YjM1MVZuTE52NnhzdHlvQXpWSVA4N1F5TWhjdjBZWlEwYVJsaENYT0lB?=
 =?utf-8?B?M0hjMnBQdEtXTjM1NzNSbFJVU0l0ditMTzliakdyVFVLVmpTbjFMZndPTVZ6?=
 =?utf-8?B?YmIzK3Q4cXBpdFJnUjM4Y2dNVFpqS3QydGdUTnhZUi9GVnZJT3dFNXNYbTZU?=
 =?utf-8?B?N1JWYmtoL3F0VmJjV2NSNWhKdlJKbnVPbTRwc3BwaHhMRnN1cDJocUx0K0dQ?=
 =?utf-8?B?aFB2V2hZRk51OStzaHRIQ1VVTTlzcitJeU5SbitZaEZHZVhQbjlsYTkzTWRw?=
 =?utf-8?B?WmU1OXFZaEwvSzlTaUtwRHlWVFNwVDdRb0UzS1NTMy84dHR3WUY3RS92VHpy?=
 =?utf-8?B?U3VKTUlrTm9tRTk0VjJGdDExK1dOdFNCZ05sYU9lYnNIL2ZJSW5BMHBPY1c4?=
 =?utf-8?Q?vxB8DOfnzw3MR0/jAp+ZMdwzn9RaM/II?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:30:13.9755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276c4c6a-bf0e-4194-399b-08dd196a374a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222

On 2024-12-05 23:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_init_owner() is introduced for selecting the boot-time console owner.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

