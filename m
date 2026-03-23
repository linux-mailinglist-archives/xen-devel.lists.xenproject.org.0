Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD5aBPZKwWlbSAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:15:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718832F4091
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259370.1552677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4g3Z-0001Jr-3n; Mon, 23 Mar 2026 14:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259370.1552677; Mon, 23 Mar 2026 14:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4g3Z-0001Hz-0N; Mon, 23 Mar 2026 14:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1259370;
 Mon, 23 Mar 2026 14:15:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w4g3X-0001Hs-R5
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 14:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4g3X-009jHw-6m
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 15:14:59 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c14ae0-e002-0a2a0a5209dd-0a2a4509c820-6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 15:14:59 +0100
Received: from [52.101.57.33]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c14ae1-e484-0a2a45090019-34653921d878-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 15:14:58 +0100
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by LVXPR03MB989182.namprd03.prod.outlook.com (2603:10b6:408:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Mon, 23 Mar
 2026 14:14:54 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 14:14:46 +0000
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
 b=Vevgn4wNOjbavpeq9PGdZ9TPrqFLZrk5Jujv4j8iZyinTsLcTX9lvoVRj8x+w78I7nUMZUgeS+GxBrDGw4RclYEhXa2CP15dxLBJ9W0tvbl+wkB2Q5hVXMztcxPuYPdMDnMxkmCjUXdQ9NvbjxV2mZDLb4m6FehmXCwpZPUbdLSDudLrxl6to6RqqInr6xJi4dAKS9S5tx2ZnyUpJKlPuoGgGUxTmQc1+GkLJgqpy6H5EIoTT3GJPo8AN4CDEY2e1+DUr7428d528Jjn3uL4ypE9NpscLBCh3LUPRatQ+CwKNJDJB5jGZqL2D2rm0H50jIj411arQWSOTdOsLtO+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Im1uHDgX/jyfDew07TwZhG+NvfF2Tn+QC95G5pJIA=;
 b=mGiM9I6Z0JfEXWHm+PgfVZyD6ZVrztfSDw1SiknxOlf5jeJ2VMErfH0pEepvJgZ0GDRQYgPHr4IF60Uh0om17kx0PYIo1TVgjSJJ4yJ4JqfLTExwERID+tcnvOeAha33IL2xocF9uqbs7TulHB4R3VJMnIPVnAb2rfrddBbAW0gGsRWa3/jTTmYlw/iLokVmXW+SIvKDNiDD74lMZ8nQcf2qkRGmqZRhcVIXmBncg/OtPrwSGQOdlvgMeNQDDxZEdPdjG2B792fOjsBz0BALXAkOAQEPWUx8Xe3d0Nvs+W+aWB0fY06QQIklftgtlgrGK475ginLnkqCovDEnurgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Im1uHDgX/jyfDew07TwZhG+NvfF2Tn+QC95G5pJIA=;
 b=W4cemsyccc4uyd0+xLau6VxnbkGrQrXWE/GY795/2tLQbFwwkybDpThPHgO6tBCpdUSGExgeirqln6YBIeUTszittVLggOurH2da0OonLYwkfGeZkBwbc8lFPBm/l1Xj56pMueKK6k7rBBhbNiqntPoCDsMqkubuPSzNW56HBM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5945b2da-7e8d-4dca-b184-c030571cba4d@citrix.com>
Date: Mon, 23 Mar 2026 14:14:31 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] x86: Cleanup cr0.TS flag handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-9-ross.lagerwall@citrix.com>
 <a0674df5-41d6-4f25-a236-52390a5c506e@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a0674df5-41d6-4f25-a236-52390a5c506e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|LVXPR03MB989182:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b89b39-32f9-4dc7-9fd7-08de88e6899d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	n7DcsrrKrmu3dFIL7Zptq7fH+CHn44SmBH4cHKATV+36/Ltjy55tLkzTF46YdBExjEd10/ZyHhjvf6jeGWU00yVhdSnNrYhkyMbkuKEGAtmnPYqgodOok+SrSKjVSeSxxJi7f5PfF7eQpI0/7WLYKDuGuiPwqv9QsYaQyOnFX6wLbg1bobE2w4rfhuZtX/XHCq3rl2O3ZnRndv1pm18IglvWZFWD9JAKdgSEywDWMKaV6HkV+/LWeagMDvbaQCKJhSh3wKK6hIwNhPW1rk7fS+Q0XiNMuCWVRTdaQ2JzAhtS5XUO2HpWSBR6rqNCCBZIK36lT8z9Qm4J361GurWww5JyfPFBteK6+pzasQlPz1Eve3y5+R1blHEVRN79WoMes2iJSBXvVyYpa1Y7GWtvkEmxMUjqf3/tWINkqSO0LMJDUBBe1ILFa3G8EQRePlY0xt9HHNlOo3We473zOx7DHl5rKDcSR/NviygXjnWDJxeLNdNpJ5anDipWoUQTPGA9Ig3sdlebDjApiAJWc6gfdKnwg6nsW9MkQyI3ChCPpmMCY2ua5oBjv6KiU9EnK/1Gtiqe2IdJftPMTcdHQ3wtfDynsntyESLdOOtFoQJRkgFLHgMrUYo3hwredV0z2Ybx3zjeQ7ywA1eie8JuDlpxE69AlDraRJ5ODPTje0s4RYvUC1K6ELNgxO7m+9iKVBPcFXRmmcSII3NpAGH6ON6biWFnrDdKrcIK2o2rGnFl7N8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEJSYmZxVFptK1dseGk0V3VwQllwdlBTakg2RzVsZVRDSE5NMkpVdVJmancw?=
 =?utf-8?B?L21wV1RrV010Znp4eC9jQWZmL3g5Rm9NNGx4ZHJja0tlQWEyUGJqakFDR2Yx?=
 =?utf-8?B?ajcwQm12SWpMMFRSenVubTQ1ZStpenVpNXQzRlZhT1R3SUFpZEdHVlcyNWM0?=
 =?utf-8?B?SVpuWEpuRis0eDcrUnV4eG5WYUZlUFlPaGxaN3huM3d1Sng1R09sVjkwUVd1?=
 =?utf-8?B?c3JCM0pzTllQR0xGRU92bytoSDFEaERrN3FjVGViSjBxRDUvVVRkUURJL25x?=
 =?utf-8?B?bHArTUJrUFVpSU0xWXR6VDdQMC8wbFZJSWdrQXFNMWFmVFNITFp4Z09ZbWUx?=
 =?utf-8?B?RXp4aDRZb0dqcTI2L1lrUFhjQVozdExFa2FhMmNzOS9kVGIxMHV6RXJ0RnZz?=
 =?utf-8?B?bHZ6NmZ3YU9LaE50cGpKenZBaGczSWp5Zi91RGM1QU5xdUtWNTJBN2QwSkoy?=
 =?utf-8?B?QzVSRDkvUVhTdUQ1NFRIbTY3bTJ0bm5tV0hZSGorYVdYWmwrMUJmM3Ftbkdn?=
 =?utf-8?B?VFFrYU5naFdaR2RoYXMxTU1GTS9rVmRMSlk1RWU2RnZRRG5neWdLQ3l6b3cw?=
 =?utf-8?B?cHBlVUc4MTBURmJzYUJnYU5jVmJUSXMyczMvOXVNaUx0RWVTdWltZTJERnhM?=
 =?utf-8?B?dmVUQTE1VFI1aUVNWGR0Q1dCWHJ6OTQwRXdGSlJhSTlGVlY0a0FEZVJKT3lv?=
 =?utf-8?B?Ymw5NmZUdk1OVy95NjdlTFdrQkRRcTlHdS9sNlBBeUtQblJ3aFgrZEk2bG84?=
 =?utf-8?B?VUYyRllXWmoyVHBHdVJaMGFKV1h2bzluSmtoNk8wZWlMdFZqK1Q5T1ZhTy9X?=
 =?utf-8?B?c0tDUWZ6TjU4clNCT05mUElKcVVxMUxHbDZDbVdYQTlJcmxoSlBXK2hHSFkx?=
 =?utf-8?B?OHM2R29UT2orUk1BWnJ0d3ArM1kzak5PMkp6c3Q0UU1odXk0NElEbm13c3Nw?=
 =?utf-8?B?bmVHWTBpa2hnTUowbUt1RG10c1FjL3hDR0VVUXh5NDhaMmtZeWlrRmRXYlB3?=
 =?utf-8?B?OEdLbEJybXh6ZHdwNXVWUUhoaGd5Q0cwdnc5UjJIaVlvSmNQRnR1bzlGM3lq?=
 =?utf-8?B?VGJFcFY3djdwMnNtVEwwMlFmbDR0ci83S3RYUkdmVHFGY0Zaak9EOStYRCtD?=
 =?utf-8?B?SmIzRzIxcWxUQnNNWW5YRldJQkNKZnAzTTJ1REZDMDg3K2l0RWlyMVNybUhB?=
 =?utf-8?B?V05iQk9TTmowOUVnSDRLMDlVWXQ2cjFrVzZ3cU9KRWZxRHZnbDAyUXlxRE1s?=
 =?utf-8?B?L2ZlZC9DYVRsWGVwVTB2OUZSZ1VSY3ZvNTNycFUvYnRtc01JN3pWNGxVWGYr?=
 =?utf-8?B?SHdaQ1AyWEZaVzlFMjdXd25pbWRZV0UvdHMzMVRGSGVNS1NjWHJCT0RrNVQw?=
 =?utf-8?B?K1BkWEFiNVhJZ2lFREpsODU5alYwMHY2R2w5aGVwWENVQWRmSHNoMFNIaTg2?=
 =?utf-8?B?S09mSklPVkdrOHRHYjN2dHBFWDZ5ZzliOWtMNHFRVC95OFhndHM0cmplT20z?=
 =?utf-8?B?ZTVRTmVIT3VYb2JtWjFCWkNhYXBNaHlPY005V3V5NDNMYVdxMHpLaXpXd1d2?=
 =?utf-8?B?N2poWXRjL2JpSFNQN00weDNobjZ0ek41bUgvRFhQdHhZRkpzREY2aVVGNFNr?=
 =?utf-8?B?d2VNNTMrSnR6TnNDZGg4L2Z5c2loMHEzUzdjejBhWjVMc2YvWndhTTQ3YmRO?=
 =?utf-8?B?RWF4NkxpbTFBdnl4dzBITWVSN1UvaDhtU0tkV2lrVm5weWpyZGhsYVJ1MmRG?=
 =?utf-8?B?VVpMcHhXVURVZEFoQnVxWHg3VDlPa2RSZlFWNmt4NVRCcFdOUGxNK2o5anVZ?=
 =?utf-8?B?N3hhT1pZZTBCbXpDbnFpL28xa2N5aHVWZ1hBRC92dFdwK3NvNEU5aGY2WjZh?=
 =?utf-8?B?UndYemFVN1czUGxtYjMzU0J0R2lpMGhzM0s5TUtPa3dXTXNPbDZxbGtVSzFT?=
 =?utf-8?B?RWJhTmlCOFE0OHZPMHdjTXN2RndRdFpnOEV3RDRlOU9kM0dTMDlqTktuRVRX?=
 =?utf-8?B?TVp6Vnc0Ni8reUw1YnBhMnNoY3N1RTJpYmVFY3RSTTI3Z0hUWks0Qi81OU1Q?=
 =?utf-8?B?QjZ2VGFCR2F2MFVYb0lTQVQ3d2NIYm9aY1RMQm54bkQ1ZlpQdnZYVFczMGdK?=
 =?utf-8?B?N28zVDFLTkVmTEpYZnpGaGVrcFB4TVUvMlRhaGMrRzRjYmhQRzErZ0VMUHJx?=
 =?utf-8?B?SVU1bFNSOWlLUVhkV21jZlNOdjdhUnU2Lzk0cmEyLzVYUSs4L05iOTZ2ckRL?=
 =?utf-8?B?ektsT2tOSkt2dHBtZ0JnUzFPSFZZd1BCUE9hTnRNSFVLNDRQWTMvbEwvMHFx?=
 =?utf-8?B?NEMza2VjRi9QTmwvTUpwYnZUWGkyY3VtOE9VaytuaXJmY01BaWErZnhFM2xZ?=
 =?utf-8?Q?+F3HuLdAFJdvvAZo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b89b39-32f9-4dc7-9fd7-08de88e6899d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:14:46.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrkUfVBa5nSBvdFCxOHhuC/d/+HDoiXbDFVpNZDodtQdYfp2Zzn7RPnzUwg72V/eUBD/u88nw6oVQHxmQp85sI5xKNbUInNOEajua3Isess=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR03MB989182
