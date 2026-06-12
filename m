Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IuRSCdcdLGrJLgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:55:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709F67A5AD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jYivG64z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336789.1598570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3Hg-0003Xk-8l; Fri, 12 Jun 2026 14:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336789.1598570; Fri, 12 Jun 2026 14:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3Hg-0003Ux-5d; Fri, 12 Jun 2026 14:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1336789;
 Fri, 12 Jun 2026 14:54:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wY3He-0003Ur-6X
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY3Hd-008nFa-GJ
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:54:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c1d97-bab6-0a2a0a5309dd-0a2a450bd6e4-34
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:54:57 +0200
Received: from [52.101.46.11]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c1dbf-212f-0a2a450b0019-34652e0b0e13-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:54:57 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7546.namprd03.prod.outlook.com (2603:10b6:208:510::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 14:54:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:54:52 +0000
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
 b=WTYw5tncW4LxHzSfYvDa/TaRKNjfaQmX8xp5JUylpRI1dR4wp475mYcSzaG4puPFS1kcNEBXMBK7hXYO3lCcYqwxrb4rdJiUu5gwH0waSbs/925C2eOiSauSmgtxVS26HC2SrSqYZUhkIpJu6s3J+nq8TGv7z3oZWD2HKoWxovN8cNeLIta6Jx+WUvxd2JTfaA2/hI3jTJLgUUYUZVmD2xpyWq/JLSwxM4EP7WZ+xJbEzCi4zd7xEIJWNJyYILRBCNDuVTonikkB8nztcH0qA17rFDDnN+DG5S/fcTV4hum/SVArrL4vLV0lH/iUD8kF5o0TD81q6E3zzYeHxItzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23TGQrwG0dA3q1mHRRuC+E9sLNd9izy9T37Iw6ipsOY=;
 b=fERBp/bGhWvpqN3/93Csa2ARNrcSTt8fC8H2mEU3ABc2U35sLNN3Km+yeVfLOzP5FHIUOCi0VkNLk2Q5rTivUcxI/acXc0kUu9gX49woNnD4R3sfSD3H7Colv47iyIqMcOIXNeCvY0NNuXjGQRd1OFQvr7raOogv2i0ku3SWgzXpJGS/7nJkeHsi4Me3cZiNPdVIOAPVVPNyi/b7d5mCI7s0vk15LQZmbmYs8MmHhJ/v0jXiE8HQ9AzdZAPGa6ssx33nMDjmEuJ1Hj0KA9wmy+m+4ovAcY2AaAA2x8Cl2V39HRrZjN6fbnTRpn6axktNRoLQMUB4fvEAcwSBf9+urg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23TGQrwG0dA3q1mHRRuC+E9sLNd9izy9T37Iw6ipsOY=;
 b=jYivG64ztMtRmrhPfyP/4RGAKvbzEBkyBiwDow2eiHsvdJby9ojxfvFXc0nMcPQCZIG1C1NctkXVinb9jUOcX9/lH1MmACFcSqjWmHLIljkJtXkJDeJlG7dhd6sIm2mJ26WYsXwByhVr9CYltYZbH2qUlmV8tS6A1mzRO/PzuiA=
Message-ID: <3f9672c7-651c-4d93-bdcb-38d11f4282da@citrix.com>
Date: Fri, 12 Jun 2026 15:54:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Jan Beulich <jbeulich@suse.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl> <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <fb1a10de-c958-4f96-8400-4c0faeba9279@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fb1a10de-c958-4f96-8400-4c0faeba9279@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e297262-0611-4cc1-0d35-08dec8928ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rQgK1imkH0h5JmW2WEaDdrRa5aj/DUfE4ZSA4b8ioTcp8baRXfJRRUVwREXPsPGIdjh/umPUqer9ixY73y7o1OcFO1vgseeV2df969W2PXqq2xfCfSyF+vY7cmeHE4aKeRiaBfoFKDLZ/a6A82oHaEPV2H3A67CjXEhZV2SZPWVvWBCt/cJiI/CuNeIl/ZR2+Ee5H/7jAtKHEDw/1DOGASuaVBx2WTShKYj4IUueA6pdWZ7k+dT0lOrWmVKq2Qq3KFXIkiBwnp5OnVZVX5x5SSh/mQiS5aDPPZaeId20mGYNgXOZoFU6/bqq1j61lXjlMX51YrzxDYgGiAOWzXcjwY5xH9spxVo4sqy6/P0o/zMdc/+bJ1gOX716ybYwAeOoq9JxRTa8FDqY71WVmKZiMQW1BSaUBPjY8QOv/zC2rs1BphdjKHqGiqwTFSJPTDlf5HRaMHVcacmgtDWGlp9bMnE+pTfp6U3dn7/e74QEn9zeRrrzCcFIyS/92xGuLsQFXOzQvyQqDy3nS0QICDYsqiCElqkwTjwEvmGOeGjv7Gc7tLgElvG5MKl1ncW6/v71/ymaMqIq3r4yYAwwHY9sME2k7K1pI3tcOZVS3gb4lbpM0pt2UgaDbRmZkEvLdJDo6XMIoAOA3lrbThhN5y71b2aP7rg3C8TQjIpmq//YTTPOXXWP+OmZI6jKx6Ur8Rxf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtYalgrOVZLeU1XNGdhc3hXTTc5ZUk2aG9NaUpGd2ZZS1F4UXpZR0RISjdO?=
 =?utf-8?B?aDlLcWlQNG53Tk5iUml0aVhlUDhOTE1ySmlha2tSZ0tDblNQZGd4SlhBdCs4?=
 =?utf-8?B?NVNqVWtLOFZyc21zeEdramdHZDZHR2lhbWlDOGQwL3hLVkMxakYrNG55Q3lD?=
 =?utf-8?B?U1JhWXQxYTdiRmNPT05EcFpmL3o1YlJNWXhFQ0p5UHNRR25mOXpjc1pDZ01u?=
 =?utf-8?B?alZrSFNMK1VFQTVRWGE3UlllZ05YMFdzVUVDamplKzhTSlEwSXZmSE9JcGpD?=
 =?utf-8?B?T1JmK1pDUi9vc3BBYmhVcDV0TENJbDhzU1UvYytlRWJqbzRxWlh2d1RLM21x?=
 =?utf-8?B?UUN1QTFjWGg5dEdKWUFkYVRGbFN0b0xZRjN4S1VGSHpmUy9TWmZhMW04T0c0?=
 =?utf-8?B?U1dZZmFLTEVKQ2lkc3lrZW5EMWxXU3ltWXUwR0c0OWZIeUdtZys0VVZ6RWJm?=
 =?utf-8?B?N1hqcWZyNG1WMWNsTnJ5S3JrUW9CTGtYc0ZSSHJBZE41VmRoR0FVVStnRzJl?=
 =?utf-8?B?d0UxSHlmUVh0VmNYRHVTcCtaWGxWTWQwN0VGVWxiTWE3TFlrT1hKLzVtcERa?=
 =?utf-8?B?WWEvWFFUd3YydDB4Ti96K2NPVHMwcGVxRDQwVTFPNDBpaVh0L1phM0xOUkhR?=
 =?utf-8?B?YVo3NFA4ZVI3SjVVWjJkNjluMlRrZFh5M05yTnBLNmxoTjArVmt6S2M1UW5Z?=
 =?utf-8?B?WWtaUjlrb0IwZ3lNVjlwRVlrOG5TS0RlQTMxSzhIMkZhSmUvNXBlMDRrZG13?=
 =?utf-8?B?a2VIRU9tcXgvaHdFNUpOYWt6eHZFaVhKRkJBb1FKWWppSHpMZUlDakxSY3Az?=
 =?utf-8?B?LzY1dE5yUzZLeVF0eGtKaVZ3bjNzMVpPVVJ5S2J0SjB6SDdoOW52NklYYUxI?=
 =?utf-8?B?eW5NVEY0NGRlWlBQK3pvYnFrU2ZvUkx0cE04dWxLME5pM2VzNlpvWHRVS1pK?=
 =?utf-8?B?VjQ5eE1RTTZsNTdvWnVVMXp5OXlxMVFkQzVkYm1FdGkvQ0RxUkNlNU5ycEYr?=
 =?utf-8?B?SDdMSHl2aDhnbzlQaVFmK0RGL09aVWtxOEtSR1pJcFhpTU1mSUhRYWxxNEJW?=
 =?utf-8?B?eVVLZHZSbDlaL2Q3TXdWTjJlN0hJNlRYMXRzUFRoVXhOVklhZlVuTVBEOFlJ?=
 =?utf-8?B?cVpoUFY2cnFGQ3A1M1ZrL2FrcVhhd2xFejN0QW84bXkvT2VINjRyMmFtSDNn?=
 =?utf-8?B?V0pjTU9KTyt3QUZDKzdmZGVQQlI1bFpYNWpxd0M5WDlGYjN4Mi9mTkx6VFQ4?=
 =?utf-8?B?d0YyVHVVQ01XZEdncUZGd250WGZjVTdyWHZXSk1CTGRTdkFHbktxY0Erd1RH?=
 =?utf-8?B?YTRiY2pwT2dSZThiek1lMmpicFhFcjBEbmQvY3ZZSVIrMmhTSGVORU1EOGU4?=
 =?utf-8?B?RjdVTFVweWh2TmJyVktXbTBvK3dneCtrMXc5ditQaU10QS9CNEZmT3pxdCsv?=
 =?utf-8?B?Nm92QjIxQUJKUUk2ZzRNeVQ3bzNkRWxRU2NkbWtWUjcyMmdLZlFxd1VLUmx6?=
 =?utf-8?B?Q2ozM0RsbkErb3JqUDcvUkRiUEdzNFk4TDBEQ2h2UTBTUHBWUzhzTkhkT0Vh?=
 =?utf-8?B?SERsYTNMOWRsMnd3emVkaGJ2Wmg1VWhoZDRabHZFMXYxLy80cFRwS3VhYnU1?=
 =?utf-8?B?RkMyOER4UTlaVTZHQ04vY3YxT0NYeUo0VkxXRlBpNHZLT2tiTjU5b0JtaFJv?=
 =?utf-8?B?dXJaelFvN0Qwc3BSMHdHbWFOM1lpSFFlV0dxd1pHTDAvdTdLRGdyWXNxTW9N?=
 =?utf-8?B?bEt5c3AyRURmQmpjcHN5bFpaTDM4elB0VHlpWERacGRaM0xTRytHNXpxRk53?=
 =?utf-8?B?eUtwb25YVFY1R2wzL0gwNFdoZmpQdE1pUW5ZbHFpR0VWc1pkNitvcnNGVDht?=
 =?utf-8?B?a3Q0R1Bsek1LZVRhd3RRSWRYOTRacVY1ZnQyWTg4V3laQUhFaDh0VUVxRlpx?=
 =?utf-8?B?Q3FVWEk2VnhVd2FKcjJsYUdibXYycjNibkdpbSszWVJTQUZWTWFBdGllQnNh?=
 =?utf-8?B?ZlFLUXVxUzJyRkdYa28wMXZvaE9ubEVRWDFDMFYzemdWMy9jV00yUWVXN1gx?=
 =?utf-8?B?SWdPTEtROWNIbkZlL1ltc2ZWbkpEbHRuNHdhbVFuVUZvM1JySzZ6K1hHUGp6?=
 =?utf-8?B?MEh0czFIMHlJUjloelVraHZENzJFQjYrZHk3MmNITDJRUEY4OVR1cjBGa1dB?=
 =?utf-8?B?MGlhMVNJcTA1ei9tRzNOTzJZRXRtTDBwOUltTm1GdWMrWTZpd3hER1pjMWdO?=
 =?utf-8?B?Kzc3Qk9PKzB2bGJZdnpZS01zVHdmVmhRejhoOWJvQVhtM1JONVlsZU9iZC9q?=
 =?utf-8?B?VjVjWDJSemx6bjZpaEgyWUZxcUxEVEpSaWxBODdGR0R0cVFUODNxRTArMFNC?=
 =?utf-8?Q?uJhrZWz9FDSbWKvs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e297262-0611-4cc1-0d35-08dec8928ed6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:54:52.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8TUWShDZ0baeF/nQUX76C5uLFqmDbeNCUuHt4LO2G76WGDnWeThsxuLz00YUpWBQlggoG1CNaDTSLJ+cdfUaRXjzOGMiFlz7Ckn/LGZhcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7546
X-purgate-ID: tlsNG-42698a/1781276097-1AF76F3B-0192964A/0/0
X-purgate-type: clean
X-purgate-size: 3516
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5709F67A5AD

On 12/06/2026 3:45 pm, Jan Beulich wrote:
> On 12.06.2026 16:32, Andrew Cooper wrote:
>> On 12/06/2026 3:20 pm, Jan Beulich wrote:
>>> On 12.06.2026 16:18, Andrew Cooper wrote:
>>>> On 12/06/2026 3:11 pm, Marek Marczykowski-Górecki wrote:
>>>>> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
>>>>>> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
>>>>>> netbooted and EFI.
>>>>>>
>>>>>> Xen call trace:
>>>>>>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>>>>>>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>>>>>>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>>>>>>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>>>>>>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>>>>>>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>>>>>>
>>>>>> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>>>
>>>>>> A few more lines from Xen:
>>>>>>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
>>>>>>     Bootloader: GRUB 2.06
>>>>>>     [...]
>>>>>>     Enabling APIC mode.  Using 2 I/O APICs
>>>>>>     ENABLING IO-APIC IRQs
>>>>>>      -> Using old ACK method
>>>>>>      ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
>>>>>>     TSC deadline timer enabled
>>>>>>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>>>
>>>>>> Commit this Xen is built from: 50936ea05660.
>>>>> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
>>>>> isn't advertised. Can you try adding `cmos-rtc-probe`?
>>>>>
>>>>> Anyway, surely it shouldn't crash... The commit you mentioned has "No
>>>>> functional change intended", but well...
>>>> Well, no intended change.  It was a very big patch.
>>>>
>>>> Nothing should ever be using efi_get_time().  It's unusable (i.e.
>>>> crashing) on hundreds of millions of machines.
>>>>
>>>> So, while we obviously do need to fix the assertion, this is "only"
>>>> collateral damage from having fallen into the efi_get_time() path in the
>>>> first place.  That wants investigating too.
>>> Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?
>> The identified system is a Broadwell-D.
>>
>> Come to think of it, there were some systems of that era which (falsely)
>> claimed to have no CMOS.  (An HP Haswell Blade comes to mind, but it
>> will be a similar chipset.)
>>
>>> On such systems efi_get_time() would better work properly.
>> Wouldn't that have been nice.  On the bug I looked at at the time, it
>> was just as broken as prior systems.
>>
>> It's a vicious positive feedback cycle.  Windows and Linux ignore
>> efi_get_time() entirely because it's broken in a way you can't probe
>> for, and as a result the codepath get 0 testing by OEMs/ISVs and nothing
>> gets fixed.
> Do Linux and Windows then ignore ACPI_FADT_NO_CMOS_RTC on such systems? Else
> how would they establish wallclock time there?

I can't speak to windows, but the absence of a wallclock is not a
problem for Linux.

It shouldn't be for Xen either.  AIUI, we use the wallclock for two things:

* One of the boot timestamp modes
* vRTC->current_tm (only the internal baseline, which can be done with a
plain s_time_t instead)

Both have been tentatively agreed to be removed for MISRA reasons
(dropping gmtime() specifically), although there's been no real movement
here.

~Andrew

