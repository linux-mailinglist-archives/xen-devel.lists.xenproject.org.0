Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGsgJ9qoHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB32621F7D
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323945.1589653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oM-0007RH-SM; Mon, 01 Jun 2026 15:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323945.1589653; Mon, 01 Jun 2026 15:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oM-0007MW-Mw; Mon, 01 Jun 2026 15:44:18 +0000
Received: by outflank-mailman (input) for mailman id 1323945;
 Mon, 01 Jun 2026 15:44:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4oL-00078o-FD
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4oK-0007hv-Rg
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-2eae-0a2a0a5409dd-0a2a450ba75c-16
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:16 +0200
Received: from [52.101.85.22]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-212f-0a2a450b0019-346555167c7f-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7453.namprd03.prod.outlook.com (2603:10b6:408:1a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 15:44:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:44:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M75WuklhbttYkAJGfpsimMWxVvqQX/NmkLqtQ74Mu2/HbO/oBGvADoTTZ0cBv2TbZpUqRs9wFGMEMdvp1jV/l0atECxSbP+C18fSVdhHE8EilxNFdxZmj169B5VjBlmq6+OHk8wmfyQ4KDGX401qonfPsXHveMYC5yp4ziEv+Yk8sl7Dxj520O/aX0SsU3V/DFyFG6gd/mi50GBpBWZlryzbUv0HA2T2lBqCz2cwV5i9rD7e7+Mn4yqbvyjD+20630nNIb3zGlsInjbLGJfE1DwskFntphw4flWY5zQq3TJTPwBYOEfRdCBvJx2PZs8kDL0J1z1MLUW+6zrDINtEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLxPZPhUumrMhLXcS8jOcQqLOD7g9VReX2rfeaQLJt8=;
 b=jYPnB8VUUQaKuL8NjDZ6LS1ANds8LIs+JjUHIWT9rqql9au2MjTQ3F7H6yHgdixCfDV5lrSdfde6i4MhIG3xk8GPQMX4CL/GStbrAnP/J4XRmQGHA/l9gKGDsbLgrnDSblERXBdO3w+0GyXySGNtmsMBWvejc/+4VelwhiHgsBAcYp7dkEDnRyuoscdIGIk5Vk3+0KiJ/fm5F7HuhJjKN0RGxILcSaCokKGAfQsOX+UsE81c+GvI3lpTAxHZaFnUsLvbjvKt7tX/7UZBvioaEEQPcDXaHFjRdp5Jx9Md9WWdgEirKY2mr4BJwrJrmhK3uYrfLki70O74Fzhf829wXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLxPZPhUumrMhLXcS8jOcQqLOD7g9VReX2rfeaQLJt8=;
 b=B2UrWOgZyvkZo8PXYrvn3bbDvH2H/M3IfPQ3Q4+nf0CKNmpt3dA/wt4Ek8vH3AfxyLz4aoOfxU78CATFTmTlpgStbKps6lQ+40dVLWVkeCWYdkC09zJp9AejMqvF5Eev8vWGZVQK7opFFa7rY1Jo6zwKGR1vpQTt2aTtnORoVz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory affinity ranges
Date: Mon,  1 Jun 2026 17:43:32 +0200
Message-ID: <20260601154332.30797-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:408:ec::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 1575ac56-c659-450b-6c91-08debff4a1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|6133799003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UJ0bJe0sYLFZRiVoQJme9C8PJtit1ef14PABpI8jZ+NNdpRGvV+npHgAws3JAx5ggQErgrS2OauMb3kGo2Cc25FLs5lG3mGF83X7F15gtBre1cra4cUq4kuyPIajSnqq2LNjOBZIPq7ckooB75EOJyNKNFEd5lP6likFaeI8fsBclCnA8OH2eLL0/24WeKFafUBSes8FVfDn4MPiVGI672bim8Q8qHNDeuJ1tdyRkRaDZ73XdkwkFFZoTVx2IjQbrqZwudFFCyUR0Ll4Z9jw+77VkXuXXYWJmGIe5MqkiG8rsDTRqJsu6+dO7ugtASUSUgSiRtXAjcblToeCeK3/Fg+wTy+8YSPnv0OuDAI7qgQUVucneqgdegkqmhhs/NtwhxzPl5H8ZKEcr+1WvOQwTpizxQ2vOqyzQAFzeWFFDq5iUbID4z4VnvyldGjWZiSsainHbc6smcWKdcTSB3AMGDv5mw7ctWmucbRuLBsieVM9ei+nVrK37un6E3S3hEdV6iwdCzt3MvNfCdILow8YInRny+J4PrEU20SE4PLFcAS+5s2vn8f1SDIwY2obN0x5FqUxpwAxqNE2YZpY8iF3fHUwE4LcG2YkMsV2K+gmVbJHPbVk74PyQtkkjkIn/uw8xWZqpCLcjBetCL8HkEBrBFAGWvOnifGGK1MNFeQllVUYwoHX1m7XBJaT1+PuI7rU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUR6cWQ0bnBrYXJpKytZTHVZOW5sU0ZrcmpMMDNsMFZTSXZkK243YmhBaTZs?=
 =?utf-8?B?ZXdxbllJU3ZmY2hod2VlK01FeElNVGhXRXpYVDU2RGFmOWcrNGFFdmZucjJU?=
 =?utf-8?B?T1owY3NwWkpNL0JEREF0cWFYWktzMk9FT0RYWDVFZ1krSWlQQmdaeWJRb0th?=
 =?utf-8?B?dDNpL3JIWTFjRGJZa0VOei9zVnBNOHduVHFodHBZSHJmMm1nUmQvQXl3dHZ6?=
 =?utf-8?B?VFZhdUN1Mk8zYlhmOEJqZGNDMm5CeDRZLys0UTh6VEJWdkN1cXp1S0NjVmp1?=
 =?utf-8?B?NUV3a0FRbVM5T3lJbnpDdCtIM1JBZ3JqOFpwUGZsUnVHL25kLzJQekhtV3pB?=
 =?utf-8?B?U2cvckRXTmltRXprb1JKWFAyRkxQQU1KN1ltcHBTcEZYMHJWb2hUQTRPSC9G?=
 =?utf-8?B?T1VTc0JKSXgvSkQya3BNUFBsMlg3R0YvaysrclFNOFZmc3EvYUxDMGEyUTlC?=
 =?utf-8?B?NGo2Q3Bkd3ZmYWp5TU13bG04WGxYeU5hTnVOSzd4Z0JYdEFjZEhMOUFOWWd4?=
 =?utf-8?B?MWc3RmtnMDZ5NXFlTFk4UGVLNnlSa2xsdFZFc3c0TWJ4a0lORndBYktVWTRx?=
 =?utf-8?B?NkMzbE83eHFyWTVRRHUzUXRlWlI4cmlPcjBaYkxGYWpvbEhzakszUjFZaGpP?=
 =?utf-8?B?aDFJVWdLTmVrWHN1V0xNUm5RSCtiT1paU0NSb0FINXhwSm1PR1h0aWR0eDlK?=
 =?utf-8?B?Nk9oM1lHQ2E0aExJek44dnRrMFYxQWpKNDU2S09mdEE0clpxVFh6dmszb01X?=
 =?utf-8?B?T2lPTDZ3eW9YbTRoVGJ3VTJrY053VWhxK1ZvYUNLWkpNUXQyckRKd3cxMGRF?=
 =?utf-8?B?VDgzdWxIbTlHcFdGWjFFMldENUJMcEtjNEtyY29uNEVFUEtPUGlEUE8vM3RM?=
 =?utf-8?B?S0V5TDRnSnhHMzVTSEZVTWd5RTZBbC9uOERrWjNtT3lwNmV6SldOQko5UHlj?=
 =?utf-8?B?NmlCRG12R2lUQ0hjRTZodnd2QUFmZzUvcmtrMWdmd1JkR2RRSzJlbzQ0UGxY?=
 =?utf-8?B?WE5MUU1zdmxUc3F5NjZKZm91d1I4K0M5bjBlSzhyekJCRXlsQStCUDRMMmF0?=
 =?utf-8?B?ZW50M2xGR0NzR05mQjE3MXRLbUdEbHVoVTkraXY1aEVTTWpMcEt4UHpFaWNQ?=
 =?utf-8?B?M2ZZbHBZL0MwNnJwaHVxUkFINU5mRHE3bmlJN3daS3ZMMU5TOUtYNU1TQURL?=
 =?utf-8?B?U0lEUjcyYTZLSVNRTnZtbUUwQWdBMlV1a3R5WlczNDdyOWR4WFpxM0ZmaG55?=
 =?utf-8?B?UHAxMENVZ3ZEckdVV2crSmFZai80VEZXazBjbmxodHIweDlRTnhFejZwV3hh?=
 =?utf-8?B?S3hVVE5qaURRdmhFV2psTUlSaDk3RmxZeXBmZFI3UkJqUGFBcEFES08wemRK?=
 =?utf-8?B?MERGVzVxVGgxOVBHcDgrRzQxZ3l5ZzBBdktpVVYyVGZVN3NxLzk0UHUraC82?=
 =?utf-8?B?MW9pQWI2R1pUTmhYVzVwc1dKK3F1WkswanQvOHB0NmpNUHpyL1J0WG9kWWs0?=
 =?utf-8?B?ckc5VWR6cllmTFlhbmpJVkRyaVExUEk1V0ZkM0UyYThwZVFRbDRIWFErK25n?=
 =?utf-8?B?dkY4RWtZZXN0MmpadnI3bUMwQUN0Q3pKWi9qbWJhOC9sY3FDMDFyQytJa0Qv?=
 =?utf-8?B?cm1QWU5yMXdnWCtacVJpY0ZZM1VGNUJoeWtLM1Rya2tJWVhueGxtTC9CdTlu?=
 =?utf-8?B?dFFRU2dEWVZnanJ1bjlRbEFDT0dvc0s1R1ZUNXA1ekJEbGtQYWh1S3lzWnBa?=
 =?utf-8?B?MjkyNW5ERXpLa2tKWUJtbWZZTlZVNWdTWFRPUXdUVUVzTkNMQTRGdE5xMTdk?=
 =?utf-8?B?MVZLdVFydGpKTEVDby9JQ2k2ZjZEMnplMDdRQStpdFFmVEJpWXRPOTB1U1VR?=
 =?utf-8?B?ZlE2SDB5V2JjOUdtT2RQMGxxZUxFeFJHWXplZHB1Qk02MlVkNDNSNlBpb0ZY?=
 =?utf-8?B?ZlFlMXJBV0NhU1RLblcvL01hME9IYjhoS1dqNnFNRWIwcE5sQjEyVkN4RElZ?=
 =?utf-8?B?cU9xa2Z5bWlsUVNmZkw5YWNkaFUzVzltY1RWTnlhcHpFaFFxTzBhbnQzTDR4?=
 =?utf-8?B?SGVhZVk3dWI4aHhmNlE1aDIzdUhaQUo0Rnl1VXBqMWZvUkN6NGJnMUkyRFdP?=
 =?utf-8?B?cE4rZ1BHVXQreW1mNHlNVTFsZVR1eDRpVURGQi8rdFMvWXhhK0hMOEEzK0lH?=
 =?utf-8?B?NUdlZnpLdnpOTy9Zb1hDa0dEQS85YjM4ckM5Z2J4SFJlSGl0NG5LdEcrTWFo?=
 =?utf-8?B?U3o5UXR4L0p4KzNhZ2pwMkhLYW1pZzBpUmdWM2l2emsranhCV0dpNEd1Z0Uv?=
 =?utf-8?B?MWRVdW9HbzhFcklZWTRIL0JSWTJIT3M3b3hQTlVqcDcxMUF5MGU1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1575ac56-c659-450b-6c91-08debff4a1dc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:44:14.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YsYoe4fTTdBvC25oSKWqBxcH74TYvnrKYs7mCojV8Chj4EilVY17ZgTa3d8WQoDZx9I2ddvD4rN5RpyQwcJuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7453
X-purgate-ID: tlsNG-42698a/1780328656-23374F3B-1A02A1E0/0/0
X-purgate-type: clean
X-purgate-size: 5449
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEB32621F7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The logic to populate memnodemap in populate_memnodemap() assumes that all
ranges are aligned to the hash shift, this however is only true for the
first address in a memory affinity node.  Any subsequent ranges belonging
to the same node might not be aligned to the hash shift value.

Such lack of alignment causes issues to the logic in populate_memnodemap(),
as then the tail of the range might not be properly accounted for and setup
in memnodemap.  Fix this by forcing the start address of all regions to
be aligned to the hash shift; if such alignment causes a region overlap it
would always be between regions on the same node, and hence will never
cause setup issues of the memnodemap array.

Introduce two additional test cases to the user-space NUMA setup unit
testing, first test case is the native memory affinity and memory map of
the system where this issue was found, second test case is a simplification
to demonstrate the original problem more clearly.

Fixes: 1666086b0044 ("x86/NUMA: improve memnode_shift calculation for multi node system")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xen-tools/common-macros.h |  1 +
 tools/tests/numa/test-numa.c            | 45 +++++++++++++++++++++++++
 xen/common/numa.c                       |  8 ++++-
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 9e2799178235..88b4a0e5a693 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -69,6 +69,7 @@
 #endif
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+#define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
index bced68d4d7f1..8122e63a88ed 100644
--- a/tools/tests/numa/test-numa.c
+++ b/tools/tests/numa/test-numa.c
@@ -158,6 +158,51 @@ int main(int argc, char **argv)
                 { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
             },
         },
+        /* System with unaligned affinity memblock. */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000000000ULL, .end = 0x000afffffffULL },
+                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0fc4fffffffULL },
+                { .nid = 0, .start = 0x10000000000ULL, .end = 0x103ffffffffULL },
+                { .nid = 1, .start = 0x10400000000ULL, .end = 0x203ffffffffULL },
+            },
+            .ram = {
+                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .start = 0x00000100000ULL, .end = 0x000165bffffULL },
+                { .start = 0x00016600000ULL, .end = 0x0001aa1dfffULL },
+                { .start = 0x0001aa1f000ULL, .end = 0x0001aa53fffULL },
+                { .start = 0x0001aab8000ULL, .end = 0x0001aac6fffULL },
+                { .start = 0x0001aacc000ULL, .end = 0x0006f3fefffULL },
+                { .start = 0x00075dff000ULL, .end = 0x00075dfffffULL },
+                { .start = 0x00076000000ULL, .end = 0x000a7ffffffULL },
+                { .start = 0x00100010000ULL, .end = 0x0fc43ffffffULL },
+                { .start = 0x0fc45000000ULL, .end = 0x0fc47ffffffULL },
+                { .start = 0x0fc49000000ULL, .end = 0x0fc4bffffffULL },
+                { .start = 0x0fc4d000000ULL, .end = 0x0fc4d3bffffULL },
+                { .start = 0x0fc4f000000ULL, .end = 0x0fc4f0fffffULL },
+                { .start = 0x10000000000ULL, .end = 0x203fd7fffffULL },
+            },
+        },
+        /*
+         * Reduction of the issue above: introduce an unaligned middle region
+         * with regards to the hash shift.
+         */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000ULL, .end = 0x00fffULL },
+                /*
+                 * The offset of the region below is not aligned with the hash
+                 * shift: the shift calculation only takes into account the
+                 * start of node address.
+                 */
+                { .nid = 0, .start = 0x01000ULL, .end = 0x04fffULL },
+                { .nid = 1, .start = 0x14000ULL, .end = 0x14fffULL },
+            },
+            .ram = {
+                { .start = 0x00000ULL, .end = 0x04fffULL },
+                { .start = 0x14000ULL, .end = 0x14fffULL },
+            },
+        },
     };
     int ret_code = EXIT_SUCCESS;
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 8544a1598218..8b2f29597f30 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
 
     for ( i = 0; i < numnodes; i++ )
     {
-        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        /*
+         * Round down start address: if start is not aligned to the memnodemap
+         * chunk size the tail remainder might not be added.  Overlaps created
+         * by rounding will fall into the same NUMA region.
+         */
+        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
+                                       1UL << shift);
         unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
 
         if ( spdx > epdx )
-- 
2.53.0


