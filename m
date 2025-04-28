Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85BA9F637
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 18:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970947.1359477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Rgd-000639-0H; Mon, 28 Apr 2025 16:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970947.1359477; Mon, 28 Apr 2025 16:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Rgc-00060I-SQ; Mon, 28 Apr 2025 16:50:30 +0000
Received: by outflank-mailman (input) for mailman id 970947;
 Mon, 28 Apr 2025 16:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS6=XO=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1u9Rga-00060B-UR
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 16:50:29 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e1a526-2450-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 18:50:27 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 16:50:25 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:50:25 +0000
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
X-Inumbo-ID: e2e1a526-2450-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtfLo8U2ei12t795PWmIX8cPci12ypzHapgol0qpMrKX7RLGT34hZu/nEpbXJDG0+soP9IrAOlJXJcdCqyfzhYmB4j1u9lM/uBp54Mse2r0hhfHeOIInTIovui8Gc8yhb5jtlDZ2NNmkoVYYyTMf9vGRYrmZ+vgJSKFiMEZWrUge5X2lGhqWWUqmRvZ7SF93lrXClHx7x1RlWdk/9i6O6h1yD8ThP3KfHvPVgNyD4852giYfzPHjhZiVwdLEqFNzW64ZC76B/lG0C+SAz72U/vStMttOzskq10ln3Mo0q+IPqEK+xwL3MftbutVQOgANJseYlcsZWG4OoMMoU84wGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BraKVSYmOZ7JsglOf9Iv6k7FUr2eg/0tl+hpXWXBFg=;
 b=piF2RT0pfH0futarNfRp8eM4ffOs1yDeJ5bxwNJPM3owkBoePFoDulhOWw9yKdlWWq4Ch+aHkwLGfXr8BAXuW6/w/i6qGf81v+UMnSqAjQRtwLMLQeWA5GagZMpsEJtoge9mtMN73/TKNt5+A3yYQVDihUnSCP3yquTLxVPrcaMBDZAnh7+G/LqvQi7/PE8gIwC17iQpEWXutdpqI8OsKexuoNnXxIKFUTsfdQ14MFCMerwzIpPQmyfrR+jSLBoXPHmQE27WbE8VrtieeN/Bz+pobN9e2l0BPh3PZUNeiLImlqjINjFqbY9vdX2E714gQ5+zqEHdTICnPfMILBKtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BraKVSYmOZ7JsglOf9Iv6k7FUr2eg/0tl+hpXWXBFg=;
 b=SME/EFYYyKc5vuosvgSJlmG9tZ7aWp4UjLzJTOrX3t3Vk1qNC4PuJokZ5UhmN6wxFMdsf3xHD1C//jMfQHVSvUavbPKww8nQEIOQLg6is0pjrDRL5WbDCly2tWdccZyU9pXp355fiBW/1pkBsIvJyz1/90knBZXT/3ROKZlFckKUvt7+hTI+lJwTTjfwLRlszAMLskD1PNh2ywvpmME8XYxmDu1aq5LE6/TxORa0DwYj1Im/Sfn+17Ld+YZlWPX+elc71Yckt4ASopig3BbOyL53b9vmwa5o/TsOYdzgQ3Wgzh8tuz4wnXjtNL+Av44Y48Rj2c8U1GL4HgCUwtIgjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <d819d5e2-39ac-4542-a6e5-9a2ad1d94149@oss.nxp.com>
Date: Mon, 28 Apr 2025 19:49:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] uboot-script-gen: Dynamically compute addr and size
 when loading binaries
To: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2504251631190.785180@ubuntu-linux-20-04-desktop>
 <PA4PR04MB9565F823E4231F7A27557C93F9812@PA4PR04MB9565.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
Cc: Michal Orzel <michal.orzel@amd.com>, jason.andryuk@amd.com,
 dmkhn@proton.me, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 "S32@nxp.com" <S32@nxp.com>
