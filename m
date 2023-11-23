Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FF7F5E0F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639659.997232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r685w-0003sr-6E; Thu, 23 Nov 2023 11:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639659.997232; Thu, 23 Nov 2023 11:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r685w-0003qk-3A; Thu, 23 Nov 2023 11:42:08 +0000
Received: by outflank-mailman (input) for mailman id 639659;
 Thu, 23 Nov 2023 11:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r685v-0003qe-5Y
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:42:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539cfeb7-89f5-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:42:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 11:42:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 11:42:03 +0000
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
X-Inumbo-ID: 539cfeb7-89f5-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+Z9xLt7Pz9XYUPAb1gWYi3BxiCJSlDgUMQTav/Vmpog/LRKGzYR8B+KC98nLuvoh9gJjOgoCzZz2gGYkTeEaoeEj3+pqMcHjyn2u0nQyQ0WK5+01Z196TjniRbSEuQfFJ7WtzbQuiL+jzd77pgNGtxvww73thL+OUZeH9oDisPqOXhejK59fMg7q6wNKDFytU9fkhp+6m/0Aa8Iaewt5wZDxo6n/9cIEr6UXQXCS/L+88LDcz49/7rwYku4LgXlbvnPpy2YIeJJuw5ahj0kMljERDtyEVQqWwslR3ppNpCh03hTLRjPC37799oZwBmE7mfKdjzO5bCQmFU3WiBFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rAy6LqYTg+6ElQ0u1Cp/uXYBHsJ8qioRVDspRC8Qws=;
 b=PknOb0PHsdAN2RnW6S9CzrfjyNUdu+90Zs4/VwQR1AEGxzpgO9P9Xj0okc2HtkLpnLr8mTH3YIa+tWOSgO5oJvoo7zMkua/w1ut6SQPusB6SLzLmlgRChZFSW110GYk9KCB7AkICNJL9SH3lPCW3O9PRKsVUxOxglOm3OJQIKYTyKwHmDgRFsxAYQ5FCJsfG5b+nZg6c2RMkBdKDDN7gBTA1s0/h6j7pHP1tJNaTFunxno6UKGbk2H7g9HKkPn5rvtXTf4LcC9Ez6gfKV78vs1SFa2whmlp5z1MYKTYja5eLInBCluNGReVIEwmHDURYxNI15y5bq/b7Ctj+Y4yAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAy6LqYTg+6ElQ0u1Cp/uXYBHsJ8qioRVDspRC8Qws=;
 b=yqXcn0pqh12xoxzBZ3vLX6RXF+2QFhRgagbt69d2ecmDSoj5+XP+4yLv3sCCqndhxN8I3lUKpMaEm5QTYqg15ZF4hh7xodHFGSHLMmxgNyW44WufgBIp1hRZxShWS05oWRvjh+oJGvEYT6ulmK4xcExtjAp/6DVQR0TcrhDnnxEcyKu0+21B/iNK1zA4m2+zMbqUW7vqiT8hMt5bwipvnqCDReTstxlOja77/h8si5YNL+WGqcZbtC4wVIkhkHO5rdtIYL+1L99gO3qhxCa4R/Lgs29frcsxTXCTJOTZpUfHJ3qZtt+wEasex94B5v7E/eOOykcyM8lSPVVl6cTtCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3dbc02a-b7cf-444b-add2-89ed80a17bb9@suse.com>
