Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iNaAByZfIGoz2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 19:06:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4D63A08A
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 19:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dPD30g1I;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326978.1592218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUp2L-0006ry-Gl; Wed, 03 Jun 2026 17:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326978.1592218; Wed, 03 Jun 2026 17:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUp2L-0006pZ-Dx; Wed, 03 Jun 2026 17:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1326978;
 Wed, 03 Jun 2026 17:05:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUp2J-0006pT-FE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:05:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUp2I-004epY-GE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:05:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a205ed3-5cb7-0a2a0a5109dd-0a2a4501a154-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:05:46 +0200
Received: from [40.107.208.3]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a205ee8-c1f2-0a2a45010019-286bd00306fe-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:05:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5712.namprd03.prod.outlook.com (2603:10b6:a03:2dd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 17:05:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:05:42 +0000
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
 b=Bv7JZNBaUpJR6QqyR25jW/BnBCtGhu7Sa6d5WsR3n8EM92BsVpv8XlD7kpw+JzCVxAp/NCoqYBS7WHdeEacotEyZGdT5Y7AxZ4X5b1oru/nfxM1ge9PkBQf8RDBaJ+P5fd1Ikvto81ZNSr4T2Nm0qkg/XBSR47jJk2qApdt5gUjy+IeoQ98PysVXbwsOxp8Xf7E8iVFuaunluWdBa1EjD6Sj27i4vcuKULHAeU+1YdXnXXnnaoAHWJ8LN/NJR3WCszO2mtClTHcXdm1+iQ37KkuqomDSyneckLmtn4nSAFiwu68Tt6PA3hhhGaYGrtD9IkR9aGlf+jJv9/Suol5HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nDpXmVoR4BN0PF1WWMpgQ24wVwGpnWPKVDgU9bu2PA=;
 b=fq3328OFyI8Y/ndSHcopI2pl6cvX8OloHmyadnPxiXjX5RxIsEUMIxyjCeeEexyJkJmvs5bBe+phzFz72B9mvf7WfurpDCU68MPT/nhWKnESeB3LQhtLMAaeeSu1xa428BScFVS9lCj1WqKfMVM7g+mhRLiH6thnvAMyIhO5IVWHHJ46vrbUSuRUrDwzi/F/6731myyV3i17P437YI/3NlqHLb33ex5KcSPLzp6W0b84cyrE+HfVbjRcwMFaK5detAbF7MTKmutGoVzurWddsA8byiooCpqzZHEfswgGIacdELsNe2B8LY29YBMEi6J5sksNk1mabd6iOaAEttDhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nDpXmVoR4BN0PF1WWMpgQ24wVwGpnWPKVDgU9bu2PA=;
 b=dPD30g1I0Ca5Nt0ILHBpj5YDe+xu9NULUzO643lYb53H9TgVlSNL0mkBWew+q9Mu7kXk7JXPbivCqr2LkrYQEb8cpuDeyEz1wYwRfwasXriAR/GIwQwjgHHZZKkae1N2KWAl2X+lWH7xIazzlHXujPSHiBaYjZvPxoz7XtrFalo=
Message-ID: <0ec4527f-ca97-477c-94ef-81f430e1e98c@citrix.com>
Date: Wed, 3 Jun 2026 18:05:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH 0/2] x86/kexec: Implement crash kexec for Secure Boot
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260602164911.2684471-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260602164911.2684471-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0236.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 003faac1-9ac1-4524-dc9d-08dec19257f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aZEf1/9oAf0CjF7BJBTq4i6UFyogoevsnp6UfT2Df+tuEI4uEx9zYnYHRomQHl3xezC+DbnaMq1vmDILhPevRj8Bg9Qtsl3ap97FRU1afdH4NdwdaPt56qgJ2YhOKXR60ZBmkOrSQZR98eIflb5pkX3Ga9R7zxEpvgmM9Eh45B3iRyLuu6aygAikLl1H8XyyDdLwF5qcssJ+WVsDfpX0gWJILqEsFrrp0+DKGQlYrFm136QSFQM+2/kIIaboCoQCnDitx/Qv9nyp4Z9A4QetFkG7E8Z9ZWbXQPf+MuFj/I2ASa+RA0q+x4R4iLb1gXQTOFD5jehVbCLzBEOwGTIj0trdqEQKH6JytZnVN8Ya9NYi1hkaR5aYkOpwLebtLJ7tSjRxXTYq+SRWk3O9QBv+m8S9vKTnGUdPRYsHnVIamIHy+lGqoUe5PAmQcGEWadhG8Cs7NZ1LreFPfY4QtP0BXlshtvq3jQ997CWwyJF3ckIajUoXPphagsmf5uA1iSLNBVXkoZmucoqZFgxIx8f/CtedTWbjCYxNaezfZ9f+TT9U5gXDFyVlaxhjuep7q1uQjLgG05sTFMJ4EeN2L4JPDZOVZ5rNLCF7ZwbaMjV5vDEUHDh6RgDogBRwj8ZbE5bjb+Y7hMwJD1wTWT8NsiHfbNPpRun08TP2VRaTghoZtqWkeUe8QEUfNEikSAi5jqdNLtCxjiRdxLzcJQJnYsihPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGN2OGRwSDdZcUYyTmIvL243R2lLaGVWU0g4aGh4dTJZc2srN1UyMG1OQnVK?=
 =?utf-8?B?U0NidS8wdjBCOXVYWVBHZy82NzRuejNFNHJtdEl5WHVyV1hlaVVvRGJRbzFj?=
 =?utf-8?B?QnlzMCtXMGl5V3lzV0ErT0V2c2NFdnZpNGROOEZWSFBVWEdlSUdZUGw0UmE5?=
 =?utf-8?B?YkV1cWRJeTlNb2pDNk5SMTJYWVRIcytOOTh1Z1ZrZUNDNUplMFVlbjl3RGp1?=
 =?utf-8?B?NCs4Q1R6M3F2dW9vdU5NQkYwZ3JQQXIxRUZqYjlkS1FqeWsrdG1MYzdXOXli?=
 =?utf-8?B?aW1nTk9ZMndIcVp1Sk5rWDdoS283a1lTV0FQbGp1OWtHVFZMT2t2cFBqUUxq?=
 =?utf-8?B?Y1VIRDloQ1EvNk4waEg0S3AxM2NSWjYyWUlibllablpwZG4zempvOFJoaEdh?=
 =?utf-8?B?T0FlRjF0TytydXFZdzZvZzRGTy9EZ2lZRWFYU21iMUx5Sm9kMzBPZUsxeVVI?=
 =?utf-8?B?NHFnSUVPb25SQXZ5NzNJYnZNdHltLzQ4QVJFLy92eXhuM1dJdTZyNm5kME9n?=
 =?utf-8?B?UzR0OTk2MDRMS01JZFkySDcyRWtiK2g1SXl0eEV1S21ORFl3Q0ovMTNhekF3?=
 =?utf-8?B?MVJNQTNmUzlZUk96SUtlWUtNZ1BvUG1xNjluTlJncVVXcHZzYm1QSWFmSjBm?=
 =?utf-8?B?dFBmMlZBdnBEbVJCcTExT3VpNDdTS254WDZHQWZZbDhENTZyZHIxTkZpdW9l?=
 =?utf-8?B?Y3R2QWNHQ0tXTHk1Z1J5Z3BxMnJoNEQ5SmV0Z2IvZDI1Q3g1TXZwcXUxN3Jy?=
 =?utf-8?B?Q25aODJrZWtZckRHdTRHUThOT0lCdXJmVUR3SklBcmx3Z3NnUGFLSW1icllw?=
 =?utf-8?B?ZTF1a01weDZsRnp0STRETnBhUHllUFR1azFHVU9VUXBadk0vY2hWelEvcE5E?=
 =?utf-8?B?N2g2Z2FreUUzZnJvb0xpeWZDTkNjZmliS054cHdqME51WGNaU1AvRU1rVWEx?=
 =?utf-8?B?UWpMSkZqbTljZ25NV2N4ZnRFVWRaR1YxY2xkMlRQZmhtejl5dEdveEdqMWw0?=
 =?utf-8?B?LzFXMEliRHhGcVNqdmRUbmVWNGF6MDNQQ3diQlNiVklEd1AzVk5xMHNTR1R1?=
 =?utf-8?B?dFRCUG12aTk5cU5na2VlVTVlbE5TcDN4dVlQaG90WXZ1aVR5U0N3ZFNFWUZN?=
 =?utf-8?B?NVBCVkVBd3p0Nm5kMi9NTkhkZENPQmVlaGFiNGJRc2hhWlVLMEYvTDNlY21p?=
 =?utf-8?B?UTBSSFh3RXlJSEpUODN2K284OUw4WlhRL21RY1RTdk1aZTJKS2s5eitpTWsw?=
 =?utf-8?B?RGlFL2dVU25vWmJZb1pFakNaOHYzUkdrUUE2WEYxMUNuYzNCOTZ3dHBuaXZD?=
 =?utf-8?B?dWlDd2hMRmo1Sm1uWlJzRk1nWGM2Rk5XNWY1WW5oQWFiNlB6cUUvNHZLa3Jp?=
 =?utf-8?B?N05aS3JOcDlpU0hvZmo0U1JlcURZTU5XTVRNQklhU215Z0lMTXVYa0g4dUho?=
 =?utf-8?B?SnMvRldZbDEzaDc3UFQ1MHBvalZQSE9acUgxRCtBMytaT0t2M25ENUNRRjZt?=
 =?utf-8?B?ZmdtbXg1S2dWeE5uVGc5YU5mSmxtOGhGL3ZycExyMm81NDdsT01KRWJHaVF4?=
 =?utf-8?B?M2VIT0NqQldRZlYrazY5bk5neHFSQ0NzTElZV1NnbjBFUXFJR3ZSWWNHaTNr?=
 =?utf-8?B?R2ptMjBUb2Qxenp5YWd5MUdWSlVYSnZJQnFsc1FGS0VHWSt3UkhOY2JESFIw?=
 =?utf-8?B?VC9IS3pqNzI3ZWcwVHhPMWdpN2JzSWk3OFVLN2t3aGREcEdnR2tScy9BdXoz?=
 =?utf-8?B?a3lHdTYyTmIvejRxM1BESng2U3plT1BqSlBNWDlGS2hrYlVOY1QvMHBGbG9v?=
 =?utf-8?B?MTVoWDltaGY1cXBGYkRZSG8xVDZFeGtUMWcxdXVTbXkrRFR5cmdqOVY3c2ZU?=
 =?utf-8?B?bVJEVmRwVDBXQm56OHFkTk5tZmJobjNVRGRncEx5NFlRaEJQcTlzSmlURFVE?=
 =?utf-8?B?WHdkVzdLcityS3g1N3JLck5ZaHZZS2t5R2x1WW5RbGovSkhIcHNKQmc2K1BU?=
 =?utf-8?B?eWFXRU5obFA0ZE9yeGxNQVRwVlBod1R3WThQcFNPSVU4bHZ4VFNycDVwc2U1?=
 =?utf-8?B?TEhzTmJLc21CV2o3UnI5V0RzZVlpZkVpYm5RUklCTHlIRCtuYlNoNUxkWVZs?=
 =?utf-8?B?c2pYcFk3Vnd0L3N4STNvNkFKelZNYVVOeUhqZEU4L2dPOE9WTzg3eTA4SVJC?=
 =?utf-8?B?MCt0djhBMnNRbk9uWFd0QWZMd0d3eDU4bGxQUU9XcUdleHI1UjFmVVU4OGlq?=
 =?utf-8?B?YitCU2hYTi9nL1VBNlV1N0dlY0pQc3FZcDF2WjlxWmQzOWNiTnJILytUUms5?=
 =?utf-8?B?dHVkQ1B4blBWUWFMZGxxbVpqQzhVeU93ZEZvN05URFFZdmpTekFUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003faac1-9ac1-4524-dc9d-08dec19257f3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:05:42.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2eHIzX2X3CO0oRvtv3wd7AHywppflXiZzcWal5M8Ww3npSuu3Bz1AkdN0VoT1DK50VnURKc/90exaINUqIM3rYjd1cyfq2pg3chWXhsqf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5712
