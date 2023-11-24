Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621C7F6EA4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640247.998225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rl8-0001ia-0P; Fri, 24 Nov 2023 08:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640247.998225; Fri, 24 Nov 2023 08:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rl7-0001gZ-Tx; Fri, 24 Nov 2023 08:41:57 +0000
Received: by outflank-mailman (input) for mailman id 640247;
 Fri, 24 Nov 2023 08:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rl5-0001P4-RJ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:41:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51994c53-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:41:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:41:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:41:25 +0000
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
X-Inumbo-ID: 51994c53-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRjYUBesvoPaIYNm2KzqTC43oH0NP35DOxn98HD07RWI3vmBhMm0Bn7B/Ar7OcoVgX1JT30BW5dIAVycoZiTS1VNtPrOGH3pA9NbcRHFBQl70+UIJCfULCoVAATRnPFJH0B3KPgo5NSFYy3PPMbNohg+PfS5payoo3ScANLdIp78j2bWUa+0/GvnGPdB0iFO5A6HqGm64HaQps9kGxCCl2nUqlbG+xZGQ+RWI9TkQ+gYsgPbJL1atzmfSEJeQHvVfF2D0OelqSQYf47qDYq8D1jEyctB263eIMZz+lUFu4JxQOeTibO1hAVdqAKeNlZICD2PbRMMwSgv+3bobTjBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDxOHEulPqfdO7PDE9bteBUoSvMOCgMjXRk/bt4LOO0=;
 b=gf+T+MWvf2DtUsUNbGQsVFZ8TISGKOsqDkzG7NZ5u2Hv867+2uXfWaWsX4Ml5htQH6ytvnb8qzf/3jIuapqw4IUmHXAOhp8KzgnNGO0H7MxyCp9LIOgM05MuGPoK5Bo0w4V0jjjThIbDfWf3/RG1fyndsio88J5GDXW3YGnCSEyDFy8mIFZG4FI3i2SGRZ1BsXr6f4uOS6hvfwl6NqocN+wp/8AQNUm6cCNHpxL803lRiIMRcqcJZx1KogiCCpokKcYPID/ftqoJCEHBXDsjvjOJaXig0Je4zphRihd5yUu0fioQ6A9h4EHjFpXODxBjvpGQncVSExYP4fce4DVX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDxOHEulPqfdO7PDE9bteBUoSvMOCgMjXRk/bt4LOO0=;
 b=AePe7+GRbkKpAEqAE9/pdEcJkEbUZKeKihy605WBp+CkqwMRvQUeYnnKQ2/nVye9spmizatHwXgTODiOH1fb5e9x6UbTsi5BsZsWPPeVnp1DtVgDNImRHAxFfk9dsaezm1qhZOW3rAA96DJB2xGZlxD1HOYgFugdpWx0kz1850Fv7aFbCZfYgQiqo3WtbPTsKnipZKEXqE68ey/Eqj0RxNcI2QwOBcITY+gdk+Ndy5zQxVWS+IZsWnzAYt1XWlwVJfZx2j57Uk7EvRCC6a5u2xSkJxOcpAp+jfAyntHvv/oKb3WNQHGCV+rVP2GGb0kakmhw7sNG2zKvV5zrbqQcCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfe9d39e-3be7-4a83-b8c6-3c9b5b85f51a@suse.com>
