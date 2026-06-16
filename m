Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ivr3JykfMWribwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:02:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369868DD68
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:02:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=xjt+8h6X;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338992.1600093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQcL-000784-5u; Tue, 16 Jun 2026 10:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338992.1600093; Tue, 16 Jun 2026 10:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQcL-00075R-2L; Tue, 16 Jun 2026 10:02:01 +0000
Received: by outflank-mailman (input) for mailman id 1338992;
 Tue, 16 Jun 2026 10:01:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZQcJ-00075L-Ka
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:01:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQcJ-009Wmk-18
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:01:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a311f0e-2eae-0a2a0a5409dd-0a2a450be474-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:01:58 +0200
Received: from [52.101.62.38]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a311f15-212f-0a2a450b0019-34653e26a5e2-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:01:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5588.namprd03.prod.outlook.com (2603:10b6:208:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Tue, 16 Jun
 2026 10:01:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:01:55 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPFZ0Wet5jpj7m1llr3qfj/TyV5XxWQMpCBkEKTyC8RZA3VPLtCU02Yr3OHonof3Q8ZtQHrEn4oP5iVpkjRxtGI5emW4/36+jP+v4IeZXPwVhLA+uBNPNHCHXbaOfNAeknWhaS2RyGnbCiM8c+aHYAuGInFmjEzrKVzXToc0GV/gT/G7w/aBTOAo5P/tQ4zlplp6ezXsZ+D0Jv3ZjZvS5+4Tw/JaPwgr+IB13IZs5tryoo0Dyp/CsuC68BQrQij+s4IZAtxJ6/h+Jvc0IC7FiSVdMdQ4CePcevCFOjii+BYHNwe7bDPrP/PuLyn947uJFoYlv7DIndZ38Wcn5zmZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwWE0W6pC8pK0Hu7aEEc5m4DUdaxFC1PXVuiP+f4pcI=;
 b=e2kJnYj98NpfS0ItjR5V2PPjTEuYzB/W/RjqAo6EsDC1nzi3UMW8ghAv+72WYD0DgvSpug9rirz3jlgwVftIhjN8rCp7hUC11oMgnXE/+bH/ompro775G96lzhEJh1fzRA8uAXZ0QSD/vsln6aOeiwr0yEVfghuI32QQWVx8j6naud4nC4ntRXN1z48d4OGkLicdv1pQVn5GYzJV3y9vRvs4NlhJAIo+jg6on7R6TgHJDR9rJNaTaXap/N6Z3T4M7fu90PVWn9F4ZNABgneN6bl+FGDXMXgDw+rAoXAXIao+2C7AwtMk0Nel7jAF99QCURC+lXcMi4nQRP9Bhq+BzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwWE0W6pC8pK0Hu7aEEc5m4DUdaxFC1PXVuiP+f4pcI=;
 b=xjt+8h6XMiMJnmebI3eKMb1ROQo6hzYE6z+yx2wXaj4+cg7dId1+xhyCyigzDSmLUC7Uu0/Xw0jXbRjrOUb6r/mCNPHTCVAdv5tsJikjMwgSaWDOlJ/39ZeZcQIuaSUChYpQm0kTqB4KD+J+iSprmfsyFtk3zWvb0uStRit3Blo=
Date: Tue, 16 Jun 2026 12:01:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 9/9] x86/HVM: more checking for
 XEN_DOMCTL_ioport_mapping
