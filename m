Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rrctB7d8KWr/XgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:03:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1466A87D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 17:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Ljv9xnIw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334454.1597483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXKRU-0005f8-8w; Wed, 10 Jun 2026 15:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334454.1597483; Wed, 10 Jun 2026 15:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXKRU-0005dR-5D; Wed, 10 Jun 2026 15:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1334454;
 Wed, 10 Jun 2026 15:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXKRT-0005dL-0E
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 15:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXKRS-002qIM-BS
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 17:02:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a297c59-e002-0a2a0a5209dd-0a2a4507e530-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:02:06 +0200
Received: from [52.101.201.44]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a297c6c-229c-0a2a45070019-3465c92ce4e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 17:02:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB7023.namprd03.prod.outlook.com (2603:10b6:a03:432::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 15:02:01 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 15:01:56 +0000
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
 b=tuvZDPOGJsXZqAifcIWt6qAd33trpuLLuNGRG9zA7PdiwWTZlfTyVbT5MNFeIuNjKfBgZ5lTiPCIS+oJsT39aQ1erh13YtJ6NL2Pq+UEBaHcfe5OtEWtC+6OgcE5rTUGY3+3AF/MpOcK6WZV5uNqBwWz4oNjZwbmR5a9hv0cKvMV3+Oivinak1kbJnSyzdBhUVdOZ3Dvc+G7o0dOX07+ItQbnMKGWCDTUYE3sw2CvT+5Sw9Mp3F4tbjHTJVowViamksgnOI31E/JwkWUfTpCBIrhSNMEuWdSrtCwcHDrQcO9E3B8XY7i1W4YBEzCRAVy3lZa19fdVKjTA3Cl29E31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC8xab3PAcBLGhMrSXGFXnhDEoysBJE2GEKNiaKZmPw=;
 b=vdEMY59gFROCHoQfQRz5cCzy/vuVX90JvyCJSXMTZ6I68ctlMxQ/m00cGCIzwPXgm/sXz4Je/opXGoLuUDX5k3sxQEzKf2mxJFv7JecCtK9jEvVlQYOOcnAh7hKWlrl2pdSutVkznWZEi9zZr/Mnhq8EoJCXlqoRkxRDPSVLjKIYZ49sI+yGCM34KiUgztjWdXiAxH43FmzuQp8xM9w7YDMQYHbsFBzsu7+xlIv8ivcji+8aQnosVaCm9dxRJlcs12NM9HQdqW4bqdspza9cf2x2j8F/aqlCsrOyxwPvE4AUZI9Rl2HQvkbNsmEGsFtquYU9drX+cExWlk23y73Ynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC8xab3PAcBLGhMrSXGFXnhDEoysBJE2GEKNiaKZmPw=;
 b=Ljv9xnIwIMxZ+TuUFlqowd16dZdFlSK553j/q3XSMk9e+EWQIeEDoGcAbgNS0NL1Uk/yX4fX0bRRxKdyF1BdSxNsr0p15d4qYzepeRSNZqd8iCYMbsuv+mPnQpGJh0TYpvvsOEa10y0H9PYCmjZ5gyG9N0/VVnRkDIBqy2y/UyQ=
Date: Wed, 10 Jun 2026 17:01:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 2/2] xen/x86: Change stub page allocation/free
Message-ID: <ail8YNrQLZ9bumiH@macbook.local>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
 <20260609000638.121027-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609000638.121027-3-jason.andryuk@amd.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: c63d61e6-6318-4a28-5195-08dec70136ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xMbXy7gwfGjuB9MlAIHIG7L1UOpDmrlATy/bgFsDT7icDUYgQBKKroWH5XtxTj+BE2nIyOvJmE1HHikU4MsdoF4gQ9DgY+VCWZkQ47l6BB0RlD57RR8uaKozYaC2Oz1xbRDbl8f/MYPiWGNkdtFAHWJTh4VqIWL4tHQXaFqSa7I39nhNazgUNynfB4puraM74xpReEV0RuGz52SSBtaGBxp0p7Kc54U//bqFS5pgNfUdPOcNqqAvJlFtj8VAITRkvXneABUzRxRChp56wOBjWKO4zTbwmYQWN+g23QxE4VB037q3eHI5He0vPrpLGwl+7BU4wqbv5IqXL/jHpXYgYpAnKEupcdjgyXNROURbee8TIUXQfLjuCXHB3GgJcRuVyyEeJosHZQ5ZKOITNJ8TLEd4M7Lr303C87pd6R2LzUf26V0AgOtl2XKhkyuxTg42T+1mUFe+MzkVq/JDIZrgvTwytnzGv5l1jXRD5+jwoVHOHJFpAzYyz7uJ1DrVU6MGMTpoeYx+EcXngUmITjjMQ0YwS3bC0X69ye+ECHeuVhH+HKZMhFkSXMnmZLUxo8Jw8jJcaGghxUz+AjrYQpQeDfTTvCsdwttuK421Z9ChVvWArNpp2hIe+HZaRV4UqqMVvPfx2sJ+4IKCZo0sZ1XVe0G/esVrf2UhQWP/TD3nrAalZHrvDwv1HTTIU8F9UDwM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUNwbnU2dklwaGRpRUUyNkl4NERkWU8vZHliUlc4SzJsTjNzclVGSVQyM0wr?=
 =?utf-8?B?cW5wcW1DV3pmbStpSDMyMjlESHdqd0R4aGtPdzhFNCtwUEluNkYzcXE4bWR4?=
 =?utf-8?B?Mmtsc20yOXJGM2ZaUkl1ajUrZDhLdTFJMEFrZFdkRzZyTlNkVDhENS85enhv?=
 =?utf-8?B?enh0b0lrMkkzMnByalA1QjZpdEd3cWpjMURNYy9Pa2pIYmdON0F0Z0ZoY2JD?=
 =?utf-8?B?aTNOUTNLM0tpdEJ3M3ZYaUIzdnJBMjVvOGcrZCtMMVc3bnhIM1Rvd1JQYW5r?=
 =?utf-8?B?MXN2NlYvNnhTNWhNcEk2LytkaDVzOWZFYUsvVlJSTU5aOUo1cmNNVE9Cd2tY?=
 =?utf-8?B?eE8yVGtUanNsNVVud0FXZnE0Z0MvbzdTMUpFNGFubzZzWlorUko0KzlVTkw1?=
 =?utf-8?B?SWdpVzBaeUpXbFNKMmFkVllzU2E2akVrdUpFUUMwL2xpVGxsZHZCc29qZVZC?=
 =?utf-8?B?QWNYbm5kUnFxRm40UGc1bG1uamQ2THVHdGIvQ1BjamJaTFdiWVlkdHY0SG5W?=
 =?utf-8?B?SDlkZGZUSVdPYlNoMWwrQTc3QmRWQk84S05qMmJFTkVkc3ByUDRqdFFteGJa?=
 =?utf-8?B?aWVLajkxRlUyN0REZXlxaU01d0NPNnh2N2FFUDdqWDNjVnFoNGFIZ1hrOTc4?=
 =?utf-8?B?SmZENWl5RUVQUU9iY240NHVJR2MySWQ1K3NyREVYdVJqb1Y4S0JaOVdLM2tz?=
 =?utf-8?B?YzJjaHo3eTFnSXVCUjdLRHk0RXlrR2hQOUs4ekFiL3Rvb2FFcWF0UEhGMFlm?=
 =?utf-8?B?cUlFT0hYekYwN1VPU2FxOEY3YW9jS0xsVlV0SFE2TGdEUkZWNHlxbjB5RmU5?=
 =?utf-8?B?ZEVWRW5VYzUvbFo1K3lpMXlLcldCWVZtNjhNMjFWSFlJeDRjMXc2OUovSk01?=
 =?utf-8?B?VnRydTRzaW44LzZTMTZ4SzZPdmRaSDVyRlNWTUdwOFJ1ZDhPVlh2Y3dQZHg2?=
 =?utf-8?B?YjBwOE1IR2I5REt6TEgrK2FIcnZpUndHSjZsdXZjRFkvdmVJS09Oa1hKVGg5?=
 =?utf-8?B?L2E2eFZLWmg5WTI1NVpOeHRYYmpPU1p4cDBWZmRTMHlLQnFNMm9pY1AzaUpw?=
 =?utf-8?B?emFmaFVWL25rTTdjYStDeEVLczBZS1NKcVhuR3hJTWdBeEpvd3grekFUVG9p?=
 =?utf-8?B?emRnclJwcHpLVENkeEtrZEZVeFZ2RzBaWWNVdGY0SE1ITnR5RmY5NytmNjBE?=
 =?utf-8?B?UGpUOFU4TGJvdkw5d3BtbWJoV3dTYmlRaXBoU2VGalFEclFMVVJkby8yMGxI?=
 =?utf-8?B?QVZrbDd4Qk1XZWpDZEhOaWFBZ092aXZPMDRJN2RkeHk0SmpheUcwTXJVQUJz?=
 =?utf-8?B?UWVMOVJ4bmVPVDF5NkY1bUR5QWdFNHppemRkWHdWY2FCMGh1MkNkQXNVWU00?=
 =?utf-8?B?a0hRMzlSOXBBYVRRblc3b0dYZlFtb3VZdHcreXRFTko3UTc4NE9QSlRwdW5o?=
 =?utf-8?B?a2JHcExZQ0I2R0c2V3VXaUpsbklta0RMcEFUTExEckJqckgvVnJmQ1QrVGxW?=
 =?utf-8?B?VjM2U1JSeXFoSGJvUnhnbE1lNHIvSnArYU93QVA2ekNqSnBpZk9DUzladmhy?=
 =?utf-8?B?MlhPajRyZFdWRzVuOWp0MzlYZW5oZW5Lcm9IVlNXME03bDhvNWVnT3BCZm5a?=
 =?utf-8?B?ODNJUkJIbjR4alhYMFk1MG1zNVZUY0xObitKNTJ0a1pxWklHTFhCZzJPd0Qw?=
 =?utf-8?B?YmpDeUR1eVZzQlBXT0ZCUDBPL2doaEpYU3k0SVVjL3RYdWZCQ0tKUjFZSmFQ?=
 =?utf-8?B?NWdmV1ZNKzArU0RlNjk5eHFkS1NZYVVTcGpFMTZueWFHcXJvcElLWVVCa29z?=
 =?utf-8?B?R3RvdEhTbEt0Qk5tRzNjNkVoeUhLcXhSeUI2ZXFrWmtLaUxiR3RhVlFLckZn?=
 =?utf-8?B?QnFFeGNkZlFsYjYvekNmTUJPODVjK2JPZG8rbG9yWGV6UDNIQ3Mxc01DUXJU?=
 =?utf-8?B?WHpYQ1p6OThTeThxU1pCTDEwYWhJcXJCVmhNalRkSEpmaVhWa0Jaamh3QTFv?=
 =?utf-8?B?MjRmYStnWEM5Um1WMXNYT3pPaU1GQ2JKMEdET1A1cUhHVVZObHdPREo4M2lG?=
 =?utf-8?B?b1Bya3FBV3ZNTWI0SU9QbjBsWXJDbXg3L2JTWkk5VEdibGxyZzkzZERJY0JF?=
 =?utf-8?B?UnNyUDBENTRYdGpKdk05Z0U0N0tCSGJWUWpocHJqek15RVN3bmRSbWp6bFJG?=
 =?utf-8?B?Yi9KV21IdzZOL0tnQ2RwcisrbkI3M1F6THYvallqcTdRSE80RzRYQWo1cTFL?=
 =?utf-8?B?VVNCdm1jRE5IYTNoSnBYQjJSRVVIWlA1bkhoY2dTV0FkL3RWWE53cjRTVG91?=
 =?utf-8?B?U3dsb0RjSGJlcmVPWnVjaGZWaGdqTFBZNWhQd1dGMjljbExCL0dOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63d61e6-6318-4a28-5195-08dec70136ad
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:01:56.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SkarikLqL9XyjG2+i0eot3YF9jDw8ZdFB5LKjheh+k8fKb27LF/PD5eRw1piHsbqL2D4cQ6qhaypstjL7mi8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7023
X-purgate-ID: tlsNG-ef75cf/1781103726-23374C48-3D4CCB62/0/0
X-purgate-type: clean
X-purgate-size: 11736
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91A1466A87D

