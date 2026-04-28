Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM4ROCCz8GnsXQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:16:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325EC485A7E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296181.1572612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiHy-0003pt-TY; Tue, 28 Apr 2026 13:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296181.1572612; Tue, 28 Apr 2026 13:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiHy-0003nc-Qx; Tue, 28 Apr 2026 13:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1296181;
 Tue, 28 Apr 2026 13:15:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHiHw-0003nW-Vv
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:15:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHiHv-0024ne-SK
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:15:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0b2f9-2eae-0a2a0a5409dd-0a2a4507a3f4-24
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:15:43 +0200
Received: from [52.101.201.36]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0b2fd-229c-0a2a45070019-3465c9242bfb-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:15:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL4PR03MB8039.namprd03.prod.outlook.com (2603:10b6:208:58d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:15:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:15:39 +0000
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
 b=UCYiv9jRI/T38x6j3bKrta0v65ACehG2V00fQm0znBPmavTZIEX725wS8wtVnt+cibXr9Pr/BmzrzsMpg3bSbajFN+MphsegXkl2ySmujv3TBAn336MZsov4I4J/FFQP6PunQ0FbdYn3yDqZcUd2QRf9DZgNOG8X2ZDFAEV8XBPJwG8fBWo1rbASPnyftwz7hg06/GUpgIsqR9PSBBQEllGM/EVDPiAnU/yA4YixvShmzybpGXeiCgvsPWWcSjHVOeD/BESbeQTsv01Lw5n05Y5roIVdfZlq79v1C9GUikBK7+olGUcIFYdcQLoZQ4qz9AYsnoTt+UIg4Ltzu9gq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q83bzdTX69Ur04jV3IB5WpmjWLEIXSmzew5cCIO6l64=;
 b=mBrd2tpvqjrYAO0EMXNkNOkF1JePDj+GQ4dW11u4WsMUKwL1XjViblK57YzZp98Xj5axgn1vQUahdXLnBnTT15ag6BLszGRk8L9DLwMc0/V2JuPNArhSScBKXHdodMxLyQazLmRGPY4wreLh3IkWiCxlbyU3AZK3BVFvn11lKKuPN8rlweCc8zesbKTswkZQW1IaBybQURyPqT9NH4bPPXkPH+z9CABSU5VQMrDt/PSdYO9VSBroJCP7IZyYHVXO1IJu9lV2VX8F+xA7Tl0c0m2mgp3MZDvb4NZX7s6ddd9iaawRp1kXMbZ3341K0FAqLoe/MrdvEYOBNptyMLIQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q83bzdTX69Ur04jV3IB5WpmjWLEIXSmzew5cCIO6l64=;
 b=tm6p9AtIqVCx9IMICFfCMV4I3d2r7Tz3XNcn0lDNi2vjmn+PLZs3Py3SLqLHDHGcJE9+OpLckvQ4tIiV7VF2mfE3xELavh/YxlU6CeYNjk7TmKXLLkkvUnE/uBI6qzJBGBXZpdY3SKJviKliBiNGs+44p0jFRrq8kAzvpkfF3uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 15:15:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 07/17] hvmloader: add basic Q35 support
