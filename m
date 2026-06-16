Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqlSCLHxMGp8ZAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:48:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05A68CA24
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Eoy8cMi5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338680.1599714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNaM-0001I8-HZ; Tue, 16 Jun 2026 06:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338680.1599714; Tue, 16 Jun 2026 06:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNaM-0001FV-Ei; Tue, 16 Jun 2026 06:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1338680;
 Tue, 16 Jun 2026 06:47:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZNaK-0001DS-QM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 06:47:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNaJ-004MxQ-JO
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:47:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a30f18c-bab6-0a2a0a5309dd-0a2a4509d934-12
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:47:43 +0200
Received: from [40.107.209.19]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a30f18d-2497-0a2a45090019-286bd113a059-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:47:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6548.namprd03.prod.outlook.com (2603:10b6:806:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:47:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 06:47:39 +0000
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
 b=dgOhQPIRpd1E7RV8kcHYgwiru6HKbHCIOX+nJMfxspLAwSq+DP8HiQbD07EypV8g5EhvENlt78DPZi7O2xAf+tvGBoFAbMoxr0zbr+Z1xfRZT+9pFu8nat1XudENim6RfpRtY74KCG641b+tsaVwW711NInvszXaweeaBRnpRb/yMfKGl1ncdORNNKLj+zHox5qBhtdG1XU3/1ctvjqnGrVNtCcoqVZph4pU56KLykry7O4DA8iDeT2W/wqLVQWxl+w+IT8z7uo20pmEb2f9A7mjanTvjIULRJbtLfPq6hG+YZSoxJRCdCRuaZcbPrShPiPSTIs2fWWn+WaEEaIFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2S0ajeUitG6erztRvDBXWugCanY7dAJEDOOBeN9SY=;
 b=ta7Ha3rf7zRJL4Lo2WhBjpiyYUtfxUvlIF7+eBlTgF3HxCswpp4oELWrBjkdnK07LsJot5MUneRsX4uOS92PYq+rZXTaSAUDamGOlqJoUhWsAHtMBJG8yoMA/b8gnsuwGi3VilVvDorLw7TNJWCagy7PqFru6JPkZNPiOlGIemf5IkBPSmpwmWWy3+oBCxQgQHfD5WxwtiCQzTgw2gjJJmIlx61ld5FgENEk5neum8FktjrCoot0eLRerx1f7NODtuOHpBYUImsyvuboIUPv3T80x7zp8pfjjvoaLgjubMH+qJNqceu4+wiRpcsFObigPUhj2QsBKWNYwWBKCQv9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn2S0ajeUitG6erztRvDBXWugCanY7dAJEDOOBeN9SY=;
 b=Eoy8cMi5V7avJmoU1INZq2p+x6DHjDD9B/4VAAM2TXovq5IzfMcWlBg8Dz0RH7ZWFp98Moq8oVcOPzgQOmNKKSWXIwRmE8LMndu2iGN9pni8FnKQATIANjTGqUfrVwhOveuYSq9QF9omXfH8qcIKwIDxwBVHz0W2uJsO5ITyyMQ=
Date: Tue, 16 Jun 2026 08:47:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22] Revert "xen/cpufreq: fix usages of
 align_timer() in the on-demand governor"
Message-ID: <ajDxhjCed3cQ81od@macbook.local>
References: <20260615193944.19392-1-jason.andryuk@amd.com>
 <1fbb67ab-09f3-4924-b6aa-139fc5d1acc7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fbb67ab-09f3-4924-b6aa-139fc5d1acc7@suse.com>
