Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ72DNioHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C0621F76
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323942.1589638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oK-00070g-SX; Mon, 01 Jun 2026 15:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323942.1589638; Mon, 01 Jun 2026 15:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oK-0006yD-OX; Mon, 01 Jun 2026 15:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1323942;
 Mon, 01 Jun 2026 15:44:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4oJ-0006tf-Ct
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4oI-0007hv-Ps
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-2eae-0a2a0a5409dd-0a2a450ba75c-6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:14 +0200
Received: from [52.101.85.22]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-212f-0a2a450b0019-346555167c7f-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7453.namprd03.prod.outlook.com (2603:10b6:408:1a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 15:44:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:44:09 +0000
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
 b=kBLI8zIhf9+iXwKkTCw6s49TVitfkr/MLDdtwhbbUWSW8ZPTzRqwD03aU6SN5/ijX4mT+hC8Ei4rxa9vHBlzIqRnvU2vNvnFOMxFpgo+c5WimYz56JYD+A3/0+Sc88cCU30M6m67tVpwAY6AsNH4YmvhPYffzdSEyoanYv7ukrOga5xKNmtHjlSN94+odmAxthCassuHDeJ5jF0S+MVQ+V8b3hHh24uvT5OO+JA46s8ckK6gM9kgdj5KQXHiNif/8D2w6PkSCjCU0KMfSOLk1COMhGt57HzNpAwxMRn2V9Ba5rQC2fN+pReoau9Y0GasrZvGljfpmEAk8VyN0LmSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yu9/xQAD77EIoxmFDVZnSIjHYBTCvLPxtQ2HQsAYi8c=;
 b=xH4UL8HtY14AUs4v72k8pY1FN24xTQQp43MvAyh0uypBg63ZrEGv0ZT7xgsEwfreKzpuP/4iR2JNoW7GGPuRc43YMMDJfzjHEpoDhk53Oj5ZJ0gt59IeWYQaG0TEUUACphqOCpOIVs6DhnIHQ76fesYGtyIBCpdGsB2fUtrLIMkkBMURCjzk75asadoz5VV4C4RHndoZAKhMaSXo6QPqKBEhHe7+RGjcwN8EiqoRpZSqDinyR/+KpkCsgJlMGbjF02OZDVINzBX3WWEML0c+aYT3dXL4U1eOpyqS/Qy/NLcCVnmX+WPf9eZFWawBQg3x1k5LbJNX3NLrq/uDsji1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yu9/xQAD77EIoxmFDVZnSIjHYBTCvLPxtQ2HQsAYi8c=;
 b=ahL+/u4/bvjusYOIa/JnzJVKwRy9Ku+Fe7SlyF4D8s64NTt1e8cqbqfvgZ+5FrgBPZiwMXUsowNdMKPuxol4EVMabA249zTOy4eOicZ1FyQf/r50Y8Ih+W1iphZcyxnIH6xOgHwT0AZEWPJTGj/n9jQJHRWsH3oSRRXp1lJAwb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 3/5] xen/numa: prepare NUMA setup code for unit testing
