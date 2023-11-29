Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D87FD4BD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643812.1004346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IDb-0003al-9T; Wed, 29 Nov 2023 10:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643812.1004346; Wed, 29 Nov 2023 10:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IDb-0003Yi-65; Wed, 29 Nov 2023 10:54:59 +0000
Received: by outflank-mailman (input) for mailman id 643812;
 Wed, 29 Nov 2023 10:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8IDa-0003Ya-0N
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 10:54:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bae4f9ef-8ea5-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 11:54:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7931.eurprd04.prod.outlook.com (2603:10a6:10:1eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 10:54:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 10:54:53 +0000
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
X-Inumbo-ID: bae4f9ef-8ea5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZzOdoRW7wI1DzAXyWrM+Ux3EEPtDjN0yy9UqOZl9VunMM65QThbeVj70JsuBPC5kaw52sf7bHPCyUs9zmgaX/0GS/JBzOfpUZOkbc/CC8QTi7vdWXGkuNEE2oxvzpXYabPGHMh9nCrCy8cIflF3LCKnURxsuqG/3IjnDUYXk/vMf6ikvVI/s4j4tdzRyGCyXxeJ+TzO7Qko2uHv2QfXt7hh19QURQ8H8Oy0rLUVb9klFpYEcvtdJzsUL2/rTwiBO3DwjtGJVlhozWLOLJHsaUGxJoAlrs4YgUJKthgTaqrdzLjJm7bQYYsLBKmHiO+v3Cauz8iAwPLwmFzPNTlyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i4Em1r4DeWshIGyRtIjnvCcQKkyHlGsZg+Y+RMvkPQ=;
 b=K7zHua5glF3vKjy6c3vm5BjcUajHe5ltoNheXfgE0SVdSfUABnaKIW4HWcj/b9obsCMfh/X5OOZW3yxswwOPt1n2NNFNyH85UvZZ/mSoOqVg39ro4XnKthVq1qlMwxLU9PzCAZEK6fb5s/+ahDJPsXkrDb0sPOTxqlRREqPhpCKfcByI6sMS0C5DIJqkS1/rVzpFqcHwBxK5Eq6zXxafLQ1xkn0zCkez8i2eXMhT5T+uKMJ1FZiPEotMRAARlVTINFNizK7ydNfUceH6R+6M7kQHCk7hO8RglSyDCI1q5cGPbVJCRbthUJO9RN1ZM+l/1Wyz4l6ulpk62mYTlTb/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i4Em1r4DeWshIGyRtIjnvCcQKkyHlGsZg+Y+RMvkPQ=;
 b=iurOOe/ZQexWOT2xPN4g3zt/pdvSGAQoOJzEqIZW/qhP1i3Gy3T8Yee/UOSlyACf0sMQ+O2d1ONbzdMwoD6FsQ2zXJXPnprVjAPOg1rfYVsdjjHkLHaGC+ZitBGFarWxS2RE5mjEAJA3fnXmQPYNgygVaz/aw641T6Kkj9hpl6pkbxyfN5IuQa2KGvgWC82G63Tur67xmkci0ir1HbmDQCWfOApHFe55pUrJMo9N/bMwCSlMpY6u1cpV++xJIcKb1b4gdahiT0VFcmwXOrolJ4t3kZZQ9FHuk50Gk6Xi2Y0+HFpygEppxXekJj4M7UtubDoEEKNhazcXwcRitE2QJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b788aa01-734a-475f-a89f-910850ec8b6a@suse.com>
Date: Wed, 29 Nov 2023 11:54:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-US
To: Alexander Kanavin <alex@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
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
In-Reply-To: <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b7a5f9-3656-49b0-37bf-08dbf0c99e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NB+WF8w5w8LGouL49+9ORHHH65EK5t7v04H0qCjkN5Xa8wt6LlYr/y1Tbn8rqZqHoHW935PoNvnsjFYzWI70QwojERccSfZf0aG3+VDwHNwjXAL208s+uas8sjN0XXo7B6sRMn1BUMn1gp4qn1vkDFeANlFmxlERunf0JHkQoy0K0ic4wfzPWrWrmXCQ2Iyj/YkuP9eFYJU0dIxyyscomw35LhbsyH4ct1Ybl2rF7zNmCVyUJWSerSTua7OIEh36pg0+6XaZGjPisto+qQ6j+hE/I33KYhRTh6CUPbx8bFH8lrxHL8d7MAwYN9SF7a3bTisiwGHfAvKIRyFFFh/wzPc23lWqdMR6FaVrwb5/8WK39ectgwWeTmAdg3mzB0auiLvIkahbOoj79S+TCMe9tjXcKt3TlUg6eLCHQbQe+f3YP3wZBxsw06lXPfVqBRLjnwtzLq+xBGYsKR0BYKPVJBQ3x4z+LSPXaOP/Ekz2s7PI1aZSY5CgVNO40C7nj01kpF16RQrVnW9mH2cC5Zh/jAzRfXtconAyr7PBbUFP7uv8JPT5FSj0HbSb25MxpCcZmqJhzs+3p3+QpX3we4H3syz+by0Mm5sGBJPpLwYQ/EqWiMe+qJ+b/Gskj8AI2OKgxVQST087pNPEd55INe2qKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(316002)(6512007)(36756003)(26005)(2616005)(6916009)(66556008)(54906003)(66476007)(53546011)(6486002)(966005)(478600001)(6506007)(66946007)(5660300002)(4744005)(38100700002)(86362001)(31686004)(41300700001)(2906002)(31696002)(83380400001)(8676002)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjV5UzY5YkM2a2ZJSWJIUTJXZXM0YnFyQ3dKYkhBZnYzMjBIQStxQVdVMTJ0?=
 =?utf-8?B?ZUZoVHVZbGdvTXlmVk9IbFdjWE00YWxPS0c1TmVGTmxDNkh1a242empGU1hl?=
 =?utf-8?B?M0NFVmRtREpWY2Y4THFjMk0rc1JsZDVTZmR0OW5LU1VqRnVnb0E5YTNyYjRN?=
 =?utf-8?B?T3F5c1B1SVRMcmhpRjRid04vQUZUaWxUTkVOemxkMmJmbkVVTGVSQWc2dXJk?=
 =?utf-8?B?YVFWSFJzUXBYOGoycnlKQUFYSG9IejYzaVlWQ1QxcmdBcW5SamVVKzR5bHVG?=
 =?utf-8?B?Slc5U0dmQmlmNnVwcGhxa3lUKzQ3TjY4T0tGT01keU9XWHA4S1NtTjdNaSth?=
 =?utf-8?B?NUROanhjaG5sVmIrV2xReEIrNmtWaGlwdENGNXJ5L2xySFlVL0k2WG5ZNG9j?=
 =?utf-8?B?U1hjWEJDdWwrUk11dGRZUFBKbVhSeGhmS0JUZTgvNzNLRkRjODcyVUpDVEl0?=
 =?utf-8?B?azY3bW1LdDhtNVdkeEtMUDYwZVVpZlpMd2duL3h1RU1ZZkp6QjV5eFNBZElx?=
 =?utf-8?B?STFMMWVKM3daQ3Q3bFROL0FOb0dhcHBiV3V6SWUrUVlTN044MEh5WW9tdTh2?=
 =?utf-8?B?VjJNbVZ5SXZHaU1kQlNWUEpFZHN0L1ZBckxOUGVWRXpQRmFmby9iZGJqcEpW?=
 =?utf-8?B?bENjeFpUVlBTR1JtN2pKaTJ1cXpvWEdZTElzQ1FlOEVFQVRqbXVNYTlWY0Ft?=
 =?utf-8?B?RmVrOGtZTS83dlZYUEpBaTBIZEYwQ0l6bVFoaDhSeE44b2MzUEErTVpMdmg1?=
 =?utf-8?B?WFRleXZJK1QzcXBpc3ZEdTRZK0dKTVVYZEhCc1VnWUVieHpGRGdpWjAzbGMw?=
 =?utf-8?B?aWFWYVFQOFJqWUozeXF5d25MT3VqemQvNzN2WUw5d1Y4MTVQdnBDelRTSitX?=
 =?utf-8?B?ZXRObmlrOFkwMnFzQms3WXhIdHgwRDlVaFlrQVBZZkd3U0FuTjNLTmprQVdo?=
 =?utf-8?B?V2JIekxzN2kzekFjY1plWldHZGFMeStqU0JpbGNnZWV2UzFYZkJ3RWVPenln?=
 =?utf-8?B?TERaVldOakROYUtqZm1oS3pLRjU0ZGdidHFVU0c3TnV2MjEzMmRTOStkcm9w?=
 =?utf-8?B?ZWRNeFJORGZFSXp0bklFZHM1UXo5UXBCb2pub09vc1J2dnkwMmNQRkJocm5P?=
 =?utf-8?B?VWlJRjkzd1RmRVVkdmVUVHNaSEFobURqYnYzVTFLZVp2SjFkT0tMT2xHSlZ6?=
 =?utf-8?B?RlBUa2N2M2pXTkZxMXVSUFVkTkZrVEJJVVMwOERpWnkzTlZQODZ6N0gzbWFp?=
 =?utf-8?B?emNobzdRRmxqdGhRMUZ3N0RVOHl1Q2RQMFJEN2l2NkdnVDVidDUwbVMwdUZn?=
 =?utf-8?B?MHRvZW54dzJQandmWnFBZWlsM2lESndGVWI4dS9zc0w0VXY5am9oZkhmemRP?=
 =?utf-8?B?Tnp2ZU5zamljWk44TGc1dFowbXMyQXpXd29jckN1b1IzajBHM0VUTktOU2pm?=
 =?utf-8?B?RlhlMHliU3E5ZWxzVzAwb3V1SldzNVVZOEIwZXR0MUcrRTNqTmNwRXJmZURm?=
 =?utf-8?B?OHlGSWpLVElleWZSTlBYVEVhUmN2aE1KNW9mV1hoTTZScFRuM1c3ejJsc3M4?=
 =?utf-8?B?VzJyM2FpelhUMHJPZno4MC9Vc3VPTUVYcTRNMHNFNjg4MHF4NDJCOVN5aFlr?=
 =?utf-8?B?TW0waFB1bHBONDMzV29NMjNFc25wYVNIRHgwV1RyM3JMKzBCcUhKR05QN1RR?=
 =?utf-8?B?NzN0Q1BoRCtzcmVTbDI4RWNaZGJVeER3VXFGQTd6UytkcWoyZlo1My9TWDlB?=
 =?utf-8?B?MmlJN1prQlhxMUtUZG5qMXBUbXF1SXlNV1NZQjIyR2g0ejNZRXFtVy9tejRD?=
 =?utf-8?B?RCt4NFZLb01SMm5mL3dwYUhZaDlOYWJ3U3BTZXN2YW5ES1gyMFJ2TjdjMUJV?=
 =?utf-8?B?bC9tdzFBYXBtcUJ3UVJUaHdJaTNmcHZvbTlmemZnWG50YVNPcC81bzhIbWw3?=
 =?utf-8?B?b2lvTkVyZXR5eXJPQVFvWUh1dXlYNEpuTlJYQkZvNHJYSVgvZVVISkNKa2RZ?=
 =?utf-8?B?MHdsN3JvY0F2VTdsOUtnNEc0R0cxaHRCUzdrMGQrNEJ6TmRsM2tvQnZBQk0w?=
 =?utf-8?B?a2pIcHpRcW9SeWVhOFlUVE0zRHhidG1GVU56NEh2bE5tSG1zOEVSTWlEY1di?=
 =?utf-8?Q?/++JEPprwiNMAltxx6N6pUh80?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b7a5f9-3656-49b0-37bf-08dbf0c99e2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 10:54:53.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYCBsnptuYaOCXrSUXhp9l7RUlwvcgbPeXwKE3atxqw8NStoo+rkewdiBDWZgPz99OA+VOdlFxOLu0E9uta2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7931

On 29.11.2023 11:34, Alexander Kanavin wrote:
> On 11/29/23 08:51, Jan Beulich wrote:
> 
>> On 28.11.2023 18:47, Alexander Kanavin wrote:
>>> Such constructs are fully allowed by C99:
>>> https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
>> There's more to this: It may also be a policy of ours (or of any sub-component)
>> to demand that declarations and statements are properly separated. This would
>> therefore need discussing first.
> 
> The error is coming from python 3.12 headers and not from anything in 
> xen tree, no? As you don't have control over those headers, I'm not sure 
> what other solution there could be.

Suppress the option just for Python's C-binding?

Jan

