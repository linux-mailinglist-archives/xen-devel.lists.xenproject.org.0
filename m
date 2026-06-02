Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ysM2NwxtHmrLjAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:41:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF3628A19
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324464.1590012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHsL-0000Qx-PT; Tue, 02 Jun 2026 05:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324464.1590012; Tue, 02 Jun 2026 05:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHsL-0000O9-Ma; Tue, 02 Jun 2026 05:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1324464;
 Tue, 02 Jun 2026 05:41:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wUHsJ-0000O3-Ra
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:41:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUHsI-00FglA-Q0
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:41:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6cf4-5cb7-0a2a0a5109dd-0a2a450b8c4c-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:41:14 +0200
Received: from [40.93.194.8]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6cf9-212f-0a2a450b0019-285dc2088be3-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:41:14 +0200
Received: from DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 05:41:09 +0000
Received: from DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2]) by DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2%5]) with mapi id 15.20.9870.023; Tue, 2 Jun 2026
 05:41:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMYTNcdODrpgPW8S+RTvYXEKZqxrJtHljPsOPFKfqsV4pDAMqj7r1JrCnK2jV53LBAr1cgcyelzHhOmW+GRpXFSIxqZAbw5zH1EipGXSEl592kBYctl0bmlb1qtN4oZaj1iJPo6acgpXY7Vuohr8tWV11Bg64WkjSj4KV9YPnfxRZq4mntKet/fmcvl+HKcG9x5p2yJYIOffaxN7Y+SI4bh5GyU1/pGzZ3gEzLUrNatlM8TbXOioJlasHh0fOpmHqyjRmklU8edXtqmM/giNLxH31m8AQrZnC2SDCCGY65vgPAP77kvOMjV1VIgA2Ic6YGR68/4J1aI/eXKyomn2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjLjKd9zOgeX8FDRwnBV3VRSkrUNaligsldIFJb7QRM=;
 b=iQ2/7fJEkfEGYbJpc4vLfIX599g1JEq/9TPmb/X+WH7CJ4rjxl5QzqpnU6Oj5O1uCnOwdJ/RhQ2qwdmsGD+LUNHgYpUMxw3k0PFKBEmv+0xwuryuyJYO9DL9C4VnBpTOp4pVIpdugF8TsJWcq/2pvvSc9eIiherCr0wRnmxpCbnE/taSNPOzQClAhDC1d8ZL8MmKWJ/rL/A0bmT88XEfFWC6fRdry/lx5bMpLeIxkaPmWctiwwQy0C8w1F9JmxcBosvdvlVKg2K+FUCNIQBVIX4WSwdlW3TU6+P9K9OKdIF/2l+hIO5Xz2HyYkc6WC22MxpHQK2ZCXBU/VaPK7eXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjLjKd9zOgeX8FDRwnBV3VRSkrUNaligsldIFJb7QRM=;
 b=x+eINqGYcxHGeNWBXY3BaKK6znZfJ9cnPgVbUWeoAC+ufg+WW1K0F4sPAFqiNw3A4hxrR6u2MQUkpHgRtzbHCA+M4Ssae51sKRELxjU3RE0gYrB2CVOFcRHL1Kv0pgB+MD7sdOmROgZEtf/W+LlNYYD9wP22+wtClqete+5Ljs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b287bd22-c28a-4123-a9fc-02e8bf25126c@amd.com>