In-Reply-To: <PA4PR04MB9565F823E4231F7A27557C93F9812@PA4PR04MB9565.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::6) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d8cc63-a434-434c-dc23-08dd8674c5a6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFNKdHJGYkNoQ3VPcVpJdU5WQ3Z0YnVuUWxxVEVRUGpGeGpEdXRPMU5kM2Ex?=
 =?utf-8?B?a2VNSVhhdTZwTHNnVElqVTN0LzZqSTNhMkZQWHJSaEpWS0JMbUY1U3NRSTFX?=
 =?utf-8?B?T21QVktFSC9XZktsQUo0ZDlZY094bm5LUk1idmU2UEFxaVJoVk55dDZCUjdU?=
 =?utf-8?B?dDVJeXN5TnNBcmFtaWtQbytrNFFnWnlrenVqOTNKZ2ozSm5hVWRnRHNKWTda?=
 =?utf-8?B?ZmFlU0FBU2JWdFhVTWpLZHBCcXlRWVJaMy9BczJ1MjRNUFVxME00YjRBcytK?=
 =?utf-8?B?M1dGODZzbW9XQWR6a2RrQlNMUk1sZTNWakF6TlZ3WjhhU2xxMnBIMTJOOWRs?=
 =?utf-8?B?NUdoR25hQUxnK0wvdmNoWDJzZVlhd2ZyQ1o0VWRxcHRobHZZREdYNytBWlR0?=
 =?utf-8?B?amFDNlhHYWpMb1pqUXJUZ3Jja1ZuUytiMFdieEtmdjZZTDNKQVhGcDBGTjQw?=
 =?utf-8?B?UStsQSs4RTBtVXk4L0FyL1E3T2RUWVIxaE9ka1hjcWVNaGJkUUo2Z3BqUXgr?=
 =?utf-8?B?S3ZCU0Q4WmVEUW93MVhENjlxalZPSEo4NXNvenVDSE1ONjZIMnpqZDhrUEo4?=
 =?utf-8?B?ZDk2aHZIejNuUjkxNGw0RWV4bHhSRGJlbjdES0xqUmJYS2lTQWhybzlvN0F6?=
 =?utf-8?B?VHE0czIrQTN4NExhQWZTNW9oZ3pqMWxTZlltN0wzMFE2ejdZYXp2MHFFOGI3?=
 =?utf-8?B?cmkwTk52WnEwQUpPY09pUnJuQStoNDh2R0xVZk42a2FyVWdwa214N0NmdVZV?=
 =?utf-8?B?cDNVajlVODZoTG1QT3hPWERPNU5hMU14a1NIMkFTS1hhdVNtMkN4REFnWDBp?=
 =?utf-8?B?cnlPTnA1MmZhclRSdFJKcDZMVWdJSWpSNHorWnM0OFUvVU81VWdOcXo4RitT?=
 =?utf-8?B?WGhUQ0EyQUpxdklBcng4dmhXMVZ2RXdFN0JNR0R6SjY4WWZIamY1Y1Fqc0NV?=
 =?utf-8?B?Mkc3MkI4OWdsbUI5VzlNenNSMzhjOVo1WHBoMnU5bE9zcFRDM0FiWDNJSlZl?=
 =?utf-8?B?MVEwUzMzV0FXSTM1dWtkWVV2RVRab1RKci84U0hFY0xDUG40bCtrNnc3ZkV0?=
 =?utf-8?B?RTdoU0JobmFnMXNyWUNCT3VjYlQ1b3picFBQVWRMRG5HMVZBWnBTc1lVUnVI?=
 =?utf-8?B?N3M5ZlBPNWMvYks1aGRmdGdTRUdlMFY5NW05Wk5pSUNDbXlyK2NibXlFc3E2?=
 =?utf-8?B?d0g1N010UVl3VWhKVkt3WHJHbDRsMEFjUlcxcEZYYjI1ZlJuY04wQkpmU2FK?=
 =?utf-8?B?NitOU04wZUF5MEVzY0FhTVBsNzlCN0dlNGpnVWhZQVBJNytrd0VoemhLendy?=
 =?utf-8?B?R3lXZGllRU1CVlpuQlRzd2JIQzgzRzdxNVlBSGFGZE43ckNwUkU0RlZoak1C?=
 =?utf-8?B?UkdzYUZJNVo5a2VqSjdXdHRrN3BIUXJFVjB4aVdJaDh4bnVQdXFkdThNUWVu?=
 =?utf-8?B?cy9mZjU1ckRIR0xWSFNNOWlTNUZJanVrUThJN2NveVJsVmxZeVVEbkhaRjJa?=
 =?utf-8?B?TEh2RVZlYWFUTFc5aFZmSnQwSnRyeU94eUhDSFN5eURQZE1lb0RRZ1h4YjAr?=
 =?utf-8?B?alJPc3p6NlFIUjhCZW1vOFZGVURuY2JMdmRYZys2NUR5NUs2QmhWNW5ZNGtp?=
 =?utf-8?B?dnU3dkM0QjBMNlRTajZSN0tVZW5NaDV4cW0raEh6K25INkFOZlROQUNpS1Ju?=
 =?utf-8?B?Q3FTNVlyOUFrSDNGbjhVMEowcFNUdUx5Qi9ubTd4OHloUkk2Smx6eWJVUjFE?=
 =?utf-8?B?TXUyM1FPNGZtNFNzNzlJRXY1Y2xYZTlyQXFXZUN1citsR29BWFhaWEh4bnky?=
 =?utf-8?Q?M84JHayZSycYABzw+heL1g7O+hKkxaQPmMD0w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVg5NWJ4SGxKYjhMbDJKUndweDhnRkxZWGdqUStCcXorMU1GM3l3akxCUnNy?=
 =?utf-8?B?OSs5ajVOMHNSR1BHSVA5endNdTZ0c3kxVFVFNUpsYVZsY3BEemp1UTdPZjli?=
 =?utf-8?B?L012UlFZSFpJS3NCOGMxN3ZOd0NlRDI0dTZaaTZMcUlnWU12NWZuRzNRc0FN?=
 =?utf-8?B?endKWWJTV2pncXA5Wmg3MzBuTnVqeDF6Nk03d2dvRnduTGRvRlZxVkpZZWlU?=
 =?utf-8?B?YXROaE0rVzBPczFPSlVnK3dqSmFhcUVSNkxWaGpUSGFjeDRHZlFTUVl5MjNF?=
 =?utf-8?B?aG1EM3hTUHdRSkFBb3k4L3Z0bWhtUlA0WlNRcThsTUk5TmRBZVJwTkpSWnBL?=
 =?utf-8?B?Uk5yRTBEOWg5NnNHR0Rzb05sS241SHY3cGNWYTR0SnlzRENPb0Q4K2kzTmNt?=
 =?utf-8?B?NHVjZFZXbVFmeGhaSS9Sb245c1NnMmxOZ2ZabWJFcUhaU3hjZEhMaUdLd2h4?=
 =?utf-8?B?NGxacTZXeUEvM2g3UkhSdUxRZEdWZ3hla0JZYVdUbDNmck9Xc3gzMHA5TEVx?=
 =?utf-8?B?QUFiRXBxTytyTjlmYzRucGhjTG1pWERGYmI0YmFYOXNpUEdsdjhHWVNkemdq?=
 =?utf-8?B?dGdFS2daTG9ud2FSUGd0cDhYZ2w2aGNXUHJKY2ZKOU5KZzl6cXVZdUdmcjFK?=
 =?utf-8?B?SHAzd1NUMHhGcDJvbFBOemdHcTlKVFVPVjEzTGxpbEVQc0wwR1dSNURUeGww?=
 =?utf-8?B?T090YktncDVPTVpGUkxFVU0zSGEwRWZuVUt5ZnFJYnl4LzFaYXJjd0dwY1h3?=
 =?utf-8?B?TmpqWVFCT0tRN2FjeEJJc3VFL2MyUkRYNnlFVnliR1VJOGh3azZQUGRsR3Yy?=
 =?utf-8?B?MFBVMm1PcXBxVXh4RldzOTBrMDljOVo3cTUwSE1ncnpBNW1TQzVGanl2QnRn?=
 =?utf-8?B?MWhzZWhXVVdSbVVmMFA5ZXZ5NHVydEVKQUJkM0pJSzRka3VmVWtWRnFEU1pu?=
 =?utf-8?B?bHRhREJxMVVDYmprSlIvRnVEWDlldVd2YkNQZ1Fack9jb2t4eVkxTFd4T085?=
 =?utf-8?B?Z3lYY2Y3dEhTeVNJaXhncGxaaW4yaHB5RStseGovSHk5Uzg2WjkxZTlDYXRX?=
 =?utf-8?B?b1I5aGc4TzhIbTJyRUR4Z0FPM0JoLzQyUTVmZFRpWXI0VXZLL09IdVV5S0FY?=
 =?utf-8?B?VWw3SW5Ma0hnWmlGVytTM2plZUEyTW9vUjdIV1V0TjJCb29MMHdZdVQ3ckJP?=
 =?utf-8?B?azFzdHZmSGg5WFV1ZEx6L0VaUHpjMlk1U2FkYlB0bmdDVzFneXM1Yi95ZWZK?=
 =?utf-8?B?TFM4amZTazJvQnNrQzlpcjVJc1NvMWluSzQ1VHhhQnhMTDZhWEdFUVNqZHZn?=
 =?utf-8?B?ajZKTjBybE5mWjRxbXVwTnBPN095Z1pDMzdzT3VlVGQ2aWZSVWp3Sys5d28z?=
 =?utf-8?B?Njl0L2d3T0tYVGVpeWRMMldKM3FjRkZXK0ZmalFDK2pld2Q4VjVNYk9PaEpY?=
 =?utf-8?B?QWU1cEV6VXh3c1VuRnVWbWpMZktYSC9iZFNERElxTnFLY0tYTytFdmNwbG5i?=
 =?utf-8?B?ODZ5SjJsN3phY3R5eDJLUzVnRHYzVnRRVUdNSHdMOXNUeVlJVzhmUklzNGxN?=
 =?utf-8?B?VEt5U1JUb2V1Rnp6MDZVYmZXM3FwSjNDMUM5WHcwM3V0V2Fqb0c4Z1lDcVJQ?=
 =?utf-8?B?OUVqaXFTSFlGdTdpUGhsSkdZMXhiK1l3MFk2ZUlCQ1dlTURpL3VPbXNtN1E1?=
 =?utf-8?B?b3JwWkxnQ3ZWOEsyZW40blpKSEJmYjJaekpVbkRSdHZvSVowZm5uOWpjQ05B?=
 =?utf-8?B?ckZBZ3M3amxFQlpvNVJyUVFvM3NSZXhJajZISzRWcndXZkt4b3QrQm9TUjhQ?=
 =?utf-8?B?aXNVVmsvMHV3djhDVWoyMjFPbzIwWGVqaXU1SHpBdENnL3ZsS2djbm1WVnJH?=
 =?utf-8?B?UzFkV1JZSm51WFg3SUh2NTJla3VZOHVYOUdtTFRJRTVtNCt6eW15anJJVWtq?=
 =?utf-8?B?MmdCd1NYaFhTbXVPUnlqdXY1QTFGc0xyOGhEVmxEbjBhUzBrdkxIYW9HNWxP?=
 =?utf-8?B?N1p5Z1hGc0RyWkJpU1prUm4vdmF1cXI2NjROVHlIclJXRXRkTkQ1V09JeU9L?=
 =?utf-8?B?TkJqZFgzN3N2ckhQVStYRjIyTmZXK3FDUkx1UmNMT0tUM3ZBS0RFRWZYVHpu?=
 =?utf-8?B?MG1ZV2N5Y3h3UUF0QnBKNkh0OHpHRDlsWnVoNXdnQ1VQWTZYMElqcGhjbG1Q?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d8cc63-a434-434c-dc23-08dd8674c5a6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:50:25.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UtDAzTrBYlWYUfEENL/LSy08YG7iXQUMvQV7fdqIM90daPqhZhIXieRzFvPQyryiLbXEK2sYo6RToWROAft976nc2jwytDsQwPy2WNmb70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372

