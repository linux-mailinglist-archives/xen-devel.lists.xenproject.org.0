Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM8wGJFR/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:47:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD74E5164
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302300.1576253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuNV-0007av-EO; Thu, 07 May 2026 08:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302300.1576253; Thu, 07 May 2026 08:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuNV-0007Xw-9p; Thu, 07 May 2026 08:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1302300;
 Thu, 07 May 2026 08:46:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKuNT-0007Xq-AD
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:46:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuNS-00CIeJ-NM
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:46:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc5164-bab6-0a2a0a5309dd-0a2a4505ce80-48
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:46:38 +0200
Received: from [40.107.208.60]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fc516c-aaa8-0a2a45050019-286bd03cb07a-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:46:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 08:46:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 08:46:34 +0000
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
 b=NMvGUzGxrIRqRxW9RZBpqAuvmppC7xKIT2/BGG38Ks7U0kELSeZjrMe9+SRr4XL3rlEYuQFTINuUtsoYC5pDhjTMBL9fGC0Ja3+vRxq33s+POrzxoUmaSaEbp8NRNDyiAWkGSdUAsIN93Mf8odbcmctIdZpF8fj3JFqIpKZEDYRFSzdfJIpmTshPB/YIN/xhbULCz0rv5mg1PmrEm0IPFohQ5Fslc2oBxp/KGyEsAngoUTG9WRgoN+5MpUELEDZFwl4R3Z2qrW4YaNEDLHiAYKPs7ZCwIdvEcXD5EEpHs+VI5bJ7a11naXzRfx7YxO+MYqDCvwDzQu2Sp+tc23uI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OSd2sYHiKFEwBt3Q3Vas+8kZy+/6bgRuiLOdk04cxg=;
 b=q8bGH4jVG32/JKHnvrfEZG+f3iZkptEAiH47NYX1d1l5+lPejOxYlQfQ7iwMqCVo+4jGVzz7rbHQHL7aMFKsZck9JKm9SKt8/6BxH6aX/bzJOvwedCD0udfVDabA7kiaZCjMpOOva3d2Afn7ejEewdBe0O6/avI9U3GotO/9s47jf6ab8AAFjl5ZXRF6icpKL6T3s06VmvKlOWcWW29VQ68Xq6b9SRIHqLOfibZjS8lM+fQABtmdEH+hbeAUng3n0Ik+wqhSVCk422hiW5Q2RICyaoD41hpCzXBgoO++HsC77NYQf9B1s47R8sKmanLpkGZ3kViW7tKDJjSFRXNPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OSd2sYHiKFEwBt3Q3Vas+8kZy+/6bgRuiLOdk04cxg=;
 b=AAX+wR0V4DTrQIjrfyN4di4d12ZqucZBYoMmuCQ94o5zJ4CSR59DxPEmzwqLYOAtHlZJA/+LUwHZmSdnJgu0+sSTll/8eoEwyTsNnuFuMSWoC/x0Ib1jNaN6KumLwkV+fxIbyd2YEUYXN7m6rdfLeydJspoqcPQGfPiImVUBJmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 7 May 2026 10:46:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afxRZtm-L1ZA8jF1@macbook.local>
