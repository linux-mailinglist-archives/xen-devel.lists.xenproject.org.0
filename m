Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF5xMKes8GnOWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:48:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9FF485134
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296150.1572547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhrQ-0006l4-AP; Tue, 28 Apr 2026 12:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296150.1572547; Tue, 28 Apr 2026 12:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhrQ-0006ir-79; Tue, 28 Apr 2026 12:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1296150;
 Tue, 28 Apr 2026 12:48:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHhrP-0006il-A5
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:48:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHhrO-001wyy-MJ
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:48:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0ac91-2eae-0a2a0a5409dd-0a2a45099c94-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:48:18 +0200
Received: from [52.101.85.70]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0ac90-2497-0a2a45090019-34655546791e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:48:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7648.namprd03.prod.outlook.com (2603:10b6:208:4f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 12:48:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 12:48:14 +0000
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
 b=X4uhFEUGLlzbosooyg9jwqPjdoutV5Fn0pvqbSHOMEFpuIHEvu+jmOgTT8+fUeAj+VzRUNCzLbdOgPHauuDlSq1mnCtyUs+g9aMTV5sX2z8aQUhHjclZio/vDr2d8n0+B2QFFp+Fbohr+JGBEIsJFoOf6G9wn1W/tnm96JKIdmN/e9PrD032MnhBksEbXuulpZ1EiS40Rz/GI7U+CkXBqvnPDfA1WxKWRqh6bHGq4lzuc0eEdmyTcGIzxLB3cYnJtYJQInCdMrGZsiY54shiNONfDofWAFX01Sr5lIyGquCFsWdqYdrQUScAdJomVepe02gH6hyACiE3KX1GsMCLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJAFhGkgpgpjvEdazwoW+g93D5VMEfX0WdK3X7ZgQQs=;
 b=kr1oy0rHgpjbcE47H+R6HfKg5rWNK+BTX4xjOdNFZyUyiOVr1RXszUAYDZBEsOwJR5/UtgdNjnYLC64lxAwbWMU13tGRsnSDx4p+nVPK8fbF38mV26v8Y9DBy0jzIX0sekDsDEb8B6Hv4DvpAtBDu3xZq7chTFYYE/oj/mbHIPV8O2WDoKQjNv1Af00DOg2CnDT2wV/lkt3889kWIXWIst5qhw/ZAv4fRALRDnwJ80ETfcK2MdjwuJjEdYKkivgt+Icf0aqOU3JknRX9cEficIkqlIRlT8ckQHVFemClFvBLe9L3CAJt4O51i5C9pv8uwcyr6bZxjNE40VrnUcc0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJAFhGkgpgpjvEdazwoW+g93D5VMEfX0WdK3X7ZgQQs=;
 b=jxW4PAplmLvzUjrijH/QTwe2lv04dcHq/aBHXylQlG4LcZvgJLz5d3RM9+gEv7TigU6Ux4YVtzlQksH1arYqMO7brHyE7sk4AMQoG5vDPn4gsqKhcPpmMvKtxO1J8+Gq+K3cZ5tjic6vIvblu4kwKscsG8R5d/ZhnKXgP2zrbN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 14:48:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 06/17] hvmloader: Move pci devices setup to a separate
 function
