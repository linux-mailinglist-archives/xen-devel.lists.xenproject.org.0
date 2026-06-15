Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NqhPHgpAMGqkQQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:10:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA2689142
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=k1i8NVlH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338487.1599521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZBkb-0003Cx-6q; Mon, 15 Jun 2026 18:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338487.1599521; Mon, 15 Jun 2026 18:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZBkb-0003AB-3s; Mon, 15 Jun 2026 18:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1338487;
 Mon, 15 Jun 2026 18:09:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZBkZ-0003A5-Se
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZBkY-000qdu-PU
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 20:09:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a303fcb-e002-0a2a0a5209dd-0a2a4505ceb6-14
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:09:30 +0200
Received: from [40.107.201.6]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a303fd9-aaa8-0a2a45050019-286bc9063764-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:09:30 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6534.namprd03.prod.outlook.com (2603:10b6:a03:38e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:09:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:09:26 +0000
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
 b=rFWS48T1IyryIw0s225zi8GbRL8d4WZTZSP/oS/lb+Uqm5ngCe1jFnCpYC0htOGOJELpuy/d5ErFP0onRkXo8D5FuU6V4EwyxFgUPxVa0ZPHhu9Z1wjODNgUhs3SxBfL6T+expayu/XvLRwf2zKl4T3SJIA5YDH90ayAUBDtmPbJzyPEpEnQO3VJuhJC8MHPNx1OrztJeqFHbYEGlEY/na0iWUOQwj45qB7a17g3uXiGur4YP4t5UYLAS2eY+Fhl4w+bxTWibfVYeja52l5bvGoCycP0EmO2DoAEFjjnHj99WBA9z/VCz3+5MWF5kBL3oihrLHg7Um3lFqtGqQ1B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87qHOZhlqH6FaTwsdv/MTXLwIAYTiW5BH53wP0WpXuk=;
 b=hVdDMq/OS9lFLbnvLSEoarjnkt4z/eg7go5Uqji1HrOJo7yIE2SJ+8rQAT910mhHukVSD2KkPOo0jjpQ50hlbE/SulukKto97NCmKhsGTKrAtrSXk+xch6oMWJdzIkJ7QdlSgPZG0XS0U/cI3w9z6JlYyYDuNzM04AJb2dGGABoPzOMUfqPOeMKI+5k0JiPSPhGPdpC2409+zwmks2YCW8SSafVHc4kGhZssL4/MgBsNeyFmKiq35aUIq9DruHX8QgHxXDKVEnuCtayuDJFRkzV25DqueMPJHTXvSCEL+zSN7+rzvDin7qkteLobRfA2OHx5OP0Mj7jk/U2E7HpPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87qHOZhlqH6FaTwsdv/MTXLwIAYTiW5BH53wP0WpXuk=;
 b=k1i8NVlH1Qjcu/PZRsryY6MsK55m6nE1NmFJrAgNgluANzGMzj8sXQa98Qyg8KQC/9amKF67opoDB4Pkw9HEsqdGGAhLkgqAxsdns7L1JkooshbJcUKcmTdZdcLATr+XFY5aaVwGqpJOh/vQOUq2cuRDj6gIsADeYHJ4HZXfj/Q=
Message-ID: <09dab381-fb87-45b0-ba82-f42dad8dafd0@citrix.com>
Date: Mon, 15 Jun 2026 19:09:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] docs/process: document AI-assisted patch tags
To: Cody Zuschlag <cody.zuschlag@gmail.com>, xen-devel@lists.xenproject.org
References: <20260527174528.27903-1-cody.zuschlag@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260527174528.27903-1-cody.zuschlag@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b39924-fb1f-473b-662e-08decb093c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|5023799004|11063799006|3023799007|6133799003|22082099003|20052099010|18002099003;
X-Microsoft-Antispam-Message-Info:
	C8EtsQhgbzdwa0FFeBwxu3vF/86WteXDKaqFPGEe6gZrTYt7EZ+bqgCjmujyuZUcZaAgmRaLMv/9PCquhu0VYQn88lAuPg66lQVLSx0HkW0lqVZZC7lrjTLuygJiw6bXUhz+YFwigqZdBEaSuCPFwHjxrx50DxcIDdEIP22HBk8Co8LVT4efywKD2Tov2AL3B5QgEcyw/tbILqrVD/vT3zz/reNmuNIm9ew3JWE7yfWelVoc12fogG92r+3ih+75tGcWUC7tfBJ0bveJtUcePB8v8qxgMivjE2eOj14E5TJgKGqoBnjStUFLKURrs0x50iYTHGKXDXRfxi8TzZOWDJ9cyrfT1eo1dKfOEx36/pOj8ls/PvHeRTiy4G3MDNFc1LZHeOWJsTXN55WJr4t1ix87bZ/zuKQhso7DAUN9VRUWyB5gX/GBiBcWX7D9EsOlopie2YHbtsfNdiq0ILvseVQNEB8wQvzWoNQgR2CBh0PajG48impKiJhAIl+b6bl67TqN4a/mViovrRsJwnVzeY0I1gSblGavAaA9jFSgm/n7M+DOe0NHs0oeqH+Y8PVV+oeCFholKui1BbwaGJq42QL5d23sUghwTfOZH2VRyjc4zWaylp2/DGayBuo8OTG+ecpLkVjy4hEqTgXhwRdv4ZSwIez5onr7fcSX5IWzh31zzu1AW1ox4Co8c1+kqvRz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(22082099003)(20052099010)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dElmcU1HbGRUcm5Ld1lrYjZDZUd3YjNNM1o5VCtvcGdxUXZ2QXpVS1QvVlpj?=
 =?utf-8?B?YzlWZGhtdERhclVJOXhvUzNhWkhRWVBnMk9TU3dLYlhzTERmd09nd1ZySEtQ?=
 =?utf-8?B?ZmNVbG4rZTBaSUFCUEZjV2FjWU94SkhVTTJUT0xsWmJXNDJHcFFtdEg1L0FY?=
 =?utf-8?B?N3FRYlRIM1NUVTJ2YUU1bFRDUEN4ZW9pdjdrejZMeVgzWDdKc3FvT0grbHRa?=
 =?utf-8?B?cVdxdmZlZHI4NU9KNktWMUtlZ0V5bTBiUkllT0dQdnVXMGxOSDNHUVNWRC9s?=
 =?utf-8?B?Q3lpajFOQWZMaVhpazJHZjlmQ0VxOG1ucnFsMTc0UHJvczdBM2h3d29DWWFL?=
 =?utf-8?B?Qk5zcFZjV1FkM3pKZjFkZWFNOSthclhBZ0dhZzliTU1BY3RJVG4zb2VEcU8y?=
 =?utf-8?B?NDVDL3NST281SktqQ0wyd0ZRa0lEZnFjQ3IvN1pIZGY4SU9xV3AvZDE4UUtm?=
 =?utf-8?B?WENyd2paL2prRzdCdVdDRXBEb0hwdFMyZWxabFRJRjlKZFJYOThONGVUQ0Rt?=
 =?utf-8?B?NUs2bWpwODFHQy9UckZYQytOMExMSktQQmRrMk5Hd3Y0Vk9BU1lpTk1BN3NR?=
 =?utf-8?B?NklUb2ZnSEZiY0EzSVIvQWE3ZTlTZzVmZmRIakVxZmFhb2t5T240Y0VKVXh6?=
 =?utf-8?B?eWhRU3lCTmlQbG55VnE5NWI5NUxlZkRlZ0ZabW1PSnpYRXp1NXVneGFCakl6?=
 =?utf-8?B?WUtZOUNlM2s5UmhKeXh5dXcvamw1V0dndlFVMzVmMU1wU2VJM280NVZpbjlF?=
 =?utf-8?B?ekIvUVNZcENEVWJJSy9rQU9sMVdoV2JaZHdKVlcrU2NSaG94UHp6ditCNkov?=
 =?utf-8?B?SlpFUFB4T0pyLzVYc0JIaXo1dFV4SDV0alNaSm9CVU5JTE1rR2M3T254ZGVt?=
 =?utf-8?B?KzNBWUZSQlVKbXVQclZZZXJjVFZMeWFDUjlLNEpXR0R1bjUwOE5xdjB0eVpK?=
 =?utf-8?B?UjY0dFBQcmdCV0hqVS9TZ3VqTVp1bEI1OVZkME5lYmZtSExZaFA3REMwOGFG?=
 =?utf-8?B?L1Z3OU40Ti9uTk1zWkFseU9BdjkzWGN3Yk9nZXRjMG43ZVhRWDhMWHU4S0ZG?=
 =?utf-8?B?bVBKeEc4cjNSaEdGQVU1QXgzdHU0RjcrNXUxZHJ4UGJwdjZERzFDcjYyOVp2?=
 =?utf-8?B?VlJwdUJZcVE0OWgvNTR5aitENERYNmdIT0dDVjh2R3l3VWNCYklhOGs5aE15?=
 =?utf-8?B?NkNGcXEybkh3cDVyUk1JN0E0Q1hLT0FodVB3MFRsMDFSRy92aTVXR2Q3YUlt?=
 =?utf-8?B?OGcxUUk0b1Vubmh5amJxeE5mT0pOY2pWcmNCSUVhbFNYeFlDMTI2Ym9FOVdj?=
 =?utf-8?B?eVYvTy9NeGcvSGZIVjhiQWwydmdUOWRnaTlqL3lkV0YrWGlocFM3MmFWUGsz?=
 =?utf-8?B?L29uYjE0bWZHcW5RUkpvczhXVU1mM1diL3lmSFd6bnRlUFM3cC9oS2lidUxZ?=
 =?utf-8?B?eXd1K2RzdFFhUzMwWjBUS2ZsdjJ5ZnhSM2RiaHZwUkpaU0pSN203UHprakhV?=
 =?utf-8?B?R1Fjb3ZtcW00ZXJzb0Y0VzVQU3Z5RjRWd0pYVHIrbVFsTjRUbnE0bDBUQzRr?=
 =?utf-8?B?alNXaFpCVWhFelBlTVo1aStkaGw3KzZNeGF4MXdneWFWenNqam5nYXpRVmpy?=
 =?utf-8?B?YXZNQ2RhdHZDNURhK05KalZYOVpmZnBaWXBJcUlLS1Nmc05iSmVIRDB4RDhT?=
 =?utf-8?B?K0crU1RlTGMxWE1IYnRIZXY2QWhaR2NhMDYyOXF6RWFmcGNiZkR5MmlTeWE0?=
 =?utf-8?B?TXRCUXJXOU80L0N3anY5ekVDbjRjeTZTSHV2d0RYNDcrc2dZci9JMnBiK3JH?=
 =?utf-8?B?UFdlK1d5NGljek53cktlUkUxSko0YjBQb0prQ08rdEhpcTkyOTFCK242MEFL?=
 =?utf-8?B?RWI2bzRmNVpQUDRGdHlVNnFtV2VpWS94bjJudnFEbnlvbVdHbWVHQ3ljd0hR?=
 =?utf-8?B?TkxVM2pNWjAwdU0vT0wvMXZIaGJxZjE4UnFmMCtUSko4YTBqc2FERUZPOXVa?=
 =?utf-8?B?N0M5UG9mNTBhOHJoN09ZRDlIZW5mSzFGcDFTWTIzZjhQVVdWNkd1Q2s2MDI5?=
 =?utf-8?B?QlhjdjFGWjZ1dlBhcWE5N3FqRW5CS3pnbDlKN2hvblNzcmtWUEhBcmdGSWIz?=
 =?utf-8?B?SkhwVHNPNHc2ZHgyWkN6Nm5xMjJzclN0TUJtTTFwNlhHLzdVRjNlaSt1WlFX?=
 =?utf-8?B?SWgvRFpFYmQ0SThVaS8razFmNWpwZW1DNGNKUzNPZ2tJNzhNN1BUeFhrbVhU?=
 =?utf-8?B?NC9tazBlanV5VkU0ZFZXaDhTWTRhV3BiMVRITHJ2akxwTFgvWEJqTmZPTzg1?=
 =?utf-8?B?N2FoMU1tTGc2VHRMK1FaVXlSeWZyTFlPYVJCWGhsNEZvbTlVRyt0bmVtUmJP?=
 =?utf-8?Q?F2T8e4Edm3tMWTeo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b39924-fb1f-473b-662e-08decb093c8f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:09:26.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iCWYGGHYDhj63r9MfRvH9aWwxW837Aatlc/kiBxRIxAMIm6KhE1nZhiTgQe1zw+Cbd/MmZI5U1JE+BWqaYCaJuwkybESXS8odXfcQb1SYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6534
