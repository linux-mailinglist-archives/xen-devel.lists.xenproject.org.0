Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C47A5E2F8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910617.1317286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQ9X-00069o-MD; Wed, 12 Mar 2025 17:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910617.1317286; Wed, 12 Mar 2025 17:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQ9X-00067m-JO; Wed, 12 Mar 2025 17:45:59 +0000
Received: by outflank-mailman (input) for mailman id 910617;
 Wed, 12 Mar 2025 17:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRiM=V7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tsQ9V-00067g-Pb
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:45:57 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79dd3ba-ff69-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 18:45:53 +0100 (CET)
Received: from SA1PR03CA0007.namprd03.prod.outlook.com (2603:10b6:806:2d3::16)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 17:45:46 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::91) by SA1PR03CA0007.outlook.office365.com
 (2603:10b6:806:2d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 17:45:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 17:45:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 12:45:45 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Mar 2025 12:45:45 -0500
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
X-Inumbo-ID: d79dd3ba-ff69-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkrY7C6gKOPLoXGBQkUCZ880CrL4lJky+P0o33Ad89O01/dliY7oVt/vQSONUVEYG6IA7Nm7UbvDBzfVB75fj5mXhE/LH6v8Q2rnNtYq35iGpL+4FGSPMPUc8ezA63Ycr9V9aq0MQPI+E/+FSBoqjLZuS7bo5QUBjg3IBUZAr7JGml6ninuULEC7WDCH3ndePGDY9JNQWSj/4mS0a8AFc8Q3jLyzzNZPGpmpVtFtlXgn12Cx3PbR9hu7ZmZicLLPqhCRK2JH/nlshpwwVCJuDRG4RWZdDSo8WQpCx9sF2hyyUeomq9DPAT2FWZLe1pn+/luN/vy/Ba+TQnJPv5Aw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgeyPPPmA/xoBDVFuDRcd8VsuEmxho2n2Q/ZPikOtEE=;
 b=BtxNoTLRQGnWMOFydtF4l3utlQGSRqzmm159w1DlJDEKr3LRXwbnYW6HUJd/b3GY6THxP+FN2DDFw/CirH96YbSlHJbt89JPIx4uSAECeMmMZeeSjTAq56SNQ34dEX0UEQS8ApVgANgJZNaoTUWl7VsXwlSP6MvDcedP+kPDFQd1SRGLQfESk2ikNk8zzoysV9OlkjgnSBHXsXjN8MsE39FrTETrPkm4RyHhx0n91JHHzdDV4mw1OiFDKJzYnKjvNflQzpr+LOCSd4gK1KJzXW3Z+v8+7mJUJqVKVD+LSyewYYmaZcqHoNNnKEL3nerKFQiFabgoxu+Mj08koGoz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgeyPPPmA/xoBDVFuDRcd8VsuEmxho2n2Q/ZPikOtEE=;
 b=VdYj+H6ACqaQIgTrYWENPadk+b7pW2HEZ5H+sVDj4ZwIiQgigBw2Mqn/8zOevaca/Lq8rbnjUhmunZ/lfNKLbCCRk+mN9yJl9lORRlr7h+Ed+EjPh4FCp82tDPD9vw/e+UA5Ozb1xtwxfgnKMB6WN8qzbEzrtkqsESDjUD75TJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <11885cfa-42be-42d2-821c-ebb8db304340@amd.com>
Date: Wed, 12 Mar 2025 13:45:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] tools/xenstored: use
 xenmanage_poll_changed_domain()
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-10-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250204113407.16839-10-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec5524c-6f71-475f-1036-08dd618db86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjgrbUE2Y2N6T2V5WXM3eHBJSC9BYTZYNm9WcERjYUlaaXFZN1YxZzdGVW5M?=
 =?utf-8?B?TCtxQnRWYUtlTUxUamhWMHJHY1JGUjJhMnFCTk1HQ1haZXR5RWUzMnBDb1NX?=
 =?utf-8?B?QUhVbUpNb2ZyWTF0MjhsSFZRblJWMDZQWGdEWDkzQzBmY3hTMDdYeFJvcEJB?=
 =?utf-8?B?ZTJCK0VxenV0VUZ3MmdLWTRTcWRheWE3VEFlNnZrampEOFBwcG0yOGpJdzdL?=
 =?utf-8?B?RENHWHdhMnRGeGp2cFZweTZ6Y2RObzNadk1mZFJRTHZLbTgwNjZBNmg3ajdr?=
 =?utf-8?B?QU5NRGNXNm5YSmVzL0ZPUGN1MjBZVTJSV0xpR2Z0Z0tDOWFuQkIwZzNsdHRz?=
 =?utf-8?B?MWMrbnMrdHhpcWxSbkxqWCt3cFl6aGJkdXZ6RGptRWhhdXNNdm84YnNOZ3NX?=
 =?utf-8?B?emk0SEUrTWJFL1ZlNTAydzU3N1MxcnNDRFN4eEpIbFk2T2ZZMFFwejRGRmRk?=
 =?utf-8?B?SC9nVmdiMm1EV21aQjJvQmQrVmxFMzZMZU9yT05JR2VZcDN1SVkzcUpCY2pt?=
 =?utf-8?B?dnUwZllmU2l1cmVYSVlRY0tzQjFtS080UlRUanNuRGI2bnZEVUxscFJWQk5T?=
 =?utf-8?B?Y2piTng2KzNXTnJra0w5SjlibVpFRE9XVzErb0Z4dmUrL0VEL1ROT3BGRHhr?=
 =?utf-8?B?b1VmQWZ5OTEvTWR4T2hvc1RSUWZ4OHpuZDJLTlBsWUErbGNsaTMrSlRuUmFO?=
 =?utf-8?B?eGkvVVM3bUhabUZHY2p4dG4rcWJ3Z2RZaUViRk9MMzVXU0VJb3lyNi9pS3BK?=
 =?utf-8?B?YUJZWnhNQWJIUWlyN2EvK0c3OXZaSFFvYU5YRnV1TUg3MFNHNjRYQmxPdkJn?=
 =?utf-8?B?RVJUM09OMjBRdHEzTVErTS9vSGNiM1IvZkhMZ2NJeXl3Y3lpa1I4WmwrcEN2?=
 =?utf-8?B?VDNKbkVZb3I4V2t6UHB0OW9SRVhYV2h2TVVFN2hUUDA5QmZkWncxRWtkVWt5?=
 =?utf-8?B?c0lDcE4xUmVGMk0xRWt3QS9pYVhpc1lWWGdpUzFiUzhkQTYzN3cvTVdEQzZw?=
 =?utf-8?B?ZWtPVTRVcVVXWWlRT3dlQ3JtMWI3a25PN0drZnFpckx5OXdiMlNvdFNrTXM3?=
 =?utf-8?B?TTJjM0dTMWwxU1JCaUl0bm4rdytoYUp0V1NROGZZY2dvN1lISnlNMmN3Wlov?=
 =?utf-8?B?YTVBV09HeWhqa3U5QTB2V2lPc2J2M1U5NTh5eUIwVzJCelZsMmFqakZHbmxC?=
 =?utf-8?B?NG5sYTJoTmQyclJFSFd6b29rbS9Zejh3d3RvV3hHdjRaQnBBYzZMOTJnNlJn?=
 =?utf-8?B?enVQR2tSK096NG9hMUZ4UkRjOHd0dGpYb2lJbWVGenh1ODFZOWw3dUliZC85?=
 =?utf-8?B?S0xYS1VIMmdOVEtRU0dBdFRpczZ0Qkc5KzNEczlNdlFJQkxybFBnMFpOZ0xn?=
 =?utf-8?B?WjQzSVk2L0RMSlh0MHFmMUxscWs3RUtMYnN3QTJqVFJlWFBCSTZWT2FTQkNy?=
 =?utf-8?B?L0tBMW5zZ2orWURUc014RW5Za1lxdG1MMFh2bENveFNWYnl2MXA5bGUvN1FX?=
 =?utf-8?B?cXNVOVhudE93ak1Kdk9nR1pJMFJDT2FmQzYvVitwS3VIMXFpSzIvNlZPcGNP?=
 =?utf-8?B?bjArU2Vrenc0RFo5YS8vRkZlSTllV0tsa2RIT0NnZWxtaUxBcG04VjNzeGRa?=
 =?utf-8?B?ZTZ1eWRZSkxRQ3poTEZRMVFoQUhzcHdZSlUySzE3Y010d1ZFS2NHZmM2U1FB?=
 =?utf-8?B?QktLOFVmMHJUQnVTQVpSblk2L3VWSEpvb0ZtMHI4N25peHJnMW4vWnZPbTFz?=
 =?utf-8?B?STFDL0M0bVl0VXcxSzR3WDhudUNBN0dVd0lwM0NJUkZjakNkcXp5akYzKzZ1?=
 =?utf-8?B?S2ZoTitzc0RNRlNlOVdwMDNWY1V0RHNwR1o1M1pMNUg4VUFFeVY1TFNkaW53?=
 =?utf-8?B?bC8relhpMGZpNHRyREpzTU1vUjlpeWJjNGF6SDhwTlhxcWp4UDVrSTFrV2VV?=
 =?utf-8?B?NVovOWdkUWVxeHpYSTdjVi9hbXdxK2dlWmU4MTJocnhIWGcvUjN4RkZsM2lM?=
 =?utf-8?Q?/q8wY3B1JJDnusyDNgYHXU9QFZxDBU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 17:45:46.7979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec5524c-6f71-475f-1036-08dd618db86d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

On 2025-02-04 06:34, Juergen Gross wrote:
> Instead of checking each known domain after having received a
> VIRQ_DOM_EXC event, use the new xenmanage_poll_changed_domain()
> function for directly getting the domid of a domain having changed
> its state.
> 
> A test doing "xl shutdown" of 1000 guests has shown to reduce the
> consumed cpu time of xenstored by 6% with this change applied.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I see at least some dom_invalid uses goes away, so maybe don't bother 
changing it.

Regards,
Jason

