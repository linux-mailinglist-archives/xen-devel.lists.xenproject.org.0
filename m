Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7827EE0C9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634194.989512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bei-0005nh-6h; Thu, 16 Nov 2023 12:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634194.989512; Thu, 16 Nov 2023 12:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bei-0005lG-43; Thu, 16 Nov 2023 12:39:36 +0000
Received: by outflank-mailman (input) for mailman id 634194;
 Thu, 16 Nov 2023 12:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3beh-0005jk-4A
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:39:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3123267a-847d-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:39:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 12:39:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 12:39:30 +0000
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
X-Inumbo-ID: 3123267a-847d-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nagVg8ut7ZAZGzeMSPaOZpp+49KWOFW7+YT9I18FU9LVaaALsEUKeENsuLdI+8923ufMdOJL4yT57e2KNQkOgc6LrOtTG97UftUk5dOkHaBtVnCEIZCHu4IwIIQwc4oVjJt94xsMjQQFZ9YuHSdyW0xI+Ds8CCaCBSGWzXC/AeytDT85SvA5UPp+h0qEWGfQDowgD+fFYsobrbtHD9kKjvekOvOwvwevGZNsqJ6njPPfZxZF33nRlhflXSzgnPgNawytqiqXasNRD4VHhEX2Df8x8VuPavnhKyatcm17HolfcqTK6yDEsuIxhYmOYB0gbtgS7n1cepJGdk+BZI25HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHIfcmj6E1PwL20jkxNFnHfm4Et4OmYycWyT/yJu8X0=;
 b=MEBlwXQNAC4epchvCDvBasvsqZXbm3w2sosEc0JfXQCTAu3WYH+bbeofcOKlmlcEs2fxWM9DxIVwUtnJxv6aj2EB1hYp3iV9uz6/ZYFjeFsjgJ9WT92iFwW4OtfirmIZMPRXzzu968/TaJ0Ka+ZWLfvAEenh1Gm7bsjTPLwvrWD8FGWaSywB9VIQjwSv4+XOtd+4g9BHUiOJ3HX8ZuO576giVBMkimSpEjB2bqXqFT2dQFbJp6NyimiPu+F2e7Sxh7koaMk7Dt6nNNwYsGBaX306HOU3c61956Wxn+C7q9rTQKUiZV2AjOwRp+O9bxEh6X/tyZLjoVVBWjjDdfZMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHIfcmj6E1PwL20jkxNFnHfm4Et4OmYycWyT/yJu8X0=;
 b=5V/vOpDy1h3qwHpvLZchHpLPnStHeyAGBCVCo5PPKr8hJQLbM3i4j9tWGxJ9PH3PTM8ZKfaE0V8v/ETpVZBDQsK0B7XmUSXiWM/Iib9ICcoX1MbFh9imY6WlYn7F8MBLuX8ZgsbutGb8DagrIHwmZ1RiaZ0hxMz6fWXQ3CnCPPfq5JJxQRO3GT+vWX7LKkyopCTXmKZOCvbHpAjnp4q4bIwvgkyykkrSB5+j2bteLkR5Z0y7tMp55iqdpx7MqScWQihLTu+YDj9REGkKMshAKi/JhdGMHIp631xuEAWhqqsak6tPtosQL7DEulau2dghCR1qREkIMsa1cyCp815b6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