Message-ID: <afCy-IU85MdDBlUq@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-8-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-8-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL4PR03MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fddcc85-336b-4d34-8df2-08dea5283e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OYH1Hm7L98m7jhM1SqtbOpJYjoMP8rc/VmBHbymRYc/aEeOO+X1bCGkkLExH25kBk8gzYvmwq18YoupCrSoPAh5s++4wWT2V917JVSMeTIE95wHuuH5OZ8oLoWqRlvMCxgqgyFGjVVqFCeyN4JhAxo17YzX8vHfbnjzFuSfDYu628Swz3IY7svOd7ZFZ1wjXDkg4/0jnYCgSNMBLviZN4KzHTjLsYdf+2Q9u8nsNtkt3evQygWugNRhCdc9USSrHyL86KX5Mz3cM6Kbw4OfVe3F6xpTqymjs236WJtoMxmrkhr10LYw3+sWtX3u7VfQPmNtHV68ayuJtbmQqLtz6mnpSCBbY237yifCV2pTmf2yMYuFaPLhhP0dk/7vrE2dI9JoPNP/n2jJ0G3q+4jiIgNbBxI4wOtrNbmxnpZbXFaN/zAJ28uXGIRczE7YHwoyLhT1zNhH/sc8ImAgDDeUUddUmX3N4VGYQIHDxJ293kXwx6GnoT7+IDD3ML4F4XeM3IJgknPwv4JnG6eN1nCAclNRcJ3ryEXPbdEx9G7U3hvvYhqrLOL9QwJWgpZZOTx573toBduiymVC4BeyINOmG8ppZ9xN6DFjfYYk0UKch1x2/y+I+RAbLjF6/0+8mefVqnvCNrKFv4zXfr0MjlB7QgoUQwEuNWCsRfhzeb1leU6ZJQ5eRbpKu3QgowfU8rMrDRFn9KKWVMRxOiXs2uc0AzJckWx1HGrNF8fCJhQiySW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhkbkxseW8xaDZSRlloRytnUkpmeHVvV1pQeWpJVk1vSmpYak52OGw1eFkx?=
 =?utf-8?B?ZFBNNmdQekpWYVhlenBSM215L1BXZ0VNUFI2cXV4aHZ5ZHZjNVJqS2dVcWVo?=
 =?utf-8?B?dkNGRzlZb1cva1l1c1hJbXlqOEQ1czc2eXBleEw3MWl4c09mcm9RcytxSEZh?=
 =?utf-8?B?R2NTQmw3Wlhvc04zL1RSVjZWWUFpVFdsYkt1SlBydTY4U1Z6NXZZU25Lb25u?=
 =?utf-8?B?UUlBMkgxTFFHWFkrN3pjK3Y5ODc2T2ExMHMydW1GU3NaSlZFZS9WZmJjQ1Bv?=
 =?utf-8?B?WGw2aDg2ckFteDlCZEVzUGM3VVdJaVpMd2hadlZsV01LTzY0UkMzdTMvZkdG?=
 =?utf-8?B?aGNKZDUrQlVycVBBV0JrV2pDUWhYVGlEREtiZ3NDYXRsekFuN09OeFpoVUwz?=
 =?utf-8?B?ejVKT3dmZCtITktxYWs5ckZneUdOYldnNzR0aUVaUnQ3cEV4MTl0NERseUVE?=
 =?utf-8?B?UVVqWE5keEtkYXByQXJvenN2NGcrUm9sS2R0dldkVG50M2pBdDBBU2E3N1hv?=
 =?utf-8?B?MDFjNkVpZ2tDT0dWVUNMa2FBdjhxYnlHZmZjRDNMZVlkdElPWEc4WmhCSEsy?=
 =?utf-8?B?NkpRYU03ZUhxZDBrNFk3MTZnQm5jbEwvTVZLS2NtQ3piaFF2bDNvVmN4NUpv?=
 =?utf-8?B?cVloekF0Q21DOGZ4UVY4RVB5U0g2K3dlam05Wm55VGs0bjNKSFFPWDEwdUx3?=
 =?utf-8?B?TkVmZ2swRTl2WjJ0aGY5MXN4UENpdXlNckNZakFmd21seUJlbmVUKzJwOGJE?=
 =?utf-8?B?ZUw1RGkrY1Z6bkpZRkJNZlRmYlBEQ1A5ck14T3Y2b3g3b3V1cnRzREczNWx0?=
 =?utf-8?B?RmJxZCtRUXpEeHVzNHJ6d2pKY1hUYzkvTUtOZFJOVXc0WGx3VkFMU2o5QVpF?=
 =?utf-8?B?eW5wUktXRXQwUkRXdThSZHdSMThWZjFWek4yUlJOQ2R6ZTJyZ1ZmU2wvUU81?=
 =?utf-8?B?L2RnellRN1p6NXNWc29MQnFJS05POUdZOWU3OEVOWTNZdVBoVTBZUy9wT05O?=
 =?utf-8?B?akpYa21HeThnbGEwbk1oc3REWlFmcUw1SG54M3Yyb1R2UUdNdDdyY0FESVNB?=
 =?utf-8?B?ZkFuOWY5Y3RVS0hkQXRUd0NWOWpmM2ZGUkw5Z0w0UTF3Z0RlRzhkQjZ2clVM?=
 =?utf-8?B?TlN6MlZtVjNTekhCTWNIS0lnZlNqeXZtV1lLU0ZIWGlaZUprSERDL0xKdmJo?=
 =?utf-8?B?SCtXM0h2Nlh2MXhrWHZQSE94cHc1bFpJVmpreW9JRlhYNElHSlJzMmdhWEJX?=
 =?utf-8?B?UksyeEdCVnpnT21TTUNqU0JYM3NaTE82R1B5SmhjbTFCeDM2MHJLTTRGWHZF?=
 =?utf-8?B?M3c2TlBXRG90TytKWUloRy9pMkFxZ0U0Q3ErV2VFaE5oZDU0VW8waCtyNi9u?=
 =?utf-8?B?bkV2QlRhcEFaTHZWV3B3T3VnSW5tbWp1WGhHVGhPQ1lDK25pUFBDaFM0N2lh?=
 =?utf-8?B?a3dUcUk2Ly9sM2NkelA3STg1NmYvM29IcDBtREhBNk1oemYwb01CQk1sRVpR?=
 =?utf-8?B?SFlycklyTm9DVnhzNjJzcjY1d2U2UmtmRGZva29BVGRzRXdvWitsMGtwZ3hY?=
 =?utf-8?B?TUVHbmpKM3F4ZURpRE5Dc0VKZzJZZ0JETWN6d2xTLzhKNmEzU25hK2FtZkxy?=
 =?utf-8?B?ZjQ2b0tHWWVCTm5aanJjeW1UOE10NzUwZWt5SGpVSnA3bVFDS29DTVpxRzIr?=
 =?utf-8?B?VmdIZExxRmc5aGNWS2s2MXZETHNQSitSeTN6RkIrU0ljVi9VQnJuVjRXR2dx?=
 =?utf-8?B?NE1pb2hYM0NHS3JPb3lTT09zL0FvbFZiTjUrdk9oaXpHZ3JGREpqWVRzRlY2?=
 =?utf-8?B?NTduR3kvUzlCVTNMNnR1Zkd6ZWsvdDlQV2pUZVh1VFVJc1hoL2luZFRsNUV5?=
 =?utf-8?B?SmZaYlBzYVUxNzJPWVZpY3VBa0NZY2FSd3hGZFEzbm5veldvRkVDZC9GQlNj?=
 =?utf-8?B?NUp1TW9pOFl4c3ZuTUtaZE5mUE5GRG9mWGRNNDg5M1ROekZaTCtmZEx5YmZG?=
 =?utf-8?B?YUFycGdQOTRmSjl2dlIwTW1QZXBwSytrWS9Bd0ZRb0JRdTJyQ2lQU1d6YjUv?=
 =?utf-8?B?d0FtTkNuNDIwWWhCMm00aTIxdzQ1SEIrNXQzd0t5bVpsVDIrRnpKdDlwR2hx?=
 =?utf-8?B?Qkk5WmxMYk1YSXBpYkRrRXdkb3BZUnYxTGlqQU5lK1BFZVFSZjBCOXN5bnBj?=
 =?utf-8?B?RUs4K0lTbG94UHFoQjZRQWM0SndiVnBULzltV3lzblNYdnNOZkEraXBhRzFw?=
 =?utf-8?B?MnpBZldnWFczeE85VG9xZjRJb2VZb2xyUG9hZHFuTDhmOWNiSW1DUVlDYjBX?=
 =?utf-8?B?cWZ3QjVUNVM2SkYrS2pvSU0xWHZhYkhrTW5xcTBOcjZXMzVkY0lWZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fddcc85-336b-4d34-8df2-08dea5283e18
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:15:39.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQyLcJett4mRrfdCNKNyEDIRB3rYVpL5sxWy1pM/rzpVEIbvrnbcVdt4rT/nC2StGsUqxEfmAGFIoP9MU7Rc6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8039
X-purgate-ID: tlsNG-ef75cf/1777382143-15C5CC48-66971B5A/0/0
X-purgate-type: clean
X-purgate-size: 4190
X-Rspamd-Queue-Id: 325EC485A7E
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:02PM +0000, Thierry Escande wrote:
> The current hvmloader implementation assumes a fixed PCI-to-ISA bridge
> at 00:01.0 (PIIX3). This patch introduces support for the ICH9 LPC
> bridge used in Q35 machine types, which resides at 00:1f.0.
> 
> It also initializes PIRQA...{PIRQD, PIRQH} routing accordingly to the
> emulated south bridge (either located on PCI_ISA_DEVFN or
> PCI_ICH9_LPC_DEVFN).
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/config.h   |  1 +
>  tools/firmware/hvmloader/pci.c      | 34 ++++++++++++++++++++++++-----
>  tools/firmware/hvmloader/pci_regs.h |  1 +
>  3 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> index c159db30ee..baaed91c7f 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -54,6 +54,7 @@ extern uint32_t *cpu_to_apicid;
>  
>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
> +#define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */

