Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359C4C11C02
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151879.1482414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVp7-0006qI-Au; Mon, 27 Oct 2025 22:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151879.1482414; Mon, 27 Oct 2025 22:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVp7-0006oe-6L; Mon, 27 Oct 2025 22:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1151879;
 Mon, 27 Oct 2025 22:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYa4=5E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDVp6-0006nH-4W
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:36:20 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a4f31ef-b385-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 23:36:18 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA0PR03MB5388.namprd03.prod.outlook.com (2603:10b6:806:b7::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Mon, 27 Oct 2025 22:36:11 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 22:36:11 +0000
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
X-Inumbo-ID: 5a4f31ef-b385-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTPSptDBq7T598GFRGJvbv7MuC61qmVOnEGSaLTMI5Vg1cG/fht6LDXvwFCIQKIi/tFV/CpNd0EO93wjUyI7UWY7xtVaB0PpRiEkbWNNQWiC/jB5lZN8cfYK0p9XJFpzK82r+hxHE+GYdelcNOgkdui0IBI/ytvxC4pcDBWLVuJpjE2YsZfV1DgFO5gU7fwzNa81tcsaI61THuofgDWl2SnwUDwqU8oSibupHsF1NiFMpsPMo7IFryyZTDZw2gNqY8xpMylBc9LlDWMaRTZ/vBDUJdmS13mS+6u+VRijTlVjpj9J3SIm1k2C8omegl9akP0XE8BODT++Ln4xE3wQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haAV+wvS4mk1r1ap7TS3pbrS6p39qDKcSu0uQEHXbN4=;
 b=te1hNGoZXXedaB9Uay2ePb5xvWdDax8XIvaG5yC/J0/OoztQHt5Po6s7vlRb0OrLBr/SppRLB586gSC3ZsvlqD9oknR5xjIbOSjzGLd8UBJjnHAxFO8TMKOOVBH+vYof3LBrdt0mErXJJS0NSNaG+i9cEXfVTu7pmwI8itO6Zwl+c27wZNUohDZbu8SNReSsJgNCdTOjP6Rl8hKfux7ZHGzWPAPeZjvOU6TcI5xnOTlkj+cXu5mhwhqyT4IQFTOAGn02eQBUcaqdSinXlPKjIrsQZv26PjGRz2SP5c2OSjvxZucEtBLC3LvcXgo0QTHPnIO2xv7P/J6r4lTN61WowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haAV+wvS4mk1r1ap7TS3pbrS6p39qDKcSu0uQEHXbN4=;
 b=weU3n6Gl3gImxfEreYtBCaEMx3ddwuEw8OzdCFZ6LNCEtC4F/buvvQq9c6KXMhRSLP9u2+HoBD8r7XqI/OoT9W417f5rYpM+mp0u+iKyD7sdlHaQnarnvBuSs6Ebeb5kwoEykvWhigo1+AQQ0deIOvSx2GKyx5PguJk9zRpePnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b701374d-61b4-4657-bd01-4c6975741fbd@citrix.com>
Date: Mon, 27 Oct 2025 22:36:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Support LLVM raw profile versions 5, 6, 7, 8, 9,
 and 10
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA0PR03MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: de9b9198-ed7a-4340-6f6d-08de15a93a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em4wWkJKWE1NZW01SmtYdTBXMHFuOXpNdmNGK0h3bXJXQVUraVN3ODJMc0NY?=
 =?utf-8?B?YktrZXgrV0NucjR3azlBOFFmZ0lkQVRyRGtUTkM1cWwvbExKdlFqbnVlTVpO?=
 =?utf-8?B?VWZhMmtrK1RWNzFSTko5bmp5YUlCVU9FMjJGb09TVEhFUG9hYU8vREd4Z0o5?=
 =?utf-8?B?dHRRZU8yR3U4OS9RYnZXdEVLdjF0a1duTVJWTjdORUZHTm9mWWdKbXpKVzZX?=
 =?utf-8?B?aGRpSGpITUl5WnNXQ1NlQnlTTW1SdFY5VnZxbnZMbTdqNUZPbWFDSENQUkhk?=
 =?utf-8?B?b0UyL3c5ejJQVXp1blUrMTIyQ3prMVVuUkR2S1QrMkV3alRqSXB6Ui9hY0FU?=
 =?utf-8?B?SlNFcUt1ajhPdU1kRjJOa1J1RUJFZ2w3aUx4b3lWbkdBTktHV3F5bEpydFZK?=
 =?utf-8?B?R29YcXh6NjhsUGY5QStPeG9ORTQ1T3ZYdUw3QWNwcFBta0dLcHUzVU56VlFW?=
 =?utf-8?B?bW5CS0gzbTl2bmR5T1BoZTJrNFhjYWsrc21sbnJ5VXJ3cGxBYk1jbkZSbzMr?=
 =?utf-8?B?ZFdBcS9TK2c3K2FrQndHZnkxMDJnM2crd2FxekFjOTE3c2NyWStVMnZwU0lQ?=
 =?utf-8?B?cmhzRExIaUxiemV6Zi9JU2JpTmkrMHVtMVY2K1JMRUREVFJycDJmRGs2OVJK?=
 =?utf-8?B?Um1JWW9aU0xHbm8vNmRXTHpTSk9hN2tPV2c4dFNMRE5VR3J0eEhVMmFndkpI?=
 =?utf-8?B?U1p0YXJPMkdiU1I3YzIrZ0xIR0VoSEdZUW00eExZL2NYS09xSU5jdU9mR013?=
 =?utf-8?B?Y2lrVk84eXhGZ3dNcDJTWGlsMjB4czBsaWQ5T0M0YUtOQjVQbG1QWnhPWlBk?=
 =?utf-8?B?OWswMGdpeTJabDZrakY2SnNEY3JsSEgyVThPUVhxaGNTVC9ydlpORVA1NXBv?=
 =?utf-8?B?NVIrZkJxU2FNbVFMbTZVN2NTaVdobk5zb3JscFp2VlFsOTRJcnA5Z09jR0lS?=
 =?utf-8?B?TXNLOW9wdGorbHU4VVI3QzRRcGluamVOdmwrZFMyMFpoVDM4L1RuejlUazJB?=
 =?utf-8?B?MnJ1bmZ0eXlEd1paV2I2ZWJTQ0s5UTJ0MExDSEMrUjBKbDJPUERxak84VzBQ?=
 =?utf-8?B?MG5ldlE4dmxwVG96eFpSd1hTRFBUN0hjejhvQ1RPc0xBVktkeStxU3hBeW1K?=
 =?utf-8?B?WEJaS0lUSjdWVzJRRWFYN2ZWRGZxT0IySHNoNWpmaW9NTlVIWkhWMm5nZ2VG?=
 =?utf-8?B?amZ1SnZ0VWJ6N1NJc01nSXFRTDVCT3BubnYyTWhyc05OMkM2RUFSMXVpUTNm?=
 =?utf-8?B?WFhSdFdnWnIrWmZWVEJFTUF0NXRDOTBxZm9yWUJnTVAwUHlPZXYwSlRPa1hN?=
 =?utf-8?B?TTdUaGRvcEwvTmVmUkg2b3c4dHo2VU9LU0RuZCswZWxPMzIzanhscGdvMHFR?=
 =?utf-8?B?QTBTTmxwdGw5c0ZnTEJnQ3lpU20wRE1FL2dVNXM0TkVSZXlQdlhhS1k2L1JG?=
 =?utf-8?B?QWhTWG5na21ORUQwbUQ5SStZR254VmZjSE1rZVNKYStkL1I0R0x2TTJaY1FC?=
 =?utf-8?B?aXoyeDl1RGo0cm1YMkVpQmgrS3lXTGVXUDE3RjFhWDBnbDg4Qk9HYzZWNW1o?=
 =?utf-8?B?UjFzdkJSV2dlbnF6OVFOR0hyT09tNVBLQXlvOStiYXZQL0VXNXorc3lIUm9r?=
 =?utf-8?B?TmQ1NzQrNElTN3VxT21pUXFlaFJTdkZNMWhFdnhlWmUxajhZS2hqK2pCcE5O?=
 =?utf-8?B?UmlYNENad3lPUnl4aUFjU25MRHpTeTUwK0dLRDJqbm9WQmlHYS9IazJ0VFlI?=
 =?utf-8?B?YjhESHBYNGxGblY2VzBRcmlDclBCMS9FeXJ2N1F1NU5NSFRtV1k5cGhPczRX?=
 =?utf-8?B?QTUrZFpVS2Vrc3VkRkoxNnd0Y2VZckZsZkZ0bGpCWG5xZFBwTkREOTFCUity?=
 =?utf-8?B?TDdnQmdVUzEzZDRuQkM5RHhINzIraktORGhIblhNWXNkeHBrSEF6dXJQYlRt?=
 =?utf-8?Q?G4smyC2IMeFLKH1cCpO0hB8Gg4ipGILD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTIwOVFNSU8wQlBqMnFScXZ5STNrQUxoN2V1Um0yTUpWVjV1cHg5WG9FZndO?=
 =?utf-8?B?VE9sc3oyOFNWS2x2aDBiOWlpS0RXaldUSDNEZUlLQ213TFdBblR4WklLL0x3?=
 =?utf-8?B?NjFtMi92TmpNS0pTdHpydGtsa3BUaTZXeVBLSG5LZ3g2T1NnWmMvKzJWdU1j?=
 =?utf-8?B?SUdpbGNlM2pjZXZNM0p1QnN5RHNlUU83Y2hKQys4M1JRR0dsQ1BnRFFMeFlv?=
 =?utf-8?B?bWRSQkd3bkhGQlBHSXlYNzJsZi84dGcvYnY4QS9wb2FlVzVLcXZmYk1zOXRl?=
 =?utf-8?B?ZTRrRVlHSWlmbVdkS0toQ3JGZGpGTjY3WUtpcE1EY3hFTkd5b0dKTzZrTDlo?=
 =?utf-8?B?U1VmRHhFaDRMU3RjWGN5dVZGcGtrM29NVkpsZk5wa2pLTDhjK2hsUEtLbGl4?=
 =?utf-8?B?aE55aDdjUUV3cmlMdnFvNUx6bThFRUF5NVlsYkhTTmdTNFVhOXhIRGRacHhi?=
 =?utf-8?B?NVZScGRwcHR4QXFRanZaMHpUUzdtbzZzbkM5ZkV3OXVqZ242RktiN0ZkRkFH?=
 =?utf-8?B?ajU0eWppZEg3UHJIWk03ekFzSDZhbVYwTVNYWmlWSitLK1pudlhlNWtzdmc4?=
 =?utf-8?B?S2J2VGE4b3dEdU0yTVFNQ1VnSkdjeHpMak16QjZ0c2l4OUV2ZzZTQTl6bU4r?=
 =?utf-8?B?Y1BJM09ibExHZlRqOXN5MVFoZm1vZHNRNFdtS1RVSFAyYTk2YS94TXZkajZP?=
 =?utf-8?B?b2dFWVZnKytKQzUwdU5hcmNUbGw1ck1VenJCVHRaVnVYcnpvdnBITkx2Mlpw?=
 =?utf-8?B?L2tSZmdlZCtEbXF3d256dGtIRXhsYklTdnJ3RnJlUHRoR3B3a2lCd0I1cjFq?=
 =?utf-8?B?bXBiVU9vQWNucUZFZUFTN3Q1aG95S2hWWE00dW9xd0p3clFiU1RSVzhtejhT?=
 =?utf-8?B?VjhEUGM5SDV2WGQrTTVPa0lqcmlpZzJRYlAxMk9vQU4xdGVwRlFGNFZkampl?=
 =?utf-8?B?Rng1TDZiQThjQnQ2c2lXSEtCNDBJSTZQdGtHeWZibEFGQTRaZnQxdER0Mzdh?=
 =?utf-8?B?NFN3OTBnaDhyR2NqMFdzZzFsOHJob3VZbnhIMG5nRXVZVEQ3S0Z6VmZNWklW?=
 =?utf-8?B?eWdxRG5qQWJVSDZnYXJFb1cwT2EvbE5sVjN5cm9RZU0wTG01RWhKWmprQm44?=
 =?utf-8?B?MERNU0dTdDRDeWYxUWMxQTZwbUlzUXp0Q0hkUy93cDIyYXZpUXZMcExYUUw4?=
 =?utf-8?B?M1NFNDR0UFdSU25OWDJmaWZ5NmV1Z3RmZG50ckxxV3htTDZLZFZneG1USVVB?=
 =?utf-8?B?YUFMdGs4NGdlc05YeGp2SEx4cEFoSHRqL2RFQlF1eWNja2czVlgwQSs4anov?=
 =?utf-8?B?Ym01bVp5SmR2THNXOEJReG9VMTJBK2w5L2NxSDg3NVFERmF1MXYzNlNQUHlI?=
 =?utf-8?B?RkJlRUlWK1BCQnlvOHpadWVrWnhLMWxPdG8zRUZUbHhScERYSE8xRFROeVdl?=
 =?utf-8?B?ZXg4U3JUT2FFUmR4RlBZSG5CbXpJekcxMmpJVkhlRTBNMDBPNzNaREtSTysr?=
 =?utf-8?B?enFSejJaSWZoNXhmS0F1cjdkRE5XYlpYUnhKaTB5RUkvV29GOStuQkgzNlNJ?=
 =?utf-8?B?cTVFMVg5T2d3TCtwQXdMTnljYmR4TDBMcklxd1dQY2lnVWtUN1JPa1ZyQ2dz?=
 =?utf-8?B?cFdXRkwrd1F3K3loYThvM05aYUx3UU92ZjdqT1gzblFRZVRXN2hNZjdMSTRv?=
 =?utf-8?B?cm9RMEFOUVkvZmhPWGpxS3ZmdllPMVFHN1RTYTFqNXZJZ05lWnJWMU4rZTRR?=
 =?utf-8?B?OGZhaVhMeEpUWWd5c1h5SU44S1c5SDVCWnpVNXI5NVczS1paM0loZHJscUVO?=
 =?utf-8?B?elZmRnVHaERWRmZlbittUUF3bTVRWVF2ZC9MQzZBSEJGME1Xb2xzMEY2VlNv?=
 =?utf-8?B?ZWtUSEp4MWtuSTgyTzMvRmJXWFBpVkpmaTFJM2NmOGc2a0NDajRZYmFqQUg1?=
 =?utf-8?B?U0R2aEt4Z3NSQ1l3WTd5RkdndHh4VlRGenZEaUtvQklDTC9QRS93Z1JsQzdy?=
 =?utf-8?B?aG5JSjB4UGFsZTF6OUZwWVVBZzVONEFPdFJTa1FuOXJmZlpZcGZiRXJscE1U?=
 =?utf-8?B?bmoxWWNuVjVnUENGdFkwdjYrUW15QzBEOEdtZjNqR3pGb1lNa2JUak5UaGtV?=
 =?utf-8?B?UWdUZnhCRUpSQTFOTk9TSGFsSGRTNXIvVkNySkVTeWR3TzFZYlZ3SXpoZWFY?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9b9198-ed7a-4340-6f6d-08de15a93a9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 22:36:11.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtI5kryOD61mkFSN92n+3XUm6PZIeRZPeOzPMzHkVPwqV1qVSGdmNnYSvgLNYYIeVDuuUWimZtp2yeSjoT1wbbhHgGV5bi7CjjjFsqwv8U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5388

On 27/10/2025 9:30 pm, Saman Dehghan wrote:
> This change enables compatibility for measuring code coverage
> with Clang versions 11 through 20 by supporting their respective raw
> profile formats.
>
> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
> 2- Initialized llvm_profile_header for all versions based on llvm source
>    code in compiler-rt/include/profile/InstrProfData.inc for each version.
> 3- We tested this patch for all Clang versions from 11 through 20
>    on x86 platform.
> 4- Fixed linking warnings related to LLVM profile sections in x86.
>
>
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Tested-by: Wentao Zhang <wentaoz5@illinois.edu>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Changes from v3 to v4:
>   1- Use LLVM_PROFILE_VERSION in preprocessor conditionals
>      instead of __clang_major__.
>   2- Use DIV_ROUND_UP helper.
>   3- Remove unnecessary zero initialization inside struct.
>   4- Remove fallback macro definitions in linker script.
> Changes from v2 to v3:
>   1- Additionally support raw profile version 5, 6, 7 in clang 11, 12, 13.
>   2- Fix coverage related linking warnings in x86.
>   3- Revert unnecessary type changes, casting, etc.
> ---

Excellent.  Thankyou.  This all looks in order.  I've committed it.

~Andrew

