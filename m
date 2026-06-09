Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0QLJg7WJ2p23AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:59:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1265E09A
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=zYJwoiP7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332527.1594983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsJH-0000U0-4J; Tue, 09 Jun 2026 08:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332527.1594983; Tue, 09 Jun 2026 08:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsJH-0000Rz-16; Tue, 09 Jun 2026 08:59:47 +0000
Received: by outflank-mailman (input) for mailman id 1332527;
 Tue, 09 Jun 2026 08:59:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWsJF-0000Rm-Mw
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsJF-003cZI-3T
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:59:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27d5f8-5cb7-0a2a0a5109dd-0a2a450ce3c8-48
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:59:45 +0200
Received: from [40.93.201.54]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27d5ff-62f1-0a2a450c0019-285dc936d945-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:59:44 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5378.namprd03.prod.outlook.com (2603:10b6:208:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Tue, 9 Jun 2026
 08:59:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:59:41 +0000
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
 b=DqYBJfI8tOsH4vTenvbJU1VhhqMI/tC2drOSZpZPe0wsYYPiYKa752Ho+prAuwN4+3ldWXG2LWcn2h9KBlKlS141obktGj26+y1tvytUyPVEW+yiiNWrtOwjlR6ZancLrcqQpRzpVdRVlHVHlotUyKgOI7uoV6I429mV6Jksf42pYCsmElI3k9WULsilYL+QlYjPlP2jehKebY7cgJ9j1HrluEBMPsSyMX0XLWYbZ7tQDdrDoUS3UBK8p0UOohrFNe1XQVL1RJhhqpJSaduFskPUaQ8Ld9LbAtuztqVcUQu6WItf7hjbdMyGsr6mg1yPolmBe28bbeqgdOCoe4zhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wN/JiC6zEouOUNZNfhdsGFCdEgm4TfFNXjj9Ti2VKA=;
 b=Xdr5dd4fhIJjuiY2K1Bfx8YNRnqkSOxK8HStZuyPbQc5aEH1zM3Z4K1HMMovIU8zvpoHzpmeEMabl+wZbKILDB58UhZq3BsqoCJZK/7kUUOD2PRZ/CXR5wOwxKsA3gAlcYzwPos5P6B8MkFYqMPadlmCiclcehC/C+59MWFyRYXbxkKFNXtMKczR7S7PRQmP89R7eeZW4y3FFjSk0MEm5VysgbN3M3NFETOwsD8SoJsFTluV6jNqELc7PzRJCL+Z2qVWaKdhtUi+ju+3aRGYATCA2qV+HL4kjFYwpVEFZMcdNSJcj/5NWUo4XN51Si5KMWzHWdE8HIwq5r3vHcLykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wN/JiC6zEouOUNZNfhdsGFCdEgm4TfFNXjj9Ti2VKA=;
 b=zYJwoiP7n0CLBPab6p5prQ9suOxGD4ZmWv1b2QJomNphWyzegc0UaxJ5CvG4X9LfQ9SHcJWvTtxl0ysoHcomrTotXCVlI6vqaUTHgryrc/sZiZHhTUI5srhU74zbEJw5uVqQu1Ie3N1nPW6OEVst9ufPm/BRXnc6PSXNg2BThf8=
Message-ID: <a0cfb079-653f-4c06-8004-017c7f60ffee@citrix.com>
Date: Tue, 9 Jun 2026 09:59:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22] xen/pdx: fix off-by-one index in offset mask
 calculation
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609085322.92856-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609085322.92856-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 9967bf0d-3589-4b3c-5beb-08dec6057146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BXUij61m7NR1ab3qsETbRIf007t4AYvP68yEmZ0uLKXQphFZct37b1jLbxow7hvVaH5+lzWuXD0VQChVc8AbAfoiG0Gbol9sGr1/DVjuvZXTBCp2CiNIQUtgLTgFbJt2fvLedgDG1xHCIQnq2UhLkYRG+kjZgqaRtOVaqHDDTkXZtdImrqBxhyLR+tvHWLUrrsm+RUAmmx2xy0vcAq8eklI/F1BhRJKVJp/VasXXO9/nkKwv6zEit42hsefzuo/R/0YFnuYll++448rOQC6WOueNgOdP4JLuYEfl5VnO4D7sn5h+/2osgXfJuUPq+6vTnPgzBZDBVjp/oIuUcSvLYfdMyp9WUjMzXGCGjdEUWi0lC+BO/bjGpEjx2Fwk/aDVNUgEngGLDIM2myS605wKY70PbzDPt1z7bQD2X27iUfl2SYXQL9yCi/DQrnfvU1q5dUNVjAP8khK5cuHN6isMNwoGKCF50MDKP+YzWaFVIzXo0ZINI1oQ48ZBcDWrseld2K7RvnTeRGIsygo7OomZfeON01dNVtTxTs8T/p6T3yt/gaA55aB2KfZaEntkG0wZ4XWqI9xavg/FIVSOZbxhHzlxeOlnjPCLbRLtCsDrkAROmpop9QghqyKGrt8LaB+aE/vuoCm8Oh4Q/k/NQXCog5yirX4u7ou2MJUb769ZlEn63axD2jWwfs9QSzzbZsCK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZBcGRiOGc2L096Z25xNTJ1K1FlNEZYOVg0TDNuOU9ETGJubFo0TW9lSmN1?=
 =?utf-8?B?WDF0RUpXTkdoTGV4cjNaMDVVTjB4ZTRvZmw1eE5Pd2FkOWZJd0lpd2RINDA2?=
 =?utf-8?B?RjRzbXZDaTllS25DTEhHNlJQTS8rUExLRkdOdVdiQjFVWXVlVHk2TWwvRVJv?=
 =?utf-8?B?Y1hYMDFoT2FqQ3Z4N1JFYXcxQWRmRGNEVmNxcGdITTU0RXlER1YwMm0zTDYx?=
 =?utf-8?B?dVB4T1EyN1JTbkY4VEdKZW52czJ4MGptUmRmTkEzbThhaXI1ZUJCRm9Hak1W?=
 =?utf-8?B?Ulo1ejE0Q0ZLZnBVZ09XeFVpd1M3K000dFZQUkdtaGV5cyt5TEFSNUF4T1BM?=
 =?utf-8?B?c0JQUU9KOGNCb0U1bjdrbmU0M0s2VU9UTTJpZkQ5RGhnVVJHNFBkMURtYkZJ?=
 =?utf-8?B?bHNqL2JuOTJvRWZxWVJCdkhRaGpQVTZSMnZieExhWUlUVkM1djlaZUwzL1ZS?=
 =?utf-8?B?ZXMwdWNZaWRTc0NqWkJmVTV0V0p2MWJzZTduK25mc1FvaUpyZ0YvZUNhN2hK?=
 =?utf-8?B?cGhUV1RyOGp4RU5zVjBhS3Vuc1l4UVFCZHozb3NmNjNTWEsyWWJySnBjNDMv?=
 =?utf-8?B?N0ZOa1V4cE1Pemp1WEw4WnArWDIvYlpQbXkzS0t2WkcveVlhOXM0THdMemts?=
 =?utf-8?B?elZEeGlNazRTOTdvaHRTRFEwT1lwcHQxTFhVVGlUQjdLQmQvYXFMSjB4OUFV?=
 =?utf-8?B?TktzVCtxZXRXUlhEdDB6NUNZbU9PZnFBUExtTG56U1M3S0o3VE8reTcvVTB0?=
 =?utf-8?B?TlluMU8zTm9iWHlYUktVUmdhUmh3REJvbzloY05YNnZGVHlMQmFBb3dhaXd6?=
 =?utf-8?B?aXN5YndIeDdUbzBWM1JwNGExOVo0VFBTSHZsaklwVjhKMWZQc3dnU2Y3K2p0?=
 =?utf-8?B?NXFaYTBVWGxZUXpjQ3NNY25CS25mYkVCRFRaZk8yRkZtdUgxTDVPdk1nc0s3?=
 =?utf-8?B?NHp4L0tqeVJQVXNLbTh6NGhsQzhidGQvWW5DVHpUaU5vRmZ4U1QvOGs2TWtq?=
 =?utf-8?B?MTE2Vm85aGx2QXVyQVVvQSswMTVzMzFET09jb2pHV0h6U0FHU040dWwxZTIz?=
 =?utf-8?B?VmF5dlpPOGN3ckxDU04vaG0xenFvWHZmVDE1RmhXUWhOZ0hRK1E5OTF5Uk1F?=
 =?utf-8?B?NDdoYWJESlRKSnRhMktWbGpGWWxPL2t5a1hDOUNuWjY5M0Rralc0MS82K3JC?=
 =?utf-8?B?SjRrVE1JRGVxQ1BtY1VaU0JLNjNTcVJHWHNsSjBKVVNyYmZ2YTcra2xoL3lS?=
 =?utf-8?B?T090LzZyMERSU0pjRjNQOWlnWXZ3SXArcU9kMFJpRTFHaGU3N2lheGpQcEZh?=
 =?utf-8?B?S2FpVHppTG13anErOTJBMU9ReThPaE56WXhDNlhpOVo3Q3NMLzhrbEJYTVNY?=
 =?utf-8?B?SEtmMnRQalhNVU9TN2ZQSkhmemExdDdYaDJtRDRxeGZSYU83QkNYd1h5K1N6?=
 =?utf-8?B?SmZwbVFCZ0I2MWJZSWgwOG1MbnFrRjJWT1hBY3lyRVEyelNId2Jwc0dWemtB?=
 =?utf-8?B?YVExbmRHZEdpMWJCMjBCdWNuOUpQRTA1YzUyaWNkM1Bzei96WlFCdTM3cE51?=
 =?utf-8?B?OFBBZWlETWtDMk9hNkFUWTVYb1ZhUVlld1AxQmw3SmMrTENCdVhhbHQzcWdG?=
 =?utf-8?B?b2JKNWd1eGlOYUFGbHZFbm0xUnlISFBDNlhqakhBclJlaitFRDRCeWE2cS9G?=
 =?utf-8?B?cENKallSS0JZaXpuTStlNXg0NFRyNFFab3pRajk2Qjc5SkdGZXVnVklXQjNL?=
 =?utf-8?B?dkN5WW5sdzZjYkx2UmVmN0NFK2V5cUt3TGtPNE50WE5QS1NqamViUmFuT3ND?=
 =?utf-8?B?TEtNM0pOTUpwYStXNjNyZFRCdUp2RGVEUEZ5K0xpU24vdElvb2wrTlkrUkVq?=
 =?utf-8?B?Tk9WVmpzeHFhODQwNDZ2QzJDbEc2bVBBTGpGdllKS1FqOHg5bGh4dXJLRFBC?=
 =?utf-8?B?VzV0UDRpcVpqQmFVZEZ5OTNGbVUxQU1OZ1lyV1dVdTFwbDRxNGRvOTc4YkRL?=
 =?utf-8?B?TzVJT1pDRXdQUU16cDNvNTBPaHl6bnRLYmRJQ0FWSFRuenc5WXd5RGpocjBW?=
 =?utf-8?B?MTNTUUN1WWZQaHUrVVRUOE1SMEFpanB5MlJaaTFPTkFjZUc1dVZ5SUd6RnBx?=
 =?utf-8?B?R2UzMEgydFB3Y29qRWtWMXBnU2IxeHBXWVM3UUp0MnpmZFozcmFBV1NTZkdO?=
 =?utf-8?B?aE05RG9nV0NRN0hsOHV0SmVnYXVJbDdpWXBZQ0JhNkRGR0RWTTlJMGtlQUFB?=
 =?utf-8?B?cEFyQWl2V2ROUjg3M2JTaTd5UURCWG44Q21YOFVubytwVVhpRERaeVVONCtY?=
 =?utf-8?B?UWMwTlJ4TExWUDd6TVV2UG5kRE5nOWRCQUtWRVczSFBLWjlyQXI2VUU0aExu?=
 =?utf-8?Q?M4aHgBdQk83Y5q9c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9967bf0d-3589-4b3c-5beb-08dec6057146
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:59:41.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMQV8ikNvzkY7xdfJkHCBfSFvD+etE8Djg3nI/mfBWD0/z/WLPwQ0KiKvDB7U0hlHzAhiGCZJ9nuuP1NYxcLmvnu8z3HKmqkpUQhRIiXc7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5378
X-purgate-ID: tlsNG-d25034/1780995585-F407FCF5-FA96735C/0/0
X-purgate-type: clean
X-purgate-size: 1397
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02E1265E09A

On 09/06/2026 9:53 am, Roger Pau Monne wrote:
> Adjust the mask calculation in case the last range is merged with the
> previous one, as then the mask must be calculated from the previous range,
> which the current one has been merged into.
>
> Instead of fixing the off-by-one in place, move the calculation of the bit
> change mask to the next loop, after the ranges have been merged.  This
> simplifies the logic by consolidating mask calculation in a single place,
> possibly making it less error prone in the future.
>
> Also add a test case that triggers the bug being fixed by this commit.
>
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
> index d783186577ef..ba57f1793011 100644
> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -191,6 +191,20 @@ int main(int argc, char **argv)
>              },
>              .compress = false,
>          },
> +        /*
> +         * 2s Dell R740, merging of ranges causes mask differences in PDX
> +         * offset mode.  Useful for checking mask calculations.

What's the 2s here?  If it is what I think it is, I'd suggest "Dell
R740, dual socket,"

~Andrew

