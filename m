Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404E993587
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 19:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812273.1225014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxs0c-0001yE-HR; Mon, 07 Oct 2024 17:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812273.1225014; Mon, 07 Oct 2024 17:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxs0c-0001vW-Dq; Mon, 07 Oct 2024 17:59:02 +0000
Received: by outflank-mailman (input) for mailman id 812273;
 Mon, 07 Oct 2024 17:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxs0b-0001uV-GD
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 17:59:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2412::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3d61516-84d5-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 19:59:00 +0200 (CEST)
Received: from BY3PR10CA0003.namprd10.prod.outlook.com (2603:10b6:a03:255::8)
 by SA0PR12MB7001.namprd12.prod.outlook.com (2603:10b6:806:2c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 17:58:56 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::1f) by BY3PR10CA0003.outlook.office365.com
 (2603:10b6:a03:255::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 17:58:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 17:58:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 12:58:52 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 12:58:52 -0500
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
X-Inumbo-ID: d3d61516-84d5-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgDnz3wA6edyi3g3JLKJcxN88j3C3WQyHySJOZ2hSwYKhq3ZPAkw2iAK04OM5h6/Ooi3AF3mItpDCS41FtQVlJC55TEDF8YwJuQMtarAkMjrcK5gaOBpAw4UiRvY0EswOR2dZr+ayyAL4PS3U1WPt16Skh8MG7VGDlQ2u8ZrRy0mgli6izqgnXJ5cgqdPgW0JuOVUc8lg/5ga85+XbVwSotbHks2PTSMHGtLYRTWZQwKUfFxH7TLTMnl4ISxYkzOZc+ImayTava4HKK6KGtbvdrH+S0oQRiQWycY8QR2U71LshAOXDOgxtPr9XmNN4zYx0x/9qx2864/uqaCsC0H2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv+L8aNm3U+yVokkrRUJQwY1q1ikJirwZcpw4sLl2TA=;
 b=NfIcm5YhhzyIywfPGwzsOmlRBevaaQM3tMKbhUxzWXAFfD2uXD4GNFaThdWRRjyiVUkXhhCUVZJWgrbKPql9Ht3H/nuBnjZ8HAddRRVYolIfbqyaKzeaT8l+WgcDjbuiBFnFATqyNwTCaV89VgiCgRN8lTMBos9J22edFTtOeDnE6OZapZBmPxa0SQhDO1iumB63hRpzMPrskJQmbAe0/dbDCpd4538d22YBRXQyrIex5GtGeOcVPfqgMf65nD2LtPoxX8Tw/dYBOvLQQR5YMTBwSvp1VldT60ianZloIWoaxsOSk8uyjKR4l//STTke89UxMKQJT8RyOT6jp7apEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv+L8aNm3U+yVokkrRUJQwY1q1ikJirwZcpw4sLl2TA=;
 b=rmikQTjzCbhPbTT/e26LamUCZzAC6gWNyomacLgFqvoMQKv2C8cqQo4MHFy0chdtpD7tjB98RKw5L3lHU2PYlPib3mV//W/rVLTgTE6YtxUu4C01lSRvdZf0xxAAc5PyN//lvqQwVVaXvw5okuKCbOLtaKYZknV7ZFWzfdBLbp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7e9fcf80-7951-4111-92cf-b59db62aabad@amd.com>
Date: Mon, 7 Oct 2024 13:58:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/44] x86/boot: move boot loader name to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-3-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SA0PR12MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: de1d6ab2-ac1c-46b4-32d6-08dce6f9b4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlBxcDhWZmlCSWlhVjlDbWEyM3Y2VG52eGhKK0JHbE9Nb09BZURiYUhJUHlm?=
 =?utf-8?B?UWd5NURoREduOUlEUHhYUWIyNUlUTnpCZnlySEVPbUhSUmZ2dzNZSi9aVUVT?=
 =?utf-8?B?aXdhNHNqSzZiSzFqOTRpT05tMzJoS09PT1dsRWRwaVhsSEM2VXFQMGFPWFBK?=
 =?utf-8?B?bVdybzk5dnU1VHJ1NkpPajk3V1ZrUWtEcW9kMXBCaVdHbzhQL0FWclMvekhk?=
 =?utf-8?B?Ny9hUmozVFJNZElFN1ZqUjVEbzFWT1VOaE1nM0k3QXRicmdNN2dRODh3SzJ1?=
 =?utf-8?B?ZlBPNjY1eVhlcWVqc0IyMzlTMmF5c1BIdzNBSFV5ZXNKL1ZBZHJJY2VNNmp0?=
 =?utf-8?B?aUxsTzJWNEdWRFk4RGxQeHRKdVk5TnhPa3ZuM3J5K2ExUHJMeEhHcTZVNnJ0?=
 =?utf-8?B?R2U3RTlwNFBQa1p3Z1RMSnpBWjRBbytxeWptMFc1ZGNXZjhsRUM4Z1RhR3Ja?=
 =?utf-8?B?a3BwYTdlNFJWODlPL2FQWElLU29Ed0padGZpRmtmVXo1eDRLdkV1ZS9MUk9a?=
 =?utf-8?B?Q1pGMFVxb0NxeDF5eEJ2Q25PM1lVcXExdUlSR1pxcFVQSVNLRk0ranRSMnhw?=
 =?utf-8?B?ekZ0M3FCZ0xHRUFCYll4QUV3VHN3MDU4dmhCM29nampmcyt1N0tpbU92bVdp?=
 =?utf-8?B?UjZnYm9wVUhKVFZlN3ZhNFBDd0VwK1cxbERaeERjT3ltNjkwZUZLYklCSlk0?=
 =?utf-8?B?MVltRjl6NlFRZzBreDllQklGRWFQTHJ3TjRxR2UvMkp2dzcrRElWMVhsOXVU?=
 =?utf-8?B?TzVtRHBTeVZoWUtleklkQzlmTmVwQ1N5RlI1ZDFXS05jMzlJMUxEVkdXNi8w?=
 =?utf-8?B?N0FLZjFRKzgrVDM2UzJKODhZUVp4dUlxMjdLR01sR0xieTZrejJVUTAwaVdW?=
 =?utf-8?B?U25vZXcxSk5ycmp6aXFPNExsb0crQ21sdDN0eWFBUDR1cEpUdXZvb3RyalRw?=
 =?utf-8?B?UGdZUDBJNWF2MXZjT2ZVNDFRK0FVREt3MUVsNHkzWXlDdExmWDA0TzUyS0Vr?=
 =?utf-8?B?TjdKL3pUVkwybEVBaVpKT1FiV3l2Rk56YjlvclMyR1RWWVY0NnVIaW85VTFw?=
 =?utf-8?B?MXBaVGN6ZXhwZVVmdS9oMGk5enUxNGN2Nnp5Y0k3Q3ZqWXgxZHkvTHRPaHla?=
 =?utf-8?B?ZjVTYWQyM2tzcU1MbENDS1ViUS9WUXlhTkdoTXpKWVMreFFnOXREcm9hNmtr?=
 =?utf-8?B?WVlEWkpDbmFvbDJrZWg2N0tMZW1sNnlQRlZxUnRaQ2YvUlhabkVUNGJvZ3Jh?=
 =?utf-8?B?WlJWQktuUUZQQXRPakZQZUJEZ2ZzUkEvb0ZUYnRVc0thcDFTSFhmcWtiUVBH?=
 =?utf-8?B?TlJLZGgyWXZSbWJCb2JkUzBhZEppSENkNisyZ1JzWjN2bXFKM0h2UVZERmZB?=
 =?utf-8?B?M1lSRjFoaWxva0F5MkFaVVpmdXg5M2lTZ1dhc0t2SG1FUzdFWUR4OXhrb3RQ?=
 =?utf-8?B?eDRaQmFYaUIrOHI3d215aThlaW1NZStCRnRaRm1oaUpCckZVclptOUoxaHBM?=
 =?utf-8?B?QnN2R0FUVkY1dmwxdmx2d3lDY0MyRjM0c1REc0VVRWRrVGpHNlNsZ3hkUDZx?=
 =?utf-8?B?WHV6cWxyanB3UWhEVjFVMHRrWmhtWXNMbzdLNkhlTnhsTFRBVVFjOFB5cmRS?=
 =?utf-8?B?TE1rQkpRWW9qd0djVTlVL0Z0N2RoNGEzdktuUEJjOXFxVXZmamw1MGY2enRV?=
 =?utf-8?B?UndUWU1VS3Z6RkIxbUEvUXRWRWlqNlJtRWZCQVgxUlUySmp5S2ZHWDZWdU5l?=
 =?utf-8?B?aTFKR2dGM1RxdGp6K1hUNXpMWmNveG5NOGQ5ZDRjTFk4TkcrQWJjcEIwUjJt?=
 =?utf-8?B?a053SS9LZ0lGVWZobkErTkt4eDh4ZXZJWVpEYWlOby90NnVuNVFTZ0ozUDM4?=
 =?utf-8?Q?I8m8eGF+9+oCz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 17:58:53.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1d6ab2-ac1c-46b4-32d6-08dce6f9b4ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7001

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Transition the incoming boot loader name to be held in struct boot_info.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