X-ClientProxiedBy: MR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea9c72d-c15e-4819-3cd1-08decb732819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	miiUVsikFkFGMFqDN00MAwkoaF0Ulx82d1oQfOIUTMmJ3O4u3RaM7ESNFv2amRSAlyeZdbC8hNSO45JbHSggg8VBaTlGpEhZiy8GRSwoZT4mXURrAl/2+s6KNsIupWSukPSGSopV1qGUfAO6F35SOPBEviGnDx0641b9Y2c4EHhuEuonJkmFLSUxE3i54tXDyULHdFrX+bLxZ7MCpaWE4ETvpmlv9q5IWge/JYyOX1y23x68OeHVk0VIvJWkv1kcLNPUtbyLfA8AQdo2lJ63QzKSWvonLXCIZkh2Z3VrQLLljJ3T63DgtXShkq9KWwXPtJTbc0iw5J9I5QINnGdnSyMQn58JuINq2JC25dm92HWJNFXsbI0mmMcznor7kX30dbypD4Mx8poB73FnrcBQRWzWKgs6cQvjkJOoWfnziKIl+ApuiR//YYaey4XN7dls37gCK3KrmBH33Bwn/Lu0sv0OG0Kw3JQj3uAFNSteq+MstOJuRIxhWOhDVYVmqxFkWEzmiSkVp+VGZXqdqCK0fuUIQk/RjNT+dN9hfwVbvHfys56XfgvXHb+WnxZsOubV6IFctKKNb602IsKPYU9ukZzZY+7SqYwn8AZfPoWOIIMTaUZXrdq7Dua9KstM2Opyo9ZCxiSm6iN7b23AbxOCObsqzZpKMONYFdg6j8/4jAlstJF8ln5FJ2g+8RVW46rT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkVjQytQbWZZRlNVaCtXdjJOVFNCY28vTGZWQUpKU2ZNRE16QStkN0p4ZnA3?=
 =?utf-8?B?Z1FQSFhuTlVYWUM1czJwY2dacXZaekk2aEl0YjJTUkZEMUZUVWhFeVY3bFZJ?=
 =?utf-8?B?NDFGSHdrSUZ0V3NiSmRTZkpSN05hbHkweFNDa043S1owU0xsQXVUNUR5M3lx?=
 =?utf-8?B?VmhiZ2xuNzhDOE0zTURnajVzdVg0d3hIK09MNHRBY3BDbGxHQURPUEhBWGxj?=
 =?utf-8?B?dTRjODQxWDhlU1BScFRCK0xjUnE3L1VLVmNxNmJuZGx0blpWSEwrNFE5NS9K?=
 =?utf-8?B?WTVCaVlodFBhQW42enFRcW43bTQ4b1I5MHIwOEljN29BYVd1UGRTcEszT3BX?=
 =?utf-8?B?MkFOOVBrck4yakJ6V1dNdDhpb3IxaHdiakZ1VUtCdjJMaVp4bjl2Q0xGUm1x?=
 =?utf-8?B?emh0OWxGZENCakd4b0JJMWVEeDdMa09WMmQvV1A4dW16djhyREdUVTVMbGQ1?=
 =?utf-8?B?Sk1Va3lNRFR1Q2FhbWNRZ2o2UlJmclVUekxoelJtSExIVmljL1VKNzhEajRn?=
 =?utf-8?B?UDROMkFBcnBiTmNCbEEyL1hLa2JVS2JLbkl0cHJZK0N0NEs2S0Q3cFkxc2pa?=
 =?utf-8?B?bEZjMEdpcjFjWEZCL0kvS3BCSGdoVURJU2hSTHo2Nmgvc051bUNaeWsxQnUv?=
 =?utf-8?B?am1KbkNiQ1hnWC9ENjU0dGlaUEF1M0Y4aklibkNPRHJFcEdUQXYyNEZzNDFm?=
 =?utf-8?B?ODRWNWFJTUhWT2tFaUh5VEYxVzRZd0Fxb1lMR3Q1alFNOUpkdk05dW1QTjI5?=
 =?utf-8?B?c0Vja3F5QnlTRkhSTE1wZFBlNmlQWGdLSi9CYzhRZ21Jb3ppbHlPZjBZcHpZ?=
 =?utf-8?B?QTA0cmN4OStkZldHZXVWNldZM0svUWhvcTErYkRzS1VpaWQ2c2JSU0pQMjNW?=
 =?utf-8?B?MXdsQy80VTlad2hNUzFPRjdTbHo1Y1NVSUJRLzdCc0FrZHVQSUpoWlRGUjFV?=
 =?utf-8?B?a0dTbm5kZzhNMUNZVkdYTHBJM2Fyckh4bDBuV3hWZFBPa1ZOTkFrbXpvY3Iy?=
 =?utf-8?B?emdKR1cyQWVNWDJ3MkVERkJWeEo4TTYzYS9CT2hEYlM2amQ1d0NIZlY4MzlP?=
 =?utf-8?B?VkRjTFNWWnMxMUtPWGp1d25nUXdvY2FJRlBvS05sL2hJZlFqMU1ZVjl2bWtZ?=
 =?utf-8?B?Y1VkaU1OdFVVT0tvS21TMzRQcm1uU0RYSXQxcHBLSit0RUlLWGQwSm1wKzB1?=
 =?utf-8?B?TEQ0Nk9NdlJRTWtZRlFKODBzZmE0Z3BlM2taU2FjOWZrRzRDQzUyaUdZczlm?=
 =?utf-8?B?SnNUL2FkWTBsZ1JiSTkyV05ibGxWOExicWk3Ui9pYThjOGRJcmZKRkUvSDhk?=
 =?utf-8?B?MGR2WDg4MDVZb0RSWUFTbEszMlRqVksvMzRDdThmVnZOWlZGNE1DZVA4dEE5?=
 =?utf-8?B?eG5SbHlKN2JEeVVtMXhmS3l6a2tIR0ZPcHpseGdyK05qT2VEMnBsbW9NeGM1?=
 =?utf-8?B?RGNXMEZyemsweEpOYjVDaE8yek04MG1GaXhWSzNmY1RnSzRDRTRpemVDR05L?=
 =?utf-8?B?UGNKamhOaUZyemIzMFBGM2tka1NvWTFkMVBoNllPYTNmTW1vSTlwM3EzN29H?=
 =?utf-8?B?cDZLLzg4ZlRXSGt5TU5KZFArUEN1aDJnUE16MDVzdmE2NmphMVFmMlNUalFv?=
 =?utf-8?B?NzgrRkVNZ3Q1eEQxNkwvVFIvUGZGYnhuNzcrWDhkbTRmOXdBeFZKdWtQOWph?=
 =?utf-8?B?NzR2Vjh3eEc0MEd3TTlFTDhVN1lVMWQ4dUZRSXBmUW5jaUlJM2Y0NE14NzI1?=
 =?utf-8?B?U25mb2Y3RHFJMDZaQkt1MnREd2REZnVlNkZ5VHh5TVdYYWdSUTg0Vm9mUUxO?=
 =?utf-8?B?WnNaMXU3K0t5bjhVY0lwMmdlMFBnT2luUEhqekNTN0paUzIrZlFqQ2tHWHk4?=
 =?utf-8?B?cytpYis5UmNNSkxkZFUwVkxGdVZrRjBWbFNHeER5S3ZiUHRMY3k1ZG1zcVk4?=
 =?utf-8?B?dXpZQ1Y4ejVqbVhHREJuS3RsdFVFa2ZaNnd3QVlodFUvZFF6TTZWWUJuSFlp?=
 =?utf-8?B?TnBrejVWaUVmVlFFamNGMWtlQkhjVUh0L1k5RkwzeTFmdjkraktCT2Y2OWFY?=
 =?utf-8?B?Zm9ObEF6RFJiV1hqQ3RzVGZrVlpkVytRZXVOaDVGTWxPS2xHL1E3RHEwK1Rt?=
 =?utf-8?B?OFFSNUMzUHJZb3RTNGdaNHJJY2Y4K29CZ2Jqc2kyMUJXSXF3K01RamNQNjJt?=
 =?utf-8?B?bW9YbkxJcDdYc0lla1E4cXJKdUJ3cHZaR3l1bDk1czVOdHFvYXVVYm9MeVUz?=
 =?utf-8?B?L3pHai9ueTE4ZWsvaGQ4dHRxTmJiV1RLOEU2ZmN6N0phL0Jxc2tDcjQ2b2VH?=
 =?utf-8?B?MG9xRjhneXM5NEpBZThzeXlsVXRma1ZwUDJ4TExJSWdZR1kra2ozUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea9c72d-c15e-4819-3cd1-08decb732819
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:47:38.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOPZGmeNtbl9LNToeoo3kof1BfOCADnOEtkbUM3Il4mMVBnsMvmpOAuAeYvWSFyhwqrxsM4wrcYIb+JOMaOPlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6548
X-purgate-ID: tlsNG-bad1c0/1781592463-8A788A53-B8429192/0/0
X-purgate-type: clean
X-purgate-size: 2780
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,macbook.local:mid];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A05A68CA24

