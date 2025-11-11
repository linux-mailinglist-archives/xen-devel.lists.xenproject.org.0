Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A9C4F6A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 19:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159275.1487643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIt00-0007et-Ic; Tue, 11 Nov 2025 18:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159275.1487643; Tue, 11 Nov 2025 18:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIt00-0007ce-Fn; Tue, 11 Nov 2025 18:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1159275;
 Tue, 11 Nov 2025 18:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIszz-0007bJ-Iq
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 18:21:47 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4538a3b9-bf2b-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 19:21:41 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PA4PR03MB7453.eurprd03.prod.outlook.com
 (2603:10a6:102:e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 18:21:39 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 18:21:38 +0000
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
X-Inumbo-ID: 4538a3b9-bf2b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPgXiLgpr73H14i3Tguk2Qdop3C1HpfQj7i6UoLyhTq/gEFyqVEVmVVrh5+0fDvcJm8DWia1wY8hp+z/OsTawmtUPkOKkPXKbPMmy3CBc6SEBBRVDDLYBSPZWYZH6AJPeYDk4eJDS4aXPSvxZDc6NHfwz3MVIEBLXM/dRkF8rNQtaTFSxPAWOteN+sxGNCrFxv+ttb/kTkiZoXvUsKtQyLCkHn5QHj4Ueq66cwOknmoER+PThC/CgJdTThY+2wSSOPe2SJgEvYM8CuPt0cmMhANI4YBIl2JqgtUSltXzvb6+SIUKPaT48VeRvPmP+cEYozTT0m0jH4DeKYfe4ltBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H21cx4bnj4u1fPlLjXy2JWQVGn4I7j0WjgmUiq2H2pA=;
 b=OdWefzSG8ojKzXcs8zuM3JX90+jvm57E6O+vC+VdU2QuMocIGqy1eAAzsMmibXxZGE9iCWPGlGE1Ukk3HIGvbRw2u4xiaW0O8Ym8qSKBYIvTtfEnPdaNKooayZlymhOw780NouTLRpOG0t7EF9IrDkHoaCjF7pLENtAas+Xpie8vWQzqQtifDZ7s9Uapd5asmMNAoEwUbIdQNyy5qCvFmUbpKmO9evnS999DfUjvvFSEfhuZcAXhnS6JU7S/LvvBL2o54piFCdChsegCnPT84nWidw8w2FFICp4ced4MGEh66T1q71ZJrAO7MF7HTZ/TKpbnREZGqLBoBlS0GQsu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H21cx4bnj4u1fPlLjXy2JWQVGn4I7j0WjgmUiq2H2pA=;
 b=jGjF8lswOm+CsF04YQ64/SFmYiV9ix2mifksgjg36g+FJ5qKGXwcRYTflEVbMVt/VvRWKTp0KY90Gjet55K4Cp7GSU20KDGDXVhuz2yswq+mkxOT9fTOCIIpkbo4rzwfmA13nAvx5A++5PJmEY1GfX95/PBxQm+Peuk7yWEukdVpcnKmqMv2O4riUTXNFlZitbRjTBa9oLzn1l18LMk9/oHx4RCwBZFcZsotik2h2c+QcIfM02Hhcl0cK63P4ivaf8/eIejbxYsp72MT2EDIRpSASBt4TD7N+OcYOVKCrf2e3VQy4OBgM1YGhsPlcIictCguK3CLLk60+PsBd2R5vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7e3422fd-893c-41df-b783-71e02335aaef@epam.com>
Date: Tue, 11 Nov 2025 20:21:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
 <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
 <63525e6f-4e17-4155-87b2-47b9ac9ea474@suse.com>
 <acac87ba-5a5a-49d1-925a-8754f4a3179f@epam.com>
 <0613cfb9-0f6e-4c55-a250-ba2a5aa0e182@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0613cfb9-0f6e-4c55-a250-ba2a5aa0e182@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|PA4PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b36b9b-a8bd-4937-8f61-08de214f27c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJkWXdDdXNreDVpd29HU202TnVjSnZ2bXNFWjVWcnlDaWJNRk16QW5YT2RP?=
 =?utf-8?B?eXBLaFAvWHFTQytZQ2xZTjlPNDBqdEQwQnREcmRGaGFUb0RHY2VDWlNEd1VW?=
 =?utf-8?B?cWc0MS9VV1k2WDJDZWVFTkVTSDdvZzhJcVkxK2ZEQ3FDTzdadFJVdjFsaG9J?=
 =?utf-8?B?bUxQbUx4Ri96UXUvaW5FNkpLMlhYQkhONytJbE1aYm53TkRXbk5odlphOGNE?=
 =?utf-8?B?N1ZyZkU3TkNQTnJzOGkzdXVGQm45VGJVb0tSZnpwcy9VZm9XbzE1clBwbnZ2?=
 =?utf-8?B?b1ZIU3dUc3pPRFhES2Y4UFFmcmtZRTd5UktZcko5bFZGUU1aLzg3eUVac1Jy?=
 =?utf-8?B?dmxDQTRMSENQN3ZCS29ScW9PWG5uMkdZL0pSdGFKa3BxNGx2K2lMU091VnU5?=
 =?utf-8?B?b3d5cnVCTGx5dWY4ZXlMY0RNS1NDdWZ2UnQzdG96MHhIbEtrdXhQRnFzK0NX?=
 =?utf-8?B?aklDWWFWNTVGbDU5Y29BbTFwbGJjeTZMUWZOSUI5aVhlMWpNOHdvVlpJY3hu?=
 =?utf-8?B?d3ZvSXE2d2ZLS2VUeC9md1pOMVJDZ3hhNnY5Z1I3SFV5dVZLdkpYYXFXWkpu?=
 =?utf-8?B?dVNsQVdHV1ZFRDNSMEtSWjBiYVBKV3M3eUZWWWJhU1BaNjdFY0NQVXFqSThV?=
 =?utf-8?B?dWc2eDdpWm93WnlZQVZBNFdnd3JEb2JzeExYWVVLK3VUejN5ZHpvVmxxM0pB?=
 =?utf-8?B?MUZIOEs1TGJYdEdMZ25zSUxidi9HMnlIQ2ZRQXFieFFva3dsOUVKL3VUeWFY?=
 =?utf-8?B?OEV6U25vYzBibXNIMlpFaEI3WjVlM1d0b3ZsN25UckgzYTM3RTdaS25ITlRU?=
 =?utf-8?B?dE5IY2lzbUNMM2I4OHVoYkpMbnhEbk85bmgvSllQTnlwV0FSQXFEaElPS3JZ?=
 =?utf-8?B?eTRLU0ZSTzR4bk82WFZnYnNZWXoyYUhqZE85S0EyYTVtcDJPY0dROTZYWTc3?=
 =?utf-8?B?Wm13QUlGbDZkMXhNMExQdjR4Q3VaTWdHNkN2YnZQKzV5WDliaEZCaDRQTmwz?=
 =?utf-8?B?MnJxUkJSV0FlT0pqZ0RqZmx2aW5pRHRmMFVXRi9HR0t6TUFOdk5QenErcTRD?=
 =?utf-8?B?bDg2L3NCMzZCbHVwVVk4N1hWL0d1b3l0SGJncWp1RE1hby9SNmRtMkIxY1Jp?=
 =?utf-8?B?N0dKb0d4a3QwRC9Rd1FqS1BXMnYza2ZWOXNoVDVQbUo3WnV6VS93NG5JN0U1?=
 =?utf-8?B?TytvY2tkMm5sTTBnbjFZU0prTEZWY1l2TnZ2Z2NoTXdPU2QzeDluU3I5S2tU?=
 =?utf-8?B?UzZOSXpLZ1RYVmZrMWUyMlZHUFZReC9uUk5BTFYrQmxqakJRQXhwUUhWS01k?=
 =?utf-8?B?ajI2L2ZkUU85Mm81OW5tcFJqcW4xK1pvaW1rc3NnT1J3QXFqblEyRjFsZkps?=
 =?utf-8?B?QTJrVWNOTDVoY3dpcmZZeTlUc2lCaE9oVUlURU5STXBHT0ZvVENsc1dpUnJY?=
 =?utf-8?B?Q0I3amlPZzdWeDM5Zzl0akdkL3VicldMZXRxM3RoQnYwUmhweVlUZkRpWERr?=
 =?utf-8?B?QmNmWkpHclA3TnhrNHlWTG84RU83aWFNakM3YnlHUmJmbm9FdnNHVDBHUlI0?=
 =?utf-8?B?b1RWcGREQzdFUDkwVkFkRHpQUU1lRktoTE5SNmF6RzVDNTlJM3UwODdEN1Vm?=
 =?utf-8?B?c3liMmM1TjF6UEFXOEdZR0tmQXp6SDhRN0pWdEt5VHhsZ3BhczdINHpiSUxw?=
 =?utf-8?B?K2RqZmp6WTliaWtRQ3Rzd3lwY3VZc2QrdEMzNW04bnczWHh3WkpvZ29sK2xl?=
 =?utf-8?B?aStqbGd4QWszTDRKelExVWIwK2JDcndTSXhIWUMzcTMycWI1T0lFSWduK08y?=
 =?utf-8?B?THVOZGVzQkpGaWp3RVpmd05HL1VBeUIzR0RpbHFZZU9XU0cwR0J4aTE4cEtp?=
 =?utf-8?B?MVY0c0VVbGRldWU1R0o5N1h5bkVBTW1WYzBhMzJsd1dDR0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXVrK1dnS0pTUmYxWFhoMmw4V3grOWREUjNaUnZ0ZVJsWmpRWWtUQldYTDJx?=
 =?utf-8?B?NDFoVFBicEk3dDFJM3U0UWJOVG93NHNhdGVuS3duSGVxaXdQTWtMMUlBUDZo?=
 =?utf-8?B?OElKTjdnN3MwaXExanpxWUltTlJEbzZKM0RuSU1YWFMyKzh1Q1hpU1pLMkVR?=
 =?utf-8?B?UHpKeGx6elNGdjNyQ2xFLzR5dzFPZUtLSHpFNGJvNElTWnFGd1NqT09Ydnli?=
 =?utf-8?B?ZWpWNGh4VlY2RE1PQWlCQ3FxTVd2ZXc4RnpoNjJqbXZ3ODY2b2lqbUxwN2t1?=
 =?utf-8?B?bU1MbVNZdm5TRk1LdUJuLzBsU1J6NG16citRdnQzUSsrOXZzZGI1Wk5vMUpP?=
 =?utf-8?B?aTVaZEsxcVFxZkdnUkVVMEFsSzBGQzA4dERQZ1FsaFpUL0ZoYWloazFPOWZD?=
 =?utf-8?B?SHFyQmR1VUFtQXNKUFJBWnN3Snd0TzlvL3lwNjFTMStIVUVTQnpYWDBFdzJQ?=
 =?utf-8?B?bHU1bWpOWENMU2dQQ2pWRTBUYzhJdHMyc1VxSll3aEQydlV6QlhsODkwb25q?=
 =?utf-8?B?M0VGY1JjeFBGWTEvVHhFSGQwOGFpQXBwYlV5UDJuc3laVklNR2RTcXVjaU00?=
 =?utf-8?B?R1ZVc0lPU0l3bVR5M1o5dTNsTFVVcUsxUHIrUEJtU2tEdjVoUEZjeCtIVVp4?=
 =?utf-8?B?YTdHYnpsTWgxdkwrRlJzODg0NHE5SUJVN1dOWi80T2FzOHgrWUJCSUQzeHJD?=
 =?utf-8?B?V0QzK2dOaXdKZEJPejZmS0liM0ZsSEdYNVlFV096WnRUZ3YyTHBYakV1M1Zp?=
 =?utf-8?B?d0pQWmJST0c0SVREeUV2TU5meWFlSU9nMzhtcytnMzllQWJrcEV2ZkdmWE5m?=
 =?utf-8?B?RkJGcFFWT2FlcmdpNjR2LzFQK091YmlVQUkrTnlCWlVzbGlRZ1BUcWxHY0Zw?=
 =?utf-8?B?cVRjeHQzVnlJY0tOcHJxMVdqZkZTWlptbTcwKzE1T0hNVGp5QUowaDFxZ3R1?=
 =?utf-8?B?VlFVbGJ0VEZqUEYvaW9wQ000UkxmQXgyeTJvSWNZak1ZMHFwRVZkU2l1SFJp?=
 =?utf-8?B?d2ZwSXpQeTRnQXYzeW80Qm1XSXJJM0plOEVHMDd5YjVjSmJrMUtiWDlnUWI0?=
 =?utf-8?B?SUl0a2paajJJQXVPdldBWWZRMEQ5ZUlweEJ2R0JDbXRUUFRtT08xbTBDU2Ew?=
 =?utf-8?B?QmVHYWNZR3psTFY5L2NCUlQ0Qks1NDFIT0MwcncvQ0ZBakxpRWJRSmhGYTli?=
 =?utf-8?B?UklmUkRiay9RRlZFd0ZMc3ZiMXM0T0RxTzFSTVdKVkd3aGRBZEJGVHl3QWw0?=
 =?utf-8?B?YXpHNnpiSEw0SGlxWTRYeXNEOHpMVTIzK2ZkRTNoWVhSNXF0dWkzWHBnc0c1?=
 =?utf-8?B?WW0vcGRJWFVISFVXaFd4SE5vcDc3Wjdkb0xvRVVnbjI1S1M5VTU1NldoQjRy?=
 =?utf-8?B?Sk5yL0J6WVBLZDZhZ2R4bk9kWUdGbkE2WFZObDN2a3B6QlFEOFNYQkoxOWRh?=
 =?utf-8?B?c2dudjhMMVN4ZUsyZFduaFptOHFIUU9iLzNrR252SEhkVldvamREQnBoYlZz?=
 =?utf-8?B?cVhNSTMwMm5CTTBUeWRDVUU5NlMxVjlKU2RTMTdkY0pvRG5RcUxUb2xMejlw?=
 =?utf-8?B?bFBQNmNWQzhTMithQ2c0eUE0cEpYbFdZNWVyY1FObzRYVkdsMVAyb0JPTVhL?=
 =?utf-8?B?d0NTc05GV2lQLzA2bm5ETjdRV3BZb25WSTFTb1Q2dXNSNkVmZjZPSmpVcUFE?=
 =?utf-8?B?b01LQWRaQy9la3FIT1Z0ZXdrWDlhN3llMFp2N2dDQmVJaDFMRGd0bzhyZlhK?=
 =?utf-8?B?TnliSlhVcjk3TUUrWVJydnByNDZtMEtwNVZrb1gxcWlYaTJPMlQxd2t3K0ts?=
 =?utf-8?B?a0t2RUpiZkdmd21FSmcvTUlqWXVySDN6MnJBVEVkSmxHTUt1c3lKSEcxRWNM?=
 =?utf-8?B?YTAxY1VuUzIzUGFJTFcwWnQxQUNMVFg1d1lIa2kxdFZwVEJnMWpPaFMyck9z?=
 =?utf-8?B?dWYyWVlZQWJhZHZEY0l4RnZpWTB4cDlnbTJDbExQL0ZNYURZOXYzR1BwdWRj?=
 =?utf-8?B?eDdhZ2FFQ0FTQ2pQR3VaYUNxOVdQaEMzYmlnZmZSOTR2RXpYb095MGZ0d3Ix?=
 =?utf-8?B?VXVaYmdjc3Q5S0lid0xENjJnakNjZWhRd0lTMkF1ak1Pdzloc2w3N3NuUzcz?=
 =?utf-8?B?ekpMYzlJZWc1dERYRjRxOVlLYUZIbXRZVzhkODRmTDJTVC9BQjhTc25oUlpP?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b36b9b-a8bd-4937-8f61-08de214f27c8
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 18:21:38.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ7ATySaJ2N4EqcgycP9EdejeQFo42rg2G7CV4+J0GMNFPT2ElfON36nraGLsG9h46vIsUOY24TAHIPK95yy3aKaEJoCIs78u6MotuBba/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7453



On 10.11.25 08:36, Jan Beulich wrote:
> On 07.11.2025 16:47, Grygorii Strashko wrote:
>> Hi
>>
>> On 06.11.25 16:09, Jan Beulich wrote:
>>> On 06.11.2025 14:50, Grygorii Strashko wrote:
>>>> On 06.11.25 14:00, Jan Beulich wrote:
>>>>> On 31.10.2025 22:20, Grygorii Strashko wrote:
>>>>>> --- a/xen/Kconfig.debug
>>>>>> +++ b/xen/Kconfig.debug
>>>>>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>>>>>           "make install-xen" for installing xen.efi, stripping needs to be
>>>>>>           done outside the Xen build environment).
>>>>>>     +config HAS_VMTRACE
>>>>>> +    bool
>>>>>> +
>>>>>> +config VMTRACE
>>>>>> +    bool "HW VM tracing support"
>>>>>> +    depends on HAS_VMTRACE
>>>>>> +    default y
>>>>>> +    help
>>>>>> +      Enables HW VM tracing support which allows to configure HW processor
>>>>>> +      features (vmtrace_op) to enable capturing information about software
>>>>>> +      execution using dedicated hardware facilities with minimal interference
>>>>>> +      to the software being traced. The trace date can be retrieved using buffer
>>>>>
>>>>> Nit: s/date/data/
>>>>>
>>>>>> +      shared between Xen and domain
>>>>>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>>>>>> +
>>>>>
>>>>> I was actually meaning to ask that "VMX only" should somehow be mentioned here,
>>>>> but then I noticed this is an arch-independent location.
>>>>
>>>> Right, Arch code advertise VMTRACE support with HAS_VMTRACE.
>>>> In this particular case:
>>>> config INTEL_VMX
>>>> ...
>>>>      select HAS_VMTRACE
>>>>
>>>>
>>>>> I'm not quite sure we want it like this (just yet).
>>>>
>>>> ?
>>>
>>> To rephrase the question: Are we expecting anything other than VMX to support
>>> VMTRACE any time soon?
>>>
>>
>> That's I do not know.
>>
>> I assume your point is similar to what Teddy noted [1].
>>
>> I think vmtrace code can be consolidate, but question is on what level(s):
>>
>> only:
>>   xen/arch/x86/hvm/vmx/
>>   |- vmtrace.c
>>
>> or:
>>   xen/arch/x86/hvm
>>   |- vmtrace.c
>>      <- vmtrace_alloc/free_buffer(), acquire_vmtrace_buf(), do_vmtrace_op()
>>   xen/arch/x86/hvm/vmx/
>>   |- vmtrace.c
>>
>> it will require more work comparing to the current change.
> 
> Well, I don't think code movement is strictly necessary here. But as I'm unconvinced
> of Kconfig.debug (in whatever subdir) being an appropriate place to add this, for
> the time being merely putting the new Kconfig option directly next to INTEL_VMX (and
> then without any new HAS_*) wants at least considering, imo. If and when some other
> use appears, HAS_* can be introduced and the whole thing moved.

For me it will be fine.

> 
> As otoh abstracting things in an arch-independent way also has its merits, it is -
> as said - not quite clear to me which way we'd prefer to have it.
> 
> Jan
> 
>> [1] https://patchwork.kernel.org/comment/26637627/
>>
> 

-- 
Best regards,
-grygorii