On Mon, Jun 08, 2026 at 08:06:38PM -0400, Jason Andryuk wrote:
> Today the inline tracking of the stub page is problematic.  0xcc is used
> to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
> with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
> the in-use stub page.  Subsequent CPU onlining can write to the re-used
> page.
> 
> The new approach uses a global, CPU-indexed array of stub pages.
> However, to handle NUMA aware allocations, we cannot allocate all the
> pages in advance because the NUMA information is not available.  Keep
> track of 1 current page for each NUMA node, allocated on demand, and
> allocate the stub buffers out of those pages.
> 
> The current NUMA allocation approach is opportunistic sharing among the
> groups of 32 processors.  The new approach will allocate buffers densely
> in a NUMA node.
> 
> stub pages are no longer freed.  They remain referenced in the global
> CPU-indexed array and are re-used if the CPU is re-onlined.
> 
> stubs and node_stubs don't have an explicit lock.  During boot they are
> accessed single threaded.  During runtime, &cpu_add_remove_lock
> serializes access.
> 
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> I'm not sure how to test the NUMA part - I don't have an NUMA system.
> Also, if NUMA is active, is a cpu node of NUMA_NO_NODE still possible?
> I used the MAX_NUMNODES + 1 array sizing to handle that, but it's not
> obvious to me if that is necessary.
> 
> Roger mentioned removing the per-cpu stubs.mfn.  We'd need to replace
> that with exposing the stubs array for traps and the emulator.  I have
> no idea if that will be an improvement and am looking for agreement on
> this patch before attempting.
> ---
>  xen/arch/x86/include/asm/stubs.h |   2 +-
>  xen/arch/x86/setup.c             |   3 +-
>  xen/arch/x86/smpboot.c           | 110 +++++++++++++++++++++----------
>  3 files changed, 77 insertions(+), 38 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
> index a520928e9a..9d776f81dd 100644
> --- a/xen/arch/x86/include/asm/stubs.h
> +++ b/xen/arch/x86/include/asm/stubs.h
> @@ -32,6 +32,6 @@ struct stubs {
>  };
>  
>  DECLARE_PER_CPU(struct stubs, stubs);
> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
> +unsigned long assign_stub_page(unsigned int cpu);
>  
>  #endif /* X86_ASM_STUBS_H */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 19ee857abf..0cac94cbdb 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2089,8 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      init_idle_domain();
>  
> -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> -                                           &this_cpu(stubs).mfn);
> +    this_cpu(stubs.addr) = assign_stub_page(0);

