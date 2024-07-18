Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB2934E9D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 15:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760535.1170394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUReF-0001I4-RY; Thu, 18 Jul 2024 13:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760535.1170394; Thu, 18 Jul 2024 13:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUReF-0001G5-OO; Thu, 18 Jul 2024 13:58:19 +0000
Received: by outflank-mailman (input) for mailman id 760535;
 Thu, 18 Jul 2024 13:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUPn=OS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sUReE-0001Fz-MB
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 13:58:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c73269cc-450d-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 15:58:16 +0200 (CEST)
Received: from SJ2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:a03:505::11)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 13:58:12 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::7e) by SJ2PR07CA0001.outlook.office365.com
 (2603:10b6:a03:505::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Thu, 18 Jul 2024 13:58:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 13:58:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 08:58:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 08:58:09 -0500
Received: from [172.27.205.14] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 18 Jul 2024 08:58:10 -0500
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
X-Inumbo-ID: c73269cc-450d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB3FcB3ztQv3Z/InZak44Av7obhTfgHj5E3blHnJHbCPX9azcMzPjs1Sl2O8oFg4wkiCb84M5laQ7ofP14SHxJra6hZTRQyHXPcAkMfuKvuGjm+meqvoWKpcVfQoppH/w8tPjQh+KKdu/PB9UJ/h4yhw916zUYru36z2IV2Y+mMur/6G93DC+w707QSK/r2WSgfXZHdqzr2p95DS0bnrH5oaSiIZWVsq/t64beygzYVxBvjhNrbTvDrsDLNFgdBr7wQGIzIxiu5Iv/59geiAT4rwIPaSrJWXe6kz28hsbgvJTWzW7Flt31FoHK1wJAJTEvepq2bPLTuU5uPkr6HweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRUQYOIjWZVw4nyfewmVtC5A3zRH7JNfmqwRtd9cdQw=;
 b=Jqz7omKpgHBXCUlmvoLsw2XFxXoWeuXsyv/4dLJ0H+Mys8sRCXdj0K3+bh5hZkkHOYx6/Z79dP4C2PsGPNf28MeJ1hBv2OhEODax3o5wFpTD421DdU9EwBC7Gj4DsCWQmAII/OrmFW3hejA/oI1hmgmnaqLTixeIY/7GRMRs7weACKahSO563ao/N0y8OW0ic2DEqoj/JQH95V8jvNOd0fuXEaRaqtHCr2VvbjzQmM8oLoWeua/STK67aHFnEqSB+FFaBUKmaiHus7/zmhB0hoyrBQUbJ8UVFJ46ibr7YRj8OnMhM8ACHfRY2MtJLvOcoS3mxhTLguWjII32XXKaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRUQYOIjWZVw4nyfewmVtC5A3zRH7JNfmqwRtd9cdQw=;
 b=AKtRox5lnnKAZjFIx7X8JmBgramEwWO/gQsx6o41XLnwDRTcCrlpBu3dykPC5aAAE+u2r9VXksdieNnqrP9uy5MrlfQwAWHEMoGZcjI3B+F2l0YKQ+R3enPxZeGFLoHM7+5p/AsFuQoHYFTsadgmjQ2C9ExatAsXCnfiXDlHgMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2e1a5f62-d93e-4e3b-9064-78d93ff36090@amd.com>
Date: Thu, 18 Jul 2024 09:29:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: get_pat_flags() is needed only by shadow code
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e18835-ddee-407e-e13e-08dca731a988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SU1pTjVET1RxWDV2bjJnTXNQTzRzd1NwY3E3b1dhUGFSZzc3M3k5ckxhNEtX?=
 =?utf-8?B?Wm40bmZ3MUpIdGkxazJpODNRL3JYK3ZFTGJBRGRzUjJjL1ZaTWNUMzd1N1do?=
 =?utf-8?B?SmtuZU1ObVVnUGVMcUlQdjJPeGlxdjcvYTM1M3RjNUs2KzIzN29qc0hNV0Ev?=
 =?utf-8?B?cllOMnVzL2Y0dStDaXI2R08xY1I0Y0ZCWWZwb1I1NDBBUCtUdkp6VXIzY3ZI?=
 =?utf-8?B?dkpGREw2UERnQWhVSFFBTGk2dzNhV0oxUXhxOUpSNnVWUkJmOTZWeWVOTElS?=
 =?utf-8?B?V0c2QlJmd25ua09iL2FjRGNGWVVOWEdHcnRVdXEzRkNLMllZUkV6Z1orcTZa?=
 =?utf-8?B?Z1VKM2hMVzNFSkhoQ0pkQzlSU1lqeFRUSHY3UVJLSUJEam5IL3NhSXZuTEZu?=
 =?utf-8?B?Z3NVSnZDQU5BM2cyQlhlVkFUd0RlZGhuSzNCWUIyRHY0UFRKbCtjRWdBdmtV?=
 =?utf-8?B?My9Hb3hDTDJkc0x6N1RnaE45Z2xmSDRQTnZaZkZacjBZTGdSRjF1NkdRbjQ2?=
 =?utf-8?B?cjA5RUhFMDVXNXVFSC93SnBYRFdHR0t0eGNjK1lSOVBkS29GNllzeElUK29O?=
 =?utf-8?B?SC9VdE1DT25TTWZwZFo5T1hxR29EVTYvb2JDYW5YZ3A4VFlKeUNzYk9UYlZS?=
 =?utf-8?B?NVRWRXRSK1ltL0ROVGRpU1FyY0tlWENLa29xaCt6dUVldW1mZVJVN05EbzJQ?=
 =?utf-8?B?N3hscC9jVUsvRVFlaXpPNndVa1lXOEVMbmFWWlc3U0tmU3g0azRlcTlMbG9i?=
 =?utf-8?B?YkhTT1RiVlBRUm1Yemt5d0JSMjFWMjJGMjFNK2M3Y3U4WWRFYjhzQnNaVm1U?=
 =?utf-8?B?RXh1QXYzNzMxd1hsblBLWEpwalpVNWJGWXJ0eGpPUXJSOC8welhtd3ZsRTRP?=
 =?utf-8?B?Z0J3bU82TWkzNzBxdDc1bU5yZjZPN2pZN3dMRTZvckIvTmxrR1RQL3A2L2Nn?=
 =?utf-8?B?c1hZWTVyOHRhUlBIanozQ05RSFFDbE5ZYTVFTEJLSWxvVEdwMXovUXVKKzlD?=
 =?utf-8?B?SUZsU29OWWpoa0NXdFpnMmVZN1I2SXZzcDhldEZsOFd3MnBaNHhUTE85VHlS?=
 =?utf-8?B?VXJTOTJUTHB5UzJwcHJ0YTkzTWRxVTRubkNTOHFqc3YxR3lnMmdmQmdoamU5?=
 =?utf-8?B?bHRyWlhta3BTT2gvWUp6aU9pekk0YzY5UmozNm5TTy9oWjZtRW9qdWpHYTJ4?=
 =?utf-8?B?QVVJQkdabEgreXNnSEtpSkpTK3djUEdkQllVSjh1WWxRd1pxREE5N1EyVFI3?=
 =?utf-8?B?Z2hLYktFcWRpcDB1aldwTlRiZ0o3MTl2SFlQL2h5UkFBYVJiS1dobmZuVXFB?=
 =?utf-8?B?OGFyMVRReDh1bXVDTi9sWHNqSGVRNEFaaTUyenRZdzF1c2NKdkNwNDdkcjVl?=
 =?utf-8?B?d2RnaGZNdGR4ZG5KM0pZR1htTUpoK00rdWdIWHduRFVEV3h6UmJoTkZhSThl?=
 =?utf-8?B?Y0IxOWxabzZ2UmdodjMzS3loMzhmZk9ZRVNId2tmMks3QVVmc1Qxc2JLQWh6?=
 =?utf-8?B?TGNwS09KM20vbkQzK3hWL3F6cTJ5ZTllb09BUHVCTTdRK09PNTRTeFl0aExD?=
 =?utf-8?B?T3ZhNmg1clJRSTFISk4yOG02Kzc4NWFqQ3JjMStiV3MzT3FZbmtxajhCZHdn?=
 =?utf-8?B?T0dGZExqTlFMdE9uYTFYWVA1SGNvREhqTllsd0xpNi91YlIrOUg5dm5EWE5R?=
 =?utf-8?B?ZzlvVWUzWEo5RW8raU1RU0tTVDVsOGlqTW5TbmxwSm93OUhrMllnY2NFZ1lK?=
 =?utf-8?B?WVh5STd5RXBVTkprK0xWSTgxcC9oT3F0d2hrUFdzcVcxVzFLSFRmeTFwdHZN?=
 =?utf-8?B?bTNlRlAwaC9UaGpvTTZJd0V6MHlMY0h4NFppZXI4ZTRCVzVtZVQ4bCtLNzVX?=
 =?utf-8?B?Y2czS0M3c0ljRFRFazFYUGFLSWRkbnhBNWd6TllCdWozVnk5M3ZjWjBvVHEz?=
 =?utf-8?Q?JO6NRc7aft74f//EhLtdieH9e1lv2S29?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:58:11.7917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e18835-ddee-407e-e13e-08dca731a988
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

On 2024-07-18 06:10, Jan Beulich wrote:
> Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
> leaving around unreachable/dead code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

