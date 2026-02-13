Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGrbIuh3j2lVRAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:13:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDF139207
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231727.1536762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqybZ-0000az-N8; Fri, 13 Feb 2026 19:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231727.1536762; Fri, 13 Feb 2026 19:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqybZ-0000Xs-KN; Fri, 13 Feb 2026 19:13:29 +0000
Received: by outflank-mailman (input) for mailman id 1231727;
 Fri, 13 Feb 2026 19:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqybY-0000Xd-26
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 19:13:28 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fae3b46-0910-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 20:13:22 +0100 (CET)
Received: from CH2PR11CA0006.namprd11.prod.outlook.com (2603:10b6:610:54::16)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 19:13:13 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::c7) by CH2PR11CA0006.outlook.office365.com
 (2603:10b6:610:54::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Fri,
 13 Feb 2026 19:12:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 19:13:12 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 13:13:10 -0600
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
X-Inumbo-ID: 0fae3b46-0910-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiJP3Ch7PhRNY/9sbE8cV9PqcFMtg8iii2HxR7ivYD8QSGqYRmwkzywGalphrjCS3anCK8W5Q7XqrCtxiCFj8PcqyJNfOAB43JZ6Fa3QHdAGi2dIotBPlUU6EBPVg9pJAB9H7SRcr7KvQdDennhRpTPyjh/1SHmYFW9wpQjHBGo44DcSBDXDGmtWiaeW5LGg/FspcwLjpoq1fUdGJst7rtXz6xTvvCkO2A050fwzlbCZ2E+XUnmwZQfqM9eY2q7cY3gpaN8s1fq2tXH9RpQTvknQgFCUzA1/oozkNoqTJlRs+AqrFWOE1koOWzNfxRaXMd7xkJRyTa+cEQr/zC5pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goz/jyUm7qEYbHQoZvMVZ7ZvhG7iqD975RxDl3tylhY=;
 b=jWMtO83aE2Nn68aZy8gQepYf9RhOtUcuZXLNE7wvhU+hle4dSjlYg2b7OiMdcbAS/aFe5B0EWPl3ZZasR12kkALBXSj70FWWW3uG4XtqExFYiyTAmPKV7HLHjY1uqG7Zm59LnScmi/UAr1MnLrkW9hWyzJBHTa/sY6X6rGv3jyFGsn31KAuKMeFwKvJ02Woh+M1Lq10Ix83gmEJLa15q5MjtT/vnto5xlJEGNyHkmTTYGlk86cjYgZP+GJheks3sscWbUPr0FdTTfhwHiohJpSq+Ol/Pqf6SrIEvQNo2ey5Ci+UA/NcG1KyWNXKQ7/iKR2JPy4OszLpdeBwEthYtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goz/jyUm7qEYbHQoZvMVZ7ZvhG7iqD975RxDl3tylhY=;
 b=GWrmJHo2JQpLdiNh7hdvGLYAD8rF/XNjrJNCk4IxpRbPVJha9JLt1hThjjEnRd+7X6eHNDS6d86XwsV9dIDA8gHta8iUTCdhrQ6pTkSOWoctM2f1wjkqsRkMM1dVg3NpRXl6bsq0buk6bDxceggUFk4rnKi8pBCqoLExBTgpW7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Feb 2026 20:13:09 +0100
Message-ID: <DGE2N97NJMIR.LU2XTI1URT8S@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow
 paging are compiled out
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
 <aY8-wlXW6Y90vvOv@Mac.lan> <DGE0GZ9SPVXI.13JZK2Q4WWG8@amd.com>
 <aY9wqBi9xKQv9tiQ@Mac.lan>
In-Reply-To: <aY9wqBi9xKQv9tiQ@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dc7859-0f80-4945-c134-08de6b33eee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWRyT2ZpQTU5cXdwNUxqazMxdkE2SlJPZGFUdnB2SDlvblFMdmNVNno1MmFC?=
 =?utf-8?B?TmJiRlZoSzBJdEwvSWUyTE56djZVSmNjbDVsUm9PcDkxU0NPL2FKMmExU0Jw?=
 =?utf-8?B?ajFsMi90K3YvVFd5M0lUSTlTUkpXTUpoaVRvYnVaQUxNVmNJYjhFNzFkSU8w?=
 =?utf-8?B?eXB1OEx5UFh2dnJ5VVIrUlJ6RWFMTmMvWnd1L2VIWHVtdGtYNEZRNVh5VXhq?=
 =?utf-8?B?K2NpVFM3VEhOdTRTMTRHbE9oRVRoZmxuYkhsbzN3Y29BT21hRXhpMlBVVEtp?=
 =?utf-8?B?c1lIUStWbEI4b3RDOHNNUHZRWWV6V1kvNXc2N2ZGZlpqKzI1U3AvbXVVQ05u?=
 =?utf-8?B?b0xZM2EwS2RVb016aFRWUDVSUStKRThZbExYTGRiTjNmRzZvRjlETURxRDRW?=
 =?utf-8?B?NEVZOE1aMjlQcGRVeWVaOGRndlVCZkI1c3RJZFdvWVBBZCs1S1U0OHFzaGxX?=
 =?utf-8?B?Mk53a1Q5YWk1dWJWTGF2eUdSRmxrU0F2cHZma0lxN3AxRlFyTU9pMkwrZ0hw?=
 =?utf-8?B?RlFpQzZQcDNmQ0VmTDZoamRVTHorMXErWTI3ejFMSVdYYThpYlJZTzRSYkwx?=
 =?utf-8?B?VVBxeHpRbHNyaWxTVW1MbWozaGlWWnlRVnB1N2l0UkRsRUVHZ1IveHdITDlB?=
 =?utf-8?B?K1Y0VWxuelAxWjU0M2E4a0VVYWlEY3pwUllmUFI4aWRiZy9WU0hSQjgyUFA4?=
 =?utf-8?B?UHcvQi9TTThENlhoRlRkbHBDdGg3dTBLZkdkNURiZ1ZrUmpzZXArVzRFNTlC?=
 =?utf-8?B?VG56aTFXYTBlWnVFa1k3NjhuK0xybWZCcnNjZmREZWVtRXYvMGxkYldHcjlQ?=
 =?utf-8?B?a3ZHMUJWdWdLdHJ1TUtSWGJERUowTExIM3pkSHlvaExuc2RlakNpM0ZHNUNL?=
 =?utf-8?B?dHVjUjFBTmNBSDRIL2lTL21QcmFSaGI3ay84ZllYaEsybTdELzlLWUl5UXZI?=
 =?utf-8?B?ODh1eUh0MUx2ZHVhbDgrNTFPUG9wSUtqd2RSb2pxQ3Q1cnRwY3IvbG94ZDV0?=
 =?utf-8?B?bGFmVnd5UVlJWDFHSXlndW1PRzdkTEtVL2E1VW1waytIMnhYaXZlM1RxanNY?=
 =?utf-8?B?Ym1uUFR5bHc4NW01ZHFSMC9YSjBxVjdqZGpwbFIvc3BiT3p1RWV5Ujk5ZFox?=
 =?utf-8?B?czFRZHZkVENWaUJHTzF2bzZ1OFJaaVVyWnptVW4zZDQ1SHJaZENCazZaS2wx?=
 =?utf-8?B?dFFzajk2dEhPWk45WGlMSVZLMkFSMXR3b2tOSWJIQmJtQmUwUXUzNVdJVGNq?=
 =?utf-8?B?aHpyblRiWjIvRHQ1QjgyRUhjSzFOUyt5SnVHNHZ0ekFrbUdGWlRJNXR3WGZY?=
 =?utf-8?B?cGRMTkErOGtydHdySGs2Z1BTdXl1OEV2ck5NNnM4dFVMdUhCWThuYnlNTUh1?=
 =?utf-8?B?R2FuSmUwd3ZjMitZWHU1WkpYbDMzc3hGbjlQWUFjOWh5QzJOWk9PSkgwRUlI?=
 =?utf-8?B?ZWtTN21XbjFYcjBNZmNZUXIrWVBwSlliY0hXdVhZTDA4QjhpOWJ2ejVRd1VF?=
 =?utf-8?B?MWlhT2tTVzBrV3dQcXoySVRXeEhzWmRvTFhuWWNSRDJtOUVUcFh3OEFhMWpD?=
 =?utf-8?B?UVdtYk95MjhHb3lHMGlGV0lrVDRRK084RUVhZyszdkFTcm1Fc2FrNXcyRE16?=
 =?utf-8?B?eFhSM1MwMWhFN0lzUGhSK0FoRHhPS2Y5VEF1cnNPY1Bua2prOVE5U3VZb1NL?=
 =?utf-8?B?Mmwwc2dSOWFpUjR5VlhIR20vZmQ4dG52VmpWTmpFT1pOSjFWOTBGVjFpbGRi?=
 =?utf-8?B?M0VkQW5MOU1oMEpWb1hNcENraHp5RWQ5aG1kNEpReHNZYXJiS1dkcVI4cDhI?=
 =?utf-8?B?eElkR1Y5SkVzVFpKT3ErS2ZmeGRhN0owY1IrNE00WnIwZDcxZ2FDWnlkWTJP?=
 =?utf-8?B?Uzc3QkVZWE1vRjdSUi8xWXFUTUY2OXVONkd5YnFHOWF0ZWhCZEtvUXhjZDlt?=
 =?utf-8?B?cEJQeEoyTWxLOUt5eTNzRTdQRFBZM0JhSTNzTDdkbnVuWTZPUDIrdHNKVk1p?=
 =?utf-8?B?VkRpZS85bTROSUs5NzI1MTcxOVJrdURoZCs1OFV6R3QwVCtraE5SRmp5ZW1F?=
 =?utf-8?B?RnJNNEZPNmdCUExwWWZqRXVoYTJ3SG5sRDF0Tm9oeEtlc2w4VDFudTg3Q05C?=
 =?utf-8?B?SDZNaDVOM0Nhdzl0NTBHMElONjc0a2JCTnNLUVA5NTk2dTFtWFI5VWM2UURj?=
 =?utf-8?B?WXhIcUZSWldmeUZVZWY4MnVqMkpZVkN3bHIvaE1PV2VPdVg3Uk9lR29kOWlK?=
 =?utf-8?B?Q3lReC85TmhQdkpzbm9jSklkb2JnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qE5lVj+j8vk8PfjRAONTdBpEvzVtP2mMhp4fPHMY4MjxGJwy+9fIGqVnYjfYf4hibWy8oQGxI0YNWjzYQpGhWHAKAbBLcB3o8Riv7yqVlRu0YE3rYX86ZMqrbAazdsc0VWzs7ytPN6SpJRgO1kxBsycEl4HcqZYfQ2DSte5SkIFiQvAOO5xEsOIp6nOfdqUcasTjhK7h/sO+DqJBee8+Y8+LOg+/1jIJMvLO7Gs4LNETaNdeW1Jnsq/vanvrr9Xfqco6e4LDW4jYV/jFEowmyonBKjwNRvkzu8aHZTkEPOEH8Jtwj6+XxncEIrIxAllZN8qS1SUTz47uVROyLDrdKUpK0GNqOHxL0NBW3ZJ01escTf2q7reaDtNnaN1zoqHsIHmLW2HKZ0EqBUHeOQH5hKz83uEKyrSVG1E22TiVKIymdrnFgwJ36R5Oj8U4xLCI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:13:12.8113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dc7859-0f80-4945-c134-08de6b33eee4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D8FDF139207
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 7:42 PM CET, Roger Pau Monn=C3=A9 wrote:
>> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
>> >> index 960f6e8409..64fde82c50 100644
>> >> --- a/xen/arch/x86/mm/Makefile
>> >> +++ b/xen/arch/x86/mm/Makefile
>> >> @@ -1,4 +1,4 @@
>> >> -obj-y +=3D shadow/
>> >> +obj-$(CONFIG_OPT_HAP) +=3D shadow/
>> >
>> > I think you can use:
>> >
>> > obj-$(findstring y,$(CONFIG_PV) $(CONFIG_SHADOW_PAGING)) +=3D ...
>>=20
>> Hmmm. I guess I shouldn't just include it twice, like we do for other .o=
 files.
>
> I see, so use:
>
> obj-$(CONFIG_PV) +=3D shadow/
> obj-$(CONFIG_SHADOW_PAGING) +=3D shadow/
>
> Maybe that's simpler really, and it's a pattern we already use
> elsewhere.

I meant them being folder with makefiles potentially doing things that shou=
ld
only be done once. I don't know if we dedup tokens somewhere. These makefil=
es
are rather arcane.

>
> Thanks, Roger.


