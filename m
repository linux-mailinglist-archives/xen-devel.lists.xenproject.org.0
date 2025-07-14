Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55059B0498E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043062.1413182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnb-0005hK-Mz; Mon, 14 Jul 2025 21:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043062.1413182; Mon, 14 Jul 2025 21:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnb-0005eV-Ez; Mon, 14 Jul 2025 21:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1043062;
 Mon, 14 Jul 2025 21:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQnZ-0005dt-NJ
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:33:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 279b66d2-60fa-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 23:33:18 +0200 (CEST)
Received: from BN8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:408:c0::37)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 14 Jul
 2025 21:33:14 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::40) by BN8PR15CA0024.outlook.office365.com
 (2603:10b6:408:c0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.30 via Frontend Transport; Mon,
 14 Jul 2025 21:33:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:33:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:13 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:33:13 -0500
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
X-Inumbo-ID: 279b66d2-60fa-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwXQlBIOa/lIDFYMvyqW+fM674AHsRfhUasVpXAGIOFmE1oV/vqCdUvRyesqzCAKkm0p5luKN4abMVHRVJlDIhKgb489xmWn0y4sgjiZqgAsKFHaOp9kGAj/66Fqh8tHRngvjESxq9zdg1pX/AI3pW6dtGOt4nXkqU45K6HmWnEGW7rk34SR/aYehChTeCbTb9HGpseEtmh7tNNWZQ7sxtppTTVyLpd44+89NZ4vSfU0ikBO83nrqgNBo6qZ1PfNYmeIxVCKKV9D7ajnwSsjtxshKiSfvjVcu9Qw29Nzvfmptf3+hdH4eiKi3ZZ0iU820Y3JBigi0rFaKgzC5pOl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Hl+725fzmhGWsxhaOWtjyHUO0NiIKAclwmlUj4/NbY=;
 b=q4YGvzklwObGSFbBjX6xw7p1dTRNYuGPBu0zDdIW4H4Ntz44weU5O6GlNjcjtI2RFiEml3/MS4s8C2JZz0wtt1Myg7zZuhstQ2QF7H8tctO/dKAdSmVPjoJSRs353PksomM2qteGnI7FZOxQ9CN1yQ7NaRevz8OvIjiteSYb98enol+azD3z7OJq52mRyPH3hIonLsBmBa0DkPKo4vYC6N4YPwTkK6yqgX+ohqkrx8mupv9sHdWhsubh7TY8ZRLsZ4TJogxCSlvxXeC+61xy3EHD6z2SNYWWZeUqhxT99qqIlDWDrrdWFo3R1sWJCwrmKS94qI28ONsQKg+r4dj+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Hl+725fzmhGWsxhaOWtjyHUO0NiIKAclwmlUj4/NbY=;
 b=mTX+XUvOWIrrDn0TUIfAQJ6Mfp/4OVXNq+o9yUX9a5OzvjpHVthRFUTpksHewV8Ghdqv61DIU+rcT2c2wMFgQBklP+K+8xcdgCgUCpbl6MhbwNqcslwaTxOWeE7NVo6qlZ4gbhJNun2Nq5AEgJHtuX6LtWTrVaihBgTpUz5iZIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2bedbf0f-1263-484b-be92-a58a29166413@amd.com>
Date: Mon, 14 Jul 2025 17:22:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 14/19] 9pfs: store bepath in struct struct
 dev_9pfs
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-15-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-15-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9b573c-ce06-4638-4165-08ddc31e0a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEtMSmlnQzYvaHQ1U3dGTmZZRzE1dEp3Yk9XZWhjTE9hdWxMR2pLR0VUSHN1?=
 =?utf-8?B?MlFuakxLZFJtMXAxVi9nMXV1ZEdON1o4dzlGNUMrWWFlU3d3eGlTYUYxOVgy?=
 =?utf-8?B?aHk0enlEVHFNc0hTRUtqT1gvNVRJWnBTbkNJV0YvOFIwT0J5cVY5cVRLUi85?=
 =?utf-8?B?WldmUk9DdEhMSTFLczh6UThYTlB3elo2YjJiUlM2cWUwODhUaU5zWjVBa3F1?=
 =?utf-8?B?ZG5Ga3Q2cHlWdDM5OGw3c3NIRFlTSHdjeDFMQmpibnNRUlZXK0JvVEJKalJ4?=
 =?utf-8?B?SFBWVVplSUNra1pSZk1KdGthQ2kwbHZCekNlbGxvMXRlODUyZGY4QnBBcmZX?=
 =?utf-8?B?YVBzUitBZ1IxVlpLNVgyMW00K2NSMGQ4MGpXWXVmVDJ4alRWcHZQVW5VV1dJ?=
 =?utf-8?B?ejBqQ0dyK040VTFGYklvRTlsVUFsN21HU0FFK0E4RDVZY0NYZFRkeS9xTTVJ?=
 =?utf-8?B?c2xLaFBkSVlVbUttQktsaVhCRXc4MElzSlVPODBHa0lHVENjUzVrcEt6aGtD?=
 =?utf-8?B?V1ptYTZ1RFhQTW5uaVhkYWFDR3Q4NEkyVU9NandYaVNJVU5iVXU3UFpHbEF3?=
 =?utf-8?B?Yk42MUVnOE9Mc3VoOFcvaFR4QTY3b0xlL1ppaE5rUGRSaG14b21ObUJUbko1?=
 =?utf-8?B?alVZYjA3Z1dFd0JOYklIby9IdmowSktQMkhqeHVUR0J6cnMyY1p0RlhoT09V?=
 =?utf-8?B?R3NpbzM0eHNPREIrOVMxR3kxV2xidjZJM0t4aXBjZ1g2RzQvQ2pINjZ3WnN4?=
 =?utf-8?B?Z0RzQkxwVUdFTlpPMUhKNmJxazBXZ2VHVm1JRkwvWUVoVDhJdk5sbUh1K3kw?=
 =?utf-8?B?cGliQlJUTTljYzh6QnVvZ2FCYldMUTN4anpiNDFGa25KeEhsSnFCYWM0TTZB?=
 =?utf-8?B?QUFwQkgxNnRVYUhQSjB3YXA3TWZ4V2x0dVJmY0M2ZjFHbDVnVDAxZDV4VjR6?=
 =?utf-8?B?RERoYjA5dUlSd0Eybmh2bklTUnZuMnEzbXBURGMzNU14WlNKSHd4WURCSjg5?=
 =?utf-8?B?NC8rQUxsdzl6V1B0dk5hWGxsZ2l5TkpjYk11bmVmNUI3enFvVWd5ZkxlT0xm?=
 =?utf-8?B?ZlY2S2cvd0pxSTB6MzdEZjVFUDZZU045VWpJRUxmSyt1VWVOdW1GOXd3dXpp?=
 =?utf-8?B?NG1TbnZnQkVMSWpDUmhvRlNQN3d4ZVljcFY4NE1rbWI4cW95Vnl4UHVncTlo?=
 =?utf-8?B?cjN1SzhxVG1TTFN3cXo2NGNpUkdaTlN2d0Z4N1Myc0RBaCtNVlp0QjY3cXhQ?=
 =?utf-8?B?bUZUZ0FidGY1YlB6aWcxWGdBYUZMNGpnRmpObDNsZHAyUlBaOUx3czZabTht?=
 =?utf-8?B?YUhQanV0Q2JVeHRsK3cvcFh6ZEtQaFVKNVh4T3FlTkl5RnNKY25rb2xlc0I4?=
 =?utf-8?B?VzhnOXhjSVpUTFB4c2RHb2VJRXFoUkl3aDQ5S1drMk0ycFVuMkZxQXRSYVRI?=
 =?utf-8?B?Zy8ycGhNYklpOFBpWllXcDZieHY5T2I4cmkvY1hrWUlZU0pvMThOZnZ6NlZQ?=
 =?utf-8?B?b0xGaWxQRUVUQ0VYRTlXQzdGZjJ2aVBKMzhJTkFOckxYWDVycDJ2Y1IrSVZQ?=
 =?utf-8?B?U3Y5UGdxRW85TS9ha1VWK0dJK0ZCMXFlRVFLTFVRS2s2ZVZ6Q212NUFTbnpL?=
 =?utf-8?B?OEl0ZHV2R1VEWEtNU0NtMS9lSEkvcjUzbzZRNTd4NEt3KzZocUNkb2pidU4v?=
 =?utf-8?B?ZUhidDllckJLNndHc3MzVEl3NDliV2RrcS9haDRQVVFjUGl6ajFNNlVtVDhW?=
 =?utf-8?B?SzlJZTZtb0M4eSttYktJOUFCbG1hOXNTTnpxMGRtQnFKRExwbGJXcDB4L1pT?=
 =?utf-8?B?N2FxT2MzQXRSWU1JOVdkeTBoSDI3TUZ4R1o0ejBrbmpFUUY3eFVXWTJTSW5n?=
 =?utf-8?B?MkVCaytmckI3cXBKa09QRWxqeUd2d2VER3JGL3JhNXN4ZHg3NWxSQUZmckl2?=
 =?utf-8?B?bWpXN1loU0tPMFhrVXpiTHRMUFlBV1pZVXhSZ1dUWUJaSE95N25IbWdkSDZK?=
 =?utf-8?B?VDhCWnEvNDZMMVNpZHVCcU5TcitrcVpwbUlraFVFNTVHYVhsbmxrUSszVjND?=
 =?utf-8?Q?Sf39LQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:33:14.2287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9b573c-ce06-4638-4165-08ddc31e0a1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047

On 2025-07-02 04:12, Juergen Gross wrote:
> Use struct dev_9pfs for storing the backend path of the device state
> in order to avoid code duplication in init_9pfront() and
> shutdown_9pfront().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

