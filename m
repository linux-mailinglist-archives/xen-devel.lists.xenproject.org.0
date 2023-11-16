Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AD7EDC13
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634012.989203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Wv7-0004nv-FU; Thu, 16 Nov 2023 07:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634012.989203; Thu, 16 Nov 2023 07:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Wv7-0004lL-CO; Thu, 16 Nov 2023 07:36:13 +0000
Received: by outflank-mailman (input) for mailman id 634012;
 Thu, 16 Nov 2023 07:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3Wv5-0004lF-DC
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:36:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe16::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefe4562-8452-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 08:36:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6773.eurprd04.prod.outlook.com (2603:10a6:20b:dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 07:36:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:36:07 +0000
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
X-Inumbo-ID: cefe4562-8452-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb0RRgEPrVDjzc/4BtPP5y0wCPKfAULcxd1RcrX2Y1GvjW/Qgo2jaZ2SBMZd7xfPDTCFapupG7noqNcUQi5FTc1bZ1SmbSCcShO2Oq4CR9rOVT9QO/rU/hJlA86S7rb+unA2hD9f2G9hSJFLgWukCpSb4x9rPUc6SwbmzVIAhT+KUyiPAd3zSNm/ltrebxsG/b8xaG/Z9bh1NoJPvboMn9CSe2IqOEu3y33F2dsu405+IBYygSa54pR24sFj7m89hDUye/mJbBEKntKpSPvi/KdeqT5AD3bZ/xXCadmzmsViCbvfxfY0yimMPNSrC+UxNBMw8eVgCANMuO1aCqj0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+ichsb920r0fIcTV1d+HJ6WmUJs0Bku0f6aQWgk18E=;
 b=XEGZLNDTqutOGVQWrnor0Vq7nrJy0CaA0BOcstT5PD3Bj9QTT4N+GG/ks6lofc21n/FVoCkfznB8mXSWiLuAA3Jzg1BItkKBsU1+Ew+nHBCcubw7NXemXYHj77PUzicmkjXwiff+jcIroYzgPxMd3IqAYEDBfTmLFVsUW9Vwf59eh4Qy15an+5HIcdJePhjbM3ZOoAhO+LkYzUTrysmSSypYqve/i/682vkmydda+NbwD54NFBhZdvllrBMU0jfLEddyJ6XNZBzdzhBNmuUQlhTQtHdwMTSK7irztmiR7+fTLx1uuuTh5+WNuqAn/5ZNZ2iowIWECoX9ThE3q1CdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+ichsb920r0fIcTV1d+HJ6WmUJs0Bku0f6aQWgk18E=;
 b=hmLR+H0T17NpwsoYauJSHFt2NZ1DegyuufE1gdeuNLzg6H2tDGBVmkIUYKattEpe+GZHSGxqfyMwC7rzkZU7eLKo8k2H/mhA4JUxKxDY/vtBBryrwUZrlxtd93H6jSz+p1CPAYWszqS5rW5uWfkhLU1o7uI7X6hQzlvxw2dflApw8CeCNDADyy6Fe+KZZE3oY/97tXZfluFoNJzbNYkLCPpPsXT9ACBOQumTI7+Ajcm2cVJ6OL8dG24fmFATmdOalCpvobvLWgXV4QE7dZoch0gLhoGN2MmwNkVIP/R0KYEvZzcx6Dmc6HOsrTMZe4w1cPbtzKYTCQoDDPLnu19D+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7fca726-f4d5-4cdf-981e-2a6fcf5085b0@suse.com>
Date: Thu, 16 Nov 2023 08:36:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c2271a-706e-470c-2fe4-08dbe676b23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	USQ3GvGTJJaaIlEXPosfn3Uwgm6fFaGe3Khs5kL5WHHbV1FH9CBbK5OxsvbzslunO/gMYXsuTVK94h0QbLRsB3uz58n3sg1s5RwqBfDXRQMHSxpgg9ibHd4J5ZfqxqYDYG+7VZCyRfPFUf1zZqnlqG1RbYj57GcWJGi96YmYKmjHY4+P591bduwpJQFYgAioHsyve+DTLn5EFRNhzKTa/ubj2XR8GAFk3am88gbd8s6q55xwY/JevVhYKeZwrPltKlJqR07Co/KJIWIzfsEcgj8Ow/HbVBuInrSTTKRUgXBSJ1ZVodCH/gskMO9TTwlitcOND70rHE1xXyLV2sD0RVoO+P9c4QWLrVqWtEpqE48WDtLCfaFw062i/QovwOhIdN7MYCbk2Kt6cPhp4UVhvgq/AMISiWvJFzruWHrtOoFjQdGY4Y2XUz1/rJ16slEwoxabu9wds1QLaCOi4Oh2KZHFaxyRT6+ot62AG8OG0rLFxqZDNlqnNFHMykiCm9EezdlWpmp+n2k1tQs7dZf1/BFyHriqwWK2nHWqUxEe0ysWv262TVJF4FK3bMSTJPd2WkET+rkYZD0+/3Io00Sa27KL7hY7GWRsvYGkHYKe5lXaJ8x0Kr8X75vVb/MZycBrmKgMo29jAv7vDXCS8ZuMnvMU1D1aPtoMIssV6s6XlRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(316002)(6916009)(6486002)(36756003)(38100700002)(478600001)(66556008)(66946007)(66476007)(54906003)(2616005)(8936002)(41300700001)(2906002)(4744005)(26005)(4326008)(8676002)(86362001)(31686004)(53546011)(6506007)(5660300002)(6512007)(31696002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1pka2UzeGtWVjVJWmlnZjVUWStLTnFqQWxQbVRncnZtOTBJUnFLOTlzQ0xW?=
 =?utf-8?B?b2t5TkFMZEc4UWVER2Vub1o5cjBiQzdoQ0dMUHBMKys0RURpN3Y3WW1LZ0Vm?=
 =?utf-8?B?SzNoQ1Q4UWFXWHYweldONjlWTXpWM3kwaVM3OTAxR3ZRLyttblNzK3RwbWZX?=
 =?utf-8?B?SitGT2JWczduVUJVUml5WEJqZzlNR2xXbERtMGRkLzJkN2xraEtDRlpSYXVL?=
 =?utf-8?B?cFdMQWFXZ3JwRWVSUzF2OXVSUUJybzBweXJQbTUxVDdwWHlOMHppeTRQcnJG?=
 =?utf-8?B?ZVBNbXpHL2R6NkdENXo5d3lDSEkxc3YwMHk4T2tUc2xnNWJzUFd0RTdsSHZj?=
 =?utf-8?B?ZmM1bldIbVlsWlc1dzhWcHlOekxidDAzajYyMEwxdnZSbER3bWVjMnRIUmhW?=
 =?utf-8?B?SGt0S0FPVHcrWG9LMi9QMFFGSEM0Q1FoNTVqdFVtV0Ird3NScE1IdlY5OFNC?=
 =?utf-8?B?S1d2cUpxL3BLNmtoQWhVWHdtZEpKYXQrSFlaS3JYdDJKQWRsR3pxQkJjTHA4?=
 =?utf-8?B?UDdQaG1FTDhQZlg0LzV5L095MzFOVFRlc0hkRTFJK0JKRkZQdEtEb2Nyck41?=
 =?utf-8?B?N25Deno1ZEQ0RVpWUmgxd1hqZ2lJUW1UcENhdGwxcktoNVJlWHhmT09Kd045?=
 =?utf-8?B?ZkdHb0tVVm41amtLQ25aM3hHNXF4V0dmNUN0T24wUXd5bjNOQzh5VWg4NENC?=
 =?utf-8?B?T1VlMWVhUG9jM2RaYjZISFRueUh6bVBaeVFtREtaOFkra2l5ZDBiRDhGT0g4?=
 =?utf-8?B?ajlqbXdLZzFhY2p3ZXpMRktFNjJhcFVQQWNoZk5ENks3ci85N29xTkJOaXRX?=
 =?utf-8?B?c3Z3cjdXZ3JBbFlweHQ2K3kvRm83K0RnVVduY2hqRVVGeHB6RC9sdkNuZmtt?=
 =?utf-8?B?RzhXc09sazZxT1k5Q0VJSXh3elZyc0N1b0lJcDFGYTBOejFzbmpFUjFIaDhx?=
 =?utf-8?B?STZGQVM2bE5Vd0ljY2dRTzlWN0NpRmNWZ0xhWE1oY0w3Y3pNZ2IzbmJhamhW?=
 =?utf-8?B?WEszMnhHaTRaWk9lYklGTXcydEFtQnNkYXUrMW84QWFDMElMblArbXNIbS9S?=
 =?utf-8?B?L0haOTlhMnpLZ3ZCL3U4N2VIU2lMZ0Vkc3ViQ3pBKytnc1kvS2lQTGtiWmJP?=
 =?utf-8?B?Qnd6THp6YXNJdHNia1BpN0dYYVBKelNCLzArZm0wd0dodFcxalFucWJmbVJV?=
 =?utf-8?B?K3BDTDJmVC81blIvaytRem5KNE11WFZ5NUV4ZFNsalZ0VDBRcjJVaEVJQk1m?=
 =?utf-8?B?K3g3b2JJYlNkbmN2MHdTeGJJNUp4WGUrc29tNXJsQmlEME80UERUMEh2eDVC?=
 =?utf-8?B?RnVYWk5XQlAxOGZENU5RNHljQnd0VUMzM2dYbFV3YjQ4SVNjbkJoTEU1ZUVE?=
 =?utf-8?B?Y0pQcWxDQzJ3UnBIcHpXWCtwSE5mUllua2w1SHhxeFVaSG01UExZemhnTFpY?=
 =?utf-8?B?djlWdmVqQlN4RThGOWdhRG80Ryt6UjZmR3NKbnByeS85S2pnVVNKSDFYKzJH?=
 =?utf-8?B?SWpCYWhrcTNDQjFUc0hINFJkM1ZRL3k2YkNNNHYzT2piK2gxb1BUeXBHWUJt?=
 =?utf-8?B?UUJxRmFLaHNibTB6UXJhRHFseXFkUzVLaFlrUEgwdHNGRzlxdHJaUE15S211?=
 =?utf-8?B?QW10bTdlRE9uYTBqZ1ZUOFRTdmlYNDZETUxRZytUaGMyZ281Z1R4S1VHUC8x?=
 =?utf-8?B?WE5SZEZadUFSZ1Q4dVVNd3ErYnZiMEw5YlpwY2FIYlZ3NGtpU3VnWHJnS04x?=
 =?utf-8?B?OGpHSzAvci9MNTliZzYyU0oxdXZ6VjR2V0dhZXhQU2dENU9MWUN4R3JZSUlu?=
 =?utf-8?B?TUhva2tTUEtTQ1c2bk1EZnlPTmxCSUFodTF6OG1IdElXNXVhd1p0eFJESldE?=
 =?utf-8?B?NGlTMlJydngyS21qbHhNekxSQUJYR2NXL3NLMkRzTFh1d3FoV1RuVnd6bkxL?=
 =?utf-8?B?QkZRYXNKbkRqVTBid0RhUndpMVloMGxqalFUajRWUDVNREs4L1Jlb2M4VThS?=
 =?utf-8?B?OGZ2WXcrMUYrT25FMllBaEltUHhtM0tOa1ZzcmcyU29QL2lIUDNKdEZicGtY?=
 =?utf-8?B?UjZBeklNL09VeU5KaXk5WjFqd2VpT1BwNGtiUmNrMjZWUzdJS291VkVHeDl0?=
 =?utf-8?Q?wIzlfjM7zNvapcaXpugaTmvRk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c2271a-706e-470c-2fe4-08dbe676b23e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:36:07.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOTJ6TZChqCr81Hhm0UAgu9wu0hcKwLRHiPKWjUUcBl1P/4p+0+iqTNplQtrlfE9XwmmsN7dVsn+iOFGRPCdaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6773

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/percpu.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_PERCPU_H__
> +#define __ASM_GENERIC_PERCPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
> +extern char __per_cpu_start[], __per_cpu_data_end[];

Can we go one tiny step beyond what Arm presently has and make the
latter of the two const?

Jan

