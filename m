Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPHJFVF0wmmncwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:24:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D954B3073CA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260358.1553713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zrD-0002Nx-KE; Tue, 24 Mar 2026 11:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260358.1553713; Tue, 24 Mar 2026 11:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zrD-0002LB-GI; Tue, 24 Mar 2026 11:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1260358;
 Tue, 24 Mar 2026 11:23:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w4zrB-0002KL-HP
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:23:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4zrA-00CljA-TQ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:23:32 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c27432-e002-0a2a0a5209dd-0a2a45089cca-6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:23:32 +0100
Received: from [40.93.196.52]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c27433-1950-0a2a45080019-285dc4349167-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:23:32 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7883.namprd03.prod.outlook.com (2603:10b6:610:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:23:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:23:17 +0000
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
 b=ucXhVaHtt75P+qtxXbeSNCfIr5Usxv/VAhhjfqpFOeVKXVnUIFgplOy/QDdmecZly60Imk9rMOSuC6tVsEZUqDvf3+tYsuuIi0ZQ2C/cc7PHwTQZVEIYcsJVemsaWik9iJb2ulyob85rWftcwkBm851/knKMwg7KuW2YscgjGHiGmIqur2m0qaCjMCGrSXRIobmUgVy0Bt/cXs7Btm/PVVXj8EoiYRfBm1WPFRQbd37nc4Sik6Txlrv6qfxNYqD8cmi6IyMQYpIDJI/t9fnHLFTfekQVQSOxP6tUg7xt2uQeRpZ3t9OdDnr3lUbjHs5uOOF3KjAktDMTuzfMjajutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uJqH5x/m1BWWTg5UjTFkTGond1ERcQEAYFB3M2Ni6g=;
 b=PVvrro3L4IlMAk+E/EXygJX81K4kHLztLxaF4vLOcLLEmsrqIXZ5oX45QlaLsnUoJNuP8craH/ZZhVTXOA0htIv5YAn7IJYlkArmsaJ4iocd0MLSZjc/TVk0UCmDrkB8nQLJBEietyFWh5ysLHi+qM9hvvScp++LKL8vpmyvQgt2824jwnUe3zquScGYHvOuq+1nPfg8Ffe6D30HuloGd0h7Hu3/FQjCBPJRsSYCaiADbvj19at+MeWpD1TYVUTZ6t/QPxwG+56qGN5WZteOA/mbshXAPOK/Kptn0IePkbF5TQXPZpOgbCwr7x/qYEACaDP5+9uUKCDyWqukhe/+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uJqH5x/m1BWWTg5UjTFkTGond1ERcQEAYFB3M2Ni6g=;
 b=EVH572yE7DCC616vaUD6PEOdMmVBrDCWjgnacp2ly2NSrvtdfB/BJZMBSSxuwnzk35Kdh7Lgo7l6N9nQWjM4LwBu3vX64v5oikUSNo+h2sBCqP6rIjIl7rVuKvu2K1HuVXdUHn6WufyceRCn5mRMN9hn2JinH10Zgin/Kagcwpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <798dfa84-bcdd-4990-888c-efefd3509d04@citrix.com>
Date: Tue, 24 Mar 2026 11:23:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/6] x86/vpmu: Expose PEBS and DS area in PV mode
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
 <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
 <9172b52f-13f8-4d9e-9caf-87ef04b5fb05@citrix.com>
 <a33150bd-2c08-4fdd-9504-a3e57bf63013@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a33150bd-2c08-4fdd-9504-a3e57bf63013@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 28945da7-c013-448d-37b4-08de8997bf66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b6qJM+5/LYq8TYs7S2m2rvYVYowxnsq6G2vKihDgcUoIG46hEq0PGpMbqqDD+s2gBlQxth0KsRJHUqw2uLP594aasS6q75QDoCha03kCvWI0AJ9ngMX9yiU9wFrrPdPAnWX/5n9h7JwGtwpINX6/aHSMyyZlQQQbB1ASTbEsE2kXNHKXkzu2ns3mK/gxfWyhSO38rDLlwwYK4OTEncysvmzZd6uZOhlslJCBJPS+MSwgCFZcVsq5E270ibXycOIUtLhOMSloJLPH8yS4IR3wx5jw8xWDYE+5RRXWRzgVedEXl8IhfFUqzRb2mYHnPk4z0O7iZS8XNFC9Pf/hQqNxUIyrxv+v1mL94uqfAK5YYC1/lcgQPE/tmO66C5QzUBNUdvSNUh2xWuhTFgg+OO74JB8bgVRN7cYWgb3gCe07/NSjz7+/gLgHqCGaAGuS6k1D4b7BgO00WEflZ6aDe6lZAJeqmxk49D4tZZd32o8YYg9wa5ywSJD2WCl7rdVWGCpOT2uWK2Z2EH61+951978iDXba7wUHFuxoXZG/5QA1LaMs1LXCIcBM2YrYqs+7KzxqSlbW46eQ2IdzlJShX4B0Z4m9I6tylo8Qz39lDjGjMyQBZZN6YvEPBA4fjKPOkVCuzT4X1o2wz50zzn5BVIyHzk00nmxyG6K83CCk0WS4HAqro5p5mknO64waK7K3jQAbVdIpgbsHNiLhBx0mMYEB+fOEk4SOoLrXX6j0FFj96vw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTJuKzMxVHhBMkxLOWRodjVJaWlOaFZKOFR4dXdrd1pBclcwdDZsRFcxaG90?=
 =?utf-8?B?Y21wWEI4enVVNlRXc2FIcTZjWlhaeVdsZERpN25VSUU0eUd2R2IvcjN5elF1?=
 =?utf-8?B?RzhDYVhHQ0dnSFhBQTRGbHNka1hhUlVKRW11SDhWMnpqSHY3UjJ2RXdPM1hq?=
 =?utf-8?B?MWxhWjJVZHJIaGZ5VWhrb0hlb2JJcWZDNTZiaFUxaENsSTdmTTRxTGRqaDBQ?=
 =?utf-8?B?TisxK1dzYkZpNWhXUkhjcjRKVzd6U2lhQ0RzNS8reHJwTTNra2Y5QVVueVVP?=
 =?utf-8?B?b3lscmV3bVMzY2ZBYnNFZzBVZFAwdDFwNngvY2RRVUVDNVJwbTMySk56WU9l?=
 =?utf-8?B?VVVwd0VTOTYzR0gzOUVDOEV6OS9SekplWFVacUpvNU5wVTY3dmRjVmtvMTBx?=
 =?utf-8?B?dXZFY1BVYnVwUnNaaVZPbzZmb0xpdWJYSjZLT0VraTVLRVh1WUd0ZTd3N0xP?=
 =?utf-8?B?MFB5TjBhUzhyZzBDMk9Xdk5hd2dvRFZ0cnVKTGxoR3NyRWIvL0tqbmRtdkgv?=
 =?utf-8?B?Z3JEa21iQ1BCK0xGaXVjRlUyWnpNRGF4ZjloT0VQNVp0Tjd1SStLWjJZLzRn?=
 =?utf-8?B?ajFqcHpGYWhWUy9sQWthNlhacUV0RHZxczN0Rjl6V0tybHl1TEx0NTErRWRI?=
 =?utf-8?B?TEpkUk9WWXdUYWtkZFBIME1PanNqZUhWQTJtRENZazVIemZIREpka3BQM2V1?=
 =?utf-8?B?d1hxUjdEV3pwTzY2Ni9LVGpPVGNXaEx6bEFnc29lYVprelZYUVVOT1JSb2dq?=
 =?utf-8?B?dGlEV2FJdkluNXgzRU1ISjlCaWpGRWdsdUd2ekdYNXJ1T0lJWGhDUEtpdG80?=
 =?utf-8?B?THpzQTA0NktwamMzaWN6eHFjWHpSU0ZJTVh3NCtZTXNwRVZSdm9iblJzMlVW?=
 =?utf-8?B?dXlsRnNBcnhyNmlJWWpVc2dCNkNNY1FlUjhuMEtvUjUzV1lScFRYd2tsV3VO?=
 =?utf-8?B?R2VFeERldTBsNXY0VUxDS2RaanlmUmF0eENjcDlPdjFET1BWVXREa2FZKzE1?=
 =?utf-8?B?OGF3d24rSlpsODRGUXkvcVFtMTZkWmZPQVp1MS81MWJBNjBsZTZ0ZitJdEdM?=
 =?utf-8?B?dlRmM0pBc3ZLRXJ0Wm9VVjZkL3NUN2RGQytIRjR3c3d5VmhpYllVOTVWTG9T?=
 =?utf-8?B?Zk1DNHVWc1Z0b29BeWNpK3JrbEFVYjd6S1RpVjhUYXBoV0QrcHpmL1NlQXU2?=
 =?utf-8?B?K3oyTEU0V3RqdDhJbGNkQUNWSHJTc1dPQVkweU1JWEZqaEljNGV3bVZGemhL?=
 =?utf-8?B?dWlKUWxicFd2N1R0dDQwN0ZLaTJSUFlVL09ac0pHRW5JZitKS3luTlROc0lJ?=
 =?utf-8?B?VG5LSk5zTU52emNaZElLZVkxdHpRN3VEVmcrK3RyY3J4cmpxN24xelFCekFa?=
 =?utf-8?B?aDlwbXpmSnJJYzcxdHlUcmZWaEY3bU91NHA3bGd0MnFJQUZhWGVPTzRUQ2sx?=
 =?utf-8?B?dW9PZEd4SjFlb1c1REdPTEtVSmxBL3cxUVREa2Y4WkE0ZlJKUXBHaFJDT2NK?=
 =?utf-8?B?WlpPRkRXQkZQMlNsMm43c2I2RGl4SzB2Z1lhdjJkUUp4WEI1YmFrN01hTU4r?=
 =?utf-8?B?MUxGMVQrY3BqNnppM2NQVlAwcVZxYnU1aFFDcU55SW5VdmxGL3oxbXgyMy9a?=
 =?utf-8?B?d043VDNqUmZpR2s0YStic2wxRzJxRmd1NlBzYnZRU2VVbTRZZVNMZml2ZFBO?=
 =?utf-8?B?cTk5UEhFNk8xLzJ6SXBRUHBscmdUTTBSR1I5cDdkdDB4dkt6M1EyOVVKVGVT?=
 =?utf-8?B?Qks0UmZXRHBRelRTdEE1SHdlYVJ6Uzc0Vkc1VDdOdE56K3lrYWdGZFlNcEg1?=
 =?utf-8?B?a3V5andOUEtKWk1FeXdVbHJjdTJ2UnNWOGZXVEIwcm9Od2UxWCtsOWpxcDlB?=
 =?utf-8?B?NzdzYVRsZzRGYU1aT2xObXFmOGE1TTFJYjdRM21Zdy9oQ0JhZ3R0TXFjQito?=
 =?utf-8?B?Zy9YRXpUdER3ZlU2aU9HaWFRa0NycXI5MmlSL2lqcDdUcG5Rak50RURyRmhn?=
 =?utf-8?B?Wmswa1NtY2REcXJ1aWszRTMvQkJZcGY2ZkJxUUdTaXErTXR6UTVRRUZRUVB3?=
 =?utf-8?B?QUVDdTkrQTgrUlVWMUkrWWdqdWh2Zm9xNjk0Tkk1UGFzaHovV2xFaDZ5S1hz?=
 =?utf-8?B?VjNjZXlDM3hIUE5aSHlld3V3a2RCQjRjV2NpTHFwWmdpQ3lqMjk0aDhOT2dF?=
 =?utf-8?B?UWtLSHk2cVc2UnpIWVExQlAxQ09BSzBnTjRxbm5MK2Y3aFpuV2wveS9Vb0dG?=
 =?utf-8?B?ZUV0Y090bDEvd1MxQ2Vvck82Z2RwbmxrM1p3bEFlRWt2Y1EvMTVzbUlZcklt?=
 =?utf-8?B?S2lVMG9IZkZiQUhVSGFrV1VFQ041MFpaT3lwcVcyVjh4Z3lNQUsvT0gxUFh3?=
 =?utf-8?Q?Rqk4BZ80oqHoMeXI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28945da7-c013-448d-37b4-08de8997bf66
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:23:17.8283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJRN+VHX32+YSznqXEq0I6cF7m5JWIPkBUth1mzRaKV2W+RiU9ARFkaYeMq34y6FlD+AIAkioZwZDpaqwAW/vGn/mU8di1/mFmJPyP4e/jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7883
X-purgate-ID: tlsNG-c1860d/1774351412-F2CEA726-9031312C/0/0
X-purgate-type: clean
X-purgate-size: 1596
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D954B3073CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 11:10 am, Jan Beulich wrote:
> On 24.03.2026 11:42, Andrew Cooper wrote:
>> On 24/03/2026 9:11 am, Jan Beulich wrote:
>>> On 10.03.2026 17:44, Teddy Astie wrote:
>>>> I don't see any reason for them for not be available, especially
>>>> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.
>>> This is really dangerous: You allow PV domains to control whether the area
>>> is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
>>> result in a complete hang.
>> It's ~all, and explicitly documented.  SDM Vol3 20.4.9.3:
>>
>> "The recording of branch records in the BTS buffer (or PEBS records in
>> the PEBS buffer) may not operate properly if accesses to the linear
>> addresses in any of the three DS save area sections cause page faults,
>> VM exits, or the setting of accessed or dirty flags in the paging
>> structures (ordinary or EPT).  For that reason, system software should
>> establish paging structures (both ordinary and EPT) to prevent such
>> occurrences."
>>
>> There are potentially uses for PEBS/DS, but it needs to be via explicit
>> opt in only; it is absolutely not safe to let guests have in general.
> That would extend to HVM as well then, wouldn't it?
>
>> One fun interaction would be a PV domain which gets shadowed (PV-L1TF,
>> or migrated), which will instantly violate the #PF requirement.
> Same here, just with EPT misconfig exits in place of #PF?

Yes it does extend to HVM guests too.  The difference is that it already
exists for HVM guests, via the vpmu=dts option.

~Andrew

