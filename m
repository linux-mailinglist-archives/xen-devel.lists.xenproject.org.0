Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C2BbB8Gck2kM7AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:40:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64170147F2C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234558.1537771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs7FZ-0001Nl-6C; Mon, 16 Feb 2026 22:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234558.1537771; Mon, 16 Feb 2026 22:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs7FZ-0001LB-30; Mon, 16 Feb 2026 22:39:29 +0000
Received: by outflank-mailman (input) for mailman id 1234558;
 Mon, 16 Feb 2026 22:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vs7FX-0001L5-Ce
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 22:39:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d7af7d-0b88-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 23:39:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 22:39:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 22:39:16 +0000
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
X-Inumbo-ID: 55d7af7d-0b88-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv7fTH971XI1vl/FhG5GGS+9JTHM1aDqbyiAYa3y9nKBdEFlYrCTK8Mzn9XjrwoorasLRwXk3z646d+N1NPmuIoxWcM05XLCioGJc3aRom96vo+K4GK1TBdba1TiiIe9uatQqIXSltXuaaRj/m2VhhJI+nxop8hBePceWLYk9FNgPEVUD3PgvQJ7jqfYdEqLpzhApll5h56O1U2BxUFYFLW8T51VJdcL9nxWoKxL7WYl+i8GhUOVOcZqJNZ03R6B5xYlJqDOyLPsLsVX/DWgBXfESBZ3smIVwQggDgOhpvMhiTR+fxJ/5YtwXwwcmCfGcJ7ePlqd5e67fncyco43hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHjXK+OGI9aiBsAuFp2tMbIuPCJIHSyjqu3esmX/aQc=;
 b=wUEO40kcN/WwZsl5PXhSg0AeYmOGQsfrMNfCJO+2JTH+TpNd4NzaU7syc9wwGXS4kDlIwcz7HTyILExNhXVIOJCt4TrZIAz8+f0klqOwiXSyOesBzOtrEuYbFDSjZ1HpNaHsMQV0JpDKMvf/j6dSrkxZa1uzSG/qKWH/eGz6NDNLvT/bVHCyRHJiYLeZROgoImCrB23Eja7x4N0RhxRHK1++OKthWyFFdseH3cnRn4Ob8/K6e9pfFcfDqKr16jcIkvlWSxO2Ke8TU3y3x8rDiek04GoCEqNDKojTliE47J2vq3MPYfhVUmBfJShFM2OKFyv9WxBl/X+G6djeeEmf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHjXK+OGI9aiBsAuFp2tMbIuPCJIHSyjqu3esmX/aQc=;
 b=QqlKBLbfa6GjgmQl6bBzeknZpOlHaV4HkflKOELxFLZpkiGDhtMXOR0zq671W10E8IXpxX0jU1IiY4iqLNu5qBtaef54n3/DByrkC1ck22BYaTydGUF2Zvqy8PcgbHrj38lZH0OxjnVvBcedVkHgWZA6Wc4U9x1L4b1PAyPW6gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4fa87ec0-8daf-4c62-bf34-56b23cf06531@citrix.com>
