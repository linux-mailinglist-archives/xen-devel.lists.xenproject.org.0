Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC37F268C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 08:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637540.993429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LOP-0007AD-GP; Tue, 21 Nov 2023 07:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637540.993429; Tue, 21 Nov 2023 07:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LOP-00078X-DY; Tue, 21 Nov 2023 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 637540;
 Tue, 21 Nov 2023 07:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5LON-00078R-S1
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 07:41:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71074847-8841-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 08:41:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9656.eurprd04.prod.outlook.com (2603:10a6:20b:478::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 07:41:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 07:41:51 +0000
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
X-Inumbo-ID: 71074847-8841-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQs+PQo1oarl5RJhtew27/WXyDkWRJeQuP/v8NYeQTqWURJj9CSoXBsQgy5n91dskyZVlJ6AtER4CCwv8YTsAUdAckd5X1Ok312O74PnWb8AUHmbVLARDVGupOMv+Qjbpk8XpMNlMQcA2JBWD6pNI+5RVqjB+7FgnTHSx5vHesQ89pVqx/NeqgnfY5aULN/5NfzGZPz/JNeNjmGp87z3f6Dpp9Lc6h3OhlDCCKjdGTC2MJ4Q19wODRu0NiY0tHwaGPdA8qPpjNM3PhN1fW5yfpfXKKqVtjSo0xvlVWj9EQTmCaXEkTkSqUg6mcCGi2tPR5YZXnw76+PpHHNC0lPxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2loGK6MAuknY1tavKJD2NDfB2NmZ6S95sbqdNBb51+I=;
 b=HvqSEPTYpCG0aCQ+uzoA7awD86z4HLgHwMX2PBObQRhniMaUlUucf1iVE1h1ER2KsvyL5rQMnhURKnVRF+w+EpRlKGp3LhDekcrphCypZjvSFR8eqDiHUwlUoHSh9hCXtPHM5qy7GHllQvxbjlB7igWxXzXsmM/9Km+CP5VO+BI8s6pVCpWTsgj8HthqOkVzaTLITAyxqv6NiIU01pcGHiYLOHu2pZ5D0AIstGS5AwK4CRO/za7z8Gy6+phFC4uNZZD46if1DxWlFXboSHsPD5PUVJ/9iKgoQ3gDH2ZOjSYjUOwD6W21nt5DOeiQUeh3HnHXZ0DJ2b/LvsWFjCm9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2loGK6MAuknY1tavKJD2NDfB2NmZ6S95sbqdNBb51+I=;
 b=2+n8YMzU4XO3R2AR2afuBROFqePfpPsKIsUeLO1Vd11HJP9ywzBesO+opctF+8wufI36TNaLzBtpqsd2rFFMnce1OvHpZNktLmD0cUmM+fm2+sU9khsqYz7f+lCvpudCV80wLPNq/ggaJmJ0gWsJ+ZauYIfNgO5tCsOoVcBherGCrwYOaxM2R8dj6/eA6eLzpHVxvGUTCFbU1rkKCX+OmKa0IZe/ioCZQxzDAlD36qbFGlOGo9S/XnCxcJc+FJ1I+S3nJVF773eHw5Fo42xC06M5r5soO3mnAP5fWUew7GTyTxZB29hSzqF/tON29hLsUyiW164bBOnLdpUXO3rBsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7be04e2-8851-45f7-bf80-83c8d6f88899@suse.com>
Date: Tue, 21 Nov 2023 08:41:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: change current version to 4.19-unstable
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231121072036.12133-1-jgross@suse.com>
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
In-Reply-To: <20231121072036.12133-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cad30f-b7fa-427b-8fb4-08dbea6552fd
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8vI0XPxbuOUJVVMVMPIDGh25AXOqF86CgEl8iRrWX31hGxYaud8FFyA1luCU5o5Ftdm8pTFdaoECyQJiGDgNzz94xRQ4F8gKa+Ovtc/bt6dBoD0YgJ/csU9ht/0WEqcosv6WKI5jcjAbKRisMSifdVQ4W6t+cUTeVD96yBAKyqmh/iH3Ro8NQXtooL3VdZ7EiOE4KPk6nIZP339t7eryiD3e/lp4KKwLwOpiGomMt/AQqeMjbG18JTpT9IOAu/1vtviHMAWuQyKMSY+hvOE+xGlYKaQZ8Jb+Oazcc/XdIdG/aw9HrtklOFlxLdfP+G3inIiA93KEYAUXKZ1ONWVkXzeRX64cEsv+ZVr6qhkm72F/ihW0CUjOU/Dz6cYxoCBMTk27EQZLHrmZH5M+mcPyJHpPVIJynNOuBCJElHHWsQsZYC2ptIDQhAG5MGI5PBRGicjLnq8hUxsvE6+479yePVVDg9CJtGzv/bdlkfvS6/Vzt1Vn1YjBCGR8sQ9bUXomJoV+GJxqqsJa8MoV7E1lJCKcCNrw3wwC2qg/5mdOj/FwvOfufM9J0536I5jhup14ZeWlqG93LlMpH30s0yXHzZjFauO3c60H+DPzeGwqe3C+lAiMdMtuqxeQaj+kE7iLtTZAlvZGHFGqeecZV7fydw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(36756003)(31686004)(31696002)(86362001)(6512007)(6506007)(53546011)(6666004)(2616005)(478600001)(6486002)(6636002)(5660300002)(6862004)(4326008)(54906003)(66556008)(66476007)(66946007)(8936002)(316002)(37006003)(8676002)(26005)(558084003)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3o1N0tzMU4vMEpGRUlxYmR4cHFSU3BGMFFXb3BtSG5aUVdjWHhzRHluNGFH?=
 =?utf-8?B?akNSaEhNekxkdU8rYVkvczNQTGZ5UWlTUTFOd3pGYWxFY2tYdjdYVDF4TzE0?=
 =?utf-8?B?UVpXU1VPZDZ0ck1FNjFZdlhjNVhsWTEwOERZWFR6VUdubzIrK1lTSS9JL25N?=
 =?utf-8?B?aUJ5NEFPT3JqNHRuZDFwaTBOcXlRUStpNzJ4VE9DYk8wYml6V3lXeXY4TzZl?=
 =?utf-8?B?ZC93bDV5VmthZDhFNTZuOVB5TDFpZlNCamUvRUJnMDVMR1dBSC9PODAycklQ?=
 =?utf-8?B?Y0IvOGd6OVkzcEZIUEEzeGM0NnVmNVVZK1MvYWM4bjdxQ2FjZ3krMThyc2ww?=
 =?utf-8?B?QWxocnphTDhVekZSMEtSYVUzWmtPVndCLzJhR2dEcmd6Z1dTY3NKYmF0dllJ?=
 =?utf-8?B?dUhCakY3ZUFGN3c3aGk4blFDNktaQ3Q0WUd2Mnd5RHlOVUw2d003cENsdThH?=
 =?utf-8?B?QUo1Rm1HazhTdGdoOEVEaWxmdjQ1T3Zlb0ZMNVZ1LzVPamh4M3RUb1VoV200?=
 =?utf-8?B?c21yWnBZaEU1VnFQa0pXR015NDNKdXIwUDFaSEVNaWpneitrUmpIY2hIZTMr?=
 =?utf-8?B?QzdlakNBcmVyeEQ1cEJPdHVjY2piOFdaNENyL2UxNmtmbEczRkZ1YkNJelZX?=
 =?utf-8?B?a2dFOVkydS9KNzk3NjVuNkZvOWk5Qm9nRjE2NVZNK2tIdnExbCszWEJVYmw1?=
 =?utf-8?B?eFpjVVJWRVJ2UThYaUJKSUt6OVIwZFZ3eGgwZGpSMGx1NW9ZTjZzbU9LdkNQ?=
 =?utf-8?B?NVVBMGkwUGkxc0ZFaktjRUFlOXpNUFZrN1M3VFN4Vjhoc0dzb3FVL0J2SE9s?=
 =?utf-8?B?eEI5T0h4U2lkc1NPNDlTSUZpVlB2RldYNS9Ic1VWeWxNQTdqbWx4dHB2YXA5?=
 =?utf-8?B?bjdCRTFtQjUvbFZHVHJtNjdxa1lwc0FyQkQ3TldkblE1ZGVkazgwY2pCR3pD?=
 =?utf-8?B?Vk9aWlF0OHJXbVpTQUd6WkhMbEsxUDRpNjJncmorZ29URnhFd083NmMzV0tt?=
 =?utf-8?B?cis5VDBHNkxwYUZxbVVVemtTZ2hXaUZvMkkrdkNnMFVEVVk1TUh5RWRIeUJZ?=
 =?utf-8?B?WFg5YkhNMzl2RTJUYWxTSnVVQVVDNVo4Qmg4N2xleGxOZnhEZFZ4OFhiMVhz?=
 =?utf-8?B?b054Yjc0UjBVRWRvdGhyZmNXRWw2R3RqdFFzUTgzVStWN2hiMUY2TS9HaXEy?=
 =?utf-8?B?SVZXMDRWVmxaQmxKSWVYcHhyTUpiVWJxZUhJN05DcjQyR2I4TEgxWWUvNkIy?=
 =?utf-8?B?cVNUK2gra0lBVjhsa0FUYlNBUUx5RDh2RzZQbjB6VGZSY0tRN25aT2lDdHVh?=
 =?utf-8?B?bG9MUmdQTlROYXE0NzZzL29NMnFJY1RiV3VScU9GRmpKc1lUVXltUEtjNklY?=
 =?utf-8?B?amdBbzdYVnQxQ0p0WDdMMzdsUjk2OUtNZ253b05vM0gwSjlCRFVETURBUkE4?=
 =?utf-8?B?RkNRT1h6NUI1TkZMb0lseVF5WDJnSHNIVmFaWGt0NXF5bXBueW94SWNaZzFL?=
 =?utf-8?B?ZTFQRUd3VEZPckR5Zkh6ZHFEdmhWTFJIK3FIZ3M0QjNHOXprZzI5QlNyRFJD?=
 =?utf-8?B?dUxUYUpTTHFkcTdGTytDY3lqRlpuV09rUnZaZEZjMSt3N0lSK0JUUWtlS2dj?=
 =?utf-8?B?Z204S3IxT2taNVZpcm5PUWNwcmNRb1FtNzV2QTI0ZWVBWU9DVzFwVDIrY1lv?=
 =?utf-8?B?NnlzcEtnTUFuR0w4cVQybzdnMjgvdXVBV04rUk1NelhUNElwSjlVeTRGbXFG?=
 =?utf-8?B?aEpqY0ZlVXk5Ukk4Q0hMUUNKLzlqdXdLQmpPRm5xMDd2U3Nobkd1ckhielhR?=
 =?utf-8?B?U0lldnB0UGxWWWlyWXRleUllbS9RS21NNWNDSGdzOHVSV0UzR0txZ0tqMlgx?=
 =?utf-8?B?UysvcHVpQ1VVRkxhV3lVbzNCaGcrRE9OMXdEWWJzbDJuWTBzSC9EeXdiRFVk?=
 =?utf-8?B?c2RWV0EzVWxwalhYSitSWHpXSzZsZXZVUzI3UGU5UGxPL0hDdkxLVGVlQ1JL?=
 =?utf-8?B?ZXYzSUZHaXFTM3htVmc0ekRmYko3MzZXaGt6QXp4SllNUU9hbkhSQ25FNFhk?=
 =?utf-8?B?b2ZWalBtVmdFTDE2ZG5QZmQvMGVYOXJ3R3JpN0dMSFN4cUV4aG1TZ2RoTUhx?=
 =?utf-8?Q?4MJSR2Ccvyr4tB8+H2tfhMGdC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cad30f-b7fa-427b-8fb4-08dbea6552fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 07:41:50.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BrCYkkL80F9KgjbbtAeKalOfdz5aVAeMyXKGToYtVY7/vBMbAY11YsEEWPXvc/8HLFhpPVzp3V8a+EHa6TgwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9656

On 21.11.2023 08:20, Juergen Gross wrote:
> The version in SUPPORT.md is still "4.18-rc".
> 
> Change it to "4.19-unstable".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Presumably something missing from some checklist.

Jan

