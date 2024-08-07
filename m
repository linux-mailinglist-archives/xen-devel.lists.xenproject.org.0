Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436894A8C5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773490.1183924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbgtw-00045m-AF; Wed, 07 Aug 2024 13:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773490.1183924; Wed, 07 Aug 2024 13:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbgtw-00043n-6P; Wed, 07 Aug 2024 13:40:28 +0000
Received: by outflank-mailman (input) for mailman id 773490;
 Wed, 07 Aug 2024 13:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlkY=PG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sbgtu-00043g-Sv
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:40:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 991764d3-54c2-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 15:40:25 +0200 (CEST)
Received: from BYAPR06CA0064.namprd06.prod.outlook.com (2603:10b6:a03:14b::41)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 7 Aug
 2024 13:40:18 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::16) by BYAPR06CA0064.outlook.office365.com
 (2603:10b6:a03:14b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Wed, 7 Aug 2024 13:40:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 13:40:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 08:40:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 08:40:16 -0500
Received: from [172.24.53.91] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 08:40:16 -0500
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
X-Inumbo-ID: 991764d3-54c2-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/dQSxfXwMJhZG+3RaJ6mOOMnslrf1n3Zmq/Pl5DksX+kIlRxlQDCYspKbGSjE1Pp3B0hwBVs2oQJw24AKCDUIIkwKDZu0qpc5LQ9d9TM2pPgk6YA8ri/Ovznjrx/3FyEtJId5jCki895yhjKVurZPthHCK93EvcQ2JbvfFkgC5uldg/TXWr9CBO4PEqTQMFVMnd0Cce24bk+hGl8Jsmyds2o/P/H9aP9khvDNVlsglG0qhDPbjn/oz2vTsgKoOzM+54KbmI2+W/r4qRc5KXrUp34JsEQTA3jXgAMj1JrOBx9fSTdOT0qAOHdiiGF9FG1TT8SATFhXrUS06be3RHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQACBxpLx/CTvpuGh/6cQ1UFrJR4k4WszKJBVkwALMU=;
 b=hMQR88RJpphpJoY03WtCmziPVDYOiCXSHDmh4TgvWxCxf1eb4wYjq1s5oJktC8IcTQwKsdzjSjip+8SlboowwQbCQO4+ztNmsujdD+75/C91KWlzADvvf6pR0VGRdXs/i/nJTdelQswbfn/XJ0V0NNm5wAv8u0Kwq8kwIMtVpzMAZDpZ+MkCM/4fxmAJKt6+V1gL+0IjwdjMNc0I9NqLbXLVPLOBxK4z3eDl9kaVEGYRVC0dcea5EVSGRk0SordomjhBG/2Pu9QRMsyMB4m02DnW3oL/+/dswRqeZGSBqj5L1mk+k7pfrAz+annzXXH8rSI8r1NCpHMOP/1QdPZ6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQACBxpLx/CTvpuGh/6cQ1UFrJR4k4WszKJBVkwALMU=;
 b=LLZODVyoFdAvjZ9Mi0mvDriqcpzfKkK8mhTwATXQPE0ARE3bcNiXvxAkstomy1xoaiz5vtQw/no1Yz6eeHo1usXC8FeffpzET3zB6vtCbaEAfZ3TVgqNe8CqIvcMlKlO4viNbdMc/FIO2e1f0v+Pfb1S7YtqDIwiNKBTIP+Se6k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <de6ecf5f-8c82-4583-aa5d-f81505c01969@amd.com>
Date: Wed, 7 Aug 2024 09:40:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl/disk: avoid aliasing of abs()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: d53de4ad-7411-4bbf-a36d-08dcb6e679b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yjk0U2tBd0FhVm1ZWkRZS0xINU04amo2b3FBRkljR2NKOUZiVWJic1dxOUFN?=
 =?utf-8?B?UEk5bHBGdTRSdFUzcXptR3NCaXlBWjl4SnZXajY4YlJXSGdzc1VFVGp6bHBo?=
 =?utf-8?B?c2xMK3crTjVlRHNBNC9VVWxaWnMyY1BVR2dTWStyTTFGZEo3WmdKSFN4Vko3?=
 =?utf-8?B?U3RHOTQxM3JKTHZvcVJsRDdNK2ZjNzhveHlrT2ZVWmI5SHFodjRRaVI1bEtP?=
 =?utf-8?B?NW5RSnBKMXIvd1p6UkV1a0pmRm9BTlQ1TjZFdW5QM05iajJPU2dUNHBNT3Js?=
 =?utf-8?B?Ty90TTZ6akliVVA1RVhGOGNMeEM4YlV6UUQ5STBCcTFRZTRFNlFKeEVPMnQy?=
 =?utf-8?B?am94bVRxckFlS2VWTXlFOU9OajJscUlyY2JPQ1NuaCsySTlpMGxwdVhheWM3?=
 =?utf-8?B?V3h4aXZDUjRiaXVkN0FVYk83SkxveEEvY0VBQ0tNREo4R1EyZTF6QzdCWkJJ?=
 =?utf-8?B?UnYxTG9JTjJ5cm1YQTZTNW5wbkdRNVBja1hvekVrdXB5Ri9wY2lyMU9PcFJi?=
 =?utf-8?B?OXR4MzJtUGVTQjlQLzlOQXd6cUtoUFg2ZmFzVmlObHFGaW00Tnc4Wk9uaWtu?=
 =?utf-8?B?K25scHJkU1JMTDJmYTF3L0c4WFl5NmZDM3dFZWhMYjV1RHMvNzZUQ2tFY3I2?=
 =?utf-8?B?cXFrakpmVm11OVBqem9IMDhUWnczZjVwVjhaWS9vd2Z5bXMvTG1mUXg0c3Bi?=
 =?utf-8?B?RG5ucmp3MlArdDlNQWRMQ1d5dnFFbkJ4aFhONVBLRFczNGtlQm9NbmdWeGhw?=
 =?utf-8?B?eDQyYjVVRzVNM3Bpb3RvcVJ2b2EwTVRQcDFoSlFxblVwWDhUZURYcFhSb21j?=
 =?utf-8?B?Y2NZNy9hUkZ5SFZnVjl5V2JLQi9CVGszcUpqdWMzNFR5dTJ4ZkVPQWsrWC9D?=
 =?utf-8?B?U2Zta2l4R01hMDhEdGp3aEFXTElqYWJFaHAyejl3MHN4OUFWTGNJWStvQXJk?=
 =?utf-8?B?SldDWlF5amh3d1k0azUxcnJKOTlKMXdYY3RxUzV1bndEWmVWcmtOMHIySXBM?=
 =?utf-8?B?R1VGNEMwU1pkenBQY0xQOVVIUHVnVGJnVUpMY2VCVllORmIvdlRack12VFN4?=
 =?utf-8?B?NjF5QWpzRzd2bUtuNnkxOHdteWNHTVlSUGJoOG5qRTZ5S1J1QS8xMEx4MXQ2?=
 =?utf-8?B?YkFsYUlCdTRTVHNhelhzSlpPblNWZ2RrV01vKzQrYXBZSTU1YzA5VUk0eE13?=
 =?utf-8?B?dEVQeThUU2dWa0NNVnJmRVlUWWRJNFp5SFNmZ2xQTkpzWGJLZExibjZJa0Fr?=
 =?utf-8?B?KzczL0pBeXI4TXA2eFdmOEZEa1pZOGF1dU8wcFg5K3pCVEJ3Z25VSUdzcFZl?=
 =?utf-8?B?cmJoUStNT255eUhMVnBWMVJ1bzk0NUhna0R6NkZFbnAxUVFWVENYWE5RNUp2?=
 =?utf-8?B?b2NSY3ZJb0orSXdWZ28rVTRTM0dDcmdPK1M3WlN6Y09OaXE3V2FGbE1DdGxx?=
 =?utf-8?B?b01wa2tJRWhRNlBIeEhMQWxONmprc2E3cEQxQ2RVUU1haFlPSE9xRHhHTkcw?=
 =?utf-8?B?ZU9YeE1VQTNRUUFOUC9rLzlmbGRmWlpoUTFQeUNKU0h5eFFnMnR6Sk4rNTFF?=
 =?utf-8?B?Qk1laVZxMVJ1WTdyTDI2dHNtN09qNk02TXRNcDJyMU44YU5BY3RNNlRIY1I1?=
 =?utf-8?B?UmNaeGV5SmpMVWw4NjdrdVNRaEZSS3YxT0QzV05lNGNFdS9tVDlpcUxIZ2xS?=
 =?utf-8?B?UkhmN054Qmk5dFV0RVRHdVZnWkw4eUpDbUNHWlI1L3VYd0Y0WXZzTWU5ZGFY?=
 =?utf-8?B?VVc5dHZ5QjJsNmJWNEtJbExDckR2Z1czbE1xc21Ob1pKL3JQcUE4RldnWXl0?=
 =?utf-8?B?N2xhQlVyU3liT1Q2UzVLNjRvU2wyS1hQU2tBOFptcXZvWlNmVEtOL1Q4MnM0?=
 =?utf-8?B?Y3J2ZW9uZmx1T25vRTRmQTJKVStEbVhMcFc1Zis3L0lGZXhtNzVRbjlEWjQr?=
 =?utf-8?Q?VWhl9mWSpbDR8Idddjnl6qAQ3hzy74Zp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 13:40:17.8754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53de4ad-7411-4bbf-a36d-08dcb6e679b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254

On 2024-08-06 04:40, Jan Beulich wrote:
> Tool chains with -Wshadow enabled by default won't like the function
> parameter name "abs", for aliasing stdlib.h's abs(). Rename the
> parameter to what other similar functions use.
> 
> Fixes: a18b50614d97 ("libxl: Enable stubdom cdrom changing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