X-purgate-ID: tlsNG-c201ff/1781546970-E1599443-498B3BAA/0/0
X-purgate-type: clean
X-purgate-size: 3141
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:cody.zuschlag@gmail.com,m:xen-devel@lists.xenproject.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91AA2689142

On 27/05/2026 6:45 pm, Cody Zuschlag wrote:
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
>
> The guidance follows the Linux kernel documentation.
>
> Assisted-by: ChatGPT:gpt-5.5
> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
> ---
> Changes in v3:
> - Align wording more closely with Linux kernel guidance.
> - Use verbatim Linux wording where practical.
> - Use MUST NOT wording for AI agents adding Signed-off-by tags.
>
> Changes in v2:
> - Drop unintended executable bit change.
>
>  docs/process/sending-patches.pandoc | 30 +++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 798ecceb..79e24af1 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -195,6 +195,27 @@ E.g.:
>  
>      Requested-by: Jane Doe <jane.doe@example.org>
>  
> +### Assisted-by:
> +
> +When AI tools contribute to Xen development, proper attribution
> +helps track the evolving role of AI in the development process.
> +Contributions should include an `Assisted-by:` tag in the
> +following format:
> +
> +    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +
> +Where:
> +
> +* `AGENT_NAME` is the name of the AI tool or framework
> +* `MODEL_VERSION` is the specific model version used
> +* `[TOOL1] [TOOL2]` are optional specialized analysis tools used
> +  (e.g., coccinelle, sparse, smatch, clang-tidy)
> +
> +Basic development tools (git, gcc, make, editors) should not be listed.
> +
> +Example:
> +
> +    Assisted-by: Claude:claude-3-opus coccinelle sparse
> +
>  ### Signed-off-by:
>  
>  This mandatory tag specifies the author(s) of a patch (for each author a
> @@ -209,6 +230,15 @@ E.g.:
>  The author must be a natural person (not a team or just a company) and the
>  `Signed-off-by:` tag must include the real name of the author (no pseudonym).
>  
> +AI agents MUST NOT add `Signed-off-by:` tags. Only humans can legally
> +certify the Developer Certificate of Origin (DCO). The human submitter
> +is responsible for:
> +
> +* Reviewing all AI-generated code
> +* Ensuring compliance with licensing requirements
> +* Adding their own `Signed-off-by:` tag to certify the DCO
> +* Taking full responsibility for the contribution
> +
>  By signing the patch with her/his name the author explicitly confirms to have
>  made the contribution conforming to the `Developer's Certificate of Origin`:
>  

I've tried committing this, and both the hunk headers are malformed. 
They're off-by-one line on the + side.

Also, while this is what Linux says, none of those specialised tools
operate on the Xen repo (patches for coccinelle were posted years ago
but not taken.  sparse and smatch need instrumented headers which we
don't have.  clang-tidy can in principle be used but it's not plumbed
nicely and is hard to use).

I'm going to send a v4 which is a well formed patch, and limits it to
just AI tools.

~Andrew



