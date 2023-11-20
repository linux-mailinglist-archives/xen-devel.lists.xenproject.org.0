Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30A7F106C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636545.992128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51Xs-0000y2-4r; Mon, 20 Nov 2023 10:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636545.992128; Mon, 20 Nov 2023 10:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51Xs-0000uq-1y; Mon, 20 Nov 2023 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 636545;
 Mon, 20 Nov 2023 10:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r51Xp-0000ud-Vm
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:30:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce37fd69-878f-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 11:30:21 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9912.eurprd04.prod.outlook.com (2603:10a6:102:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 10:30:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 10:30:16 +0000
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
X-Inumbo-ID: ce37fd69-878f-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C96/YKUhh72wYVEVmUGQwPebTnoJfV7ETopcHLLCSDqAFYfSDKtoKy4sHj+WRA+Od7cVtyM61h4R7FDFoEX1u3NYDCH++Dkt9UHhLnV1X5+SDNuoFzv1EViCGS9JfFuhNQ4NreOU4tp1+m6D1H63IN/YdipeRJB0B5wzLkt9WiR1jHHUQMbwUUdaTsbyCA36UnRgUFHQNj828EZUSm4Voa7yArs57wSYKXBJFiF5zchqCxZ6Noc/SU4bRtZ5fAmNE8dnBMn8D45bMpxKteYDpGmk33fXChMAwcZQqzB33gARCtIC1wBpxm5ohz6S5RPc1Y3PD9VDkNzxkgk1HDXDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g7qqN6ucZJINMdBhE4OI2oJFfnaEz3HJMBXdhYnjHA=;
 b=VDN4v3ej33eq3woS0AWloXmZRQZQ1J+9041ynVhtPP3Le5EhsScxc3t7qmMN7x5vrKmwph3yPal9xW4OLh+NOgwwruGwDVQCxS7cUQxP1KP5U2y0xMmj+dhAGntcWYm9bFJjw38wT8Ytci9lr+tU2fkOe7VR/E1K0/ghqllS+gzuZMQDO1QDAZjgt15OzhdeeXVWSd744i1cmHGkYdCjONrGWfhonpQUOKquJ++VSRLrOZWhsHTHQU2AYgEJxoa2nxpa084qCPJwbx2TFzeRKXU2N2CsNbq6opUHbJsx3+5b5a+skuT1ZociQ2XOhaKK5kj4NDJ3B/lrx/+A67MZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4g7qqN6ucZJINMdBhE4OI2oJFfnaEz3HJMBXdhYnjHA=;
 b=cnv7FIXUF23HFBhdrQDIpzf/NkA++ZA19aV4uVnOf1cRKFPf1QMoNAlex7IMK9y4lBF+yM6z5TOJGQ3jnM4j52h/FtrIm/gPk3DmoV548xCo4hEGp2nxx3QNw4Z6kN0RvZoR+5bm7ZC1LgGAvULX7fLDyytHdQaRSVf5dP6ZkwLfyZf1lCEowN+/S9F5MmXQE4ub/sACXPgEhHWQu/X2HaFC30+lqw57PRCRfRoDVRwcwfmDotwmDnadtV9RkL1jPO3x3Bus/pUzWQRyBXFy3+MwsbcjhqI8Dn19o6HTx68jCE4BOaqi8ht3XdMQ3wPBTeO9rMusDOVYYL3VNIOjvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <412f695a-d1f8-4ae3-920e-023428c63059@suse.com>
Date: Mon, 20 Nov 2023 11:30:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/iommu: use a rangeset for hwdom setup
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-4-roger.pau@citrix.com>
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
In-Reply-To: <20231117094749.81091-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 966b7322-89c4-452f-6137-08dbe9b3afb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3witYYOENsTVTQsXbCa86r43YTNq0+dcqMx95lSDodWmmCuInnIq8rL8aK5hhx5+A/y7nBas7SAIZMpGCCP+TGiffKz0DZDCw4bt1uO5Dd+0lp81FLoj22/IdbhPBNfTTzoqug8f23zHEVRyro6KSe+ogA/QOTeIwMXENBpfREWWkZhAjU+vWUpksYV6+LTXHRb4zylMp3fLJUZvG2RHQxLD+CRbbqluDO2nqGZdS5Bc/Ix5DEepzgtPdPm80POIYvnkHukNVXJi9u3WSkTHB9+IGnXKtxoEgUquJEj5W+mf8AEtvlZe7Ere/cSSktCve1BC5GEfCaRnf77Z3Auz7Wt1MtHHgEtY0RlduOF0vtL1SrFcmPSpXYD9J9AMGLlb05RH4OMRD7Ew69BdTC2jgJYQ/pwDqSUj0nTiRN+1hR/Rar+j3HMeFfubRcHnz/JbRiA2QDxo2HXA9lICRKgnWj5c7FmOIsQIVRIr/7ieA+uD3iHCmkYnc0/nNc5SKmIrs2+7CjLjYKGje8XKxBDruRQoE5w4y2JjcL9uF9TW90BmYokH6geIlLSaPlxQS69sFT4IlXN4u1/mGeWAdzn5hZEI4b5h4vgqX0XMySTnJzy7TZOWBX5KtjcYYWRol1HtMqiUjuHMuzQiHyegDUzw6hEWR5myb1a9fUJqD6WHN20e5jz7uVec1/E2HU97bYBq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(2906002)(26005)(2616005)(4326008)(8676002)(8936002)(31696002)(41300700001)(86362001)(83380400001)(36756003)(66946007)(53546011)(66556008)(66476007)(54906003)(6506007)(6916009)(316002)(478600001)(6486002)(6512007)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWlkQW1ZM0ZiSjM1SnFHYWc5Y3kxeDN6NGZ4N1dia09LVkFWQW1KYmliZ3lD?=
 =?utf-8?B?Mk5tVUhDaUh4MUM5M3NrTzk2R2ZETFhBU1JuTTlKM0RtK2U3ZzQ2MkJIZFFL?=
 =?utf-8?B?aWZKZzZTeVdUWEJiaEZvR0tkSEdxL3dwWDZOZmhhRzBlWDF4d21DOWprT2RC?=
 =?utf-8?B?bEJqb21WMnNXNG9GaHluendFcGN1OUs2em1ITkJNZlg2Mm5kaGt3TkJZejQv?=
 =?utf-8?B?QklDc3ZsVzFZZWJzdTN0S2RKZVVKVzlzSWd1dG0wMnl3eHpGQUVtZXprbFFG?=
 =?utf-8?B?YU94NWIrcCtWc1loMGdFNXNxVjMwNXF0R1B1ZXRSdDdlbkk0bk9MZDJZeTVU?=
 =?utf-8?B?Ym0wS2U5RWQ3MnRLdG0xbjZLb1BmUGZ6UzRGWTBQYks2RDBwYUJlRmFLdXkw?=
 =?utf-8?B?Wnd1VUR1aUtLTXp2blR1Ym9mVFd6NXgxbjhFUFIxaE9ZaU9WK3RQV2tzcjZS?=
 =?utf-8?B?NHYrTnY0SWs1NXQ5QzJsTVUvTVVZR3M3Q3lJUlMzWTdBQ2s5endyTTVGT2lt?=
 =?utf-8?B?SW10NkhCa1R2c090dVl0eFRUdGR3TkRGN1p3SlNyUHZNK3FkeGJ0SXdOSmZs?=
 =?utf-8?B?NTFTRVozK1B2ODk4T0VnYTJ4L09meVFadGs3ejZId21Hc2J3T3VQdTZRSzRz?=
 =?utf-8?B?OFZRNm1yakFuSHZBeVZLWG9YcVhBOWUzOXFPb0dURUk3NVNnaDlCRVRWaVVs?=
 =?utf-8?B?K1BqYldCWjI3ZjlmY3ZFN1JEUjRCZWlVVlhTSFV3YjhDTDJXcnV6amR0dVpS?=
 =?utf-8?B?LytzR3l2UHRqbGZ2SDZqU3p2MXhFQUszZ0ZEQWprSGtUN1NnUHgyM3FOWkJP?=
 =?utf-8?B?cCtIc095Z0l5RXk0dXlYcE5IaVB3N0grbEIwOXM2ZEtKUzhuRGVKQ2lnVUp4?=
 =?utf-8?B?LzFIMlR0Vy9GdWdwSWluanlOQWNCMS9KdkRtUWJlUE5BRis2aFpXQkV3K3dN?=
 =?utf-8?B?bTh3bWZFZU9qczArRERKM2pBbkMzNUQrTC80MXBkY2pieU9Xcmw5UWhpR2JK?=
 =?utf-8?B?YUlsZU5EdnBKQUFMWjlNZlhLNnhoV2Y3bzlreFNueTh2UWRWaC9kenR0R0JK?=
 =?utf-8?B?UVJxc2JGL215WG9TR2VkRXRhN2ZkU2F5ZHdhNitNcmkvSHg2SDI4TUpNQjFm?=
 =?utf-8?B?YmhvR2czT2IzZllVNDFoRzlQVDBrRkUvYkp6enk2RUo0bjZLV0Z3VHBkaXBL?=
 =?utf-8?B?MFN5aS9aT0V2K3ZZc2dUL1kyMERET0gycldqWi9YWFErTnNhU0h1b2MzNll2?=
 =?utf-8?B?dUV5QWM1Mm5rcjRuMjZCMFRnekxzL1lHRndpbEhUSkdHRnkzbGpGYlNXYkpO?=
 =?utf-8?B?dXRFRngwc0F5U3VSSTRYRCs3TkJuWGY0d0lXaENFNUYyTm1PcEp1clpCMHgr?=
 =?utf-8?B?YTVTQ0lWNG9GYzNRS3p4OGlYMjd2YVF2L0F3NEgrblZhNU16cTU3SnZYS29a?=
 =?utf-8?B?ajhpNG9MVE9hY0tBM0xmVXJYQjAyb3NkUU1ZZ1o2TDB5cEZITlFpS2tlREZv?=
 =?utf-8?B?eVNiZkF0eUg3Q1dERGNNOGQxRThwbmN5NFc5QlhaT2w4dGJMbldzTGMrcGd0?=
 =?utf-8?B?VThKbnZWZjJDeUhWOTJSKys4QlhNb2s1YW14TlZUMythWTdlWGFCTmRoQ1pQ?=
 =?utf-8?B?SVdsaEdZM21MM1l5akg0b0Q0RGU0b2MzMzA0SUFreDR3bjZoVUhLaVRDS3Zo?=
 =?utf-8?B?QWtCRC9HU3ZYMkRsWDUzekJZNGZNeWVoSGNZRGQySGJodzVJU2lya3JVUVdt?=
 =?utf-8?B?bDg5WWREUnJBT0dFQUh2R2JKNE5ia3lvbTFiWE15WG9taDdxQUJLc092bHRW?=
 =?utf-8?B?c1cvK0Vqek0yOVliS1B3cjMzMHdIaW1TQ1F5NkRvc2xGSElRZ01oOFZmT1p0?=
 =?utf-8?B?Y3R0NEltZVlKRFl0aDJqZ2pVdHg1KzdSbUEvRGlNVkplT21mRmE0SGcvNWpt?=
 =?utf-8?B?RzRkbVl1c1JpdjdQY3hyVHRjTE9FVldDcGRlbmM4UklXVUltM0JNSjFVUER6?=
 =?utf-8?B?QXpiMUwwaVRtQnV2MFFLbE93dHduSG1ZUE9qcTVBU3JoN1Y4RXFhbDh5ZENk?=
 =?utf-8?B?MXVBWWRLVHc5TUZtVTI1dGVhemlRK0cvYXJBbUJmSkJDUWNCelhmS29KOEtk?=
 =?utf-8?Q?QigvcU+zZBXS4U+rHnZKfBtP+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966b7322-89c4-452f-6137-08dbe9b3afb1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 10:30:16.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtmWRxdZKirxponC/dtd2r8XbYE6bbdHt2tFtsF0POU5AXekCPrKIHWqwR42o6gdevRTJTExAaO9UjrKID4VRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9912

On 17.11.2023 10:47, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -364,9 +364,20 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
>      return NULL;
>  }
>  
> -bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> +int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)

