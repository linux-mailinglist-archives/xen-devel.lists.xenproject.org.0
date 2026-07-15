Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id otJbLK+XV2pnXgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 16:22:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E653475F4FE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 16:22:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=QNOtvxcR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1363186.1614976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk0VF-0006Lw-M2; Wed, 15 Jul 2026 14:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363186.1614976; Wed, 15 Jul 2026 14:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk0VF-0006Jb-JS; Wed, 15 Jul 2026 14:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1363186;
 Wed, 15 Jul 2026 14:22:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wk0VD-0006JV-T8
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:22:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk0VB-00DkJB-HR
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 16:22:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a57979a-bab6-0a2a0a5309dd-0a2a4507d198-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:22:21 +0200
Received: from [52.101.52.65]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a57979c-b4ea-0a2a45070019-34653441d3d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:22:21 +0200
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by SJ0PR03MB989459.namprd03.prod.outlook.com (2603:10b6:a03:40f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 14:22:16 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 14:22:16 +0000
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
 b=CZOue4cK6FrgYfiwPd/EjkrTikoKqcWlNTb49EY9got8oNvGiKjw4cDrU6YPxUR894B8HgK7jIkzntFvu3y95s/RWtN6w/2K2NeyZIxiudu2OILLf84WtvJ5n/YHfjnYUZKYsSxWqu1mKGxnDoIAFsfFugYeYVbuj+xPMXoO8xeT+1H7lZyViecYr6GV5QrThvGN1QUSJh/Uvz1+/K56PDNSL399Tpsk//sfeO62PyBPwQ7QIKSb0M0HTcZA5n0qfXmlcKVeVf2DjPDaGIzqQ1clkV8NywAA8DhAYulof9n954o1Fklt4l/kbH2Ylsxyc0UbGFMHpE8wkZrLBdcgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXLTjLTL8gx7UGs1Tb4lAdCPQ45UammjAmnsDrxiZl4=;
 b=BJKD4xG1GvPH5tCp/5b8avDXq0aBKlrhGPmIXlCuCbHcn1aBkY5RPQaQngrS+dSEdH+s6Zrvi/0iRyiGr2Yt3/w7VvR4zCfYsFd7Dtr6iPyQO2+x4pE4NKz8OuWGMjnt7UiQ7kCg1dOi6mj9Nu3xnl3wxHmeVcvg9cXlWDJkAxjWV4IYu4ffJid7KYmtBSjWrfD6WVM9FWUIK314oAYh6Fu2/81yWRGr3B88dHJTwEY9HIrFCcvcArADCYrKY90gNTpCjTBYzaIz9mWfuOYVfmWxhqOElMCVGeiHZw6lYDasblfRzjUuCo/ZDdD0KqK+zMRPoldYZKzZj5p4j44nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXLTjLTL8gx7UGs1Tb4lAdCPQ45UammjAmnsDrxiZl4=;
 b=QNOtvxcR9bt0e5YouvX6rn4oTVwmeXiqG+OzJugOMcoT5BtEbKIcWSsVG+4Z0HtHuZ2FbfAZsG2xU6kWoelgAVGErzHz1P901T5wCjKM9CLxvQd8Ng+puPQiXqbplP2yeDW+M9tKCONhvau1pClj2p/yJ4fJnEEShFjRmxejvWU=
Message-ID: <07a5bb20-3079-448a-b2a2-af9bba0a2a30@citrix.com>
Date: Wed, 15 Jul 2026 15:22:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/entry: Fix VERW offsets in restore_all_xen()
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB8265:EE_|SJ0PR03MB989459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b871bf8-0871-4bab-9cac-08dee27c7896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U4l++Wn5si0eFLAN2bnIpLPTrOLpxh+5KuJoZGlucDiD6yK2rRbxDFNW0Mo9XZmaPcBJNli6Lj63UAKlj56ZkeXKCJDPkoxhWgAXDOavUpWQbV5u+hsMfBPAX1N5fNGCWTbOp9fQdQn+U1hSxXw7WIWJ0Aec9RmGUiBBqFcEoSK1NB2wuETi6TmYt4MPZQ0DKVsXnIGjHjsKs6IsVihY637XhRNc6UWo8ffppIE+UdEkznOvbv7coJYWPtPBZIeWn70ogUA+XcIFvYSbP3WM1teIK9LaKpNUdRk8qfmaeh5L6RywYoQM+SGnhe0uZV3osL9b3t5LYKavZuG54F+A0C7JUNjQFESXusIyYp+QvRfcZ4HNqGGDe58zc9lMgHsGIByjObaZGPs6grqemc5VzZVprCgvGz+WZ6A+YVAJhY9oeB3lT+ec9aSXLR2HIeMGO+clCED/DrLrtjNiripsNDmUzZ+F6GRN2/C/CtkP0xMFEs6qXiRVQJhCs3wIqtIUcXjnmaCVZndUPVS9BgcdXOTg7fwrshlBKCuYwIUXkwZD56pr6k+KQxVgTtaM+EwEcoREg2xbjudY+7X5952NkKJ8q4cux1VasWf2Nm0QwzYyGvOzsVho6LJqdIN9WK1aEtZlZi6ny3Twd9ke/2l60AmnHKFgWfT5aQkfGYQUCr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajFlczVLN1FjV1R2UGtKa3d4c2xIU1dkOC9hdUdzYUNFVEo1YmdPeU9VR2c0?=
 =?utf-8?B?eG03VDNSTHdjOTdCekZKbXpiNVMza1NoTmlIUkJtRlNmQXlXTTFGNlg1SjMr?=
 =?utf-8?B?TXp4TXVUdFBsMVE1Ti9kRUhlWDhXVjJFR3pzeW5IQmtsNEhuQjZ5bEx5QXlr?=
 =?utf-8?B?d0k0U0ZzQUhsalBlcVNJZEI4VC96TkVNYWN3YWFvRVVSRnE3RUphaEhTdVdT?=
 =?utf-8?B?WC82THUzb2c0MFZoSExGM0x6M05FZG1peUovT1JuajNwUFRrdmw3cHVRcm5O?=
 =?utf-8?B?TnNqcmltcHpMcnhlcHRNYm5jRmZlTG9VOXJUT04yWFJURXNJc3lEaTVCejZZ?=
 =?utf-8?B?NEFsNTdSLzBsQnQ5SkdHVzVRNTJYQVdSYnpWQ3BrSlA0ZmppK05zMHZ3TVQz?=
 =?utf-8?B?TG9CM052YnpSbjhITnR6TWh4a2ZtTk1FMkJycnN2L3pBTzhrK0RjS3hYcWJP?=
 =?utf-8?B?d2RpZFYxZmFPZ2ZnNzdwd2F6T2lFcnBBNTc3bEUzU3hYN25HWThHZ1E2Mkxh?=
 =?utf-8?B?UUQxd0FrVFdUeWxCTkFyTkZJS2FqWGI1eDlqMEFva3U1RjZqVWtQaUZsSjNu?=
 =?utf-8?B?aWdxOWRFSHZSdUJQZVNhM1k3VzBCZFZmeXRWUHg0Q3RwS3JJeXFuQklSMFN5?=
 =?utf-8?B?Uk1lUVk5ZnNWYXBhRzFhWjFIUzkxeGdYcUowZlYrSzJXeXBwQnpHaGRrek9J?=
 =?utf-8?B?K2c5aXF4ak5xUFFMOUdtVGlaNEhsOEVBV0tGbXFrNnRHWjBDTFFocXQzUTRz?=
 =?utf-8?B?NkVCM1FmMVlCemV3Uis3Vkg4QVVCV0QvZ0s4dktkQWZyR0ttaU9sTFlBYTlB?=
 =?utf-8?B?cVlYNVJqdndibWk1VmpRUzVLZjJXUWJ3Y0dRaVZBV1FZQkhyUjlpM0Zrc2ZE?=
 =?utf-8?B?QlN1VWVISVU1djZkMDFjUW5rUnU0NmhJb0JyaEVrbUdrM3VMS0k4SjZnZmdF?=
 =?utf-8?B?Y0JzS1JTZXFBYklHd2RxbG5BMWhGZkxiUHZiMzkySHd5TFVNdWJKV3VxSnN1?=
 =?utf-8?B?cUJHS2w4dnIyWjZkK3BiT1M1RW1pZVpBdnNrR0dkSS9GSmt5Yi9NVFBTRXpt?=
 =?utf-8?B?eGN3THRmL2p0aWpWR2w5NllNVmZLU0taVnFwUE9DSVJPUitST1dNV2pwckxX?=
 =?utf-8?B?ZXB4K0Y0SWRURXVEcGJEa3djNlBzK1JCNzZYQzVTQUgvdlE2eGpvcElPNmxO?=
 =?utf-8?B?dzJqSTQxUi9MbVJReGNjTE9GNEMrZ25UckVzNXRVSXNyTXlnOVhnYnRoaTAv?=
 =?utf-8?B?cVduQUl2RW5FcDJPdWNLaW9LMldkOHZXa2ZXMzBmTG5XMDJoR0RNM1RidkNW?=
 =?utf-8?B?clVFOC9pMEowSy9rUzAwb2crS3VZa1lpbUh1QjRXWlc3RnNnQ2QvajdNK1Uw?=
 =?utf-8?B?ZHU2Z2lUYXA2SXNaMS9ZZ29JU1RFMytYRXdtZ1VJSFJRNkxGc01ZYnc4NWRQ?=
 =?utf-8?B?TWx4bUVRUFM5K0VVblNoYU92SXQ0NEd3QWZ1OVRPL0VVWmk5ZkFLQmtEMkQv?=
 =?utf-8?B?ZlhWY1JpZjVmVEJES253WWk1UTFIUW1RUXJsSUY2ZElXZTZCWFhzUmxlcU9w?=
 =?utf-8?B?c0NydVM0ZW1GR1NoRjFNRHB1aERCQzJPMTYwMmlYZTJFWEFmdkU5Ny9MZ0hU?=
 =?utf-8?B?SjZDUTRSelpsNldrWE1haGVuZTZTeEdlUHU1alRMNjNwNE55OGxTYnBiS3V2?=
 =?utf-8?B?a2M2Q1ZaazVra25abG9DZWE5a0xEUlhyQ1ZPRjRiSWxZd0pFOTNTZ01ERVd0?=
 =?utf-8?B?T1VBR1RoOE1NVys2dVY2WmtJazE1a2JtR1VzQkxobFozZGNsQ0xwa3UwSThH?=
 =?utf-8?B?enpyVVNCblhrcHQ4S1hONGR5d0h5T0hhQVRjRjdQTlVyOFRBekJpSWZxNjVW?=
 =?utf-8?B?TTJIUU1OUExOT0d2L1lnSkMzL1NQVmZidzh1bFVzcG1nbjQ2MXpoT1VvVjR4?=
 =?utf-8?B?bDJYL1BPd044ZW05Tjc1M2JjMzZybk9pZHcxMXdDblFHOHlHeDVyeUNWQ0Zo?=
 =?utf-8?B?M0R6cW5ObkFsaWd0Ym1VRU43WE5yZTN1VENjRFhoRDROY01xL09nTE5KVGtz?=
 =?utf-8?B?V05iWGM2My94MjVUVGd0SWU0OWJVSkpucndVajZHK0l0cEdTcVZhK2RLYTZR?=
 =?utf-8?B?WVoyUE1kbzNya002Vk1jbXVpb3ZtamROMWNtUXorTS9DQU1RVFcyZWMzTVFk?=
 =?utf-8?B?Y2Vtb1RyYlZmQXdzRnVoUmx6TU8zNzhxUjZ0MU5nSENvOVVVZG16QmIvSnYw?=
 =?utf-8?B?M0d5TE1IemMyTlBUZnFaZTZrTXo5WDFSaGt0SzRucmxpZTlhUzZpYXV6Q0tS?=
 =?utf-8?B?U1NGWWNEVXl4R1oxMTRqUWdCcENvd0RGTDZ2eFc5THZHNlRpS2p0cEhVekM2?=
 =?utf-8?Q?fNOURsNCtJ8huVRE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b871bf8-0871-4bab-9cac-08dee27c7896
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:22:16.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orA9pUqnmId08ylFxEnrjLSItdJFlh28pWSJU4m2GK44/P975XbJQ2HiaKr+TR5KJsKtrZomTbaXUoMucWlArRnLHKmXaB8RW4FgT/r0qWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989459
X-purgate-ID: tlsNG-ef75cf/1784125341-A60C5AE4-6F90569A/0/0
X-purgate-type: clean
X-purgate-size: 522
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:from_smtp,lists.xenproject.org:rdns,suse.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: E653475F4FE
X-Rspamd-Action: no action

On 15/07/2026 11:48 am, Andrew Cooper wrote:
> Fixes: 8af337dfb8e2 ("x86/entry: Use POP_GPRS and remove RESTORE_ALL")
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Ross has given me a T-by tag in private, but is having email troubles
right now.

~Andrew

