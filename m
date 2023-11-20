Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E574B7F187F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637101.992832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r571N-0005lo-Vo; Mon, 20 Nov 2023 16:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637101.992832; Mon, 20 Nov 2023 16:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r571N-0005ir-SN; Mon, 20 Nov 2023 16:21:13 +0000
Received: by outflank-mailman (input) for mailman id 637101;
 Mon, 20 Nov 2023 16:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r571N-0005il-6q
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:21:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d14153e8-87c0-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:21:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:21:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:21:09 +0000
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
X-Inumbo-ID: d14153e8-87c0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfBGNOWj8E4r13qQ01dkMDONgwaDmosDUmYDaDhO/YVwwhf0V4WPjozMG6f1dJ/qsRJPshCsDgkf4TwIPG2R+gBN4lgEmJ71N5ow8+y22YgrDW/7rvJBqMkDxX3rXTspxFXiO3XWy5K6JTwGeWBKxDHGgBLw3/toEttogsxfxXCSfCAcGyTUeEMQlGJJtobMyOXplCpK45LoKksHknEUUpIepYplyh1U8FlGGZv2LgQwKyWJ7dZQs/QUsx0ekibG1urd1ZP4aLBGfqHL37JeL27kb+cOJt4x/G7B3rnlyH4HTA9pw2pJnlsBNEDFoxi1n5MCY/N06THec57oSkFftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPuRf5rHlbdHrwAbnkd+TtOZalnO2d1aPwL5SUJkcnk=;
 b=VY23MhH7AD3dnPOJcONRA9IL52Z405qc36R9R+3oQOvgipl4iZ0ItoKIODuINp12yDf48Mt2Ylk+kCwOVgZDjQy/GUrF/tnJXNcl33y2VZKdxGX1HNBQoAoz52Zadx34KN2lpIiJw/MOKUkWTD3b0W0mjUWTTzGFOETT/hKt6VCfxdw6VX4Q+w7zUNd6OZpHpxTHR5RZ6EAtTBWHiYmULbutpJHJbMbXWEVdN3Sy3kwQE497Pt42HmSElUu0iynmDTPlLtzZStnVlq6f4cdD2hW//RvGSqjLjoh/4nwxlPngmo7zdPzeCiZPJkYnQa/B3KmqDlis94YeoLBGMi6Ruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPuRf5rHlbdHrwAbnkd+TtOZalnO2d1aPwL5SUJkcnk=;
 b=o/KnW/AwtmK/c0vxvSecZoGmLDT/Mc3nJEdz1jqYuqgYu6RVT6rw7RLuvsGHY4kXLKGktU2w3vKzLHa3luCJuUlKlekj2P+PNaoJP2QW/N+E5UL7KiCesrVQSVCbErI65pFYTCcMnXjNZs37ytG1QHXKWKCYSz1EqfB+wtjxvfvTCvTWcMgpGlCD2Hb42aNWA6K4d8J7twOBcPWJmhGz2CfFzuvNi8AMh14KjDqmXYj08onRPNDQmUjcbxete2/C1J9HCKSJpF5vzME+wKsH/em1CMXomQnFsY3ZpU2MsPZKso02vcKiIcsu5yzUzZ3L5b4vHDkJ8j1+CUTB7Eb7hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2abafbb4-d084-49cf-a542-14c6f93a68bf@suse.com>