While there, also add __hwdom_init?

> @@ -447,62 +451,135 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( iommu_hwdom_passthrough )
>          return;
>  
> -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> +    map = rangeset_new(NULL, NULL, 0);
> +    if ( !map )
> +        panic("IOMMU initialization failed unable to allocate rangeset\n");

This reads a little odd, and could probably do with shortening anyway
(e.g. "IOMMU init: unable to allocate rangeset\n").

> +    if ( iommu_hwdom_inclusive )
> +    {
> +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
> +        rc = rangeset_add_range(map, 0, max_pfn);
> +        if ( rc )
> +            panic("IOMMU inclusive mappings can't be added: %d\n",
> +                  rc);
> +    }
>  
> -    for ( i = 0, start = 0, count = 0; i < top; )
> +    for ( i = 0; i < e820.nr_map; i++ )
>      {
> -        unsigned long pfn = pdx_to_pfn(i);
> -        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> +        struct e820entry entry = e820.map[i];
>  
> -        if ( !perms )
> -            /* nothing */;
> -        else if ( paging_mode_translate(d) )
> +        switch ( entry.type )
>          {
> -            int rc;
> +        case E820_UNUSABLE:
> +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
> +                continue;

It's > here, but ...

> -            rc = p2m_add_identity_entry(d, pfn,
> -                                        perms & IOMMUF_writable ? p2m_access_rw
> -                                                                : p2m_access_r,
> -                                        0);
> +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
> +                                       PFN_DOWN(entry.addr + entry.size - 1));
>              if ( rc )
> -                printk(XENLOG_WARNING
> -                       "%pd: identity mapping of %lx failed: %d\n",
> -                       d, pfn, rc);
> +                panic("IOMMU failed to remove unusable memory: %d\n",
> +                      rc);
> +            continue;
> +
> +        case E820_RESERVED:
> +            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> +                continue;
> +            break;
> +
> +        case E820_RAM:
> +            if ( iommu_hwdom_strict )
> +                continue;
> +            break;
> +
> +        default:
> +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) >= max_pfn )
> +                continue;

... >= here?

> +            entry.size = pfn_to_paddr(max_pfn) - 1 - entry.addr;

Why the subtraction of 1 when you're calculating size? Don't you actually
need to add 1 to max_pfn before converting to paddr?

While overall things look plausible elsewhere, I'm hoping that - as asked
for by Andrew - it'll be possible to split this some, to make it a little
more reasonable to actually look at the changes done.

Jan