Message-ID: <afCsimOpaMIr50Ua@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-7-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-7-thierry.escande@vates.tech>
X-ClientProxiedBy: ZR0P278CA0215.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: a0155076-09b8-453a-e9dc-08dea5246979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	U87O/7YLaowd1hi7ZNr353Udo7jmROIWiFu4RoFFNzBW3f40out0amtvDw6MLTwrVwbExUvJC7hJMVgV7qDOoU0OzMXPI6SiEv4cxlVmR6epj3SS46WqVLSPD7pt1UvK22KXljyLcCpR1FeibfZda65UwcAwYvhM31QpBYjkK1JJKb2F94jgef6ymsFB2rb0ZvuLLdY5nco1Frvdf+LG03MFfEuLeHBvlQom8m7A8vEgovMGLF1mqeveioYBd54QybmVd775xyLGiMdnkcoRPUsl4gVFUUa4KT9lJMg9Il6ZcxXaIbHMADL3LUuIvPP2VPxPNmfe5P+5IGkCeuXR4iH1YiwtX+0VNH+WSI66V4FB92FyHu6qcZT6JIHUyIPByWE9DP/VDgkwIF9/5jddUcvQrzMB5gmAd3K0iUwiI8Q2NTsQgvc2p29w+ylNODIrOl0b7erPQWkDHjZU4IJvfvXeLV9T/Sre/jXploMJyO+Z63Ni50bOWDu9T/3OUBncJ7iY69MUO/Ot5EqgMliCm+oBwhibG8Mz31Y8HzhF/6QUdGXFpc9FDpsuAek0m52jz9HSo0mzDRR7YBhKxw3+/Pu7h04sC5yS1nb+bgu0PCzw/4Qjksldim4mI6mHV0LzzVQY1O2IESL4iJhAuJWfhULmJyvNIi8VGL8tW2mp6ybZoi7wv/s6gXw18x0FCv/46IW2SU8ij0a4GT1JnOtgn/9ApwoDC/HulYUc2jyikns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTJGcFVHNEhxSTQrd2xxUHdOZTVIWnVhS2U2WjNoYXVTVll1MndaOEtqem8x?=
 =?utf-8?B?ZTNDckYwU0Y1b2NJQlhYTVg2RVp1ZUZTWDF0b0tteDFYWjR2OXpYc0Q0bWxp?=
 =?utf-8?B?QzhmMCt4UHVmVTg0YWJ5aEwwMTllSE4yaUJUMUdqK3l5emhJbnBkc0I2dEdC?=
 =?utf-8?B?T2sxTVg1YTlZMHJVdUxibWphVUt2SUtOOXMxWE02VUxLSmZPV2s4L3UwWi9M?=
 =?utf-8?B?OHpIVU9kNEZOUzNlUmRDYVBGWmV0ZkdQZHlaVXI5aUViWWdkOGV1RWd6dHJq?=
 =?utf-8?B?SHoralpHVll1NEJDMjh5OHZ6L1RvR0V0TzZjWStRVjBnNjQrWHByeCs0Zy9E?=
 =?utf-8?B?ZkxCNVVVS2dkTnQ4REYyY2pPTnM5eVFUKytvblNLRURLOERhQjF4a1dxOHlE?=
 =?utf-8?B?eXd1dFo1WGY3WDdKYXNhS0ZaYnNJdUNnREtpNlFNMzVreE9vdUNveUFOT08w?=
 =?utf-8?B?UW96SmZxZSt4bHo4RmlKUzdrZjdBdzRyUkxhMG9DY2RRcEtWSTFXRGJIZjF6?=
 =?utf-8?B?dWFkRE1yZnorK3l1bjhVc0dENEwwbngrbUY2L0pEOVJLRUY2ZXZyZDYzd1U2?=
 =?utf-8?B?Wkg1S0xkMXRmWFh2MmpuZGEvVVhoTnM3SWNDS2xTMlpKL2tzU3QxZjJodnFO?=
 =?utf-8?B?RGdsUEhxTkFrVHE2VXR2aXVuTzZaUVFYUmtGNFd3Y1RzYXlwQzNqVkpjVHNj?=
 =?utf-8?B?WHZrTGIzdW8rRWJhLzVneHpuakw0dU8vYkxWQ2g2RDVTNVBoajdnVE1FL2Ro?=
 =?utf-8?B?UXU0MGtDTHRpb2F2RVc4WHJGZ1ZXWFFWVGhKbzZwQ2dOazlUZVZ2Z1E5RlBz?=
 =?utf-8?B?YnM4SEdpekJPSkN0VjFZNWxpVzdUdWpIeUxnQWI2bmlSTGZxcUloNEFyQ2kz?=
 =?utf-8?B?UWpVajlMVWFXanpybFhNM1B3VDZZbHovUW56YkhXN3BoM3M0TzJWVFkrQUNu?=
 =?utf-8?B?OHZpUkd0dHJSZWZFUm56V29MdGpPaWRmTmhqVk9FTzRMMlo3RWpSTHF3Ullr?=
 =?utf-8?B?dlU3bHB0bDRyRlFNSHgxQ2M1L2YwZWZMMnFzUy8rT1p6WEFSbmozc0JuMHRL?=
 =?utf-8?B?QWtkN1RyZkJaZlBwNVovZzhTQnppYjhBNG5mRkFUVkJYeG1jQlRiOFZLbFR1?=
 =?utf-8?B?YUdMVUJ4OHJiUTNEMXZqd1JBNG1VQy9yeWxpTmt0QXJJeXpmU2s3RWhsTDFx?=
 =?utf-8?B?a2dSZ1I5czBlTGg4NjNlTXc2czk4bExoZVpMZXZCVjUwQkk5NTMrOXJoQ2E5?=
 =?utf-8?B?U2JRN2FSQ1lSMkkxRkpCSGVBaFJLTjRVaXpYdHQvaFkxTENwaGphaC8vRmxt?=
 =?utf-8?B?YXhNcE0zL3NxY0FaTzZYVEdPS2VZQUtORURkZ21PSzllcmI0MDVNdzdER1Fw?=
 =?utf-8?B?OHEzbzc1cm1VK2JhRVJONGY4RnVLVy83Wms3RzZzWjhNR05rNkN3N0NmVUFh?=
 =?utf-8?B?SStUWkpuT1gvaThZZWlyWTR0Tk9yMFhzR0JLWDUzVnlwV1pJYXM1Q09jQVFp?=
 =?utf-8?B?N2NpR1NoTjljcWVVRVNuYjlOYnVOUGlSNDZrR0J3WW1wa1c5UWFxbnlxeW1r?=
 =?utf-8?B?VHpFemduL05KK0l5cTZscjcwbGlqN2o5ZXFmVW5Xc3cvMWNlODVONzlLdlpa?=
 =?utf-8?B?TWFRMVpPaW50VTEzai9CcVFpdllML1hmZzBpOHovRm5nb0ZOQ2pwZzNvd2N0?=
 =?utf-8?B?N1RpYjAwWkdUNDMzNE43VzNzV2o0TVFrM1FVK3hSU3h3RmZwak1TY0t2dnE4?=
 =?utf-8?B?cGE3RExuWkVwRVRYQXN4ZTVJWERhaEtOb3Njc2dJMHFyTjBkVm10QkxSbzYx?=
 =?utf-8?B?MEdPN1RwMzYvNXR3WDdXSnFMZ3ZGV2huU2VLbXNUMDlQREMvdU9hNXBKRUFo?=
 =?utf-8?B?V2dqdmRjNU1TMWM5TVEwTTBlUXIzL2NpblhCaWhrRGpPbGNlZjg5NDlQcXVP?=
 =?utf-8?B?RGJ5Nmw0SFYrNkFkVVVtREVXQWZLc292blFjSU9nYlZxdDVQTDc0a1VCYjY5?=
 =?utf-8?B?b2QrSXVPNW0ybnljTjZyenlwSG5QN0JOUS9oR2lidmYyY0FzZkNPeDYwUHNa?=
 =?utf-8?B?KytPYW8rbUlPREdXU3VPOUMrWDAzM0x5YVBoaHFTSmIvdDd0MC9sL1JnYWta?=
 =?utf-8?B?WThxMEE3dFdjenBlT0VtRkQ5N21qNjJiSHJwemVGTjhZaEU5Nk05cUJGa1Rr?=
 =?utf-8?B?bjB4QTU5czVvMTFocExWQzBReHV2a3ZXS2NWUEZHWEVJTkFHbEJIbTU5SEFa?=
 =?utf-8?B?RGdYSTZWMEJPN29zQkFpdGNKVU1tNGRlR1drSlJPRnBCeVI5dG81WElSRUNR?=
 =?utf-8?B?Y0ttTkR1SGduUkw4c3pOQ2Z5eUJqV0NlRnc0Sk9MSmNGK0NoMjRCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0155076-09b8-453a-e9dc-08dea5246979
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 12:48:14.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VNd2VtlPOxoQBwdDUKDvX7MlBcZYG6OltroI0ZLdp6NM+tKXT3g/XXCCDA1RPKOEgbBpmmDqJWUikok1bjvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7648
X-purgate-ID: tlsNG-bad1c0/1777380498-48EACA53-81F2ADA8/0/0
X-purgate-type: clean
X-purgate-size: 8085
X-Rspamd-Queue-Id: 0F9FF485134
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:02PM +0000, Thierry Escande wrote:
> For readability and code simplification, this patch moves PCI-device
> specific initializations out of the pci_setup() function to a new
> function class_specific_pci_device_setup().