Given stub pages is first used quite late in the boot process, the above
arrays would better be dynamically allocated using xvmalloc_array().

>      BUG_ON(!this_cpu(stubs.addr));
>  
>      bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index d7619f534b..d9cd90389d 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -641,41 +641,96 @@ static int do_boot_cpu(int apicid, int cpu)
>      return rc;
>  }
>  
> -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> +/*
> + * Indexed by CPU.  `pg` may be shared by up to STUBS_PER_PAGE CPUs.  Offset
> + * is the byte offset into the stub page for the CPU's stub buffer.
> + */
> +struct stub_info {
> +    struct page_info *pg;
> +    unsigned int offset;
> +};
> +struct stub_info __read_mostly stubs[NR_CPUS];
>  
> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> +/*
> + * Index by NUMA node.
> + *
> + * `pg` is the current stub page for the node.
> + * `next` is the next available stub index (STUBS_PER_PAGE available).
> + *
> + * if `pg` is NULL, allocate a new one.
> + * if `pg` is !NULL, use `pg` and stub `next`
> + * When STUBS_PER_PAGE are all assigned, clear `pg` and `next`.
> + */
> +struct stub_node {
> +    struct page_info *pg;
> +    unsigned int next;
> +};
> +struct stub_node stub_nodes[MAX_NUMNODES + 1];

