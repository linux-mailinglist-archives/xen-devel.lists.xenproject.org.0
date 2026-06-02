Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZHbvJSbZHmpKWAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:22:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE562E716
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:22:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=DZ1H9oRc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325042.1590565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP4m-00023F-Nm; Tue, 02 Jun 2026 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325042.1590565; Tue, 02 Jun 2026 13:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP4m-00020y-Kn; Tue, 02 Jun 2026 13:22:36 +0000
Received: by outflank-mailman (input) for mailman id 1325042;
 Tue, 02 Jun 2026 13:22:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUP4l-00020e-El
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUP4k-003QNl-KS
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:22:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed918-e002-0a2a0a5209dd-0a2a4503ac66-16
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:22:34 +0200
Received: from [52.101.61.12]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed918-672d-0a2a45030019-34653d0c2428-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:22:34 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7242.namprd03.prod.outlook.com (2603:10b6:510:249::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:22:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:22:30 +0000
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
 b=mGWMe/vyAbKpus4yLQzfnF+PbvbeJO4ePcjL0VudeL5g33rd8mU6ihVzbBwlYhF000x5cR+wLz9e2m5l1QwUb1BjsAVnlmElrJ5jMLME3LdEA9dXL/+N8Yv7RXHp9CmbBFLmCjTqte41lG8lEr3o/4HfMApHwjlC4smRtEg83tAGX1O6uEN78RkdWRbMJmCRqwF5uBJvk68VHCSNMqw9+xYEO8bZl3gy0BkD+dL2GZlqGAvJM8H89alaZEb47GV44T04U6Wi6d3EihRnyq/WgH412FwrA2byxSyw+cFJbbjD7ShLUrvMsvCBb+MqRoRg+Kh8aC1pC1CvYSxrdNHS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rt9KCeWTVmf4TQdOhQz3FC/ZDpGKJlhevuPzBNGQNB4=;
 b=lYPuKnRiFtwcRC+s6oQweC7KGeTIRJZPDotrsprSrDpjJh5ZxIH1caUfVY91PVR1BReP9XWvjHCUy1wiSRyH50WQ5K11PykGSzHiSTKMW+ZwBVGddeJHCruGbhDHYLFap+w3y24cB+KisFfZ90gw74hpKzV+hKA/6P7lrZqLy8IjUDBmWEw44h7zE4PovhQwNm1+W3LrME6qrzfeasuyv1fWKRMWjZy1Is9TGsvWROcX1dsPOhyi9YXgL2sYxp4lid0qb3Kdh2IT0i3faoe9ZAg5Kk/O5ENYGE6kFUAapeDG2EkdDBUZ7yJoJjUB7fcLhQAUcQAyWEIKvvkJsB0ocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rt9KCeWTVmf4TQdOhQz3FC/ZDpGKJlhevuPzBNGQNB4=;
 b=DZ1H9oRctG3fUAN3eiFwBlS1NKQS27oyqvD4uPK1Yc/g9nDNJlgKwU8xcQ1QHCejL+lMxbg5FowCfukRujRS+9nDfk6upstxDDd/9e+AdWuv+r8D8AiVe7Ysuopy/CKm1FuZnyGAglMyu0mO7ctvtYhNtDVpgXMLe+HLJxeH6L8=
Message-ID: <702a949c-882f-4c05-b765-ef75c5e8a9cd@citrix.com>
Date: Tue, 2 Jun 2026 14:22:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
To: Jan Beulich <jbeulich@suse.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
References: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
 <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 55efed27-2136-4b78-d334-08dec0a9ff4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|5023799004|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fm47Imal+gNQQfFXTcpChaMDr08E+1X/ifrs8k0yi2DnYY7KxlZNf7PuLXbG622OsHQK65WmDFjwv7i8kibMFpmX0Asd1cQr1BsSXViYPul3JDmoI7Pi/pRST/MEi50K6qCsgcAurLCusPHyQ4TyQCGQJ4PiKCSEzw0TmbDBDJ1t9EWPLjSIqv3UJTdKQgA2jR181/DhpvgmW6Aie2YtMzGGVSAW0oAR+TZ8qzrUxAutexoMeIkd2vbH5flUpG2uectv48gx6PVSUVGwUYiqakEnBs/sjgQzdohznJ1T/SUOV1/S8vKjbmTPXjJ9YnsPXQbOlJze3dbjOV0ZRk05Y5+EyrG3IXsHt22/n8C5NIzXGeVRd/+TFEoSZ2xZPEMicmKazp4DkWpqspUMuE3w6U0j8646WUdCFEI39AbfrvQD3kSpbNBnppMLnI03nylSvV5cugLItqzTfMEU2Kn9zAYjq5ttqG7BlJ1ImaYFooLSIZO4gGHhF5rs1jTDWhVR6uECz0vHuzpmaqMU4upnXIyjezzOeEOQ2a5JBtTQ7f4QF/yWZBCi8Sr3bjkNg2JbmeQQaHkTKdNz9//FMoBNzNdS0EiRK5/H3hbNYEHPwImMGFj9j88dg6oD57wWZuvTVtNPobw1SVfRdWRo9kv+S19KOpK5n2eUkZbGukpXCcG9EwBL/8OH3w7xrzWaD597
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(5023799004)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDc4Nit1Smc1K2VEOVp4MnNGVHRpZTJ4Q0w0aEpuUktFcjNnZzlKcmRuM0tq?=
 =?utf-8?B?SW1UNmEvV1R1bmZQMzBHMnpHRk9lak0xVzF3enhVTWFYeW9IVkIzdGNWRjFU?=
 =?utf-8?B?ai9LS09rN3Z6VVlOVm93YXpqMXo5dFFKUm9lWDFzZnZxTnJFSUNSdW9Rc0FE?=
 =?utf-8?B?S0NLd2RJUTk1eHkyTWpyQ2ZqYVQ3aGhEVXp5UGovQkZtRW1Zb21XL0VBT2Fl?=
 =?utf-8?B?UGFGSmU3SExGbk43eHVpYzVCNVhwaENWSGtzNnl4R3BRRjdvL0xtRG01RkNn?=
 =?utf-8?B?NW9VTFFhVjJ2SjFjQ2JQQU5BWGZGZ2tLMFVrVmtzeU9tbGQ0TUdBSkhLVHFP?=
 =?utf-8?B?ZUZEQTQ4Wk9jemZTdldEMGxHWTdwUzZiM3F6aEliY2lDZnlUbzdvdm4zQVVz?=
 =?utf-8?B?a3Nyd0lBTDhWWEdvR1UzdUxWNFhJdHVrYnZNc2RNbWk3QlFmMmlUUC92RFJJ?=
 =?utf-8?B?ekpWRU0vT1Z5SFBDMlEvWk1iRWF4SG1EVWpjQVcrN0RxY2hFeVpXKzRsNzVM?=
 =?utf-8?B?UWRnYlFFQ2RPVXBXMUFiWlNaK1Y5b3U3OEhIS1VLaDJXbHVzM3dIcjRJTkdz?=
 =?utf-8?B?Z011L3ZYWHN5R3BOeWdUcnAyQ3F3c3JFTk5VMzFQZzZBSEhWOWlXaUxKeHpw?=
 =?utf-8?B?akUvRW4xeTV6emJGeXFTRGdiNWxGQ1ZXVnV3Vi9sa2lBSnlGVmVLM0xvMFE0?=
 =?utf-8?B?Z1VvRU1hUkxoalVOMVRtcVdZc2JUSHpqRWhnZHhDSUxpMjYwOVJjU0g3MWFQ?=
 =?utf-8?B?TitxMFFTVUhZbXEwZ2szTEJnM2NYL3Q2U2JtdEhTYWtmRGlOak5ncis1N2ZT?=
 =?utf-8?B?TmFybkI1T0xtUFdoYktaVVY2cGxTUUtJcU9Sc2JRa3pPSTBkSnBHcFU2MUF3?=
 =?utf-8?B?Y2J2Qk9JcWFZZ0dpeUdUVUFsOHhVYzhJOGI5TzJaZkVRazB2MUxDdUd1Zmpj?=
 =?utf-8?B?YXFVbmtMVUZwcjdOTlZLRTd0M0dTUTA0aHlsL0Y0S21pSGxTU3JVRW1reHRu?=
 =?utf-8?B?Z3RCQ2dUS3lLVGlmbi9oMG5KSUhWZUhYbFcwWGVKcTYva0Z5MDUzaUR2VWZE?=
 =?utf-8?B?NWc5RWFlaWVFYWhZNjVpRVZCRk1RWllpNjdHUVJicGl6N24vemlDeDBQbXR5?=
 =?utf-8?B?bXhlcXUyYWF6Zjg2dUJDbllCNkpYSm15Y2R4U3ZSMEEra1Y0ZEJSRU1UcDRa?=
 =?utf-8?B?dERWNWFyMC9CRG96Z0lRZVREV1N0N2JuK05wcFVpOFR1QkVzOU04S1pVRG9L?=
 =?utf-8?B?WG9CN09mL2pGc3hFdS9jdTJMMHFCUXBPSnVjL1A5UWI5cmluN0ViZDRIczlZ?=
 =?utf-8?B?U0lhOWEvemhDdnBKTjkxenJDZy9Bd0hKd2gyeXphdGFDZ1NBWk4vU29MN1Ny?=
 =?utf-8?B?UUw0V2ptRitSQm45WlgxbFdRNUJBZU92Qm1ISGFJRno3YTdmNXhSaVY3ek56?=
 =?utf-8?B?dVpoclp2TThwUkZ5NzJQQmxjeDliWEVMOFYyOWdnRzhCZHFnN0lHNkl4aUlL?=
 =?utf-8?B?S0F0cDZub2dvNmxjK3lBTlYzU05EOXhhNURJcXU4SzdhUVM0a055UmRkYU5k?=
 =?utf-8?B?ckRmQVdmMUdBWXZPNkFnYmcxNU5CTWZuNFZ5WWw1N2h3Z2lFYjhqWDRHanlV?=
 =?utf-8?B?RElzZEI3WUVqSm0wSlhobFpvZUdDcFE4SjA3S3RhU1Z4NEt1VHNMVVF3R2Zm?=
 =?utf-8?B?NTRoQ3JjZ0hUMG1BSWs3ZlpWeUVlaDJRQm9hZTdCOGU3NEFPd1pMb2YyVisw?=
 =?utf-8?B?WW8rTHA2ajdOK1BqRVRyMUtTWklDY3RrZkVTL3BoTUIrZTRqWWpUaDRNRCtT?=
 =?utf-8?B?TG5pN1hIVkx3U0VRVHovaEVXUUhET2RIRmx4dmxRQnFMeWNnejZEb0Q5aUhO?=
 =?utf-8?B?TDVMaG9ONHJMN2VqWjBMWmdNMW4yMUJ0SXNEOTFBaFBqaUJESWxmb2Z6N2Zt?=
 =?utf-8?B?ZHprdVRQb2VTY0FNckRod3B5V0t2NDJEalRPRmwrTmJ0UXhIOFByYlNueTdZ?=
 =?utf-8?B?OENEcEdxdHpWUURzVVBlYmtaajlPNy8zNEJEOEdBRGlpOGtwWFhQMVlYN3Ax?=
 =?utf-8?B?V1NjaGRBSDNEMmxmR2pYeU1nYm9PNTNHcjJQRHp5UERvRGdwSTZ0V1puUkVE?=
 =?utf-8?B?UVo1N2dHTEJPQ2FuVEordUhOV3Q2VVRlU3ZvOHFIUXFmNTdOY1RnZ0F2OXpQ?=
 =?utf-8?B?RzFkTURxQVIxcXN5Yi83cWxnd0YwN3hpWFBCV0t2SmVrbzg1ZzBxOUEzMmZv?=
 =?utf-8?B?ZWI4bkt0Mzk5VUJXb0xBSlRkR3NobHFtbklIK0dsTkRxOC9UU0s5ZE9hRXNK?=
 =?utf-8?B?UURtSVU5TWljWHAvc2RlVi9jYVpWMlo2MFp5UFNXazNjVW8yc0pRVWVrTjJO?=
 =?utf-8?Q?AyjSZBUKUJi584Hc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55efed27-2136-4b78-d334-08dec0a9ff4e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:22:29.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpfnv0NahGvtEAbRyw+0P2NVSRcSkHa8FiKPlF5BqWc9eBWpaVsUTbdi3WgZweS+x3bO5PobWZF4NWjRKZMFuXRwRg5fbE1Hs8MkhfzhOM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7242
X-purgate-ID: tlsNG-33051d/1780406554-4006F938-598B329C/0/0
X-purgate-type: clean
X-purgate-size: 1356
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:bernhard.kaindl@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: E7EE562E716

On 02/06/2026 12:51 pm, Jan Beulich wrote:
> On 02.06.2026 10:49, Bernhard Kaindl wrote:
>> Using the 'u' debug key invokes dump_numa(), which walks each domain's
>> page list under page_alloc_lock to compute per-NUMA-node counts. On
>> domains with many pages, this O(pages) operation can hold the lock long
>> enough to trigger a watchdog timeout.
> In addition to what Roger said: Is it really the lock holding that's a
> problem here? That is, there would be no problem if there was no lock
> involved in this O(pages) operation?
>
>> Replace the page-list walk with node_tot_pages[], a per-node counter
>> maintained in struct domain. This reduces dump_numa()'s per-domain work
>> from O(pages) to O(nodes).
> Alternative approch for consideration: Purge dump_numa()? This big a
> change for making a keyhandler work better is somewhat questionable an
> approach, imo. The keyhandler isn't there for use in production anyway,
> it's (primarily) a debugging aid. If the data is still needed (and may
> e.g. be useful on production systems), make a (preemptible) domctl or
> sysctl or alike instead?

Introducing d->node_tot_pages[] is a prerequisite for per-node claims. 
Tidying up dump_numa() is just a useful side effect.

From an upstream perspective, it does not want separating from the
per-node claims work.

~Andrew

