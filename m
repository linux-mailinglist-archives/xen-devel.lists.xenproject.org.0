Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30827A92267
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958232.1351154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RrP-0000M3-NW; Thu, 17 Apr 2025 16:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958232.1351154; Thu, 17 Apr 2025 16:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RrP-0000Iw-Ke; Thu, 17 Apr 2025 16:13:07 +0000
Received: by outflank-mailman (input) for mailman id 958232;
 Thu, 17 Apr 2025 16:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9F7A=XD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5RrN-0000Iq-RL
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:13:06 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2407::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ebea6e-1ba6-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 18:13:04 +0200 (CEST)
Received: from CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Thu, 17 Apr
 2025 16:12:59 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::2) by CH0PR03CA0290.outlook.office365.com
 (2603:10b6:610:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Thu,
 17 Apr 2025 16:12:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 16:12:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 11:12:58 -0500
Received: from [172.21.212.118] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:56 -0500
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
X-Inumbo-ID: d6ebea6e-1ba6-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXxH8asENQmsQsno65jGdwXt8kweojpOtTLZElnufBDQtJCp+fNMTLLDp0ufw0vFo6hjpbOFLQ5/THF87yP/XWH16eC4KiuKO1q8vyUbMWUl3pajEODdcUP6CY08MNEAAjXFOmKv1tBXJf/KG9AMAOT5zzLPHTLc+IISyVcfcHiMLjm60sURTzzVO3Jjk9Te+sM7bnyTTO5Be7VNM+JsvCsvoocKbQjSkksm41fF6LGmycADpFXzYiTelON7ctxRsWf1iVMJSpJw0jmgsfTgJJltCdW2BQiVtjFeMX2DcGhyWz97SjmBIl0MeTmN1f24K+fueio0h1qfCYYVoakZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Y7Cjq0egEKANiuWq1JjxDSYibc0v2kMaCvLxHjPJk=;
 b=Ho2ZATlbcqXbtPS3rq0SWxKhw9j9TPGjSTYeheVVnb+vMPtOwSz/Uq7PPsDrfVWT9kSsRpVS4eutEp1i0SKpy7ckSUieT/u1svWDVu46lfHjAnvqHovuwO5w+d6FLwD5G6Q060FzPJAyvhqrTI6pPLg3AiC2b8QICRoF6G+lytga6YUcP3Ez3IMmLHP+vIf7MXZOO6Ivk3YqF8agRk663giRAnOSxXkyKihbGwGJT64Nr9wrxC7wJngPQZbe12pEQhiFhFgTY7KjZ+rrPA0uftJ8jzwBDw1a9nlhAeuoGGFVkOoikAqu35516nrJRHL6Z1txHiMuGffA7vt+OhGZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Y7Cjq0egEKANiuWq1JjxDSYibc0v2kMaCvLxHjPJk=;
 b=LiX1kF2QjpA/WmPtFu1VhMcbRK6Rw2l0a3ANQReyNRILJdC2U7GtkXyVrNwsqSfPBQtURdo630zS5RT+tWZyU9mTvdNt7KzqK/XpTP3Zk7yBoBcXcXRX1FCw7/frQAkdA6pleeq7qJPOnJwqispUy3gz4zoamaf923j80Bz6z9Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ca5468a6-e6eb-41ab-9bc0-01bd272e58ea@amd.com>
Date: Thu, 17 Apr 2025 12:12:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update to latest Argo
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20250417145502.2565165-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250417145502.2565165-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a44c67-8f3d-45f5-87fa-08dd7dcab908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDVyUXUyUDYzNDI0VkM0VHFaMGw5cVJ0YmpMbkl4c3hOMElFRVNXYXNWeCsw?=
 =?utf-8?B?QUJIQVloQmRqdW1qZ1ZGd3QzNkYwcityN3h4YkJkd1F5QjRGUEFyQmVyY3lv?=
 =?utf-8?B?N2tGSW9zc3FtMVpKSktiWXRmRlRBSGZVc0taM05DL1grMCt1bWpsYWNOdnpn?=
 =?utf-8?B?NG8rcFZSWmM4TEF5TGdKeVpvRHQ1VldZbVU5VDBXcmd6RHJ3YWpIUjkvME9t?=
 =?utf-8?B?NGtCZENYOWVKM215TDlCbWpRYmFWZWxSeE4vVkQzVzFaTzVMM0dMbUIrSUdx?=
 =?utf-8?B?UE9ub1VENktTdkJVRDVnYW5iaGN5SEJUbXkyN2xsVmxDR0NKTWw3WlZDczU1?=
 =?utf-8?B?QldNYkU4dkxiQkk2ODdxWVp3cDZhNG1mczhPMmFWNW5tVW1WTkZ5eE9OekVu?=
 =?utf-8?B?a1BSSUVDUkdPMTdBNkZVa2R0TXp5UkpFMFVmWUNQY29iYjBFZUk5U2l4Wksz?=
 =?utf-8?B?K0ZRTGJiRE54MlBuK3drZHYybzN6MkkycmNFdExQZzJPVzhWNmdkUjN6RDcx?=
 =?utf-8?B?UmxYUWdYZXRnZHdJVkM0dGRjbSs3R1hNZjRzZUo4UVd1bVZVTGVkQnlDSm85?=
 =?utf-8?B?ZmFrWjF2emVNU21uV0thcnhiUlJNN2U0bkJoNkxJSnZEOFdrZ2VYbjB1ZGNO?=
 =?utf-8?B?SXgyRWFTZm1CZm5ySmtvZGJGQ1dtZVlIQXVpRE9uTHVmWlJTWlBzZHMyQkZP?=
 =?utf-8?B?NDl1SWpaVjVmRm1LeUh6QnBLOXNqek14YWVORHV3RkorZGhNS2hsYnJueHA2?=
 =?utf-8?B?MmJNS245R01ydTZiWnh2bmdFcFhtaUozVUgzN25rcjg1eUdBQkdLdVJXK0Yz?=
 =?utf-8?B?SlE4NDc1UFNmVnlGNDNyTTl2NGRwaksreHRueUVuRVVKS0J4NllYdXc2RUNa?=
 =?utf-8?B?azEzT2VYc1FhSjl6dFFTdnNVazhxUGJlZGVwaUNpSzM5Tm9LcmJ6STNieFVG?=
 =?utf-8?B?YVF4Qk91LzhmMFlaMmRJdjNVTDhMVHJKT2xkVHJGbDBwMHdlRGc5TklnNHR5?=
 =?utf-8?B?TnZ1eFNuUER0aEM3d2g1VzlZMFVqMnZzSTl1WFU3SERmZC8zRW10Z0FjMlRD?=
 =?utf-8?B?RUMyYnBSbXpRMnVDUHN0Z3RtdHNLUnUwTzJqYktBYXE2b1RqV2xNYzF0TGx4?=
 =?utf-8?B?S0gxOGtrUmprWGtLeFFCTEdUckpEOGpua2hLV29VbjVkcFZaT2ljUUQ5WUhs?=
 =?utf-8?B?YnIyZWZQWWQ2aWtQVDZYcnNjcGd0Q1Nvc2xGdk1PQ0l2aTFtZFdoV1FhWUdV?=
 =?utf-8?B?MUxyelpyNW1wTzFIVm9VU0gwazFVa1BtWVFSaHVoZDF6TXdJeXJ4Zmttdk1X?=
 =?utf-8?B?TFBTWHJjby9hTmRuRFpsNU92ZVpQcVJ1NFJoSGdBRGRIekpZT0gwVGIzU3h2?=
 =?utf-8?B?NWNvaEw5YXYwNy9qL3BzcDZWZ2N4eFY0T1pQU0NLRUl6UjA4VTY3dzg4VjY3?=
 =?utf-8?B?MWFSQkZKY3RtcXBGcURib2k3NjhUL1BzN3pva0ZCUGJiRG1HSStJcUV2Rysv?=
 =?utf-8?B?d0FZMjZNZ3JBdjhUQkVtNFc3WmptcGhuY2Vxa2RQY1dYY2VGTjg4SWQyTzVV?=
 =?utf-8?B?S2pKYWdQdVc2MklrUk42YTZQalNqRi80bDFmeGZTWGpVQmp4R1dPSlVMdmpY?=
 =?utf-8?B?UlRsbFFSSDJQSmE4a2NQcFlaUXpZVnpaRnJPb2FNTC9GUVR6Qkd3elAycnRk?=
 =?utf-8?B?UkZQMkZEajcyZnlMeW43TWpJZVNwUzczMStnSlg4NWNRMURNeE5Fa3Q5dFQ1?=
 =?utf-8?B?UXpIeUhQUmFHRzlrOHNQOGpBTHRVVWxYR0Y0K0xDc251NlBoYmlTbXg2T3Bz?=
 =?utf-8?B?SkxXYTJRdlNkUnRoM2VPZ2E0bWhsTmE4Y1AyTCt3SFNtVFovcVZDMWo1QlBk?=
 =?utf-8?B?dndOVHdBQWVyY2FYajU3MUJXWlc1VVNZbnVhS1R3cEZXTVBtN0dndm1JMUQ4?=
 =?utf-8?B?R2FQb3BwSWtIeXphZ2p2d0trN2hYekN3R20yU2VTc2xtTCtUak9nOWwvZkVo?=
 =?utf-8?B?TmMzTE5YVUI0SGZ3cGtnRE8xRGFMODY3LzRnMnlKemthTEdhM29sZHZIcktJ?=
 =?utf-8?B?S0xWZDFuVXlmSFV0aXZUZmYvdmxVaGtXRUc5dz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:12:59.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a44c67-8f3d-45f5-87fa-08dd7dcab908
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

On 2025-04-17 10:55, Andrew Cooper wrote:
> The bugfixes I submitted during commit 36500bcb5e24 ("Overhaul how Argo is
> built and packged") have now been merged.
> 
> Update the version used, and drop the -Wno-error workaround.
> 
> Link: https://github.com/OpenXT/linux-xen-argo/pull/21
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