References: <20260506165157.68567-1-roger.pau@citrix.com>
 <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: c382040b-4727-42d1-3687-08deac1524ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	l2C/8gMJpRfYGhMh8ya4xzIRRqHT/u4rM1P4WahM1pp/EbnnPCHWZ3yNTgF5Yhz4bHBhdekxQppJBET632Z3gOYQij6jgWX4FyevPZvJBOjMn508Ci6wb0t1ZnVyPaaKbSC07mJnsAA0nD62JkPUpx+eQ0bkHWJiJfyADIdAPE2XWEG9nEL6zF4RHzlHb3pmxHKtQRIyp9qggJYaVRfmg8MPDR9B5JxdDsAa7kjKT28jFd4GDnoobgHpVHN0d5e+eaGzXV84MMa7W3G66MLuwImbI92GNy6+/ICGLufdfefCcZQluS/JV5xvy1d3duAZLz30wiEy0oDuhqjJXRlZEIleTJDe+8sl0Z8pRuMmshSavKBx6lJ+o/VyzH6Mtg9nzGVBRUpSbh2TbNWu7d4wu7qENiiHjN2GJzygnE6q1QECKjEx7spyEuMkyeQjQKUO9J18O1Dx9ub0AIN0sRkW/hk0nMelp4k04gF1N1A3EGUeF9X8PgpSLw/s3PGVrSdw5PaJtnKGiB2xaz+kQrFH7XGwPzE5P2La77RHn4EOex3QtYfhrHF0iLnnM2XHsxP8GpsKLT58HkW/WxlMgV1C6tz7rr74xWeaynTgY3UY4ESsZiyj0jvn97mgZxZfKMl6emsHyQVxxk66YU1RbAVUxpPqucIQ+upK8HBeqHrddJnK7Dasoyl8gpXn3o2YAEpR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEhPaVh2VU9xZ1VXWGYwSmlRcWdzM3NMOCtyZjVmVE5RQTNOR3BUdXQ5dGxI?=
 =?utf-8?B?R1ltZUU1aTFpRS9nRGVKMWcwcDh5NkgvaXBKRCs5dkFBVHUrT0F6aU5tMitU?=
 =?utf-8?B?eE5qODhDdS9lRXNFRHZJM0JoalBseG1sa1lXRHVDMmlQNS9PVmI5T0ljK2RO?=
 =?utf-8?B?bWo5aHBTRzFYam5tcmxZVzJteVpHcGV2TCtHVzBWcGVSY3JpQW1wQmNOZVI2?=
 =?utf-8?B?bDJ6bXJrdFAzMWtRWm5wanBQalJsYWtFNzBDNjA0ODFUS3c5WC92NEdKWUps?=
 =?utf-8?B?MlJidTk1Y2t5R2FuUnpqS3NtRXhvYWJJNVdkQ1V6OERTUnQzQ2g2bG1ZTW54?=
 =?utf-8?B?a3FMczIwZEpKWmMrR3JqQzlXSmpnMkt3L2VvR3d0WFNhRG1NUzluZG1ueVdY?=
 =?utf-8?B?amZVSTAvSjBtRnNMaVZDOUhSU3RwdXp1UEx0d1BNNXFpRzJKb2t1R1k2ZE56?=
 =?utf-8?B?VFNMNjExODMyZS8xRzVsT3RnREdaS3VXdjlINE1WaVQ4bG5lTDAwaldGeVZj?=
 =?utf-8?B?cFdhSDhxN3BaY0tyQ1NnNjlPTGlEZjBUS2RaU3BhWlJ0dzFyZXRvZTVMd3hk?=
 =?utf-8?B?dXJkZ3ZxSTlDSGhyWk1QclQvMko0bXVQKzlFY2tFbWFsek9rdE1mSk9RNlBp?=
 =?utf-8?B?MG5SemVveUFNdmdCWFlST0VoRGJLdGpxUTMxNERPUTFVVDRKU1kwM3FySWpy?=
 =?utf-8?B?L2RjVUR2V29Mam91cGR4YmtubUJkTVhQSCsvWVNEOVBXc0E0LzI0WHVaZk1n?=
 =?utf-8?B?cVlqaE1SNG1uUm1Qa3hTelJ3MEJVSFpWRm1wZmt1OGNuS2g0ZHpzVWxlL2lu?=
 =?utf-8?B?QVl1czU0dE5HZzZ2eEZHZW1Vck1CU0h6TmJxMHlxYWJLdlpBenJBVUorZGRR?=
 =?utf-8?B?RTRyM3poZ2tPdWV1ZHBjZVp6TGw3Nko5U0FleWRMcnB1dGZPZG9ScHE1RXJk?=
 =?utf-8?B?VXFVT0JGNWQ5MnBUOHUvVTM0MGs1eWtCQ3FRQ0RGTVJCL2s1RlBLU0ZHb0sy?=
 =?utf-8?B?ZVVGOXg2dk8zQk9LRjJoZnBMOHRneWxHVDY1QkV4QTdiRmlWVjBnTVA4VFhN?=
 =?utf-8?B?QzIwZy8rVDdBRDBjQ1VBUWNyckN4MTRpODNRdWtkSnFUOXhiUHh6ZVVVamk4?=
 =?utf-8?B?U05vUGgwcU54N2ZkcHlWMUVQcTd2NXQ2ZHZxQnZBSitDSk9wZ2o4MlNaa2Vz?=
 =?utf-8?B?U0FzWWFyRWs1dWUwMGNMZmtRR1lWSWI0NUttNHk3azR0Vit5VkNML1lTNlJn?=
 =?utf-8?B?S2IrdE41RUR2QjIzOW15NGIzaGpGY0gvcXpVV1huWVp4Tkp4VjlPU1BoZ3FM?=
 =?utf-8?B?SGxjM0NrNG1mN3lEWU1iektlU2VMZ0RJRlk2ZUR3WCtqQ0NyR21vUzVKeHZU?=
 =?utf-8?B?SHhTaHRscGhZTnlqdGJ3MnZGRkVSU1ZOMmtYRFpxRzg2L2NuMVdWTk15WUdD?=
 =?utf-8?B?Q0dydCtYeURqSkNvbW5oRnJQU1JEY1gyeTlvMDNIQ3NtVVlsc3JPdllma0d0?=
 =?utf-8?B?YnVtVE4yanF3OVR2cnRxYzBhS1Z2T2pzUllrMUFJdkI3NlRPVTgxV3lkeGxQ?=
 =?utf-8?B?VVd5RUZiZzB4T3lQNmcyYU40MThqTzBaWXZlMXZSZFNFVXNBdXZLWFdkd08r?=
 =?utf-8?B?YTZQRWhnUnBMdjQrVGJnZzJLM2xEaVF1bnBwMkJvZW5TYTNYSkdvQ2dBdng0?=
 =?utf-8?B?MWtGSHJ4Q3RBeXo0QnRzWHRPYzVpeTk0dkIxRUdYUnBTUm1NWlRoSEI0OC9i?=
 =?utf-8?B?bTdGY0YyLzVpZi9OODZ4SlFrRFJsbzZWWTlSY2lSaGJlVVpia04zTzNFdmNR?=
 =?utf-8?B?VzdVa0hNR0tCdDVRUXUyMlV3KytIRk5jbnJXZitPUGlyeTVwa1RodTBTQzhm?=
 =?utf-8?B?dU9oaFZmekxrNGIzNFVvTTZUTFNlaEhJZ2FsaE52c1JtdmlocCtXVmRpbzB3?=
 =?utf-8?B?ZGF5QnB0N0N4UzcxQ0FQNC94bCtTY1FucWhFK3NyMENYVXlnRXVXUzBtWFdT?=
 =?utf-8?B?dk9JbHlyUnhjUTNNejIwOEdBK3N6eDdEcGY2Q0xqZlE0VHpoMHQ0REdRa2Mr?=
 =?utf-8?B?WmpmZGZQVjlBTlorR3IxcEplRjJaRmR0TzBROU1pK0owa0RNZkhncVJmSjM1?=
 =?utf-8?B?UW5IdU02N2k0UHVyeGNQdXFiUXBaMTRJcmVyV2NUQnUwOFQySzhUMWhuTUVV?=
 =?utf-8?B?MGNpNGN0VEpibk1lcjV3dklHdnZ4RkZiVkpnNDBDRHUzV1l3YXpoTncweTdt?=
 =?utf-8?B?QnFwWG56YTYvZmsvNW9kRUxJS05OU0NTSG90RHVWZTlrWXd5WEhNMS80djN0?=
 =?utf-8?B?bmNwd2ltS2VSZUo4b1Z1SHp1YXlzR1NmTTFkUVlNQStzNnp6K245Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c382040b-4727-42d1-3687-08deac1524ac
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:46:34.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilW8rrfsGWM+7Viun9BCa7DKLKtJPF2sCkTaGuaNR4eq7gqUaPl1CchzOK9is3H+97PuUXLPdYITKqDiW+qBmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162
X-purgate-ID: tlsNG-c201ff/1778143598-D8979443-2DE2EA6B/0/0
X-purgate-type: clean
X-purgate-size: 3110
X-Rspamd-Queue-Id: B2FD74E5164
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim];
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

