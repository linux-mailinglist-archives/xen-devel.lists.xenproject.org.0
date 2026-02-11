Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCJIMT5NjGmukgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:34:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CA122C76
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227113.1533445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6bb-0006yv-Fs; Wed, 11 Feb 2026 09:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227113.1533445; Wed, 11 Feb 2026 09:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6bb-0006wT-CR; Wed, 11 Feb 2026 09:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1227113;
 Wed, 11 Feb 2026 09:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWxp=AP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vq6ba-0006wA-2r
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 09:33:54 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c686c9df-072c-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 10:33:52 +0100 (CET)
Received: from BL0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:207:3d::17)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 09:33:48 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::df) by BL0PR02CA0040.outlook.office365.com
 (2603:10b6:207:3d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 09:33:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 09:33:48 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 03:33:47 -0600
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
X-Inumbo-ID: c686c9df-072c-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us6N8lX8HJMcZzTB6SqQZyWhFA/vqecnBvJ+ip27D0lMFxnVWRdzXX5shRTma2DGBQTEJcb0YdD8mMGrH2JFcjA0DWGd9e4UqejRDHM68EJFI7xXR8Bx2HexOEqJNvQ95Kfavb8tWJV/IWBBmQmYgxso9bMqp8Mi5pQlDIpXsaGf7Un46oJzo+pY9YwzPuNjyjCB+iZ8iGsoi8wzbHUq+zO/PIvsbZMmjA9RicNrNN5sEuXW/1didXAUj99b39KER3sbCxuDRqF4fzF1Zb0cEls8bw6PZMbCmBGFwJzym50o1x+yh9IokOQ+xPweUxlGXO2/L/iCXwoRLz7fqNpKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUCLTSsLiTD19y3HdUTJnVOqun1ElPoSVVgAqf/qA3s=;
 b=lDCGfB/4vedVOBpFgQYSqUGDRnmaXmVUKQl2G8gkHgnJA5R5Inxa3wwE+USlKxd7lmq9AZbRFG+b44X81SlNDnkFANsKucwpWw0HJoFbnehE5fKFM23po87rNihuQvJAXBj+hOwU9z97aX8z8VsOY8tJU7ur1suwxl1USeHjJPxVOeQE413HkrhtoIyE27yFQx9pgfK8LYcfycxg6H4b8M2WE6cJ2oub8bcNOqgo/PC7pJ/DCZwO9GKCpit8Hj46lM3kO6WSJJyL9I7LvJKOku995y5XTN7ygvWrCuZLemv+GC4NcmZaMpqQYM2p3HEsdW9Ujj5RauGiVK8H41OCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUCLTSsLiTD19y3HdUTJnVOqun1ElPoSVVgAqf/qA3s=;
 b=vTHWebvqX/GBKYsxEOCHEn7ITRC50eruyXUrSla8J/P0m0uhnWN3L6fRRhYZWmAgJf+MRp7Weo0aXB1C8UOThyG99bkCfSwyt7WHwoXD0QSvUBAnDIeG8IVTLmRppBlR41ywBhc1MHlARXq8jCgAyZyfTzuvCS5NbijcCHQfk20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2026 10:33:45 +0100
Message-ID: <DGC12JYGSNYU.3IPSDEA7ONWLY@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2] x86/domctl: Conditionalise x86 domctl using DCE
 rather than ifdef
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260210173022.257030-1-alejandro.garciavallejo@amd.com>
 <b210e7c0-ae2b-4d41-8690-b5af4261de3c@suse.com>