On Tue, Jun 16, 2026 at 08:30:25AM +0200, Jan Beulich wrote:
> On 15.06.2026 21:39, Jason Andryuk wrote:
> > The original commit showed a ~6% regression in a benchmark.  The call to
> > align_timer(firsttick, period) rounds firsttick up to the next mutiple
> > of the period, if firsttick % period != 0:
> > 
> > align_timer(0, period)          -> 0
> > align_timer(1, period)          -> period
> > align_timer(period, period)     -> period
> > align_timer(period + 1, period) -> 2 * period
> > 
> > So adding the period (sampling_rate) before calling align_timer() will
> > in most cases incease the expiration to 2 * period (sampling_rate) (the
> > exception being firsttick % period == 0).  This longer timer slows the
> > reaction time of the algorithm.
> > 
> > This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.
> > 
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Adding Oleksii for a release-ack.

> > ---
> > This is backported in stable trees and should be reverted there as well
> > (found in 4.20.3).
> > 
> > A Fixes seems superfluous and not normally used with a revert, but if
> > needed:
> > Fixes: a0ed5bcfbeee ("xen/cpufreq: fix usages of align_timer() in the on-demand governor")
> 
> If "git grep" is intended to (also) find such straight reverts by merely
> matching "Fixes: ", I think the tag should still be put there.
> 
> Talking of Fixes: tags - the original change had two of them, so there
> must have been a problem? Or, Roger, was this purely an observation from
> looking the the code?

It was purely by observation that the current timer setup will very
likely fire before the set period, making the sampling intervals
possibly shorter.  However shorter periods are fine, we simply
over-sample.  Longer periods as shown by Jason have an adverse
impact in the response time of the governor.

> > --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -185,8 +185,7 @@ static void cf_check do_dbs_timer(void *dbs)
> >      dbs_check_cpu(dbs_info);
> >  
> >      set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
> > -              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
> > -                          dbs_tuners_ins.sampling_rate));
> > +            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
> >  }
> 
> As much as I understand you wanting to have things simple by doing a
> straight revert, imo the formatting flaws better wouldn't be introduced
> again. If I ended up committing this, I'd very likely take the liberty
> of doing so. Yet before ack-ing the question above needs answering.

I wouldn't mind adjusting this at commit.

Thanks, Roger.