Hi Stefano,

On 26/04/2025 02:35, Stefano Stabellini wrote:
> From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
>
> Normally, the Imagebuilder would precompute the sizes of the loaded binaries and addresses where they are loaded before generating the script, and the sizes and addresses that needed to be provided to Xen via /chosen would be hardcoded in the boot script.
>
> Added an option via "-s" parameter to avoid hardcoding any address in the boot script, and dynamically compute the loading addresses for binaries. The first loading address is based on the MEMORY_START parameter and after loading each binary, the loading address and the size of the binary are stored in variables with corresponding names. Then, the loading address for the next binary is computed and aligned to 0x200000.
>
> If the "-s" parameter is not used, the normal flow is executed, where the loading addresses and sizes for each binaries are precomputed and hardcoded inside the script, but the loading addresses and sizes for each binary are now also stored for eventual later use.
>
> Reserved memory regions are left TBD in the -s case.
>
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01862.html
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v7:
> - use $()
> - better description and alphabetical order
> - use heredoc
>
> Changes in v6:
> - make initial ${memaddr} setting depending on CALC
>
> This patch adds quite a bit of complexity which is the reason why I didn't originally commit it. Now that we are enabling ImageBuilder in Yocto, it turns out this patch is required because Yocto invokes ImageBuilder before all the binaries are ready and available.
>
> Andrei, sorry for taking so long to realize why it is essential, but we are getting there now.