Date: Fri, 24 Nov 2023 09:41:24 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 09/15] VMX: convert vmx_pin_based_exec_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 655cace7-7a4e-47a8-33c7-08dbecc924c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xe52i6xVakOgvfsGU5fZ/TX14LZmS9UAvd8q71quqOU9JmYu9SpgFfIoz+gH1AMEWSsw5w7HRVgyd2xmJDRR2TS0SLLW4Fk+DFahR8UV+FNAmQc94mbUDbfq0EifaC7Gtuj8Q2T8bRXEo+cE7E/IwPbZPsGSW8tPQ8+toXfB01Zr+eGszatH2tvHIMMRpdvd6bRhzSmMYDi8QynI8XeDBpOMzUpbXiesaZmD/eql8+hFgX1pozdjv2V/0mmUTrYZMX5MinzCPOeIxxE+orc8h313XI8qA+/y6XsveEEbVsd77eooXylRutwvvHhvmTOtZwFadlnGUj7koDwKaWlJfeEejJKqVrDBxaQcfbfqrj3tx+0y5O78Us1XMCimxLNec465ZjtuepW7z3TVEpTRUx5itm/XRPhNQOYNEXDk6dHoprTTWhHHNWctIwCUAHsgt/Xnf0Ebfq61V3i6tFl44EUnxxeV6uoTwgHiR5SHSOs5XELM9QwaJycs3cnPfv1QmRjmS6bHG/rvUgx/YiKKIT0J2QRpTtwFlq97gWW5M99xZE38T/bZfNPBIV4crGJ8otvtyyGRoXDK/7I4hRcHtrpzuf2e48yqnafLJs3kCDpqaAhqchsMKl0UqUXKDkF5TC6ll0z3SL62Th807jPQqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2wvVEpJbWM0TjlCeWJwMnFiT0J4V29LYk1lck5pUnhFM0tCcUJoQ25QUWlD?=
 =?utf-8?B?YzA2dkV0M3BJbTAyVUZuRGEwbG5qU0g1K2lRcGFldG5OZnJuaHpibHVTNmh5?=
 =?utf-8?B?T0JPRXhMdk9kU256ZUord25ITnNvZEx0S0Z0d3VpSDN4SGdXdFFuc2UxY3k4?=
 =?utf-8?B?eWNVU2dYM2svY01Yd2k5aTl3cXgwK1hMTEZNSzNLWkFBY3M1bHZrWUdFTzBZ?=
 =?utf-8?B?dDBMWmZCbHFkYXpxQ1NWc21ITlNkWlk1LzNIS09CWlpzTlB6Tk15dVJUbHFX?=
 =?utf-8?B?WWtuNzByK3FpRGlKL0p6MHlkaVRtamhxZDN4VHlwNXhyU09ra3pMbEZHakMv?=
 =?utf-8?B?N3dRYlVyVW0xS2l0dmJZUCtoODBXdm9iNXFucUprV2tjQXdhVEY0WWZqV0JM?=
 =?utf-8?B?RzUybVpzL09JV1ZHMnZreDE3YmxBN1MrZzh3NlhJREQwbS9EdHZzTkdYZ2E3?=
 =?utf-8?B?bEFXSnV0Y3ROQkFDSUt0REVZRW15QnJmNVdIeGI2ZTlUa2tpY2N4amo5SzNP?=
 =?utf-8?B?eDExYW5zOUVvNXJsYXlBa2l2Yktza0Zjcy9TVVU1Yk0vcjEvRjdIQTV1c1FU?=
 =?utf-8?B?cDRpWUJnU2NubG5ZNjFVZE1vRm1hQUIyNFN4MFZ0elJIK0xEcWd1ZWZ4NGdK?=
 =?utf-8?B?MnRIdkFBMm1EWTNQM3AxcUdaVlBJaGZDQ3VlUmpUb1JKOE84aytHZ3BEdnN1?=
 =?utf-8?B?eDhneGpaTDJJVEdVVnFEakZlRDUydzJiaVRkbXhIRndHVmVacjc4aDl5bCtk?=
 =?utf-8?B?OXJpbFdQSTRhK3ZzNzF3NjRhSDhMSVEwRGdEMy9yK2pweFUyMlQ0eEMxbStR?=
 =?utf-8?B?NXQ1bis0MDlVS0dLNlRzbUE5c0JtcHBZeWgwQkc1ZlRLTVVqam1LOHZoeWNN?=
 =?utf-8?B?azdPVkpsVVJsMmR2Vkt1cE13NHlWbXNTN1Z3eklTWGN5dzRJRUZpRkR6dG9p?=
 =?utf-8?B?eUl5VTB4UkUxZWhlR1J4Rmh2WXduYk1xMGFJeUgrUDFpWldjTlRxODgvemV2?=
 =?utf-8?B?MzZaR0pqYXpiYXJQdHZvWnJWenY5RlJxU0VHRXpNWlU0RTdRQkV3Y2Q4bGdx?=
 =?utf-8?B?SFl5Uitpa2dmZ1BRYld4TjVXa3d6akk3azJzYXJ4WTNJV0VlR1p5NkROKytS?=
 =?utf-8?B?cktaNFNwMWNzUEJrVURQcXhuVXcrb2Z4cG1udVRxMUExL1lOTDA0djc3cU5u?=
 =?utf-8?B?Ti9SUG1KQlE0ckd2Q2prclVMSzJyRnZWMExMVFhZZUJhV1hKNktSenRBemRr?=
 =?utf-8?B?dGdxalpYbzV1MktsZ3p3S25BVDQ2M0pTb0tpNTZydDFnellpMWdHVU1oWVZZ?=
 =?utf-8?B?a3dTVmZrNmt3cnpuS09TMUFaWXhxR1JWcEtBY2JiZFJUVkVxenRkT0JiTElU?=
 =?utf-8?B?djd5Mmhwa3VpbGtWS25PVlZQOUx1cWFpSXY0RkQwckJQaFhBaDJzSXRQNC9W?=
 =?utf-8?B?UG40cEUyenNnR0FKaEdYNUNJVGFQQllzc1IrNnlubFZKaUhFY2VyT1JlM0s3?=
 =?utf-8?B?NXZPbUkxRElieXpnZUp0MFBUdnlrVXRZQVFKTyt0amIwUFh4UXJEM01iKyti?=
 =?utf-8?B?YUJFZTN2YVRDWWtJWXpRc05rUCt4SFozNHRFbGl4eDlYMFhsakdlby92bUtQ?=
 =?utf-8?B?aUNHUmd1V3plMnFQejIzK2lDLy9zcFpWYllSb1RGNzBUZXNnWDltbXNIU3Fx?=
 =?utf-8?B?cG5rMkpabC9vSzNKS1pZRXZFcDVHRUFyZHMyUVQ0NFB1cDQ2RDRpckJwcFM2?=
 =?utf-8?B?TjQ4ajJkbXluN0NkQS9wZXNsU01LQ1FSS0llaW8rMTV5cWY0bFdCSXo0dzhI?=
 =?utf-8?B?cVd1YlUwUlFScE9VS2ZDTWFpTWRSaXl1VnZlNlA1VUs2bzNQOEk3azZDTE1R?=
 =?utf-8?B?RWFHbWR1TkgxMmpEWS8vSCtlWjJ2dytnZ2Y1VjlMQkhZbytwUW9CZUlzZlZj?=
 =?utf-8?B?WVY1aUJyeS9walhkbmNUN3hFdlM5QkNXeHphcXZ2dFVENU1SM0xDQmhYMG14?=
 =?utf-8?B?bWxWemxINHAySkxSNmt6U2RpV3psWlpLVjc3QXU1VTVMbVcwbWEvYjNHNTJR?=
 =?utf-8?B?b0dqQ3RzczR2VGUxZ2tYajRRU2JPZzVyZHlsdmtNZTM2cndiaG9zbXdORElx?=
 =?utf-8?Q?9RNDUNUWpxeu2ytnNaHhS1288?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655cace7-7a4e-47a8-33c7-08dbecc924c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:41:25.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ITHPp5Pj6v9+sNpI0+guN5I7NSVMfPEtWD4igCe3y+d9y6Zvk5Vqugb1mrhmMulKolD+RV04sPjRM94xByCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

