Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGhWJsR+82mr4gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 18:09:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A44A5663
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 18:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298293.1573725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wITwP-0005FX-7W; Thu, 30 Apr 2026 16:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298293.1573725; Thu, 30 Apr 2026 16:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wITwP-0005DD-4c; Thu, 30 Apr 2026 16:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1298293;
 Thu, 30 Apr 2026 16:08:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wITwN-0005D7-6f
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 16:08:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wITwM-006Ddj-FB
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 18:08:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f37e74-5cb7-0a2a0a5109dd-0a2a4506b750-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 18:08:38 +0200
Received: from [52.101.48.40]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f37e84-7371-0a2a45060019-34653028be91-4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 18:08:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8419.namprd03.prod.outlook.com (2603:10b6:8:32d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 16:08:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 16:08:34 +0000
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
 b=Ln1AbFGkWQQnmxJXUr4sqp/FIYcpljN9/drRR7KsvQQVtwQKUgRyPVZhcm3Df6YLAv0bsb42vf2HwzMG42V4NmT9pTc5yD5w22NMDb1IbqN25S6xfd8dYuX4m+OrRapY7Jr+HbUDKwYkhQLxEE6B9yJ/8jagzUkysPxQtpDDz/R+8+hIdjzBsed3dkGcl8/KR5Vhvp++Unrhw17mrcJYzh5OKwEVA9RTKG0xpe7vFfY0m+EWjEyI1i4brMRRGVEf/5K0BLFSsRHyDJ/azt6/K05fRNH3nWlP+vbrebpZqskmrIipW4IPRn6Ocz4JuPN5TSlAsZIQZS9+cvl0AOxzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VwQvLNIYQU/PRAH9D44sfOYY7+Toz/7OoBe/LJyChQ=;
 b=HWzDmcDP0E23e2ixhu63cP81PVidhzpHplqgg5Md/GTfU4rpQJWgU7wxurxx9d1fekuF39+6FpKrflHNz12g/sPg7x78rnvv1C9c+uIRdmcPgzaUSTqanF1eIfWvM65pL42X+YeNCt7pJziOZvbsjEF3iij2JkMS2VmyAcBW1gwTUvhrWZKAbvGmuAdwOdBVpxAJg8LbCO8/bJCwWCwyq6qarwJ9ZKA4Mu6CSNQezXlBCmmkU0qtZNuAF48C3J8RirIIBA2iVBgQWPU/tRtvy0R3YaHMRNAP03zGUcb7kIl2NgN42zKcYZrzUZCI6TvsFrxZR5PLilHovNXeYg52Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VwQvLNIYQU/PRAH9D44sfOYY7+Toz/7OoBe/LJyChQ=;
 b=itZTtu7bDeNP0lRGMfNkYMcystbT66+DLL3MmBatWkYheZB5x6shz/l8m+ZzL5LeDKO0KhJPcoOwZa8+wcZDsIGFg1SoACjwnkyN2JvO8DSMp0OPIURBZkKTGN6UhkC6B77sKgrJM2HMHzbPDJMume2q2DMrPgjNAJ9tNYoaa5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <41d63925-408c-4602-ac9a-73129545f30a@citrix.com>
Date: Thu, 30 Apr 2026 17:08:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260423161112.50221-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e99e3ac-51d6-478b-6c60-08dea6d2bb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XUXlM3fH8u18cut86LC4TrZh9huPsOl/ZLIzQdmgN6w/di8165YdNj50oiIGdiaF89xOMSXjyz3C3AdzbRoBVqZAIUWOmhmeyIcXG6dWzc7GZJyp6F+1DqcqFoA66cPw2TTP0pe/lQAapbTjEQAb+fOClT+SYs/EtDpYtIVnXD4b2hexQJv4OTV4Zg1/VdjD2AR5SOsevgK4PEuOqXerFN0llAL8rNNeM+1a1kvkLrTkoAX0ygaAo8E1DNn3QTNYLim3f2vn0B2Tp0ePJevsKtxmXDq6ShYF74NNEqV0nJUSuOmUuB/PwcUazIIw4QyNEnnm/c6N1TNk+AdgREbge74ZKN6CbTemF+uSF9eVFjnZyZb4+1OetCcZSxeEOQwFDCOhUmgOUZ8qZ8Ol29x6Drxg+3Lc0rGswpRa7anJJ8ze6TT52oID2G0pCmEIeFzJ9GeIIsfNlvmm1qONILEV9nhC/OOoC7fDVZyi6shzgDDLqVW10sng62GyJWyUq9CfAlMfZizX3fkWFK5LkfYZYElC9EkdVMG+3UQ1IvltdCzKJ4QYui3BAyA65+g6sLoAHh2iDRBEbcW8K7fQfgKzEpn33xR/fbW9mi8keLv2RCLjqHu4JVP0w7Kl5yG8QK2oo93JIYyqnkdELBA7+VlIpp2AvBfHAqb7gLcIDxOPsqY5bQJ9n3MeM5L5EkcZ45KZxMTSPOEtQTtMEiCqJkfZF4x9Ns4uHPXkrcryQ8lf79w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5pM2xkNUJScHZRK05vNVVDWVRSTGZSSzd0aStJVU1NSTRSRmx6MUgxWUpG?=
 =?utf-8?B?STFOWWRoUEJ0UDdjaFlWQXliNXFJc1NVL2xSYUtRZHoreEc1cWFuby9LVlpN?=
 =?utf-8?B?L3dYUGdOYklpRmlPeHRkRVpIM0NOalpkWUlwM1hRY2FqZjhTdTlpeGx4K2Zm?=
 =?utf-8?B?RkNRUG1mTzlHV1ViSGxUbDhJM29nbDhNd1VBMFAyV01EMHdmZkkyZllVTjl1?=
 =?utf-8?B?bFhCWC9Pam4ySzBaQUxocGt0ZEpSajJLdXBsdHI2Ti9kR2dVbk85V1grU3Z3?=
 =?utf-8?B?ckIwUGloalg3K1NWZWxDcWtocGd0L1M3czVoYU80RGtndzZaR3lTUUhQNzlS?=
 =?utf-8?B?cjBnL3lCaWMrb3FhbUhaQS9EYlVXanFOQUVnc3NMVnZPdEhXVFBtd0xCaW9J?=
 =?utf-8?B?b2EvUE9tL2xPTHp0S2ZwN3o0Tmo2WC93K2hGeHlPdW9iV1pnVWlKRXFBaVhC?=
 =?utf-8?B?eE5YeElFcG0vQjB0cDRiWGtEcHRIUGoxY3NMcCt6Z0xkRUQ3TlFGR0ZPbTdX?=
 =?utf-8?B?VWdnWmM5UWpEUEQvZHZ5NlMxNzFYeVY3dUphVmY1V3pOY2wyMlVLZG9pUFcw?=
 =?utf-8?B?Q2dmUDBDQkdEL2RDcTJvYk9CR281a050Q1BoaGdITmlZQkE2WFVISWRGdFcv?=
 =?utf-8?B?MC9LdFBKZi9wUE8vRC82RitpK1BIZ2xYNXpkdGJodVp6Q3N2SnViUU03aUlO?=
 =?utf-8?B?ZUU4eU43K1V0UTlQNTRnK3c4VXpWMG8wV212bmVLdGZvMlJwVE5vMnFZYkpn?=
 =?utf-8?B?dGZYYlFIK1JodFY0SlFGR1c2SjdmMGxkK2gyRGhMK2hCM0FmLzVyUXFaZnl4?=
 =?utf-8?B?OVpYc0ZyeW92eUtHc29ZVmRhTWNyZHJkVHFHZ1dpWjZPV0k3L0tzYVZjS3VL?=
 =?utf-8?B?aFZkZFJGZm4wLzkydEZVaFJKMlcvWHVHZWJTU2pBdlFkb1REaXdxQUZxNDh4?=
 =?utf-8?B?VmprNWZsNGh6MVZ5enZWOUQ3MERBQ3RiSTk2YnREZG5VTzJ1b3ZZNE1FVDFu?=
 =?utf-8?B?NXlKaFpmcEtKaFJhbW5IbmkraDU1TmdhUjZPbEZkR2YwTTczWCsrU1o4bG11?=
 =?utf-8?B?clF5RnhuUVp5MmtmOXd4d1FsV0l2TXdSRGovaVlhM3IxZkIzTFNOZG5DRnl0?=
 =?utf-8?B?cnZLelJIdjFEYisxQ2pDVEpmYzBFdGgxQU5SOXBLOFBzVStBWHArcStJKzV0?=
 =?utf-8?B?L2VJOGNMZk5uMmZEdDVVYlRvK1NUMzgzRGRPRHRRUFE5dEtCa0hvQzRWYk53?=
 =?utf-8?B?cm5tVGhtRFRSOGFUR3l4cWRWUXBybENraFFUTUpucnlkc09FVW1JclNyU3pC?=
 =?utf-8?B?Zy9CZjhVNE5BTVBkb3ZmMWJyL2RXMTZpbWFwR05mTUIwWnVrazE3MU9YYWI2?=
 =?utf-8?B?MU1VckF6eDU5TmpDTmdEdTkvZTA5cDc2RDZDVFU2akp0TkRNaVVhTDk2UXRh?=
 =?utf-8?B?SVA0b1VlRHJDUFRsNm5PcU5WeHVzS0tLQXhYelBoblRHVUpjakovN0ZrcVM1?=
 =?utf-8?B?aVZPSnhvOWN4Yi81ZlNSZ1pqL2ZQTmdGV3djdzlGMXFMVTJGd0pITlZvWWIz?=
 =?utf-8?B?YkJZMHQwSm05UWZqN1BMOTRkV2lCS0t2QlZVRHdJMHpsK0VPME9tUGhJekJM?=
 =?utf-8?B?M1JxRmxRcjlEV1NZUHh5MytVRklRNXZrMzBjTUJhTDBrdXc1eUpEOVBRZ0VP?=
 =?utf-8?B?SzdzM2h2Nmt0WVJPdEdoeTRPb1F5NlM2UUpCdy9wVUQ2MW9ZTjdUclRTRVJn?=
 =?utf-8?B?elF3ZHBadlZsUmlKc0xGd3FoZnlmRXlVQUFSTzJtTGVwbGxFTWpTbkhyWWlT?=
 =?utf-8?B?aXoyMG91aTFueUVENFBuaEJyREJaZWJ4MW90M1F1OThtTDRDQ0ducnovcGhn?=
 =?utf-8?B?U3liNkdVK2RVdE53Q3BmMSs5YjdpdDJvSTR3TVZZOHR5ZUtQOFE4U1NycUt0?=
 =?utf-8?B?ZnJOeWZMSEVPeHBWL0g3dnorYlAwd2JWaE50WDlGMk9UTXJ4MnVoV2tmWDZ0?=
 =?utf-8?B?TUpoMUpHWnp5aldkRHU5SVRlWExscUFNWUJnTi9hODlQbytuSmUxMlBFbVZQ?=
 =?utf-8?B?NlpjVm1DVk1IOTBManRwSkNzcFdTWTJpMkhMdWVaNThJQWdkUlk4cndldDZU?=
 =?utf-8?B?a2tldk5CV2RRaVFRYnhXMlBHRERnTXVRbi8valVYemZCSzdnaWVVUWhiWXNH?=
 =?utf-8?B?U3kvblFuaWUwaHl4VHdmMGtuWXR2cFU3dkdva1JRTHRYV2J4WkR0SlRwS28z?=
 =?utf-8?B?YmpEYkxGRHhxTkx0aWQ3NzFRVjF5UmJ3T2QzbVcxQ1NWaU9LZk0raEtRak80?=
 =?utf-8?B?VFFZYWVubG5xa2VLb3loS1FwaDA2Ync0UkhiOFRKYlIvRWlnSmwvMGtkdzB4?=
 =?utf-8?Q?ydj4glTWdeg3OWQU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e99e3ac-51d6-478b-6c60-08dea6d2bb05
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 16:08:34.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HKji34GeeQBIUwS0EUfFyRI/U3WqnuIFpjfqhNusCuUbqjO9h+zLLasSEGZLHlS7SHIjkAiYJ6dkvOt3xppv4hvUFkNshUb4Qbg5HDF7eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8419
X-purgate-ID: tlsNG-16d1c6/1777565318-5397CD75-CFBF9BA3/0/0
X-purgate-type: clean
X-purgate-size: 2557
X-Rspamd-Queue-Id: D15A44A5663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 23/04/2026 5:11 pm, Ross Lagerwall wrote:
> If L1 executes VMRUN with the GIF set and it fails consistency checks,
> Xen will inject a VMEXIT and fail the assert checking the GIF is cleared.
>
> Instead, clear the GIF when injecting a VMEXIT to match what hardware
> does.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index ef6fa5d23b67..f89b087a1155 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -733,9 +733,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>  
>      if ( vmcb->_vintr.fields.vgif_enable )
> -        ASSERT(vmcb->_vintr.fields.vgif == 0);
> +        vmcb->_vintr.fields.vgif = 0;
>      else
> -        ASSERT(svm->ns_gif == 0);
> +        nestedsvm_vcpu_clgi(v);
>  
>      ns_vmcb = nv->nv_vvmcx;
>  

I agree this is a bug.

It is common for GIF to be clear when executing VMRUN but it is not
required.  The pseudocode says that VMRUN simply sets GIF, and #VMEXIT
simply clears GIF.

But, looking at nestedsvm_vcpu_clgi(), it's not the only bug here. 
nestedsvm_vcpu_{clgi,stgi}() have additional calls to
local_event_delivery_{disable,enable}().

vgif_enable is strictly an optimisation that allows hardware to manage
the vGIF bit, so at an absolute minimum this ought to be:

    if ( ->vgif_enable )
        ->vgif = 0;
    else
        ->ns_gif = 0;
    local_event_delivery_disable();

to have balanced semantics.  Except that messing with event channels
can't be done when hardware is handling the vgif bit.

In fact, I think it's plain buggy to be touching event channels in
response to GIF changes.  In PV guests  vcpu_info->evtchn_upcall_mask is
the singular mask bit, but this is not true in HVM guests.  Even with
direct vector injection, HVM guests are still subject to normal rules
about INTR delivery, and that CLI blocks them.  This should naturally
extend to GIF for nested-SVM too.

As far as testing goes, perhaps we want to start with something even
more simple.  For real self-IPIs, and self-evtchns (for all reasonable
evtchn delivery configurations), check that delivery is blocked by IF=0
|| GIF=0.

~Andrew