Date: Thu, 23 Nov 2023 12:42:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Drop image_name from efi_arch_handle_cmdline()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b70d3c-14fe-4cb1-7477-08dbec19360f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EAPIpoVhUU6DpJeWCA7F8fvNzzpPv0bvw8AmRBAsapU1pOVvuUYJL9kGh95cK8/Ct6En+0C0ckxmm6XUYMAFaQ68Qh/IwJUxZKhgcDZCSR5VI1phszK6K+fSTZqqk9XyWkhz/D1D1+a7OixGKYjF2CkdVxhlMK0ZlKbxvPObbWMn1+Fe/jjX4gZtz8CrKFRpZ3ORz6WITPlhhPACNWM0INTkPWF3kLaj2L8qkUz7Hv22nywVtk8dNvVcE7SGlE4yx5sTzvcQZEYixAP61PBK61Lkv0srli66HKu6V8nKXgEfqkoD9SsgYQwTrJfciXSdchbVrQTGOgl2P31sSxC+tb/jKrFJLwTAkmWdsT7pp+7zQ3PpV9LDDbWyHhcgtwC2WJzVLj6L3wrmT1iUH1Q4KAPpAQ+wSvkLJBTYGgjpZrODk95Uz787/INWFkORAVyi+1JvtAuKoO4vDlxg/hzxnB3P7SsCQhGNS08tylZqNCJzQtQEnehmRtIVGWUb53ZyT6JMPaAuQt53qUbObWesshWMBaoB6wsgt0U1iEUqhnQr8kYzzhXPbDPBmSC30W86GHGnS+GuFKDMid8fazb7aNM8nWunhXbq9xDIAUzOuucM+dJ2uPmLrOR9onJrau9G3eAO2CwoAGk1+lRA0etqQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8676002)(4326008)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(5660300002)(2906002)(6512007)(478600001)(6506007)(53546011)(26005)(31686004)(6486002)(2616005)(8936002)(41300700001)(558084003)(86362001)(31696002)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3RiUnZWMVFyejB6eVFzM045VFJYV1lsUldQUnU5RnEzd1VYRU1kTDg4NWZI?=
 =?utf-8?B?dmtHNmEwT3pOczkyMjZFdVlWdEpJcG5QYllrRUZEazVYTGxBTnhsV25kZWdx?=
 =?utf-8?B?WFBIN3o4WEdLZWxMNThRTVFMeU1OandFcEhZS1FpcFZxRzcwaDJzc3NFbHkz?=
 =?utf-8?B?bUx3UFM5TGNTR2c3NnFJeks2SERwdkdxUkJZbElPUzE4bzJNUjdWQmFCR3dW?=
 =?utf-8?B?VnhpZVlBWDg2a0pxVWdnczVrb0hBYnVRcjVXQVBzOVR4UjMwcWdHS3g0V2di?=
 =?utf-8?B?VHNSZ1grUUY4dWhackRSeHpTeWQ0a0lvZTkyeUtyakoyWXVhb1IxRHM1WnMw?=
 =?utf-8?B?eEpxVkRNQmJNMEJ0bkhJSGpQejFhTjdTaWhZSXBqL2paWERFSW05bXdRV0lN?=
 =?utf-8?B?b0JaOXBUQ2s0SjN1REdVOFVBZXlRRVphQzRVSXpwNUxDRkpSdEVMdnVsU1Z5?=
 =?utf-8?B?Z2IrNVFaSlhTdWVITXc1TFF4ZEVTYmx2ZTlJajMwZGdDelk3Q1RkWGFhZHE0?=
 =?utf-8?B?cXdBblB2bXgxaS9LeDdjVDRTMmoxUzhsU0czcDJEd0t2NXI5NW5lM0Q2eitK?=
 =?utf-8?B?RG9TNDFMbnUrTFV0aytXcmFvMVdIUEtOVGF6Yk5MM2hSQzJQWGNDVkZCM1lW?=
 =?utf-8?B?Z0dlV0VsdHROTUFRNDBZbDlFTjY5c1M3MEVsRlVHUFdranZCT3ZaWXFwUklr?=
 =?utf-8?B?U01ORVFoM2hmd3M3Y0JldU5sWlJlMHZpOWVNTkMwZWE4Um5GRGpqZzdJSmVP?=
 =?utf-8?B?bkxVOXhYdXRMbnc1QXRJMWZxT21vSjBEdk8zV0orZ0x2VG5aM0cvQ1R3QXZJ?=
 =?utf-8?B?dTF3N1ZVREV6alZaTUNOdExISW12cHRQakZYM3pkd2ZhMHhlUXFsYnZ1VlFR?=
 =?utf-8?B?QkxXZk0yd2o2bVFaaDBTc1FYb0w5UU1ucGpzQmRTWmg4UGNBTkdFQXVVKzdZ?=
 =?utf-8?B?RUQ2SWt0ZDdjZWxFNDRjc0d5WjQ1cUQ1cXpsNkpsV2oxbi8rQ3hMMkwrb1Vw?=
 =?utf-8?B?SUFabjRvQXVhVGpWc0w3QlZGY0RqZTBGVE1DVWRzeUl2TG52aVZaUC9vUEZt?=
 =?utf-8?B?MVpCalpLZzVndTRVR0QvTFBCc281RGRPZURnTXZWSUpNT1pFcTBpZ083UzJV?=
 =?utf-8?B?T0xBVDhBcmE0VjB2c2Jtc3NKdERUN0J6RWN0UVNpb0ZPZFl0MmFMbmFGUkJH?=
 =?utf-8?B?ODVFTjF1dGpMR2thUFNPSU1jbWU3STdxNCt6Tk9lbFhJSnk4U05QSFo4aFFx?=
 =?utf-8?B?T1p5QWNpSTZGdDkwcWJNSmlRZGNzWFRzMVo0VVdYeDV4em5yTXdxaXBKTHhV?=
 =?utf-8?B?MnR3U3lZWkNieDJGckJvV2pRdXNJaHh0WEFCY2IrRk1pOC8vZnVmb1FhaldE?=
 =?utf-8?B?OTQ0VDJqdGd4RVoxUmFzd25RTUIwcGVpc2owdWVONGp5citYRjE3TUNZQVpJ?=
 =?utf-8?B?RjhSdElrVTBMa3hFTjIzTzZib2NqQmdLbFFNc3hBRTdhaEhYUnZoUCsrbCsv?=
 =?utf-8?B?YS96NVlnRytabGhURGhDRDliS0xnTzF4aGpBOE9VeklnT0I1bm5lRWQxR2h1?=
 =?utf-8?B?WHpPRWJjZUJVRW91QnFFcmltbzlYMnMyWjFZTnEvMlU3UFJGcDY0QVYxbmRY?=
 =?utf-8?B?cGpYUGpEMDU1N3J3UzJsME9ZVGhCYkFaTW5uei9hTU5zSU00RzBtdG5YQmJ2?=
 =?utf-8?B?S1lWTFRGTkM4czhiU1A2WnBNdXV4TmhMb2c5emJVcktvZmRKV2NvdzF2TGt0?=
 =?utf-8?B?THoyd0Ezb2ZvQm53bjhuU2hsdEw0OXlHUkRtTlhUZUtmc3NxY3hUY3hxRGhN?=
 =?utf-8?B?T0p1Z3M2V05sRVJOUy9vK0I3am45WCtOenNlNDVDY3VSWHZjZ1pHK1JLZm9m?=
 =?utf-8?B?Z3ZhS201TnZqc3FhWndaQklkSzU4RVBlbUNCRlQ1NUVDbkNmOFZaRHBZemRH?=
 =?utf-8?B?ZStBSTZVeTEyUVo3bHNqYjMzN3kzUE1FZ0paSXJaZ3VtOGNvVk5TODVPQmJ5?=
 =?utf-8?B?NG5CbGwrYURFZmxtQ1owcHNGUFJoRWNFTjNMMERRbWE2Mm95RmFudmRXZyt2?=
 =?utf-8?B?NUNUc1VMMVBaeWYwMW9lVFo3Y0lxWGpLcG1McUxQanh1VkU5QUlOaVNsQWpn?=
 =?utf-8?Q?A0INW1fZbKGrawDEywx4YgIMA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b70d3c-14fe-4cb1-7477-08dbec19360f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 11:42:02.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6X/MIGuOUDCrSGNsf/IKtch5Rx7E5LIOu+Ze0WB83LD6rFtPn2UprWqIZYpxADOF4HzCQWuUV5sBlgQ00yjZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9351

On 23.11.2023 12:37, Andrew Cooper wrote:
> With all architectures no longer wanting an image name in the command line
> handling, drop the parameter and forgo making one up.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