We should introduce a macro to generate BDFs more easily in the
hvmloader context.  Having them as plain numbers is not very friendly.

>  
>  #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
>  
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index a76d051bdf..91c7fd2171 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,10 @@ static int find_next_rmrr(uint32_t base)
>      return next_rmrr;
>  }
>  
> +#define SCI_EN_IOPORT  (ACPI_PM1A_EVT_BLK_ADDRESS_V1 + 0x30)
> +#define GBL_SMI_EN     (1 << 0)
> +#define APMC_EN        (1 << 5)
> +
>  static void class_specific_pci_device_setup(uint16_t vendor_id,
>                                              uint16_t device_id,
>                                              uint16_t class,
> @@ -140,6 +144,17 @@ static void class_specific_pci_device_setup(uint16_t vendor_id,
>              pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
>          }
>          break;
> +    case PCI_CLASS_BRIDGE_ISA:
> +        /* LPC bridge */
> +        if ( vendor_id == 0x8086 && device_id == 0x2918 )

If you don't add parentheses around the equal comparisons please also
removing the existing ones when moving the code.  Also device ID would
batter be a constant with a proper name.

> +        {
> +            pci_writeb(devfn, 0x3c, 0x09); /* Hardcoded IRQ9 */
> +            pci_writeb(devfn, 0x3d, 0x01);

0x3c and 0x3d are PCI_INTERRUPT_LINE and PCI_INTERRUPT_PIN
respectively, let's please try to use the named constants when
available (or when they can be introduced).

> +            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
> +            pci_writeb(devfn, 0x44, 0x80); /* enable PM io space */
> +            outl(SCI_EN_IOPORT, inl(SCI_EN_IOPORT) | GBL_SMI_EN | APMC_EN);

Most of the above looks like black magic.  It's not like the context
of this function is great, most of the existing stuff is poorly
documented.  Can we get a bit more comments about what's this supposed
to do, and maybe a reference to the Intel specification that lists
where those PCI config space registers are coming from?

> +        }
> +        break;
>      }
>  }
>  
> @@ -152,6 +167,7 @@ void pci_setup(void)
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
>      uint8_t pci_devfn_decode_type[256] = {};
> +    int is_running_on_q35 = (machine_type == MACHINE_TYPE_Q35);

Maybe you can avoid that and instead simply store the BDF of the ISA
device?

unsigned int isa_bdf = (machine_type == MACHINE_TYPE_Q35) ? PCI_ICH9_LPC_DEVFN
                                                          : PCI_ISA_DEVFN;

Or if you really need it to be a boolean, let's make it:

bool is_q35 = ...

It makes no sense for it to be an int, and the naming could be shorter
IMO.

Thanks, Roger.