... to a field in the capability/controls struct. Use an instance of
that struct also in vmx_init_vmcs_config().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
@@ -238,7 +237,7 @@ static bool cap_check(const char *name,
 static int vmx_init_vmcs_config(bool bsp)
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
-    u32 _vmx_pin_based_exec_control;
+    struct vmx_caps caps;
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
@@ -254,7 +253,7 @@ static int vmx_init_vmcs_config(bool bsp
            PIN_BASED_NMI_EXITING);
     opt = (PIN_BASED_VIRTUAL_NMIS |
            PIN_BASED_POSTED_INTERRUPT);
-    _vmx_pin_based_exec_control = adjust_vmx_controls(
+    caps.pin_based_exec_control = adjust_vmx_controls(
         "Pin-Based Exec Control", min, opt,
         MSR_IA32_VMX_PINBASED_CTLS, &mismatch);
 
@@ -406,7 +405,7 @@ static int vmx_init_vmcs_config(bool bsp
     if ( (_vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
           ple_gap == 0 )
     {
-        if ( !vmx_pin_based_exec_control )
+        if ( !vmx_caps.pin_based_exec_control )
             printk(XENLOG_INFO "Disable Pause-Loop Exiting.\n");
         _vmx_secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
     }
@@ -424,10 +423,10 @@ static int vmx_init_vmcs_config(bool bsp
      * is a minimal requirement, only check the former, which is optional.
      */
     if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
-        _vmx_pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
+        caps.pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
 
     if ( iommu_intpost &&
-         !(_vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
+         !(caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
     {
         printk("Intel VT-d Posted Interrupt is disabled for CPU-side Posted "
                "Interrupt is not enabled\n");
@@ -461,10 +460,10 @@ static int vmx_init_vmcs_config(bool bsp
     if ( mismatch )
         return -EINVAL;
 
-    if ( !vmx_pin_based_exec_control )
+    if ( !vmx_caps.pin_based_exec_control )
     {
         /* First time through. */
-        vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
+        vmx_caps = caps;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
@@ -494,7 +493,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmcs_revision_id, vmx_basic_msr_low & VMX_BASIC_REVISION_MASK);
         mismatch |= cap_check(
             "Pin-Based Exec Control",
-            vmx_pin_based_exec_control, _vmx_pin_based_exec_control);
+            vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
             vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
@@ -1072,7 +1071,7 @@ static int construct_vmcs(struct vcpu *v
     vmx_vmcs_enter(v);
 
     /* VMCS controls. */
-    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_pin_based_exec_control);
+    __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
     v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
@@ -2091,7 +2090,7 @@ void vmcs_dump_vcpu(struct vcpu *v)
     printk("TSC Offset = 0x%016lx  TSC Multiplier = 0x%016lx\n",
            vmr(TSC_OFFSET), vmr(TSC_MULTIPLIER));
     if ( (v->arch.hvm.vmx.exec_control & CPU_BASED_TPR_SHADOW) ||
-         (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
+         (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT) )
         printk("TPR Threshold = 0x%02x  PostedIntrVec = 0x%02x\n",
                vmr32(TPR_THRESHOLD), vmr16(POSTED_INTR_NOTIFICATION_VECTOR));
     if ( (v->arch.hvm.vmx.secondary_exec_control &
@@ -2170,7 +2169,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_pin_based_exec_control = 0;
         vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
         vmx_vmexit_control         = 0;
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1054,7 +1054,7 @@ static void load_shadow_control(struct v
      * and EXCEPTION
      * Enforce the removed features
      */
-    nvmx_update_pin_control(v, vmx_pin_based_exec_control);
+    nvmx_update_pin_control(v, vmx_caps.pin_based_exec_control);
     vmx_update_cpu_exec_control(v);
     vmx_update_secondary_exec_control(v);
     nvmx_update_exit_control(v, vmx_vmexit_control);
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -215,7 +215,6 @@ extern u32 vmx_cpu_based_exec_control;
 #define PIN_BASED_VIRTUAL_NMIS          0x00000020
 #define PIN_BASED_PREEMPT_TIMER         0x00000040
 #define PIN_BASED_POSTED_INTERRUPT      0x00000080
-extern u32 vmx_pin_based_exec_control;
 
 #define VM_EXIT_SAVE_DEBUG_CNTRLS       0x00000004
 #define VM_EXIT_IA32E_MODE              0x00000200
@@ -286,6 +285,7 @@ extern u64 vmx_ept_vpid_cap;
 /* Capabilities and dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps {
     uint64_t basic_msr;
+    uint32_t pin_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -296,7 +296,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_tpr_shadow \
     (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
-    (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
+    (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
@@ -331,7 +331,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_virtualize_x2apic_mode \
     (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
-    (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
+    (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \


