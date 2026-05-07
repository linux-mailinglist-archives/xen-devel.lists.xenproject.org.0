Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O6/EMdn/GnPPgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:21:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDCC4E6B48
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302532.1576432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvrR-0006uO-Iq; Thu, 07 May 2026 10:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302532.1576432; Thu, 07 May 2026 10:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvrR-0006ro-G8; Thu, 07 May 2026 10:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1302532;
 Thu, 07 May 2026 10:21:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKvrQ-0006ri-CY
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:21:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKvrO-00AY4n-54
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:21:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc67aa-e002-0a2a0a5209dd-0a2a4502870a-42
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:21:39 +0200
Received: from [40.93.198.25]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc67b1-af86-0a2a45020019-285dc6197b60-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:21:39 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6146.namprd03.prod.outlook.com (2603:10b6:610:d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:21:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:21:34 +0000
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
 b=AKdpJnyONQe0H2FV3xbwKNQXJc0e5kKEThT9O9nMxJmLCd/gkaz40Qcr46bDOT7VGdWBAEhZlbUTA1meYv/XHQwSjEEPHE7sxO2/ZnQHFOyckhbL9YgXp8a9mI+A38p3MDIAg4Pimvwuae0u2TkCPIB9ivw9MuDHGecRkZMNyl7k0x4E+1KM9VQh8uqcYttBkuNau0PUjvJzUkfeNTcolzR+w09jbUN7VYH+w4kPhtPlHDgzCL+ZrKvwPy4YJkUKyDcWtCBvBgtIqdIcnGnWF8A1H+sWyysyvRotPuE+kafPz90Rd3C9xfT1FSQ+q/E6OBS5g/7KFlXhFQJGq29fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl6oFYl/rsQ6N3FKGFCKoa6SFiOovWYYmC3eLoSmgEA=;
 b=BZ3iAy++yZRmLpRtg7UQorrAJvEEmf5D3zkjPY2F1v9J2cSVG1MaQFVTYW5JbrJ0Ca4guiMrZGMoP5Tc01WYpK2icAUHqzbPQDU1fb0F+MvUDsnvBZxYgoAOxxw4JKMipeRmqE3NzVtkvfytAARFd2KWHZMNnLTN9UHAL82dY102yFgyQyBtrSCgBchNoPq0FBQ36C14AxyRKz2xSm8KcDONf4v07it7MqIl8P6xjzvegQsLEY0ngoyljINh3Ci1GDpuHWew0Y2eh2HVpx5Gb09np2oWTZruztYuBQKeIYViWt02BKtgbcUFmNKHflAnyCcxROSRi/CboCpNGKw0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl6oFYl/rsQ6N3FKGFCKoa6SFiOovWYYmC3eLoSmgEA=;
 b=vWzSkuvv4CT/hsMfd0caUyS4v3agNAektEyQ5e40GEnmhfupzNQshkx4NXBzSnyl63s3zxRNPCG6mkuZ8xgGP3eH0oXsjEpVXFdxcAygkr65CvlC9bZETTX/uOxpCvcc4U3saLWaExx6tuANBH2Bq4rbkrykzx12NERV24ffyRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 7 May 2026 12:21:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afxnq3kXflTvz4P-@macbook.local>
References: <20260506165157.68567-1-roger.pau@citrix.com>
 <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
 <afxRZtm-L1ZA8jF1@macbook.local>
 <b0d460d6-5828-41d5-9168-394fb54f80bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0d460d6-5828-41d5-9168-394fb54f80bf@suse.com>
X-ClientProxiedBy: MR1P264CA0199.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df7f1d4-c4ed-4024-f965-08deac226a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kKo7VnX52Xi/l38IL6f2pswD/N4OWty2566tPtZcONFH3r6e9GsiNUZXAbZopH+d6t9Kf1/MGE0amSPwemZR+EUE5n2wgH+0dhEuTkK5zpcs2M0kBdp2AxMqEfnu3Ms0dI0wbQAbap2CDPfV1dbut3CMSC0Ba9/ved+XQ7hTODKeuS5fY1c53+k+TQ2WIt1eFfIMDKd2eq4gaDuYlzjFjM++4qd+lhDCog9yrnWer3A67/uQK7iTA61PusOpojd/Rk93X1/FEOxIeXvaAtSnPuJfJ0Ew5fTnqyoPTrCcpz1ZDeE+TyBVPvkpl8IPKYXt0sePDC4CajKvR+KH37tB4q14b2h+0HM7RYC8e1IGNms/q721Zw1ZgDwhqLnGwkIX88StnK2aNSx0DZ6lEoLElvjJF+TX9ddcTn1eI1pCOTOeiO7jiR30JRTdEzFGT5AuIPQMgWoGCCKABRbYjsewhjmQSsfSJtHGEOtNFC9R7sSQ1OROlnCChK3xb+EBJ99vttrMLG6O1GWj5tFTMb5h31XdlCq7I9E0kuWc0IB3PvEo9q1C/Gic0TsnBxtlPac6QY+4vPjy23brl733vBy5ApEU/nxpndBF4buWhJjkapR3JS2jWWtaNLgzyvmzlQZApMwMce+yj0XIRBw8MIApQq0hC5MDyMNxXNFpY4uDc4++6PUe7Sz+Q4yUQ+tJ1ISP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1JJZ082NkVkY2t4aHg4QktPaFdFSkZhdlNqME0xRGpIYXVyK244c3hZd2lJ?=
 =?utf-8?B?UkdoZHFVQUp6bGFnRCtrVzhTa0ovVGhGb01MT0VWVm44cVlLNnlFV2lnc0VG?=
 =?utf-8?B?YjIyd1liOVZhMmxUbzVYaHZmNjg0MTJXTHNVcDJzNk01bUFvYy9XbXZCUW1v?=
 =?utf-8?B?TVQ1eXFqY3VsN2Y2NWF4VHQ5UXNSb0hjTC9IMFMySTc5OEZuL1Y4YTJDWU8x?=
 =?utf-8?B?N09RbXBTSlJWSVFOZkJZOFJUalVCTGlEMis5RE10bVYzOUtZTlZtcE5PZW9B?=
 =?utf-8?B?b3V1R0tTWktJUnRuT2FTS1RiR3QzQVQwOGx2YTd4SmFOQ3pCdVY4ckxkMnIy?=
 =?utf-8?B?dkpaclJ5VFl1NkQybzY1RC9LRndmZDBldUZ0WjlPZkd0NHBEUnBUOVBFcnp0?=
 =?utf-8?B?UUtGeDMzMGI0T09NNjJYUU9uNi90VmhLem5vaEpsY1RNNGptN0RRSU40OUZm?=
 =?utf-8?B?TUMraGJzN09WQmJSVW9WYWU2YXVLWTR0YmdrMGNhcUFvS0thM2JQR2U0a01o?=
 =?utf-8?B?N1NhWGlvNkVXM0p2RkszcVRwdXFFQUR6ZzloNkNWWU45WjFMc3pKak5PR2Qz?=
 =?utf-8?B?M24vOU9Ca2xHZnJGbVVobUtZY3ovcGZHWnllbUFkc25RS3F6akhRakR4VHVq?=
 =?utf-8?B?R1YwRG1Zd2dDajgwazljYnp3aVYrQTZvSEFwN1kyTXVFL29QYkcwTXBWd05j?=
 =?utf-8?B?QlBQUzdueUZXQUhpY1g3NnFvOHhsVSs0dmQ3VWhhekhiT3BwS3J5OVY0YWNt?=
 =?utf-8?B?YTAvNEhqZXM5N2pEUVpneHVrNE5nVE12MGpqZEduMWpSdjBGaVpjWFlDeFY2?=
 =?utf-8?B?aVFxSCtRUnhTT1F2TmpZMFdHMDlMQ2Q0bGJDTE05d01mWWFEYkc2RkVZNk9j?=
 =?utf-8?B?clNoT1dTWTVGeGFaendYd0ViWUwyN1EvaGZSZ0cvL2ZwUVFxRURCTTAvMW02?=
 =?utf-8?B?cFFyeHhKQVNuc0cwUmV1dFpYdEVLd01kVys1UFJVWkU2MEh2MHFoTlp3RUh0?=
 =?utf-8?B?ZTlLMFJTWXVadTJrcUpaaUhpUU9Nb2pod0hxRnlTay9MOGJwMWprbUtFdysz?=
 =?utf-8?B?TTAzYkQzSEZIaFVrc3RkTGFtUGVzMm14RU84S3VYN0RQem5uK3lGeFZHSTJG?=
 =?utf-8?B?a09DQXZZNGl5NlB5V3RYWlZIUU5uUm0vT3E4QU5TZDZuY2xuRXZOendvVjh5?=
 =?utf-8?B?NE5zQW9MeW1UTWpUSzJNZm1RLzFEZkFjZHdaL2locm0zbUU1ejFCblFkYUVS?=
 =?utf-8?B?WS9MbXlnOGVVR3pWR25GeVdma09nOGlVR3k3ajg1TVB6VU1oL3RUUXV5Tjlj?=
 =?utf-8?B?RGptdkhVRWJkSkZBVitzM3N2eFdPUjJtbXRtM25tQXlQc2FuSkFKODNIMjB3?=
 =?utf-8?B?VlQ0TzBhSklQTjFHNFRzcDRMK3ZEUmFSMlpvZU5mWkw5UXhBdTJ6UEZhQ09M?=
 =?utf-8?B?Zm1qMUo2a0FPangyVUZyWXNOSURhTTQzSncxUEVNRFkwOTF6Rkw3OForcXFB?=
 =?utf-8?B?cytCK1h3blFVWWV5YzF3RkpDa0wxKzBUeVFMQUdrWC9WT1V6K0FrU216Y211?=
 =?utf-8?B?MW92ajZjTG42RHo5eEZDb1dCS0VEZXhiWFRDN3ByVStZMVY5aUtlN3pxR1hP?=
 =?utf-8?B?OGRlUE9iL2RHTWp4M0MvYzJRVTd1bG5nUi9WTk9rRklZSjErOW0zZGV0ZnJ1?=
 =?utf-8?B?ckFweGJSYkwyZVBSZkJhenFLL0hNc0kyWmdrVWFIUjV2SE1TN0lkdWlZZklI?=
 =?utf-8?B?eXRHWEVvV1h0YndHQ3Eyb3Z2UW5YNWlZaEZORUNwZW11S3hPVlpnUU9jdFlB?=
 =?utf-8?B?ZUYrQUJBZGUvd2xnaWcxTE5mSGgxL2JwQUxnTWc0RGJMdXJPUllsbVNOYU9h?=
 =?utf-8?B?eldMblRHRFNzWEY0NVB3OGdEMy9MK2QwYkxKbEIxdXAvaFVvVUNqM1FhM1lr?=
 =?utf-8?B?S2RJR1N1RmpGQ0IxYUlJT3pvOXJrLzdJblhHZlhvdkl3SW1qS3F5T3UrN0dU?=
 =?utf-8?B?aHVoZVlBR3IxNFhBVnlNc2czYzVZUVRhWDcvWGpHbEE2aDJPRnBNSFF1UWE0?=
 =?utf-8?B?Z2JTbjVndXRNRisvWTloM3A0M2sybHlJbGliOXVJcEU2TDE3Kzd4ekY0QVZN?=
 =?utf-8?B?TFhJRTFzcVdXUVpKUXk0SDJiQ3dxaC9vNWQ2ck9Ibm0vd0o0a0VaSVZuYUhh?=
 =?utf-8?B?M01pdDh5QlZKMXc0Wm0zQlZaMmtOcVBRaXhwd2djQkZ4ZkNFMEFzeXFra3pk?=
 =?utf-8?B?YU5RU1lmUVJFd0M3OVE3M2kwM29sbzNDY0hQckwrUGpBdHhGY0NiVmx6bmdX?=
 =?utf-8?B?TzFWcEtOUzVKamUyK1RqcHFFb29nWEhlSjZ1enJsc3FSMEZTMHJQZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7f1d4-c4ed-4024-f965-08deac226a26
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:21:34.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /v23ACBqk4eAYg/p9uOHfHVwXfuYmXUugi8CtLx66JGiBXTv0WVz4JCqHlJs9jOg9NKGzLIc5F0C6BHaspIIhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6146
X-purgate-ID: tlsNG-720697/1778149299-82175161-8D3A2ADC/0/0
X-purgate-type: clean
X-purgate-size: 4403
X-Rspamd-Queue-Id: ACDCC4E6B48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:51:18AM +0200, Jan Beulich wrote:
> On 07.05.2026 10:46, Roger Pau Monné wrote:
> > On Thu, May 07, 2026 at 10:03:05AM +0200, Jan Beulich wrote:
> >> On 06.05.2026 18:51, Roger Pau Monne wrote:
> >>> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> >>> say the least.  We don't know what registers might be there, nor which
> >>> values might be safe for those registers.  On a forthcoming platform doing
> >>> the zeroing of the MMIO region does put the IOMMU in a broken state, which
> >>> is not recoverable by the IOMMU initialization procedure in Xen.
> >>>
> >>> Instead just zero the control register, which mimics the current behavior
> >>> with regards to how the control register is handled, and ensures the IOMU
> >>> setup is done with the unit disabled.  This approach will need revisiting
> >>> in order to support Preboot DMA Protection.
> >>>
> >>> Fold map_iommu_mmio_region() into its only caller, as the function body is
> >>> just an ioremap() call after the removal of the memset().
> >>>
> >>> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> While you got Andrew's R-b, I don't view that as enough to commit it. My
> >> prior concern towards ...
> >>
> >>> --- a/xen/drivers/passthrough/amd/iommu_init.c
> >>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> >>> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
> >>>      return iommu->ht_flags & mask;
> >>>  }
> >>>  
> >>> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> >>> -{
> >>> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> >>> -                               IOMMU_MMIO_REGION_LENGTH);
> >>> -    if ( !iommu->mmio_base )
> >>> -        return -ENOMEM;
> >>> -
> >>> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> >>> -
> >>> -    return 0;
> >>> -}
> >>
> >> ... this part of the change wasn't addressed, neither verbally nor by an
> >> adjustment to the description of what was committed. As previously stated,
> >> blindly memset()-ing the entire area may not be the best of all options,
> >> but the downsides of not doing this need to somehow be addressed. As
> >> indicated, once they run out of bits in the main control register, they
> >> likely will add a 2nd one. That'll then also need clearing, yet we have
> >> no code to do so anymore.
> > 
> > I could introduce an opt-in command line option that forces the
> > zeroing of the MMIO region (to have the option to resort to the
> > previous behavior),
> 
> But we don't want to fully go back to this. We'd need a form that zeroes
> what may be zeroed, without causing the issue you're trying to address.

