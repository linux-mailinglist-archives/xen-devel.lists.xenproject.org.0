Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2460CD95BE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 13:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192594.1511740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1pG-0007EX-8s; Tue, 23 Dec 2025 12:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192594.1511740; Tue, 23 Dec 2025 12:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1pG-0007BP-5l; Tue, 23 Dec 2025 12:49:18 +0000
Received: by outflank-mailman (input) for mailman id 1192594;
 Tue, 23 Dec 2025 12:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhFC=65=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vY1pE-0007BJ-In
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 12:49:16 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c826873e-dffd-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 13:49:13 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6996.namprd03.prod.outlook.com (2603:10b6:510:15c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 12:49:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 12:49:09 +0000
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
X-Inumbo-ID: c826873e-dffd-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qp+l5cRhWCEtaZCHeqOVxvsSIqFtlCSuRmXS/oxxlFccn/13Ocb28oAXHB4s0poh31S7z7iml58Axp2aHAiVb4WNtRNK316+eXfuBI2zKgu6dH9EdRddq6M4SKAHumx6gcCyPYZJ7+8PYtGKAHkL95LJAr8kSjxyrHwdnb2vmxcKVIHGjlIDws9GtWq6cUDP/p+Rb0h7eu2odqwX8x7EC2X5M/89yZUJgFwya4S0d9yKLgLXKLMD2xkjFch2SRAkvEgdvXmDQTpSqoO9yYHPhVnQvA7uFuBpE2A/n4RaKIP3NIIipDiHalyZHOIjw3kGRuCG/nIWITE04j4MQou1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvtHB1fhW1bQkgT5uJqvYrjtYSk3CU6PW835zUbhuoU=;
 b=RV0ClacQFViAzoNUzdcx+Gs79ugYeuEpE4m7CNzdATbZpnkyMenWHxCNqKrGq3uK1Xr9sQaMqf7ELRco3tLWyo7iQ24L5/f50tdpxYK2UREpLLVM25YkDtMek4FDZb8xNGjuuEJtzJvJWqE8KOOS2Ez0jfez3v3lCPqVWlPenxiebmAusdtPFeG3AtgPVvpaEoZjrLEXBOIA6fS13twxz4zCDrn9T/YoPhNHGU5atyWPNdYvMBMeXY6OYd9Q8xqMbT1jKs8SREP51fP+wFSgVUD0MSHyCVz5C4+aZT2uEArKE3wRUdJ7fveI3rUV2nritezGT5JvLXXiLA1ts/nWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvtHB1fhW1bQkgT5uJqvYrjtYSk3CU6PW835zUbhuoU=;
 b=NrqFVQBHJZ3taVNdKSb4Mgslyys2Ry1K1tPHZxKN1qXEJZfSLXVCi1TK0GeN8M7yunB9w6pWxSy7EeMyuWrjkbi0WHvafDpyKEj3CyStIrjtaL4KGpGcFzVcZ0d4MxXxdQS9Px6HXq9ije0bR56HgDjrfR59Zcu8wU2jkPy1HIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d350d06b-6e38-4797-9c28-6b7960f854b2@citrix.com>
Date: Tue, 23 Dec 2025 12:49:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86: Correct comment about struct vcpu memflags restriction
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: a164e14f-da1a-4f8e-0fba-08de4221aa55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU5QKzFXUVExS0FaL0tOVkJOSmhaTFRReDBacWJpOCtCRDQralpDN20rWTE1?=
 =?utf-8?B?QSsycU9WdmlIM0lPeXF1ZU9YRUZaeVFidTkxZGFlTE5CYmkyRytjc3FuR3l5?=
 =?utf-8?B?SEU2bHJEaW9XY0FMUEJBVGtnakNJUGY0ZEpDeGQyYXM5bW1IdU1yekpkbTBq?=
 =?utf-8?B?N2MzNExmeU5ycEtwNjNtVHMzTDU1cE1QcEk3Tk9TdXFSY2pTZlJwL1NQNzRO?=
 =?utf-8?B?UjdEdTdiaW9aTU05OFk4Yk9jczEvYmlRUEtySVZJQXJYTVBMakZIWE9FVnRr?=
 =?utf-8?B?NG1NbFMzcUJBQUFaVlhIYXhGNklyMEJua0Y5QU93L282N1BNc1ZMTTFsdTE3?=
 =?utf-8?B?a2d2T1FZQWxwY2RNdExMbllkbHBrbHNNMklFSTRhMFRvbzVzUHZMTzc5aGdt?=
 =?utf-8?B?NHNPRnE0TlJPZmt1MHpDZm1zQ0pFUkVQbTZ5UnNiUjVWUXpjMVM0QXFES21w?=
 =?utf-8?B?NlZ4ejVKcXA2ajd5TGJDbXgvMlFUM1h0UmJjTkpCNzRXMlczdlB1czBya0Nu?=
 =?utf-8?B?OU5XSDRTNm1rKy9HTGh6WitWeDU1ZVREdkpHTGZWRkExWncrQVEwWXV5LzVP?=
 =?utf-8?B?Vi9LbWN3cG5jRld4Mml1L3JaaHpkSTVDN2lWRlZBdmNXWWwySzRJRWxHckFQ?=
 =?utf-8?B?M2RvcnhTTVM5MjBNaUVzc2FZN1J1bGhjdXZaZW8yZ0E3SGttWXZoTGtLaWVN?=
 =?utf-8?B?alNjSDZqY1AvL2FhR05Zck9XMmxPYkRCMHRpS1RUeVI5WmZGT3YzTGQxYVFu?=
 =?utf-8?B?cHFTdnFCU29ZdVVZczZrTnZnOUpVRDhMVElHT0hDK3pPeUNhdkFMNFEvV3Er?=
 =?utf-8?B?SXZUN0NiMGtOQmFpR0tWR0xRVE5CY3VRbFFHQkwrVytTVUw5VWt6cTNpTVFJ?=
 =?utf-8?B?cmZpUWI0aEYyRTVWdnpwdWR6eFdoaHduTmMxdGJhUXY2NlovME1ya0FZZGRZ?=
 =?utf-8?B?TzNjWGNhK3EzRjFEZU9uNVRlUjhUVGZnekNpSGRUSkVabDVlVnNTcmNOek8w?=
 =?utf-8?B?dk9wZjZHODhtZzhkZk1MTW9hOWVtcDljcEROZUtUWUZUVlBPZkxGQ2VsVTNF?=
 =?utf-8?B?U3YvNWJLbm81TWd6SzBUVTJnOVF6Z05YeHhqbnEwZ2xVMXNtNXh6N1BSVTFl?=
 =?utf-8?B?cFFXY2JVVm0zSCtUbjQzQXJDSEpick14Rk81SkordHk5S3hkbnNnM2JwSUNZ?=
 =?utf-8?B?R21YdUV5QlhiZUxyS3RQZ09CUUFTa0lDUlZ3NnZZYWhNd0hGczBkQVlmOFdH?=
 =?utf-8?B?eE04Rk9PbnpRSVZDREFBalh2cTY2Q0xudk9pR2RVMGYyNjE3UXhGd2VkWHFK?=
 =?utf-8?B?SEU5SFk5bk5pMmNsMUlCNHZZZXUxTG5CaVZLVlFkTmRvZEFXTzFwV1JoRm96?=
 =?utf-8?B?RUZjNjFSMmsrVCtTbkZHbUhNcHRTTjhqMERUNkV5SWcxRHhUWEdPSWl3cFVx?=
 =?utf-8?B?cjJjSTVnank3ZldmdTJadHhibk1NMHd6TTBMdk5Ob1BlRTV0bzhWSUxaS0wr?=
 =?utf-8?B?eUIzQklCaHd3bmdDYWh2anIyUHFOSnlsTThFZWp5bklKdE9YaFNoRkM4c3dH?=
 =?utf-8?B?ZU83OEtIUFB3b0JNcHpDcndlSEhDQThFaTZ4WnpCSzBrQkRVb0R3QkZPRmxI?=
 =?utf-8?B?MTRDd29qbnNSWDFIeStDM3lhU1RXeXFuQWVFcld6NHc4b0tVTWEyWDc2V01P?=
 =?utf-8?B?Wmt2VDZyR0FoYWEyazNtVFVpdndOKyt1c1UwQVZPNzZCazFIbDlNQWNQaUJm?=
 =?utf-8?B?WFh4b2Z0MjdzYTZLWVR5dFBWd3JuUnlETmZQT1owTXYrcVJ5OVBhYks1TzVy?=
 =?utf-8?B?a3dlRDhOdW9vQ1hNdlJYOW41emUzZW5idFF4TS9LdlRJMzcvVHJvSDJacjNj?=
 =?utf-8?B?ZDRaK3pNejNoWStrd3ZzOS9xNGw0V3M1YjB2dmhyeHdwV3NtRWdMM1JVV2pi?=
 =?utf-8?Q?je5d7Y1nu1Q+S035Biu6QE0GertUZdno?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3FoOXRuWmc2eU14WW9STDY2UGpmYWJ3QnRRbGo4K1ZMNEJNdkxtYnpVK3JV?=
 =?utf-8?B?TFhEdFhyTDhIeGcrdkVjVmNNdk5lWVA4UU9nR3p1eUx0ajFuZ2t2ZW5uQ2Vz?=
 =?utf-8?B?bThvSVB4QjVEVmx3WlBoVzlkMmJxUndWTVRxbktkSXRMdTZpN0xZQ3E0aUJB?=
 =?utf-8?B?WGlsRUhSNE94Vng2QklCOUxvY0V0a1k2OXRwcE1tNzk1NXVBM0MrQmRzNllP?=
 =?utf-8?B?SE0vODg3bU5uSHZRTUlWQ3NDb1FVK3REd0RIbnIvcVVreHlZc09yL1FCK3JC?=
 =?utf-8?B?SEtrRDdSeTBiZlVjY2M4SllQdWJpbzZxeUY2OG16VzlmcVFNNzZjODN5WEx6?=
 =?utf-8?B?OTU2ZFNYbDRnYTc5Q2V6ZFpHUms1MXVmN2YwekV6OXgydU5qV1FWTHdZbHRv?=
 =?utf-8?B?WGcwVlRwODhUTmdGSHg5MDhSdGZKSitpMmgvb3Fpd3BFNWRCVFdmUkNPaWV4?=
 =?utf-8?B?Wm0zamFLbXpFV28yZDl3aHR2NnFSdnRYUnE3UnJmVmxtVVo1dXNnUTFFV1p1?=
 =?utf-8?B?TnowY3Nnd1FvM1pTQW1yUUVKdHlaZHNCM2hxUnFKRmZBaEZTVmNnUk9pT3BQ?=
 =?utf-8?B?OTFCQkFScWFqU25TT2YyYndyaURZQThRZTd2UWdQNFo4aTkvTC9IcU5CZ1Ux?=
 =?utf-8?B?Zng1MDA3MzNNeDdhSW9pcjRFakxiK25GVEw1L2NGQUVsVWJJem1iSmMzdkFO?=
 =?utf-8?B?ek5lR0V1VEFmVC9YeERlcURWMGhrajQ2Q0s3c3VWNkhWZVU4U0o1YlRxVEU2?=
 =?utf-8?B?M3llY24rWXI0S1JVN1dMNHBQZ3ErVVV3UEhRQTV4UUhDTjZhOU8vRmFJTXNv?=
 =?utf-8?B?dlRHN3g3YW94czJBTXFBU0JWSWs5aEowSERxTEx3di9pbGFLSEI4QVhyeEFp?=
 =?utf-8?B?MllwRy9tdkZHc0tJanF1SFZ5OTJNSm95RUpQTUV0NExNUnZPeG40bWlKdG1B?=
 =?utf-8?B?ZUNCdUNNdHBIK1N1S2VQT3F1NWhZTC9ha3huelFUcS9ZWkVvKy9QZU1WMDBj?=
 =?utf-8?B?NkQ2MEozdTM4WVJpZ1JrVkZERXRXM3JmRTZtWTc1QzVucENSMHJBdThDMlgv?=
 =?utf-8?B?TXBYYmNySVpVTTBRNDFpWnBteUZHTy81cTQra0I4cXhnVlRhK1BMWGdRdExs?=
 =?utf-8?B?Q2FWcGY0bXhXRWFqNVlOZXU3TkJ1dzhORWNVNUhuTkl5Y0pvOHkvaTQySXlS?=
 =?utf-8?B?cVdEbkxXWkJwTS91LzhGZjJzTmN0YkZHOWhGQTNkenVPWFhKMGNDaFY2VjZB?=
 =?utf-8?B?SGRnNnp2OVMvdWFzdmZlbmZTY2Ezc3YzWk1HM0NxOG1yaXI2U1dxRmFuclkx?=
 =?utf-8?B?d05EVVlTZ1ZML3RBdkl4YkxmRFlWcm0xeFVnVW5oZEUwZ3BJQmdXVWx2RWJB?=
 =?utf-8?B?UWtlaktTNGNCTEw1bXNlRE1IWUZPT3JzSmd1YTNKMEQ0NWlTbGhVWmJTenFB?=
 =?utf-8?B?Qi82d0E3UjRVSHhMeElBc0xNUDgyZmlzYWQ5TWVFcmtGQUtKVm5qMW9FdmR0?=
 =?utf-8?B?UGYrWTBuM2hKQnk3Qk8xbjFQeWhoaTdIWUF1WVE5a3A0ZnpOUFlJTEVJaDFq?=
 =?utf-8?B?ZEpNUFRTREJNdVE5eTBkcE5ObW9NT3NHRVkvYlp2a2Ira0o3dE42YmpDNVVF?=
 =?utf-8?B?N2JsdXVvRy9aVXhYOGpMN2w1WUpuSlRBS200cFFYbkw2UmRrZGFDanNpL1Ey?=
 =?utf-8?B?TVhUQngzNmlDR1d2MzVtcVUzSGxpOHBrRmQ1aHJBM3BhRHg1NEIyV0E3aU0v?=
 =?utf-8?B?eUNCRlJWc096dnJHdDdxd09XQ09UYnBMVnE5aGVqcnlFYnRtS2RXbEhjd2pl?=
 =?utf-8?B?bC94amZvVmtUd05jOElRQm5VWHlRZmd4QkJwa1R1UHpEWlFaNXZxaHdyV3Np?=
 =?utf-8?B?VGtOMloweitUSmJpTG5OSHVXN21PcXd3U0NoYzUvRVRxenRISDVHYnpzL3h2?=
 =?utf-8?B?bkptcjRubk9jN1l1cksyVThINlByKzZISDV0a0xqTW1ac0M2bjlTUGJlYU5D?=
 =?utf-8?B?KzZ6alUyVExpd1BpMDBSZHRFSElGYmxJQ2djZGgyOXJBTUpKVEk4R3VjemtO?=
 =?utf-8?B?d2FGOEpVQm5HR3M5dVRLZTdPaThVbFVyZkVQTEpNdGp4RFNuSjdCUHlybG5S?=
 =?utf-8?B?cFU4NG5JdTR3VFhpVTJFSDRXTVBON2RESlZVam5jMnorSTRteklaelpJdFRW?=
 =?utf-8?B?bkl3d2FWZkgyRW5mWWgrbkQwNURLMjlqVGJSRXBnbEErQml6S1cvVlpxR2w0?=
 =?utf-8?B?MHVMTlBBcndGZjU0b2phVmZJVEkxZ1lVRTlTK1hNcTdrMGhsYVNHdUJueUJa?=
 =?utf-8?B?YXBneVBTSWs1YjUvUkd4a0NWSzAyN1dHOURlOUNjZVV5OGxxQVRrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a164e14f-da1a-4f8e-0fba-08de4221aa55
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:49:09.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoA+5thX5OcHucCmLl6uiYc07qFYE6/bEZttEFQWhBJYeaWx9T6LkjCNPRpfkRDG21MtD1H2x63vuc04o1Zj9aBA42GEgsIUD++ftzPIF6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6996

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Based on top of Oleksii's series centralising struct vcpu allocation.

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index effb23a23416..94b0cf7f1d95 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -17,7 +17,7 @@ unsigned int arch_domain_struct_memflags(void);
 
 /*
  * This structure contains embedded PAE PDPTEs, used when an HVM guest
- * runs on shadow pagetables outside of 64-bit mode. In this case the CPU
+ * runs on shadow pagetables outside of Long mode. In this case the CPU
  * may require that the shadow CR3 points below 4GB, and hence the whole
  * structure must satisfy this restriction. Thus we specify MEMF_bits(32).
  */


