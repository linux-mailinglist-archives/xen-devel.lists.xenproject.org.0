Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C4CFF225
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 18:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197066.1514729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXRV-0007Li-Mk; Wed, 07 Jan 2026 17:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197066.1514729; Wed, 07 Jan 2026 17:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXRV-0007Iz-Jt; Wed, 07 Jan 2026 17:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1197066;
 Wed, 07 Jan 2026 17:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdXRU-0007It-Bz
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 17:35:32 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 423859bd-ebef-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 18:35:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5049.namprd03.prod.outlook.com (2603:10b6:5:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:35:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:35:26 +0000
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
X-Inumbo-ID: 423859bd-ebef-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF6qbVA0oTRfGpGBXoqNW4KYz/ut3aQFF0rmTTDwOhebEbHYuyzWzZaI9CNF1WIw6YPW+AS6Oy0L6g1hPK8BYTvL40tcHJuBV+FX4ePyXdO74InnMKIX74roxeIZVRhsP7JXypr5NyZfeuTAuHF/g66zUNP6SgMQRto/ygb2VZPxHa+T9/kg1xcJJ3OYTddi9X6wv9LAPd5hSoq2ua8a0I39xWZz7XDZ8tYfHjCabbOS2rTGEW9IYe9nW4yUgIX8CVTUV92sAyvmWgFTfE0gwSlMk4YqceW0rTIXC7l0EidczEnS5d4CDNBDgSVIOULmOawMM3u+1srUEVz8sSGfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oviRb2ui4rPxdpQAe+SAFKIeU8w+pVWM2DxTgzeU5OU=;
 b=c2tcG+wCtE7l3JoDQDE3pogewMV1DxSajcBwuAs3u/TpoZsKKf3x30yJc7LxPAjm9B+XBMvWnkiA+JCHSYpKZZxyboIivF/Zrnfmu6SK1oc/H8Pccc09x/+k3YAF2x+VfPcTrwpz2LXzL62Vw43mgG81w8CFMbyIcK0pU2wIywDGKQ8NRPoAyfvEC9LHTxdjIVuTGR9xkLEX6StQvntnDOrfft7YwypeLrvBKjIrFwPrT3FDa5DQTkiwXjOKirU+70UrsIW1qGx/lo+K+wGtYQfJr3mmhSg2ZYJvKrJtk7rZOrGbkXvFcrJOaS90uONeGishlOPHcX535jkQZlqf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oviRb2ui4rPxdpQAe+SAFKIeU8w+pVWM2DxTgzeU5OU=;
 b=FPdD9EYizOiMnEGnmY0Y+D6EwRXM+vWZgdoIyWkjn+HNix37KSAbiYKlwlJJ7dA27GA8c/LsWOC+kLaURT8+dIQMdHqhGpCDW1IMobDmsLHD8M7rPVlSKVgDyFj+igXdGDZLgQkRoU2yBCjPasyjthXHJMZe8R1oSh+nPTrUHD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] cirrus-ci: introduce FreeBSD 15.0-RELEASE as "current" version