But how do we know what needs to be zeroed?  We are then in the same
position where the introduction of a new control register would cause
the zeroing to no longer be accurate.

> > but I was (wrongly) under the impression that we
> > have agreement the proposed approach was the least bad of the ones
> > available, sorry.
> > 
> > Note how VT-d also doesn't zero the IOMMU registers MMIO page either,
> > neither does it seems to zero the Global Command Register either,
> > which I'm not saying it's correct, but is at least a (possibly wrong)
> > precedent.  I don't think there's much we can do with the handling of
> > enabled bits in possibly registers not know/handled by Xen.  Like on
> > VT-d, we possibly need to rely on the firmware to handle the IOMMU in
> > a half-sane configuration, with no enabled features on registers Xen
> > doesn't know about.
> 
> As indicated before, for firmware we can likely rely on that. Pre-boot
> non-firmware environments and especially Xen being kexec-ed (or being
> run past something which was kexec-ed) may be of more concern.

Do we really support booting from such environments?  We would need
much more careful handling of enabled features IMO, as blindly zeroing
the whole MMIO register area is likely to not make the IOMMU happy if
it was in an enabled state.

Note for example how Xen was zeroing the command and log buffer
pointers ahead of disabling the features in the control register, just
because those register are ahead of the control register in the MMIO
space.

Thanks, Roger.