I think we could get away with a single array, that uses the CPU as
the index and stores the physical address of the stub.

We could also simplify the allocation logic, assuming that CPUs
belonging to the same NUMA node are packed contiguously in the common
case.  I've given a try at this, and adjusted your original commit.  I
however only tested this in QEMU so far.  If you think it's OK I can
test it on XenRT and see how that goes.

Sorry I took over the patch, I didn't want to force you into another
direction without knowing whether it would be OK, as it wasn't clear
to me this approach would be fine (seem so, but still needs further
testing).

One thing that would simplify the logic greatly, which Andrew brought
up, is foregoing the NUMA memory affinity for the allocated stubs page, and
allocate and map them contiguously in both the physical and the linear
address spaces, so that you would find the VA using:

XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * STUB_BUF_SIZE

This would possibly allow to simply populate the whole range up to
num_present_cpus() at boot and get done with it.  However that's a
bigger change that should likely be done after 4.22 is out.

Thanks, Roger.
---
diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
index a520928e9a50..d575f1eb0631 100644
--- a/xen/arch/x86/include/asm/stubs.h
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -32,6 +32,7 @@ struct stubs {
 };
 
 DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+unsigned long assign_stub_page(unsigned int cpu);
+void init_bsp_stub(void);
 
 #endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4192edf635b6..cddf8806c877 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     init_idle_domain();
 
