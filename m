Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4768031B9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646855.1009464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Ql-0002kn-Jj; Mon, 04 Dec 2023 11:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646855.1009464; Mon, 04 Dec 2023 11:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Ql-0002j9-H2; Mon, 04 Dec 2023 11:48:07 +0000
Received: by outflank-mailman (input) for mailman id 646855;
 Mon, 04 Dec 2023 11:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA7Qk-0002iQ-Sl
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:48:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc04477d-929a-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 12:48:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7662.eurprd04.prod.outlook.com (2603:10a6:102:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 11:48:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 11:48:02 +0000
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
X-Inumbo-ID: fc04477d-929a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPBM2hTPPcak+EYZbP6Lz9u+9KORHuvriT9Wl5yrdDhT3VGnPXzXWIay7SxazEwBakCY6R01nAl/cRfSYUljRROD/oH7F5Y/dXBi9kZTe+vg6g+NS6PDuGlYq1+HTUx6G/hjpasMpQ2Azx9YHIDDGaZm+hxV2ky2590IWkTaePIG26u8KaYtG5SnEp22xqP1xwGu1Pi4eAZ+pokjJFuUNBKj6AU0198fe/sm9C70ag4ZVytsHrlotCuUAtq+oJicjRAsPAIbY4vBRMlJ7kkvN0fwmgjNFx9R+1pKnRMG0vBmJ8kM9aZ9rMW+lCrZbxq5rWeLXzN0Et2SLLXhWUgK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89WWsp8GQ5LJ3HEfd2KLi92uehiqhGoaVjmefjc/7LA=;
 b=BFIJhpW5cKEhLJJzoAC2r0Gc9LVI0Xwjejzk2mBARVgLrZdd83n/DWrx4gWEVIIUjmARr4JlOFqVEHupw+QFop2ZQfb2Qbb18YnvTSLDoPFDDVHfpNTiKlyrfjFxOziyGvF6S4V6sA8J9AUYsluHYs819VYmbfFiLijXadaTVl4S/5S/wLeIpWVSw0BOL73DBDtjgjlUWa3azreuG5N9+ZGw/mvxtudrAMnihLbEUTqEOe9hA0IKlYcSU9GNkv7Hv5sP3rsWMdwjGucUKO+FluuGcO06vOoWSF5jtnoUpTA40uYZz6va7u1AnEvOg1n5Vrj/2RcY44J/nA7NnzR3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89WWsp8GQ5LJ3HEfd2KLi92uehiqhGoaVjmefjc/7LA=;
 b=ng29YIT65Pfw/VCp7lQGNKf0Yvsv7UQxZXnPshHAyv5c4wqjPrmw2M1iM0cF3vwhz08udxN7e5fyI6T3Q7UKVpmqB2XAkJ90eyJL79r9P8CImfbP/H6xP09Ava4vCbhcaLeFX106gRmSRfTxk5hvgOWK/Ao0Xs+9JravRYXXmr5DzqSFWtAwWKpQQSKypyfLl2TJ4vDzlCqrgRjK/t96N+ciw2Z0v1zVz0IHNhBpJrxUrUL3HHytP5IDEOtmuOD23KesVNZf4U0sEgyfeFplPHwpceRm/xHwf/mR5hlvruWORJqboFQPThUN7nqP2ceSgVMIB8et54lw1xvLm7Sj3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11674268-4da3-4f20-909c-43b94bdfad2e@suse.com>
Date: Mon, 4 Dec 2023 12:48:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
 <20231201154552.3066321-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20231201154552.3066321-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: b00e79cb-b8ab-431f-e857-08dbf4bededa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sw1oi5bBAZTrjAdrZLtn6nvKzQV6Dgnu0NoF1LRbvrDnnI1xTPMgS0WbGqsQMbp03QZ10G8oheI996iJpT/H05W6s4lbeoyk/N1SLM2G/ZakxpLYLYADgMipb1wZ2TXSeukQv/GJ5GDPexe/j7Ajth0ycO3EXIEQtVQ6MSDlvhNePSTBUrN3i0vHK8N/BW3ddBrIX67JcnivQE2C7B3IaQKzEtlPWjs9ToefGz3ent/1DqaGkPb+z2nbgXKaptXRgWzTsALrVU+vMNzd8NH3TByYCL+ifI9utNc5JEti7cLg8Av2Zr4TyPtu6m/NDlNC4k7A0LaxJatRhxTVkb3m9EMQa9UOrrbZUP3l8SZY1AboPPI8MKI4AycRnc4UKH+wHEi4EV2GeqjP2tRYfxGJLCIwTFnjQgMd4HyC+r60hFZ9MnK9LHYHJf8YJo/HPKhY+N2j0Quu3I1PTVgT4yqxqtP/X38S7q2v3H6/1PZJ0JRCyYO0fz8ifPVYxLk8ruzLx58M24a/plQ2nfcmdKdmNKjLSkTC7q9WeITGgnhCKjFgCiNrkFVsJ2HEcVkBa/u7gN4lHWQ/jplMDDY9c9U6hmgJ6Hu53C55+/og3oLLCT4WvTNTQoosRPqh9ywozDjIU5SruGP2Eox6qV4hsBERhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(66946007)(66476007)(66556008)(54906003)(6916009)(316002)(31696002)(36756003)(41300700001)(6512007)(53546011)(31686004)(2616005)(38100700002)(2906002)(6506007)(478600001)(4744005)(6486002)(8676002)(8936002)(4326008)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGo0K2RQZC90ellKbVBsZUpNSmZxdVl3MVFSNjlPc1dSb2taUWR6YURDamE1?=
 =?utf-8?B?N1RqMjJKUEZlVlNjeUc2d0hMS2M3UGUvZGpMMWFZQldHVDFvRzRzSVZEMFBD?=
 =?utf-8?B?cDFKbWs5ZGJUU3JuZUlONkt4UmN6RnFHN0pBM1E2UnZHeTNwTEZGMnR6QXBz?=
 =?utf-8?B?cDdNaGFiQXlCYlNrOVVBdlY4K01Pck40Ujg2M0VQeFc3Ny9EUkdPeHU5cE5i?=
 =?utf-8?B?RmFwL2dmejJqVUo4TENiUHpFbE4remI2TkRjejFFdEJaV0s1azZjV0RybEhi?=
 =?utf-8?B?bHcxY2hIakJuNWtjV2UzcDdpbk15OGtsN2dacWJoaEJpeFF4bktiNXFGMnY2?=
 =?utf-8?B?WDRMMzdhUmVPM0FKaVVydVBTNU4yVHMwQnkxaldjV3FSdEZ2OENnZHdJb1JR?=
 =?utf-8?B?b3E2cDkrZVFHaERrYWxKdFVqViswczdNeDVNVksyVTZyTkdSMk8rM3ZEc0lm?=
 =?utf-8?B?R0NSTDlIY2F5T05pK3BZcjJLczMwSGtpUVd4MnlNd2U1bWZoZnpVWU9OaFhU?=
 =?utf-8?B?RzZHQUNPdlFFaXRlSDdoazdiZ1J5eWpjTVgxYjVwUHZKNVpTS3I0N2RpQS9r?=
 =?utf-8?B?bGFHWGs1c1ZlOUo0bU1aYXJ0cG1kMnJvdTd0L0RKSVdjVlFoNXlFSXY4VFR4?=
 =?utf-8?B?SlB3RVhlekpGQUFuSXNWT2ZvK2NYdVNlRU43MTdnL2JyMkVlV1gwazhGY0Vz?=
 =?utf-8?B?akNDOGFJaHV6UkhPQks2L0RybW5yS1NqeFR0dU96ZG1XQmZKQysvYXlHTzRK?=
 =?utf-8?B?TXBoRnRNR1FQRllTcTBlaEwrcUpacXFyYnZ6cW96UVRaSXBpN3Bta2ExSThy?=
 =?utf-8?B?UlFhR2tPOUY3MTk3R3ZPa0ZwdlFIRVBRcUhoTDdmdURySFhJbk5uMlV1bjY5?=
 =?utf-8?B?Z05lSElKT1RpMHJSd3BwMngvTnFBc2p6dzROUWhpZWJXZTJCZThnb3YwUlNC?=
 =?utf-8?B?c2xlWFE5c3dZVmRNOUxYTDBWL3R5NW4zdWVqOUI1REY5a1NyVlkyelJGMVB1?=
 =?utf-8?B?YU9TaWxpWHEwWUs5Qm1JSG1TUlJQZmJtSTY5M2RtUWdIWFpYb2tOSGNuQkVH?=
 =?utf-8?B?aTRad0hvOHEwd0VTdU1mREw4QVRMM1RPSDRxdVBGL0IvVVAwU0lFc202aStO?=
 =?utf-8?B?V0hBdi92alJyT0kvNzRwSXhSVDBlV1VlMDRGWC9WaXlsVU1uWG5sV2pKV2pw?=
 =?utf-8?B?SUdZZTBJUThlL1NxRk1rOHFXR2l6eUVSTHVRRFJkK0NIbkd2WnR6elFWdFlE?=
 =?utf-8?B?djVCb2ZPUVM3UWFjSzY5MVcwaHBIMHI0amxjZ0E4eFhKUE5SSEVKa3Q2L2RO?=
 =?utf-8?B?RXYwYzRYOXU3OE52ZEdQZFRFRmNoSk11WXpHNWJpVFNBODFBdUJsT2NkQzJ4?=
 =?utf-8?B?Y0dxMXIxdzJEc1Y2WFg3VkVpNXlpOHhyZGQ0VXBPNnhYeTdYMGR4Y1ZNbXox?=
 =?utf-8?B?TkJqQlh1MUZWWWZCZ3dKUkZIdFZOeUVMU3BBL21GaWVsNGRvZlJDRkVpS3pK?=
 =?utf-8?B?b0VFR0pET1cyRjlEanIvekFvWmhXSnJUVWFHdy80R001OUk0ZlBRM0xaQWw5?=
 =?utf-8?B?bkYwa1VKMWl1OWNRUGdyWHEySFZBci90akJ0TnMzQXc4ZnVtT0VhT0JNdmtP?=
 =?utf-8?B?MTBWVXJEM21FajArNlBORG1tUHhPL1c1NWN0RmF6bXNEU2pGU0E4K1JGSW9L?=
 =?utf-8?B?bFY2cjQraEt0NXMxU29TSWhDcVZRWVFxZlNQWFZQNlFGUVZ4UWl1K3R1OEoz?=
 =?utf-8?B?bDd6SzVYZVZRMVgvaThtOE1YZEEvQjdGTUprOGdqTVo0aEJKak1ZZk11Ny8z?=
 =?utf-8?B?bmkvN3lxaERTWVAxNDFyZ2FGVndDbUZhbkppSDl0TVlTSFRyUEJYVXhvdzl6?=
 =?utf-8?B?ZEg0TElWdTVwMFU0clE0RDJSTGFhTDc2Y1AraEtvVWtkb3M3N0xrMnQ3MnNy?=
 =?utf-8?B?aUVIRE5ibkhBUm5CbmRHTXNXeDVncnRaOUh1SHpTUmEzYmlaZWNqSTh4MU1B?=
 =?utf-8?B?aW4ydFFjSWFnZnZoUWhESUkyZ2ZLSnkvQktwWHUwMllzZXFsZ1FGbVA3MmNB?=
 =?utf-8?B?ZDFrdmJmUThkY1c0ckJhREs5V3VVazlnbWplbnZpNkpFRlhVUFNOMG56dnZs?=
 =?utf-8?Q?2OWkvOQ1ix37IYQFXBOx2tIi3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00e79cb-b8ab-431f-e857-08dbf4bededa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 11:48:02.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLh4Ce7MDSeFiAPb2jgaz/FomsXAiC5As1H0KjBNI8S4jp9EC8vledSAx/bqzqNRK9isLJXiEOfiR2TvX4/M8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7662

On 01.12.2023 16:45, Stewart Hildebrand wrote:
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>      return 0;
>  }
>  
> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> -                               unsigned int cap)
> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> +                                   const unsigned int *cap, unsigned int n,

Imo this would better be written as cap[] (or even caps[]).

> @@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            unsigned int next, ttl = 48;
> +            const unsigned int supported_caps[] = {
> +                PCI_CAP_ID_MSI,
> +                PCI_CAP_ID_MSIX,
> +            };

static?

With the two adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

