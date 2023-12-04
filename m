Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA50802DAA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646627.1009075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4km-0007UC-VY; Mon, 04 Dec 2023 08:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646627.1009075; Mon, 04 Dec 2023 08:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4km-0007Ro-Sh; Mon, 04 Dec 2023 08:56:36 +0000
Received: by outflank-mailman (input) for mailman id 646627;
 Mon, 04 Dec 2023 08:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4kl-0007Ri-CP
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:56:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05bd1cf5-9283-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:56:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9584.eurprd04.prod.outlook.com (2603:10a6:20b:473::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:56:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:56:03 +0000
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
X-Inumbo-ID: 05bd1cf5-9283-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lctKCDIxoT41wkrGRrIy7NAveOf1oeoSJc9adsow8QSEQXAdBGzdoOFSKv5DOWJihC/W8n/g5ioGVYp1+lEGdVQvCKCSmSe+TjRhndlbztVGTm32iJRUnVe2FgOjWPivOXdsUOSvrjw/VeIifBOgRopKI/hIxUHx7xNafZxA0d362R1v/jdFywab4Uweoxr7OgO1NIqau9yUAHCISatGuYu4TlH3NHhXx0Y7fZnuGuM262ASKlF4RzMrFMn59kEhfTPP3EKv9Xbmp/K7joO+CWjX49JXVjlFnHpM3h993y/mKXq7OpsKx4w0D/xyX7tx0/bBiNrSLgRgE5HM41C9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFCK9BUZ9Q8mVjxDdIcNyxjW0Lu0WqcTs6EVxhdGCfg=;
 b=Z4NjbyqKXhhAlfU9lPq/Oo1FJK8FVUpgMnOC9ZIqh4deHyePdT9UQlMQF5vhOFx7txdv5TG1SPR0UR6Fi73axaSia6qoHlQumqoMqmQeBe483IcMPlA1ebja9j75uQnTgCnZXpcXqR50QMRGuCzv/UKM87uQuxOJYvwx9Cql6KfiXmjSqw9Z2R1ta8yj1+rxuYFiPe71T5D5oS9YHy5Cuyhf2PEOFANSXOT/na0IPBNg9Sy4Bkg5Uhs7bZ1bYEXvrBtWY26Sk5OZ5VKk3GXS9NNYPJYC598ZPC4+hwK5mYApElPpDXB5ci5kpoeEr73Y1KIpftaIwyB7Ivnvty9fJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFCK9BUZ9Q8mVjxDdIcNyxjW0Lu0WqcTs6EVxhdGCfg=;
 b=4Gr7LY/edQXl5FQND9avhsgmaRDrFNRyHBic3HGapWrluE7GvsUg5cNJAp7QAo87wh3GUjvmM00S/3ZJa+A7HHf4FCR8YOgmzBOxRSozjvxsFXqAtaNJuyKO716Bc3VuzKqMroG20Yzy/iLjwL00PgZhBizmHgVdufmETuQPTv14lYQlFr+CIbBc+NKgC9VG1MK72bO/sHcP8lxpLTurUIh3vlptO5kPJMXXeNno7OMsxxrIO68A2tPcfQahGCIAPRlcLEWh2qIPC0QIDh5V8AhxLMXrwI20tyEFXk0x+FCaSkGdLvf/Up7F2Uy20YaNcVlIClBlwpZ3u+kKtJjITQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcb2675a-6570-41f7-b386-93fdb4b513fe@suse.com>
Date: Mon, 4 Dec 2023 09:56:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 525c7c09
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <656b9ad4c0656_2c9b1b813232d@gitlab-sidekiq-catchall-v2-744664b889-4scj5.mail>
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
In-Reply-To: <656b9ad4c0656_2c9b1b813232d@gitlab-sidekiq-catchall-v2-744664b889-4scj5.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e7353f-6811-4e96-7993-08dbf4a6d877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qYIuEFGigxzhKebli9cjvVSi6ZDs1Bs3Rtm+ABmc95fCXDdu3kmdzwwXCrCio5o1c07Uo3i05MtyUva3uD6yXrYsiWNUH+f2nDHELK9Qq2gRcVPUvljNTuq1RnsOFAH6PkRrLbwISz6xF/Qa5RFJA5QUB3u4/zKmLg2zKX9NZDKlMoBx07abB0+FWlMtsdP0rN1Vy87igy2shuFJh855A4ZtRwxgzuOOccphWaey2kklrifPOrTezM1Cp6Cx67VrdFmb0C9KzHMiIxO/J5iVNB/+k/xGOn24AotsEryTnANXSuogK1AD5H24TPeCYL7shmvZBTgByQnBAPWoqzIJlbj4sci7MEKBEkHNtmRaQ0EjDpyP8lDRGvuhsnWwq/nChRb9JgDgC8u9n7k0SqEK2AtmGyYLKM9E34tqCRk6UAMQqimjWqSJ8j4v0/onvAiBYRnUsu3uF7XAPIMvVbdJj4YPtQewiZ0wR1NtzKEO0w9+B/OT8ThAkU7svt63eI48aA0KgixQwB+YUZaWbYJMgNhWbooKALTOrUbbVk5jyZi7VoADPvyqLN+JYiLsumxDJfibebjmGChu4p8XoArhhYsipak3TZdEJK2BI1QbQxeXXgfPUOFW2Rk41tY0TJ3QS0bdxjwa/nEYXl/ubELtAptyXtJ3jWP/X4yNhTDDEbg+a7ioXb19zm6Sg3jlmWyT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(5660300002)(31686004)(316002)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(83380400001)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6486002)(2906002)(966005)(6512007)(53546011)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1pHSDlQNDJFQW1hVmtTOWcreERISk5ydTVMeVYwUjczYkZaV01Bdkw4clc0?=
 =?utf-8?B?RGZTUUNsZGVmc0E4bmc5T3A5Rk1zMmovQ2JubG1iQUt1S3p0d3ZQdUk1ejN2?=
 =?utf-8?B?NFlER3lSYmNUYVFnY0dBeHhqbHlJekdqQ3ltRWU3ME05blJOR3FqaER0bE5M?=
 =?utf-8?B?TWxJMkNLWmVGVnFPL1RKcW5pdWswY3h5OEZjTllLeldOdWdYSnVhcEFSdnhZ?=
 =?utf-8?B?bE1GT0JrV2Jsdk1reC85NmZJODVpbTZLckRwQklQMUQ3WThmcmxDbG0zdFcr?=
 =?utf-8?B?QnRHZXdLeW02UFVOam9lMEt2OEJhRzF6cGtadmJJZXpGaWNjeWM5aXJlNDFP?=
 =?utf-8?B?N2ZHZFpsY0Fxa2lWWWhJa1pET1NqZ2VEcXI5WEN5ZnpKWTdEV2tpT3VseW1B?=
 =?utf-8?B?bThvdkZEck5RNVdjRjFnM1l3aG9jcFZQYXJSUE5iSmRtLzJUMCtuTjNuNGdy?=
 =?utf-8?B?K2FtRWxCbGNGQUluZ2xJR3l2bXMwUmQ0Q0p5MmZPbTVOY040bW01eGxlVCtN?=
 =?utf-8?B?VUhzTHFyYTh2ekNKcnFWR2tXQTJ0aUE2ZWJhQlFiZkMrVlVRNWZYdXQrUlUy?=
 =?utf-8?B?Ynh4U3NtYVI2QXp1NlRhOVIzZENxWmpGR3J0YmFjd2x3KzJ4QVYzcnJTbmhX?=
 =?utf-8?B?R3djZms1WVFoOHd1RUJycS9TRmhRckVIcGR2SzhBa09SVFkrOWEyS0dNaEJO?=
 =?utf-8?B?UGFWU2lWUnZObUhBQ2tHWGhuNCtmbWNOR0szT0hOQnpiWkZ2Zm9VRHBiZW16?=
 =?utf-8?B?WE9tVG9iWnVLeWNyeXV2WEpNUnMxOUswT3NITC90VW1aVTNRRTFMT0NNSGFu?=
 =?utf-8?B?aHQxVlpRWmN1WStNZGlvcC9zN0dFNEl6WExrQlVXTERXZ1p6VUtoSnF4aEZ0?=
 =?utf-8?B?YW50YTAvaTJSQVZZYXdkeFlZQ29qRERjcnlzL3RNRHNMNnBBUytoOHZxejJN?=
 =?utf-8?B?VVZNVUUrN0VsMVZuM2NoZTJSSE5RRU9kanZ1R0ZXWjgwRHR4cG0wRUY4T2g5?=
 =?utf-8?B?YTZSeWhuN3I1ZUg4aVhJWmVPRk5qTnBNK2o5OXRpN0dsZll2OEY1Y0xReFF3?=
 =?utf-8?B?VFFSY1RpZkdVdlN6ZE8vTXJHRnJmV1loNW84N1h2MWUxMXBsRW1JR25BQ1l3?=
 =?utf-8?B?ZXBLazdpM2N2SFJFUGx3NGVsRUt2WU40QklESWNZUkUvVWNjQUlheDlwYTBB?=
 =?utf-8?B?bXBhZUhOazlIQWlzc3JSNzRCRElldncwN3ZBQVNKZzVORGZRcG9yaXpaaEtp?=
 =?utf-8?B?Qm94N1VJelByQUx4cjVOeE40UWlTTnBLZTUxeVNHZktsU1JUR2pSYUwxS3ZF?=
 =?utf-8?B?c0VocllRWFYrUHlmTDEwTll2TzNUR3VWeTdDME0vZDR3WTZHNi90TlBBOW1k?=
 =?utf-8?B?OFZLYTAyUlJLRFdxVkNGOVZFeDJRdHo1VnQvT3BGOXp4VU41TllObHd0MVhR?=
 =?utf-8?B?ek1lRlFBTzJxUmhoWHJEU0lMZVFtL2dPSEZNYXQvdmt0M3FEeTZGbi94ZUg2?=
 =?utf-8?B?ZU01RXU3d0RIYlVCeFVtSDFTb1o4L1c5bEVvYkd1ZC9vaVJBM1BMMW5uMGVy?=
 =?utf-8?B?aGRrRDQrdHh2ZWFDeWJoVExkVEU0b0xhbUpTUExVcGhDeTRnSEpORTJSQXI4?=
 =?utf-8?B?NzYwUFYvcGVmeElTNi82TS9HVklNZWcwU05naTVPNlRBaUNpNTdtNmFIa2xN?=
 =?utf-8?B?Q0oxeHZzRDNZNEZBRHE5dXdyL3o2T3V6V2dJdEh6MnZOUVVFMEFhM2JXcjA1?=
 =?utf-8?B?YUExbnJtUGExdXUwcGJ3QmRWblZlY2VwWjhSL2F4VWxCTUhvYkhSV0x2MFdD?=
 =?utf-8?B?b0JZUlRRai8wRTE1QnFvMWdKL01kdmpQZmI1eXBHZmh6S2tnZ1pVcjhvZVFK?=
 =?utf-8?B?b3FqUnA5cnFDVjd6MGFsVTc1aWpSUnNwSEFEZHZBVVdXb282Z1FSMHE2Wlpw?=
 =?utf-8?B?UnNHa3VEeG5DQy9WbFpaYnptWlNVMmMvZkhPS1FlSG9sOWtvdjNMUlk1UnhU?=
 =?utf-8?B?cXhqcnVpak56SjBwbExiY0xxblV0dS9nTVlrVmNHdzY5Wkl0TXVxYlBJa2RR?=
 =?utf-8?B?b2U0bWN5MFoySk83RklkVm5pdWxyK1FQb0hZZHo4UGdNMUVVNEhoNkpYQ1lM?=
 =?utf-8?Q?oq51aSSbnHsHrpg96eDGgbCQJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e7353f-6811-4e96-7993-08dbf4a6d877
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:56:03.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsBLy+UTSZciGEoRTyLyHZepBoHAtniLIs+KoZWeZQDrpKRtg6lTXuB94ciI6IJvcGH4BVNS4UdDKm2EZywdMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9584

On 02.12.2023 22:00, GitLab wrote:
> 
> 
> Pipeline #1092667236 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 525c7c09 ( https://gitlab.com/xen-project/xen/-/commit/525c7c094b258e8a46b494488eef96f5670eb352 )
> Commit Message: xen/arm: Move static event channel feature to a...
> Commit Author: Michal Orzel ( https://gitlab.com/orzelmichal )
> Committed by: Julien Grall
> 
> 
> Pipeline #1092667236 ( https://gitlab.com/xen-project/xen/-/pipelines/1092667236 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 3 failed jobs.
> 
> Job #5664669062 ( https://gitlab.com/xen-project/xen/-/jobs/5664669062/raw )
> 
> Stage: test
> Name: zen3p-smoke-x86-64-gcc-debug
> Job #5664669074 ( https://gitlab.com/xen-project/xen/-/jobs/5664669074/raw )
> 
> Stage: test
> Name: zen3p-smoke-x86-64-dom0pvh-gcc-debug
> Job #5664669076 ( https://gitlab.com/xen-project/xen/-/jobs/5664669076/raw )
> 
> Stage: test
> Name: zen3p-pci-hvm-x86-64-gcc-debug

None of the referenced "raw" files look to have any contents at all. What does
this mean?

Jan