Date: Mon, 16 Feb 2026 22:39:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, teddy.astie@vates.tech,
 roger.pau@citrix.com, jbeulich@suse.com, jason.andryuk@amd.com
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
 <20260216161023.148269-1-abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260216161023.148269-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: b7043e04-cc41-4c2b-1901-08de6dac376e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3dLOHVQZnJMWWtqdmdibWt1SUg3Rk8rcXdiQ3BrdE1hS0VGVkJlQ2toRzFz?=
 =?utf-8?B?Nnpxby95a2ZUTzI2ZmMxbWRTcExidy9GbWlVSTRxL2dDTittYi9LYXlwekp6?=
 =?utf-8?B?cUIwa0MrV2lrR25xNTFCR2VmRnF5Y0xqRDUzNzJvSDNKTDZ3a3F0NUZGNHU0?=
 =?utf-8?B?ek50dzk2MGpBTHFpTDZlUysyMXNTK2Z0YVd5c0x2N3Z6bXhzTU1GZUxlYlBE?=
 =?utf-8?B?WHlXRU9VQUVzL0R3SktSQ0xWbnhRU3J6cFB1QmNMcmtIdkZLVnFzckxRcWc0?=
 =?utf-8?B?QklHeXl4RGNNcjVWTVlpUUMwMytOYWxKalNBYkFCMXMvR0o4MTFRQXRuTHlE?=
 =?utf-8?B?WWlwUWhLcXoxdmxYUXZleFdMUGpHQlB6cVEyTmRWOU8zMDJFYzNORGhtWkg3?=
 =?utf-8?B?TGZSTHJOS0RuUFV4VmEvdFhPenVJMW10d3FTVmdsY0JiWHV5NnJVOGs1R094?=
 =?utf-8?B?TnJIYWlhVllKRW1tUjR0ZkZKa3FVZHdLS1hIaUdrZFA3NmxUWW40d3Y3THJo?=
 =?utf-8?B?N21RQjQrdEw1N2tIb0RDanVDWEVZRVdUYUdSWkpPcm9NTUpDRGozVW1RUUo4?=
 =?utf-8?B?dVNpL1hXTHNiN2Y3MlFlb1ErSnFiZ2NQM2pUdkxOdDI2YUpKNGFVeDduZUx4?=
 =?utf-8?B?MXBsUTVkNkpzZWFzdTlNUXVLa1oxQ21RMEVPN1p3T2dyUEd5a09DRnFMcmhl?=
 =?utf-8?B?TFN2RHNrYWVxejZlUk9vWG93aTdDSDNwTUhjVmhFaDl4ZENiR2x0V1hNK2tI?=
 =?utf-8?B?c21JVWZlQmRFQzJTR0FxWTgwTTIrZVFFWVNBMWhZSFcyU09PVjdlZmFWQ1Bm?=
 =?utf-8?B?Sk1QSzBwU3VGdjRWMVErc01pK09ZQmVMREFFMGRaRjBWRzhBU3JraW5OR2xy?=
 =?utf-8?B?UEFkUFJrbDVFczlIMVcvTEtkaHRzeXIyV3gwTWdVOWlrZWtqSlgzcmZHalZI?=
 =?utf-8?B?MUJibUxNS2RLc2lvc2NEQXBVbDQyQ1VBS1pibzJlRGlJb3ppbjQxdWw5bjU1?=
 =?utf-8?B?eE1kZjJFei9mNTR1VFBDWDZhVXNsSWNRdXBMeThOdTg5TlB1U2VvbnBmZWhk?=
 =?utf-8?B?RDhVYlIzWVFybkZiaEFKKzJINW1DeEppeWR4OG50NXh2NWxnczFFa0twVTFv?=
 =?utf-8?B?TFRlOU1WR3NrNy9ER2VTdTBhUzlkZlRaL1dJQmNLM3dtOCs0YUhhZXhWRkpn?=
 =?utf-8?B?cUlVMzlSZUJRTDZzZDE1dklBaThVM1E2cmZzekg2aFJHUDQ5SWI3eVNwOWY2?=
 =?utf-8?B?ZjJsM0hIVG5DQ1orZXhFQVRydjJwemloUGVxVXRyZGM5T2p2WTZ4SVRLR29o?=
 =?utf-8?B?bjc2QUk5ZlZuVU5XR2N6dWlNeEw2cHVDbkM3L0hDcHdKNkJYdi9KRTdsWE44?=
 =?utf-8?B?elYrcmVZcU9QR25vWUZCdGdNZjR2Qk5PZ3ZId3g2YTYxaVpGVFRxOUFWWEFz?=
 =?utf-8?B?WG1RZVpuZUhOVXlJNGQ1c2ZRdElmaFVIYm9KRytnQkx0TWcvQ3VQaGtVcU1v?=
 =?utf-8?B?ZEFLb01XUkdqTS9UN0hMblZjdjd2NnBiWjNycEM5eENyN2FpTUtSVElSTDlW?=
 =?utf-8?B?ZXFTTHBESWVrVHQvNEdVZUdUa0JtbkJGUjM5NER5cVNoK2hNWSttdXAyb2ZX?=
 =?utf-8?B?Sk82SFlETU5LblVTc1VJQ3BZaGFXNDhMLzRUQ0tzVlRDZm1sRjBMRmF4QjBT?=
 =?utf-8?B?NHQ4ejhEbzR4Q1VrcUVjd3BtNDFQUW1ZZ05oQm5HMUkwQ0RidnljM0RpSWp3?=
 =?utf-8?B?ODdWK2thc3JGM0JRY0lyc3hnKy9WbDRaL3V6WmVSZmpsWTQremhqR0J3Y25F?=
 =?utf-8?B?U3ZNY0hKSkMzVytnZWVQR2pINVBDRXNzcW1qTVFBNTZoWDlSbitJaHh3UzM1?=
 =?utf-8?B?c2U1K0NaNGxoczRTcmo3VmxlMzEzWmtKTTJzSEdrOWRSVkJualR6d2ZBcHhK?=
 =?utf-8?B?QmNvUGtBa2tzaWFYV1ovZXczbWluZXZaNmJ1d2pvMjEvcis3RVp2MS95bnAz?=
 =?utf-8?B?NWVBL1FIeGpUSms1bHA0WWkwZkdwWEZZNWRBSEpYWGFpaXpTRzF5RzNsZDFq?=
 =?utf-8?B?b0VmckluWVpja0NqSWtXZlZUNkZhenpjVkRwQ0tJM0VweDNQTjkxcHZXenFt?=
 =?utf-8?Q?DKro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXN0bnRqL2J0VElvMDBqL2d6TnN1dVBWdlBtSkl0azJZMUZkTk5tOTZiMlVi?=
 =?utf-8?B?TWZoL05meXZrNDk0R1c3dy9raHlCUko0dTZuVWJSeVRrZmFkdDNJb2FLVXVS?=
 =?utf-8?B?UHIxWnlhOFhyNW9LSFY4SCtFVGJ5NDFKaXpZaGp4bXV2OTVISW85QU9UR3hS?=
 =?utf-8?B?cWt1VVByZWFXYjNkejJFWTQ4NUhqQ1Z2MkZtSVBleVFmc25sbVFzdzBhZUZY?=
 =?utf-8?B?WVhDYnc3b1c1eUM1bmNjS201eHdGZXpJd2MzbFFGcFJWcUVDTTU2dXk2Y2NH?=
 =?utf-8?B?aTB4c29YZEVxY041bTd4TDhqOE1zU01VNU5ZdXlwbHZMSHRuNEJpVjdBa3lG?=
 =?utf-8?B?Z0wxaFZGb3hTRGJNZkNHZUppclBmQ2Y4SWdiTzF4VHA0L2xmQWpFN0NKS2RZ?=
 =?utf-8?B?STZmSzNtWXMrN0FYeTdWcFpySkRnVWJRRTlzUE5NRWJHSGtROTd0UjgwbU5M?=
 =?utf-8?B?MTNYWDIwOGsycm9IeUIzeGYxdFdNOXg2cmtaS0xZaG92NjNYOTUzQ2ROSWZs?=
 =?utf-8?B?dXpCTXFlbE5mMUI1Z2pPbnErQ2pCclNkV2NnTjBBRVVDRnRnM1VHWFEyM3lu?=
 =?utf-8?B?RnpCVHFhZWJmZ213RXltaHZrcXpnS1liNzhIam5waHdMWEFpSzJyNFhjYkxq?=
 =?utf-8?B?SGx2NFp1NmZtTDZ4RS9URFY5SEhwYm0zblZrV0tRUUZZdmR6ajFFV3gyMVlw?=
 =?utf-8?B?eEtKNjNQQUtzNTdNcGZpaEVoTWpOQ01pUGlVOVpRbHMwQlhFRDJqd3BPZmVZ?=
 =?utf-8?B?ditueVMyUkI1c2MybklldGRVR0VwZGpobittSmltRHlTYUd6VXFndzVlTHpF?=
 =?utf-8?B?L1VkZEMyaEhxQmxFYkNMNW84V2xpQ1QxMnlTSTdDOG5RVkU1bkZ3VGdNc1lX?=
 =?utf-8?B?YzBhRloyWkpTRDhKNUhMQlpuOVFuejZCQ3FURmo0VmJoRDNuVmtJS1lmY3FG?=
 =?utf-8?B?ck9hTEhlblhsYVgwMFlZdE9wYit6Z0xyUW55d3JHTTlzdDQxMnVNUkF3cVU2?=
 =?utf-8?B?dUY4WHZUOXFqTU55WS9xaFdpT3lnbnJuZWViNm9aYXFsaktISm1nRWtGWlY1?=
 =?utf-8?B?TGhEbGRLZ2M5RENIdk80VXRlWVdOWTl5NXlqbmdNZTVTWEs4V05uSVFnQ0ov?=
 =?utf-8?B?SmpHdHo2RE12b2NhSFhsQVYyNE0xSWRRd2VXZUoyUElORkFXOG5WbVMvb3Nt?=
 =?utf-8?B?L1pqSkNxaVdwcnN1U2ViKzBtem1YanFHMEZKNlZJSWRHWXlMZDdkejRuOHIw?=
 =?utf-8?B?elBOMjZLVyt0QlliVjlvUlBGUjZmRUNCbWpITk5VOTdPbmM4S3A1U3lybkt0?=
 =?utf-8?B?dWp3WERlQ0g2a0pyczcvczRrVWcyRXZUSnBjSSt5ekUyQmhPTGM4T0Zuckpv?=
 =?utf-8?B?NG1LT0s2ZXVSNE1hNi9TcXhRUHdkYlpINnFEREg5a3p0NUc5WTJ2cHJ4Z1Z4?=
 =?utf-8?B?bHdCSnR3UUF4dWl3MlY2aVFsalB1VUcrUU5NU2p3ZFJkdktVaUhxN25mcElt?=
 =?utf-8?B?cU9uMHdyeDNvZ0g5RTN1SkpHMmdGdm0xbU9kUGtxY2MyUTlvRnVnMUVZVjRU?=
 =?utf-8?B?WDVVRy80TXpIbXhJcHB2aDNMQkt4N1FlK2dETXpkaFNOckF2WGZ4ZlhGaCtT?=
 =?utf-8?B?LzlULzZicUJqWXd0dUViWXI1Z21SRUQ4Q3Q2dzJVZnJwQWxFVzZJZ0xGYjZ2?=
 =?utf-8?B?SjNYM1M3akVCSENUWWZ4VDl4Ti9HTTBsUkNhY3pqTFFBK0c5Y05XcHhOUjZN?=
 =?utf-8?B?eDFmb0krVG9nOWxSM0RKZUdILzNxaC9RREpXYkJkY25XSHRza3ZHSVhtVnBq?=
 =?utf-8?B?SDlnQUNCTURvZGk4UmdRMXRjVmJSTDRkWHNiTEcraWY3Y2xjN1dLbmg0eUt4?=
 =?utf-8?B?ZjE4YmxUM1R5UU84OVRUZnkrdHZFOWRIaVppdnVBMHNWVlJNcVhWcmxDbDhi?=
 =?utf-8?B?bXhRTHN4L0pNNGZJd1o1UlJWNkd3MkZadllzRlQ5SDlncXFlakRrdFJmZUVl?=
 =?utf-8?B?Rmw3UFlMYUJ3VUd6dks1czhCMENhRzhSd2VxM0VUQXN6d0FJWXhtY1JRSnJm?=
 =?utf-8?B?OWRFejdKWU5reSsrQnBNbXBOUFBWSk5pSjFybHM3T2d3NWxuMXErY1NEclNR?=
 =?utf-8?B?NUdaNlg1WkxvczR5RGRkMkliSWczVUJQdTR3N0V1YUJYRU5qVzBXSmVITjdV?=
 =?utf-8?B?bjZja1VqemNaM1A5bzBiWGhaSDNuRkREVWFhYzZ4TnpDUnVlS0NydDdIRjIx?=
 =?utf-8?B?NkJCbnlHNU5Ba0sxODh1dTdkbHExNHJzNnZOZnhudWJORmNPSW4wV0Zib3k5?=
 =?utf-8?B?aGltdjFXOGQ0dG1FMmxuUXAzTDZOZ2w1Q0ZScTRMTnhYSU9haS9kZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7043e04-cc41-4c2b-1901-08de6dac376e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 22:39:16.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wILKlPX8q27vxLLEFIUrToNlQrYaHZ1Ch7y44OFQ4L7LxSsE5qZ7D2yNdf9UyC/hiMY6nsQJFfNuEx980UvBI7BlqsfprlfSeRxocF1ETKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 64170147F2C
X-Rspamd-Action: no action

On 16/02/2026 4:10 pm, Abdelkareem Abdelsaamad wrote:
> On 16/02/2026 10:15 am, Andrew Cooper wrote:
>> So what happens to the NMI we're trying to inject when NMIs are
>> currently blocked?
> Ah, I see this...
> The handling flow will eventually land on the function svm_enable_intr_window
> with HVM_INTR_SHADOW_NMI.

What happens is that you drop the NMI on the floor and discard it.  Note
how svm_inject_nmi() has no return value, and therefore must not fail.

It is buggy to check the blocked bit when injecting using this
mechanism.  The blocked bit roughly equates to "NMI in progress" in the
guest, and it is explicitly possible to queue another NMI while the
first is in progress.

Both pending and masked being set roughly means "One NMI in progress,
and one queued", which is a perfectly fine state to be in.

~Andrew