Date: Mon, 20 Nov 2023 17:21:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/treewide: Switch bool_t to bool
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120145623.167383-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: cb49c05b-5319-45e8-96d5-08dbe9e4b487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4ppiZh/qxZ/56QhGTYDhDNykOE3AXa4tUOMQX2tIg8M1LtNazK+mP6uwZem2tQjK4PvVZLz7c0Jd9a02saPy+d4N37s9sOKvxxXc3x0tk2fuJGEdv19KiHKPmCtLeS+4V97OPlOm63nqOBs6Ab7y/lEbvrFROZGxnIjp1oOvTO/G5jQtIti0W5fLJo90Yt8gIjcIYQz+MDm6SXnkT5wX64eZSOh80S1tTy02gqFeFQEn3AeIzvgYDs0EfNid71ouegQDnlhayc8gv/GQPmNMsrSVj8VTT0All3HbNctZt+zkfkfVOkLrQ3nyV5dm+UnyXsLCjhsvs4qPAl9nzjXAv8qbiiWgHCZzlhK+IJ/rjU1jfxMNHcE2TxoMODd35Pd1dMUPQhRxEMilU6o4KdXFF0Yoj+9AB+hP0Hi10Z19ossF1bF0xDYS+GZ1D/SF6U5CBmRKKn0wZg/45YXbhb0e09xP/FZn4+2ijwR4RJgEeL+HFfDnVfoBFHcIJrNjm2crfBvF9CCJ4rIsycklDSJtpLPzJWfqAguR6DrWCRYZ9+PDUPCpbfr/oBRf8MLlxXw3D5NUrSaMnD9HqTDEqCqdnBrE+EmjaQxmQdTizVrIEO4umUKYy8IsoBq5ym8j11AIBE5d/2GErQ7jhcBxWhUjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(558084003)(6512007)(6506007)(478600001)(53546011)(6486002)(26005)(2616005)(38100700002)(8676002)(4326008)(8936002)(54906003)(66476007)(66556008)(316002)(6916009)(31686004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhzSFhKQXpjYysvQjl5dEtqNG5wZk1rZ2cyaUxkZVFoVmtLeDRGbmlkZkF2?=
 =?utf-8?B?NzVIS3NETXpSYUNxSE9GL1J1eHFMVHBUcG5GTS95ZlMzMjl2VUYycGRjcWR2?=
 =?utf-8?B?eU1nMmExTlNseG9kSTBqSXRWU29OVzFMWHhtSE50S3ZIYVJ3RXhVTzVMcmk3?=
 =?utf-8?B?b0xQZll4djErNzhMSjI4NEZuYzdrRzNBcjBhSFJLb0k0VWtRRlA1TzdzUUdo?=
 =?utf-8?B?OExENFVtTU1LNVh0TDZYMW5CUm1zbWRMckpRQXc1b2FIMkd1aVFtWmhVNGJy?=
 =?utf-8?B?V3hkUUV0bmsrck1yeDN0aC9tUExCdmFtSDI4eHFQTm1HVFo4Q0xWQXE3TEly?=
 =?utf-8?B?ckhBUkJiTTlRSnhUWjRPbmdMMWxINjA1aDZIZWFCc2pCdGhIN214TUtuaWRO?=
 =?utf-8?B?N0w5blNPQkUxZm1hWTNxbWZOeHZ3S2xYeEpuNlBIV1FQcSsxcW5wZU1JK1hB?=
 =?utf-8?B?T2R1MWV3a3AyNXRpSi94RHp2YXVjM2tkbWpyOW5VdE9sVDc0a1pGQlM0Z0NO?=
 =?utf-8?B?L0xtKzRhY0pROE9CbjhMdWJkRVNMMGpHNEEvR0dNMFQvTDFIWkxnbmpqaUls?=
 =?utf-8?B?SXVSS0Q5TWhPV1hwajhWeDdERkt5Rlcxdmtnb1IyTWlyZ3BuRUViN1JoQW9C?=
 =?utf-8?B?SGJQVDY0bnd4MnZIamNwZVJmSisyYnNCekpweHBCZFF2VVZYTTA1bFpYUDk2?=
 =?utf-8?B?bThZQUpTZmpPRUo5aUpHa2pPUHFyKzUydjdaWG9DTzBjTlEvMlVTckZkVFho?=
 =?utf-8?B?blVDYlllamk4Ym9mbWNIaWM4UXdhOVBtaWhXU0M0QXNZZDFPZGIrWTUrMzRr?=
 =?utf-8?B?YjJXREpZcFlSc2NTNEVKRDgwUE1lWFR2QjhTdkpGQ0ZrYjF1ZU41M3V4UHoy?=
 =?utf-8?B?NjF1SW1yQVJIMlVPM2JIeHI3cDE1SDY5aSt1OUZJbUJDci9LeFQ3dFBiNjFC?=
 =?utf-8?B?cmRwK1pZeHkrZTBPZGJqcW5GOWZuZXZJR0I4NjdBQlZ1SEFESGR3UVEzYS8r?=
 =?utf-8?B?MkdlUmZxR25jeGNhRDNwa25SY0NHZHFDclplbHk2TkR3dkZwc2pIY1FjUlRP?=
 =?utf-8?B?bm5jd1JuNUwySkJBWmZRcmtzYVVzWjJGdmlUN1VBeUxMdXlDRXB3bkplaFND?=
 =?utf-8?B?SXhUYVBPSkZUTUwrbkUyZEZ0T0VoYWhDSEcyaWhXNTV0a2pOb0QrUS9DelZK?=
 =?utf-8?B?L1JZWVlRZy9KU2JFTkUvem1jNGRHVys0OEE3RlFncFJva1UzMEhYNXc4ZGV4?=
 =?utf-8?B?b01neldRbnRHWWJtbU9ObVlLUithSnR5OU9oZDdrbmVBZWc4YW5aTS92Zml5?=
 =?utf-8?B?ZWhSYzhEMkJ4Qm16T3BjWmlhaTBMNGR1QzNKZThnanJYZUNOTE9HZXM3Q0Rq?=
 =?utf-8?B?TFdJRFRseklKVHhYbGIrcFp4bnlZcEp6Mngyc29ZdnVlckxzVE5iSCtZNEd3?=
 =?utf-8?B?QzBaQ1o4MXhZc1F2cHd6ZjcwdGk2K3picmcyeVhlODhOR1Fodm05OW1lYWd6?=
 =?utf-8?B?TUNzcithbTBRb3BoQndKUXFEWjhSaENtbXA3cWh5RlE5RWtTKzB5RlpRcVA5?=
 =?utf-8?B?dU9UeDB1QkJmVXg4L2grblNHN2dPRGxZK1dCdmhpdENrdENvek9QVmxja3NI?=
 =?utf-8?B?ay9vc3hIZGIzc2lzaEFGbEhRRVBnWEpRYUNaTjIzeTAzNmk0U0xiVEtxN1BY?=
 =?utf-8?B?NFVWNW9VeUJLTXFpU2c0bGZXVFZSaEdRWmY5b0VWQkU5QVRDWHQ0QlpWQjN6?=
 =?utf-8?B?d1lNaWdHVDJ0NDFkVHNUTlRxQW9abUNtWFQzTFc5T0s3OEpsazF4aHk2cVhW?=
 =?utf-8?B?azhPbThzRGQ3ekFkMFQwQmhiNUxaRTJubjIwN3JhSk95amJaWjNTNys1RzRx?=
 =?utf-8?B?Q1ZweGN0akh4c3Eza2pmSFRTcUErYWtNbFJOazR4aHc0dyswN3lBM0oybk5D?=
 =?utf-8?B?Z09RVU1BN3hrN1R2d20zb2R2RTA0MjhSN25aYXJ0OUR1MDkvUUpaclN4ZWtt?=
 =?utf-8?B?TCtkdHp6ZzlwMG53OUZDR3NJR1pEeFZaanlISFVoM21rNkM3SkdRTnhabjVH?=
 =?utf-8?B?MlUvSjBiNWRsZytZZ1laMnlsNU9va01KL2dyRVdveEJlallPbVNaVWxTV1Z0?=
 =?utf-8?Q?58L/BH3zYON0T3UsR0RQq3hJ7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb49c05b-5319-45e8-96d5-08dbe9e4b487
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:21:09.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh28dL7/8mQC7LzCyzcziUJ7o0Y1HdSp5UMBMGT3+hLVz+iDqBdz4sp5FX4EY215duRoFV43vo7CuwFyH38N8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

On 20.11.2023 15:56, Andrew Cooper wrote:
> ... as part of cleaning up the types used.  Minor style and/or MISRA cleanup
> on some altered lines.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