X-purgate-ID: tlsNG-bad1c0/1774275299-61EB2A73-FE8232B3/0/0
X-purgate-type: clean
X-purgate-size: 1492
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 718832F4091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 12:30 PM, Jan Beulich wrote:
> On 19.03.2026 14:29, Ross Lagerwall wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -883,9 +883,6 @@ void cpu_init(void)
>>   	/* Install correct page table. */
>>   	write_ptbase(current);
>>   
>> -	/* Ensure FPU gets initialised for each domain. */
>> -	stts();
> 
> I'm a little concerned by the removal of this and ...
> 
>> @@ -193,31 +190,18 @@ void vcpu_restore_fpu(struct vcpu *v)
>>    * On each context switch, save the necessary FPU info of VCPU being switch
>>    * out. It dispatches saving operation based on CPU's capability.
>>    */
>> -static bool _vcpu_save_fpu(struct vcpu *v)
>> +void vcpu_save_fpu(struct vcpu *v)
>>   {
>>       ASSERT(!is_idle_vcpu(v));
>>   
>>       /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
>> -    clts();
>> +    if ( is_pv_vcpu(v) )
>> +        clts();
>>   
>>       if ( cpu_has_xsave )
>>           fpu_xsave(v);
>>       else
>>           fpu_fxsave(v);
>> -
>> -    return true;
>> -}
>> -
>> -void vcpu_save_fpu(struct vcpu *v)
>> -{
>> -    _vcpu_save_fpu(v);
>> -    stts();
> 
> ... this. At present it guards us against e.g. an idle CPU or context
> switch code mistakenly using in particular XMM registers (but of course
> also other extended state).
> 

Given this concern and Andrew's comment, I could drop this patch for now.
It can be revisited in future if needed.

Ross

