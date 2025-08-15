Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EAB28594
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 20:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083708.1443193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umyrf-0004Mh-M4; Fri, 15 Aug 2025 18:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083708.1443193; Fri, 15 Aug 2025 18:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umyrf-0004Kf-J4; Fri, 15 Aug 2025 18:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1083708;
 Fri, 15 Aug 2025 18:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fG+3=23=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1umyre-0004KZ-9D
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 18:09:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3c9302c-7a02-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 20:09:16 +0200 (CEST)
Received: from MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7)
 by IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 18:09:11 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:23c:cafe::40) by MN2PR18CA0002.outlook.office365.com
 (2603:10b6:208:23c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 18:09:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 18:09:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 13:09:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 13:09:10 -0500
Received: from [172.31.85.68] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 13:09:09 -0500
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
X-Inumbo-ID: f3c9302c-7a02-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1chYo5XoRQRHoKg/T5sYomntK2fuyrsbrxVBawn7d3kGEbsbii45FA3VJjh5ypEbZfwYdw7u1no0EwYe+B3XQwzmSJjmc4MYSp+s1gIS4WC+rqd+XyDLveJLMlK7K+IjJc9QDAhRX2bZDaQwxsfiiHYfa4PJQmCFUnU2djKcnWNmheLVrqmgjS8MEyf85pbI3ZiUmyajT4Wkqrs8ARoaor9FWHN9I0y5iBBntc+POro7XF7OoLJmVifXfOHDwz7FUQmHcr5uGuAOtninApiCbtHqaO0gDyWUWuTylH6SMvoDa0LXdGzM/C1N572IgFwHHp1NkeOg9rVGPuzcnV1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV5AM1xXJg5EuOpbatI/2a/CMhM/mA9PACHTI4d2Jko=;
 b=xc+65O/fRkMyk7L9itWUBauSThhTJxbyHfqbm2GQYVTegi3YiJ/YPn6EASHpWVXmxn8KDgHRl0mlYJJTmcHX1Ae5LNttDbtYJX1jjNoQa929uIdOW1CjMHiTBKo7Dax6p8Xzj/sVZOu8KGvCzJBla9CnQkWcZiNVku379TVxvcyx4w4nZaFageHyZ74uRYmyMCCgEwBJ0Ji8hh5UOSUuIiTs57KLs8jaa0gFIap4k75mSSJ28wUk7QFxIp4XZF3D9ENXZvFozsVx6RnfNWyeAOyvK9TFyiKPaUwzJo+kMx/et59USy0lN8AMqprXVtDyH1o8RhjN+5rN1G8w0muE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV5AM1xXJg5EuOpbatI/2a/CMhM/mA9PACHTI4d2Jko=;
 b=BPINZFgBt7chX+qTPVu7f2nbnOVxqKQoFXmI6rN7bWtatk5KB0Hbb1lpQLGRX83k/BuD47g/ABlIGwIoYNDySTr2gve5sMgXho0lQURWm5SWzydNpNBxPK12k0eMm3Szk5JRkixrOay8oMuCdZNlvE5IPxrBrTAs4xhpDAfRfck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e6fc4718-821a-47ea-b7c5-56829fdf2bba@amd.com>
Date: Fri, 15 Aug 2025 14:09:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/vpci: purge BAR rangeset contents before use
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <Jiqian.Chen@amd.com>, <jbeulich@suse.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-2-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250814160358.95543-2-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: f2482ff7-11a3-48c6-1d68-08dddc26d620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ditvaENubTZUS2gwVDI1STk2Q2d4SkhWSjVycHJGRzViblQ5cHJCM25vWWVO?=
 =?utf-8?B?M0Vxa0ROVUhDbGdwUHlqbEM1ZmIvSHU3SjVYWVZwUXpBRytCNEp5QXFkZXdY?=
 =?utf-8?B?bUNMNUpZbkJlSHVVMEZScTB0Nld1R2lpTUFoK0Nid1cyWkhTektwVm9yN1R1?=
 =?utf-8?B?azYrMmtyejVzdWdZbEdkbUdWRjhUK3VBME43MTdlZThDS0ZJZmE2ZCs5T040?=
 =?utf-8?B?cW5jeHdjN1E1ZzhNSTN1dVVvaFRaaUJYQzNycXAxZXRqdHlHc2g0S0RDWGhG?=
 =?utf-8?B?UncveWVFWTlsbm9ONDExM0tleXk2U1QvYTF2Vnp3MHpianduRGRwS3ZsK3ZJ?=
 =?utf-8?B?Z1ZZVDhVVTlsbEdJRUxZNnh2cXJQUHBsdVhkbHZMcDFxM3M1b0lwYWhjUEdC?=
 =?utf-8?B?WlkwY3p4TTZOVHdSMDdoYi81cTdzbjljZzg0WFh6Y1kzZEhodVhXTk5zZVhq?=
 =?utf-8?B?OW44U3RleVErOXR0UUZJUkVJdlVMUnFHWWdGTlk2TTNXcWtkMHlKdGwyMUVm?=
 =?utf-8?B?VlI2bjJHVU9LMCtNK2ppT1kzTlJOWWZHSDlQaTlGd2tYMmt4b0s0K3hDaGQ2?=
 =?utf-8?B?RnZRUVR0ZmFBSDBLL3U3blBqNElkUG5EZnE0QjJRVE95eDVhVVo1WEFoWnFl?=
 =?utf-8?B?L0FKZ2tXZXgzR2oyZno2MVRzMkYzbW1QZGpJSUEzSWRZbHRqRExHeis3VWN6?=
 =?utf-8?B?NzJtSnR4azZPVGpLaXdiaXZTVEdudCtvOHcrNy96R2ZPZVpoc0RzTjdpWjdJ?=
 =?utf-8?B?TjJZWmkxZUlRU2hYTFZiTnc2L2Noc0pHUTdMUGIwaCtxUm81L0pyL0RSKzk0?=
 =?utf-8?B?SlBGM2tuMC9nU3Z0eDFWZldTTm9jeGpnZ2h2V2x6RjN4c3hMZ2pmUFI1UFE3?=
 =?utf-8?B?RVJ1T1NBZmFqM1F0Q1hSQnl5UFNUZ2FFK2NnNkxaMFhBUkFQZlV3dTVLVU53?=
 =?utf-8?B?c1EvdWpmdGYzZ1hLR1dqajNleDBVU0xYcDA0eGJjVUE2c0tYVWpsN1F4SHVJ?=
 =?utf-8?B?c3RLUktXSUloUi9HbkRra0pnUHBQVEp2U3hRbEFMcXpNMlc0UGpuSnRDa3Ft?=
 =?utf-8?B?dVJieVFKdndmRDlDaDJKWVhJR2oyZFo4UkljOFJnNFZCNHpmOEE0T2Y2RTJv?=
 =?utf-8?B?RDZWVVZVUDhzT0FhMzB0NXBlcWpiN08vR0ZTQldhNUMxakF3L1dqQmRmSDBv?=
 =?utf-8?B?WUpBT1kxY2FUUHI2WkdLRWJYckc4c2lvdmlPQzluc1Y5dWptbnQ4ckhnVDlD?=
 =?utf-8?B?Ym1TWlVxZlJ3NnF1RTZubXNLNnFrd2tUU1lPV1BUOG1kNWFBelAwQ3ZsSENY?=
 =?utf-8?B?bVB0S3AwUElUbUlqYUtpdWQyUVBqZGpzQTBkOFE2VUxIbS9GdVVpMEZpL0t6?=
 =?utf-8?B?cTBKbFlsQk5kNmxlRnZDT1JGMGVJSEtOeHJkZ3hUV0MvRklBYmhhaGhPcUZW?=
 =?utf-8?B?VTRxYnZ2OE1sT210Ym5wUDI0MThUcXhBWVhOdldnd3Z6NTRpOHAvaGN3RGJI?=
 =?utf-8?B?aXdpbmVCZGFZUUovNkVPZFJCWGZTbjZpd0ZLaXl4Q3VhYjVyY2lNT21XWmtD?=
 =?utf-8?B?a3dtWkptVENXWit5YUpIUXdiVUErU0NoQW84N3NFT2pPWUpPREJ6TWtBSDlH?=
 =?utf-8?B?SW9jdHpMR2NmUnZ1cllZQmVhbXR6b3NNSHM3YTloK1FMK0RxMFVWNDR0VWZ4?=
 =?utf-8?B?N3I5dGR3MFdRSXFaZ25PSXVvallTeWZ4Y3M0SUYzZHV4SmJMS21nTndlUjBw?=
 =?utf-8?B?TFZFWnVxSmhRemluV0xhNmtDUExZU2xreGIvWlZYMGI0YWRwNUZDaFdUYWZ1?=
 =?utf-8?B?TDR2bmV3dS9teml3b1ZtTmtvcjZBWVBveXF4bnhsNkFobDhiamxMVmdQODkr?=
 =?utf-8?B?amJWWWhYRElISlVEM20rc0FpeHhyRjdmTzc1akxjaHNsUUpjejMrSE9sRFhv?=
 =?utf-8?B?VzA5WC8zakp0QVhwL0l5ZW1EUVhqcE95QjVuREpiVHd2QnNrMDRNMVVrdGR1?=
 =?utf-8?B?VE9aS1NwVUNCN3lGc0tPZkVpNk5TYThZWmxPZ0dSUzJZRVkyRW1VZzl4Z2FR?=
 =?utf-8?Q?Lf9r2S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 18:09:11.5346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2482ff7-11a3-48c6-1d68-08dddc26d620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493

On 8/14/25 12:03, Roger Pau Monne wrote:
> It's possible for the BAR rangeset to contain stale data when used in
> modify_bars() if previous calls to modify_bars() resulted in errors.
> 
> Fix by always purging the rangeset before usage, thus getting rid of any
> previous stale data.  Remove the ASSERT that checked whether the rangeset
> was empty, it was incorrect.
> 
> Fixes: 52ebde3cfae2 ('vpci/header: program p2m with guest BAR view')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