Date: Thu, 16 Nov 2023 13:39:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231116115841.71847-1-roger.pau@citrix.com>
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
In-Reply-To: <20231116115841.71847-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeb921e-afde-48f1-fada-08dbe6a113e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K2k5rNeP5L8jY2yz7XJUh/04IxEMGJRpOV6nxfqzzlkGczNfbFNa+fyHyXGWKZPSi2USYVIFFQ7oTrCLrWYjrEwSVpKuqwZk4zV62xMtTa/m0VujRa1IN71Qd2x/o0eTckrJlTi4tK2chumq8FedWFG/MkO8ElGE+6L1nHn1PA3S6yzFE2Y7KTo7FUPXgkvs3KmxjD+0jNezUQkq6HXeSyjHdHBejixe3usivP8FTZ4tEyZ92QqAebbrcI/JLhxi7cYhFtBgBgVgG+3xbkdfVKDkMbhbFJHgxKWvEpFwTtoDeBFdg4ak4fXPwygRLyvZ6QS8+IAUm3obpyI4O4xEGjQ5i980mBj2INZmWtaQ1UYUIQ22Xy2HB/zlYB1AcezJp5+qCCrqsn8W1ER0wQYJhobs3nuXu7kr9ww9I/RyebcpKjoBICTlmEWLl5YCfQol4lo+yS0ovWCKFpxcdt27xXkF9UC6DivR4HfNcdOCphIX3IVOFBr7Eolf6ucT28jHplvt2Y4GuMyMB7KHbl1U4EaHRpFxuL6RLJbDW7T/cfU0g4bUQ7omiD1ZXIMmzowiG7yDbGdsOV+yCoyTcyscJImLMye9A9MkgOTH9cY3bfthMGpFYsmReD/Eddbu0dbQM41+K3bFmyz6JuxQZDpE+SPW+HCR5fzyhL5BjwIBdsbc1YqW15vvzgfnXUoXO6cd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(41300700001)(8676002)(8936002)(4326008)(31686004)(36756003)(38100700002)(31696002)(2616005)(53546011)(6506007)(86362001)(2906002)(6486002)(478600001)(6512007)(66946007)(7416002)(316002)(6916009)(66556008)(66476007)(54906003)(6666004)(5660300002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFpBRWNuNHl4U1I1UG5EeWV6SkQ2S1JGbStaTWswTEg0UHVuZmpQZ0Vob2Ro?=
 =?utf-8?B?bXdRRWFKWFlGcXI0aWZwTHNqV2RCMTZsY0pXRXdyNjhzSkNka01Fb1NSVHBP?=
 =?utf-8?B?b2huaW1sTUoyZy92QjlrR1lvZ2dOR2txQ1N3QUNxcWhlMUxad0d3a0dwRVc0?=
 =?utf-8?B?VG1qVjB4bTVaR2QrVy9xb2pYbjBUeW4wRWE5eW5pTjhRMXREVzdCN1BaazlQ?=
 =?utf-8?B?TVJJa2x3amNxQjZ5RnBrV0o4VU9DOU1aUUwwNFA5Uk10UGg2cWpiYWVIbnpz?=
 =?utf-8?B?YTRTSGVHb1hwSnk3QVlJNUNqZzhZTmxIRm1Fa3g1Ylg5dmw5ZVNUWVdydU9h?=
 =?utf-8?B?QkVXRjA5VFNZc244Sm95TXJGeExqOTBoTXpPTEU2WXVFemJsejM5OXdxS0xn?=
 =?utf-8?B?dFEyTEx1OFhBS2oyclpKREs4SlQ4WlBlanlqSG4rWEhqZUJNLy9wTmZROG0y?=
 =?utf-8?B?NE5DK3pGUVhNSEh2UWNIRU9BYTdUcWE3bE1jdElHL29FNktpSEpLdkttR1Ft?=
 =?utf-8?B?NnBxb0lDOXNGOXl2R0R2cWRPc05Ca0FJYnNBcU1NYklqS2phNWpRdXdlV0Jr?=
 =?utf-8?B?NWF6eU5mcnRrdTcwWXJxUGlHSFB0YlFNaCs1bGhtWi9FVG5DUnJaY2hmWUo1?=
 =?utf-8?B?ei95VnBRT1Y4QzNXK1NLNk9qdXRISHB6TlI5bUV1Y2x1SmlRaDE4bG9CWnh4?=
 =?utf-8?B?cFRrcStVTTRJN2pqSitTbXdlTE9ERHVQQUhFTk1nUTFHL2hDOFk4NUtqWW9N?=
 =?utf-8?B?a2pNY1IzMjdweHVuc1dtRGlIRDhHaFNaa2NPY0hwMUlSYnVWMVlOUW1mYmdI?=
 =?utf-8?B?UVJzczY0M2ptZE9VMUMrLzM5eEswZWZUUzdwc2ZVUEkwR09NRmYzSnZheW9N?=
 =?utf-8?B?eFM4Z081WndRWkg0LzJ0d0NIRUNjNllERy90eEozQVMvb1lkTWFTMlJwa0c0?=
 =?utf-8?B?QmNrbnh3OUdmSGZsU2Z5SXlaQTd4NENqbHZDSGJodWhtT1FobWNVVldaNUlp?=
 =?utf-8?B?d0FSTlArb05VUitFR2g2cTFlMnZwcVdLRUN4R2VZcEsrMkhuekhFTTM1cTlK?=
 =?utf-8?B?clBkUU9BcUlpNnMzM29iK1lEMTR2L0tjQ1pKUFZjK1lCbHJlQjhCNjk1blNn?=
 =?utf-8?B?SmVwTzJBa1Jhd29EOExEbUg3YWEyVFVxZEttMzdoMThHeUQweXN1bHdvR3pw?=
 =?utf-8?B?dHRPMkVnbUUxcFJpSE84ZEYzY3l5RVhhVW1MSkZXU3JGQWQ4bE4xaUU4aklo?=
 =?utf-8?B?anlTOU9PREl2QTJmVCtrUkJQVkFPTjNVdVFxczZLbmhDR3U4RC9vVHM5bHlO?=
 =?utf-8?B?alJWTXhocTMwcGdjZnExMDZWZE9oMDZ6eitwelNJWmZLUWpNOGgxRXpZYm9y?=
 =?utf-8?B?NytzUzJESWFVV0ZVTWVMeTFZUExKRWVQMXhiQzVJd2Zyb01TRVdQL29hYzBT?=
 =?utf-8?B?OHZQN1JrbmtMRklzblVybVc3cGVYQUs1YzRXRXplUitBZ09XSmZjRXFsU0NW?=
 =?utf-8?B?VjdJWkF2dUQ4QVhEN1RzMDVpbUJINUpJVjlKUjlqbnp3YjZCQ1B5Nm1Ka3Yz?=
 =?utf-8?B?eUtpZjdiMU1ZK05TSWtiVWRueXBOYkxLcHRxWldjd09tR0ZvR1FBcFkrblly?=
 =?utf-8?B?WE1uTjlzQkpTSnJWQzRxSnFRUVZ4L3IvdnNMRjVmby91SitQbDM3Ymc5RUh2?=
 =?utf-8?B?SC9tL29lcm80S3UwajB6ZzFGOVIvY2JOcFpYOXV5NVplcnltZzZwQ1N5cktE?=
 =?utf-8?B?dmtIMWZ4amp5a0dyM0V5dXAwVGd5SXF1OU1YWjA1WkpnblpFODY5bFFKRWpJ?=
 =?utf-8?B?b0ZocWt3cittWExmeXlhWGsxVEJIMmh5Z3g0NGREVjNMNExUQXNlM1Q3Wmdk?=
 =?utf-8?B?d3hEeUc4TE5BU2tnbzA3cGg3NG5ZcTdmOHlnbFdqR05JYWtqdjZsejBUbm1R?=
 =?utf-8?B?SVlLUlA5T3FoY1p6anlTWnZ4aGc3ZnNlWGhYU3hNMkZoM3ZRZVVTQzV5Z2FC?=
 =?utf-8?B?UzJGTmphdFBtK0VvMXJPZmZQMTY2Q1UxVS9rTFQrK2RJTklidk10UHdObjRB?=
 =?utf-8?B?UlpzZUtoQk8vS0VjWjFsTHVWbzFKbTI4NVFMQS9UVEM3UllXT2lYR2o1eVBR?=
 =?utf-8?Q?iKuvlHTXAktaLUKLuGacEfdbO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb921e-afde-48f1-fada-08dbe6a113e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:39:30.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RRK9JugagI169yquPE+9kYscSkG7D5oW8X0E3Ow5GfADE8IrubjguAlQJj2mSgKutNSY6TxnpDrC7omlMwn3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

On 16.11.2023 12:58, Roger Pau Monne wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -991,10 +991,7 @@ struct livepatch_func {
>      uint32_t new_size;
>      uint32_t old_size;
>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> -    uint8_t applied;
> -    uint8_t patch_offset;
> -    uint8_t _pad[6];
> +    uint8_t _pad[39];

Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...

> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -13,6 +13,9 @@ struct xen_sysctl_livepatch_op;
>  
>  #include <xen/elfstructs.h>
>  #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
> +
> +#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
> +
>  #ifdef CONFIG_LIVEPATCH
>  
>  /*
> @@ -51,6 +54,12 @@ struct livepatch_symbol {
>      bool_t new_symbol;
>  };
>  
> +struct livepatch_fstate {
> +    unsigned int patch_offset;
> +    enum livepatch_func_state applied;
> +    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];

... this use a separate, new (and internal only) constant? Thus also
elimiating the need to include public/sysctl.h above?

Jan