-    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
-                                           &this_cpu(stubs).mfn);
-    BUG_ON(!this_cpu(stubs.addr));
+    init_bsp_stub();
 
     bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b3045eac5b5e..dd0972a3025e 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -20,6 +20,7 @@
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
@@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
     return rc;
 }
 
-#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
+/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
+static paddr_t *__ro_after_init stubs;
 
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
+unsigned long assign_stub_page(unsigned int cpu)
 {
     unsigned long stub_va;
-    struct page_info *pg;
+    paddr_t addr = stubs[cpu];
 
-    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
-
-    if ( *mfn )
-        pg = mfn_to_page(_mfn(*mfn));
-    else
+    if ( addr == INVALID_PADDR )
     {
-        nodeid_t node = cpu_to_node(cpu);
-        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
+        nodeid_t nid = cpu_to_node(cpu);
 
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            return 0;
+        /*
+         * Attempt to use the same page as the previous CPU if possible,
+         * otherwise allocate a new one.
+         */
+        if ( cpu && nid == cpu_to_node(cpu - 1) &&
+             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
+            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            if ( !pg )
+                return 0;
+            addr = page_to_maddr(pg);
+        }
+        stubs[cpu] = addr;
     }
 
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
-    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
+    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
-    {
-        if ( !*mfn )
-            free_domheap_page(pg);
-        stub_va = 0;
-    }
-    else if ( !*mfn )
-        *mfn = mfn_x(page_to_mfn(pg));
+        return 0;
+
+    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
+    return stub_va + PAGE_OFFSET(addr);
+}
+
+void __init init_bsp_stub(void)
+{
+    const unsigned int num_cpus = num_present_cpus();
+    unsigned int i;
+
+    ASSERT(!stubs);
+    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
+    if ( !stubs )
+        panic("Unable to allocate stub array");
+
+    for ( i = 0; i < num_cpus; i++ )
+        stubs[i] = INVALID_PADDR;
 
-    return stub_va ? stub_va + STUB_BUF_CPU_OFFS(cpu) : 0;
+    this_cpu(stubs.addr) = assign_stub_page(0);
+    if ( !this_cpu(stubs.addr) )
+        panic("Unable to initialize BSP stub region");
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -990,19 +1011,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
+        memset(stub_page + PAGE_OFFSET(stubs[cpu]), 0xcc, STUB_BUF_SIZE);
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -1041,7 +1055,7 @@ void *cpu_alloc_stack(unsigned int cpu)
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
-    unsigned int i, memflags = 0;
+    unsigned int memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
     unsigned long stub_va;
@@ -1092,15 +1106,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
-          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
-        if ( cpu_online(i) && cpu_to_node(i) == node )
-        {
-            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
-            break;
-        }
-    BUG_ON(i == cpu);
-    stub_va = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
+    stub_va = assign_stub_page(cpu);
     if ( !stub_va )
         goto out;
     per_cpu(stubs.addr, cpu) = stub_va;