I'm very glad that you're finding it useful too now!

The original problem for us was not related to building with
Imagebuilder from Yocto, but this was rather done to help users
have more flexibility with the actual binaries they're
deploying on target (more specifically, with their sizes).

In other words, as long as the same file names are used, their
corresponding sizes do not need to be hard-coded too in the
script, since we can dynamically figure them out and write them
to /chosen. As such, the binaries (xen, kernel image, fdt,
ramdisks) can be replaced without regenerating the boot script
and caring about their sizes.

Regarding building from Yocto, in our case, we're invoking
Imagebuilder from some separate recipe after everything has
been built. The only situation that comes to mind where it's a
bit more tricky to wait for the artifacts to be ready is for the
ramdisk/initramfs ones, but it can be done too. So it can work
both with precomputed and dynamic addresses.

>
> The changes I made to the original patch are purely to make it simpler to maintain.

Thank you for taking the time to refactor and resend it!
Please also see my comments below.

> ---
>
> diff --git a/README.md b/README.md
> index f8039ec..28c9e6b 100644
> --- a/README.md
> +++ b/README.md
> @@ -356,6 +356,8 @@ Where:\
>     can only be used  in combination with the -k option.  This adds the
>     public key into the dtb.  Then one can add this dtb back into the
>     u-boot bin or elf.\
> +-s addresses and sizes are calculated dynamically from U-Boot, hence
> +   binaries don't need to be available at the time of invocation.\
>
>  ### Signed FIT images
>
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen index 638154a..73d9600 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1,8 +1,11 @@
>  #!/bin/bash
>
>  offset=$((2*1024*1024))
> +PADDING_MASK=$(printf "0x%X\n" $(($offset - 1)))
> +PADDING_MASK_INV=$(printf "0x%X\n" $((~$PADDING_MASK)))
>  filesize=0
>  prog_req=(mkimage file fdtput mktemp awk od)
> +CALC=""
>
>  function cleanup_and_return_err()
>  {
> @@ -100,17 +103,40 @@ function dt_set()
>      fi
>  }
>
> +function dt_set_calc()
> +{
> +    local path=$1
> +    local var=$2
> +    local name_var=$3
> +
> +    local addr_var="$name_var"_addr
> +    local size_var="$name_var"_size
> +
> +    cat >> $UBOOT_SOURCE <<- EOF
> +       setexpr addr_hi \${$addr_var} / 0x100000000
> +       setexpr addr_lo \${$addr_var} \& 0xFFFFFFFF
> +       setexpr size_hi \${$size_var} / 0x100000000
> +       setexpr size_lo \${$size_var} \& 0xFFFFFFFF
> +       fdt set $path $var <0x\${addr_hi} 0x\${addr_lo} 0x\${size_hi} 0x\${size_lo}>
> +       EOF
> +}
> +
>  function add_device_tree_kernel()
>  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> -    local bootargs=$4
> +    local name=$2
> +    local addr=$3
> +    local size=$4
> +    local bootargs=$5
>      local node_name="module@${addr#0x}"
>
>      dt_mknode "$path" "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,kernel multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>      dt_set "$path/$node_name" "bootargs" "str" "$bootargs"
>  }
>
> @@ -118,26 +144,36 @@ function add_device_tree_kernel()  function add_device_tree_ramdisk()  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> +    local name=$2
> +    local addr=$3
> +    local size=$4
>      local node_name="module@${addr#0x}"
>
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>  }
>
>
>  function add_device_tree_passthrough()
>  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> +    local name=$2
> +    local addr=$3
> +    local size=$4
>      local node_name="module@${addr#0x}"
>
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,device-tree multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>  }
>
>  function add_device_tree_mem()
> @@ -358,7 +394,11 @@ function xen_device_tree_editing()
>
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "xen_policy"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
> +        fi
>      fi
>
>      if test "$DOM0_KERNEL"
> @@ -367,7 +407,11 @@ function xen_device_tree_editing()
>
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_linux"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
> +        fi
>          dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>      fi
>
> @@ -377,7 +421,11 @@ function xen_device_tree_editing()
>
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_ramdisk"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
> +        fi
>      fi
>
>      i=0
> @@ -464,14 +512,14 @@ function xen_device_tree_editing()
>
>          xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
>
> -        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
> +        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> -            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
> +            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk"
> + ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
>          fi
>          if test "${domU_passthrough_dtb_addr[$i]}"
>          then
> -            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
> +            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt"
> + ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
>          fi
>          i=$(( $i + 1 ))
>      done
> @@ -504,7 +552,11 @@ function device_tree_editing()
>
>      if test $UBOOT_SOURCE
>      then
> -        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
> +        else
> +            echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        fi
>          echo "fdt resize 1024" >> $UBOOT_SOURCE
>
>          if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0 @@ -512,7 +564,11 @@ function device_tree_editing()
>              i=0
>              while test $i -lt $NUM_DT_OVERLAY
>              do
> -                echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
> +                if test "$CALC"; then
> +                    echo "fdt apply \${host_fdto${i}_addr}" >> $UBOOT_SOURCE
> +                else
> +                    echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
> +                fi
>                  i=$(( $i + 1 ))
>              done
>          fi
> @@ -530,8 +586,12 @@ function fill_reserved_spaces_from_dtb()  {
>      if [ ! -f $DEVICE_TREE ]
>      then
> -        echo "File $DEVICE_TREE doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"; then
> +            return
> +        else
> +            echo "File $DEVICE_TREE doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>
>      # Check if reserved-memory node exists @@ -613,7 +673,7 @@ function get_image_size()
>      printf "%u" $effective_size
>  }
>
> -function add_size()
> +function add_size_from_file()
>  {
>      local filename=$1
>      local size=`stat -L --printf="%s" $filename` @@ -645,6 +705,26 @@ function add_size()
>      filesize=$size
>  }
>
> +function add_size_calculate()
> +{
> +    local fit_scr_name=$1
> +
> +    cat >> $UBOOT_SOURCE <<- EOF
> +       setenv "$fit_scr_name"_addr \${memaddr}
> +       setenv "$fit_scr_name"_size \${filesize}

The quotes here should also be removed, since quotes are literals
in heredoc:
    setenv ${fit_scr_name}_addr \${memaddr}
    setenv ${fit_scr_name}_size \${filesize}

Otherwise, we'll be getting this in the actual boot script
    setenv "dom0_linux"_addr ${memaddr}
    setenv "dom0_linux"_size ${filesize}

instead of
    setenv dom0_linux_addr ${memaddr}
    setenv dom0_linux_size ${filesize}

> +       setexpr memaddr \${memaddr} \+ \${filesize}
> +       setexpr memaddr \${memaddr} \+ $PADDING_MASK
> +       setexpr memaddr \${memaddr} \& $PADDING_MASK_INV
> +       EOF
> +
> +    # TODO: missing ${RESERVED_MEM_SPACES[@]} check
> +
> +    # The following are updated to avoid collisions in node names, but
> +    # they are not actively used.
> +    memaddr=$((memaddr + offset))

I know you want to make this patch less complicated and I agree
with that, since there was originally some more logic here which
was not necessarily needed and was complicating things.

But even though this variable is only needed for 'module@..."
node names, I think we should at least convert it to hex, to
avoid getting confusing node names, like:
    fdt mknod /chosen/domU0 module@2239758336

Keeping this here should be enough:
    memaddr=$(printf "0x%X\n" $memaddr)

> +    filesize=$offset
> +}
> +
>  function load_file()
>  {
>      local filename=$1
> @@ -657,10 +737,16 @@ function load_file()
>      if test "$FIT"
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
> +        add_size_from_file $filename
>      else
> -        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            add_size_calculate $fit_scr_name
> +        else
> +            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            add_size_from_file $filename
> +        fi
>      fi
> -    add_size $filename
>  }
>
>  function check_file_type()
> @@ -670,8 +756,13 @@ function check_file_type()
>
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>
>      # if file doesn't know what it is, it outputs data, so include that @@ -705,8 +796,13 @@ function check_compressed_file_type()
>
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>
>      file_type=$( file -L $filename )
> @@ -872,6 +968,12 @@ function linux_config()
>  generate_uboot_images()
>  {
>      local arch=$(file -L $XEN | grep -E 'ARM64|Aarch64')
> +
> +    if test "$CALC"
> +    then
> +        echo "bootm is not compatible with -s"
> +        cleanup_and_return_err
> +    fi
>
>      if test "$arch"
>      then
> @@ -997,7 +1099,11 @@ bitstream_load_and_config()
>          if test "$UBOOT_SOURCE"
>          then
>              # we assume the FPGA device is 0 here
> -            echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
> +            if test "$CALC"; then
> +                echo "fpga load 0 \${fpga_bitstream_addr} \${fpga_bitstream_size}" >> "$UBOOT_SOURCE"
> +            else
> +                echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
> +            fi
>          fi
>      fi
>  }
> @@ -1271,7 +1377,7 @@ function print_help  {
>      script=`basename "$0"`
>      echo "usage:"
> -    echo "     $script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
> +    echo "     $script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
>      echo "     $script -h"
>      echo "where:"
>      echo "     CONFIG_FILE - configuration file"
> @@ -1289,13 +1395,14 @@ function print_help
>      echo "     -f - enable generating a FIT image"
>      echo "     PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
>      echo "     -h - prints out the help message and exits "
> +    echo "     -s - let U-Boot calculate binary images load addresses/sizes dynamically"
>      echo "Defaults:"
>      echo "     CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
>      echo "Example:"
>      echo "     $script -c ../config -d ./build42 -t \"scsi load 1:1\""
>  }
>
> -while getopts ":c:t:d:ho:k:u:fp:" opt; do
> +while getopts ":c:t:d:ho:k:u:fp:s" opt; do
>      case ${opt} in
>      t )
>          case $OPTARG in
> @@ -1340,6 +1447,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
>      p )
>          prepend_path="$OPTARG"
>          ;;
> +    s )
> +        CALC=y
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -1533,6 +1643,10 @@ uboot_addr=$memaddr  # 2MB are enough for a uboot script  memaddr=$(( $memaddr + $offset ))  memaddr=`printf "0x%X\n" $memaddr`
> +if test "$CALC"
> +then
> +    echo "setenv memaddr $memaddr" >> $UBOOT_SOURCE fi
>
>  fill_reserved_spaces_from_dtb
>
> @@ -1583,7 +1697,11 @@ fi
>
>  if [ "$BOOT_CMD" != "none" ]
>  then
> -    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    if test "$CALC"; then
> +        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" = "bootefi" ] || echo '-') \${host_fdt_addr}" >> $UBOOT_SOURCE
> +    else
> +        echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    fi
>  else
>      # skip boot command but store load addresses to be used later
>      echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE

With the above changes,

Reviewed-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>


Thank you!

Regards,
Andrei Cherechesu


