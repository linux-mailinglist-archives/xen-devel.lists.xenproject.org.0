Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FA800B67
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645526.1007730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93B2-0000xg-NG; Fri, 01 Dec 2023 13:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645526.1007730; Fri, 01 Dec 2023 13:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93B2-0000uM-Jw; Fri, 01 Dec 2023 13:03:28 +0000
Received: by outflank-mailman (input) for mailman id 645526;
 Fri, 01 Dec 2023 13:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r93B1-0000u0-BC
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:03:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034ac8f0-904a-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 14:03:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 13:03:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 13:03:22 +0000
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
X-Inumbo-ID: 034ac8f0-904a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7OyO88LxNQ9r6NRFGZxkQ2Jn386hBemUGNhJYzLq35Pj7eiePDb3j1YVFz5vxEVPprfKGZ1YYm/71E/Vq9pTlfNUrgfT0XmF1X/X+yitfTcyfOoio5BPkNah23Qk5zEuPdtzr8Zif8AgD8YM1TykQNkHWW5yxj/+q7BEU9rpuMp2l5XLITIJ4qkfQD5wNklf82JSuHLiXpK+2IZ5fualxRB2y5kEF1m6AhEabm5svbbAY5iSoyJvo5+SQUVCdjSmIxnRYGPeWXeqS8PgrbbMFC8+/Fd4RsERFI5bXOOTHtqAKEpxUgbcPvadLNBqwNMUte91XzwcEr5rF27du5txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzYncaUp0mxw7/UVCsSWmcG0GRA2mJTfkJT84GPy9mg=;
 b=GUOJa29W8pX+w6yNCNuCVhKyMbplO1PApuoIlpC7x71Xj/5sv3ccz4f7x3L45oaCB31peHT22UEo2yYKpyLQ7K7a23ovWUMasUKXndcvnj0lwDeWk2KH+Nj+feciuo/TK5FO7SYlFc22egytWWjyWGSnAVWYtRqmzZgwE7HI/kjo7tJaHwGhDqjK48aMQjYzMhfujns/VYYUrFMTdHI/e/8SIbkuc8ztLTWkHdL7MQZyXw0jsJs7wH/uTS7WHhZxWJZ4zF29V77suieupFZZVOwRfkfwewBGGqxm6sHbpqC6/qgSISMIrMf0+KFKscDQjmk+MxILnGDPYBFJjWJFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzYncaUp0mxw7/UVCsSWmcG0GRA2mJTfkJT84GPy9mg=;
 b=XKJW1ygRHMP1Aw4uKgpZT8qKCul1PUcGismJ3Y1cMBIscqYfxqgXwgFQUMZXpYAaFOA8O0O+/Gy85+yk0SRItntOaniR4fX96cRiFr9l+wV7xpt9jobLAuZhJhSEg+jbHmgqGEOp4XP7qHpJA2Zzvx2NZAPV+plwundxXQw3Xan0hoJ18YikGyXGeNHfWOluaxpgaebSlM22tSBjccFkdEhGE8gvPrUestc2DeieiGv2tFVb/J53edYyi1MelR9WlEWC6hJWtDevWeHC1GdjtLVe6ajNWpVgQ8WzNxVf/AoGKx/hxI+7acZATKQ+Q+WWPz+q3tGxad0aak5DNWYCFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca2d37aa-fb8f-4b49-8909-ad7d4065a59c@suse.com>
