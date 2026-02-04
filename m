Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ng0DCJig2nAmAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:13:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83128E8253
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220908.1529322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneZH-0001gf-52; Wed, 04 Feb 2026 15:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220908.1529322; Wed, 04 Feb 2026 15:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneZH-0001fE-2B; Wed, 04 Feb 2026 15:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1220908;
 Wed, 04 Feb 2026 15:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hC1S=AI=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vneZF-0001f7-Fd
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:13:21 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09afa1a5-01dc-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 16:13:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6877.namprd03.prod.outlook.com (2603:10b6:303:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:13:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:13:17 +0000
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
X-Inumbo-ID: 09afa1a5-01dc-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrGJ/YSmFYCsY/W5nkXXHoOI6btYJ8Zy1RUJRh2kAPwuKbWBWl9+D3SqB/3F8MPdSVZ7r+QAFxAFOA25/m59Vq+tvM7g+9ercgnr6Ku27VH67KyHLfOuPTElw2gLrGFi8D8xU6K6DKmUh9hZJ9R/7q5ymRHWiMmQ2H/h5Uuif16FKS7R1/mt3CCCGe57Y+rg8UumUQ7DkVG2tgkeNRWvelUd0Ytwy98tv5BQLjG9Zq7GgTqk7z2UeSOTz0hQjqU2frRyx68j0dxAEu+tiKxxeTyeIsNCAoOpg/1YWeOnI6AIr4c8QOllU6z4zQD/cf+Dhg6zBMVGqDGsdF+waMBW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QtljWU9r4SOm1pPzYouoeVIje9jwT91M/LzaLtsqFE=;
 b=VoqAfmzw6Q7fhjYOHVD2CHHifqmbL7EC0Xjp5re82fYzMWC5GOqlX5Dqw/otO8xsRk8WjcMQR6X8yKmn1m4l+h5Jons353C/RtmzeLbQAZ6k8/DmTVQBuTrXRgLdYXNTiQvRv9bA+CGy9SDZh12IFTqybluZDe4o8zQfaxii14Ma/RTJWrnbAn8KrRJxR8am+nlf/a5BLwTp5aoKOBWToiwwLxZYV8oqGhkS6RrAg3APs8owTS1jbj8RtL5+RZAEaNgnXglVALCGv7GHRiDLn6N2HCYmYPmcuTr9IgTATzFJ4IO0c+3fiRG4r8GRapsYsKx3Yodjkh8f3fV1vTh50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QtljWU9r4SOm1pPzYouoeVIje9jwT91M/LzaLtsqFE=;
 b=y2ASlSNsL89vqf7rkjDUUopEl3TYwy7zB4E9NlMFNKXZ7fX58rrTebE3bfSTMSwyNYRSshk6dD3m90E6iiyJn14Sa25ijO5zAZDT3fLXYmPakq2nVZWm+n2GKV4iC97171eIECAOdlc6uHZLKbkm4g1NJg0OVWgaJ49xNyduYMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
Date: Wed, 4 Feb 2026 16:12:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com> <aYNfVDgSgKCYd929@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aYNfVDgSgKCYd929@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd93b0e-0270-4494-248d-08de63ffecc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09LcVFwZXlyOXIxOE8yMko4ajFmOHoyOFd4T3lIR2U4R21ScEVqMjZvSEZ2?=
 =?utf-8?B?c1VEeHliMFZ0dFlLQUwrS1NTQUxGck1SV1lwZDQ0V2lOTzErYlJMY0RGZGJT?=
 =?utf-8?B?cTFyNjRCQmFwK1JBZEZWMFJQL2wySFZ3b05BRkxFekhZTW9GckF5Q2wySm13?=
 =?utf-8?B?UURyZ3lSTnA1RjRIQ3kwVnBQQkhlTEZsbTR4ak9nSVdoM2N5RG1Pc1d0Y2ZH?=
 =?utf-8?B?N1hZK2NsMVg1UXNQbTZpRVVmOE1HTWhyZ3VnR0U5dkpTM0JaWmo2NzZpNTJZ?=
 =?utf-8?B?Y1JqQ084S2RFdjIyWlB6dGhkeCtld0lvbVNUcU9iS0d4NUVIaXJKZGpXVld6?=
 =?utf-8?B?T3FZM2RNQ0NjVG1CNDJPdk05a2FnckRUTGxFQVdTSGVTV2hGVmo0bW16SkFS?=
 =?utf-8?B?aVRBajAyMm9oZGlkVTZMMjI5NnNVMHc2RDZjUWIzM2h0MUFBaHpUWGJGTlVU?=
 =?utf-8?B?WDRHQW4rNjJvdUFSVFp3a0tEcm5LcDZ4OWNxYzRrdHpJdU16V3prTmFqcVhZ?=
 =?utf-8?B?NzFyeVpzVEZ6K2FMSFVzVDlESmJQazJhc0g1UHpxSWRpaWlkanVSMzA3eTFz?=
 =?utf-8?B?NmZHM1I2Q1Bxa05vNXkvdjczYVgzaWpQZjJTR2YrbjJpNko1ZmJiM2pIV3I0?=
 =?utf-8?B?a3lFMzYrSjYwNXA2amR3TEMrY25RelRnWFJhUm9IdEdtNlZKTkNKR1RPSmI3?=
 =?utf-8?B?VENGMmQwY0h6Qll4S1VORnFoVEtDeUR2bUlOWVpPZ2ZyQ1hERm9yQlVILzdO?=
 =?utf-8?B?eHYyQUxOZjRZNTlxN2RPQVFQcElWb1pPL1ZOSm5CbHF4RU80cnQ5ODBVS1ZQ?=
 =?utf-8?B?bVlXMlNSYVdWanU3U2JlbzhLQ3NETVVkd0pzeEw4M2s2NkRzaW1PSXRQUlFQ?=
 =?utf-8?B?QTFsQS9DVGNlWnhucmVhZVZJRlFlZWxnc0FSU2JVTTFESm9BSUtNWVFNRjdF?=
 =?utf-8?B?N0hBbU96UW5pOVAyZks2QmorY2oxMSs2YXJuekZsckZ5WEQyU1NFM3p1T3BE?=
 =?utf-8?B?bVlIQzFrZ0U0TTZ1YWxjR3g1a3hiZUR1YlVPTDV0MldOSTZuVkFqeVlndFZp?=
 =?utf-8?B?V2JTZzJYR3N6WFJ1bkN6WVJJMXdoZXBleTR4OXk0K2dtWlFQL3Vrd05ybnNY?=
 =?utf-8?B?NFR4YjNLY012aVdBM05hRFBDdzM1MVlLVjhsUlI1UWxQZ09QVVNFVFdIZTJH?=
 =?utf-8?B?NXhHbzJMdlhSbWJLWVFYRW5JbHRCTEg4TWc0QTRxT3Zad3FWN09JM0I0SFNC?=
 =?utf-8?B?NVkrOER0MFVqZFdqSUxwKzNLSWJBV3NIS1N4VS9MWDhsV1BvUU8xeFMvNTds?=
 =?utf-8?B?WFc4VzM4Y05tMjVzcFppYTRhUTVtd2lBYW9lWFNLRVRGNzduRVlLQTBNdkVa?=
 =?utf-8?B?TmVuaUZORWVFOXJYeUZYSkdoeU9lOWp2bVptMjJIWjhkSE1ScTVQWjRQQmxp?=
 =?utf-8?B?UjVZYVNMakdRckxqOFprczRFMERXY3cxcDlGSmR3bDFMV29YQ0h4ZStRZ0lW?=
 =?utf-8?B?eGZ5ck9tV3hMNlZwU0gzTDg1dGFZUG1seG1rd25YVGc4ZzBVS2MyRU54SVUr?=
 =?utf-8?B?M2ZjZ1R2VGRvUm1VUE1YTmt4TFpOS2k0R3ZoalF2OG9oaXhMY0s0Qkt3TGxL?=
 =?utf-8?B?UjRuQTRlc0Rqd0VDb2FDaW5pNE9Xa2lWTDFCdytnOGovb3RnWnJ0UnFqWmpl?=
 =?utf-8?B?RFhEQ1liWDdVZC81Z3RwbjMxdVdsWEVlWkYzQ0VyNVpROEtVZGYvb3d4YXRk?=
 =?utf-8?B?bHJHVkFDcG13VGRlNW5sZTZuWi9MOEJueHpWK0hBY2hUM0ZUNFVsYVVTRW02?=
 =?utf-8?B?alpBcEtydTNnS1ByNU1GQnNRUmJoWjNoOHJCUnlCS0E0bzR6K081ZDBvUVRG?=
 =?utf-8?B?eFZFYnh5L0ErcEtVNHI2ZjFTODJSSWZPZzFrNHpWSCtSYVVjRzd5ZFZSMnVn?=
 =?utf-8?B?UjROeElHMWlzNE1OQ2ZXRWt0aGRYYzlRMVRTUmlOTk9WYXpuY0Q2ZjVFWnhB?=
 =?utf-8?B?M1U0UjZEaS9PYS96cmkvSVNwSHYvY3VBMHA3TWlubk5sUm1QaDZ3SktoUW9G?=
 =?utf-8?B?ZEpTYzBpTkMzaHNSMDZoZGc4M3Nra3dsclVQZWxUWlZUVnZWbHpyejFOTmVk?=
 =?utf-8?Q?Phno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS9wQTBnampWUlE5amhKbmtHNmE1dTFMTWEzK3hXdkk1OW1DeFh2MUw5Tnpv?=
 =?utf-8?B?M2wyYXZvY1ppQUtDRFArU01zZXRadytPc3Y2eE1IMEtLWXVOak9CSVpzWVh6?=
 =?utf-8?B?TDBDUENEU3krbjFac2trSURrNW9uYVZ1U1U1L2lGdC9TZk53a2Rua2ZtbG0y?=
 =?utf-8?B?RW45bUNEVHBhZjAxSEhNdnVsSUlOVlA3TGZPN3VLSjNWOUNSMTN6R0pWK0FQ?=
 =?utf-8?B?N3lPK0FhTHVuRUNSeU1LNGhHZDJYeUNOUkJKOGpYeWVFSlBlM3BGb2E4d2Yy?=
 =?utf-8?B?c1F2OGRvVGo0QUs5SHNNRFZJWjUwR0xZN3pLZVRsNy9PZ01aUCtNMXdlUE1F?=
 =?utf-8?B?bEV4OEdhT0lYRkY3L3p6MUozNkI0ZXNKeWpFOFBPSW80eitnZTI5VGRSZVVL?=
 =?utf-8?B?aG9VNEk4RmFLclNJMlVNK0FBMHFjcmNLMC9pblpYaWtWWkxJNzFhdjVpRWNY?=
 =?utf-8?B?NjBTT2h2ZHo3TjhXSlh2cUlCRUJNYjVSK1ZxcGxJREpQOFFKNkxZK2tTTVQ3?=
 =?utf-8?B?dkVaWFN0ZUFnZUNMTEIrdElEZWtWZG5xZWZRbjlFRWlQdzZNRXhZSUl5VkNT?=
 =?utf-8?B?dWdZK1Zhbzg0K1JqZ0ZrWUMzOEg1MEVYam1LRmFnWkFHYzErdXBKMlIwMWNZ?=
 =?utf-8?B?RXlPYUNDQWUvV0V3NHRxVXFCV2JLdnRDOVFqRSt4VWN3NjBkRmQzaVhrSzI0?=
 =?utf-8?B?OGJQOHoxcmpJTy9QSkM5YitxbXkySDZwSC9TZnpWK2VCNDUzQnRCckJNUE9F?=
 =?utf-8?B?SFdkSjJzSmlyNE81bGJwaE5tdXd2czRLeGFYMG5Nc3Fic2hIVHdrejY2YWRL?=
 =?utf-8?B?UjR5a2lhYnFlaTQ0cVQ3YkJqNkVJQ0dQMzh5SUlTUVp6NGVObjdpWmN5OGlR?=
 =?utf-8?B?VlRJY3h5QkhxNkFBOXVUa0pxVVlQZDF5L1V4OVBld2wvdGt0Rkh1dzVKSGlx?=
 =?utf-8?B?M2RjQmQ5UVlZM1ltQitOOGk1N0h1M3M0Z2ZqZHNRV1RVVzJGdVkxbEsrdXpM?=
 =?utf-8?B?R0dOSW1oNXBnZTI5T0dTUlFhdDVsU0JnNTZJd3R3ZDUvRDhudWpzNkp1T2FE?=
 =?utf-8?B?a2xUMWNxK0ZmMXRibHlEdFo2U2poYUVvNFJrNUlTQVhRcjA3bEpUYUFiQ2Zp?=
 =?utf-8?B?REhkaGM5Nm1pOGJFRXUwMzdUYXJlb3hBT0EvRXE1eFZwVjBqQmQyTTc2QTlQ?=
 =?utf-8?B?cXliRkF1a0hNTThvd2QwR0x6bmdoN3hkU2ZBMjNucTBvNDd4U3RUN3J5RTBq?=
 =?utf-8?B?VU4zcHVaR3pFT3RaT0t6YmRXZ2l1SlI2d2ZjR0NyWGFrRnpMTTc5czExcVNL?=
 =?utf-8?B?cmx0ZlZtYmhXNXQ1b2pwaWUzRFVKdWVFQ2dWblE2ZFF1UHNSN2UxamdacU4w?=
 =?utf-8?B?dGxMcU5UNnNoU1R3OVdTNXc5SEkybElXVU9KSExvQ2NMVTFkWEdKQXM1TG15?=
 =?utf-8?B?TXg3cFdnclhveUd1Vi9yb2lXV2l0ZHhQamtYbXVkV1hVRGhtVkt0R3hhb1BC?=
 =?utf-8?B?c2dTemY3a0c5N0tHVGk3TGVkbVE4UksvZjVzMDBiMHltSlJWSk1DNkNXMXZt?=
 =?utf-8?B?eUs4Q0RVVHdrYlFEelRpTERSTWdZQ2xoQjZFNnIvY2lFc3BiTEtOc0lmTWZL?=
 =?utf-8?B?Q29adDBUeEtkNWU0MTlvRUE1VkFISmFuYVh5dVdRelRlc0tQakNYQXBkMnBX?=
 =?utf-8?B?d01qU3laWURnSjlZcGI4RDkreXR6aTRuQVB4elplcW9SR2NWOERadGhIa2lP?=
 =?utf-8?B?R3o1UStZMnV2RTU1VlYwdGpleTAzUjZKa1hFY09ZUGdSZEUvTlR6ZVkxWGFl?=
 =?utf-8?B?QTlUVG5yczdVemNpTGg5Q3pqS1dkYVlPMWxSTDFjTHVFckkzT2txZGV6dnF6?=
 =?utf-8?B?cnh5VkE0Z3p2dTFRTzNxdURWY2pKVW14TUZNZExkK1hlQTNaSDRyaFk4ZDdm?=
 =?utf-8?B?bTNvMldzWFFhYUIxMVo1QS9RZHZiaXJJSGVLdjB0czd2UkRXbSt3STB5TCtD?=
 =?utf-8?B?b2VwOXErSy9jQ1dYREtpRnhoU2NNSThnWkV6OG01amptT2lYeURYVHk0dWFu?=
 =?utf-8?B?TlU5MkllM3ljWEtlcjBOUXdkTklqMGVqUFhRSVBCK092eFB3cXlXKzAvTFhS?=
 =?utf-8?B?YXNTdVZmVWxmUzdpQVBHZ3czcFdOU0svS3Z1a24wM25rbHkxN1BVM1ZibkpK?=
 =?utf-8?B?and3VDJTOWo2MFBxRVkyTHVQZUw3aC9xSm9qS0gwMnJWVFEwM2RDRVJDQXYy?=
 =?utf-8?B?L3E2U25NQlZwNm85aG5ZbzFZZnJ6REM5UlRDK3VIazkzYk51RTU0OGNPQ29F?=
 =?utf-8?B?ZkRmZ1VnVG5sZ2hHNXlEb3k2WGxoM1E1aERKUlJ3RDgwVWJoUWRYemZOUWY2?=
 =?utf-8?Q?Y2VDBGOToiSmqVZo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd93b0e-0270-4494-248d-08de63ffecc6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:13:17.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E74r1lOX/wxga9rzcD+QPlUrmegkzWiTL2Mg/5HAi9e07LehDFU5vqbZgZYe35TqN3CdeY8Nh+AtEzSHE46KZO1lJUvgMevrDhC/WUAPcKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6877
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 83128E8253
X-Rspamd-Action: no action

On 04/02/2026 3:01 pm, Roger Pau Monné wrote:
>>> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
>>> +        /* Ensure all references to the old shared_info page are dropped. */
>>> +        for_each_vcpu( d, v )
>>> +            vcpu_info_reset(v);
>> switch_compat() can only occur on a domain with no memory.  How can we
>> have outstanding references?
> As Jan pointed out, it's not references, but stashed pointers to the
> previous shared_info page.  I've used the wrong wording here.

Yes, I saw that thread, but my question still stands.

How can there be any this early in the domain's lifecycle?

~Andrew