On Thu, May 07, 2026 at 10:03:05AM +0200, Jan Beulich wrote:
> On 06.05.2026 18:51, Roger Pau Monne wrote:
> > Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> > say the least.  We don't know what registers might be there, nor which
> > values might be safe for those registers.  On a forthcoming platform doing
> > the zeroing of the MMIO region does put the IOMMU in a broken state, which
> > is not recoverable by the IOMMU initialization procedure in Xen.
> > 
> > Instead just zero the control register, which mimics the current behavior
> > with regards to how the control register is handled, and ensures the IOMU
> > setup is done with the unit disabled.  This approach will need revisiting
> > in order to support Preboot DMA Protection.
> > 
> > Fold map_iommu_mmio_region() into its only caller, as the function body is
> > just an ioremap() call after the removal of the memset().
> > 
> > Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> While you got Andrew's R-b, I don't view that as enough to commit it. My
> prior concern towards ...
> 
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
> >      return iommu->ht_flags & mask;
> >  }
> >  
> > -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> > -{
> > -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> > -                               IOMMU_MMIO_REGION_LENGTH);
> > -    if ( !iommu->mmio_base )
> > -        return -ENOMEM;
> > -
> > -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> > -
> > -    return 0;
> > -}
> 
> ... this part of the change wasn't addressed, neither verbally nor by an
> adjustment to the description of what was committed. As previously stated,
> blindly memset()-ing the entire area may not be the best of all options,
> but the downsides of not doing this need to somehow be addressed. As
> indicated, once they run out of bits in the main control register, they
> likely will add a 2nd one. That'll then also need clearing, yet we have
> no code to do so anymore.

I could introduce an opt-in command line option that forces the
zeroing of the MMIO region (to have the option to resort to the
previous behavior), but I was (wrongly) under the impression that we
have agreement the proposed approach was the least bad of the ones
available, sorry.

Note how VT-d also doesn't zero the IOMMU registers MMIO page either,
neither does it seems to zero the Global Command Register either,
which I'm not saying it's correct, but is at least a (possibly wrong)
precedent.  I don't think there's much we can do with the handling of
enabled bits in possibly registers not know/handled by Xen.  Like on
VT-d, we possibly need to rely on the firmware to handle the IOMMU in
a half-sane configuration, with no enabled features on registers Xen
doesn't know about.

Regards, Roger.

