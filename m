Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPAGHfEJ4WnoogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 18:10:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFCB41163E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 18:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283760.1565895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDPI9-00056h-1u; Thu, 16 Apr 2026 16:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283760.1565895; Thu, 16 Apr 2026 16:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDPI8-00054F-UW; Thu, 16 Apr 2026 16:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1283760;
 Thu, 16 Apr 2026 16:10:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wDPI7-00050N-Al
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:10:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDPI6-00Dtx3-K9
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 18:10:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e109cb-e002-0a2a0a5209dd-0a2a45079154-28
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 18:10:06 +0200
Received: from [52.101.62.57]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e109dc-229c-0a2a45070019-34653e3932c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 18:10:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB4933.namprd03.prod.outlook.com (2603:10b6:a03:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Thu, 16 Apr
 2026 16:10:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 16:10:02 +0000
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
 b=VjX9KAkXoOaKrzbkxKC14lyKnodBUofaAr9bBxSI8naWlaouIXneTlW7yyjDzuz5+bk1bV4ZnxJqwo6dfymsgpieWrMpgvmEDggsux7+NcSFH+9qHSs2ZfEoeQfhnpdpScRYgkydjvtN5qf/L13fAyLMI2j4uLNvR3gSRi1pSQ2u7dy1PnFAlf2A25qF5ozp3vCKcuPP/SRB+KbjWi+MbdWLeJogxVoUi/lTxKS26uFkmLmQv8kdD6d3aBF8Cq4G5QwYfBbWy9nj2XnaMs/xt+jU2K5Wjo6WHgNDSeW5+f2tbxlLUQyMZL2N8djb15itSt92XbMBsvBKHuspJhtRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZAYh1M3kg71Mx1ghEtuB23cZ1yAuSu+vuHpMzOZjeM=;
 b=FXtj40FeOenNGIccmAVLXWlR2Ngw+wrEAm0YO8eES16i0lWZx585k/Oa2YGC9071RYrlMqBmxPwnsq718SsEN9S1pKnqQahFfCDdebESdO0nVVhzTwxD8XA8hlBFXpj+nCo7o7Uw5qgJMv4JNiS7p1oFXlRU5TaJie3CaU850WjJNfNS4O7qn6bPSlZX4Y25aAfUB5wbn1j23uA2A+wxLAAYGenqX2rw3BA4xhoFQg8Gz8anZx+WkHL7rucqIOkiftZxyk9LAA0gKIU7JaJZAtvyE621Ix6+guQt8agtUNIswkIC9PRu60Vnge4hTomO6CVZOVYvVvQ5sB+WeuBYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZAYh1M3kg71Mx1ghEtuB23cZ1yAuSu+vuHpMzOZjeM=;
 b=KlzIFQ3sHPcp7wPmXzBPHM8+o13exUdwvc5sYrxgeWI5mn/9BNL97VhFP8AARxPBKumyO0ZIYYoxcDvuo65MUPV5ENSBCckKJ/FLbR3OABRIFrdfERdCrerG4wbnOYK4CKt2T/HkG+jKDqg4+sqyVnyBXaLnkc0P4Ae3ypInJOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b4449bb0-f14b-41a4-959d-6c9517aff47d@citrix.com>
Date: Thu, 16 Apr 2026 17:09:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
 <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
 <3c8cba0b-8d9c-4656-b70e-f5c65017aecc@gmail.com>
 <9579ca3e-e98b-4d76-81bf-0f2e0df5a990@suse.com>
 <5de7ede4-b14f-4a36-b06b-12bf768b52a8@gmail.com>
 <4f18e2dd-911c-4794-af71-9c8b2b760d62@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f18e2dd-911c-4794-af71-9c8b2b760d62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0603.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe7e627-fbd7-4f2b-236e-08de9bd29d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lFwP9ksjR9vtNY56xR/N6mXvX6MDNGhbSzV5o4iDuio8nGaAPFUgXvVwMPXj0JAZU5/2M5uXKaFYk2SVS8CHp91GmwN0cCyY+WKb6+4Pdm5kw3ehc1Ql4vZK7P3Tkb8LLYa0bZ7BEl2JESE4tMc67NizXa2fnb68WA3rHUWaB5aqaSZAeQ7+FIa8BDM+e46vbwrVcwCg8sAI1C2+Pr/p7MriTXbaZsksiwVrFcpo28wXDC9Oi07tEviQZ/+8/25kqladxMOh/Tj7XSyT1TRsrMkC7nx9CnsDeKbzZ+IIPEM8RsgmLtotaQZHnTZ4Vf+f7lW5A5NlXQXdHkF28mwl5gVXgyeCOPP057nAAlNafWIyHJC9lTgasE1UzCRsk0FpZNIFCMSqUpBKdh3uOHCaeV/u/nsh20FDy8Sod7EI5tLnMWIozKZhOdWvWOSp1FAEzsYg4kVynrgHFJi1w2kmo+ITNRW26u1gb2icjx+RP64FEzgA7cUpstQC1LYrrdX6t7J6r0Qfet7jV5judPg2aQQtEpSze7Aea37Bqwj4nxm+/ehrOKWtuCwAB1/d9mrmJWWqsYsrILhzpK05kYf3etNqukltYC3EYHmnuOq4O6RjJdQUi/irRMW5Pc+ZXzwgrU6gaFyChBm86AudyWjLChZuBxzsRFleR/7ONGWeZE7EUFinvHYR7OHdvydCpyBx15mMh4MxGJ6u/RylOD02C4rKihWp/F/CZngRwQWUxa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU0wdEJYNTFVR2F0ZTk5QzlJYk5ZdS9jQ2trR2tBSW42K2VNYS9rTXRId3o3?=
 =?utf-8?B?WkpBSHVUNnZZWE4rUnR2VGNWMFVFR2hBU0VjMEI2K3ZmOFA0bUtKa21wSjVP?=
 =?utf-8?B?cG5aZjh0ZXpQRUlYQW14ckMzOUhPbXc1bmpZa2hmTmJvQWkwZlNqY0Zkc1Vz?=
 =?utf-8?B?bmNjWmhRaVZaQXJtTUdCTjBrVHZDNGt1YmVJYmlWM1dXTGg4K2xnTDUycXlK?=
 =?utf-8?B?eldoR0EzYlo3UHdFcjhmSnZBRjBRd0p0RlNkeTNGeUNMTzB4cFBIVW9HeUc4?=
 =?utf-8?B?NjlUNkFhd2ZZYnp0b2Z6NkFPa3F3ek9NOEg5K3lqenFEQmNRbllVZVFMTm41?=
 =?utf-8?B?ZUFiN21lMlgySFdWUTRSY2dIeXNobVdETVFRZmVSZm9PTGRGd0cxdDUva0FL?=
 =?utf-8?B?VmlJbXhYMGRXQWpXWWtBOXppMzJHYk84YUJab29rLzQvZHhtb3dDT2dwQ3lR?=
 =?utf-8?B?S0JldGdNUklJampTMERSZ3Y5OGJWQlk1R3BmS1gzY1JwVWN4ZndFeTE4K29z?=
 =?utf-8?B?ZUFja3NlcUt0TjhlRTlvQ2pZczNURDYrMG02dEIrcmcvQ09qcUJ2ZHlDVkdi?=
 =?utf-8?B?ZkU0VzBSMStFTERiZURMWTBlZ1o4OWFjMGVXYXFQc3pUaDZya2JPNC8zcEFQ?=
 =?utf-8?B?N3FnN1Y3SzZlelFZTEFuRVRxV0ViM3MyUzduLy93TUNoOWRueXFDZ0JLUDAr?=
 =?utf-8?B?c1RNSEZvczVBNEFpWk9hb1d4bDYxelEyaGdUMnR3RmxHcnNoMGRDQ2t3a1pH?=
 =?utf-8?B?STBDeHB2aTlZWlVwdFNiajc5V3hlTGVXU3ZNamxyK2lWTjFkY1hjVk1HV1Vo?=
 =?utf-8?B?UDA5NHBieUFGMHpBRTMrVzh6Qm9kUWhWOXoyc2w4TnBOek4yR2JiQjQvV1E1?=
 =?utf-8?B?M2hXNXBEOGlROFpjem9nWG5qdmhvUHV6RnFHd2c0OE9MUE03TWJCZkhLWWRS?=
 =?utf-8?B?MHRoc2FVRXhKY2w0UzFmMmUxdkcyYWxRWnRhbDMvWGdwTFZ5ekF2cXFxaEVx?=
 =?utf-8?B?T2NBd3lFaG5hY0VaQ0UvdTd5Ty9zbEMrNkNCc0QxS2tWTkxGVll0WktKL2pu?=
 =?utf-8?B?OHU3Vlo1UVd1WERNL01xb0NuNDZ4NkxFODZpL3BEQVdHanR3N2RnY05FMHZR?=
 =?utf-8?B?NFArT0tralJHRFo0dDkxRkZnQzRiNlFOZlk1SzFCZ0xpZVQ0Rm02RVdmZ2w4?=
 =?utf-8?B?UlFPY3hlQXNGejNJTUt5NzRCZXVVVWhDanRWMWM0eUFuUFFScTdQeUxBNzJq?=
 =?utf-8?B?aDRBc21BdGw0TW1vdW5qTG1FZGRoM0liZk1qcDVQczNwWHU2dnJvSUcvaFJT?=
 =?utf-8?B?RkFLSHlhZ1dsc1Rhd0hPUldZbzBmb2hXQkEwTnVtVFlEKzZGOE1rQ3ZOM1kr?=
 =?utf-8?B?aGQwenJzZlluUmZJeFFMZ2NTYW16RkNWOG1sczVVei9VOWJZWUxtaC83RG5U?=
 =?utf-8?B?NmN6VW5GMlJ4MWF1VGpZSXBjZWVoeEFEUm5ZeDVlT3pvMEpxbVZQQ21BWkVm?=
 =?utf-8?B?cXBWa3l0ZHZNL3p6SWlyMHQ2c05WMFJnbU9HMnczN3lLYTFyR3VnYjBXQW9Q?=
 =?utf-8?B?L3puT0hUa0x6azFSTTJVWTFLNXgrc3JqZW9jNVd4UFBzS0VwOE5tYSsrN2o3?=
 =?utf-8?B?eHk2YUM0TmF0NDlvbVRidU5RNHNDYU52d3ZtUE4rY2FIeVRuSzY4aXJpRFZL?=
 =?utf-8?B?WGFCc09qMzA2OFdlYTZ4YXhOeHlrQlBwdW9tdnV3WFdYREFkUEV0Yjhsd1d3?=
 =?utf-8?B?cnJuTVNHb3B6dHliVllkYXdsbytaM1VIL2dNaUFXOW9yTEdNa0dxZjNDSXBJ?=
 =?utf-8?B?Vk12VFJjNHdmUWxFREd4bzNNRmx0bDRWYVRGVnFmdGdaRmQvamxVR3I5T2JM?=
 =?utf-8?B?T0srTmRLM2pBdUNmWTRlbGFjK1RIZHZqc3lTdmttUXJHREVONURNWFhPM0s0?=
 =?utf-8?B?SGx1Z2xVSWU4czJmWXVTOFVpYnU5cm9Fek9NblVzRFl4c2dWaHVPb2JIVTkw?=
 =?utf-8?B?NFlqbWdPeDdva1lHSjJlcGcyd2pqVlhuNlNDYmFkV3VYVXUzcnVUYlcrQTdZ?=
 =?utf-8?B?T2gySGJjenRQMURNbmtEMm45M1NQNFhBVkJRRnEvMWYvZzNYc1dMZXdRemxK?=
 =?utf-8?B?VTFaSTlybkJMU3VqUlFMTUF4NzVDc1lYZTRCb0dTVXNuMUFkMnpDZ2dUQnBG?=
 =?utf-8?B?L1U3MHM1SXZOZ1BlRUs0N2wydUMwRkFLajdNQnVhbjBHMXZ5QXVJOXp4QmNC?=
 =?utf-8?B?N2Q5Sll5cWExYU90ejcrUmwvTE5uQ1pFYzBZdkZrVnVNNFYzbzkxbUZTM3A3?=
 =?utf-8?B?VWR0VWh4MkxEdGs5TWZpTmFrWHZFUEg5TTAyOXlEU3VSZ2s3RDR4eTBVdVhT?=
 =?utf-8?Q?991ePo0nrYzx0wNo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe7e627-fbd7-4f2b-236e-08de9bd29d5d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 16:10:01.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ+8V785/GTnpZ6gB0yTHeHdaemmAa0zmtEolxT0jJ8n+Ni8n5BlurhNwWWjEyeus4YPEi6THLyMsxrujUmof6e9UvLSd6f/ojGvJ4P/wnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4933
X-purgate-ID: tlsNG-ef75cf/1776355806-AFF7EC48-A8A71C49/0/0
X-purgate-type: clean
X-purgate-size: 3026
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BCFCB41163E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/04/2026 5:07 pm, Jan Beulich wrote:
> On 16.04.2026 17:49, Oleksii Kurochko wrote:
>>
>> On 4/16/26 5:45 PM, Jan Beulich wrote:
>>> On 16.04.2026 17:37, Oleksii Kurochko wrote:
>>>>
>>>> On 4/16/26 9:50 AM, Jan Beulich wrote:
>>>>> On 10.04.2026 19:41, Andrew Cooper wrote:
>>>>>> On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
>>>>>>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>>>>>>> index 7efa76fdbcb1..80f0e9ddae6a 100644
>>>>>>> --- a/xen/arch/riscv/time.c
>>>>>>> +++ b/xen/arch/riscv/time.c
>>>>>>> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>>>>>>>            panic("%s: ACPI isn't supported\n", __func__);
>>>>>>>    
>>>>>>>        boot_clock_cycles = get_cycles();
>>>>>>> +
>>>>>>> +    /* set_xen_timer must have been set by sbi_init() already */
>>>>>>> +    ASSERT(set_xen_timer);
>>>>>>> +
>>>>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>>>>>>> +    {
>>>>>>> +        set_xen_timer = sstc_set_xen_timer;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * A VS-timer interrupt becomes pending whenever the value of
>>>>>>> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
>>>>>>> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>>>>>>> +         * ULONG_MAX.
>>>>>>> +         */
>>>>>>> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
>>>>>>> +#ifdef CONFIG_RISCV_32
>>>>>>> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
>>>>>>> +#endif
>>>>>> You've got this pattern twice in this patch alone, and these aren't the
>>>>>> only CSRs which are formed of pairs to get a 64bit value in 32bit mode.
>>>>>>
>>>>>> Sadly, the numbering isn't consistent for the high constant, but we can
>>>>>> let the compiler do most of the hard work for us.
>>>>>>
>>>>>> #ifdef CONFIG_RISCV_32
>>>>>> # define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
>>>>>> #else
>>>>>> # define __csr_write32h(csr, val) (void)(csr, val)
>>>>> Just to mention: Since the comma is an operator here (not a lexical element
>>>>> separating function arguments), more parenthesization may be needed for
>>>>> Misra's sake.
>>>> I will define it in the next way:
>>>>
>>>> # define __csr_write32h(csr, val) (void)((csr), (val))
>>> Actually, yet more parentheses are needed:
>>>
>>> # define __csr_write32h(csr, val) ((void)((csr), (val)))
>> It seems like (void) should be for (csr) and (val), so it should be:
>>
>> # define __csr_write32h(csr, val) ((void)(csr), (void)(val))
>>
>> Otherwise the following compilation error occurs.
>>
>> ./arch/riscv/include/asm/csr.h:38:48: error: left-hand operand of comma 
>> expression has no effect [-Werror=unused-value]
>>     38 | # define __csr_write32h(csr, val) ((void)((csr), (val)))
> I was indeed wondering, but I did assume Andrew had checked his suggestion.
> Then again maybe it was only meant as an outline anyway.

Sorry, I was writing in a hurry.  My suggestion wasn't even compiled.

~Andrew

