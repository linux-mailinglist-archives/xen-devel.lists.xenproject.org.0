Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CGroG1vuImqBfQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:42:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B2649678
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:42:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Tb3EwW0N;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329711.1593721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWgU-00084n-AG; Fri, 05 Jun 2026 15:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329711.1593721; Fri, 05 Jun 2026 15:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWgU-00081z-64; Fri, 05 Jun 2026 15:42:10 +0000
Received: by outflank-mailman (input) for mailman id 1329711;
 Fri, 05 Jun 2026 15:42:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVWgS-00081t-Ju
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWgS-007zJO-0j
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:42:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22ee45-5cb7-0a2a0a5109dd-0a2a450cc544-28
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:42:07 +0200
Received: from [40.107.200.49]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22ee4e-62f1-0a2a450c0019-286bc8312c3b-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:42:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB7123.namprd03.prod.outlook.com (2603:10b6:806:330::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 15:42:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:42:01 +0000
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
 b=nqlypOX4BXBkFsqGZTQk5b3BGxhXfn/LaMdXAfjOiE0r6fGLvAWkcYFBtg6mZQC6V2yn1ypafkq2XmvyiYdJwHmAlmH9z/S6W/hCPzt1IgcSuNsRWxQPd5e5qyZbeT2nFNnTjg05ghI6f4Q0VctahykDE8etziQUvk0JGqpECSxGDarAX8AVNVstToQKWtQ5/YQi/DajkyXOPY7VOHUIDAABa/EkWE/XQCZF93LJRUPWep95gmA0/j1tGtmYxiHhHWKFc7aoHo0m5VWf8LFjG0CIbofhPlnzG3SWnBfcwRa7oJp3wHfT9DIiaoY8NpAz6oHF6+4NG5gYe0mWRi2h9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6HtdCKQcnFEB1ytwfrWFEV5UAXDGaQYhQvEEm4Wz18=;
 b=eyvWXHEvcybey+JWjs1T3TaOMjwoAzAdlKUxkt6GF5yLo/vTnOlW/aLIa8QXXzSKyYQJYcgzEnuYTq8q2PlGPyL5E+mXD1s92H5o5S30wGgCYbZZ64s4YaIr2K2QwlLokIDpCyPA1fyMsVkF6ockdMpThi99aoQ2t6wS9X/uCq1kIA5rglIx/HtiwLX9jdTsNirhPGcnnq4ptAH2enkzTZw0VUK0i3sZBmHxDrDGHvUzk10cZDlCpDlR9Bd1brxsmNkrYRnpIVOi4j3bfvoH1Q5Tcag53VFVSQRmpnyolgPDsVd54bk2uS8XyIleaOb4sELZxNWJSm9KX6ZBAOdcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6HtdCKQcnFEB1ytwfrWFEV5UAXDGaQYhQvEEm4Wz18=;
 b=Tb3EwW0NGfHWUCCpyjKO4cwf+QauDoHUiQz4WFF2AQtahCBKwjTTpJ4ILRqvD4bcW3ze8ZPK0YzK+8ahmqdi/Zn/z3GbtPPMtRDq5WDEBJfsT0nRsw97rs45vI1pPEryD9Iaj6I4fgSX41KlOyzQR/dnTV1zccQwQThZ2rJv3Cs=
Message-ID: <ff3d8693-3357-4d64-8306-fb1378bc41a8@citrix.com>
Date: Fri, 5 Jun 2026 16:41:58 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA setup
 logic
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603191836.77955-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f545d59-0bbd-457a-2ce9-08dec318fc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|4143699003|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZjC0rZnqb2aQ6B48pOz1sPyqEPjRWnlCFqNNQxvF4tQQnskxQeOdtPEuuLK3rU6IPyQWmwC3DnWWv9xr1IytIxrQ8wAt7/9yDZOY4hF1dIDKpJ+cNUo6k54nEcraa8GUfPBbNpXq8eCOgVGC9U+VRgkuVtEwrP25iMiBKxYJC0aKVahxtTJBXcM2sH4PaCM6KWBHVZI4qO2aHpY/qW+qjsPeSEwyfv288lkOkFIpB7+82PqcnC8V6u3BmivgEDvmZ2hCx6MR1OiDCXtglFajmDVJMukhAKfrwi0MHXDgovPXjdfssVzpGdO1YVLyltg3u3EFEKU3hvON3wtcnCs7ILnoLR1eCHAXi49WsWsEz6lGZUEjJRw4N94Z9XtTO7to7JV3s6vDUgYoDzsLb7oRge2vI7tZch95Q+Ac0zwpVKpU0E9IZP64311MSCQ0gV+pekXZySyoXD3v+v5scwCnbd+YbX29A64g36o/jXeA5B2iyA7UbbEpZHfggOomSHE2hQy1rsL9J/58P3N4vsTzzSrUxovMIYhSU/xQB4UO5ojoQAZnLiNp4uRwla/h5nn88Ys9J/QGaLLagPo/a9dccO11quLTAjBL3NvxBhuCP9CI9UKBFeKlSGRruHanFQCOBIhP4x11AaRBiiNgNPiz8KxxFxVkBovyHUu5aGh3tKhISoOiMrcz41wurj+ZVW5n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3pkcFBETTcwZUFUeDYzWlZKUUhLazFIOFd4cDVCTXBja0tySVF2REVXNW84?=
 =?utf-8?B?aHJxYWJlYUg5SEpycmowd1FtVnNGWDM1aDN4TWdxUWoydkhQbkVxVHMxV0Vp?=
 =?utf-8?B?MzlzdG1ZelI2YWhCU05XWWxFK3MrK3RWWTBzOEtMeHp6Ni83cEIwak5DQ3Ni?=
 =?utf-8?B?SG5YcXpkM0JKZXpWNWk5Rnh2enI4RENRTFpKZFNUbjg3TDQ4Ymg3b3I4Qi9x?=
 =?utf-8?B?UWdmMUR4MUVmeEFzL1N0SEh4dEduNUlvd3hpeU05a0Y5NWNuVk1MNkJ0REV5?=
 =?utf-8?B?aUxjV29uK1BNTkgxTzJ6VFhTdUxYc3A2eE0rNjNQeFRUU0FYenpHNHBvVjVR?=
 =?utf-8?B?ejlMdHJmVG5qcCs2Qm1QRlR0QmhBejBtcUE1NXRzRDRCM1JwQit3bzV2Qk81?=
 =?utf-8?B?NEExamZ5YWEyTmRveGtIWHlCbXZqUlc4WFhYNlNhNFZkMC9VOGlUVlJsVXZ0?=
 =?utf-8?B?MzNqN29zUkJidFU1QzRWZUp0eFl2ZzQ2UCtoNCt1bDNMNFh5TnRCeklTRW1n?=
 =?utf-8?B?SnZ1R0x1WjAyMno5YUlZbitNTmcrTTVSVEVadVJrRXdDUWdVWlluSE5aSEJW?=
 =?utf-8?B?L241eDh4K2xoeTFaZDZrT0N3Z3crYXZ0UUN1dXZvbWxPeDNTbktlOXc4M3Bw?=
 =?utf-8?B?WkFjdkVIcmFUYlFxRzM4MUFRV1NVWDg2NXg5S0FTakpqTlo5aDByQTdHOGNy?=
 =?utf-8?B?bVRlNzFoQlRHTFBSeFBHM2pLY2QvWHZWV0Y0bXpjVG4ycXFDbUV5NnNua2Zj?=
 =?utf-8?B?Mm5UM3Q5Z1ZSUk11S2tqNks2VHJ0VkN2Q3dSNEp0QUxNNkQ4SFNNZkY1NEV0?=
 =?utf-8?B?TDAzTXVYOEZOM3l3RmEvTy92ZU41NkxhZW9rZEtHTGVXdGVHVjNhVmJ0Q28y?=
 =?utf-8?B?RHVQQnBHOGJseDM0ajNUV1hzY0FYNGZoN2dmdkRRbGVSVUE2QTVCZWZJbnJ6?=
 =?utf-8?B?VldRM2VSZUVnYWhSR2tsYTZBK0pqZC9WeDBtcnRwZkNKU3BSU1haWkc4TE43?=
 =?utf-8?B?V1ZXUFZmMnpIS0x5ZGRaYlFUQ0lQZDFoa3BjMVBRUzdiS2k2NTcxRlM0eFR1?=
 =?utf-8?B?aVhZeFNTNTdQV241ejJmeklWbU9Nc1lMV2lKOHVnSDQ0WkE5Z0F5S0tuaGR6?=
 =?utf-8?B?S1ZGOHBGYS9RTzVCWHp6bUJNbW5TbXBNeGoxV2FSMkp6QysyYld6L2g4M012?=
 =?utf-8?B?TW53UGdtNnVhYW9TaFh2cEVrWmMvRlBKSzlUMjZZK2pIRTMyWG9yR0RoaUln?=
 =?utf-8?B?SytFN0hsclV2ZlNKWFFsTDh1Wm43QmRnUitrcmcrL1p2dDhpOVRUYm1JTU5t?=
 =?utf-8?B?Sno4emVhVXBuVzFDbXNib2UycEM1MkRubmtSU21NeXBxdHA4L0lxYmJjME1k?=
 =?utf-8?B?SDhHYTFwdGZWMkUrd29FZDBuVDBrSHJIV2N5SnlVK29CbTYva3BZdGZsYjRK?=
 =?utf-8?B?ak9RTlhmcldnTnpFKyt6SkJDL2VGTUZsZEFXWFNsOVVNVSt4T1NselRHVjk3?=
 =?utf-8?B?Z3E2T1Z4WUpwVEZhRWt4ampuQW9KOHF6ZHhaZmtOeUFOU3Y1QlNxTGZzM1lt?=
 =?utf-8?B?YmY1NjdYYUp1WCtXalNlVmxkTm0xWDhDZGs1TTJJemNlaUZYKzBnc3BqVHBL?=
 =?utf-8?B?cVhhV0ZVQ3dhUURaNkNzTVdVSmllV0lsZXFSTlQ3MEJ3cm1PclJGNkNPbk1k?=
 =?utf-8?B?MEhTZmJTYk5uK1NUb2VhTm1xaU96TVg3MkVxb1lvVURTTEVQNzM5M3JycXFG?=
 =?utf-8?B?dmNpRVFteUdrOGJaN29HdW9Ddnh6ZjJCSmNKMlhwSUpIR1J1bmRER29GVy9P?=
 =?utf-8?B?S0x0dnMyRDBsRS9IRFQ4RER2RE1sUlRjQnc2RWhvN05Id3UwaFA2Q3l0NnR5?=
 =?utf-8?B?dkhjb3ZhcW1pZzJTSDRCeUJMZGpYUFgxT3VKYVVJOVUzd1B6MmhuZ0o1Y2E5?=
 =?utf-8?B?cmVSVTl0S1lvZzM0eVowTDhUVzM5SXZYQVA1aTUya0NwUFQ1eHhDMmVZdXNl?=
 =?utf-8?B?eXZUU2xzSmc0QytSNEREUWxuV2s1UVB0VlVOV0Eva3NEQjExaVRmTENLT1ds?=
 =?utf-8?B?Z3RpbzgwQVJSNVdVakJrUWJYM094Tlk3OXhlbVNCTVBWVFVTUkV1SjlycjM4?=
 =?utf-8?B?RVIwTFJxK2xXYTM2UnV2NllXOWZ2ckpyVGxIU3daVXowUG9PRnVqYTRwVlJi?=
 =?utf-8?B?eS8rVTk5OEEzelBNTGJVdzFRRnQvS1g4R2RnSG0xaXdQSU1qbUQwNDRkdWFM?=
 =?utf-8?B?NUMxQ2xGVTRic3FNVzhVYVdsQW9nNU0yQWUzWXByblp1UXFsQ3IvTWNtQlR0?=
 =?utf-8?B?WHpqQUsyK1dvVnpIVytYZFB3Z1VnUlRNVmVaY3V3VWZQc1V6OEJLc0FFek9I?=
 =?utf-8?Q?mA3wpbiNua3fE1dc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f545d59-0bbd-457a-2ce9-08dec318fc5b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:42:01.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x80hSIdGkItZDaUG5zFJjVhydrw0TtYMyellqMXhB/jByrbqzZ3pYcUGZwd2FdrRZF1+eG/kYICstaRHnIvHvaukAkQkXjfxmQ8Ybbc7GWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7123
X-purgate-ID: tlsNG-d25034/1780674127-E2577CF5-0994DE29/0/0
X-purgate-type: clean
X-purgate-size: 5336
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD7B2649678

On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
> diff --git a/tools/tests/numa/harness.h b/tools/tests/numa/harness.h
> new file mode 100644
> index 000000000000..9eec77f31402
> --- /dev/null
> +++ b/tools/tests/numa/harness.h
> @@ -0,0 +1,184 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for NUMA setup.
> + *
> + * Copyright (C) 2026 Cloud Software Group
> + */
> +
> +#ifndef _TEST_HARNESS_
> +#define _TEST_HARNESS_

This is overly generic, and liable to break if anyone copies it.  Maybe
NUMA_HARNESS, or WRAP_XEN_NUMA because ...

Looking below, how about naming it wrapped-xen-numa.h, so ...

> <snip>
>
> +
> +static inline bool arch_numa_unavailable(void)
> +{
> +    return false;
> +}
> +
> +#include "numa.h"

I presume this is the real xen/numa.h ?

> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
> new file mode 100644
> index 000000000000..bced68d4d7f1
> --- /dev/null
> +++ b/tools/tests/numa/test-numa.c
> @@ -0,0 +1,222 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for NUMA setup.
> + *
> + * Copyright (C) 2026 Cloud Software Group
> + */
> +
> +#include "harness.h"
> +
> +static paddr_t mem_hotplug;
> +unsigned int __read_mostly nr_cpu_ids = NR_CPUS;
> +
> +#include "../../xen/common/numa.c"

... this has 

#include "wrapped-xen-numa.h"
#include "../../xen/common/numa.c"

which I think is clearer to follow.

> <snip>
>
> +int main(int argc, char **argv)
> +{
> +    static const struct {
> +        struct mem_affinity affinity[MAX_RANGES];
> +        struct mem_range ram[MAX_RANGES];
> +    } tests[] = {
> +        /* AMD Turin system. */

I'd suggest /* From an arbitrary AMD Turin system */

Just "AMD Turin system" feels a little as if all systems are like this,
which is absolutely not the case.

> +        {
> +            .affinity = {
> +                { .nid = 0, .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
> +                { .nid = 0, .start = 0x000000c0000ULL, .end = 0x000afffffffULL },
> +                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0c04fffffffULL },
> +                { .nid = 1, .start = 0x0c050000000ULL, .end = 0x0fc4fffffffULL },
> +                { .nid = 1, .start = 0x10000000000ULL, .end = 0x183ffffffffULL },
> +            },
> +            .ram = {
> +                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
> +                { .start = 0x00000100000ULL, .end = 0x0007590ffffULL },
> +                { .start = 0x000759d1000ULL, .end = 0x00075a0ffffULL },
> +                { .start = 0x00076000000ULL, .end = 0x00094c73fffULL },
> +                { .start = 0x0009b5ff000ULL, .end = 0x0009fff9fffULL },
> +                { .start = 0x0009ffff000ULL, .end = 0x0009fffffffULL },
> +                { .start = 0x00100010000ULL, .end = 0x0fc4fffffffULL },
> +                { .start = 0x10000000000ULL, .end = 0x183f7ffffffULL },
> +                { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
> +            },
> +        },
> +    };
> +    int ret_code = EXIT_SUCCESS;
> +
> +    /* Dummy firmware interface provider name, use TST for TEST. */
> +    numa_fw_nid_name = "TST";
> +
> +    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
> +    {
> +        paddr_t min = ~(paddr_t)0, max = 0;
> +        unsigned int j;
> +
> +        numa_reset_state();
> +
> +        ram = tests[i].ram;
> +
> +        for ( j = 0;
> +              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
> +              j++ )
> +        {
> +            const struct mem_affinity *affinity = &tests[i].affinity[j];
> +            paddr_t length = affinity->end - affinity->start + 1;
> +
> +            if ( !numa_update_node_memblks(affinity->nid, affinity->nid,
> +                                           affinity->start, length, false) )
> +            {
> +                printf("Fail to add NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
> +                        affinity->nid, affinity->start, affinity->end);
> +                ret_code = EXIT_FAILURE;
> +                continue;
> +            }
> +
> +            min = min(min, affinity->start);
> +            max = max(max, affinity->end);
> +        }
> +
> +        if ( !numa_process_nodes(min, max + 1) )
> +        {
> +                printf("Unable to process nodes\n");
> +                print_ranges(tests[i].affinity);
> +                ret_code = EXIT_FAILURE;
> +                continue;

This is mis-indented.  Best double check the whole file.

> +        }
> +
> +        for ( j = 0;
> +              j < ARRAY_SIZE(tests[i].ram) && tests[i].ram[j].end;
> +              j++ )
> +            if ( !test_paddr(tests[i].ram[j].start) ||
> +                 !test_paddr(tests[i].ram[j].end) )
> +                ret_code = EXIT_FAILURE;
> +    }
> +
> +    return ret_code;

This is fine for now, but we're going to have to consolidate the
patterns eventually.

Do you have a Gitlab CI run with this passing?

~Andrew

