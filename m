Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xbxwKJIdUWpC/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:28:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DFF73C931
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="l/85V9Bx";
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359647.1613140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiE4m-0006oY-4Z; Fri, 10 Jul 2026 16:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359647.1613140; Fri, 10 Jul 2026 16:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiE4m-0006mq-1t; Fri, 10 Jul 2026 16:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1359647;
 Fri, 10 Jul 2026 16:27:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiE4k-0006lX-42
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiE4i-006qJZ-U5
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:27:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a511d76-2eae-0a2a0a5409dd-0a2a4508d65c-2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:27:40 +0200
Received: from [40.107.208.34]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a511d7a-ee29-0a2a45080019-286bd022c215-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:27:40 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MW4PR03MB6603.namprd03.prod.outlook.com (2603:10b6:303:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:27:35 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 16:27:35 +0000
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
 b=prYGLU6/ND9JPQ3em1XcCtkPBnmsvloyjtlY430AB9kG8JNSQYO74j+cVHZt95vvb7I5N7WzOoXlDSsGHMkN3yHBgr2ONlZOin2lzvivw5kH/a9n+GAjY95fPr1BdDuP4z+gPF0XWRsaeaUXHx37KvH/3Bm57SwP48R7kxrWpJwTkUQhTaJocMPSMS++qE96OoDrwpCTSCvwbWXSORCAgFEObkCpCTyT9QGjnD8nzmRlr+uY4E5en6v7VpROONVYJuZyMult5BKMugVPNlit7xxoRx2wN5vCUKwfWAdVPvn5aS3Et/UjbtE7qlVrEV4cO2/VXUUaYQaVRMdENwJtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pV8Ck/RkA66Q/+t0e8+0qjlQ11ixC1OnBth6QY03h8=;
 b=hVck3G+yNmS2bi2Dgv523ICZh9PfE9iHQk9b0Ffb7wtEUQO9qeBQKedUY9v9/C8Z5H3ZWm150MurLQGBRjIbYfRZeMnCK5akCnb77/krM/c6N2ExXu0WA0JLgLPaLVbiK/2ky+aKXuFObhh0NHd0KdKpzJbxBmrbZZZXr6ATwPGyf2eiO6bNgi4Wg8iUIbG4HYAQIMhpSYlRXVAZiBtBQEE8z/9OryW4OMX0iAn19JP4q7mNK96D30l+fR+Jmavpf2bF1SXd73qZ+7KBUZWo3NU8f1SheJYfadqBDSsZl69naCVjkfZZwcgqqLnPNSuaorx1qdN1LhTmgU34jcAn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pV8Ck/RkA66Q/+t0e8+0qjlQ11ixC1OnBth6QY03h8=;
 b=l/85V9Bx4KOHODYZ7OLR04vF818P9CXkj6J5E0y6b2PIVsCcCcIpCAzfetdHG41f6TlJQY9tQ3uv5Of1JREUuZ1cseZwnLNL2u89arsY7EIectS1OpX0nQS57+1mt4PRr13Vrw24d4DM3oxOZMaO7qNLU4TOxxm1Hfscd9jK0MY=
Message-ID: <ff05243a-6d8a-472a-a067-26293c233923@citrix.com>
Date: Fri, 10 Jul 2026 17:27:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] CI: enable FRED on PTL runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
 <6f41b87651f282ac118c17b1562251f7d74c9496.1783626895.git-series.marmarek@invisiblethingslab.com>
 <ccc8ef59-d956-4a70-9fb9-bba241087c16@citrix.com> <alEcgxY6fioaJFts@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alEcgxY6fioaJFts@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MW4PR03MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: f04bc23e-fa90-40e5-33fa-08dedea0268f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|4143699003|5023799004|18002099003|56012099006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bboTkb90gzCrFvKwbwf/6YazwzCTb+GMLTAhzoaspCVnhKj1hMeOr1eCa03T5D48mbS5pOhEhDcHQRjGhCtKgCeU9jVFL3tcy5GYUagSrd3MnL+jibgKBzP1N+8dkkr6BOfHVZgM39H5ZkUJY8eIG9MT9LKNKOZaOo+QSjZiWyKDPDjWORPiv23yVzrg5jgB4kWvjYwN3zlDTf0gugyzlw+GsoYT2r6P5Jp0xu5b/W4pOITFVUhtG+qLnzQk3POZzAYeNYdqx0u2PeIRGb33lykQOj6kM3uGED/Esjmnot4tA9I1r/JB5Ed/8Lq9BFK1MrCMyXCss9v+jKk0Y5O2WqVIOJs7iJpVyVJlqsY9pmCXFZ7CxZ+Hjnk44RKPRxRSLlaXescm2p+XVloEUSxi9+mz/RQQlLSv86nNz0jNHqg+bl4i6N9ZL+ylYFWd+jmUqT3VY0crmH+lgUJzEZMhSG1Jdrpf+7TpfLcGa8Ik4m4VgFkNbxalf5gYBeIOeV4BaWgbFFH7eSa8FPqM7puvnP1RBXnGQ2VZ6KUN3ndJG8jUNOQN+6zJJNDN+RKTpH3vKHHoyEyRoT0o73uZm7g1mpcU3zCoj6HEEeCrMixXbV8rdvfbha43/UREw/jRR6tyocWDhUswfpoNZlFD6SeTR/HhBt0bWp3PxmtiYiYWshw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(5023799004)(18002099003)(56012099006)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnIrSm9ySlVxR01BdEtUYitrMnFsS1FKRU45VFdVUktRN0F3MldWZWRDZjdI?=
 =?utf-8?B?dk1hemJpWXdtSEJEaUpkSyt3M3NkZzZwNGtEZWk0SHk5L2F2NHg3a2VIV2p2?=
 =?utf-8?B?TFZrWkg5MjRJeWc4cmRXb2xUSHFXR3VRczZKMG5QcVZGejV3ZWMrcythWCtY?=
 =?utf-8?B?WTR2V3RCY09PUzFNcC9tUG1sVTZjY2x6dWNKMU5JekVFU2N5QlhBSlJKcHR3?=
 =?utf-8?B?aStZb1lyQ3AwTGhLbmJzcEttZEFZamdOQklINHBNWi9pUS9pZFlvQW5NQldj?=
 =?utf-8?B?Wk93SWFYMmlJNkI3UnFkSUJwandERnMzU1JHaERJbFViMGg0bUxDOHo1Q25Z?=
 =?utf-8?B?NC8vaS9rRmt6YnJCc05hTzZZWTdLaWxLbXNPTy8xUEM2TExCaE44ZHBwTjUw?=
 =?utf-8?B?M3VXY25tRVkyQlpBcy9XcWlEaE5odE15YkU0am9Dd0FIM2NTZjJyZFlqckM5?=
 =?utf-8?B?SkMzU0k0YklaT3ZRQ21pR2ZralNkZ0dyRHU1c1pOQ0FvWlF5WkU4UHdicVlB?=
 =?utf-8?B?Y3d6b2gwenVXOEcyc1ZldlFqSU5qVldlZi9VTk5XdEZCYWNBcEtxVnBldWpi?=
 =?utf-8?B?cVpYSEluLzdJRnhQRkltTzhvOG9GQ21xRTZvL0VzOEdTZjlNMmhIRW1jRHNx?=
 =?utf-8?B?T2NEa3NPUXd1TTBoU1p0b1hUYXBKVW55MDBZa09xNGNkRWdqS2h4cGQxS0RF?=
 =?utf-8?B?VFd5WXp3VTRlc01TZDJhMWVaY0RyMEtHejlqWWoyUHJ0NEZZTjRyN0djQnRZ?=
 =?utf-8?B?STRCWUZxcnlveXhSVEFyVFZqNE1VWVFxNWk1Umtwa3hadlMxdnNWRjBPN0xE?=
 =?utf-8?B?T2MyR0ZNZ28yTmVoUFVhK2pPN2lLTFE4SzFNTVRsVG5kWWdUS1BNdWVXeUx2?=
 =?utf-8?B?cjZ6dnJrL0UreFFXL3IxUU5lR0UydnpDVk0rM3pTWmt0bXlkalp6M3pJU2lI?=
 =?utf-8?B?a3NRWXJWOFpQWS9SWGVsaXgwNFJXNWdEZnZ0eXhydGpkdzkrMTErNkZuTFg1?=
 =?utf-8?B?OXhqVDFscjFxbXFjNEEvZ1FPckNRLzB0bVI2NFRzOVUwamdWdUZNYnNkNENy?=
 =?utf-8?B?blV5SDBoOUUrak9BSSt0ZEhwUzlVVlBnTjMwenRYVmNCNWhJcDJvbFluQldS?=
 =?utf-8?B?cGhhUVVpYitaZWw5NTNLdEN5ZHJQSi9xSSsyeUt0dWVoaGZ0NjFzNWdZTzRt?=
 =?utf-8?B?Q0tPTUlVMXNmNUJJQ2JNdnlaMWVDS1hxQWdEN0xYUHBwai82bS8xTHI2eDVS?=
 =?utf-8?B?UkNpM2dkZWpSZGt1ZHFzbFZVdGVNRHhrT1NiUXhtQU1jRnE1OGpsbmV1WmlR?=
 =?utf-8?B?ZzVnQTFNRGVpTWRadUpZZkpITWlqVjY1T1ZPb1UwSHZFVElKK3RaWThodkJS?=
 =?utf-8?B?SmJRY1VuUVA1emNMNjFGd0Q5Nmp5Zk9OYzBrV1hRVjc3QWkwTHVLSjN3L1dS?=
 =?utf-8?B?YlJRNjZ4QUZDeng4NS9CellaeXV2b0pWU2t2Q05UUytucUIrSG9IWTRvVnUx?=
 =?utf-8?B?MnNkbm14bDNSancrT2hNbmZnWWRPK1VqbmxPd2pTZlprd0RWMXBDMHNWaDJZ?=
 =?utf-8?B?T3NFZlJoeGp3Q0k1Z3dBTEtJYlBPa3BDQ3BMUENtejNidnIvTWNFd3laYmJy?=
 =?utf-8?B?aGtUd1ZNcXZLYlFJSGhRVVJhcnBkdERNWW1BWXpKYmt5QmJOQkdKK2pGSlg3?=
 =?utf-8?B?d1BOWG9vc1RYVjI1VFFteitGR2k4OEJxdzh6dHY5KzQzYTE4dDNjdVRjbkQz?=
 =?utf-8?B?c2FMNEU1U1MyTXBHNGk0QTZkejFrZzhSd2hMUTVBVCt5SDVOUDVBdU0vRysr?=
 =?utf-8?B?cG1sVDBTTVBmZUVJV25rZXVtSGVLbURxMGVvNkliNWtUL3ZjclZDVXhoOWd2?=
 =?utf-8?B?YURMSGVQYXNVbml4Uk91ZVVPYzMyUlhyR3VRZTUrWDNZYlJIa2xPTmlEYktX?=
 =?utf-8?B?cXhLNG10Q1RNNnRDM3BZQzNxNXEvbzY4UzNQTkZkNlFjWUhmejd0TDBMdStL?=
 =?utf-8?B?WmhBdldpTGM2WUFyOVRidWZ2dEpFYWMrR0tjdFhuTEM4SDBKN1ZwSXRoNmxq?=
 =?utf-8?B?WmhtQmc1RS81MzQxL0ZJR1daeHBRcHhhOEZENHord29wSCtKbHRXRzB6TEtM?=
 =?utf-8?B?ZFM0ZHNNOVNsVGFrNU56TGQvSVZBVVBiek5NQjdPbU04NDQwYVY4dksyUWpm?=
 =?utf-8?B?VlZzL0U5NTRod0ZQRWdWSUNId01lREtzblV1dzZENEVUUk1peUdZaEcrSDBG?=
 =?utf-8?B?T1lsMVlLbnZ2UHdDaEZFSmpFUEthQnJWaUI4T1JoVStVanlXUEFrZGpvZW5x?=
 =?utf-8?B?VFU1S09iUmUyQm5sUG1NZWVQUkxvdnhzSEloM0hUMkc3L0NaNkFNQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04bc23e-fa90-40e5-33fa-08dedea0268f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:27:35.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHqGrLrHBbaagb+w76iOzP8xNF4eSFMkdRpddHGNILagUM/mU0p0MqbNz0Nzixx17anMYG5S+SfTq+X2PoeW51+5bJQTH99I9gCeBWduStM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6603
