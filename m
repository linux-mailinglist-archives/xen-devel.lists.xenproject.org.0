Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA819935BC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812308.1225034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsBt-0001cB-QM; Mon, 07 Oct 2024 18:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812308.1225034; Mon, 07 Oct 2024 18:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsBt-0001ae-NR; Mon, 07 Oct 2024 18:10:41 +0000
Received: by outflank-mailman (input) for mailman id 812308;
 Mon, 07 Oct 2024 18:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxsBs-00082f-7j
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:10:40 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20603.outbound.protection.outlook.com
 [2a01:111:f403:2408::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74b695fc-84d7-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 20:10:39 +0200 (CEST)
Received: from CH0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:610:119::32)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 18:10:34 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::a7) by CH0PR03CA0363.outlook.office365.com
 (2603:10b6:610:119::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 18:10:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:10:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:10:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:10:32 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 13:10:32 -0500
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
X-Inumbo-ID: 74b695fc-84d7-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuVzakuSn4hu2oZIXOWzHklCBrYJVAlMwsX11qqMLmMC1cdolYz1BU11/opuPKvD8gKweJV/Sa1GPlVg1EcAk3XcVsrxdb6XLjKTlPPuHtYOVxh6H35BXVCgVRiqLHNb8kAb7HOLdRNODeJlO97C/9mXWEon94okVzQ8VXLZ85b219IPRrUTm1fGbY0okmhV2DbetOMx1bjR4mpds6ej/rJ/ASjpgylbfkL/Q6wbOUjj4amp/Bjb39hU/XYJ6iTHg9v6B90CeU1qhy7QcfFXFxRINAksx8OCM5tYYmlki19iwB804KfGzANWJx6Br+0tTIs5HDiHh+Ar3PTRKbR/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smoP3l9YB8H0TfxpKvwRtrRrABEM9KvXZ7q4KOvTKtU=;
 b=k1sUwqRY5BL6itbV/PEraBKhAacecXf0O/xxcSdUnf2q+gmZUuOqMBFUMSBJiK2jRrp0EckRuWYbODoH8LxIgd5JQVEIUJs4JLdStTiP0oxMbfM1Egqc7o0LuBzu/2D3imiqrDrrfp8sQr3hRvgbI9VplorixZknPxkdH+ej/Cj1xLq8BQT1Ld99DGebD/eBzaEWaqD0XBbw5vKFrRnPUiV/vCQXuuONRerDLdICXVP2pA2xlygW+KLkeQgB7SLd1nrACznhKvvpHbnCJDUHF5V622cuuflrPXMGvU58uWG3dcgd0pMlVNP5tOhK699ccfl2amy5xCJa1GI4r+UABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smoP3l9YB8H0TfxpKvwRtrRrABEM9KvXZ7q4KOvTKtU=;
 b=ykm4MkM5N2Ia0SSNoQTo9XHgh2iyI2P3IhRcfiCccYWLDCIvjqey8kjBxCLEFkejdqzi/KyT/AOf5ondO3bsqDpUwOm58NJ+zRAFN113Y8i3Se9PCt4ukP7+lN48C277zWcwLtJBv4OC28ing70ly6Pje5c9eqU1UPcaNuc/FsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f95ffdf0-be7a-429f-962a-cf53123f875b@amd.com>
Date: Mon, 7 Oct 2024 14:10:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/44] x86/boot: move mmap info to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-5-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: ec10083f-4e36-4c59-be83-08dce6fb5689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW91N1JJWE0xeGdiUmFpVzBvMU5KNXhHd295dW1rZDY3VEdXaGVUVDc2WUE3?=
 =?utf-8?B?RFhhMEVJRWVuZyt6RjFOODBLYnVyR1QvVXdnUXhJVnFaZTBlTlBtZmJma1hY?=
 =?utf-8?B?NElKa0srWjlQcnRUc3ZCQUJDdTJKVkxjRXFpREd0WHpPUllCOVFXN1lRZEpt?=
 =?utf-8?B?eE9mQzU5WUlaSG1TeFNnMjFUTHN6alZEOU9PSzJvbWd0QTlyVDFydnZqR3dt?=
 =?utf-8?B?RUZsWEgyWDZjNkp6WHEwSkZJdi9KOUlrN2VqbHZxbmowdlVkdVhIc2h5bFVS?=
 =?utf-8?B?K2dVMVdFdU5XcDFYSjVaZGs5L0Q3WmZ0M0V3ZlF1VW9DbUZMaDk2UC9KYmt4?=
 =?utf-8?B?c3MwMm1ZdVg5TUJCbTVJeVY3eXE3bi9qdk1ZTkZzMUkzemhqcXJZT21rVy9P?=
 =?utf-8?B?WW5GNGwxMVdXU3FoL0lGK0V4L2tuVnh2U2RhOHFKa1Y5ODZYMjllVkpMUTJw?=
 =?utf-8?B?cnlGTnZucmcreW5vK2Rpa3NuR1JpMnE1SVVkd3BteTNGZTREVGF5ZXBMVGVP?=
 =?utf-8?B?N3cyQU9xT0txK1U2cEpiRk9OQnoyT0ZBV2FMWkZnS1hYdU5zNUVEUmo4VlB3?=
 =?utf-8?B?TmYwRGp2SjRrR1RDKzdidTJtT1RvNlpSbnpYMTZQTCswZVlQZXIyVlViUmlP?=
 =?utf-8?B?b3BiNDRkaXJIVmxEWE55NE5xVWpYMzk5RFhlM2pwOGlDUXVGTnFkY24rMHdE?=
 =?utf-8?B?aEllUkpnekdEaGJNMjFOV3FUVVRGV1o2OURZN1JnTHpTbjFTbUkrdk4rY3Nq?=
 =?utf-8?B?UTl0aFNZTUwvRHdvdDArN0M1ZjB1K1Vxd2xzWWVEaXZSTGNBeGsweG1FcURj?=
 =?utf-8?B?RjU4ME5LR25JMzkwQ0R2WTFmb1hHWms3d2U5NHcrTjAybHc1dGdJWFEvWlkv?=
 =?utf-8?B?T2VrS2U2VlNZVjZyUjdZTFlRMUIyT2QraTZtckxHUk5YWUxXOUFuSmN4ZTc1?=
 =?utf-8?B?bUY1eHhydFFXMjVtSVFMRjlYVFAybjYxUmt5VUFkT05KSWw1ajN6bGNQT0ZL?=
 =?utf-8?B?ek5ZZEpVMHllc3RlK2MvcFd5TDNHVEQ5bEk3TDUxNkJtZVpJZEhRYVJhbUdE?=
 =?utf-8?B?RXpiR0hweEZYZnFLaTA3MVRxQVhwVW0vMmpYNWE5UXB6OGtqLzNOUEdqN0dy?=
 =?utf-8?B?Vm5OSDNoWHpJRGRBcFBuK1grcDBCbnBHME84YmtFcXZMS1UzRlN6THJZaDNo?=
 =?utf-8?B?TytuRzZ1NmdrS3Z5SytSZUVXdVREZ1Y0TlIzb2I4VVJUa0p5NXJ2V1ZYZDhx?=
 =?utf-8?B?dm5PN1lhV2pZNGdldFBneDVQbVU5TzBFa29YekY0UFpLU2psM1dJYy9VRGhl?=
 =?utf-8?B?bi9CcmxwbXJBbmxEclJuRWJ6aENIYjEvdXhodHNCT0RnZVFTR20zbVdlaFJF?=
 =?utf-8?B?UVphaUN1MEhlTE9qalFSWE1EUWdMQk1FQXM4VFA5ZTFMNVF4RWdPaEtGdjVY?=
 =?utf-8?B?YXlBWm9qS2l6cHlSUmRsTEpzMVZaWWN1ZWVWRkVMOWczYTZPTmFEckUyc2xR?=
 =?utf-8?B?U2g1NjMySzdydUVnWE41T051TFdpMEhCNkNvYzdlVjJZN0V5VHYrSjlLUCtj?=
 =?utf-8?B?UGVCZDJzMExoOWZrRmcyb0tSTWhaUDNCdHZPSkhzeHRnTHc4cnNQY2tsNDNR?=
 =?utf-8?B?ZGlqZkFRNkFGelNOQnBWZ0VrbXFWandnTFZ0SFZVTENkMWpJSHdIeWRCMUh4?=
 =?utf-8?B?dzFBcUlqS3NOUzh4RXVncWFUTEVUV2tqYi9BWjNaRVlBYW11eXFGTzNad0dV?=
 =?utf-8?B?RnB6cXF3eVh2OEZjUVRuSDZkZm8rQy92Si9LMHY3L0Z2OU55eGhJa0dOdjAx?=
 =?utf-8?B?NGFnT3RhY2V6UmliMWQwWTViQWdMckd0aE00enF1T2V0S0JnYVZzRDJXdW1Z?=
 =?utf-8?Q?o1gVC+H4aeXWS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:10:34.1409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec10083f-4e36-4c59-be83-08dce6fb5689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Transition the memory map info to be held in struct boot_info.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

