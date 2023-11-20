Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA57F185B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637092.992812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56xf-00032C-5R; Mon, 20 Nov 2023 16:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637092.992812; Mon, 20 Nov 2023 16:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56xf-0002ze-1n; Mon, 20 Nov 2023 16:17:23 +0000
Received: by outflank-mailman (input) for mailman id 637092;
 Mon, 20 Nov 2023 16:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r56xd-0002yB-FR
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:17:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ff1932-87c0-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:17:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8527.eurprd04.prod.outlook.com (2603:10a6:102:20f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:17:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:17:16 +0000
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
X-Inumbo-ID: 46ff1932-87c0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIezWENnbbADmTHQuKtGmuJouzVRL1cpaDpmJcCR13D9tVxlDJ+ZoByvoYEPGzSe+vLkEvm1Y6dlo14dvZ+gTodg3d9o348I2uU0V+F9nMqgngkT5JB5vY9cOGQbZyr6S5pRGLDw14622v506YerKKwENqTDdDgVRhezN67aQVsBqW2pIdD429dwAkPQ1w29yduBjkeAMPOZcE1jNsWZPf1R/7PYyCYqkSG3M70nr6NKyKQZnbf+02e8tg5u6C/OWQTBbs0VObSa7pLMuvDd9W1bjMj5WXZOTJvkJLBrngkZAcJ/y+i+1cvr4F6RqKNLEIOVgRR/ml/Vtor1fcMZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hSFL6wgrPSi4idiKRBHFFLUS3Rg/DmRoAbZINz1eEY=;
 b=ZlyY3NeaXWCdfqgU1QsqR1AYKjvWb9r/p5w9b/OZZ2nlRWdIp13PK7PhoJEcXy0pfm7S3CrgDUeCp/zXFJqUUeaM4zRVfyGS/t3Gvx0vmpa/t9U2HT6N5mseSK3MEgwb80EkOJYbdmfAO1Cn6T+KGxDt5/l8y4vmWgpUjdYKa7DRy+JkHNQfXhQKmZv3nGoeXbS/zYGO/kOozshF7FEfol0M0vHtGjNsvzxoS3lwfAH0PmjhPWt27GmiLSX0cLEogUXvw71Bm+Z4TDOMq9mcfLtnqr0bmUAi0ye/7TNIGq764awVEK3TNaOF6n73F517RGL62OvBAigewgnvW4baKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hSFL6wgrPSi4idiKRBHFFLUS3Rg/DmRoAbZINz1eEY=;
 b=sxCOPJLI6qsra6xt+/hv9f3945j4+kLkWdyI/lZTCMc3+b3RILzsMKLeIpyPDcfvwSC8NIaB8ci+Jg+YTcIqWDkiOrHpHzjVcL6olNa//gVjjG/oN3S4xjQnL3CtAkOyponqeImQl9saDDQKM7tV3QtoH+gz40PFAUt9RAgNukY9wHxXd3MnjqUWUCU75qOiDwbST0BLnRiwcpl/Jw190AUNmHJfwhRu+xj7FNV5UNxMjfggMGTTbbgfVzV6ArAAKpC8dUt2fP6NoUHz1c8UH4sEINMRE4Kv4rFLimEEBLD46Z92xo57Edfe6aAhOQSI1VOJFGbg0MhsKty27CtiCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c52b9fe8-d894-4a58-9d4e-9935e8044e90@suse.com>
Date: Mon, 20 Nov 2023 17:17:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/treewide: Switch bool_t to bool
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120145623.167383-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: beec7b82-f894-4b88-442b-08dbe9e429ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OsT/AjzAotk+WIvoHh85dwc7SfX3JccAvr+B3kb2S0zluw2PEyrPBglg3pR4AHbc2fFMyeknS7pjwM9pq0cKUOCGNK+ffLCe4s/n1241QSdiivPAv/nvP4S+OWbI6hKfQCOyUavCVgnStd7Hcc1jCYMsqlMsK+dGXZU65aC5vHGWjB/DD1bJv8AtbSqhSmJOQugv5O9M3decxZCyQhlJqtkHFA+onYNW1W1MBjtAnVgJ9W4x04D9rmI7CGOPgRIQ4sBDQtEriV770yuPfwJsY38vjvO9rHam5pRzD0/97IFoGTDhqlvO2XJN3d4nNgxkVGxq0rAK91L8UgBf4mHBVUZYm9pqrKRMtADButZE2NRgixvpB/iW91GPeLH/tdqoBwkx+1QACRGkPOvDNBBxqiPWl9Y5F/5wNbQdJSayZB4rURdp1wOCE45dAapsj4uKTFtK4zfm3l2K4PxJc8X7M7J3W33LUxHIECoc/jN6K4HizF7JqJ0FRWnq9JG7NWXKN/UBSjyd1NAJNoAxQ7VG5SCp9BcxZJ8p3oe58rSzFlKO6hLeggHlT3jZkhocCAGNpQor666Wsx4zt2sQn6Py2yVNP14HxqWeGqpD+8I7D/9udyqMnwySdgMUgbl95Rfe1MlpCWa01qXoRokx77NP1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6916009)(316002)(66946007)(54906003)(66556008)(66476007)(26005)(36756003)(4326008)(8676002)(8936002)(38100700002)(41300700001)(31696002)(86362001)(2906002)(5660300002)(83380400001)(6486002)(478600001)(6512007)(31686004)(53546011)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZMWWdBY3hVQXZRNWpuVU8rWmFrblNQbmYyamxGNHJJMnB5cEF2dThJMjRk?=
 =?utf-8?B?WmJKaWRDc3I4WFJyZW9FTXR1STMyOXZoU0tjYU1KZVVYTFpvc25zRmJ6STkr?=
 =?utf-8?B?QUxKNUMzN0gzZk95SlZKamd0UnZyT3lKUFJRUUFDUkRWVTdzQi93RVVaazJx?=
 =?utf-8?B?dkw1TmRKK1R0NHpvUC9nNGtEdWdRNTQrdkgzUzY1b1IwcEUrcWtSMkFDcFJr?=
 =?utf-8?B?Y3NtYU8vZUxERWQyMG5ISHdKSnNJdFdKc2Q3NGNiQzUydXpWSWtaY0wxUyt3?=
 =?utf-8?B?Z3Y5Rm5KVmhSR0dyYjA4d0lBdnVGZWhBMmUyQm1oanAvV3JzNHFYT1Y1Skth?=
 =?utf-8?B?dnVoNG05UnVKam4zVkw4a01XRTV6NDc2RXJSL3FyRFdheWUwblpPNnNmaE51?=
 =?utf-8?B?M1dTeEVoVzlRLzdVNVY5S1ZRNFhUQTlnZDJIcHl0dXFMbmN4T0hVeG51TCtv?=
 =?utf-8?B?WG1DV1dtQXZnbjc0NlhwUVpQbTZrVmJQekxWZFpueTlnTnVCakNxelczY2Qy?=
 =?utf-8?B?ZDMxcUVVYTNWdUxJY0p6SFJBaW9vdTVjYVdOVDdrMll6a0FnTk1tUkFXdzJE?=
 =?utf-8?B?K09sclBWOVdxdkpPU2dneGg5UjJSNUtlellPKzZkTWlyRjVxSi9MMzdGMzIw?=
 =?utf-8?B?WWhTVkMxMW9DSGtxbHFtMjk1TU5ZTG0xZGdKMHozWUFrZWl5MEFlcEpSb2Fk?=
 =?utf-8?B?WmdneDIwZWFVNERZVytRT2lnc1hWVVdxWnZWTW85aE9URC9lLyt0dVBIOXR3?=
 =?utf-8?B?S0w3ZUx2b3V2YTlISEdKRlFnZWFVcXdLZmh2a3d2NC9Nd3dKZ0kyZGhhSXNZ?=
 =?utf-8?B?Uy81bmpkT3Y3Y0Z1c240SHRSb0pDN0pESEVwZDV6ekVYVmdkV1p3Q1UrRWNn?=
 =?utf-8?B?aG8wMmlxL0k2S0JReWpyVEM2SUhtMXZnK0ZkdVg3TmkreHM0alBkeGYyanY3?=
 =?utf-8?B?SzJvV0h0bmJMWGpldTBOeFhNTmxNM0NybUl1RGM0dnJVY1lOeFNVZlhkaGYx?=
 =?utf-8?B?OWpkRzhvN2UwWXZvL3pYOCtRckJsWlhwTUIzWmk1U1R2REwzL0ROKzcwc28r?=
 =?utf-8?B?UldWQlpXRW00L3I3MGJSMUxCNzZjVkxlcjFEeTlHWUZRRmtwNmtJZGpnbklm?=
 =?utf-8?B?ODMwTHdaclk4OGtXQURqQmVRUlMxZTFIMk9FdThOUm10QVdTaTEzaUdLbnJO?=
 =?utf-8?B?SGZlS0tQanhQV09CbFJTVDR6azRxc3dTVmZSdm9FLzZMWVZYUVhlN29GRDg4?=
 =?utf-8?B?NWU0QlkxQnBQMHBFT3pJT3NtY25ZNnJRTlkzdGdXcGVEcDlzaU9UUmZvWndl?=
 =?utf-8?B?Z05QS3RGazZkai80Tm8yZWV4T2xuTTd4cWZSNkx6WExnK245TXlZZmYxYnA4?=
 =?utf-8?B?T3c2UDRFWHowSXQxUG4wZmw4MDhWZjRjV0F6MUVnVmxFMnVUM3U2R2hnYVpw?=
 =?utf-8?B?RWRIVlZTOVM5aFJidSt1cDBBS0c0SEs2d1NzMG9OY0VSWVFQSHo1dnQxOHM0?=
 =?utf-8?B?TldodXVlbDRHY0xuUHc3ZEpRYUFnMmxxV1VmLzBKaXhSSVBScGVXTlVJTGo1?=
 =?utf-8?B?WFgzRjlkL3l2aCsrMnhwNlVLYitZVGJ3cnRhOWtuTlkxaEo2VnhlNkhLTzFj?=
 =?utf-8?B?UjdtTWFYTFQwY29jUTZva0xDZXpEb2NtcC85VEpNWjFYZHZTaWNhTW9TZlNt?=
 =?utf-8?B?ajdpU0tZSWJpUkx4Wk40N1Q2aXZHRXNnNmdCVkw1OE1aNnlIekp6YVo0WXhv?=
 =?utf-8?B?S0Z2WlNkSkt0VVBRc280ZXVkbTBaVG42a2ZDY1RpVDdGemk3UFd3NWFuR3c1?=
 =?utf-8?B?NHBtbGR0bFNPQmlybHRSM2V5aWN5NFZNcDcvKytjTFEyVVIrb1Q5WTdOc0xl?=
 =?utf-8?B?cFU1ZGkreWFxdmJLRmg0eEs1aE1FM2dTbS9PYXZ4YWNkMlBiOHc0d0VHWkd6?=
 =?utf-8?B?dXBJT3F5Vmg3eHhBQStOOTB1aUhXeXRlalpGUHd1dlRVSUgwUVdvZG1xRkZ4?=
 =?utf-8?B?SGVNdnVvUnZTYlYrY1VKTlJ5Mk5ocWp5VnJBNXc5eW5QQjd3TS81UTY4TlpJ?=
 =?utf-8?B?bGZLMVRWOVkxVENCTmFiU3gxaW9hVitpT2htZVJFNVQyeTc5LzM5RWVYWXpj?=
 =?utf-8?Q?yyO90PSbIOa3lLirAlFcqjKgt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beec7b82-f894-4b88-442b-08dbe9e429ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:17:16.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehR+6rxgpB1VUeP+eroYyHz7mxvIVRO8DEyZamwi64eaBrDji1txpAZPigUJnbQICRo4d36Qy4VeW3lvJFOtJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8527

On 20.11.2023 15:56, Andrew Cooper wrote:
> ... as part of cleaning up the types used.  Minor style cleanup on some
> altered lines.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

One small request and a nit, though:

> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -139,7 +139,7 @@ static __inline void apic_icr_write(u32 low, u32 dest)
>      }
>  }
>  
> -static __inline bool_t apic_isr_read(u8 vector)
> +static __inline bool apic_isr_read(u8 vector)

Would be nice to also switch to uint8_t at this occasion.

> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -54,7 +54,7 @@ typedef int (*hvm_io_write_t)(const struct hvm_io_handler *handler,
>                                uint64_t addr,
>                                uint32_t size,
>                                uint64_t data);
> -typedef bool_t (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
> +typedef bool (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
>                                    const ioreq_t *p);

Nit: Failed to re-indent the 2nd line.

Jan

