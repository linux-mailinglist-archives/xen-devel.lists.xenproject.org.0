Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6P25FFbaJ2qY3QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:18:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C265E3A1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dzhIsjxv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332543.1595001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsaz-0004lD-Q0; Tue, 09 Jun 2026 09:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332543.1595001; Tue, 09 Jun 2026 09:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsaz-0004id-NH; Tue, 09 Jun 2026 09:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1332543;
 Tue, 09 Jun 2026 09:18:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWsay-0004iX-PH
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:18:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsax-0076bG-Uv
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:18:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27da43-bab6-0a2a0a5309dd-0a2a45018876-34
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:18:03 +0200
Received: from [52.101.52.20]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27da4a-c1f2-0a2a45010019-3465341451bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:18:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6865.namprd03.prod.outlook.com (2603:10b6:303:1b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 09:17:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:17:59 +0000
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
 b=wvzixkitI3SSlo0/9qykDF/cnx1Yz5VEESUYsI8aIxShgZug/tO9sa/2RvILjVhrdJJzhMyzxi75dLoAkcW05febPSxNWpoWLhoa5/LflP6vz5mgLFVXWcKgPYngDI/ZjtrYqexUDrpvmEokylBs4MsuzIGX+994Gwa40B9heNWN4ty5kU2nHJoUtEbcWITeAZ+4ylMOwmNgNQWNHTI/VpGp+Id3X5tp4Uufb/Fc8T2t6YJ8l50EutRhyMwIqAe7t5Ezxx7JK/qmX77mLnzDRmBi/mpHx1CiR0XXdrmgY9kcEiASgbEiB6UQh9R+2A1X/bAmd7hee4kdIwDNZf3D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CdTgCBR7FdgIli4m+f4o6v9BH+fQWPjKko/xoguHYc=;
 b=MM2JXPx5fyFz/G2WjbxxNa2eGYL87KKSbHnorp5llWK6sL8DFeDE2yl5oJpEDUO0qQo3/q1U6NlwLw3350gEQVcO4dvrCOn1UaqLthwXN/u/XTUZlr5420JYunNJ4KNu0hi9nk9QzvX1WEMA4Cj5Wrn3yORbRY55ArL0FC4VJLi8Uw91ldderInC5Uyw/G7m12klfSYIM/u3PVCrmi/etB+Ktxr1jGVZ3gK7U46spr3XobSAMA53ueRGd9UNg8yBAM90lv2thc5KINLX8eJThyc/S5F8EuCtv+JFrCWYTED/i5EpGkMa80D8Eetj4zh39WDnT+8nFA/0FRNcRyZW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CdTgCBR7FdgIli4m+f4o6v9BH+fQWPjKko/xoguHYc=;
 b=dzhIsjxvg6ROmgfx7Jnh7AphdWduih778ZXhS4bZ9pr3KRw+4N1JjKxUNnntibhnlv3S4LHq3q9Zf+8pVqzjIsBc+XCGebptE1gaYoSOeaJwLnfOMbaH4bmf4oKaPtP9zipVXN8DoaO/vmXSU8Aw1x8mGPCWeGyt/8/44BVcfM8=
Message-ID: <b9100e44-b694-473d-a074-5a4c4851e86d@citrix.com>
Date: Tue, 9 Jun 2026 10:17:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask
 calculation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260609085322.92856-1-roger.pau@citrix.com>
 <a0cfb079-653f-4c06-8004-017c7f60ffee@citrix.com>
 <aifZjKqOrIosqles@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aifZjKqOrIosqles@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: c81a100b-2f6c-46ca-3a16-08dec6080002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JqFPLQVSvDT5pvSriFl7zhIPjgaajKJGs058zyEDfmaHCT0uSnGU8VP/Z8/HmHsWW8ttGOvMiNTI0oL/IB/p55Mv2aox2RJyRS9KuKcoPxhI1Sy0NJhMXRHPJ/oNaqwsDwx2OZdE2yfEzta+5kOq6C8f5sXlForsOXs02CXMKIWz8pkpBx4k9GkDgB9rMDSlfRLqpHrsr/N+RzFkK74V57yEpmBdXyGYoBj0rgtG/lvvquPL/V7E6Ska3Plom5/vrFBjihGOYQ9Ol1kA54aK+fy5s58VyNzYq5QZmUXnJDHqdpuSPyoI1tgAlo1IwKPzfzH01wPy7Fa5TrWH6UMd+UTtFgPCgNTG3+1d+sJDttBkXdhL53WaUuRYWv4PmD05RShy6+LdgpkXomaKGiI3VeSyqL1gJWutm1SUoHdq2bv7vhyGHHIVta0f48hGu/HteN7bwWqIadUUz+QaQCzyvNesi7rrHDP0rznV2ICykGKcBvoDKfUoWlcuuGiKbFxPhALDj5C4RJgMMadrpK0skZ9sDy+jaqtexMok7jdAEymoOhyFojsA7mH6rxm6/+eNVaMBDjnc8tvEeqLW6KsKSLYz/QKk0ZFb6BuIs5O1tsLwGGUk1GXjMyW7sc7TR8XNYY2FRP5wTzAFl+r3EJo7ta9ZCyCFktiCNsFn6DQHb8HrhOUqWIOXlAhSw4UEJq+f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFVqdlQrWkh2ZUhqT2daUlQxZzZtNytQaGYxTmI3Q2hIdUtFUG16TEV2T1ly?=
 =?utf-8?B?SVdzNW5ZbmxlR3ExaHlnd0haVVhtblJkS0g1bUpneDVKYU9BZTFocHBOUllF?=
 =?utf-8?B?QXRMU1hFbzB0ajZrWmhCbjM3M1NYNHJWZHVESXFpZWZKZFBmcG0ycWR3UDFY?=
 =?utf-8?B?ZitOTTZ6bnlBSm8yWE9zQVg0WnlTR3RIUjRoaXdaRUR3bGhkNVJGZDAzMGI0?=
 =?utf-8?B?TEY1dm1VUjVTWUJ5WmZ6aGZMaEVMU28vVHNFVTZzcnRzU1p5aGI3b0t6U2JC?=
 =?utf-8?B?cUczQWIySVlIUnZqZWpwNkhrZEZsNG4rWGNrQVhUQ2VzVjJHZEFYSXYzaWd4?=
 =?utf-8?B?UHZTUE9MTlNFMkF2MnJUc0g4SjBsK0lDbFpJZkpoNllheGQ3M043QWZlbnla?=
 =?utf-8?B?VFlMQ3B4UGw5RUppR3FSa0pBOEUvdlFCOURrMlhWY1JReWdXcFJncWZ4NGt2?=
 =?utf-8?B?OHQyN2ZpRjRUWXlxM3VBUXFsN1BORks4Q0M5RlQ5cmMxdjJxUG4rVE5Md2F4?=
 =?utf-8?B?S29UeVkyWjYxV0hqd0hJalk5cm5iUGZHWDBHVGo5R3NTamU0RkFFajVrK284?=
 =?utf-8?B?cU9ER3pwNWt4R1dab2ZlNC9MeXR4WHZVQ2J1SEU2T2loSFNUUEpNVEVKS09G?=
 =?utf-8?B?M0Q5VXdZS3M4TjZZbEFRTGRGNzVnQW91T3Vua3c5ZjJFNXRreHJ2NUpwakVs?=
 =?utf-8?B?K21Bakl3UWFLdHhaWFcxNWFMYUF6UmZqNFk3dnF6T0R6cVhRVktVWDhMSkJP?=
 =?utf-8?B?M3MwUmg3dk54c2ZoRnMrc2lFaDI3K3BzeWQ3b2puMkY4MW53dW9JbUk1ZzBa?=
 =?utf-8?B?ckxkZnNFRzQyMFBqWWUvNzRPbTdFMUQxUzc2Zm4vR2I3bmdncDhkL0pOSXFy?=
 =?utf-8?B?UTRxUTF2TXF5M1BjUHJOaW56d2JONUwvREV0Y04wY08xZjF4RUJGSDdCNmo0?=
 =?utf-8?B?aUNlSmdMaWlRd1BVa3pOM1ZlUWlXNFVrNmE2TFMwblhNS3NLNk9sRTZFaEtT?=
 =?utf-8?B?bUtuMW5SZGVFT1RpTDk4Q2hSREJqaFkzMkF2ZERodVZaNHcxcUlscnl6SS91?=
 =?utf-8?B?bkZuQitWUHBtbHgyYWVUWk9mZ2NSRlV3Sk94aEIvMmNCaGdIQ01YYzVydC91?=
 =?utf-8?B?dmNzUlU1RnBwN2E2VUtGbWdzWXlLNytHUytBcFZ2ZUFWYUZOYXNpMDJDdlpo?=
 =?utf-8?B?T084YkJEOXY5Skg4MThCS3kvNGJydXpMRTdMdUxOU1ZEWmVTWWtmZ0VzQ3Bq?=
 =?utf-8?B?RUdXOTRDM25maE0vRjcwbjVnL3M0clZja0hMTkJpREFMK3FwT21VNloyWWdS?=
 =?utf-8?B?TlhOOXJoZzJwUVVnUHhxTDZYcFN0Sm9NK2pUN2k1U2lLdHVHMlh6dGlxS2N0?=
 =?utf-8?B?NVZON3F5RzNkZzJlRERpYUo3QU1vbGR3dENFQnlIeTEyNkx5VmlRaHB0Ulo5?=
 =?utf-8?B?UmdvNmpuQUhiYWpmeFQ5QUR6Mkl6bzRHSGFaRm1RdlBqcVh0L0JxNnYyVXdy?=
 =?utf-8?B?a3JFa20rbyt1VlBpWVNFQis0MWp3SUlwMzd0U0lBSW5NbC83MXZQK3h2YU9q?=
 =?utf-8?B?Y2hsWmh4d2U2ekp2bmxwS3FWWGVodzBzN0M4UmNOWGVIWmhTVGt3a0pubVN4?=
 =?utf-8?B?a084YURVWmk3U1lrQUdlbXRIMFlueEJwYmZ6TEJERGovdGEzdXFjZVA2aUZ0?=
 =?utf-8?B?VzIwK083UG82WkI3dU1LdGp6Mi9Vb0g5T1RMSnZXTloxRE5rWHU4bkNzNjRR?=
 =?utf-8?B?cU94ZFJjdFRzaDN6cGxtbnoxK0cvaDM3NjBCclVTMHUyRUo5SFE0a0VwWjJi?=
 =?utf-8?B?SDZZd3AwQm4vUm9qZDIwK0xCRG1NN0RBV3UzRm92d0RhMTFiSXRVY1hTV2g1?=
 =?utf-8?B?SHdKVjVYeUk5Lzl3c01OeWNpaGZ3VElaRkpQM0RJbXVKRGl4ZFM5VlJaQnpL?=
 =?utf-8?B?Mkh0QzlUK3VmNllDNVd0a3FJZys2ZG4zQy9WYy91WnZ2bjlLVkcrbldyTTRU?=
 =?utf-8?B?cnFzWXZWT0pBeG5PUlJxOGxFNjQxODFKcFovUW1IdlBmMStQTEg4bDRGcTY5?=
 =?utf-8?B?eDV2ZURSSUo2QlQ0dk9hUDNpYkNtL01jcUZ5Q0MrbUtpMVN0UUE5VkxNeXRp?=
 =?utf-8?B?Wkh4dWdBeE5VVUlacWwrL1JCQVFORHlyU1BjbUtPYXRKQ01peVZmY01scXc1?=
 =?utf-8?B?UUMvQitDckdhRDZVTUM5US9qcTFYZGhVQU9RVksxRit2VC9mOTkrZTVSOVJP?=
 =?utf-8?B?dmg3V0Jzd2VCTzdYdjlBTHZhYnorNXhxakYySlhycDB3Yld3UzlXRjN5TmFB?=
 =?utf-8?B?bW05NGtZaHVteEhMTzhtWE1wWm9KYUNlNjBPMGF0aXlwVjRSU1YxdXhUTHEr?=
 =?utf-8?Q?25gowpZXr71ZcRb4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81a100b-2f6c-46ca-3a16-08dec6080002
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:17:59.6091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEjwhzHe6rimpjjZvi2cBNeM8Sz8NJ/JyZRCV4OwqYgImjT7RQnH544c1o0XCqi9J08Np4HpNCB8BHODa7caUmtvpDSK7FflchisPovnXeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6865
X-purgate-ID: tlsNG-d62444/1780996683-B715BFF4-D5696B3B/0/0
X-purgate-type: clean
X-purgate-size: 1656
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
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9F0C265E3A1

On 09/06/2026 10:14 am, Roger Pau Monné wrote:
> On Tue, Jun 09, 2026 at 09:59:37AM +0100, Andrew Cooper wrote:
>> On 09/06/2026 9:53 am, Roger Pau Monne wrote:
>>> Adjust the mask calculation in case the last range is merged with the
>>> previous one, as then the mask must be calculated from the previous range,
>>> which the current one has been merged into.
>>>
>>> Instead of fixing the off-by-one in place, move the calculation of the bit
>>> change mask to the next loop, after the ranges have been merged.  This
>>> simplifies the logic by consolidating mask calculation in a single place,
>>> possibly making it less error prone in the future.
>>>
>>> Also add a test case that triggers the bug being fixed by this commit.
>>>
>>> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>>> diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
>>> index d783186577ef..ba57f1793011 100644
>>> --- a/tools/tests/pdx/test-pdx.c
>>> +++ b/tools/tests/pdx/test-pdx.c
>>> @@ -191,6 +191,20 @@ int main(int argc, char **argv)
>>>              },
>>>              .compress = false,
>>>          },
>>> +        /*
>>> +         * 2s Dell R740, merging of ranges causes mask differences in PDX
>>> +         * offset mode.  Useful for checking mask calculations.
>> What's the 2s here?  If it is what I think it is, I'd suggest "Dell
>> R740, dual socket,"
> Yes, it's what you think it is.  I've used "2s" in existing comments,

Oh, fine.

~Andrew

