Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8UZ+EU+0O2plbggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:41:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4786BD715
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:41:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=kuZ1T5Ub;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344770.1603804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL2W-0003vv-8y; Wed, 24 Jun 2026 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344770.1603804; Wed, 24 Jun 2026 10:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL2W-0003uX-6C; Wed, 24 Jun 2026 10:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1344770;
 Wed, 24 Jun 2026 10:41:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wcL2U-0003uR-D8
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:41:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcL2T-00FCQY-HW
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:41:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bb43b-bab6-0a2a0a5309dd-0a2a4505a42e-12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:41:01 +0200
Received: from [40.107.200.52]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3bb43b-ef3d-0a2a45050019-286bc8340c68-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:41:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6497.namprd03.prod.outlook.com (2603:10b6:806:1c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:40:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:40:57 +0000
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
 b=XaMMgtBjhiIrliFXllHuCU+Od3NWn5K+Gaub9QTO9ixa9FXNW8TAD46B0pjdBzCTQMxKRoenKKpvipsmkKkdNHyMhyOC2FLsQm2iraSV+a3XOG7F6F73agvA8CY6Xu8cqH7JbehppkVfUsOssn3UycvgtPhQiO+AnYzloAvu8S1JfLMLORHZ4UDYZF4CrHqe5MtkbTZt46I1FEzeDPtx6pToRpm3ciuvw1be6DtcFbcX2OjZg7WZHZcBWUnMSsBMAd8CbO88aJFKtV5r8hEtevNBPb+yElSUOCyFqR5F++pIAuzcUSMnRGJ2VpfCXRgtoBTGmrSWJWdvaS2IQLnEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgmSa6RUXbsWwEEKdBbU5NeNQtbD7ThHqEagpWvpcv0=;
 b=ZJF94xCwr7WEf4Yg0GpHH/ZCL04bqKEPni3Wymv3etQmXSnzkepNSwoDLh1DsF4eNESlZjxu1jX2ajW8xKzh/28gvReQRFJBdvFubPpkjTgRrQPwQ++wBXoGvtQCVAlG3CbbIVvnpLBKKpU1ReyUhk/0/aVAtxzMyJ1+2SA2W6vdCJQeuZjK2P3J6pn8UyqAkMZYPdZbkD4CZBJ35H8hIaXCo5+xmkCTYA8XjJMqRu4Xl5fhz3Vxkq5jC24InqyDQsy3yQMW/hlu4Fe3UMnCHbxKz9Q4RjFwoUpOltps7EjQ0faUOXGXfjHAkCV9HtE1W1VfCZX2ZmPuSo8aNn+BJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgmSa6RUXbsWwEEKdBbU5NeNQtbD7ThHqEagpWvpcv0=;
 b=kuZ1T5UbaP1FnFTnx2vWR+jMbDkqqe0ON3S9hsN8S8+M/zVEJSkLI5cg7Wg7Ve6jICGBIYCSGAk9lF21zaSBCji0EvWHPtL24hjvPGeNZAlErw+b6GYl4sZP0VqbP/5jPIm26VE39POo4Bznjnmom8C1ERt3fwjfZiGk2G5zwR0=
Message-ID: <0ccf8786-3460-4500-848c-2f0058c8a269@citrix.com>
Date: Wed, 24 Jun 2026 11:40:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: sort obj-<...> list of main Makefile
To: Jan Beulich <jbeulich@suse.com>
References: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
 <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
 <d2d794a4-dfd3-45c3-b5fe-836d0a0c2244@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d2d794a4-dfd3-45c3-b5fe-836d0a0c2244@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c2403c-fe5c-4019-ae69-08ded1dd1330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h/MtPSaPH9vGC1knXx7ges+gchZa1U2iiV237W329cTgTHVXC/QPP7qWSHKOBxhF6EMN20VHAHLY6WCiD4J3hZ9Ydttgig6LLOryulJldfxEh8eYg3fAUABKvJap00xq6riYdLUzOE4DnHTnLQ0Rnk7AYWI90V1zZn7/b/s+9GTm7bDmXznGgTVCbcUKGC9ginlBri6BqRJaFuYeS7HDkWqQ2JwYSabZTzDuhdNPRclRKZUsKWQMkLpaoTrdBSr8Z+FfWH43hsQT+zKdRMm/DoLIaLnewVgx/4ObUK3GbDXHlnyrCOwmTssLVoduIVsCR4QriaEvbNioyz/4I6CXphqnfoEd2gVivp32A0LlNo9kBj5s3vepHR+sBSE+gj7jdnQcgRXZ8vVGkDCPJDlC2tGxa5ZDXotszujFLGb56aMSKyPd3MtDe1peAwcfVsC4n6en46zXo14X4jeYQNmlzq+1gpy0Zgl/kZlA87eqp9Ng4+kulX8Bpi+xYwnKMKU1pl3bHeqCmi7VblCbHjU8rtR+f2P9c96zEM9I6ehLVJ4NTSdn6YjzURD040TfGr2tEd4aW5gDmUfAk4aW/aH1chajJXT3A+8HGqJStzKFhdmZlA8cbIF+8g15FYPBh+g5r8p0diWCutcbMup9UMMWnsB4w3mRhaf8m008m9kMFZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBhZDBtSDZmYTNiWklFYTVQRXlObng2NnBXWUxybERVdlZ1WjF6bHlaMnkw?=
 =?utf-8?B?TXFsQ0VVaXh4eFM2SE9iRmw0U2RwTEZQQklEZ0t1RVRKT25RY0pERWlhMTYx?=
 =?utf-8?B?Um1KWmw2cmw0akdmd1ZxUnVvYUFyTWxuOXJiNzJUR0o2RVVOWkx1TzBtbVZw?=
 =?utf-8?B?MFNNNDU4RlVkVjBERFhub3pWNHphNSs0dVQ3TC82TjhEdE81VEJFNTB5VXho?=
 =?utf-8?B?MmUzMzFqOUEwTDVqTDdtNmUvMEV0WW1Tc0ptYUN3emNHWWN5NkozTHhxWTJ1?=
 =?utf-8?B?aUNXdWFKTFl2ZXFwMktmMWRaelI2cWx5U3lhZGNKbGZwMmNZTmpmaElkN0Q4?=
 =?utf-8?B?dFFKK0VpazlsSnV4cTlvYmRYb3NVMGV3dmNJcGR3TUw4cFdGaFV5eGpyNzVB?=
 =?utf-8?B?VE1HR3dKRHpJbnZEUmYydXpPYmlPaS95RGFhVkFweTROQkg1RW90TmJkQjhy?=
 =?utf-8?B?VjhsV0VTUTJ4QU0rcER2Nk12N0RNaEM5N2lMZGUxc0dyZ2NHOUtCOUkxM0kz?=
 =?utf-8?B?ZnFkQU1qclJ0N3I1dGl2OWkzZld5QjRENUh5VDZybEdlZmZMZzZsWm5SZVRw?=
 =?utf-8?B?cFhiTlMrdDdNSmsrOXM0bStjU3VLTDl4YXozR3g1N3VGN0c3WDlXQ0hCakdq?=
 =?utf-8?B?OVZ3M2JrdXdDdnZURDdoblVwdXpFTTQrOHdSZDgwNUZZTDY3UTYzeUt1SFpq?=
 =?utf-8?B?bTN2RjJUQ3hmWGxucUthdUFxNjhKb1g1NWZlMXRENlphZkc2clA5RUlNN1dp?=
 =?utf-8?B?d0htTitpOXgrQ1B5eHMyQzlYNzc1Q3R2Z0RDN3U4V0lPRlBRTjZyTXlGSGRI?=
 =?utf-8?B?aXdoTGY2K2dNM0hLVldUMzhtamxGQlhLcWVucGRXN0FMOFRJLys1ZjcvaGdr?=
 =?utf-8?B?NkM5am85WEk2d2FhdHJzdk54SGloTkIxWWpsbXg4eHVyZXo2T0Q2d1JxbDlT?=
 =?utf-8?B?SEVzRXRTdCtGeG9Lb3R3SzlBZm15MElPdmVPZXZQenFDeUlFcHRrNTRHMzZh?=
 =?utf-8?B?M3BOdDdYcmV1eXM1VFM4U0tZTFppMEp4VGZIMXlTeFprVktWaTZQeURldkNp?=
 =?utf-8?B?NzYwZmNveFY3TDhzOUdYN2tZaUh5bXB6MXRYaXphZXhhQ3NWaHM5QTliWGd3?=
 =?utf-8?B?TnFGM1pwekljU1hWV2tSREpiRG1MSVdPSExKaGJnb0VqaWRONy93WjV3dnNY?=
 =?utf-8?B?QlpqazUrNFVvYmpxWXVwTnlyRlhrb0JUOElvYjRCU2RtSFR3V2JVaGsrQzkw?=
 =?utf-8?B?d0FNS0ZQczZ0N05qRWNGR05IeFpVMndvZ1RhZjBEV3I0cENxeVJ1NWNWYmp1?=
 =?utf-8?B?U0o2S3ZEZTFoOTRnL0RFdGYrVjVyMFdyU1BnUE9ESEh6MlFrakp4RGFZdzY5?=
 =?utf-8?B?SHdkWkpqaUt5K3pVdHRCUURkUkFTN3dTR2RRUDBnUFpoMnUxNUVKamRFTmdv?=
 =?utf-8?B?T2l6VXJ6bXNlcjIxUnRmYzNDNlV0OCtxTTE3SjBKakRQYlo4RStRUjBua0gz?=
 =?utf-8?B?NUFhZ2xla2JIRzhBRWdqQVVmZC9zeFpsY0dJVE9LS1kwRVBORi83VnpvbDgw?=
 =?utf-8?B?MUt4K1kvWEw3QmpXR01jbHYxWXhXVDJpOFV3QUJ1eHRUZU96U05LaWsvSDVu?=
 =?utf-8?B?VkZFMkhndFQ4N3pTdFlBTWJHTVNlZm9xR1Q2aE04bzl1SGNOZTcvQ2lZVCtR?=
 =?utf-8?B?Vm9NLzhTMk5WN2dXcktkNlFtcEFQNTdMbW82MGYrMFVqRENBWWlJa1gwTnkw?=
 =?utf-8?B?OEc5dnN3cjZBNG5zeFZLVXVkOXphdDRpc1BrOEJaRG90b2g5YklDVituMW5N?=
 =?utf-8?B?cjd6V3RlaWtKQnRYQ3R3VC9Tb1pXMkQ0OFdBUUVPL2dzTXNsMnF1RGFsa1U1?=
 =?utf-8?B?S1lScmtLaEx1RVBiUlhLcElmVURXZWRDY3pYbjFyRFJmTHNLVlhBeDg5YXFB?=
 =?utf-8?B?aVZlV0RpcGNDRlpwUEx2b244U2t4MlY5YVVvUHE4TitzZWh5TnllRU9YUTV4?=
 =?utf-8?B?QytjSHNaMXp1ZDVXN2lHMGVUaFV1R3dZT2R4bFE0N2JWUVBqVXpMYy9RZFJn?=
 =?utf-8?B?aG92NElMbEcxNmp1NEQ4NzVHRHR3YjRMVHVGVElFOWRmZnZUUDZnY201cFVt?=
 =?utf-8?B?V0VRc3Q5alM2RG9SNjBxMkxLanA1R1NETGxNdmVueWFVeXlKNlU3UEJMVHJw?=
 =?utf-8?B?VU9ybHgxRzFDTWJkRk9aRm4yaXBEbjhhYWhVaVhjd3VQbjJ1c2ZRSmRqazJ3?=
 =?utf-8?B?TlQ1SzVYWFBTTE9GR281OS9DL3BrN20ybHpjcDRiUkgyQUtJRHZaeHpKdFpt?=
 =?utf-8?B?UldLdmszSnNsZngwSnNEWUdnUGZ0bWtLR013cEhPSDZkMTRJNytpbHdjTm5V?=
 =?utf-8?Q?Zu4h8MTplreqa7Lc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c2403c-fe5c-4019-ae69-08ded1dd1330
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:40:57.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0m4kdnCX3rYm88yAUJ3o1QMkxY8HA9+YYLUD/nWVgSmW3tXw0NWU+SpIYp3/POORFOQEdAXXCymzn9YXtZYMc3G6w6zG0HdkXSDj2oWSZvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6497
X-purgate-ID: tlsNG-c201ff/1782297661-A4CBE127-2D2AAA9D/0/0
X-purgate-type: clean
X-purgate-size: 939
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C4786BD715

On 24/06/2026 11:37 am, Jan Beulich wrote:
> On 24.06.2026 11:10, Andrew Cooper wrote:
>> On 24/06/2026 8:50 am, Jan Beulich wrote:
>>> x86_emulate.o coming rather late in the list may want considering to make
>>> an exception for: It takes comparably long to build, and hence it may be
>>> best if it got scheduled as early as possible in a parallel make.
>> Move it to the front with a comment saying "Really a subdir, but not
>> expressed in that way" or something?
> We have
>
> obj-y += x86_emulate/
>
> there, so excusing this by what you say would feel somewhat wrong.

Wait, we've got both that and the higher level x86_emulate.c reaching
into that subdir?

Can't we just fix that?  The higher x86_emulate.c is almost empty, and
lost it's main purpose when you started splitting decode out.

That way we no longer have a special case, and no need to excuse it. 
Subdirs always get entered first.

~Andrew