In-Reply-To: <b210e7c0-ae2b-4d41-8690-b5af4261de3c@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4253ea-6bf9-412d-cbee-08de6950a8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WW5yMGlmcHpBeG9aVTRkekhFWHI1VXVrV00xN2RrVW5JSVpkZVlpZWVya2tr?=
 =?utf-8?B?TlFDZzZlTjJ4b2pCN0haRkVkOEN1OFhwR3dxY2hBTDFEL2ZSQk81bmxJTWRJ?=
 =?utf-8?B?N0RKelZlTGdIV3Y2bWZLMEtqb3J3VUVZd2hhTlJYdE9ScHhMNFJZMWRPSU45?=
 =?utf-8?B?R3QvdUZaSzlyc3pib016V09JMFl0OGNhS3JXYzRZaWRDZk1ZZTdxV2JzdWZC?=
 =?utf-8?B?U2xrOU83aGZ6cHRmNzFRckFpYTBhVlZ1ZVFsUEYwWk9iTlE1VDJkU052Tml6?=
 =?utf-8?B?aFRySTlNdHRuZFcrd1pIOTkyOW5ZWGExdDZyeVpia25nRmI0UjU1OHJSbStl?=
 =?utf-8?B?VmVSdnRpb2E3QW01THNkVWx1RlhQYmtvUW95UjFMMTNzTmYwZGJnTXJ1cGY4?=
 =?utf-8?B?WjVtQ0xncWI3eFJQM042R2hMbVA3VzZ5Z1JQblNhYW9nMzBmRVExMndwbkRK?=
 =?utf-8?B?Q1F6ZVlCRFYrbEZmZjRQZ01xUlZiUFN6djlhL1UvK041UGVtN2FEc0UzeDZJ?=
 =?utf-8?B?NmMyZGhBUnM3RkxyNjNxNXZyK1lJbHFvbFZEcjFGOVpOSm5peHg5T2wwM05U?=
 =?utf-8?B?SHJZTWpURVZpTmdpVnpkeGRYczRud1djMXprUjFRcEdRRkFuYXNxYTJjTzFk?=
 =?utf-8?B?VTFRTG1iYXJtWWpranJqVmxGZWNoQjdaY043Qnhqak9aNVFLcG5ha1p0Y1o2?=
 =?utf-8?B?Z1JkWkRkR0IrMEcydmQxMnRHc2JWcFVYQnFHTFYwV3V5UTd0di9pTlBTa29i?=
 =?utf-8?B?VU56M0ZrYzNndHFLNzZUbTZNOEFYdnNDMGttK0dEOHVsUWEwWmdNbmpSMHo3?=
 =?utf-8?B?ZkVEcVoxVzk5blBlK1AwZkhSb3RxaWh0blg5dlpaVkVBODBISHZPck1SMXQy?=
 =?utf-8?B?U0hBRjVzb2hRam9tQWVZajVyaFJ4R2xvZDBiZGh2dVdseEsyc1VnTldvR291?=
 =?utf-8?B?TG8yRHpUUURPK1Qzd3FnWHlUV0tRanZwbDBhNlZvSldMMlA0OVVpK0VmNjBQ?=
 =?utf-8?B?YzN1cUlSSWQzaTR6VExON1FIQ0JlL09XbmtaMkN4enFxUDQ5V2lDcFNERVdR?=
 =?utf-8?B?VVhLaE9UeFNUWi9hOFFhbVlnQ2lIZnYyODRzQjVpZEVqREE2Y2FhYmxhVVdv?=
 =?utf-8?B?L0daUHg2ck8yT0lHM256emdFbXNlaWdLYmhIMmNJeEdTUUVNYkkycjNhRmxH?=
 =?utf-8?B?NENOZFV2VXJpYkNLdHlxQ0hLY3lZR0YxMkpMWW52clEzRzJjWG1XYksvR2p3?=
 =?utf-8?B?aU1BTXNNaGlrTkRETWkvd2dqQWQ1dFhMSWVqV1lROFYvdDJXNEtOMmpUWnRt?=
 =?utf-8?B?MmExTTNWOVVMZ0hTTTNvSFRlcDZjU2FUd2N0T3VLbXdmelpOek56N3lJaTdY?=
 =?utf-8?B?ekRGaXhVMXErT0JsYUNXOUFmVXI3Z3JpVmovUFVqMWZ2WFQyYitNYW9HSjAy?=
 =?utf-8?B?dytIMDVOQkhOTWdQTWQ5MHNvRGNmSmllWklhN1FLWGduTnJGTlZRdUVNcmRq?=
 =?utf-8?B?MXYzbTg2MjRCdFhDRmdpYng4aDNKS2FNbUdnbDIxbkpmaEJyUDhsWmxpVERs?=
 =?utf-8?B?Y2FtemNUd1lhZFlNRXN2bDRhZW9LRW1mZHhNbndYbXV2L1lqUUQwQ05PcnhM?=
 =?utf-8?B?VkVVTndkNnltc1djSFlDUmxUaTdwMk0xbEpzc2pHSUdzU3FmazZqQ0g4L2FV?=
 =?utf-8?B?RUpSMnlBaFY4VmRLQVZJcUcyKzA5ZndYTUd3dFpDN2xPS3dLSEZEbHNZcW83?=
 =?utf-8?B?NysvN3ZYN3dqenVnVlMwTzZUbTZzQXhOb1lkeFJIYTFTU1J1M1lta3JWWDRX?=
 =?utf-8?B?ZUluaDNMTU1OZExMNDhCQVV3ZUNFMzFQVHBKY1hHS1Rtc29kd2orTVpINkk4?=
 =?utf-8?B?bDhockJvQU8zcGZJTnBrTStmWW4zakQxTmtuRVkrc0xxQXdHK2p0OTI5WmR6?=
 =?utf-8?B?Z3FaTjM1emVzOXkxRHM0N3Y3ZVB4MTlCOHAyM1lNRk9WUE50bUxXRkpVd1Bq?=
 =?utf-8?B?RU0xQjJadUdxbUZ5QXNmbFRWbHpzUm8wekc2TytaKzBqdE5FaUFsUFI2QndO?=
 =?utf-8?B?dTRFWUZ6dHlUN1ZFRXdIbFZvcmRDdTlJZDRHM0MzMEMzSFFzRkgvZXhqOXp0?=
 =?utf-8?B?elNyVlFMNkxBV1EyS1Q2TTRVZ3NmNGUyQTRtaE04cnhQVThKVGNWdzRrY1Fs?=
 =?utf-8?B?M1V5aHdhN0lVQ01COWdCV0puOTN5TktTNUJzSkdPRm5Tck04aE45NUYwVkN1?=
 =?utf-8?B?ZDN1aWEwbkhRbUhiaXQ1OUVhOXV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3b5RZ/KHtF0RIAYoOF/qEDOrtZxikmxKaF/Q/QHYoLbNOnvhpZO6fdl6WldLAjmdPFouoFdmUfYEA47Yzl/90ESRcmC3hEVr84ZGhw9Lidr3LJhnYmUZ3QQDX7OujByS3wgbJQAoOwwHIcySh77Z82v1hf39YMNPvAfLOkaJigJyEplwIRqvC3n8E/TrH/17lDaWCGoW4bHiu+62YhnczFwtBa3+JwODQuEMVKAAl+gPyoydLJaVqUpcktJLq2Cvg9wQzQEh7Io2aQmloO/IM9ZF0wEBU4W38V82ceSDr9PSKyBxrJ1Isn416vpacEW76uOPLmq5BWbidVGWoKyo2sWH+8nMbl0ERMqB4P3N3CyrSzQP0OMOceLhPtA2aw06qzK1GWmGDhJpqjXrUj/CvAgaRG5Ik6W3xEYBcGVXz/HXxDJiOL0vh9eWh0Fsve4K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:33:48.0948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4253ea-6bf9-412d-cbee-08de6950a8ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:tamas@tklengyel.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C3CA122C76
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 8:17 AM CET, Jan Beulich wrote:
> On 10.02.2026 18:30, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/include/asm/mem_sharing.h
>> +++ b/xen/arch/x86/include/asm/mem_sharing.h
>> @@ -9,10 +9,12 @@
>>  #ifndef __MEM_SHARING_H__
>>  #define __MEM_SHARING_H__
>> =20
>> -#include <public/domctl.h>
>> -#include <public/memory.h>
>> +struct xen_domctl_mem_sharing_op;
>> =20
>>  #ifdef CONFIG_MEM_SHARING
>> +#include <xen/sched.h>
>> +
>> +struct xen_mem_sharing_op;
>> =20
>>  #define mem_sharing_enabled(d) ((d)->arch.hvm.mem_sharing.enabled)
>> =20
>> @@ -92,8 +94,6 @@ int mem_sharing_fork_reset(struct domain *d, bool rese=
t_state,
>>  int mem_sharing_notify_enomem(struct domain *d, unsigned long gfn,
>>                                bool allow_sleep);
>>  int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)=
;
>> -int mem_sharing_domctl(struct domain *d,
>> -                       struct xen_domctl_mem_sharing_op *mec);
>> =20
>>  /*
>>   * Scans the p2m and relinquishes any shared pages, destroying
>> @@ -103,6 +103,7 @@ int mem_sharing_domctl(struct domain *d,
>>  int relinquish_shared_pages(struct domain *d);
>> =20
>>  #else
>> +struct domctl;
>
> DYM struct domain? If so (can adjust while committing):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I did. Annoyingly I only recompiled on with mem_sharing enabled.

>
> Cc-ing Tamas at least for awareness; I think ./MAINTAINERS should enumera=
te
> this file in the X86 MEMORY SHARING section.
>
>> --- a/xen/arch/x86/include/asm/p2m.h
>> +++ b/xen/arch/x86/include/asm/p2m.h
>> @@ -806,12 +806,10 @@ static inline void p2m_pt_init(struct p2m_domain *=
p2m) {}
>>  void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
>>                       p2m_query_t q, uint32_t *pfec);
>> =20
>> -#if P2M_AUDIT
>> -extern void audit_p2m(struct domain *d,
>> -                      uint64_t *orphans,
>> -                      uint64_t *m2p_bad,
>> -                      uint64_t *p2m_bad);
>> -#endif /* P2M_AUDIT */
>> +void audit_p2m(struct domain *d,
>> +               uint64_t *orphans,
>> +               uint64_t *m2p_bad,
>> +               uint64_t *p2m_bad);
>
> If already you adjust this beyond dropping the #ifdef, I think we also wa=
nt to
> make use of line length, to better match e.g. the other prototype in patc=
h
> context above. I'm likely to take the liberty of doing so while committin=
g.
>
> Jan

Thanks, Jan.

Alejandro