Date: Wed,  7 Jan 2026 18:35:09 +0100
Message-ID: <20260107173509.56155-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAYP264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: af23d92f-217c-47da-78ca-08de4e1324e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2o0em8xeEFmaXpGSjErb1FQY1NmUTBhWkRub2taQmJpa2E0clI0bGFNVnNO?=
 =?utf-8?B?YjBvNkZ4ak4rRk80STVub2RtN1RRaitadTc2bnhJZENuWVJvV0FWaDhLSnZN?=
 =?utf-8?B?V1MydE9qczZpUGs0a0hVOGltK0pxYVh4ZW5qYWFTWUlhdlVqMi93WnZHb3hu?=
 =?utf-8?B?TjlhbEFaKzYzd2NRTis3N0VKODdwWDJ6c0tFZ1ZJNyt4ZXQzemdlTVZVbU5Z?=
 =?utf-8?B?eUpjVzVua21EaGVyMXFkdGVZOHVXNXM0bmdubmpnaCt5WFZyeG8rQkpOQkRi?=
 =?utf-8?B?a0ZmcVdCS1YvT0dBZGNWOEMyMHFmejFQZjVYaDFXamdaMm5WNG1kb1hEcmVI?=
 =?utf-8?B?OXRKWE5pT0JUL2hqWk5QNmh0RzhqMnhBeHB3WDByc3oyamVqcTJYdmdiN2hM?=
 =?utf-8?B?OXlyVklxN1dST3NHaDJIUHZNKzIzTnE0OU5kVVJRMFVkL0xIWW9IL2xacUs5?=
 =?utf-8?B?Mm5Ub0IrR2dMS3p1aXlRTWRQMlluWEVvb1VTOUg1N3h3S3ZHb3hWenM2Y0Fk?=
 =?utf-8?B?UDFOWWlKaklPYVVOMEdhR2dOem0wb3MxRWg1WjB4QUR0VUVNZVJCaDdtTFpz?=
 =?utf-8?B?YlhPSFNGY2drYVFIQ0tydmtnZEJzWStSY0NHR3d2ZlN3VE5WWlZFc2N0ZG9D?=
 =?utf-8?B?K05udEc4eWloZmp4M2hCOFhnREVJNFNZY0lsdjZqc0VSSmplSXVtaHNLcGZD?=
 =?utf-8?B?TExYbEdYU3BmbHlxRVFWOTRKVndvbnJ3Zkl3ekFvUHJ6MVRSZkV4Q3U0b1I5?=
 =?utf-8?B?N29qQmpldlpBeUcvRDZtaUZpRERWMHQvVEg4NVZPZmkzYmpEQzMyY3FoVEM4?=
 =?utf-8?B?SGc4T2ZickNlT0EzWGlpcEdQR2o2cE1FMDRaN3RFVEN6djRoQk5DaVRMMGlo?=
 =?utf-8?B?ZlRuMTE1eHJGN2w2TU43UmdyNjkwQUtwWnJQT3VoUlppUmxYWWtScmplZ3BX?=
 =?utf-8?B?eFJON3c4Rm11bFhqTjZ0azhOa1NNQjdxQmdLaWlnREYzdlZmZlNVTEFZKzFZ?=
 =?utf-8?B?L1UvRDh1cnZPSURDdlcrcnZVa2J4ZlBwa0ZzMFB5TXhzVGdQK01hNURYL25s?=
 =?utf-8?B?bTRmanNucWs3V2lnRzhjaHJ0RHJHUlVDeXZBRUhabnVxaUFpRzFIWnFnaEFZ?=
 =?utf-8?B?bHFJWWZUNUg0bWlYZ0g1SU0wY3RoRytyY2t4REFPOERuUWtuOVJVSDV3dFhF?=
 =?utf-8?B?NXQxTzN4YS9uckhMWWs5aDlwTjRDMUExays1UGZRYW41bDl1bzc2N2kxWDVi?=
 =?utf-8?B?TTlKT0w3eWRxWVVPYXlVWHJ3QUE1a0labWxnbDBRdWF0czRLRjk4ajhRMU1s?=
 =?utf-8?B?WkRqc0MzSEdFTDZXbmRsanpXODRCaHpZTm9hSHRwajFDUzQvVTdlY1Q5ZXlX?=
 =?utf-8?B?RmJPWDlFY0xybGdqWTVnd1haemkvZHhOUE82UGhPcmdPRnd5ZThoZzNVKzk3?=
 =?utf-8?B?RXBxS1VVVkIweVZJWE9sTGk3R1B6cWtabHZqZXNjclhuZXBCekJWSU9vbHlw?=
 =?utf-8?B?eVBWSzdGQ0k5UnczTVJ1L2ZMUm9HZkVCYS9kSmMrMFZoV1VialFlRnRiYWZO?=
 =?utf-8?B?OEhWOEtsM0ZTcWIveHYrYVdsb21QTk4rNjNXbVNUZDIzSzAvbEtaVnlad3ZG?=
 =?utf-8?B?SFkvVVVZZ2pqQzhNSDBQTTgxQ3dsS0tLeGlMZVBEalc4WWNsQkVEcEgyNytI?=
 =?utf-8?B?NkZySGRtUTFCc3JMTUlYZUtHWlBiS2l3OUtlZnptUDVLSWllMHlKMk5uTkh1?=
 =?utf-8?B?OXc2THJjMlZIODdxdDd1ZG4yazQ3WEp5TUJCOEd5aWxDNkVjT0VXMWk4YjRN?=
 =?utf-8?B?aENDd1VvYlY0M3BEMG5NVXl5aTIrRmh5UjduVVhiazFVa1pqUlNMbW5jR3Ja?=
 =?utf-8?B?azNMTkxncUFuK25HSTluck9wUVd0QVhhTXRCclhUcUY0ZG92ZnVnMVJMS3l0?=
 =?utf-8?Q?MQnq7n35V9iO8B/Ut5hZZ/rFvLQaL3Ua?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZGUGpTdmZheEpHWXRuVHFWUVYvZEx5ZWVHWkdrS0Y3VVVTdFFwbGQwTDYw?=
 =?utf-8?B?VDRaVEwzS3VZMktRaERvS3ByeHpjeDBjRVpqR3JnR044ZHpYcnV0L1paa1dN?=
 =?utf-8?B?TnkwR0JpaGhLbVBSR0I1c1Rlam9CelRXd1BsUjI4d1pBMjkvTTdGMkpwUS9x?=
 =?utf-8?B?eU1LQ29PVDloU0JHNGhnc1FXTTBldzJRRHdhQUE1NGR3T1VWL2k0M2xRWWpx?=
 =?utf-8?B?ay9SOVJjNWs4WFBWZ0hQOXJsUERrSzRJc0lsTWRNeVNkUFhOK3VNaVF5aG0x?=
 =?utf-8?B?d2JaL2hhYUxWVjNVelRqaTZyODY5QXFuYTJVWmVrN0RUZk40RndvZnNqQTZO?=
 =?utf-8?B?NW9YY3lpNlFTcnRTQ2ZwclpHYjNvZVRNbVp5T1RHalI5QTJGQW9RcUR6aVFT?=
 =?utf-8?B?Rm13ZnY4OWppeDBtUW1DVVRBR0JEbktrQ0ZoYTRhazhjL21IL2pCakMvbFB0?=
 =?utf-8?B?L3RiTWRmRVBUeEpoZmRlcEszTU1MTEliN1VRalp0eU1vVFJ2M2hmTlBEVUFy?=
 =?utf-8?B?SklWaUtvakltbGZVR2RaUEU4N2pZeXZ3NHcyY0ZyUTNoeE9kbFhMRzBYZFBJ?=
 =?utf-8?B?TEhhd1FPSEVJdkdHS3lBQ1BWTmwxMTVpbHhhcC9Sd01hMDV4QkhWdTNGU1Vh?=
 =?utf-8?B?MVJzekxOWDg2ZDZMQVY0TlQrZUprLzYyMnE0QW05MUl0akVMdzJnV3o0dTZG?=
 =?utf-8?B?cG9pRE1CUlhlRDlsRFBnYVM4ejIyWERSSGRCQ04xdGpnVGJoNmZQeWpQS0pW?=
 =?utf-8?B?YUw5VlprMjlaOGxMMWRjQU0vSURDT3AzU2JEb2pKZUtZYzl3UjVoQzlFZ2Uz?=
 =?utf-8?B?VldlOUJxejdYcVBETm1VWWhrVEhDb0ZnL2FZRG9hNnY5bGk4d2N2aE8xRlhS?=
 =?utf-8?B?WFBLTmJDcW5QaGZtYjRmTWYwSGhkZ0NwS1VreWFmTUt3SytiNFd5YWFHanNY?=
 =?utf-8?B?bUdzRHdHTTJCR0wycVFEUFBUbm9PSWh5U3MvUWxDRklVazNwU0xuNXdMdWVL?=
 =?utf-8?B?UDRxOENQVDVTZFNYSzA1VFU2WWh4WjVsTjgrVE1UOXpPNFBtZlVUUjdFY0Fj?=
 =?utf-8?B?eE1DZXhxN3BKd2NIQmRzWHZWVWFqM2Y2NzdBcVFacmdRSWpuOTQ3TUZPTXEw?=
 =?utf-8?B?emlFL0lYTzBTUWlXWjN4UHFscUtGblZTZVBqRVhLSzRsVk4yVG91SWdCWGsv?=
 =?utf-8?B?NjJqS2tUN2x5MHZzN3RPWXZnRFdZUUREbGN6eUx1Y0hwQ2dEZ0ZpZjZLUHN4?=
 =?utf-8?B?YU83SkxtdFptcUwvcmhPT2tMeFR4Z2xycDI0RWc4WHQxK3NBc0N3MkpTWW8r?=
 =?utf-8?B?WUl4YkxlbFhPZWwzOUVuMlRSUE9YQ2Q2SW1pWTJaRjZiMUJteHVBeXMrRE8v?=
 =?utf-8?B?S3kzTzhpUXdpM2ZLOEg2OGlWRld2VFY1eGxyL2dvQ0FqWDlENjJwM2M0SEQ5?=
 =?utf-8?B?amZIMmxXVkpJRnlldW1HSG1oZkhYVGs2MzhxRTlMQld6NHM0VzVYR0pvN2xj?=
 =?utf-8?B?K0RuQTlMMnpZa1diUFVpRDIxOUcxQkZCL0M1QUVTSituZUp5VHFHV0NDRnox?=
 =?utf-8?B?djl2NGxLRmFkWUhYSTNGeE5wNUhjL2ZmUjhvbnVGK094YXRVWmttVStOdFMr?=
 =?utf-8?B?U0IxdnZBdGNubk54V2YyY0VBSmMvdFQrRWJrQTlVRWs1V2doZGwxaHU0bEo3?=
 =?utf-8?B?clEyeUxVT1FJZytIcEZmRjhPd3l2dXczeGVHS0NHZnVDdGpqcHMxdFk3WlR5?=
 =?utf-8?B?RVhiL0d2M3ZDNzFLdUl5ZlVPc2NnZloyTzFJcHV4ZlBwNUJEa1ptdHBCM3Nz?=
 =?utf-8?B?WFdaN1lvczhtRGxtVlExa055M1V4amtHSmJKMHA4aUlkaWFTSmFNT1pON3RY?=
 =?utf-8?B?Q21ZVWthaFc2Rm8zekJIK2hYbmpuOFpHQTdBbC8wZm8yVWRubDZkWkVMNU5L?=
 =?utf-8?B?RTJkU3NBVVlZZmtsejh4TjZtQjR5STNqbk84TXJMYVdYVFpEMFVINmVKVGNx?=
 =?utf-8?B?bmZqeUJ5YnRPM0V0UEpQRC9oOERuL3RoaHFLanI2amNZOGJNM3RkY1hnOTNT?=
 =?utf-8?B?aEZoeE5rckhiV2ZpQjRmaFExdm4yUnhvZEVLMzBKc1AvWFlmdjZLMDlodTVC?=
 =?utf-8?B?SnlOSC9MQ3k1Sk9OcWVhdDhzbjZKdkR3SVpjMFdWOVNCRlVQbUNkaUFTY1FI?=
 =?utf-8?B?Q2pVU1F2Si8vdmMwWGIxK1RxWWdrTnYzSGJQSUhWUWZ0dWRTcVU1cWFvRmpp?=
 =?utf-8?B?NlNaTlVRUXhaK1NKYkhXRVhoYWFreXFsMHp1VHNzT1dWME5RemNQMHZoeVMx?=
 =?utf-8?B?MkdGWnpVZUhoV1BIa3FWYTAyOGl0SFJRdGlDV3d6aythbXMxRW5aQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af23d92f-217c-47da-78ca-08de4e1324e7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:35:26.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2YhDAP6FHhbSnA5kD6HWg19x65F/dFfbNzvVlJludOYcDZUogUW2U7MYv4GTFQycyR4C0CSzeOX6OiNbVgKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5049

Switch the current version to 15.0-RELEASE.  Sadly the 16 snapshot images
are not working, hence use the FREEBSD_CURRENT variable as a placeholder
for 15.0 until the issues with FreeBSD 16.0 snapshot images is solved.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 0de1012d8c60..7bbb4f1c5c6c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -3,7 +3,7 @@ freebsd_versions: &FREEBSD_VERSIONS
   env:
     FREEBSD_LEGACY:     freebsd-13-5
     FREEBSD_PRODUCTION: freebsd-14-3
-    FREEBSD_CURRENT:    freebsd-15-0-snap
+    FREEBSD_CURRENT:    freebsd-15-0-amd64-ufs
 
 # Build jobs
 
-- 
2.51.0