Date: Tue, 2 Jun 2026 13:41:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ns16550: add support for ASIX AX99100 PCIe
 Multi-I/O controller
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
 <20260602053421.773149-3-Zhao.Jiaqing@amd.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <20260602053421.773149-3-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0035.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::17) To DSWPR12MB999151.namprd12.prod.outlook.com
 (2603:10b6:8:36b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSWPR12MB999151:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: a875da5a-4ce9-433a-c4b2-08dec0698c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6aPmBvz9Tr6IoYr0kHsfT0rG7c5UGoxRf57Euggalmns4td5JKr+s2ADnRuyHcLsaKTYHScupwfLplG3TeV1iqf+NivXEDqoKFXTOyOXmIyojWGwdAnXfMpFwtSrhcU/WZvJaf5e66928EfUp0XsPVvGTVtQOSqrVtt5+FWu1CT7PCn2NV2713778rsa25SUcYNnB4IzpIiTAKZFWqUgyeb9UYDAEvLl7wqtayT9uCoXL/CNPiUDxYzIz0Ov4BIgxixUslAERnw4dIFRzEZjp5vo7nNFdtiGbIp666ugvfgKrXMIZSJPOTr5E0v/zYW5ScgRVqYwwO5lH5eNvBUhhakjRWHzaIxYYRGhP3Q3wqAc4Zn9QdB5x3MIoTmca9YzbzRQIYQ020f0VoFRXhhDqwlrh3iM1zBB+cZ+cWYt58/vHcfFP5GdvptDX03JJb2CvZr0Zrq1Ryde+8kcqTPEAzEzKSH3AkfNOAMq8A3LTZdpgrdJ5tIrlziYLdZFSgaeP+HV87ILybhH9UD18EDHqS+LFuXSWm9G/nda2regAXXvhjYHbb3YasyOCnYKNTEOAXBk2vNUfzy2op6BAbMKZGTM/F6+y4EoPigGy82U2cewLuBQZii2FG7Flbk4nu7HzIzf8A9QQOhJoVqdwGeoIY825GODfjzvV2FnBcg4s54Kk6zMVxpvNfnbbkTVjhLj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSWPR12MB999151.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pXTWhCT1pIblE4WUZTd1Q0a0EvWi9GbDZZSUZrVzkzNUdFYmFEQlp3N1FJ?=
 =?utf-8?B?V29ianpIN2VPMyttNjArY3lIdVkybGZnVFZZZW12eUJpT2IvSkVXL1FjbjBv?=
 =?utf-8?B?UndsUmtQWXdRUDE3eGJkSDlhd09ydmk3YjZWQkNUbGNuMmtyOXl2Z21ldmtM?=
 =?utf-8?B?WHNrck0wa1VxQlJBZEY1alBzb0EzUkY3YWhGYzgwUTJSNndJd2RVTUhHWDd1?=
 =?utf-8?B?dnhlSjFMWXBwQjFIU2IybTg2aUZaRHNrUzZseUhpbjlDcGZYSmx1ZkpVQmFp?=
 =?utf-8?B?RVU5b0s1S2dPbmlMbWdUOVF4Y3YyM0RaeFpFdXJucmY4MWNnZnAvaUY4YXYz?=
 =?utf-8?B?UC83dGkyMkxKWWozWnNEZ0xkRkxiTXhoSG1IN2tOOHN5cHdxOGdEdnY0NkVR?=
 =?utf-8?B?WEZjWFU3dzBidTNld3VyeUNQa2V0YmVFUEpiZ0Y3NG9HOVlJc2hwd0VuaGs3?=
 =?utf-8?B?RUcvYVpKLzFnZ3VBeWJ1MDBWUkkyUW02UEludkZ4ZExvS01GdXV3dE9zamE5?=
 =?utf-8?B?SVBOa2hWTFZqSWtaRVJtN2MwTndhOHA3K29wT0NJaW5BclNVbUZBbitYT05z?=
 =?utf-8?B?VXoyUUJFenYrUU5uUVRlZ1NUclN5ckZyK0xTRnlDaHl1c2dyU3E1cTdMcGhS?=
 =?utf-8?B?YktzMlZOK1dlckN0dklwZFBZRDUxc2FyUHU4cE5PbEtLNXFMcXJONys5cHdh?=
 =?utf-8?B?MTNPQkJwTjVlNmF0dERxZnhrZnE4dy9FSGlxakpEeW9XYlpTZTBOc2I5MDND?=
 =?utf-8?B?Z3d1cGdBMTY2TEhsYVVVMUhac3ZwMVpIZlJTbzM0S2hxZWtnQS9JUXRTK3RP?=
 =?utf-8?B?cEZBV2QzZWwxSTZwYjM0N1hMeHgvdXRVcGVxUlNOOFBFMWlBRGFWZTV2VzJR?=
 =?utf-8?B?YXFMMnBkSldTQkpmOVJWbWQxSW1pMHVRNms0a3VxcUVDV3hod0tSSTNqdXZY?=
 =?utf-8?B?TjZiU2tTcE9IUm52dGxMUGVhNm5TUmZBWHliWmJZQUhxTEVQTjhUZUt1NlNz?=
 =?utf-8?B?bVR5RVZoK00yQk5lYVN4V0xzcHFUYjFncFZRd2Y1N2R2M0VISnJkOXZBQnZz?=
 =?utf-8?B?Qk4xcWlmQmNjdUlPdVlNQ3l1R1V4TUhUc3hGckgxSTkxb0tpcUMwTFJScVdL?=
 =?utf-8?B?QThRWjlDdWZRcTg0cHRHdzBkU2lxOXVFYVR6ZlFBNGo2eVpxS25xSTNBN2p6?=
 =?utf-8?B?RVhjMDd5a3pRYXdnRWRGcENlNCtmZ0MyczlkeElwNG54eW5DV0dwU09RVTgz?=
 =?utf-8?B?ZEllZWRLM2tTaEdIdCt3Sk44OXpXWmNtak1BM3VmdWRvemlwUzlUdkMvV3N3?=
 =?utf-8?B?dTZEWTBuV3BScVRkd1JINkhlNldyUzU4M1diWEpqcHh5OWx1VTI0MEZ3UmhL?=
 =?utf-8?B?L3pTeWRuLzBiMS9jbGRsOS9GcUUvNmREQVRDS0h5YWhZMkMyVG4yb05kblN6?=
 =?utf-8?B?eGNOUDUyaCtuYlVRcU1oSXlxcWh4MVQyMHNpcTNPcmhObGR4M3cxQ2toejAr?=
 =?utf-8?B?MmUvTlVsdkFHc0xzOGlLRUJnbnR4Y0ZHZmYrOXp4dWpseHdqNTBPaW1CdkRL?=
 =?utf-8?B?d0JoNnZFdk5FbmNlN2VVckJQSlNiU1RKSGZEYVVSRXhkY1poRUc2dkNySm5K?=
 =?utf-8?B?aEo1Uit5TXFwOFAvRURsK0lYenFoQWFEM0pZdWF0VmtHUndXZlNDeUM1N2lV?=
 =?utf-8?B?em41VHhBZHhWY2RONXEzTkFsYzQ3aUFVRGtGT3F6YkhZbU9IV25rREhDMlNu?=
 =?utf-8?B?K2UzVkR2K0wyRmlrZzFUUDZFSmQ0Y0pQYWpxMWhsNE12RGR0WHIzVG9PR1Vy?=
 =?utf-8?B?TXdSNUlYOWN0WmNWbmUxTlh2Vjd0dkZOUGhsTUsxWSsyZGJHY050aDhJOXNn?=
 =?utf-8?B?MFhFZWQyNlV1L2xEaGxlbnY3S2NzQUc0Y1dPbWhuM3NVRUQ2aVhyc0diN1gv?=
 =?utf-8?B?blNrTTJ6UjJDNEZiektXM3lIamlSWE5PTHZlVld1b1NoV3lUSHdjOUVSVkdQ?=
 =?utf-8?B?YlE0Q3ZldWNqTmlzYkM5U3B1QWFlWTBvamJubnBCOWs1NEYxSDJQV2dINUNE?=
 =?utf-8?B?bENhbmkxMmJDZ3dOb1RxeUpaRDUzUzJJRUNqRzlEamJPU3lzRmpVYStLZ0Zk?=
 =?utf-8?B?U3JQOHhiSVNiYml1SHBJSUNzZGg0QWw1TitlZVZzREdaelU0SVE0TFNmQVIz?=
 =?utf-8?B?YkNQN05QZzRMeGIwTTNKOE1KMlMwVzZsUU02UWoreXlMSkRVL0pkZVJtUmUy?=
 =?utf-8?B?alFTVUlnWXN5cTE1UG9EcGRGc05Oa0QyalJCUHVLcGNwbCtlUDg4REdqREhH?=
 =?utf-8?Q?LoiK5px/ujtJAxTpcx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a875da5a-4ce9-433a-c4b2-08dec0698c11
X-MS-Exchange-CrossTenant-AuthSource: DSWPR12MB999151.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:41:08.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7iim5MWo1vqLQMfCwVlacF521YxdM2JSpgGjeJb1tTgQstnN2kDiv+6t73tr4OOtIsSPXaH0gYn3bPyGDcoSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
X-purgate-ID: tlsNG-42698a/1780378874-1956BF3B-418A5367/0/0
X-purgate-type: clean
X-purgate-size: 2481
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1ECF3628A19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Apologies for the noise. I forgot to remove the incorrect tocmd in git sendemail config and
accidentally included the maintainers in --to instead of --cc when sending this patchset.

Sorry for the unnecessary notification. I'll be more careful with my git send-email recipients
next time.

Thanks,
Jiaqing

On 2026-06-02 13:34, Jiaqing Zhao wrote:
> Add a PCI device table entry and matching parameter for the ASIX
> AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
> chip is a standalone PCI function, with UART registers on its I/O
> BAR0.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/drivers/char/ns16550.c | 15 +++++++++++++++
>  xen/include/xen/pci_ids.h  |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index cf10a06a3d..26503070dc 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -96,6 +96,7 @@ struct ns16550_config {
>          param_exar_xr17v358,
>          param_intel_lpss,
>          param_wch_ch382,
> +        param_asix,
>      } param;
>  };
>  
> @@ -872,6 +873,14 @@ static const struct ns16550_config_param __initconst uart_param[] = {
>          .bar0 = 1,
>          .max_ports = 2,
>      },
> +    [param_asix] = {
> +        .base_baud = 115200,
> +        .reg_width = 1,
> +        .fifo_size = 256,
> +        .lsr_mask = UART_LSR_THRE,
> +        .bar0 = 1,
> +        .max_ports = 1,
> +    },
>  };
>  
>  static const struct ns16550_config __initconst uart_config[] =
> @@ -1212,6 +1221,12 @@ static const struct ns16550_config __initconst uart_config[] =
>          .dev_id = 0x3253,
>          .param = param_wch_ch382
>      },
> +    /* ASIX AX99100 PCIe to Multi I/O Controller */
> +    {
> +        .vendor_id = PCI_VENDOR_ID_ASIX,
> +        .dev_id = 0x9910,
> +        .param = param_asix
> +    },
>  };
>  
>  static int __init
> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> index 15e938225c..fd424ef55d 100644
> --- a/xen/include/xen/pci_ids.h
> +++ b/xen/include/xen/pci_ids.h
> @@ -5,6 +5,8 @@
>  
>  #define PCI_VENDOR_ID_NVIDIA             0x10de
>  
> +#define PCI_VENDOR_ID_ASIX               0x125b
> +
>  #define PCI_VENDOR_ID_PERICOM            0x12d8
>  
>  #define PCI_VENDOR_ID_EXAR               0x13a8