AFAICT this is a non-functional change.  Should likely be mentioned in
the commit message to avoid any doubts.

> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/pci.c      | 117 +++++++++++++++-------------
>  tools/firmware/hvmloader/pci_regs.h |   4 +
>  2 files changed, 68 insertions(+), 53 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index c41c8d946a..a76d051bdf 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,12 +84,71 @@ static int find_next_rmrr(uint32_t base)
>      return next_rmrr;
>  }
>  
> +static void class_specific_pci_device_setup(uint16_t vendor_id,
> +                                            uint16_t device_id,
> +                                            uint16_t class,

It's a bit weird to pass the class value into the function, the value
is only used inside the function itself, and hence could be fetched
inside the function as the device BDF is provided as parameters?

> +                                            uint8_t bus,
> +                                            uint8_t devfn, uint8_t *vga_devfn)
> +{
> +    switch ( class )
> +    {
> +    case PCI_CLASS_DISPLAY_VGA:
> +        /* If emulated VGA is found, preserve it as primary VGA. */
> +        if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
> +        {
> +            *vga_devfn = devfn;
> +            virtual_vga = VGA_std;
> +        }
> +        else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )

Since you introduce defines for the device classes, could you also
introduce defines for the vendor and device IDs used here?

> +        {
> +            *vga_devfn = devfn;
> +            virtual_vga = VGA_cirrus;
> +        }
> +        else if ( virtual_vga == VGA_none )
> +        {
> +            *vga_devfn = devfn;
> +            virtual_vga = VGA_pt;
> +            if ( vendor_id == 0x8086 )

This one is PCI_VENDOR_ID_INTEL, also a couple of more instances below.

> +            {
> +                igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
> +                /*
> +                 * Write the the OpRegion offset to give the opregion
> +                 * address to the device model. The device model will trap
> +                 * and map the OpRegion at the give address.
> +                 */
> +                pci_writel(*vga_devfn, PCI_INTEL_OPREGION,
> +                           igd_opregion_pgbase << PAGE_SHIFT);
> +            }
> +        }
> +        break;

Newlines after break statements.

> +    case PCI_CLASS_BRIDGE_OTHER:
> +        /* PIIX4 ACPI PM. Special device with special PCI config space. */
> +        ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
> +        pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
> +        pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
> +        pci_writew(devfn, 0x22, 0x0000);
> +        pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
> +        pci_writew(devfn, 0x3d, 0x0001);
> +        pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
> +        pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
> +        break;
> +    case PCI_CLASS_STORAGE_IDE:
> +        if ( vendor_id == 0x8086 )
> +        {
> +            /* Intel ICHs since PIIX3: enable IDE legacy mode. */
> +            pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
> +            pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
> +        }
> +        break;
> +    }
> +}
> +
>  void pci_setup(void)
>  {
>      uint8_t is_64bar, using_64bar, bar64_relocate = 0;
>      uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
>      uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
> -    uint32_t vga_devfn = 256;
> +    uint8_t vga_devfn = 0xff;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
>      uint8_t pci_devfn_decode_type[256] = {};
> @@ -170,57 +229,9 @@ void pci_setup(void)
>          ASSERT((devfn != PCI_ISA_DEVFN) ||
>                 ((vendor_id == 0x8086) && (device_id == 0x7000)));
>  
> -        switch ( class )
> -        {
> -        case 0x0300:
> -            /* If emulated VGA is found, preserve it as primary VGA. */
> -            if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
> -            {
> -                vga_devfn = devfn;
> -                virtual_vga = VGA_std;
> -            }
> -            else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )
> -            {
> -                vga_devfn = devfn;
> -                virtual_vga = VGA_cirrus;
> -            }
> -            else if ( virtual_vga == VGA_none )
> -            {
> -                vga_devfn = devfn;
> -                virtual_vga = VGA_pt;
> -                if ( vendor_id == 0x8086 )
> -                {
> -                    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
> -                    /*
> -                     * Write the the OpRegion offset to give the opregion
> -                     * address to the device model. The device model will trap 
> -                     * and map the OpRegion at the give address.
> -                     */
> -                    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
> -                               igd_opregion_pgbase << PAGE_SHIFT);
> -                }
> -            }
> -            break;
> -        case 0x0680:
> -            /* PIIX4 ACPI PM. Special device with special PCI config space. */
> -            ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
> -            pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
> -            pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
> -            pci_writew(devfn, 0x22, 0x0000);
> -            pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
> -            pci_writew(devfn, 0x3d, 0x0001);
> -            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
> -            pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
> -            break;
> -        case 0x0101:
> -            if ( vendor_id == 0x8086 )
> -            {
> -                /* Intel ICHs since PIIX3: enable IDE legacy mode. */
> -                pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
> -                pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
> -            }
> -            break;
> -        }
> +        class_specific_pci_device_setup(vendor_id, device_id, class,
> +                                        0 /* virt_bus support TBD */,
> +                                        devfn, &vga_devfn);
>  
>          /*
>           * It is recommended that BAR programming be done whilst decode
> @@ -583,7 +594,7 @@ void pci_setup(void)
>                            ((pci_hi_mem_start & -pci_hi_mem_start) - 1)) + 1;
>      }
>  
> -    if ( vga_devfn != 256 )
> +    if ( vga_devfn != 0xff )
>      {
>          /*
>           * VGA registers live in I/O space so ensure that primary VGA
> diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
> index 4d4dc0cd01..c94278855b 100644
> --- a/tools/firmware/hvmloader/pci_regs.h
> +++ b/tools/firmware/hvmloader/pci_regs.h
> @@ -111,6 +111,10 @@
>  #define PCI_DEVICE_ID_INTEL_82441        0x1237
>  #define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
>  
> +#define PCI_CLASS_STORAGE_IDE            0x0101
> +#define PCI_CLASS_DISPLAY_VGA            0x0300
> +#define PCI_CLASS_BRIDGE_OTHER           0x0680

As mentioned in a previous patch, this would better be placed in a
pci_ids.h header.

Thanks, Roger.

