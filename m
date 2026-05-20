Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEjEEF3wDWp+4wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 19:33:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91231593EEC
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 19:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314226.1584208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPkmr-0001QQ-Jv; Wed, 20 May 2026 17:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314226.1584208; Wed, 20 May 2026 17:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPkmr-0001OB-H7; Wed, 20 May 2026 17:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1314226;
 Wed, 20 May 2026 17:32:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPkmq-0001O5-OX
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:32:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPkmp-00HUGx-8n
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 19:32:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0df02f-e002-0a2a0a5209dd-0a2a4509e2b2-46
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:32:51 +0200
Received: from [52.101.62.39]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0df041-2497-0a2a45090019-34653e27b499-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:32:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7968.namprd03.prod.outlook.com (2603:10b6:8:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 17:32:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:32:48 +0000
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
 b=g16Pm5bjFoXGKmwaBRdWAN4NIo/ALAT6+jpdBDCADorMkCNJOdQLZddIPtxvz8FjN0PEldq3td7ppjciw9t72JhJ55jnOtkYq2wWGOPf8Adz8ZZnUvhWUZDybAswKKLVcB/j6m47hjpCxQcj/cFA3RyBwiwCFK/Q7RfRPY/MkTFMeziOUieQ4OTWKMyqv0CapcddPg6xudZSJzumPVdVZODa5DPJy/4YxL+ljIETt0V8WKahpxdTaTJaACEeQlcADWBrfCoqT+6UZjxwzMvz1oLjwOE0nkQOc4Iu5Favt1s1QKo6bBXDtdRKdLCSg+Lu+OawV5r8YTzYUUinQsHA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8sJgVkOcRnwfhHGyUTRu757ZGClPP1yhmXOqtI8c8U=;
 b=BDa421P6ev0jluB1Mi/XCZZSmkMKbxiPrPk52TzkdSRTzzBzU9FsSzAf9yUPPFE4Vuj5XvVx5FakaVA/SHyj57VBLbk3NQKKCi+Ucmb/K6d2SWWtrpjijny/V3DHuiYxOYL/ZjYX5O8XmSEtzWwva2emcKyTmkDUJq/fwt8p+fS5/9w3TFlITc7yvo8e5jttqgUrKAh6a0ntIvEjD3Vi9L8fa4CtfN8DxaJjxwmcRc9i/lYN+tEMw/N6huC6bril2XssyC/fWpOGg05/qF91450ZxeIOqiYQSAOjWRKvn482yD6ZmDLrJzkFZGXs1bqDmmgefc6HX7XbYNiUPNrfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8sJgVkOcRnwfhHGyUTRu757ZGClPP1yhmXOqtI8c8U=;
 b=dG7Ry+E8uId83dZi0BqJMAlKie6/HjLo7TGBBKOJUnuqr4kCnakLDbB5gWQwVvBqXIA//neunYAZBTftV76Y+OrbDXjf5FWu894WOtLNJFRHt1M03MlAw13n4tJtta9RXGyeUYvblc5+6dxp75lr9q2/LfZEYoGbg+hj8DdaSNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b5753aea-15b7-4bfe-bb69-e002c1964ad0@citrix.com>
Date: Wed, 20 May 2026 18:32:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs: Update console=pv requirement
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779293052.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779293052.8631fc262581453bbf619ec5b2062170.19e46215cd2000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0441.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d6851e-7be3-40cf-6f97-08deb695cf58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	17YthNOpcTQOXh5CvoPGLtpr1fKvIHCDiPsF7FgJVUsmGZ+/7BzCyTaTWQoonyhwDenMaK4MHpaKtUboVPLcbuo+N6ABOyICrqOXnw4FL6vRwBbxEjkN6bnv+E6VXp69NrGSTHpR54N/mghI4atPITzzOMGlbwd8X5OkQrhEDR+MKJNVjtzAWljxSqI6wGGRHmLd07OE4nsVVTetcqwS3bppohxyTduROMfavRObKMjWrdRuFBTKUAqwbzxsP6P2SxI8QgpgA+0bidbIlcvEcwJOuxYe+DHE6UG+dEoPcFL6/6tjHaREMi0AD9Z/fbk5wzLbE73cVIKn0GN+vQzYTfwKzdAnam2TuLH7szQtNw6HM1Uh5pWgTqgMj9a88oKlMNLQGotq0Qxr57UUrThS8DfJ9Yvum9wUYFLaPuxOnnEFSAr/RgqmTIDp2sa3aJT8lCPHtEHbudJ3AmJWf2tHzL0dgq2wptLqc8halVIQ+brmoDVgmNBtFu+FvNmu/waaLhlk/30eztRLjL9uC8tpCE7U4abvZZeJVONQEndiOMMqx7GigDbdYpJHcPZI+S9urlxavUDtzN/Idboid0A/iQiId+SSBtzyLXce3WKV0THQAWAsNFYdGmlV4w6u1mGirRcvOmIyC2ROi6OoL/M+bCm+bcIfTV6Lojqb8zQw2TLkk+LLxnaRepLRVWbX2QvB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJQVjN6N3UxaDJweTA5WkFxdjhleUJ0SUhla0NJLzQ5VXBRMDVjNFhJMHMw?=
 =?utf-8?B?c1BCWURNeUF3aFZOTis3a1I2bFpxRkZMNTZCMG9HUGxXVDVrcWNBMGVZSXl0?=
 =?utf-8?B?Q3B4OU92MmRIVzlZY1pUeWxnVjk1U3RoSUl6L2pCVkZ4bVdVTHNNRjc2VUcw?=
 =?utf-8?B?bnVOMFl2MElaL1NUblNjV3pqUnF6V1RpeFkrYlNWVERVQjFteGwzWkhQMEox?=
 =?utf-8?B?cThYMnAxK0tLc2FjQjVqdFJBdThaUVh6OCs1NDFjMmUvZm9kaDNtdXVWSURK?=
 =?utf-8?B?NzdpbzNtUVU3eVZFYmk1c054M04rTFZhZkZUZ2lKSVFxZW9TNVl2b1JYRzhY?=
 =?utf-8?B?cEE0UDRnSTZ1Ty9ValpIc1pIRWtLVTRXM0tHdGtxTkcwMDFiQzg0d1BLMjc2?=
 =?utf-8?B?UWYrTVJ4WDNCaHlLUXR4UGo5Sm41Qk5RR3hkTzZIb1hrMUx2TVlFVXVqb1Bq?=
 =?utf-8?B?SHJiMEo2TVorRE1aK3Q5OTJMdmppMklURzluaktRNUJYT2VEWFBaMnoxNjBN?=
 =?utf-8?B?Y0FSeXVybkhtdGlNZTB4NU1iMGdGMzEwWmpqbmhYWDZwZkhOWGFQMitnMDJi?=
 =?utf-8?B?R2cybHZLeUl5VGsyNTNaL093VzIxbWM3RzdOYjNWZHdrVlVkM2JJLzQ4N1pw?=
 =?utf-8?B?d01QTE5oSjNlR3Q3NnpPcHJVRGRiZW16TkVwQysvQlBpVXF3THdjUzRQdG9p?=
 =?utf-8?B?SHR6MlU3dkRyVVNLMCtGVnNsa2pVSytWWG4yYnJNSVJoaGppcXhRQ01Vc2lV?=
 =?utf-8?B?eHk4U3RvUkMrczNJVThpbHlSU0JoeU56MnVOd0ltS0JnOUZsL0d0UFFNMkRX?=
 =?utf-8?B?MThMZVhVVGl4cWVGWERIOExseFhsTHJKUVM5aElDMmU3OUk5cmVjNGxtTVI5?=
 =?utf-8?B?eWhCdlJpMWxyQU0xbmFncTAyMXhYYmJiT2NxN2h5NWc1cVd1djFLRDk5amZa?=
 =?utf-8?B?ODFhUy8zemF0a1pPYmpzN3g4OWFBbk5Fa3kzNHpxTlRtbXMzYWRvbU9DcFRj?=
 =?utf-8?B?Ykt3V2RXL09lUHF2L1laV0t3WFptNnVabHVBdkthUCtnb3NxYXNNRXlnVWV6?=
 =?utf-8?B?L3N2eXlqSWgxb05ESlFuZXowRlJ3dEJvWHNYamVETTZVOEduSUhsSll5Yjkz?=
 =?utf-8?B?OFU2N29Nek4zbWIyUVpzWUF2R2t4VUZOa21HcDVXUmZoak12ajZjcVRxNkRD?=
 =?utf-8?B?T2RHdVJVTWhUaURSTkJEVnZJbTRPTnc3cnIyaDFYYWtSVTRYL0k3aUFqSGlz?=
 =?utf-8?B?TG1KUnR4bEpFekZ6M1ZxOFFXeVFZNE05T3NaOVNQK2gxcVd6d2NIUWJoNXRq?=
 =?utf-8?B?eHBRRVFZOHhJSzBSRXVmRVlCOGE1aUcwNjBCM3FGUG9tMFdSUGhvdmVOaWtr?=
 =?utf-8?B?T2JqSXk5Sld2L3pvVkpqQys0T2xnR0NCbjNRZzNpcW9uWnQyZ0NrNDVpTkhV?=
 =?utf-8?B?VzRNZ2dzN0xDMmVrZkVhMCt6OUhMR0hWb3JSOGdpTDNnT2d3bEg4UG80TnVK?=
 =?utf-8?B?anBFQ1BRTG9jaXBDSnFzakNRSlVBWEYralVXZWg5UHlxYnREK1VveTgyM3JR?=
 =?utf-8?B?M3Blei9RcHgzUng1M1FCaGJ1UUlsa2VQN2k1UFI2a0h2R3czcEo3WklFZWh1?=
 =?utf-8?B?MUppdi9lZGpSZHpHdms3alNodXJlNERTNUpWZnhGallWQ2dJWmgxd0x6M2ww?=
 =?utf-8?B?aFR4Wnl2QUgwcWxkSUpRNm1mS1Vhajc0K2hlMGtUb01uZ2VWVVQ2YVJ0b2RE?=
 =?utf-8?B?RFhGNUMwb3o5czZTeGs0NEJYVDZ4bGFqS0Z4aXhMMXZoZlZwSHN6OWFqNTJC?=
 =?utf-8?B?NzJ3RUhxdGZDSkh1UkE2UVdHRnNCemJLN0cyNCsvSGV2MU9ab05IQ1hjTXJw?=
 =?utf-8?B?K2lDWWVHN1IxVVdtemVMK2pJWXBaVkFIODRTNlI0VjBNdnNHelI2WEFXVW0y?=
 =?utf-8?B?cHB1eEJKbEFONzZScWFqNFNIaE5DMFpyTU53RDZFVTdEQXdycGVIS0JYcmxx?=
 =?utf-8?B?QktLKytHc0NoOFd5WUw0WW41c1UxT0g4NGlRWXp3ekQvYzVBbDEweGR5Q1lQ?=
 =?utf-8?B?aDFDaVFhNXlPR0U2RWZ5bXZNb3Z3VjU5MEZjelhmeEZEVFQ1SlRhZGdXWXgv?=
 =?utf-8?B?NW9UVDQ3Q0czM1Y4cnZLR0M5TUVyTWpFSHhpd2pNNC9xWitheStmdUFlTlVL?=
 =?utf-8?B?dlpleG9KQmowdlFoTElvekhrZ2ZHdWFjeVVLL002QUlEYVpIMU54MGVlZjNB?=
 =?utf-8?B?bEt0OW00Mk9PK0poajRndE9yakFNNmFLbFlUdGwvN2dsRDhQcExWbFRhMkpI?=
 =?utf-8?B?aTVmVXd0NWdrUWl3WGhmS29pcXB2M1l5TTNhaTlqTEZ0Vyt3dWxGeEJyL0tn?=
 =?utf-8?Q?QeWLVeQCrXgC4znQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d6851e-7be3-40cf-6f97-08deb695cf58
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:32:48.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgxjDNa+pfbF6zoprYx7KxSZgorj67eu0LdT+SNb17vIctLySmiC+zoNmGPhoBDT/NT9i2FMlg+Ocw4cbvBQVN+76WI2CTVhmMNcl/7CBFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7968
X-purgate-ID: tlsNG-bad1c0/1779298371-88B73A53-1EAB51DD/0/0
X-purgate-type: clean
X-purgate-size: 396
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 91231593EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 5:03 pm, Teddy Astie wrote:
> PV console doesn't require Xen to be running as a shim and only
> requires CONFIG_XEN_GUEST and running as a Xen guest. Update the
> documentation accordingly.
>
> Fixes: 4f6609d6a665 ("x86/guest: use PV console for Xen/Dom0 I/O")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