Message-ID: <ajEfD57XLXUEppCo@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
X-ClientProxiedBy: MR1P264CA0188.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d1c1fe-ea14-4d54-8685-08decb8e4bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	iN/Xv+Gm7OkFW3SLMMtFPZS56BOf5EFDCKou3GAfPWZZukBqwLR/z8BqXaIhyWXLpo1kTx9bWWExiqM8xM6ygOVjGP3mJvILQ5uEn/mexetUMVo/jDNwXboQg40Ub14VvyeR2Si4NpDCA1sufGhjKdJd2XoN7MNz0mU/53oPXLQL9hQ1N8NgtCplnoKwX5pnK4TktK+26dfhzaTIJaWkp6aeyopC/E5Vb3HXubPei7fm89Lp9/SfE3BLxTl5XdCUZDtZ7nm4phrpv/M2+jwyWHhuj0UbrgPy0WF0wYimaDj2kwkjYgv9F8akg0wAIbNleC79WwC9q1FCp8XbHi76zydd26QzsAU6iMJOjTXsZCFBoTEs1nxhX9m105709ceDwZBeVRGRtAgEl4QDbd8Gg/07kHek8gtvKg9SpctoRCLY0+gqGxD40t2jlPUO2yClnUk0zngAaNng0+7Etnw8waF/fQGJnLbbiaBbIM8/TbolrfdaAK5iaM4+Ta7pisCe2u/B3Q/OrRc/rSlbi6zxLwA1x+Bfah2RRUh7TAR8hlBYcIrLzfzUIMwSD9Far45/hja6BJjD99ZupjjKIlI24ogyNL4Si3NhfulNLzI3j0bb6bk1HoL67zb6qhyVWs3dTXfarvtgF7ulf9ABiHb87uzfXFkJLIqdroC61QMfWNLqr/NfgFrq8QlTLE/5eSev
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXpUMWpxcFdFL1VoNXJBNms1dkdmQ0p0cVczRk5lYjBHdXdIMk9haGdrQi8v?=
 =?utf-8?B?RXVXZGdGakNDNGFCbzV5ODhuU1l5TW1CdVBtWWQxRzVWQ0pFTGc4SURrWEJE?=
 =?utf-8?B?QTB6S2d3aVZUR0FxQTFKVEtnMkphY3lHSnpHVi9KdzZTNHhzM0toOUgvV2hi?=
 =?utf-8?B?OU9QdWNZcnNXSXJUZmVsNXhhaGtrNVdOem1YQTFQYTlJNFNOLzZYSDBFTUJK?=
 =?utf-8?B?L1JnSUN6QnlNNVU3VGlPNWIvaTd1ODljY3hQR3lhZlNLOXRxMTRnN092WmdW?=
 =?utf-8?B?WjByZmg2Tm9ObWRyajhTWTdqWTg4V3crRTl0MDRYUnpsYnpmTm5OWXBYWXRS?=
 =?utf-8?B?VFgwMFdaMWNtRVVKdTRvbFNiYXlJQTY1NFNCT3VZaHdCZU9IT2hzY3VTWGpE?=
 =?utf-8?B?V2YyL0pXSVE2ZVVmbGFOTUR2ekpaN3dXQ3B4UG93aFZKRkpRV0k4NnJoSFJJ?=
 =?utf-8?B?a3BlNXQ2VHVlMDRoUnlqWmpISGpadjh2QjZqN3BQK1dEQURKK2VNMUtmOWs4?=
 =?utf-8?B?WG5IbnVCN250U3RTRzJ0K3pEVlAzWm5Bd0FzbzQwS3hCNktOdys1aGcxSjJ5?=
 =?utf-8?B?TUdyWDNYcUs3TXR2eDRQV1lNS0lScXNxZ1g5cXYrcWd6dHlDNmYwSU16OUtk?=
 =?utf-8?B?MjJDUDJGeU9qOUZrL0VJRGQra1FFZUZtQW51V2JsUFg4czdRV0Q1NCs3VFRU?=
 =?utf-8?B?alZsUjR2WC9yUFA0T1ZkTDFBb25RODhEakpISTc2aVp4bXpDcU5VUWorcERp?=
 =?utf-8?B?TXJkVXNhOERqVGlVQXV2d241R3RGZVdWVXJuOFFlelhJT2JTRjhZajVtdmhQ?=
 =?utf-8?B?NTM3RUpWLzVxOEt0OTVHYzFCYXZaQ1o5eXhhN3hXTDBrVzhLWjRVbWNDZFZF?=
 =?utf-8?B?SHhpRUZwZ1k3ZHBWWTE5WE1reS9kU0pjOVFxUitPQ1VDWVlhUTlCZy96d3Aw?=
 =?utf-8?B?OTFoNlRKN2xYb0lVclZ3MjJoRlI3Z043RnFTNVJja2RXY1IyMzZMN3pCL1Jo?=
 =?utf-8?B?MWtqZHFvUFlwT24zclJGRlFCalJkY2ZQTDIybWJjeXNHQW1oM2N6c0FxRFBw?=
 =?utf-8?B?RVBUNWJZbEthaktoQW15NGJZYUhWNkdtbmRKUFFWMVFWSi9JalNNZis0TFNR?=
 =?utf-8?B?NFJkblgxeG5OVkNzTzNRc2cyRVljZW9UTWtxQ2s5Q1U3QjhobkIrTXpZVUlD?=
 =?utf-8?B?a2xRR3hUZXV0Uy9zRk9Kd1NIV25FR1hJejN3V0ZkSTVTQUp6T2RjdGZKaG9L?=
 =?utf-8?B?TXd3OXFpSFc4WGlPVEpHLzhVMkhTM0JVcmJteWZPdEU2RUhHRjdWSjh2alZR?=
 =?utf-8?B?UGpDQm02U2QvZzA0RHluOWFoNU14ZW5OdEpuWEhjU3VhZzRPb0ZzVkNpejB0?=
 =?utf-8?B?TFVNOGZEeUNQT0Jyc2RiNDA5YVN4WWdRUDZjdVRJS1BYR3N2ckorL2JzeWZl?=
 =?utf-8?B?NStHRjdMdlFRTG5iVVlPbzdFL2ZGWFpvTU5VMFJUaUJmK1ZTLzR1clVhS3d0?=
 =?utf-8?B?RWpsU3kwS2hVSGpwOW5ZZnBsSFBtczN4dVRXd1NNYlNWbm5aUGpWN2M1QWVD?=
 =?utf-8?B?NDFTRTMva0FURGtyQ0NsRk1qMHRWSUVzK2pRRjhaM3RnZUgwQm1LUkw5eWdk?=
 =?utf-8?B?UE41OFJ4MFozWXNoaUp5czgyczhQakd1MFR1Znl4eFRiNmtTNjZneEdqK0Qr?=
 =?utf-8?B?R3k4eG9tMWhnNktsaWJERG84N2NzUzF2MnVSZUpLMVVQdkI4ZDNQODd2blpR?=
 =?utf-8?B?RkNSMkl6cUhvVE9GbG8weU05OEEzc1ByV25KZURTUWxxSDRMWWJ0RFpJcHpG?=
 =?utf-8?B?RkhpNXJPSzg4azNNRTVKRDRjSmc2Z2Qvekk5TUNiNFJTeTcvSjJrdGxYY0l2?=
 =?utf-8?B?WFdDOFJDSGZOWnNQb0p3UTB4Wk84N1BGalc5cVk5RW5JWjM5d1Y5WmRkNjRX?=
 =?utf-8?B?a0F6V3cvdXZnbG9xcUYwQkhTNHVaVHZaUnNpdUxKcEhnNUtkSG5yRGJ4UW4w?=
 =?utf-8?B?U1FObkYrQitscS9MS0gwSm9hVG9DbHdoWXpTMDhvdGdnSjYrLzR1aS9VSXpv?=
 =?utf-8?B?dzlYeGQrc3Z2dWQ4UmdZbXUxNmhIejBYUWt5SjRlOHBJQ2g3dUNtV1FESkh4?=
 =?utf-8?B?YUs3UGFWTWNmdnFJc2hVbFV3Ym5CRWFZRTlqQnhNSUdzQmN4T1BFNWpBaWNS?=
 =?utf-8?B?MGR0Z2M0TFJzV3Axa0E4SS95ZUlldWE2SGJTVkF1SU4vQVNSbGNvUkd2RzZr?=
 =?utf-8?B?M1ZnRkgzTjNkRkR1dW9xMFp5eFVCQkw1T0pjSDNoL3BUV2VQRVZsSmFVRHlD?=
 =?utf-8?B?S3NVd3FMWDhhVHdoUndZeFpieGoyTDQxb29hNjRKUEZwZ2dwaTNHZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d1c1fe-ea14-4d54-8685-08decb8e4bbe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:01:55.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3Zzp0u7fCHRB04Aj+5rZQvbw9fELpuPOwFHzGT/S+FMzavfn/cPtPS1rJkBqs9FVq07MIGc5T7T9z1FBa764g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5588
X-purgate-ID: tlsNG-42698a/1781604118-12573F3B-A931ADAB/0/0
X-purgate-type: clean
X-purgate-size: 986
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0369868DD68

On Mon, Jun 15, 2026 at 04:16:41PM +0200, Jan Beulich wrote:
> When adding ranges, only alter existing ones when there is an exact match.
> Don't accept ranges overlapping existing ones.
> 
> When removing ranges, only remove a range if there's an exact match.
> Return an error when the range isn't found, and also don't call
> ioports_deny_access() in that case.

Isn't the ioports_deny_access() part stale now?  As you remove the
permission adjustments in patch 8/9.

> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Should "exact match" perhaps also include the guest port number? I'm
> uncertain here as that kind of conflicts with "add" being treated as
> "change" when the host port (and now count) match.

I think we want to keep the existing behavior and allow using an add
operation to change the guest port.

Thanks, Roger.

