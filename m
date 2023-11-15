Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D367EC03E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 11:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633543.988433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CoP-0002cP-R9; Wed, 15 Nov 2023 10:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633543.988433; Wed, 15 Nov 2023 10:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CoP-0002al-OB; Wed, 15 Nov 2023 10:07:57 +0000
Received: by outflank-mailman (input) for mailman id 633543;
 Wed, 15 Nov 2023 10:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3CoO-0002af-9P
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 10:07:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7ad829f-839e-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 11:07:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9152.eurprd04.prod.outlook.com (2603:10a6:150:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Wed, 15 Nov
 2023 10:07:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 10:07:24 +0000
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
X-Inumbo-ID: d7ad829f-839e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJK5LtppKf0JDQ0eTsBkSQjAXpczLZHYHcLhpBYAAb+2xrzSICrXMtymQQ4sF2x4Q63NASctSue9ApKW2/wGEpQwEr6G6v0gUIdG1gaiAtRZlhuPoYUyXB80WeFAnwsQ9KtHskaB5hYZI+Q9tC0MDcvlqx7fAz/2IWSkZkVZoCTE++BW+pAgotl09/jgSiJFnDsh8xZ0Ud5J3awXHALFbTSnTAkxswoNsjqTXbSt6MukkuF6ntBTUCAOzB2ytqL1wGgX/egKy+Nor+q8OKhpO7fZJj57/FcHPaFcG7Wxw31nW+m2weSrFr1L990vYyrNramB/KXzBZN/dPXHKWUkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jepqKL0Rp7TtDJf/A2GiYq1pqvVyCl9ezQKa+oxCACc=;
 b=BOz8IvJsFq4SJHGRNg51Zcdo9Y62PcmP3xBQ8Yf4o3J6ebOjTMhXjRSObV+zT4xU4fO/+Cuq01UGyq1f0lwShzg9zuyZjoVSO3bq2Oj0jUVGbjYWQGXwKXfDUC26+bIICV0QSSXqbAT7Yb2u6wpn38YmMqcA341IAcVQtwaWrFnZW1Ib8A5lqhebeTKmvx6wc4BDiArNkEZjDEvyBuOP0ZN8FmsDAeCsraS38rq3ZWM3Drn+VDK0oRYP+xa5yGLAwtkdxU6aM+EAutZN3xgSHI3RiEu2tzzZfX+CVo4SkUkhmGagMgMHOlHyWNAoasNPSyGOzL/aDjOMqhEhIrmcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jepqKL0Rp7TtDJf/A2GiYq1pqvVyCl9ezQKa+oxCACc=;
 b=q6QZkPc8elf9qUD0rgNDDOdaF/3oqQOqExYgJghmzeahTseaAiWKIZPIVBpWUt4URvFExzYazrL7sSh45BXQR/wZDDVKB93UhTCwyMWqPEWskr269JAD4RtoEIXXkks2rENpIyJBgnaepGXdoWGmoGNF4do9kvdq2QdAgpSAa++w0BnDGf93WJcRfTXgbQy6fjMI4Qwvu/ET+t00ZII2iNs+AFJFyeVjNpnB7nCRp/IIzIKY2vqRZ1QSCz9VEa8LjWcxv1gBQgjlpFDlmaYtyLv63P82QrOqcHH1LOjG3yTK2tgZsHgQKGZRo8BZwJMGIQ6mbN212kXL3I/EeZ7MCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <242781b1-9693-47b9-a3f4-bdf5700803db@suse.com>
Date: Wed, 15 Nov 2023 11:07:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <1b50e70d168a1b084ac40711096c38abe44a7b9d.1699633310.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1b50e70d168a1b084ac40711096c38abe44a7b9d.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e7c8e5-413e-4ca5-ca99-08dbe5c2a9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	utrnlLGTYy3m0uHl+1HxEGqWpBn2vRHLaTaDUetm66sDFjJuXd4MBOfrOFvo6jssRRNYUThrpvZzj+PNMhO+ExCsB0vFutvJavNyxdsVJfnQK9U0c/tBm8yPZRCU5zp28IMYqZUKm1yzkYFkDNWsb7azcwTAAoda7NNDbxwdMsKQIA4s38H2MyzF6EWwA5eqcaHQcEvRxS8WkKZshWCvpzShjGZUbGVFNTZapH8cGvNuSLbtWmDNp1k3dOS1di70F/VHfelWQubblClmT/GIFbXRqFw+ErymF2l4p/6bwgHmD2eperKZMLlTR7idDbmnUBPC4sXcmG/zMV0W99pAehTe8rOiL1rJA6DFRU+rUcFQutBnAWHhwyq+163hnqnxg7eowDprWFfbHg0cc1uyxgyfg5af36V3gayjn0wUbr4U8YSV3cWOP9ADVwagWpaRl4X0Rlgqs44gF0KlQTgMjGhloZ9dSeqBQo6wKpIYLsQANhzsLNwhHUeETCSgbDxiKePQPeAZhs/9aiRseWFJhtHYNQFR07PS+YXiNPDBceU4b9hIUWpc48U4B4xCJOw4pMph7TnkHAmVajur0RVMeyOGC0mBnKBPxf3P2IO6sPbBnW9AQ3tf8DrteiAqBGYXO1pjMfE/S96ZUMxNtnyng7YpXulwlECSrp/0naspzrvHQ9ElLZOo8FO2St8ftcYlY5Avgwid5Vd3bxA6N8G/Gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(2906002)(5660300002)(41300700001)(38100700002)(53546011)(6506007)(8676002)(31696002)(6666004)(86362001)(6916009)(316002)(4326008)(8936002)(83380400001)(6486002)(478600001)(2616005)(6512007)(66556008)(31686004)(26005)(66476007)(54906003)(66946007)(41533002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVNXaDF4V2QzWWRKREJsS1dPRnBxdUV4SE5KNy9QTlhMTjFRK3hRNEhYOE1F?=
 =?utf-8?B?TWNkSGdudEIxcm5YNHZ6N2JwRTgxM1dlRVlsRHZSS084ZktEUHBHZ0lIMWZM?=
 =?utf-8?B?L2xjbEpnc2hwNkdxTXF0Z1lMd2llMzN6ZHVwZUV0NnZ1bXJWNkIxUHZ0b1VY?=
 =?utf-8?B?RGVVdEQzNnFuTU5HNTlEbmduTHVqUm5NWFRHWWVGVkZmQmdKWU1USTljOUpv?=
 =?utf-8?B?cHJlakxuQkJMdHc3bGd6YWNDdkhwcVlaMlJ5NzFsaklxaHJ1QTVyVVZrVHJB?=
 =?utf-8?B?MndyQlhwQ2lXSGROeExMVjJTSUpzeVkwQXhZb2xuM0J2WE9QSEMxQVhXYnRT?=
 =?utf-8?B?TVVrTHhYcXlvT3BwSGp2ekJSU042bTllK3gvSm1aL1kwRElBWU5WZ1BLUk9i?=
 =?utf-8?B?bXNLVThXaFQ3am14UEp2QS8yc1ZNNnVndjU4elJjaGFDWnNnb1p5eUxnWjRU?=
 =?utf-8?B?cVNpMmN1T2xOa0VwS09NYXVSbmVYeU9iWThneUJGSEljTWh4aWp3SHRIenJO?=
 =?utf-8?B?RWFTNGhkTHE3N3htMGlIbHZjamFNYWpxRnIwdkduVDNKRnlqYlFvM3NxVW4r?=
 =?utf-8?B?VlhqWmNqa3Q3c1FvUWtmdE5IWlc5VmllWmFPUFgreU5CcVNhL3Z6MWgzR0xj?=
 =?utf-8?B?QXV4TjFlNW41NmVmQTJoTFlhREtEQjRONzd0RXZSVVozRmxkdWFVN0k0SGcz?=
 =?utf-8?B?SUd0UndHU3ROYlRQL2xkam5GWjJrYkZkTk5aYThiUHcvVnltZ29pSEZsNHY1?=
 =?utf-8?B?cXNjWXdPTkJsY0FpcTZDUURJWWtiTXp5MmRGWDdrZHlmLzBZc0w5bWg5N3pW?=
 =?utf-8?B?K1Z4cDhxcHdBS1JoRnlEZ3dmVzJLY2MzOHo1MGFkeTNEc2VKelZHTnExdFBB?=
 =?utf-8?B?ZlNPYnd6OU9UdTE3c0hhZVJjU0pIUkdwU3Q1a1NCbXRwQ2hKclBGZ3Qzc2Fp?=
 =?utf-8?B?NUx5SytyMUtkWXVzcFJhZHd5ZlFHMzMrOWxXSk5kb0xlY1VRZGpWaW8veS9W?=
 =?utf-8?B?SXExWXRLYWIzZ1BWck5xTnpoRkwzMTR3R3pJTDZDTlJtSEQ5V1M1ZEhFejlV?=
 =?utf-8?B?TmVWSGkwazFia0Z2Um5lalRKME1MQ3UxTWpod2NCc0luVUx1QnBvTWxodW92?=
 =?utf-8?B?THl2TDlOcW12ZURDbG9KRUtROWN0VlVlWENKZG9TNjBrNkRSYzFxN21NSkFs?=
 =?utf-8?B?TzdKSzEwYmRRWmcyNWowRWVlcWx0K2ZvQUJZdkVQTUJEQTd2U3IvRW9KZms5?=
 =?utf-8?B?WkpsUmdQV001RUJ2Q0JHVU9YVFRjbERKY25OcE1zWWhFdGZtWVZSN21TSUZR?=
 =?utf-8?B?NHF3U0RRdzB2aktvRURNSmpzOExKTldOK0lMbVQ2YktDS3RnZ2NibHVrRk9N?=
 =?utf-8?B?MGswK2ppdWFxTVhMcUxsNnRaSVJqYWtvZFpiOVZ6MW91WXJXOEZRT0krU0Mr?=
 =?utf-8?B?Wk1EaGVlWDlNb0dPaUp3V0dBZDZhSTBVa21scUUxc2pudGdtYThXclNhMGJ6?=
 =?utf-8?B?bVZrSHRiSWdJSklXdE1QcEVUZXd6NWpvcWR4aG93MWxlbWZaQnFoNzZKcFU3?=
 =?utf-8?B?L2NETDh3TEF3S05tY0Z2SGZJbk9mdVdqK3VIZ0VaME8xZHd0WWJEK0h1MXM4?=
 =?utf-8?B?OGcydk5sVUd3RHNKVjAyL0FSdHdSNHRDR2d3bkMwNjFEYTRVOVNtR0hyMHV5?=
 =?utf-8?B?L1Bmcm5pMHA3MWJmdlZTUkExQ0JKb0RLeEpXUHhUenpsUGtWQW8yR1VlaDEr?=
 =?utf-8?B?dFYrbnprRS90WlNicjhRcUpFVU9kekI4YXJ6aFkva3laYkJwL0VWd0pjSFdT?=
 =?utf-8?B?TDdZOHZqNUJiYjUxdlIzZGkwbmZJOS92b25tSVlNWFRKSXZVZEg4YzhzTFlB?=
 =?utf-8?B?WlJXTFFuR1RRU1I2QVZFbDNtOTVQdXoxL0tsZEdJZlZzY0lETy9iOFl2VVEx?=
 =?utf-8?B?VFVvL1FXUDZwWC9yNE9URFpBNXFoaVJnOER6d0pGQXVJRUVMRUhqN1pEWGYv?=
 =?utf-8?B?dnljYURFZDZYSmFkZlk5V1FHS2ltbFBRSzdHdEtKQlh6OVdHMGUwS096aksz?=
 =?utf-8?B?NVNUdkFuQUZ2SkJZbXFaTy9Wd3NodjJyTjhaeks5aWgwNGRQSDhQeUhDYzFN?=
 =?utf-8?Q?F3c6X7WyTYhj571oXIqeLkTnb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e7c8e5-413e-4ca5-ca99-08dbe5c2a9c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 10:07:23.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VomVrQBaBjQSMHztwOxb1FGPyGuMlnqhdHHELIaVTmhaFYKle8joak6Ns740YKPdoUoDVc7xa13EkBy4oQiObg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9152

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/numa.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARCH_GENERIC_NUMA_H
> +#define __ARCH_GENERIC_NUMA_H
> +
> +#include <xen/types.h>
> +#include <xen/mm.h>

I'm afraid I can't spot what you need these for here. You clearly need
xen/stdint.h, and you need xen/mm-frame.h for mfn_t. Yes, max_page is
declared in xen/mm.h, but its questionable whether the header needs
including here for that reason, as all uses are in macros. (We aren't
anywhere near consistent in this regard). Plus you don't also include
xen/cpumask.h to pull in cpu_online_map (which another macro
references).

> +typedef uint8_t nodeid_t;
> +
> +#ifndef CONFIG_NUMA

Isn't it an error to include this header when NUMA=y?

> +/* Fake one node for now. See also node_online_map. */
> +#define cpu_to_node(cpu) 0
> +#define node_to_cpumask(node)   (cpu_online_map)
> +
> +/*
> + * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> + * is required because the dummy helpers are using it.
> + */
> +extern mfn_t first_valid_mfn;
> +
> +/* XXX: implement NUMA support */
> +#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> +#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> +#define __node_distance(a, b) (20)
> +
> +#endif
> +
> +#define arch_want_default_dmazone() (false)
> +
> +#endif /* __ARCH_GENERIC_NUMA_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


