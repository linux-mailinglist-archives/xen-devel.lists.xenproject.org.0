Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23A987A1E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 22:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805885.1217130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stvEl-0004hx-Kp; Thu, 26 Sep 2024 20:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805885.1217130; Thu, 26 Sep 2024 20:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stvEl-0004em-Hz; Thu, 26 Sep 2024 20:37:19 +0000
Received: by outflank-mailman (input) for mailman id 805885;
 Thu, 26 Sep 2024 20:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGJI=QY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1stvEk-0004eg-GS
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 20:37:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6d28d9-7c47-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 22:37:16 +0200 (CEST)
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 20:37:11 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::50) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Thu, 26 Sep 2024 20:37:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 20:37:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 15:35:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 15:35:13 -0500
Received: from [172.18.112.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 15:35:12 -0500
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
X-Inumbo-ID: 1d6d28d9-7c47-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qclTTBFDVOcSQHrrH2h9etFzllNXcnRc3jZFEhlU7CbY0aOw0XfV0yUhGK/6y+/nlh392Qf5q7OIHYwrMu9ASem4czqmEuVe56tADxLQnwSWmdwZ9QakIDlw65LAJQV7HvskgthspFxl7urUSB+SPYj6OOiM5ND2+rnH9r5walgMOgchAhhwfVpxeLO4KJ2zUdGQbmeB81a0QmfoYJs92B9CsXXdBFvKufubBBNzsx0XZQBV/Kq+eYkjJzg53UPVa3U9Id+k3UpbFRGRXXzLpEpEzgleg1mbln50XfvHLqGVrSH+hCxuCcQGMuHGmvA9Kz7Rbssz4b2xmMs3f9/E5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT1TAb1bpAzkIC2LO/aHUeb6l1mlZ9bz6UvnAj+crOw=;
 b=S1BGgZkb0ZgOqVZ+pBEpDZbtaR/iBekCVMu2ZgG8eBMyZLNAsh5JJ5+T1x6YpCWHt6/JUum9UKUPeXEMrPpbtmpoBdGWkM5Bzx6azejIKHEZTUOb5p4aj6S5t0FURcZIQVHyVt11CB5dkywzjqTxzI9b0JZFUus1EpErQXWPJadsMT57uV983Z4KLXAR/ZS1e9VU/Cp+0sFiXcMY//MyHFpFLJf/fyiZk7F0xwU+vF9WwDF9THThShfzI/zUXWt03WDXs1mTDSMbJbdGI9w6uwOMO+v8o2s1+rJ5+KWKhAEyGPns94gLHH3fHtZbocRFTVAG1++ZTYXvhVhiN2aO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT1TAb1bpAzkIC2LO/aHUeb6l1mlZ9bz6UvnAj+crOw=;
 b=AvUVHPdVn7aiyBgablji7gNrAgIWeFQdtOE2Hzxpid1vvJdwhWWRz7MOvuSfH5I1keDmYJfJxxM3jC8DW51Q1Ob4MwOSuyzatBu7qozCePXrcYY7EhFgGPj3NQPdSwtFpiY7TziStKQTh2oQ0msqHR4M7917yT5MMwr9cmNA8mA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <411b7339-7cdf-441f-acba-550fe79ce408@amd.com>
Date: Thu, 26 Sep 2024 16:35:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/pvh: Omit needless clearing of phys_base
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240926104113.80146-7-ardb+git@google.com>
 <20240926104113.80146-10-ardb+git@google.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240926104113.80146-10-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c3facc-c6a0-4dec-9331-08dcde6aff30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHYxaldaZzVlbDJod3Y4ODNaMW90Nk1JNUZXc0dwc3d6R0ExaUlPUDNFL05m?=
 =?utf-8?B?T3c3Z3d4dzJhYVBMN05QUmxrdUxQb0xQek1Nd0RrNVRKYmRDbndzeFZIa2hl?=
 =?utf-8?B?YjM2ZlgvN1NGZFIvWDhHYVB4RklsN1laKzladit4TENUR2poWkhKcWsrMW9p?=
 =?utf-8?B?d3VvU2xleEhFYjd4RzN6RzVFaXdVQWF5RHRkcUJNVVNNRTVJTUx0ZGRvbHRJ?=
 =?utf-8?B?Wkp0dDN6VzZ4ek83eXBDNVNiNDdGbXBXbWVJcHoxY0hFc3lkQXVKbW05aDAw?=
 =?utf-8?B?TE4zbXN0Q3lrb2JzVTBsZHozcTRSZ0JWWEUvQmF0T3NGUGtXWUNwalV5eGc3?=
 =?utf-8?B?QkZkNFBiY2hnVUpNcGhhY1pMTjhOdXAxZlNmSkYxT1hRVW9GNjNUc3lROGRi?=
 =?utf-8?B?d3NiZTZ4U3NFV1puSTdWaS9PVlRMbmx4b0NMdmRsTm9KNVNqWElQTW1PdHFO?=
 =?utf-8?B?WXBIL0JkdGpRQ2FmYkhvSTJYdlhDNEgzQVhMSktucVcwZTZ5RDRKMnZUL2lN?=
 =?utf-8?B?M2lRazIyVnhhRXNBSXh3RDIyN3V5Y3ZUTnNGYU5GUUloTnc4ekhNQjZoSWFI?=
 =?utf-8?B?WmdJckY0blc0RXNvTGpWQjdlUWdMb3hIQjcrajRsOGNTeklDdTdqRjVzaUJK?=
 =?utf-8?B?ODBucXUwMTBNTUF0eWNYcGpwcTI0cmJUWFd1V3ZHbzB4RXFXYWwwTmVycFUv?=
 =?utf-8?B?TnpQb3dwUGhvdkdNR2dvbVpGeWVOaE9SczVRYU0wNktYNWxVeEQveTVGUlhI?=
 =?utf-8?B?VVVaRElVNmkwNnZydmwwODVZNXRzVHF4WHZuVWFrTGhHbUxZaUI2czRrM0Ir?=
 =?utf-8?B?Wk5lOGZIQ0xUYjJqTCswT25PMS9mcjJ3RXJnMDhwN3NiSkFxMk9PZmVmYWdi?=
 =?utf-8?B?c0FQaVBON0JGUjRIeWpRdVRkTkIwbHlrM1h4dERHVW9pckJiTllja09vUHJK?=
 =?utf-8?B?dE5Ya3hBakEwN0diRW5RVnhqSE52MTBLVnRDRm1MSGZXVHl6aTJXT3V0Vytn?=
 =?utf-8?B?bGRoUE9OK0RZeGo4ZU12ZENEQVBFeE1TY2NBVDRuZlIzQUZSM2F4VHBIMWFY?=
 =?utf-8?B?SFBTTEFnN2VnSms4T0ZKTVllS05wakxPOTRBSUxpTnNwMHYrajlTMUIvYkRw?=
 =?utf-8?B?dVVzOUtXZVRiQ1pFQ3pMSHZkdGoxVHdkelcwNTlyd3JOc0Jld2dmTDFxYmo5?=
 =?utf-8?B?Vi9WckdJMVA4QU56NGRsQTBSeHR0OXlsODFQS1RVTWJXd1NNWldGNGZ6OGRr?=
 =?utf-8?B?K0xtRWxFR2FoM3ZIQTFUNWFONkFZblM5QzF6S2o5VEVxcUw3cVR2Y3ptWFRK?=
 =?utf-8?B?OWZWY3NZb1VVdkxrL3VwcUJQNDNyUGFBODdxZXc2WWRZNUtMSnBuNlVPV09u?=
 =?utf-8?B?R2xtTDQ0bUR2M0l6bStoNXg2ekY0L24wUlV3T3oyZUJBN1pHQjZvOEJheW1G?=
 =?utf-8?B?MWE1QlZOSnU0empiRmlOem5teUYrUy9mYVljWFNzcHVzTEZYcjdHMHgrQ3N0?=
 =?utf-8?B?aGM2QzdWR2FsdXFVLzZVdVZGOCtoWFpucW45aUxMWDByR0djdzNrUjlPNGda?=
 =?utf-8?B?RjUwODJFbG4yai8vWHZpYndYTVVsY0FkTFI2cUNJZTRMVGhMYzYreWxpNjY2?=
 =?utf-8?B?Ujc1aEhjSXpXb1FpNXEzOVphZHFVMU5VeXBKTTBWNmlKVG5YLytnNnh6eFZl?=
 =?utf-8?B?aFZqaDBTV05sTmNZTHZHcGN6UytjcUp5MXJkYmNCUjBCa3hKMDdMZDBLOTJo?=
 =?utf-8?B?dW5yZUNaendpL0dXN0pTSFBSM0w2V1MvSU9vQlo0aGFES1FTVXl0S0ZqbUg2?=
 =?utf-8?B?TEh3dGp1NW1IcWJlNGJIazVLeTk0RWV1UERqR2JKbmpVUEIvUm85U3h5eGJM?=
 =?utf-8?B?Z0FsZ1hRQVFwenBwUEdDTlh0eDgySHFVd21tYnhSRGNkTzFCem4vSFdPeDVw?=
 =?utf-8?Q?lzEa8Wu2Wlm5DUuNL/9vCA1HLp0fYWRw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 20:37:10.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c3facc-c6a0-4dec-9331-08dcde6aff30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

On 2024-09-26 06:41, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Since commit
> 
>    d9ec1158056b ("x86/boot/64: Use RIP_REL_REF() to assign 'phys_base'")
> 
> phys_base is assigned directly rather than added to, so it is no longer
> necessary to clear it after use.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

My patch pre-dated the above, but I never liked it.  Happy to see this gone.

Thanks,
Jason

