Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q9AkHMTWT2odpAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 19:13:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE893733C1C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 19:13:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Yde1GMHr;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358409.1612547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whsJ0-0002aJ-Eq; Thu, 09 Jul 2026 17:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358409.1612547; Thu, 09 Jul 2026 17:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whsJ0-0002Xb-C7; Thu, 09 Jul 2026 17:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1358409;
 Thu, 09 Jul 2026 17:12:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whsIy-0002XV-Jq
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:12:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whsIy-003cAB-0b
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 19:12:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4fd691-bab6-0a2a0a5309dd-0a2a450889e8-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 19:12:55 +0200
Received: from [52.101.201.70]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4fd696-ee29-0a2a45080019-3465c946d4bd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 19:12:55 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BN8PR03MB4946.namprd03.prod.outlook.com (2603:10b6:408:7c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 17:12:52 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 17:12:52 +0000
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
 b=Z+MgrYC97hvgN7wpbuMupuwKzpy+bQmCHRu553pBX2DVQV+HDPiYgFbigLyUza96/D8FJ7268h9p2WhWCdNPSHrA6Jl10K74fmvCf+u6n2fl020od9fq/2YhKbguRBWwuBa47m/Ol8icmLg2+D/qiKbHZ8re1WgbgD3zjl3K3PkVfzPhrRHDVSxxVBHw4Oc0wXG8g3DPqoctMXpLtbVEupQtiZp290E07nnXmm7TEtRi3XeEOL5iBRsj3gERY90CkLPmZJewI+y8ryMU1wE/LlJCkOg2xdKcdT6y7XGT3ZAuMigOD4O6o5XflzKTpRI98YTZSCLGP2bCg5n3tEVa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju/O6AevlftF5ktqxn/O072TWeC3ENxAqH3Y08khe4U=;
 b=Wd5wXdQmtyqYR3Vcgk/IKT7mZJe/2UGjOJrbVQ/PJKB1HxXtF1lYz/SMhnFTplN/PzpQJHXYIV6jun/ans1ssXScqhFG89Omo3KsKwy0MHTDcIm02Q9YzunmyTOcq1WfLvEk2c7rFaS1UaCvfnq/ZCNM0KQo4rMvFJhpYFotrWN5ZPQMYq1m4jz0fENf0M2ifnRq/MyCDD00vI04avz3rm9xvmPrNd/oSZbZiRPF9RQjpt33g9tRbt2lolR/+uVTbKuEAlJgrlrCjh41cXgcApezxnh3Qpre54qPhxO1D6R5SVqdYbbEkr/TD26lKNInf+sU9YBV1tiW1GK/b35IiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju/O6AevlftF5ktqxn/O072TWeC3ENxAqH3Y08khe4U=;
 b=Yde1GMHrVWxOPJvgPIum2NOF6kja3uBZuAXAHvK7jjtTdYB/YXr0txfYzV03iFLNd2EFgo+nq+6VkcDRV4S7CZUfqAyudVm7BzHijbyObHOTVJbHq/SRqkyqUU4JFlJ+ajGeoy0o8i9wpP0amy7+mAwww2pjIEiPyflCn/m9Mi0=
Message-ID: <25047ac2-3423-4e81-90f0-93a2e47dbf09@citrix.com>
Date: Thu, 9 Jul 2026 18:12:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 0/2] x86: adjustments to building of the insn emulator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0566.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::16) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BN8PR03MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: e2afa6a9-532c-4da3-c577-08dedddd4f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ANbLQ3s9OUo/bKIuxBLBpPRitbnTbMIx3pWNnmOOFSu4nRCkoGwCZ6CkyoXlCOQuqVCUWClaLLI1Tn01BWxWgBVE38bu75HUSDLmKxey5TvEN+87McT3URcc+gGCm8n4QYVFgNkHAmAaQumk+D2A3dqJT4m0LdyZOUy8Lpy9cAm3ie53FDYT1BZaBRrG8HSDOy0SP38srDIv7PtR4iqsU0FO3mtKro5LtCuYMksYHDS27gyIkTwxk7NzXvA0Sh65alLQf5zhKO9W3sYJlOIxPMIAK5/kq7cJNEMemzacIlAhEZ9lIBgZ/ucUWripvm7fD8kELr/+KpfWVVCch0nvrM+oyszpr3YCHb7hV0sdub2ENOPb5rmXdw2RjZnHkIyIbvR99/LVxX+GyK8m1+roA10BRHrbDdvKNNxz++/8hSmI68goPgSmdlv3Gqn74xUw246/L/U9HzOQ8DYftzqpqe/6NhD04q5XgWMpDu/8whrQwPXMp8QD/I8S2DrDYDFXb4rQBCkQA52KQY2Z+qSB3aJnrcDvIlHugCjn1G+EE06TMRauGOOLzv6RbSxJ19yxKcEubqNcoEj/j9xBDWZoXk5uS/3eqgo2qymon2uRxt07ajNRg75X2nh+DJovGHu5qCyH5thvUTvG7O3tmN5ZbAU6F6yzrAjnfNS9J9H/d3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmFFblBKd2VRSDZVeXJPSjFUQTlYNEVjTEQwZHJiSnJTTW5BUVp4bzN1OVVN?=
 =?utf-8?B?eHk1RzNxakpWa3U1ditQQVVuemdML0tOL051NDd4V1MyRFBpNFM1ZXFQYkQy?=
 =?utf-8?B?Rk1jR2N5a2Zld3FOZE85d1hTb21ySFJ0M05sY2RYelFHMFNmS2drUTVpNHd6?=
 =?utf-8?B?Q1RKU2hBMFdjNGo1SkVVMzhRVDJwbzVBdm1iK05mb2VySll0aVVoaFlFREZG?=
 =?utf-8?B?cllPbFJibWNKbUpBQm1LV3JOMlpRQTU5SWpndEt5Zi8rVEpwcldlbVJ1V3pV?=
 =?utf-8?B?S0djN3dOUkZzOWlJLy95eGY2T3N5SkZMdWN6aXVJNmNEYnZkbnF1UWdjdFFx?=
 =?utf-8?B?Y0R2NkZjREJJUUxGNlhSbmZZVWVlRndDb2RyeWdLSzZLQUVGSDd0SzNEK25S?=
 =?utf-8?B?dVRoRXZFcUNSVUtLaFBXbGp2U3RSeVo0Y1dNM1FmeFBzRElXbkJhT0g4d3F1?=
 =?utf-8?B?Z0ZBY2RUUklDQlM0OUJlZERsN3lKZFNTR25kSVFWYTlFQUJNc1QxRWJKU0J4?=
 =?utf-8?B?K0pDWko5OGx6YjVOdzNvYkhJeXdnRXhwZlVBZE5sMmVLNVRlZVRCdlpSQjdG?=
 =?utf-8?B?S252YzZ2dzZBWUZzMm0rV0ltY0EwMFR6NWJHbmFGWVBIUFJMOVJaZWJCeHMx?=
 =?utf-8?B?YkRQTWx3emtJSFVkM0YxckQwYzBkRXRMcUozbW5WdEc4NFd3NWEzQzNkeDEv?=
 =?utf-8?B?QTlEMm1sNVg4WmI3NUptUGZTcUJaUTB1LzFMVUo1NFdUUHFMYkxwZVVvVjNn?=
 =?utf-8?B?UG8rck5uSThvcnR2WlFpWW0wZFpSMFQ0VXljcWh4YkhhSFJYOGt4M3F6WFZz?=
 =?utf-8?B?QmpaZjlvUCtydUxDZG5jSHBLdk9TVm9IMnNLSlVOMlgwT3kwakp1MXpUVmJr?=
 =?utf-8?B?N0lOaVZULzFkVitIMlBLWk5IVWtkdDN1VDl3ZGNPNFBDYnNlcUtyalJhcUVO?=
 =?utf-8?B?SVloMitZa3l3VStWS3BRUEpDYSt1ZlhBaWVWeWVRaGluZ0ZuTHlrRjhJZzAx?=
 =?utf-8?B?YmN6SjRleWxlRFZ3U1dsbnlaSUM3dEdmYUw2QlkrbFlYM1BnYnpEQU1IeExt?=
 =?utf-8?B?MXgzNG8wZ2VSbDcreS81bmQzekMya2dGd093RkdzVXNPSUNkQ3lNb0JaRFB2?=
 =?utf-8?B?YmEyVHpsUEdhc0Y4Y21naGJsVlpyRERxaEVRcnhYQ1NSNDRwTXNwbUFWV3pu?=
 =?utf-8?B?enh4eVYwVVZSVE1jZ2liVTBGSEtZbWg5VjRHblNGOTI5NlVzQ2w1a1ZIMDJi?=
 =?utf-8?B?ZFIzSFhEU3Y1dHFPZHpCRHJPV0RUeFJGYjZmTEI5YWFDK2VMcWxibHYyNFpT?=
 =?utf-8?B?ZmVsazFoaCtVL2cvNStDZStWY0RBQy9DbWVoUUYxS2d0Yy9RTDlYYVBuL1h2?=
 =?utf-8?B?R1V6RVdqSkpHbk00V3NScnhGUmxsbGkvZmtYeFphVExqVFEzZ1ZJN3dzbkRJ?=
 =?utf-8?B?WXg4bWgxWkxTOHladUVKV2YzLzlZSnpWcENkWVp4anhDNkpSQktwWnZwaHVD?=
 =?utf-8?B?NnZnSmpmeUwrbldaSGxYOG5xSlBvdGc2MHdOUVdTSnBLcC9LT0V1TStPQVN1?=
 =?utf-8?B?Vld4VGU5aW1lMVRnVUk3T3JkYlJwSXBsdDh6Z1pBaGZJYURWMUtKNVRCWDUw?=
 =?utf-8?B?ZkdNa2dzOENxM0hLNEplWlZtZnJVeWJOK01XcWpKZVdYRUtRTis0dlo2ZVdN?=
 =?utf-8?B?R3QxdmpVbEJxaVNtU1pFSXRzbmxaeGNMU1oyUzlpaFdkOXJQdzdIdS85OE5M?=
 =?utf-8?B?THdqNWxEd042enhVSGdVZ2k0eHAxd2IyM0RTOTErYWFZUW15a1dvNlY3SDEx?=
 =?utf-8?B?TTZQVGpudnN4VFpqdldaeE95b0J6anpITFVsWEt4VE1qaThTWlY5UlFYcmRU?=
 =?utf-8?B?YzZlR2VNWEV5TzR5aVJQRVJnUzd4RjJPdUo5bnAvbkNLanRxUDJCOWgvcWl1?=
 =?utf-8?B?ZDZEWm9sdDd5STMwQUlaZFFpcHZFV1RrNmM4S0ZzTXlMUUZkTXJOZkdGaFhL?=
 =?utf-8?B?S0pUaUx3WDlYU25HY1V5U0FVS3BGNi9kNCt2ZjEzZGZValh3WTRaTkp4TGs0?=
 =?utf-8?B?MXc3THZQNnZNYjRvandTdjF1U0VMZUJPZmlnRStHOEF1Ti9veWdBYThMYWYy?=
 =?utf-8?B?VlpWcllIaW9KdzZyZ2JrVWlFNjREL0UrUnRlc1BqalA5MGpTSGRnNHN2ay9Q?=
 =?utf-8?B?akRXNis5Nm1jNjNNUXBkRzZvUkdLbEZaUUVJNFJjUkdxMWhMRHE0T25tQnE5?=
 =?utf-8?B?WHBlakl4aWVWOXpXQmNjejZ0YVpmUVhvY2pPaGFHT254SGRJeXc5T0Z6YVNL?=
 =?utf-8?B?a1hybjBYaUw5WDlJby9vM3hkQUlRTmxYSTNvUXFnMkpiRlh5Z0svdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2afa6a9-532c-4da3-c577-08dedddd4f3e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 17:12:52.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKdCFZzwkJF1N7xyFBbPZIer6cxVetmR1xpPZxFBWVevwWPSDzSNIRLDQKiGqCu5nWO4qhxnRmFE1IAciUqhTzygj2zrTUZ92EBh/ndCBp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4946
X-purgate-ID: tlsNG-c1860d/1783617175-1256E01C-289022E6/0/0
X-purgate-type: clean
X-purgate-size: 292
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE893733C1C

On 09/07/2026 12:56 pm, Jan Beulich wrote:
> 1: x86emul: drop wrapper C file
> 2: x86: put x86_emulate/ early in $(obj-y)
>
> Possibly the latter patch could also be folded into the former one.

They're better split IMO.  

Both Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

