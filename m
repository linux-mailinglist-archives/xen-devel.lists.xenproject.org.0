Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Txa5NWUPNWoDmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:44:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800E6A5058
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:44:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=uxBSB7cf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341995.1602290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVlQ-0000r8-Mk; Fri, 19 Jun 2026 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341995.1602290; Fri, 19 Jun 2026 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVlQ-0000pl-Ju; Fri, 19 Jun 2026 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 1341995;
 Fri, 19 Jun 2026 09:43:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVlP-0000pd-7L
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:43:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVlO-00CGr7-KP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:43:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350f4d-e002-0a2a0a5209dd-0a2a45079fb0-34
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:43:50 +0200
Received: from [40.93.195.54]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350f54-4766-0a2a45070019-285dc33647ab-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:43:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7742.namprd03.prod.outlook.com (2603:10b6:208:4f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 09:43:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:43:46 +0000
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
 b=EwBvXfc3cWlzWKt3khtFdHYojgAcanlGeRWngIGMsFechv/OHd1wSbUhWru5Y7Qo/JCkAmqoOSPjWMnZwHaMRk1uMfHYP03unsNZbnttGjrlYuENKnDnzfE8wl3Za5T5njl6rfeyvXhoHOjaQyXiJuQgaM2Zlv8iGasCllpofGgYLlIy9qc2bB1tzp2aT6IEzzwAplREzjIhNt2b4/4XHs1YjYWWmcH33TWDwm2rC+mukjhXS8t12Jw/tyndaGpoVIg2cGfzuV03iBEJHA8FNmJHCa1CO6eS6SDfBrd1anWFM9ZfuxjyAoXEITaUkcKlKV1wtUyv7KB2BegyHFx+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=op1ebS5HajWhZq6FnZftGk9RCWvfawgbPBJkQww6veh2/BybkBfjpRYeG661dze66RIeIx5UxY9Sap8OD7evyoB8yNpAMEyHRJ9TRJiImDUQSZ5yGc/8bExQyml7DPEFUCc34ghRLV0ONUWcrgTKaMdSBkFXRZGs5KljyJzVcaYcEHRntHOImLoz/VQdjACefBF3ZoKx8M+hDzkX6oPv4gkjFholfXY14E7VWbMfZ7qki5LNupdj87zSZsMg6n7F1yY0fDCrnKXEJTOSwnrYARdAXPt9Wnj67Uyr6EmaCPGh+E1weg2IS4aTem3uDYB5rFgyu3USZYJiXFZwMwKyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=uxBSB7cf6mu3ynHs4MM9lJff7k3MBD0DVkZLu/+JVluwkKyGbQKA5+deJHSQgeAE8v57R2Suf+9IThbQBFNaTlU2MFuR5fS0KlSHObSOS+GEdPIl6Tx4aWnUtMAOZWJHBNfa2kO+aeZI+gpIEOXsRXKD6xZ3zWXYT3FMNPpKUY4=
Message-ID: <11a3317f-125c-4ac8-940c-e3c7c1c9ecf4@citrix.com>
Date: Fri, 19 Jun 2026 10:43:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 08/15] pci: Use pci_sbdf_t in pci_hide_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794556.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794556.8631fc262581453bbf619ec5b2062170.19edb3b498a000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: e8604a2e-becb-4d07-fcd4-08decde741e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	s5KgIOlk4TJWoIemlpNlDAJAE98xTpFuKCgGCyeZOaEeit3aJgxsWoBu1JYAZa572SbLxK8FpgNAp9Gqb1HJDux0f0VT5KTUkquZK+6AWo9bUMDml5PgerSFXEkDCRgd1zj4zGyQTv5a7qgcp5nW2W5KDomM6MMBCqRUW2yB0IxPzsWRX28c8OxodmxcbIlTdhb4ZSxX6g7Qw67kQRUg9G5G/HVVNIqqIc4TrqqtrtYc5fvIKIYQclFoe5aqIkYeeS/ZFEF3Q6nSbcpoJtG0UE0kY1cUWJ0gJhTlt5QdfvqdVL3DFZqTsnch11qsVFKV4lKqpwUUGPYms45H+zO8frFi7Gv0bDs+z199mtpasvqKzlX04xRrruGG6e9sFj9M5f/PAkgXB1jN/RwRwuSpjJ+g/9NJokor1/Znzh9EDbX97bOvVjI0aXgMhd+LlUPvwgYwZpVsPabon6bufWGTu2/tc3XfjOVXZ8IoVBH45+w10JCj3LCjMce2N7+4cj0/FrpCMQ2NSKlHrI0lQj0J+l3o73Ka7U2JTI4E+fN3B3rBd9a9ZTeHgz006wlO5wUhgZdrDJ9wsgjph4vrB6DXNJKh43vq/IJIfo20LBRi0kO8ZHxsRabQB6w0KhjqyZhECy5oONOeYHb9SEzV591W0kZ/wV+lkMiwhhRWcQU18pA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRIVjBqVzVhS2ZpZC9tZTFuS1h4SzNER0xYdG1QbnowR2VjT1BRYi9KV3RV?=
 =?utf-8?B?dW92ODJKMWlJb0NRSzdCNHlRSkVSRU9ISk05c0gzZW9iUFp0eWxmNGtoUktK?=
 =?utf-8?B?YjQ5cWc0bzNqb05BL3NaMTZkRFdyZ2tlUm0rU2kwTTFWZU1YNW9TcVZCdXFN?=
 =?utf-8?B?VjMyMmR6L1dmZ1FRZ2h2OGlXQ1pXcCtsNlY1ZjJLcnVkYVdKWjU0a2FudWM0?=
 =?utf-8?B?dXVkdTdhNTYxTG4rcFJPNUFSMVFmbWtHR01aS2cyL0tzdk45UXRHWU1yRkd1?=
 =?utf-8?B?TzZ5MjFNbG1teHQ3RW5iemt1RUV6VGtReFZpSnRUY3FwVGVFTWVvMml3aGpp?=
 =?utf-8?B?WjhMeHgwS0RHWGFqeHdKV3haTjZGaHFSQXcyMDZ2S1I0d1VkK0N5MzNxM0dz?=
 =?utf-8?B?RUwzM2ZXTW9Fd2RsQzZKRERVU1Y4Ull4SmFzT1laUWlmY0wveEltUUtTSmly?=
 =?utf-8?B?K1BRanpTSElFeGlkNy9HTEw3SnlVZkhiMFRWeEV2UG1LazBkd1ZJZHVzRDlU?=
 =?utf-8?B?Unh2SVNaM2VyWnBXN2dGSENaaEZnZmNoeWRmKzFWc1dIeDBLVW5MMjROUjFY?=
 =?utf-8?B?NGpGcDNieTdpZm5tUkp4bDhiaHg3cE5lQ1VkOGhXR00vVWZzNEhhWWtyYlpx?=
 =?utf-8?B?VndMRW9vVFlnWnZRRHcvZ3IrVmlBVHZ5a3NWRktTdEppZERWU0kyY280Qnc4?=
 =?utf-8?B?bFRzTXhYa1g1eURFOGVjZEkrYy9DdDh5NEN4YThUd3FiUnZsMmprc1FmWnlo?=
 =?utf-8?B?SVQyQnU1YnZ5S0phakVHZ2JtN0tUdFVoWXJWb1dOQWxKUk1ubWh1UGlwMjlv?=
 =?utf-8?B?V0ZsR1ZHNXlWOXFwOGRZNDI3NFdqaHNWWTlUSjJwVUdHblBXb1ZvRFJxTlRK?=
 =?utf-8?B?bWZxQlJKZmx2YXRWWktOOXdBbTNLMHlZU2ZwdUsvNnpHSW0yVDJCWkREVENv?=
 =?utf-8?B?b3hxTDZmWFVDTDZ6V0t2Y0JLMWFMRUVoUVJxNGc5WVM4YU9TamdSVTNBRDMr?=
 =?utf-8?B?ZFJReDh5OGRqbGo2My8rOEdCaVFCYkE5Q0xpQ1doTHBwLzJMaGFwS0hHRTd3?=
 =?utf-8?B?RWdYMldIdUJ1a2pGL0VucW53VU1XOGw3UzNNRFNZcHZReFJsekVNZUZkc0Vn?=
 =?utf-8?B?TFlpMnJVcFU3blN6SkZaQzQ4U0gwVXlOUEZPUFJiUjJDM1h0aDF3VXk4Y1Nx?=
 =?utf-8?B?N2F4YjZWcnd3WW5ueWFncnNkQk1RV2dwc3pKL0p0aHRISW1KcVd5UnRYd0Ni?=
 =?utf-8?B?RWNhOUF6Z1ZMckJSdkNDOHhoSExqdjNqUEdmRk1XbndmY3R5NmRyQnROcFlw?=
 =?utf-8?B?S0tvN3VobGhDZUsvTnZVSnFIZGg1Z2xtMEJBdUd6cGxUK3FVbVJhdTlVZytB?=
 =?utf-8?B?NTdUcFJCUUM5OFVYMlZwcFlMLy94Tm9sZnNXQzNJbHBzSjIxQjBJYXl3dXcw?=
 =?utf-8?B?Tmt1Z3d0bDZnUU93akFKN241RWlxaFkrdFUraXlXVzNLUFprRU11djlpazYw?=
 =?utf-8?B?VHpOM1RmNXowZE0zK2dFRTZSU1NmYnRxM3Uzemo5RnhHcjBiRVBoVzdES3Jo?=
 =?utf-8?B?cFE1cXpxaVNPeDZpV1g4ZG42NWxwckx3UTNlTjlVbWxrVXEvcWNlNmw1cVVC?=
 =?utf-8?B?S0VZNEpoVnVEZGdMaVd1bmdXNWpJWStkeDVUQnRHeU1zL0JjV2wxQmxtVjg0?=
 =?utf-8?B?Qjh3UXc0OVE4MTdOVVlmYlZCU05Wb0FlM29FcmdDQXdWN2l5NGZhNTZGM1RS?=
 =?utf-8?B?K1p0U3JvVkwyT0Q5UjBZaCsvRWtweW40V0t3RFBTR3hvM2ZwNGp3RTNkSzJN?=
 =?utf-8?B?cjRZOUpBVmFKNC9wTlFTOE9zcUxWUW0xTnRMWHRpamowc3F2Zm1BQ1ZvZmsx?=
 =?utf-8?B?Y1B6L2hPTitPbnBndlVDRFBmNHRKQjNzUW1kcGRpUE1DaXRoYlQ3S01qaFFE?=
 =?utf-8?B?Q2M1aFNRSDFpYm01eCtsY3MycG5Wc0RiT2gvcFdrZXdaUVRVdFl1Z0lwc21Q?=
 =?utf-8?B?NlIvRFovYndndnFYb2RsZThVSTMzMkhISGxVTzZkSUpSWlVJajZyZE9LdzR2?=
 =?utf-8?B?TFdVOG1oWHRqOWJYM1lLSFl4QnB0T3Boa05OYW1pVEZiRFdoV2xyQkE5UUUv?=
 =?utf-8?B?bmwzYVJJd3c4YzFXUWNhVFhoVHdwYkx2NjNqdm1QeDc2YmJUdlc5Vlo1NWZo?=
 =?utf-8?B?b0l5K0JXVXRXeHp4cnVqeFFaWlN5Zm5Cc2RRZUwyZytFR01HUGMveGVBTEwv?=
 =?utf-8?B?RGkyODdBaGxjNXVtcEl2S0s3dURaeXVISWROb3ZMcjJxRU8rbHFjdHVxY1Zx?=
 =?utf-8?B?bWs5TTFmMzNPR2xPYUY3RlRYQVFJTy83VWRiQ3M0VEp4WDFnU3k2R1VGMS9H?=
 =?utf-8?Q?0zrQM62bJmgEZUQU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8604a2e-becb-4d07-fcd4-08decde741e4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:43:46.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mByDNVXv6wb1Q0+SC/mvKGnwc+OUmGO7t1g0ldBsDGYaubKcJcWg4FokET1TTBtC2cUAu2anQ/AwfxU4faQnFXNvGJdfdas5W+yhsB7lDrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7742
X-purgate-ID: tlsNG-ef75cf/1781862230-89BFE979-3BA1D715/0/0
X-purgate-type: clean
X-purgate-size: 193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3800E6A5058

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> No functional change intended.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

