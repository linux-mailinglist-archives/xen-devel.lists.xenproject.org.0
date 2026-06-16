Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cMipKTH2MGpQZgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:07:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3268CB61
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jNmEDgXt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338703.1599742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNtA-0006XI-IV; Tue, 16 Jun 2026 07:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338703.1599742; Tue, 16 Jun 2026 07:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNtA-0006Uv-Eo; Tue, 16 Jun 2026 07:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1338703;
 Tue, 16 Jun 2026 07:07:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZNt8-0006Up-Dg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:07:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNt7-002VvA-Qj
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:07:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a30f612-e002-0a2a0a5209dd-0a2a4505ea1a-32
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:07:09 +0200
Received: from [40.93.194.24]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a30f61c-aaa8-0a2a45050019-285dc2181693-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:07:09 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB6972.namprd03.prod.outlook.com (2603:10b6:510:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 07:07:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 07:07:06 +0000
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
 b=lkzliKXKg8R9+eECyyCQ2VMg/28bLqRSxLGZt+U16rr+AHI2gmvwNHbG//PfxGpz5zdbGbVGVGQTUAzAkSJ0q7G2GVfT8Kr6fVm4FX7vYcojFXOLCnqV+0AoC60Cem8UgWmi2ItB0YnrkTCA9TjM2HMkuf0tQkcwKhtexRmIMCMc6v/WHEp8lwO16iBK51VGMifMSYQFSRc+d5v5QF3JuvJTGICGEqC0o3GOLYHjacGgqbWHu7+HasDqFsHb29Y5ITKiggUhPVwaSPRMDXT0wacb/E9lX1iEoBVM13dxcGhENOhxyqs4llJ9F/Ji+gLIohQRULimQ2ptksgIS8+zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRYILiT18lSFa7t9cXA8I8OaQEncr1fMGMhOLRcf2xI=;
 b=Gc0NjjFQRm3S4WtXiMC8RzEy/4xY81OmGmmExKiZ4tRj6WxX3EShg73fv6CPPen8gn4ouhhy8wcpGlTM+DqqMef70Cx88mq4806FfD9JM1lXI5Dyftg4zMgjLgjXSfUpa5uY5k2hnFKr0FMA2LHTN9lK9y+8xdbUL+35LRdN+kcH7Y7rTlFIRqqoAiaw9bnYaUvoPmqvGXWQQPvReOKH/roGzH+K0C/VOhu2fmWlZo0uwanWjHhCcYxS34gb42MWr/69iSk/XdRqUuWJhHWIov1pzM3DH2SbDUIhhIwaDBrX21P46R+k7PN3cphT/83OeQvUIhsLutZloTTAmF/jUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRYILiT18lSFa7t9cXA8I8OaQEncr1fMGMhOLRcf2xI=;
 b=jNmEDgXtWEqZfdyuNTF41Oe41McauUPViVIv5GNDqMeLB0o0CddtLU0tnRID3zqQxp6twOO8hF5AbMJU9yTyYkGg5QFd5msDMgOADoO7cgQYSldMmA1yRPwD/ZgycIsZkjOD+D6RpyQ0LuriiKTOBWMzDzJSvwgSkrOuMhmX/sc=
Date: Tue, 16 Jun 2026 09:07:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
Message-ID: <ajD2Fxt9hCypuDrb@macbook.local>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
 <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
 <ai-_jUw0QmdC7gPK@macbook.local>
 <1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@vates.tech>
 <aea699f2-c869-4301-b67c-ddea1e08ae9a@citrix.com>
 <0037ce13-8db1-4855-8ef0-dbeefba54fab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0037ce13-8db1-4855-8ef0-dbeefba54fab@suse.com>
X-ClientProxiedBy: BN9PR03CA0934.namprd03.prod.outlook.com
 (2603:10b6:408:108::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 464a2ac7-5af8-4f26-ad87-08decb75dfdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3023799007|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eq+fuH74loWXGwjU2QFM1qnc1TccHydplqpMLgw/I5SVD/bJeOjzpXLnNFjTT0bUh4/34Wyfjtv8YCz9wN6Y4tHLnL8cuF8ceb89LIULMrQS+dPN0XKwlSLjRh/uoNwK+YKs2yu/TtyIfUPRf+hyrJKk9h+MXNETsrMunrss0LTqq1xIb144qeOljrZ0PLrvntng9bT2ga4SPHHUk5l5MyU8sPH4YEt8wppcgSei3YqV2uNxPEf1I+MyU11OW6AbIl6ta3KaKV3mkEFS2Aq8ev4+pAY0tw3d/rF+NDimBoR0+Eqj3plJaexQofIAYt8Aitkok36cRY8cTSHQalin4sxFuXSq/LOTEiU5v3WUpuYgoPsJEipImnpiiWWflRsw8A2waz1QKoHXG/6ntb7xTq15GZgOyoYMiG+4xKMS1lp1UPjRVrrerox/Z007+aQ2pdghTfgUVeUkp3FYdopZjxTzt/0HSwyf/Y5F8GQzTXZm7FJjFwkwttazvZZ2yO3TUK8APiARDwC1UEDdcC5OZ2aJC/TaBL42aOLHCf0YDcdPkjz4kr14JoWgTqrFUaiCbxeYn24EfUsFDLI2BB976/QsnJvtJZhIt0QrYiPWZWM2ezCks09idvHS1O5lATFrhsos+AL7ZMyjOZ/zb0dHuNXQ4zhnVwo96Fw4gnueEGWbwbgcAWzf6oxk4Ud3LeQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UllHS1lMSG9hMFlEN0ZGZWZCTGdQdDBHeDJpNnQxWDYySHRHdUxTMTJjZ1Yr?=
 =?utf-8?B?NUg3anNiWnFVVkY2bmNkeDlxNzRnbHBCZHhZcFM0aEtXR2hlZXVrQ0RxNFB1?=
 =?utf-8?B?SmhsdWFQWnVlTU51VGlBbkZBL0E5RGJPVTdEcUZxUmo2ZlFrdWFIdnRwclI4?=
 =?utf-8?B?Vi9lck5iRmRIVDFOU1U0UVhuRVpsRUNndlBXeDQvVlV5aUVveUMvVHVFZ3Y3?=
 =?utf-8?B?R1YwcVA2RndBU1IwRnNPSllUTTUyMUdsYVhSa1dPZi9KRkRPTUhaQnB3d2hD?=
 =?utf-8?B?anIvcXlaSjByelA0c04rOEdoRmpCeVZVN1NiVm81cW43VzNLSkhCd1VENUh5?=
 =?utf-8?B?bnpaa3dvRHk4TEcvNncwdFdGdFd6c0FURG1teTF1SDRkeFpWNWwxZDM2M1dv?=
 =?utf-8?B?emVSRW1SRVllTXlLc2psU0pZSkFGWkF6VEJQSnYzMXVvTCtYdk1LZlZMU2Ew?=
 =?utf-8?B?Z05KYmQwUndpZE5BaXlrV0hoeFJ4c3JDQ09YM0NQbHNsL3VSOTB0ZlVHTUNx?=
 =?utf-8?B?d1ZXU1VKRS9DdVJhZSt2dktWaGZPQzR5MXQyRHYxQ2tyNjdFMXVBblltTzNP?=
 =?utf-8?B?NUQ3SGtURklzKzR5b09UVjgwVVh1L1JDY09Ya0M3V3FMZWV4Z2tYVXRpVTF2?=
 =?utf-8?B?bWl1cXFqck9UQ3luUHg0VlMvaHpiTjhqRjFwazVEN0NRRndlVG5jSnV3ZDFG?=
 =?utf-8?B?dFJqcFBPTTlDUnhFM0E2MFh0L3RDbTBQcEI2eFVJVUlTYStVQWFMbmo3bEhP?=
 =?utf-8?B?eitya0VodHdsZlBwbDNHUm1DRHpuZE1xL2NJRlVIbko2OUlkc0wwMkI5QnpH?=
 =?utf-8?B?YXU1YVRyTDJnSXJzT05XeGpXczBvZ1F1d1J6Nit3SDcwV3VSUUdacWhFSjJk?=
 =?utf-8?B?OWg4Y0pQNTlvSFF3ZnZoWVRhS3VES0luMlNMeXROR0p6YUwvUnNIb2pHMXlj?=
 =?utf-8?B?N3BEc1NCMFU5STVjN3JKeDhrQldpSlBqVjFqOXNTL1hMVEY3SW5GT2NxcXR4?=
 =?utf-8?B?a2pjNk5QSVFPZHVoSkRCNG1LU2JRdXJxU2RCamY5MnlsUlkrNGJPMnlFNlNi?=
 =?utf-8?B?c1djWjYyRDNGMkZqSjR1VG5ac2xiekpIUFU5Q09tb0JoVjJjZldhTHIwTmZD?=
 =?utf-8?B?NEl6TUxjVTN1VFhEdkxvdmcyZXVsOHFsNzdXcjFoYWs0Wk84TmtSaDQxd0to?=
 =?utf-8?B?bXE5VWxqbkF5SnEvTkIwd1ZFamk2Um5RNkhJS1ZjZ2tqQlRNM25MZkNZVlBN?=
 =?utf-8?B?K3F0bFhEeE9sZ1RNQWxDWVUzS1ZlTlh6b3FTTC9iT2RVL0RoUHFkWGZuQUhu?=
 =?utf-8?B?ZEFNazd0SUZyRE1pRXczUVJYZUMxRjY4NytuN1duL3h2MW5ib2tjYkVBTk1P?=
 =?utf-8?B?d2hWY3hDQ0NvMGVlSzB1RHlwTHBWY29obWUydzJ1VTg4T2s4NnRjeEpzUEZE?=
 =?utf-8?B?RkphZDFNU0NmbkhwdzdTbHVUWnk3Sng1V1JqVk9FNXJYNTgrQUlIQ0xPVVg2?=
 =?utf-8?B?ZElRS2k5M0FnZS84NWlua2xrTFZHenVMamhJNEk4MnFUcmtMaCt3MFRpbjUy?=
 =?utf-8?B?R1pqVTRhNlpoRmhuakxFdUc4MzFpUzRKTjcyeFlXa0k3Ti85NE9NSW9takFz?=
 =?utf-8?B?ME5mTnB4clBIc0tlNFJJV0pYQ283SzlBSm5RMkYzb3phMFZ5TEhFZUhGUlVF?=
 =?utf-8?B?elVYTWxjcHNPUzcxSDVjQW1XOTFqalN2SWRIOWtJc0s5aEVzZFYyZTZpaEFm?=
 =?utf-8?B?TTFTSWR1OE96TlV0VmxlM0I1dG5RNjZaQ3NGNmY0TTdGc21RTXRWYW1ROEJq?=
 =?utf-8?B?UW5jeEtLemJGUlcxWGNlT3hOZlgrL3FQVDVCT09uM3E4K1FlS29SOWh3eXNk?=
 =?utf-8?B?NWQzT21KYkRCMCt2dzg3dUxjRnk5aEprdFV2YTJRd2x0OGdsY3dESEFOeVhW?=
 =?utf-8?B?MnV3ZHdmS2t1VWtmL0k1L3ExM1JtOExZS2NmTTVUSktnL2k2Y090UTlhQUdD?=
 =?utf-8?B?L3F1b3hTQ2tvUGx4cCs2NlZ1ZTdsVndPRzNwU3Q5bW5jR2k4OUxheFd3eDVS?=
 =?utf-8?B?STZaZGRhRVg2M0NTMW5Jb3luRm9aVHpKeXdDM2w5ci9TMzRSbzFYUUxGeWFm?=
 =?utf-8?B?YmhhbWZuRFF4VEtDTENVT0VLWC9sSDdZbHNBVG9waDcxN0NPaWQwVDlQd2hI?=
 =?utf-8?B?eWhwNGVISzlvU2plektCOFFoV1hhYkd3djR6MkVmU2lha0tkdm5OVnM2eXk3?=
 =?utf-8?B?MkxlR3VEeUpieDN4Qm1yY2dkU0hBMVcrVFlyV25DbEcrVnF0THRCRXRoUzFl?=
 =?utf-8?B?UThsVXJGN1ltcTBqL0h1ZHpKTTNrYkJ6ZTl6dXA0ZDhZcWErcENWZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464a2ac7-5af8-4f26-ad87-08decb75dfdb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 07:07:06.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6pacXs0SriYmCsUL1CU2XVUf0+OH7u77sN7nYb7UO9ku9zEo8XabJM8267x/339uhYoo5BdmersGQPuClkVaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6972
X-purgate-ID: tlsNG-c201ff/1781593629-E2F94443-AC7DB3FB/0/0
X-purgate-type: clean
X-purgate-size: 1772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3B3268CB61

On Tue, Jun 16, 2026 at 08:16:41AM +0200, Jan Beulich wrote:
> On 15.06.2026 19:02, Andrew Cooper wrote:
> > On 15/06/2026 3:39 pm, Anthony PERARD wrote:
> >> [06Ah 0106 001h]         RTC Day Alarm Index : 0D
> >> [06Bh 0107 001h]       RTC Month Alarm Index : 00
> >> [06Ch 0108 001h]           RTC Century Index : 32
> >> [06Dh 0109 002h]  Boot Flags (decoded below) : 0033
> >>                Legacy Devices Supported (V2) : 1
> >>             8042 Present on ports 60/64 (V2) : 1
> >>                         VGA Not Present (V4) : 0
> >>                       MSI Not Supported (V4) : 0
> >>                 PCIe ASPM Not Supported (V4) : 1
> >>                    CMOS RTC Not Present (V5) : 1
> >> [06Fh 0111 001h]                    Reserved : 00
> >> [070h 0112 004h]       Flags (decoded below) : 000004A5
> >>       WBINVD instruction is operational (V1) : 1
> >>               WBINVD flushes all caches (V1) : 0
> >>                     All CPUs support C1 (V1) : 1
> >>                   C2 works on MP system (V1) : 0
> >>             Control Method Power Button (V1) : 0
> >>             Control Method Sleep Button (V1) : 1
> >>         RTC wake not in fixed reg space (V1) : 0
> >>             RTC can wake system from S4 (V1) : 1
> > 
> > There's 3 pieces of information on here which confirm an RTC is
> > present.  Setting RTC_NOT_PRESENT is clearly a bug.
> > 
> > We should probably have a quirk to ignore RTC_NOT_PRESENT on this system.
> 
> Imo we should go that far only if EfiGetTime() didn't work there. Afaics
> Linux also has no such quirk.

Linux also checks for the presence of a device in ACPI tables with the
ID "ACPI000E", and attaches the RTC driver to it.  We can't do this
on Xen.

Thanks, Roger.

