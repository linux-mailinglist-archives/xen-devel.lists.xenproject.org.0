Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6w5Mnn3O2pMgwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:27:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C96BFA3D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=l5sUAla0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345124.1604117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPVw-00053t-Ci; Wed, 24 Jun 2026 15:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345124.1604117; Wed, 24 Jun 2026 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPVw-00051J-90; Wed, 24 Jun 2026 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1345124;
 Wed, 24 Jun 2026 15:27:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcPVu-0004zL-QJ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:27:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcPVt-00GAuw-JM
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 17:27:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bf75d-bab6-0a2a0a5309dd-0a2a4507e568-42
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:27:41 +0200
Received: from [52.101.56.65]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bf76c-9c8e-0a2a45070019-346538412559-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:27:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8362.namprd03.prod.outlook.com (2603:10b6:408:35e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 15:27:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 15:27:37 +0000
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
 b=Zpb+8f9INtW0oONEZz6HyeuUsCDAAGSVFOuMk9nG5TFiBpIXdS3QJo3kT/XdZjTOG4A3s0MqI7tyUrEN85jx8VK6AIlN5N+hzCKmPuNOgEJUPhfKEQOreR1ShMql2zMjTAFFqxjDTF50FqgTVL9ugx2xYqOyfIIM5/3tBm7CmBT4A4C8Qz8bTDTzQJ2KxWpnH9BzlA1QnQ/oP4VMxX0yr6fp4INBCZHje+OaThl8/eebG7LODDjv1GLaWImZYAPiRN/jeg954sOdxTkkXD4vwiPEjnezHEj4olW0exGrzq8gGP9RMKeHrjzohJitLG+oNH8GieVFx9to7XA36Ff0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73JX4tRxghNd3KEwgvLBsm7nuoIDmN3JPk0jqpOng2c=;
 b=Nk8fREabU6CxqotW4/PlxmAWTXyfamqe5lS1Erxn1GyhrqBn7rJorBop7c1f/qxPqbNsfVZIRkvExLH818n6+sYfWWyVbcVmek/+9vdjnj+Fyw8j8qSHeHM77HuYr89bJC1lL6MRv4HcRhTos9OccwrjIbISGvT4vLG68xc94poU2/wnExEVY63FCfZWtCK/qkvZcA7wTcVXezq67K/K5gSKGxN9GdN07z17F5qasMXFJQXz8HoofrWoPMRup8+R7OaK2q/t8xoENDRFKNdBWWP8iKRJQQyyrrsER6GmEP3CGOSEJLpMh9iI11P7fpLOtcla+NJwYqMSkhVC5p8BTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73JX4tRxghNd3KEwgvLBsm7nuoIDmN3JPk0jqpOng2c=;
 b=l5sUAla09AMu/VgaFq784hvylNNA9TQZWACgJ+juB6M93E97K5ilj4l2UVIrbxRPBNHMbfGROPIPsXZJGkgPcV/wiOSIk+kIHForP54mKGTmYlzprIleLO/kfjSacnFqCdaVT9jBeOG+V/2g2yFZGPtsvHB5WWSny60dn5sIeUs=
Message-ID: <5a12fed5-3cc8-473e-be54-d7965139a662@citrix.com>
Date: Wed, 24 Jun 2026 16:27:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Jan Beulich <jbeulich@suse.com>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
 <0e964293-5b38-4f80-be78-bda76706d0fe@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0e964293-5b38-4f80-be78-bda76706d0fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8e6c09-1f17-451a-8fb2-08ded2051f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	091ay3WatEhYdn3X5i9kShi6krjLqRS4KwSzfZAeT4pbg1jPMHjieqoI4RoCmH9aPwxKT5G5neqnjr5zqxV10VqMmgVIcLzXJcVVc7IpXRzUtFeairRVM6I2hIgJbVjuwHs33sxGHbUNOvb5CC9Xh2gX2oKiBpxwPilBWo8XtpqWlLLZqGdBmz4XxE/9qcph3aBj4qTv+bDDlTqWWoqbMF1lvlQ7V+cnAx0+th7GUGp1fiz0sAZvRsYMU/jiv0v4SP8GFJQUEffb1I/mk36YNx48Dpfcfda3NistBZhQhSvHhobt4gCxEXHTwvPK507R/8HxUrGbYFh3tFaWF+JwqjgPhQ2IvXG24LhCxHhfC7jxJjLZKScNaIsSvZn4yBCGc63Dx3UlkChoH/dbx+Ah7zRYDOr0D+YHICWgoOS+FTxrSSfHQAsbMSSVP+31ZsIkcTinyBMXvOS1BaeP/ANgRUKGTzP1B/+ovPBIh/uVG1VxotBO+9xXiihRmPDohX/GcF96LGKVvynLhxLoZNJzr7dYVzRcIEE5U1B1VsoIt0nwwlnlCwEqyOI7Cu5NGWm2PoY0WatRrIZEWNGRWXCpYHgVpit1d+OjqmOYRlNLCHtxAUpDgGdtFIX66ElqymPgCjCXjhgfqGIY42wt+MI8fgJZMv0iLi+72cqyPQP0m88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEpWUUpZeUt1STJpU05aM2lUK241MWJha0Nua2FOWndQbmMzdGxuQUNSLzI3?=
 =?utf-8?B?Vnc5dVBId0JHa1pnZkF1cDZHcFVqNXpsUWFmbFczSU5vR3gxcG84TW9TMThm?=
 =?utf-8?B?b2lzODhPemlSV0ZmYlR2dFNQQm9lUVR4V01kQkZSSmJYRWJKcUpNRGlnMlFy?=
 =?utf-8?B?TU5YcndrZ0pReDN1aDc5dnM0ZnJqaUNlUFZYUGt4LzhuZXdGMEJjL1M1bTNF?=
 =?utf-8?B?MUhoUWRLN3RaOWhIN2dCaFRzWWh0UXFvMEg2S0Z6SXlSMVltcktDRkQzaTE4?=
 =?utf-8?B?aTgzekJSVEJZWWdpOHd4NEhYUlVXUXdQVk91a2lvTjN2ckh2ZjE4QVlsWEpG?=
 =?utf-8?B?VTNhQTJmVzVEN2k4OGZTWk5LbWJRWlVTS3MxOUFvaDZ5RDN3VUhqU1Jqc3Ba?=
 =?utf-8?B?aExjeE1lSitTL21kUjhFYjlKV3dWNjF6VlE5bmJJOFM5R2JzMTB3eTZQVUk2?=
 =?utf-8?B?OVZheHZEK2Z2TlI2RFNaN3lsbFh2aWhneFRRV0hjWFdxNXdXdjUzejBSdGNr?=
 =?utf-8?B?bHlBb2dka0EwQXZHMit0S2ZHa1hqTE1LUGxlTlBES1UrMVpQZGZMMFFwWlg2?=
 =?utf-8?B?QnZCSVEyWGVOQ1pCVkVXa3JXWmJMN2s1ZGpFZFVQQnpmYXlqSG5PYS9rYVJi?=
 =?utf-8?B?a2xManhZeTJuSExVelVHS1hqN2FwZkJ5VFl0Y0VtU2F5RUM2R0R0dDA5MXpp?=
 =?utf-8?B?dWZxK3FGa1c3WE56WVlsYzNJa1J6Ry9qeDE1dWVGYjV5RnorNHFYNXdDeUhy?=
 =?utf-8?B?UEp5WjhJUG1RWDZqS2FLRE45c1c3Ymg0V3RRaTBUSTlwZS9OODhyWkV2Mmhz?=
 =?utf-8?B?anVVOSswdTJQTkp5VHdSNlVFcExKbGcwajQ2SnpYU2NSYVUxbWI5V1VvTFJn?=
 =?utf-8?B?RWZmNGU4emlTYTdzVFRFRVcyVUtsRE5zenRVT2g4QmN3bGIyNUhyUysrWGVE?=
 =?utf-8?B?ZHlZVVQzZzMrYm9DamlHTFc5MmFvUHdZTVhJM2xLS2gxbXhhR2xxaWhnUHN0?=
 =?utf-8?B?cTRnay9XakRkMml3SXhKSEhhSXRTQlR4dzlYdDBQY2YxMkx0Rk9yTHFYWEVs?=
 =?utf-8?B?TDkvVWpLeFBkYUxlNWxxeGxOOGZXRDhEL3pNRFd4WTRMUW1FSTB4bTJOQm8z?=
 =?utf-8?B?SW02d3FFSmtKV0lXaERsWVZwSTFkWThGRUJmMkQxZ0tpSUhrajdMTjZ3ckdh?=
 =?utf-8?B?ZW9FWjV5QksxYmt6L09Ha1VHN2dTdWJMb3VOdHpBcWZVUHhlOTV2RWg4Y2RX?=
 =?utf-8?B?cnNSMW1aK0U0R0JYK3hTaGpJbkE3UmZXOTM4bjhSRk4zbXdCT1k0QVVtRXp1?=
 =?utf-8?B?VklyQVVIdFZvZGdTTi9HOFpuTmQ5Q0VhK0JFNGEwQ1VsVno3M0F6TmxQWHdR?=
 =?utf-8?B?aU8vaE5QZGN5MmpWNmNKYkdxSXNnR1ZjbnE2UFlOR2xVR1ZuaVpLQTdUK04r?=
 =?utf-8?B?S0U3aFVYKytSdW8zWUVLb1lIRUZuM0Q3bVZXWVlEVkJ3YVFTSDJodUtnMUlI?=
 =?utf-8?B?UCtRcDNsdWhiTlo3NHRQSFhleW9kTDRjRUEvWEk0Sm56aWNFcEZaZmFGcFJQ?=
 =?utf-8?B?UTN5NlJjSU9Rc0pDVWVtUERHVXcvU2ltMXFLdjdYSytlNFFsK2FzU3kybU0y?=
 =?utf-8?B?aE9KdG1Cdnd5Q3Z0a3RVSjcraU5ZZTROaWc1aHhrWUxPWFRnMktUbEV0TnhG?=
 =?utf-8?B?eHdrRWxnSWdvcy9HRVB1aWMwcjljWEVRV2dTbU1SQ0NBSGFCcGxHZXE1aTM4?=
 =?utf-8?B?eUF5UXNna1B5L3luWVk1V1kyVjMzNWFRdDlhbEMwYjFCZlZDcktpaE1DdFRv?=
 =?utf-8?B?RC9TNUJFV20vQ0xUcW1FdWM1RGNuTlI2ZHpTUCs1NlJBUkJPSHR2YlZoRnY0?=
 =?utf-8?B?TmpzY2pvV1dNN1VMd2R4eGYrdWhrQng4U3pHRnZaSlhEK0dUU0pyZXh1ajNu?=
 =?utf-8?B?d3NFZUxrdGVyeTduaHdqMllYZkZTaERONDA4UVg4L3pZQnVJWUdTbU5mbERN?=
 =?utf-8?B?QXRhalNZZy84NUtiU2FRQW8vQ3RkaHI1RVdFMURqYmF6QkxvSDl1Z3c5UVhs?=
 =?utf-8?B?d0Y4UGZTVnh0dElpNW00V2h0UHFtc3AyaElDc0NrTnRHcUpaY2FuV1VyOU5v?=
 =?utf-8?B?Wlg2MDlqSXEvVWtmeXVWMVduQUhrbWFnMmJMbE8vZnRMSURNTnZUOGRzVnlh?=
 =?utf-8?B?NUpqOTBMWUJEempSb1llUFZ6OThPZTlwTWt2TC9udHN2U2NIRFpsb2VrRFVF?=
 =?utf-8?B?dEd0bmVzeG90M3hlRHJmSEgzeUxJdkVZOGRJbFpabU1VcXAvOUtueWluaHVF?=
 =?utf-8?B?YktQR3RvUGx4YURTUjQ2OEVGKzVIZTRlRENvVzE1NmM1WDNmZ1ZZaVVuN1M2?=
 =?utf-8?Q?xdBrpnxdcraidyrs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e6c09-1f17-451a-8fb2-08ded2051f53
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 15:27:37.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAOct3SkgsQakflKdvtKsp4DRWQtJWECCP7cZifG3x+SCbmqigAqPEvh8Ft/HnRy51kAx/aNs52vt8ZRN+XM400cwiRsBqZ3SJOU5fL3z4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8362
X-purgate-ID: tlsNG-ef75cf/1782314861-7C52825E-8A1AF0F9/0/0
X-purgate-type: clean
X-purgate-size: 5146
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
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 271C96BFA3D

On 24/06/2026 3:43 pm, Jan Beulich wrote:
> On 24.06.2026 16:23, Andrew Cooper wrote:
>> Returning from an NMI which hits guest context needs special casing in FRED
>> mode just like it does in IDT mode.
>>
>> Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
>> entry_FRED_R3() also.
>>
>> Expand the comment a little, and invert the conditional jump to
>> compat_restore_all_guest() to avoid needing an #else clause for CONFIG_PV32.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> provided of course ...
>
>> Slightly RFC, not tested yet.  (My AMD system takes an eternity to reboot)
> ... the results of this won't prove it wrong.
>
>> For 4.22.  Found during testing of FRED.  The consqeuence is that we can end
>> up scheduling while still in NMI context, after which things like the watchdog
>> and other diagnostics don't work properly.
> May therefore want a Fixes: tag (it'll also want backporting aiui).

Ah yes, I'd meant to set one, but forgot.

Fixes: 87cfcbe9f0b5 ("x86/pv: Guest exception handling in FRED mode")

>
>> --- a/xen/arch/x86/x86_64/entry-fred.S
>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>> @@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
>>          GET_STACK_END(14)
>>          movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>>  
>> +        /* NMIs need special handling on return to guest. */
>> +        movzbl  UREGS_ss + 6(%rsp), %eax
>> +        and     $0xf, %eax
> As you may be aware, I'm not overly happy with such literal numbers. But
> well, alternatives look a little involved. So just a remark, not a request
> to consider any kind of adjustment.

The 0xf cannot usefully be anything else.  It's the width of the event
type field in a FRED frame, but you need to visually see it's less than
0xff or the switch from %eax to %al looks wrong.

The +6 can't be generated by asm-offsets because the infrastructure
doesn't work on bitfields.

>
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -146,6 +146,35 @@ process_trap:
>>          jmp  test_all_events
>>  END(switch_to_kernel)
>>  
>> +/*
>> + * When returning to guest from an NMI, we must execute an IRET/ERETU to
>> + * re-enable NMIs, and must not process softirqs which can e.g. schedule
>> + * rather than returning to guest context.
>> + *
>> + * If a softirq is pending, send ourselves an EVENT_CHECK IPI to compensate.
>> + * This will cause softirq processing to occur upon leaving NMI context.
>> + *
>> + * %rbx: struct vcpu, %r14 stack_end
>> + */
>> +FUNC(nmi_exit_to_guest)
>> +        mov     STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
>> +        shl     $IRQSTAT_shift, %eax
>> +        lea     irq_stat + IRQSTAT_softirq_pending(%rip), %rcx
>> +        cmpl    $0, (%rcx, %rax, 1)
>> +        je      1f
>> +        mov     $EVENT_CHECK_VECTOR, %edi
>> +        call    send_IPI_self
>> +1:
>> +        /* For restore_all_guest. */
>> +        mov     STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>> +#ifdef CONFIG_PV32
>> +        mov     VCPU_domain(%rbx), %rax
>> +        cmpb    $0, DOMAIN_is_32bit_pv(%rax)
> Would you be open to a little bit of trickery here while you move the code?
> The low 12 bits of %rbx are clear, so instead of $0 we could use %bl here.

struct vcpu being page aligned is a convenience not a requirement.  It's
hard alignment requirements are 32b and even then only with CONFIG_SHADOW.



>
>> +        jne     compat_restore_all_guest
>> +#endif
>> +        jmp     restore_all_guest
>> +END(nmi_exit_to_guest)
> Much like you flipped the Jcc/JMP here, ...
>
>> @@ -1209,25 +1238,7 @@ FUNC(handle_ist_exception)
>>  #ifdef CONFIG_PV
>>          testb $3,UREGS_cs(%rsp)
>>          jz    restore_all_xen
> ... how about also making this plus ...
>
>> -        /* Send an IPI to ourselves to cover for the lack of event checking. */
>> -        mov   STACK_CPUINFO_FIELD(processor_id)(%r14), %eax
>> -        shll  $IRQSTAT_shift,%eax
>> -        leaq  irq_stat+IRQSTAT_softirq_pending(%rip),%rcx
>> -        cmpl  $0,(%rcx,%rax,1)
>> -        je    1f
>> -        movl  $EVENT_CHECK_VECTOR,%edi
>> -        call  send_IPI_self
>> -1:
>> -        /* For restore_all_guest. */
>> -        mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>> -#ifdef CONFIG_PV32
>> -        movq  VCPU_domain(%rbx),%rax
>> -        cmpb  $0,DOMAIN_is_32bit_pv(%rax)
>> -        je    restore_all_guest
>> -        jmp   compat_restore_all_guest
>> -#else
>> -        jmp   restore_all_guest
>> -#endif
>> +        jmp   nmi_exit_to_guest
> ... this
>
>         jnz   nmi_exit_to_guest
>         jmp   restore_all_xen
>
> then allowing to fold with ...
>
>>  #else
>>          ASSERT_CONTEXT_IS_XEN
>>          jmp   restore_all_xen
> ... this?

This makes the diff rather less legible (and specifically, far less
obviously a "break out"), and changes the configurations that the ASSERT
lives in.

Perhaps as a followup, but not in this patch.

~Andrew