X-purgate-ID: tlsNG-c1860d/1783700860-7A62B01C-EF679B29/0/0
X-purgate-type: clean
X-purgate-size: 1088
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 02DFF73C931

On 10/07/2026 5:23 pm, Marek Marczykowski-Górecki wrote:
> On Fri, Jul 10, 2026 at 05:15:17PM +0100, Andrew Cooper wrote:
>> On 09/07/2026 8:57 pm, Marek Marczykowski-Górecki wrote:
>>> Add new job-level EXTRA_XEN_OPTS variable, in addition to CONSOLE_OPTS.
>> This is stale, but easy to adjust.
> What do you mean stale?

Never mind, I can't read.

>> Wouldn't this be better?
>>
>> diff --git a/automation/scripts/qubes-x86_64.sh
>> b/automation/scripts/qubes-x86_64.sh
>> index 065f03931bea..9f8288cc02e3 100755
>> --- a/automation/scripts/qubes-x86_64.sh
>> +++ b/automation/scripts/qubes-x86_64.sh
>> @@ -15,7 +15,7 @@ set -ex -o pipefail
>>  test_variant=$1
>>  
>>  ### defaults
>> -extra_xen_opts=
>> +extra_xen_opts="${EXTRA_XEN_OPTS-}"
>>  wait_and_wakeup=
>>  timeout=120
>>  domU_type="pvh"
>>
>>
>> Everything is expected to append to this variable.
> Well, currently nothing appends to it, all tests override it...
>

Really can't read...

Lets go with the version you tested.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