X-purgate-ID: tlsNG-d62444/1780506346-B4D49FF4-484D8E72/0/0
X-purgate-type: clean
X-purgate-size: 4242
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AB4D63A08A

On 02/06/2026 5:49 pm, Kevin Lampis wrote:
> This replaces the previous series
> [PATCH v2 0/4] Allows Secure Boot for Kexec
> https://lore.kernel.org/xen-devel/20250507094253.10395-1-freddy77@gmail.com/
>
> The main feedback last time was that almost all the purgatory code could
> be removed.
> - The digest check is now done in machine_kexec() instead of purgatory
> - GPRs are cleared in kexec_reloc.S which shouldn't affect non-EFI kexec
>
> Kevin Lampis (1):
>   x86: Implement crash kexec for EFI
>
> Ross Lagerwall (1):
>   Add lockdown mode
>
>  xen/arch/x86/bzimage.c                   |  40 +---
>  xen/arch/x86/include/asm/machine_kexec.h |   2 +-
>  xen/arch/x86/machine_kexec.c             |  10 +-
>  xen/arch/x86/setup.c                     |   1 +
>  xen/arch/x86/x86_64/kexec_reloc.S        |  16 ++
>  xen/common/Kconfig                       |   8 +
>  xen/common/Makefile                      |   1 +
>  xen/common/kernel.c                      |   4 +
>  xen/common/kexec.c                       |  41 +++-
>  xen/common/kimage.c                      | 264 +++++++++++++++++++----
>  xen/common/lockdown.c                    |  56 +++++
>  xen/include/public/kexec.h               |  23 +-
>  xen/include/xen/kimage.h                 |  23 +-
>  xen/include/xen/lockdown.h               |   9 +
>  xen/include/xen/x86-linux.h              |  62 ++++++
>  15 files changed, 460 insertions(+), 100 deletions(-)
>  create mode 100644 xen/common/lockdown.c
>  create mode 100644 xen/include/xen/lockdown.h
>  create mode 100644 xen/include/xen/x86-linux.h