Date: Mon,  1 Jun 2026 17:43:30 +0200
Message-ID: <20260601154332.30797-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0867.namprd03.prod.outlook.com
 (2603:10b6:408:13d::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: f760b89a-c32e-4b71-174d-08debff49ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|6133799003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	A6DSZPIJIGyMhd/1Ewz875Vn7XeV5pQguAMQZ2CUUhUBqPCSK1Z3uTG5sFTX7FY8hZ/s8eg4Vra1VuHG/asa73Z6aTfxV00ll6IgOherxcO1xylv2AgHwaOytR6WCrxDyCrme3W3OJT0oJt5jD9UkOUeQHQBDxVtboGdId8Qg5E2mx4U+hRPUSuPipbw8p0lcDOaWgLYJKfSW2p1QLgZnFDKkR4cHSfBpJ/QXVikiqiJfNd08GwTUBrcG7oll81R8PJW99Qy6POO9GCPWgevM6RM0NAFvGeBtppccm/pjQHOCtDKmFsqHEjnjLhdZlYMSET6zTpNPec/kgrk9Z4bo0LZ1tsM3LRGtT2La1EgENkdqYDRv9nBZgOWojLJMcOQ7QQvWY/49xE02WE8TmnWmNFAsXDiqP9Acdd1Lq3aruSEznhxjDZzb2HoJHZLuwBGdKVyJkZ6mscS2ZfeG/nLVgyGb5GWUG6cMpoXLV3km5jRunKQaFHYftNzBQjGU5I9DrufnAj4+aFW+Dy/p7a6FzdqaHfeGebiy3xA4VXsdqZYrdraUUOT9QabowPvJ0F0d79B6yKL3ySW7qXUWHlacDTiuban4i8nm9kmMIFlMoMCSS3WCJcFonZYDPQhYLf5QVjaqPuNRdYJo1s4z6RLrjPuJ8Rycr9z28bL2MuWKY4TypOhUeT805nFvGzMKL4l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRlbjhiSnFuRzQrdmIydHIxKzgyQTBXYmF3dkxVRzRzMk5yaVpiZzA4eWVN?=
 =?utf-8?B?REc2TTFvSGpzUzJvcGM0QTFxSmxYUVpJY0ZCMytrcTdybnp0WE9OZ1lpQ0pF?=
 =?utf-8?B?OFFleTUzdWRIL2pRa2FqaFR5UVBtVE5YUFdkeHNaRW1ZSzlJV0xwWHhIMnJy?=
 =?utf-8?B?OWoydUo5UWpiWVNEejNqU1NmVkRxZ3VFWVpKQ0FwU04vOEYrSFgwRDRUWDBt?=
 =?utf-8?B?VEZsc01uWmxteEorNHErNlRDSHFtUGV3Z1ZBbWRNaEdRRVNqMGQzQjl6NWta?=
 =?utf-8?B?bFBFNXA1NmhzQm1GVWczcWd5eW91NWV0Wlo2czh1cHo4cEprYTJCcjA1MjhD?=
 =?utf-8?B?a2s1R0JRQVp1QmVWdjVFUThWS1owbkxoMEgxRG54ZWJzRHg5QWZtcFNEeWVi?=
 =?utf-8?B?V05PWkQxK1U5bHJLY3lBUkQwb2RwTmNUR1FrRlZqR1p2Y0J2UEtmTkt1OGpE?=
 =?utf-8?B?TlI4ZmhGUkY2K0VLYTJDQ2dxQnB0SUVLVTR1a0xFRzI2Nnh6RjhCNkVHS0FJ?=
 =?utf-8?B?ZXhmaFZ5MmREaExVeGtYWnF3OWl6dGlQOGxKMmw1aXQxRXh2RE51NWYzY200?=
 =?utf-8?B?RUNLQ2VDYm9qVXNNM2NybTFWaXZJd3QxRktHcVZXK1VidThTTzAwQjVwckRC?=
 =?utf-8?B?U0pQcDdmNTRFVXIzd2k3eG8yYVR5MnBGTHkyUXcrYWZ3VlVUMTh2OEJpV0lv?=
 =?utf-8?B?RnhSTFRjNk1seXNPNE5pTGdUYlNrc0tYK0V0VjE4SnVxRXlHN09KTWErVXJP?=
 =?utf-8?B?ZGZ0ZHg1Z0ZkRHNiSnNPdDAvWENtVUVEaGxrTFhTbkJWdmNReXExaVNDUFNB?=
 =?utf-8?B?NnJMWE5xTTBrNGFzRU12NG04STBBMjk1NVR1Um90ZSsrczlPRDRwREtZa1V1?=
 =?utf-8?B?YWFQRjRYb3AraFF5aTRqR3NYQzhzMGU1LzUwM2hnWVdSZWF5QTUwakZLcUFH?=
 =?utf-8?B?TEMxNms0R1oyNFUvVW1OSUFHMjYwRlZCWFR2dXpVT1RjVE1GWTU5REtkSTRE?=
 =?utf-8?B?NUNnUk42TlM0eDB0TzNIVkZXQi9BVW90RC9EcmdjZE9Mb1dmblBJSU55T3dC?=
 =?utf-8?B?WHk0aGZHZEFmNEdHRUY1Nm8wSzY5QVBlNWJPYUNlWEl1aVg1T2lXdTlXMlNZ?=
 =?utf-8?B?QzFkVml1RkcyV2c5eGgxWk1sN1NYOWVsNExlcmM2UWFTdmRsOGNvNHo0R0Jx?=
 =?utf-8?B?a1VKMDZTeFd5U3JWaU9ZWjZKTFc0YkVCai9QMEEzc1ZBeXo4S3loYjRRVHJy?=
 =?utf-8?B?YXl6dVFCRldRcGdlNkp4M2Q2a1lrVEw1aFlScHBTelBubXBqenA1NVlObDNW?=
 =?utf-8?B?UWs3RzRrczRVQTUwVFo5UzBaZmcvcnhISUl1SjNIRGRnT1pQb3pMcFNNWWEy?=
 =?utf-8?B?dTZlOGxwcXk3aXRTTEIxa3pXV1VyYlhmaSt2NHVtam9LVy9QTk9HS1lwQjh1?=
 =?utf-8?B?OEhaMTkzZm02eEVQSHlMb0RVcDEzSVhCMVFLZjd1TURpQzNmOEVCc1JiNnZG?=
 =?utf-8?B?eG5PL2ovTTUreXdsN2hwWk56bGhmNGRoYXVzQlAzelAwTjc2MUpHNzlMa01w?=
 =?utf-8?B?c29iV2t0RC9KNzI2OXcxRWcxTHZhVXM5M3I1V1N1Y0R4WlhIUG1pUFZ1bFM3?=
 =?utf-8?B?VE5ZMTh5dThjUzdOaHVQM292dDlhUDFjV252aTFNd2FsRis4K3FCYzB6M3h0?=
 =?utf-8?B?TmFyeGxnYW5RYmw2RXcvd01SOWx4SFp2aVM0aEN3YjhRb3pOcU8wSlhuYS92?=
 =?utf-8?B?TWJWK1lwVlg0NjZReFFGU1l0amZQK0hxd0RVQUVkc3RsNWE3Szkwc1Y1VDlE?=
 =?utf-8?B?eXVCQ3JBQ1dTMlgxSWVWMlZROXRTNkFNVkhYV1ZpcE1aWXJoUnpvL0tZeEMy?=
 =?utf-8?B?N2FCMVJwQ0tRempNRElwak5PMHpLU0RybFRwZWVaK1VFTGRLVGx6dHREbEE5?=
 =?utf-8?B?TFBvby94aUZOWk5OM2FVaGpKeGVDVjhvTS9RUU9Dd2JHTmpjVjhIQUN0SElz?=
 =?utf-8?B?dktiYUZheEpQM2pXb1F3cnl4VnIwQnBObEhQVVFCMnNTWEhobEIzWEl3M29s?=
 =?utf-8?B?YjNRb1NDOHB6UTRZYUg5RkZsbUxXVGlQY0hVNUczT056ajNQMHlLdE9jaEda?=
 =?utf-8?B?MUU2K1cvRDlRcnpWYjVlVkk4Z25BVjIvcEdSQnpINWhpRm12Z09HRSs2QlV0?=
 =?utf-8?B?TXlKTGRKaFc3dUpUY0hMR2xLcnUwY1IwYjBvTUJzWStoWXJURUxSdGhIMDk5?=
 =?utf-8?B?Sjl5ejhFKzMvZzcwUThkWTdJUmp2UG9QOVg5OEpkS0dhSTZDRm0xTXdiQSt5?=
 =?utf-8?B?NnU1U3dnOWhLaFUwYS9aRlZWN0MwMGlQYlp6WTNsMkRzbksyZkMvQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f760b89a-c32e-4b71-174d-08debff49ea5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:44:08.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iOGQpry8bBaWqNCPYfl1p84ioKUoDlnakTaFR1I+qcbLYW8nk6ZC5FKQM6dvCekkeTglGbzveufmoBqaqWejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7453
X-purgate-ID: tlsNG-42698a/1780328654-1B77AF3B-CFD48377/0/0
X-purgate-type: clean
X-purgate-size: 1609
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE7C0621F76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce __XEN__ guards to differentiate between hypervisor vs unit test
builds.  Also move numa_set_node() so it's outside the __XEN__ guards.  No
functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/numa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..8544a1598218 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -4,6 +4,7 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
 
+#ifdef __XEN__
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/mm.h>
@@ -13,6 +14,7 @@
 #include <xen/pfn.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#endif /* __XEN__ */
 
 static nodemask_t __initdata processor_nodes_parsed;
 static nodemask_t __initdata memory_nodes_parsed;
@@ -561,6 +563,12 @@ void __init numa_init_array(void)
     }
 }
 
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+#ifdef __XEN__
 #ifdef CONFIG_NUMA_EMU
 static unsigned int __initdata numa_fake;
 
@@ -661,11 +669,6 @@ void numa_add_cpu(unsigned int cpu)
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
 
-void numa_set_node(unsigned int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
@@ -830,3 +833,4 @@ static int __init cf_check register_numa_trigger(void)
     return 0;
 }
 __initcall(register_numa_trigger);
+#endif /* __XEN__ */
-- 
2.53.0