Date: Fri, 1 Dec 2023 14:03:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a295b44a9fbb02f962720e086588437876e02ce3.1701430079.git.maria.celeste.cesario@bugseng.com>
 <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
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
In-Reply-To: <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: a442fcd0-3241-49d0-3731-08dbf26de5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QhPeUItKNhyWDHPNXj24Uba+SSfp2CK5xfExjKEYuJv2pukdqNifXudaa0stXBRenpXqdtck+HZrFtQwI/AdLXTD0ntkFFSfKi835+d5nv3kTTXJJnIvfMN/xdKCMHuJemnFK1mcUr7K4E4+MeLAXClNLo0A9yg3bM95cbI6tQv6QPmWfYv9NdE1BR4zKhULjikKp6B5qTkdbiYSmabL+/3EVTPFmSZyWKhp83X9gq8939X0YW0r5ySnwAwKSseUhuZnFSwxKW7XUzkCKZAbgj0F4XSuc+WRG203DKSVInLyVymZRMmIIuxfGsdHe9PQhFazPBolgPknt4HafxzV3Ymo3nQBvOGvypptKOwrbTwk9XCYfptK+KgTceTd2eGswdALM3WHQrtN8UaEDtLeqO1sXw9UP3pbAqU9LrkDFVTi0JsASES1PX8ZToYktMABroe/oLFagOtXL/m8P2gYH946ED/+lDwlQIjgjqsj5bGureyLIgsRQZRSmdUafSO3pktpLiYId/7fg8yJOg6pwT49jTK6DhCXGQWosaIiYY00E+2BCxz29jQexEBBt9xLdgczBhoYQIFuexk/bTvw/zGMsELC4rFRhzCOO+1sULqJpnaUArMOAlcOj0W3MtQPxAIq/Uzr8jQ6AE8y+5u0nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(41300700001)(36756003)(38100700002)(2906002)(31686004)(5660300002)(7416002)(26005)(508600001)(86362001)(6512007)(6666004)(53546011)(6506007)(6486002)(31696002)(8936002)(8676002)(110136005)(54906003)(66476007)(66946007)(316002)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpNWkh1TU9vK2tRYkhTbkNDT3lBMXBPTXBMcWNNaVozbEtBeHRTZGh1alVo?=
 =?utf-8?B?OUVySEhpNkl4OCtVdFVqVHhtRGNSMzh6anVXclF4Mld5WVRIWU5zM1lxdk9h?=
 =?utf-8?B?c2dMaXg5R3Yyb2hVTldKT0h3ZDhiL1hFQWlSUlBlUVREbmMrb25iYUF3d3ND?=
 =?utf-8?B?eVc5bTBYWFZvWDFlYjlSSUhhdEpyZGFQK29qVzRVZ0pIbnJhRUNtMC9KQUR6?=
 =?utf-8?B?RVhKRE1jK0lSYXJZTGdFVzlnbVhYMHI0aTUwWVNRamJCNTZ1czlaUTlsZWFx?=
 =?utf-8?B?d1REZnphcGlreFZoQTNhNWljdnA5T3cyeVdwQWZFKzlzODVwcnRXK1dZV2t0?=
 =?utf-8?B?ZFhERmtZK3hLZWhVbCtFbVdCUmpDVmNkbXc4NzZZSXVkZ3hsVUFsbDZxbGtF?=
 =?utf-8?B?VnNGTjJvanU4d1lROFZJa1ZsbmlRZWFsaGY4T3pQZ0ZScWZIaGowMHlSTXli?=
 =?utf-8?B?QlEyNlRvcFZ4OTYwNDVjcTg5UktRU1ZFOG14SDNHaS9jVkhhMElMQ3YrNmVa?=
 =?utf-8?B?Z3lnY2ZMMjZrL21HdUdqZGIzZFZpTy9aVkxUVXQ1a2crVk9sYlh0YWdXNm1T?=
 =?utf-8?B?RW03ZmkrekZ5Z0tFdm00V2xDR0lJM0dkNktvMTFmYnY4Q1kxZDJSNmVPT210?=
 =?utf-8?B?QWhuejd2d2IrbUVEWlFpbFpBL3NIRWZZUEhDeTZnYVpTaEROMnRMeThDaHRG?=
 =?utf-8?B?TXhIRlFuM1U1dXdydGxPY1FnekJyQ2l0R3g4NmVZS0hVamkyUERQQVB4Y2Vr?=
 =?utf-8?B?ZW4zRXFFWnJybnZONzBtTFBLWTJQMENBeURuNm1CVzJFejJHMGpwVmNoZXlC?=
 =?utf-8?B?L0JUSU1KbVFtbCt2T3ZNb2REempRV2dnbzJXR2hlWkE4YUoxeVhna0VGbldY?=
 =?utf-8?B?MDNybUlxQWxDWjMxV002dTRpN0k0a1BDYmFJT01vZWxzUDRSNVJBWFo3NUh1?=
 =?utf-8?B?Sjd2aVYvYllYY1dDTW0yS2h1bHFyZHZ1cmJXemhVWlFlQmpvZjFRRU8xcUF3?=
 =?utf-8?B?MFpvdmRQWS9vanFYTTZzNmdIaWQwbFlHUVorK0xEVDJ2US9yeGVZUWlzSzd6?=
 =?utf-8?B?RGJiVGgxc2I4Y0lFaytKTG9MMFpzK1l5cVJjVUNUWGVvLzZPVk5GUS9IVUQ5?=
 =?utf-8?B?eXBRYlEzMU92Y0NlamJDYlBmcW0wTjRPL1pVSlFsS3dSb1RlRWYvemNrdXU1?=
 =?utf-8?B?bG9rekRkYytVSUNWYmRTVmdKais4b3JDZmxRZHdGNEtKNENsWkdMS3IyWkdG?=
 =?utf-8?B?OXZzQTA2N0NJd2x3QzFMRElKRkVqeGlKU0ZObWdVZjkzbWNWL0RyZUFwT2N1?=
 =?utf-8?B?eUoxKytzRW1KMkRHM3ArdUtNdkZ5R3F5Yk5RSEZmTnpkWlpQcS83WW5UL3JV?=
 =?utf-8?B?ZjQxZEU0TmZYV0Jjb29LcDhLaW1HTXpoZ0ZQaStXNDU5aldsNEZBVjFYazNB?=
 =?utf-8?B?anNGb2QyNVh6aCtYclJMSEg3YlkxM1d3cms0bHREdXJQUmxwZE1xaEFTQitk?=
 =?utf-8?B?ME1ZUlpma2RZUzhtVklPOWdpNVk4SkxhSW5rK0RWbHltRzBENTRzSy9UaVlo?=
 =?utf-8?B?cmZNd0JCVHJNQmR1WFR6OWtsVmtIcVBzT0Y5TXo2bTdtRzV4MUFiVGpIbUdS?=
 =?utf-8?B?Vm5nUWpBSi9PdzNFcWN3NjFrQ0VJalBzZnVGS241YWlvcEM0RENPTzZSL3BM?=
 =?utf-8?B?TGdsQTd2ZDlwNXllUEQyMkozbk53dGZTSWx1QmlrdDVGbTVuNkR6REJLOXhl?=
 =?utf-8?B?VWhnUmt0VTRUSDlCZEVyOVBreElxWnk4d1didnFnVXBuM3pUVGlSZG9aeFlD?=
 =?utf-8?B?cWY0U1c2ajU5YVEyV2pWSGJuT1dBb2ZMVlc2MXlRd0ZGR3FHaGYvR2xkbGlG?=
 =?utf-8?B?U0lCRmtuVVM3ZFJHTFlZeTNDM25lZ1dXM2xzR3RYVjFrL3lIdVpvRkRWa3lU?=
 =?utf-8?B?c3lnelp1TDd0bmt5WVh2UGJLOHVlVFRZS25aTXBUOXRheDd2empVTUJzMVg0?=
 =?utf-8?B?VmQra1NKeWhLYXlwczJWQ3ZGVS9sRGpmV3pDVEdMQm9JUHN0WUZBS2dyektD?=
 =?utf-8?B?M3B2dDUzN1BFaHNDY3B0eXc2OFBQL0hOekpubDJ2TStRbkU5MHladTZ5MW5D?=
 =?utf-8?Q?BY8Xub1fdSQTb7yBGQuJs2LK/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a442fcd0-3241-49d0-3731-08dbf26de5a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 13:03:22.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90jd+ZgRXryRMQAKlnvNvKenhb8i0S2QSuNaFn5K8RVexIffirz18P1uwRMAAOaJKb5k4i4/dN0XKYSfo3Z0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

On 01.12.2023 12:48, Julien Grall wrote:
> On 01/12/2023 11:37, Simone Ballarin wrote:
>> --- a/xen/arch/arm/include/asm/regs.h
>> +++ b/xen/arch/arm/include/asm/regs.h
>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>>   
>>   static inline bool guest_mode(const struct cpu_user_regs *r)
>>   {
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - (const uintptr_t)(r);
> 
> NIT: The const should not be necessary here. Am I correct?
> 
>> --- a/xen/arch/x86/include/asm/regs.h
>> +++ b/xen/arch/x86/include/asm/regs.h
>> @@ -6,7 +6,8 @@
>>   
>>   #define guest_mode(r)                                                         \
>>   ({                                                                            \
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);         \
>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() -             \
>> +                                                        (const uintptr_t(r)); \
> 
> Was this compiled on x86? Shouldn't the last one be (const uintptr_t)(r))?

And again with the stray const-s dropped and with indentation adjusted.

Jan

