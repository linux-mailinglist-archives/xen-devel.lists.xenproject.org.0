Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3b/HLV/WHmqvVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:10:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A562E511
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:10:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=RM4fa1a0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325014.1590530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOtJ-00071m-1G; Tue, 02 Jun 2026 13:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325014.1590530; Tue, 02 Jun 2026 13:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOtI-0006yy-Ul; Tue, 02 Jun 2026 13:10:44 +0000
Received: by outflank-mailman (input) for mailman id 1325014;
 Tue, 02 Jun 2026 13:10:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUOtG-0006ys-QO
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:10:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOtG-00EZqW-74
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:10:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed649-5cb7-0a2a0a5109dd-0a2a4501dc14-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:10:42 +0200
Received: from [40.93.195.26]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed650-c1f2-0a2a45010019-285dc31aa256-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:10:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6112.namprd03.prod.outlook.com (2603:10b6:5:397::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:10:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:10:37 +0000
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
 b=YholPyuE85wA2re6H88SIZQy0zvFa8g5WSqGC66CRawjULmYWvlO1HS90gGF6qbQ/7nlIJOinBSN7SLXOAmMnhGe3o/viy9BABuYcKk1+v8/EJSxP8O3i+DXxIMpxYjhDLRVPnS6xfV8GYPYH0COkDyPAOyyNeGJzC/1PbYTsBePNYdUNucMeKe5zwH1z4pLFXSA3tzuFTifG6rgVA8KUvRTnFlm1MgeuEWwlj7dgXiKEeYTH4M6EWtxjKeJEGQFmpdos8YJ8HKzWXTew0omWnKXQopa8zhttXdko9OYAfU2XKsmnn5krVSBFfF6IiE9xI5jcUtp/M8j8/udEgUTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCgZebg7Hc0VEeCYnu+i3ZmG1oJD+4iGOypahVkHi2c=;
 b=VDEDaVOxdNASpQcVYHDwwaCK516ISg+YQj4Hh/1AhFZGfs5WPjTQelhAmzFO5z/B6sN2c9YEB6tLfhQsW1y6iv/nIeT17Ltya1bayX8CeG3FCnPnUKJzRFTOgTOmaTA9gjGUAO1P0ylQyhmlL3gzfKDhEychgXPltYtLNeiVHQuApw9y0qhyqRSBOb4vuuXgKpD96jJnDkZIxIONUucHBsGEaFwq6B+dlsVavLIU7O1MZBDlxcMzotbXmmblDiW4eTfxyyvpAuadAyrTCIhctswdn3kJCuCe92o1Rrms0RwNJyvpAVBccOVTcWxpUBy+98jEh7ZjgiVwZR+TJyEMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCgZebg7Hc0VEeCYnu+i3ZmG1oJD+4iGOypahVkHi2c=;
 b=RM4fa1a07WL3AOwBd64S4yQWGxQ4Z0jyZ2DVqyoU7ffjY7HKJW++xjTqCF2ihwVhuccs7KPVWiMaXQHcw1KLFmAnSispdejYSsDxj5GPg1BUbLe/627gvmtvmlX04Yf0no83zREDNOoy61zG+ctLhgb1CVGAJQ8WmmsRqzT1T3Q=
Message-ID: <e20f4ceb-cacb-4dc2-8811-868204ebb818@citrix.com>
Date: Tue, 2 Jun 2026 14:10:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] xen/efi: Use blexit() instead of BUG_ON() in
 read_file()
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
References: <20260602122441.2961974-1-accek@invisiblethingslab.com>
 <979ceb84-f254-4cbf-a33c-8d4557a12b11@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <979ceb84-f254-4cbf-a33c-8d4557a12b11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 112c148e-7ada-4dc4-641e-08dec0a856e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|17002099007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	phgBfz4ZOScQNPw2/lsg8Sq53U523pj1f7CMvf+i8Kp6SZvF9m+E3G96ue6vrDjLrTni4BNl8WttNLyA0/GvGx1TjSwO8mWsmPBabKzFXs4CXZZ2yTCRpjCBZBq4Pe1/Cti7S7DpiGwE/UhGiR9NlQiyvujjImbnWsY5vDxAJ53xvgADgVIDobLgE5k/4nJxfxRtMJmFX0rVRX1+bPE+iiqxxLLu3lGFj46Fza9u/FLJ21PNzUNDNibzxN4i4fL9X6wUMPKCIN5VMUYhnkM6q5Tzw/yMa1muoIGdfoO1PuKzGLn4+lrrdPQVCEYzcDY9UyREY5AZs0mgzo9sxBFojb7isQiqXISkEt3009h2tO7uFiyNGmXuNMwbeSE8vHjoGYaqrPb75IM3N8RlhqgNSsWWQaZrlUEXaYJynbpxCQeN3zCmZLwKlp2xhd2/HXGnvITBEN/MsgnWMkEhVsAPSKXKzL99nsGSQZQChGhZg6R0J1t6R1vgLOS/PBlaywX3dUvUbQxETm9yMHkGo5pijCXnjQSICWt+hTXP5EsdTpfJIZFObMFbC4LgbmkW2GK/nZGlmLmqr0wBiXhtbl0wadR/SdNs5IdWkj4ul/bHcrGCtkbqYl51DxEnIqCHjkZW+gHkgBKMrvYuzWo9Vi4JaBLCVzXoQWJ2CILVUdexjmBM5SJBH/LUK4LnMhbbwLLOikyHk4q/LQZPICj0AnFnCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(17002099007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1xb0szNU16YXp5Vnd5MXFuL0FyTkpPOHpNZDFBOURtd0YvdDlDQlZma3BS?=
 =?utf-8?B?bHJpRHhyeWdsYW42T3FzZ1piMHRoQTJQVUJCTWtyVTNhRDhiRCtJZGFqekIx?=
 =?utf-8?B?dU51aWEvUWJxN2JjR0pLZCt6MFNuSEF2K0xXaDNpQS9hOCs4RGpWTzdpRDRN?=
 =?utf-8?B?TzNkNkQxa1Q3UmdxL3dUVzhWS0VyUzFXSElBWHFpN1ZvdU44VlRGVmlBMGRo?=
 =?utf-8?B?RHBSZWNCci9vZXdrTWZTUmNMUkFKTzg3ZDNlQmJlWjUrRVVQVGxoME9vK2tJ?=
 =?utf-8?B?TmpwaEZ3WXFzYUNJdVQ2OUFYZmFiem9Ic2lNOGE1NFJQZC9kRzdRTVJGVEl5?=
 =?utf-8?B?bDdFK25GOUxEU2I1ZEk5bmJUZENmczBob0hsdFoyZWdxbVBTNm15dXdZR0VB?=
 =?utf-8?B?aGFrS2RxajVMMVlIbVluTzFUVjBDcndZSS9MUWgwN3lCYkNKR1JKWWYraEls?=
 =?utf-8?B?d2pzdVVxWm9wYmxERkFmUWNGalFkZmdQWVBMcTYycmoyK2NjOHlJUndlK29X?=
 =?utf-8?B?cDE0WU40ZnlXcUFUK0JVYUp4dDVCWFRlc2ZpelJCUDFMeWZlTTV6VW9EQ0ZT?=
 =?utf-8?B?dmJSNVdFVEJPZXhVaEVmZ1MwYXZLUXVES1RPR3A4RG9Kb3d0eGJQUDBJNlFS?=
 =?utf-8?B?aWk2TklJcmN2bTNnT0F2OEp6cnJMK2krcFQyeUFoemQ2TXQrU3FISDBVQlVk?=
 =?utf-8?B?ZExMcVVpb05mYmM5VGVSTUR4WEFIUVJJdVFYaWZ3azA2OVM4dWU3K0tjaTNO?=
 =?utf-8?B?U3ZxYy9XbzBEdjZTdzhhZ3FFeUdxNTBiYS9iajZva3JQVFBzc1VNdDc1Vkxn?=
 =?utf-8?B?NFpHbmh2OW80L1UzSnEvVUVDdE1jRHlMYmhqRm1zdnMrd2RwWWhpamRQTDNs?=
 =?utf-8?B?WmlwMjAxUDdVbG9HSWR2bTA1VlFYUURiOWsrank4djRUQzNMYU5rWHUwa0N6?=
 =?utf-8?B?eXdUNFExN0orM09VaHJSRU5WeGt2UzJGMEEzcldzRGQ4YnFCeHc4djloWStD?=
 =?utf-8?B?TlYvMmYySmFOWFpWdTJIcUtxVm0rUlZaZ3U1OXNublNOM3I5cTg4NGdEeUZW?=
 =?utf-8?B?MTlOOFlJb0FJano4WGdIbTYwV3ZDVm1IMGR0R1hXYlg4NkNrd0FEak03Zktl?=
 =?utf-8?B?V3ZBY3pMai92UHJGMzlXQnRVNXY4TzlzQzBhWDA0cFdaSGhqL1djaWptZTkz?=
 =?utf-8?B?MGNmRVN0RktGT2pmNXpwVXFrVVJJcmZJSUVPY1pFWnVKZ08xbk54RVR5RkN3?=
 =?utf-8?B?dHhaQ29sMWJTbW80anhjV2J1MDRXdFkxT2dZWUJlWTQ4QWprOUpMZ2VpUXkv?=
 =?utf-8?B?dmFWZzQ4bXZQVHNVRmd1NzZydU95eFE2ZUdKQWJoNDQwS0JHbklZNTZDeWNU?=
 =?utf-8?B?Sjk1ZndnbXkvbGtpSlBBVVh3djZoK0Z0OTQyTVAvNGdPQS8yY0M0NU81RXly?=
 =?utf-8?B?WHJZMlduYllYOUkvcW5YK0ZjNUNUZDFCOVVldERnc083eGJSVldKYndtKzMv?=
 =?utf-8?B?c09jaUJQUGhKR2dEV1dDS1Vhb3VjM1p5UXIzeTlrYjc2Y2xRa1JRQmUwQVZG?=
 =?utf-8?B?Qm05ZEVmYTFOYXhWcFpvVTNRdlJPZlpUdXZuTm1BZUNQSjFYemttcjlCZGsr?=
 =?utf-8?B?Nll0eXhFbWVaejdOMEs2RkxYMXI1a3F2VDVBcW1nTEc0M1dRZ2RZc2R1dTRi?=
 =?utf-8?B?YUJhM0NXMzJoWjZyYyt2N2Uzd2krVzVYYWtaejhQMlorbys2NmpqU3FLalFE?=
 =?utf-8?B?Q2Q3dmRHNzJxT0diblo2Rk44NEtYK21YeEthTmlNbmc0cVJSTGZCdFJjaU1Q?=
 =?utf-8?B?VFMzRGpqOVJibWNBdG1XWGV2SE04dFNTWTN5YkNhcXdabEFLTWVhQWdqSFV4?=
 =?utf-8?B?R3FRNncvbkdnclg4czdMbHdybGFsTERpWXAvbVVMdVpjTzJ1c01VYmorWWMv?=
 =?utf-8?B?L1NhYW9QMkY3SUhKQ2M0NTZQZ09TbGpQL1Q4anFrU3lLd1o4Y1hob3NnZ3BN?=
 =?utf-8?B?NnJ1cDVSR0RCY3RnRC96OElsNXg1bThKMDVjQzNIZ1l4T0xOMGdXTzFYZTFG?=
 =?utf-8?B?NFRHajMwd2lla29oS0tmOWs4SDN5ZExMY09kcHJWVTQyL0NuU01VWm94SkJl?=
 =?utf-8?B?bndGR3pnQTh6SGEvUlluMTVlcFFYd0FRQW1ZNmZTVzhRUldkYmpMWEFxeVBK?=
 =?utf-8?B?emFZZlpXQmsrcFhrcjRYblhab3k2NVA2SEtSTWdlNnBFU1p6NTdNK1drQlYz?=
 =?utf-8?B?ekhYeGJMd2J1U1p6d3BSU2F0UTlwOFErUFRuVnUvcXlMWmtQd3dWMWVCWW9h?=
 =?utf-8?B?aDlCNHIrOHhob29kdWJSNktSL3VkanlLYVVqVUlzb1RTc0VoaFhvU2EvWitm?=
 =?utf-8?Q?CyPAlAK5Ks4R+bYE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c148e-7ada-4dc4-641e-08dec0a856e1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:10:37.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsYRI1s+BgFEwQO8EKdghjzJmaU3GUf12NZ/qnCWZpLEbhX0ODvqywPqK9rCdt+pjY6BvqP2LG95PrimXhub/VTItQ3gQm6Y+z59mMfA57M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6112
X-purgate-ID: tlsNG-d62444/1780405842-AEF58FF4-DD605FEA/0/0
X-purgate-type: clean
X-purgate-size: 965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,invisiblethingslab.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:accek@invisiblethingslab.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B9A562E511

On 02/06/2026 1:34 pm, Jan Beulich wrote:
> On 02.06.2026 14:24, Szymon Acedański wrote:
>> Follow-up to 880e40b187aa ("xen/efi: Fix boot from a device without
>> a file system"), which added a BUG_ON() guard in read_file().
>>
>> But as Jan pointed out, before ExitBootServices BUG_ON()
>> is not functional. It results in a hang with no message.
>>
>> On the other hand blexit() prints a message and returns back
>> to the bootloader.
>>
>> Link: https://lore.kernel.org/xen-devel/bb0f007e-697e-4501-97ea-3b59cf494ec6@suse.com/T/#m4725c8cbc0946a5533aea03fc240267ef139648d
> While Linux uses Link:, as per sending-patches.pandoc we don't. It wants
> to be Reported-by: instead, and there wants to be a Fixes: tag.
>
>> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
> With the above properly sorted:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

CC Oleksi.  We're past RC1 now, so everything needs release acks.

~Andrew