Thankyou for doing this work.  This is a far more palatable diff-stat
than adding all of Purgatory.

But, the lockdown work is still blocked on some open questions and (in
practice) the security statement.  It only matters for the -EPERMs in
the top levels of the hypercall, and that comes from a bad split of
patches in the XenServer patchqueue.  You'll want to drop it from this
series.

The rest of the work (just patch 2) needs splitting into several.

First, moving the thing called setup_header wants to be it's own patch. 
It wants to move into the existing bzimage.h (itself fixing a bug with
the copyright header) and probably wants to be renamed to bzimage_header
because, despite that being it's Linux name, "setup" is far too generic.

You have identified that bzimage is x86 specific, and for that reason it
should not be included in common/kexec.c.  We are going to need an
architecture specific way of figuring out the alignment, but looking at
kimage_find_kernel_entry_maddr(), why can't we just use the EFI header?


Doing the digest checks should be its own patch.  Why is it tied to
KEXEC_TYPE_CRASH_EFI?  It's applicable to all kexec types.  This ought
to be first first in the series so it's not tied to EFI.

As to performing and failing the digest checks, it probably wants to be
a little earlier.  Functions like kexec_crash() want to return rather
than hanging, so hwdom_shutdown() can fall through into
reboot_or_halt().  kexec_exec() wants to return propagate an error back
into the hypercall to identify that the image appears to be corrupt.

Failing the digest check should print both the expected and obtained
values.  See check_xen_buildid() for a related example that you should
follow.


Swapping xen_kexec_segment_t to struct kimage_segment wants to be it's
own patch too.  It's mechanical but needs to not be mixed in with
logical changes.


For the %rsi/boot_params pointer, that wants to be a separate patch
too.  I wouldn't label it as EFI-only, nor as rsi.  Maybe just "arg"? 
It should be wired up on the 32bit path where it's %esi too, so really
you just need to move it out of %r9 before the 32bit split.

Zeroing the other registers is fine, but again wants to be a separate
patch.  It's unrelated to the rest of the content, and wants to happen
on both paths.  Also, when zeroing registers, always use the 32bit
register form even in 64bit code.  See PUSH_AND_CLEAR_GPRS; there are
some 64bit CPUs which care.

There are a bunch of style issues too, but lets focus on getting the
structure right first.

~Andrew

