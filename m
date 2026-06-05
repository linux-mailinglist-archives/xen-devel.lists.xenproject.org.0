Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZs5AifwImrofQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:49:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5464979C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:49:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=cFXfqOH2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329733.1593739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWna-0001AU-9t; Fri, 05 Jun 2026 15:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329733.1593739; Fri, 05 Jun 2026 15:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWna-00017d-6F; Fri, 05 Jun 2026 15:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1329733;
 Fri, 05 Jun 2026 15:49:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVWnY-00017B-F5
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWnX-0080al-LB
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:49:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22efe0-5cb7-0a2a0a5109dd-0a2a450cec0e-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:49:27 +0200
Received: from [52.101.201.49]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22f005-62f1-0a2a450c0019-3465c9318b1a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:49:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6545.namprd03.prod.outlook.com (2603:10b6:806:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:49:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:49:20 +0000
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
 b=yr5b5TSeAkuww0wax+YIzV9uV7BUXcbaRHZDO3qLDK9cXNVZzrZfH7NJKrF6IsGigsc5x4Otwu4C7kn+TU9zhntml3MKsal/tn04YqQkXrEcoRE2n2qll/0b1rsrmM5dhcNIzmbzZhOP7bwuMlp/VbUtpuV5OYeYEOVkqXOMPYoM+jt6gzCMEZ7Nk8CY+j+sMAN3XQfS34lZxRPgaLcLZB5HVxwvpU6lWH/yTOu8xnKVFWwQopyq4Au+nSa0HRprBt7tMZBJ3E5mk+ksTW/OoQkwn82OuVI+AF/IdHqWJ2eAelaS1nHjCNsaVAXpUclYqd0U4acwlVgbGr5Pjm47Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU5IK68VRrBIdRKWLruhVRnCMVD7OzGT7aNJKBoHBkw=;
 b=T/AGjJmvUWioyr+AMKqGDnLqrbC7WmhluSfdB9n6k01t3WlMC2Rx5kMz0GBJURGEX0yMPuv6tAqU6pqIGfr8mk0+06i2ma3XRo13LEMqzqYUFBScV+Zkp60JGR6p8qB8N0i2Ndi+LAF9b47o/J/d5oodibb23r0Uf5I1Io/Tbf4Bd7VgGmFbjzujCDNID7gsb9b0nL5kmdz9hBBmGCsYpcjlzmTgNSzl41Wp29dFi5mS7qdik6U7Iki4FKixRgaQP2fEPvaC5+TucYKFSW/rBwTXKCoeXbSiaxf/77jOpEISR5FjVAs/HmOuePSo08IDvrh1e47pd1fpqMkoMQuqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dU5IK68VRrBIdRKWLruhVRnCMVD7OzGT7aNJKBoHBkw=;
 b=cFXfqOH2Xxj+tYp5+GNylp56EN/Q3dxbgApFFG92O3BWbX8pWy2CQQxpBrOr3QRdU0EqysW81cfh9diZWQS1ahAQIunEt16iuFXuiUTdiIw0waxrPDRoJnhvdc86mFUeTs8ySJlC+KRXte4lSG4rBGziYPZX2ABOsXeeYMzmPrE=
Message-ID: <bb53f14d-0d84-4805-9bf3-868a8441a289@citrix.com>
Date: Fri, 5 Jun 2026 16:49:16 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22 v2 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-6-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603191836.77955-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::33) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 565d6920-eb43-4457-2e63-08dec31a0251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4BhBnI9811UrrDdeRjLYHNPTA4+HdaAJRwUmDOGOZhC78+XaN8usG8LxWERIwwMXiEVjAlET9kP1Jlcvu2GbcJZOBnIOmgHNdN/kplaRPMM1SDp3dPswoteqZun7oSbtciKoHMpS9D4kl1PGaPF5Fz5RWsMpyps04MLkvVAmGwCDccXXUnBXS5ZKePyNySBwZpnFyq2xDAbZJ/TZKK0zaI2IMksrlPnwt8/EyNtVv/uCcAgbR25Z0aUK6WDA+JfzyeToEjzHcgceBtL9hc7tztXcrPU8eMrVvksfiPrgXeGWzufMlxHzGT5VULPfcGvaRjEmTXqmp9aQ/X3lfhzQm52sXPjrPFh6NOPCBTwvDgDefsujtWWvND9S3YbiYAnjnwK9yweFyr7nenZVyyJoMO91Vm61ORqrKTHvzNCEv9z3K/A/XxPnuPGXZF7V9Hf87wCGhltYqZEdIcH89t8YQC1jxnQ9a33s3Csk60F8jpMsqcffjfz7i/UxU3AuZLComYvh8Ye9inmNOKCtprygUEkmRo9U5Sz80i5eGLF2G4PL0iftVnSbkazCVHPUB780tZn/+U0OeaYy25jvSs/9K8wfV6wdYzIpaQXLmXrYa2XvFdEtSVlf9dW3Tei9xkZLJzA4ifSJ4Kn35Mx8WVf3yICFC8oUdbAzKlfshcPrz6E9DUT/I/fMisr23wG9Ss9o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9WM25mWTFOL0d4YmZyay93bnpCa2wxR0tLWUI3ZUwxV0pJcHpLTVlLYVU0?=
 =?utf-8?B?Y3ZBSVhYbFc3S0M5SGJOU2xtS1VBRXQwWFdNN3crc3lzMFRCRGp5MnUzM2Ux?=
 =?utf-8?B?TFZSVThqeHRvUWJLZy9kYlZjMnJHazdPSzRwOVVCVkR5VWZlYTI1d0dyZ29s?=
 =?utf-8?B?OUo1S1k4c1FwUEtjbVV1b3l5akxsYTlWTHgrak12YUU2UVdXTXBoVVNUL2xW?=
 =?utf-8?B?NE4xUWJRM1lNY3h6bE9qcmJDbUdRa2RtdHJNTHR1UGsxWUpiaFhUOVJPb2dw?=
 =?utf-8?B?d0tPQWhDbTZEaDh6UnZCbDhtbStJNFdmeW91MDhQcE5QMXNITkZYWnBKMUd0?=
 =?utf-8?B?c0ZjZCtqODhmRnE3Mlp2dnJaWS9LT2drc0RaKzJuTTBCVC8xbVNEcndyMUN5?=
 =?utf-8?B?OEErTkpLZkFqMWF0MUJMYUZ2Q3ppTVNUVFdlcWRQTzZ5YzhFZEpGUTZsZmtt?=
 =?utf-8?B?YTB6ZEd2T2ZESVRzMGtzcThDSmRaNVBadDZ3MVpBeitDSDNGWkV5eVU5ZzhT?=
 =?utf-8?B?Ykh1UVk0ZVhlRlplY01PbndQOVBYek9UMlQ1Wm1YS1Z6VUhkc2lVNks3dDR4?=
 =?utf-8?B?RE9MKy9OY2VpMDYxU2NuZmltUWRGWExRY0xsL0Q3K0x2MkF2SDRYd3ZzRHVr?=
 =?utf-8?B?N2lwU1Bhd1dKRlYvcGdJWjUzZDl6VTVZZElBaTNRdGhKNUlYOTVxWFlMT2hz?=
 =?utf-8?B?K2MzY1Z4T1FWSWVkQkRWdWZHZHZFWHpYMWx0THE4VkVQVHluRFAxWUdnaFBm?=
 =?utf-8?B?K2QwczZRVTJkSGd6MDRwTXpTNElGd29MZUdtRzArZ0l3bGpNaE1ZNFl2eUdI?=
 =?utf-8?B?bEdpa0pwb29XZ1BTYW9DaGVTRWRtNVlRQVcxZitleDJvUzlrb3FQa1V1RzRP?=
 =?utf-8?B?djV5M3dITTY1UlA0UE9nQ3V6M0R5bHpYVTV4eldDL0VJTnVxd2paOXJ2ZDNi?=
 =?utf-8?B?NitkZ2VaTi9haWFnNHlzTzl4SjhZUVdBRVZmNmFobWJidWxsU2h4K1p0MWVV?=
 =?utf-8?B?RjYyNnNWNU1HN1RoZGFJZWJNTUk2M3FycHdBTEhLd2FtOWhuVDVKM1FyL1Za?=
 =?utf-8?B?SnE5SXFxMzIwVXgwekpRa3RjZks5WHl0RWEzb005b2tzb2xOQjhPUlhYVG1u?=
 =?utf-8?B?cmNDTmhOL1hCRE9YL1NSQ3I4NzA1VHhMN3dzaUNCVWRiNXFZamMycUNNTGFr?=
 =?utf-8?B?WmMxU1NJU1FjdE40UnBtbjY1WDUvS3V0TkRQTS9HNjJQL1dEbUd5WXpUbWE1?=
 =?utf-8?B?dHBuZGErQmRleEpRSitUL2dyNFN6Yi93K2YzNVhHSTgwampFMHBYUFpuZEx1?=
 =?utf-8?B?OU51QVVVVHZZa3F3R0E4YlB2ZWpTUkVLbWNITXNWTGY2bTRhb1VFRUpBREdM?=
 =?utf-8?B?SkN2a2h5S0RQbVF2TnFqM01JNFhSSEFSZTJqRWZRVFNyMDh2MW45R2dXeXFl?=
 =?utf-8?B?Lzd1OUxJS3F3NjlQWmVzUzlRU2RNY1phK2l0Rm5DaXZvcHdyeW5mb1JvbVp0?=
 =?utf-8?B?amRHZmtHWjNEaEdvZlJYVFVFR3VpemRVZUMzeDV5ay9zNFlWaExBUnFEQ1dE?=
 =?utf-8?B?NnRjUGFSTmJMalNRcGs2eXZ2M0dhVHpnQlUvcEdCeVMrTUxpT1poSWVOZXFW?=
 =?utf-8?B?Rlo3eHdrRTdlUlJ4VHRsbGhLaTBDL3BLVFFMUTJyQW5nMDNmQktjcHBEQ2Za?=
 =?utf-8?B?clVVYlFlR3JaMU15QU56akJ5TDJaYUJScWZvSDduL0pJR1h3b0xINzU3dFpa?=
 =?utf-8?B?QlVoeWwxbmxhdWdaeUkxbHYrVWNqWUFCUFg1NWt0dlpLZ0lxNnkrN1RQczEw?=
 =?utf-8?B?WFovYkQ4eTZnYzFDSEd4K2ZRYTFIVWZKQ1kyVTNYemtDQkI0dU5ZZTJKRk5M?=
 =?utf-8?B?Q3FNZ0gvb2h1WUZuY1ZwaVNueVZnd2RaTCtwcHVGUHBuT21uTDk4ZnF3NVhN?=
 =?utf-8?B?cDAzZ3hrZDduRzF6TVVlRHNXbzBPNStDTHcwUld4dHg1bU5zOFdXRHRocU04?=
 =?utf-8?B?STJyRFBnNmtaSVlGaTdXbEZ6QWhuWGJRODB5bFlYZjQyR3dEd3BPQ3FEY2RC?=
 =?utf-8?B?cEEzUUFaSHhnMnV5YTJTTHlWNHpYSE1CcGhkQXFaR2EvUjdHVlZSNXBTVWlt?=
 =?utf-8?B?aWdMSUNhdEwwNlpmcVdmdHp0aS9jOVpYaHRzTlhSU0I0a2xEZ3Y5RDBtMkU1?=
 =?utf-8?B?b0RCRThqMEpWRmdPL3d5SkFDeTZMbm5mQTNJY2xnUExkbVppbkFPYU84Sm9G?=
 =?utf-8?B?SU1oTmhPRTBLb1REanlxSS81Z1hQVjZnRlBuMzU0QUJ1TzdHM0xjVVBtVkh2?=
 =?utf-8?B?TGpySjhSWHQxVVBRZE5SMkV6TllPV1ZKT2FPSnZhZ2gvcmFkZG1ZRFZ4MVNv?=
 =?utf-8?Q?0Br6fPYz148rDWtM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565d6920-eb43-4457-2e63-08dec31a0251
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:49:20.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Qx4HGXxgjIa5VfxIjpnLmbpl5+dMZRbzoFex0rI1DBM1skC9CB0qqx/oZJfBJr2QonvOa1OGLXIOzj4PgDcg0xbtjKwCObAxgHzcniggU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6545
X-purgate-ID: tlsNG-d25034/1780674567-F5386CF5-F4B36863/0/0
X-purgate-type: clean
X-purgate-size: 704
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F5464979C

On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
> diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
> index bced68d4d7f1..8122e63a88ed 100644
> --- a/tools/tests/numa/test-numa.c
> +++ b/tools/tests/numa/test-numa.c
> @@ -158,6 +158,51 @@ int main(int argc, char **argv)
>                  { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
>              },
>          },
> +        /* System with unaligned affinity memblock. */

This probably wants to say "Found on a pre-production system", rather
than just something we invented.  The reader can make the implication
given the Zen5 above.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

