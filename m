Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDE7EA197
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631846.985555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aJG-0005cn-FQ; Mon, 13 Nov 2023 17:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631846.985555; Mon, 13 Nov 2023 17:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aJG-0005an-Aj; Mon, 13 Nov 2023 17:01:14 +0000
Received: by outflank-mailman (input) for mailman id 631846;
 Mon, 13 Nov 2023 17:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2aJE-0005ah-Fw
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:01:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cfb2c1c-8246-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 18:01:08 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Mon, 13 Nov
 2023 17:01:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 17:01:06 +0000
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
X-Inumbo-ID: 3cfb2c1c-8246-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+EXigJSA8AtfDkyqX7R9NyhWRDCdux/ikl/9LWMpWFnxCu7E5JxTrlJA6BtzzXYy5dYg+blQoPIA+JSWkVu0ClchPWqbwkpWR03+7SmZ2zY6kyYsHxiyah+RqpDwnmhEQYh9MTH53OPY3htqJbdFnC5xO/hA1+omzgQdIQ9m4XvDN/tb62lKbiJY/VEK0fXIkp51Lchr5h0fvWqgznqKbGfJ+cDGe0glo8otNyEoCaS+vzkjyQT4qazKXuadBvQJhllypXy5Y9q2XAtoPR2GMwu3yv+fDe6PDgYa1XRgbWcJDH3O+gQ/JVsyeHq/jJOOeAr80KdRLdA2O7JepzqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn0uDYeYndmWvOBsGFJ0hLiRdKEfE0AcIsktxhhwJVs=;
 b=LVkzpm6+gGlLBrDhtnL4HWNHoQYjS13f0nFlYCaeP4exAC6z4xn3x7sk6qkN0QLl3nNq6Hx8hoLxwuBN5GEkaLQm7qJPWehMA6osCOB05VpfbBV4up77p5oWO0o5jin08G8/2rsT+buFAyI6Y6/LUYTf/AyYW78Klm2JsEeC1jkDx/zQe6o7u8z/TrBMmaG/yS2kZ82M2CeAbj4PdhTUNAQGt4+HMVfpBE2kJGTdbbyqu5DeldP6JsjXJR2tKnbKM0lb/PA0JoOqxt6qO0fe0zKUOHcuJ4K1UI2NZNU0Kf+KtxoXKdJRrDyfdWYV3pmgHDxc8Sy6fCCnyCKdGZEQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn0uDYeYndmWvOBsGFJ0hLiRdKEfE0AcIsktxhhwJVs=;
 b=nLrqfv6rQcpMdQNt+EImmTEJIV3CSjfWuo6upj1USDeKM3+deYybTwYIuXY9Q0yy+nR70n+N+qz52kIpfvMlGlsIkkgP4Pmd7sEHj9fqTRQycabnZ/CjXcYdmWf4C49DMDnC+bNdefe+83yR/HEYNK9iRo/u5ZsKyhjYnO4rymDL9Ur2YcHB1rhiGIzNJqc8yPUBAwX+enSyoyzyfjlLvp5jwimanJh/zUtOT+YkQ5WjS9o9cZsFVa+JQ5hK1M223abc85bzV+J/naleO8mzrL1pMT8bHaU4vACf/Uej+vn8tJhB2MiCWZ5oasq4liKuZ3mvpEluvBcB9UYgGDOxdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6b6d20a-cdd9-7502-a221-7b24c6d4c584@suse.com>
Date: Mon, 13 Nov 2023 18:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/15] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <7ab8ce9ca633a5a7e5212d0acc62d6e1d4688ca0.1699633310.git.oleksii.kurochko@gmail.com>
 <e66e60744fe517c09ea16efc69cc329443025ef1.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e66e60744fe517c09ea16efc69cc329443025ef1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 07df1c31-c435-45a3-4fd6-08dbe46a200b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qijPj7UiedTYpGNjRkIe71NZHxDvQqAk+NP4vFXuIyBPbOb5rbXDfRxwRNfO9z448PZw18rh1p3MrhTvVpTv1VoG4qzvw6p5u3SUncROUkiBww5U93v9tZSr7ng7m/Jq6ggRJuihgK1OB9FfQ9B3R+VTi7fbVgEved8N4IIuVuvwPbBK2CqcBVZDQUIvDZ02oZBBqFmzWApgnjoA02WU46DtkwE8AasYBuiAVVFYgOSkbKBeuUSqKTUJW+Cd1/RDkEmXHdODkGVRNmyqd6tIQEU/ytUSc6LtO6p+N66hQ0H1jQpS7TrZz6v7S/V2A7FYeFM108t32wUh/wWHC5Ih9JvSgiiDQEmxs1nc+GcCjw8zdSAJhjs4JQcSfpFtrWPuf4fp3MoJYmrUM4hNdvUsVYlaNXiDq/qWLR6zvfIkEi5qF5zPOTShheictbSSXk4WAUeQ3eqf343SAywv0MPTUbheRL/LS4EWcZ/1whmHlDGFIO69A+PvDfWWS54SoAwRsB231hABbSWjDvSozK+eAHJHtil3ECKtzV6zRH5S09AMw7JTAwVwqb4WgwB/8w6F79MluRMbpMrFvLbtMhrXM6MVWckNAhGpmgmptaAB4jkfEg5irqOWk9W/Cove9FvM3lxmiD1e8fo+fOZzZxrm177jYSu3GRYfrlDkam6Wmms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(966005)(6486002)(478600001)(66476007)(316002)(6916009)(54906003)(66556008)(66946007)(53546011)(6512007)(6506007)(8936002)(31686004)(4326008)(8676002)(5660300002)(4744005)(26005)(2906002)(41300700001)(83380400001)(36756003)(2616005)(86362001)(31696002)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJtMXdkby9iMnJldW9sWWpqckoxamZNVk5qZnNiQU82dVg0aUhkTXAxb1Vz?=
 =?utf-8?B?NG1XU0doMDhXNWtmc2lKcWJzODZMRXhxRS9VZGxaRTRzd01oSkJmdmhwcyt6?=
 =?utf-8?B?VXFaZlFEWFVjSE5aYW42LzRyU1N0SWlIakRCMGlEM3Q3T2Zjdk5WQ1FLaUdn?=
 =?utf-8?B?NnlsNXVaWnM4UkRweVdXNVRKdnNxNnI1MHJpWkJ0L3ppeG1TS0I4V0tlTmVW?=
 =?utf-8?B?UTFrOVlPQWRYblQyMmgwc3ZKRnpoOTNPYmREUGsrd0ZpVlJadXdhY3d5QWlT?=
 =?utf-8?B?MzJIcWlnTVgrVk9jNmR1S0lYM2tldmxMZjVZZ3A3UCtvUjVLRm1yV3FCTHZn?=
 =?utf-8?B?TXJDZGpYYlEraWtsZ0ZiUTFnU3pCWjNYTlpPTFJHU1BDQzNhRXJDTDRwWndR?=
 =?utf-8?B?TVRSN2Z6bDE0REhYckFsd3BzelBIMmR5VlF4dWlZNU8wbEpIaWxNOVRNOHNq?=
 =?utf-8?B?OEJ3MUQ5SDRYZmVaajgraExyN3Y4TmoydDFFZEM1TlBOL0pLT2x5eVhsejdr?=
 =?utf-8?B?ZGorRDZBR0d0ZlFuRjdjVzVQT1pLOGkzQ0lCUnc5NWRjMHRpOTc5K0QvVTJU?=
 =?utf-8?B?dkxPTFU1dExtOE12R0lJdzhCZlFKazhTV1FpeitBK1ovZjliRUhqZmJZeHFO?=
 =?utf-8?B?Ym13RUk5U2tIWEJ1b21TSGdCakgwUmp1YWdWU0dYNG4yU2RKbkZ3RVdxYmxY?=
 =?utf-8?B?ZXlkbTZPYWZDckFEeUVJdFpXdlU1Z25Wa09xdDZHYURJSDBXRC9KajZmUGNJ?=
 =?utf-8?B?Qk1XbDdPVk42RnQ1UzFpRm1NUlNvTXlJdUw1cElPNWFSTU0wYzBsY1ZyVmtM?=
 =?utf-8?B?c2lqVnZMMGxZclhhcVRhaDE5ekQwd3ZLN0haclY4MDRMalNQdWYrZVZFalZp?=
 =?utf-8?B?ZEtiTHRIOTZEVStsdHBtSFZlVE9VTEZ5QVV3eWtHMDgzLzRIOHE4TU03NG1M?=
 =?utf-8?B?RWFXNzY1dFM5MXN5SC9uY3ZtKzF4bjJ6elVSR1k1anlHcnl0TE5YT2dwVlZG?=
 =?utf-8?B?eHhFRmJ3Z0x3cXJMOVEyZzJjbTYzTFJLeHp0WW5pZU5kR1NUaWNFbkxVTDBK?=
 =?utf-8?B?S3ljQWdFMFVzcER4VFBwcEREV0M4SjNsNmxDeXhzYVMzVmw2Uy9XVnYzWi93?=
 =?utf-8?B?ZHBUY21qblJlSXg4WXh4M1ZrbmJCcEFjUmk0NCtHb3BpVUorekJKaXNPTTgr?=
 =?utf-8?B?aER3b0RHQlhRRitpNmEzYkF6amVpN1VNYStBd3Z6WTVVUGNkb3o0UHRhVys4?=
 =?utf-8?B?L1JVV3IrdVNJVHhyZHdvNkRRZ1hrMnhJMkU1c0UrUjZOWUxlblAyakRTa3FL?=
 =?utf-8?B?TXNmc25IcmNtZW1hem5zYzdJM2RONWcraWdWaWpZeDF3NjFtWkhqZ2ptV3B4?=
 =?utf-8?B?SUUvNFEzQjBjNFhUdnQ5THRYaStQdVhwZkJ3VStyMkZWSU5hNFZUM1BHWGw0?=
 =?utf-8?B?UVh6MHh0ZGdDN3ovckxFUHFnN1NoY3RBY0hNVldmSUFjU2g3T1Y5Y2szblBB?=
 =?utf-8?B?SEtja3hIYlBnbVJKb1ZOSTVNWExLNlYxZGJGaHZmVEFmcmJqZERGOGJJc1Fz?=
 =?utf-8?B?TGMrOWw0TlNNZEh4blFrTUluVFVtemp6Nm1tSGpvdXF6RWVuYVlFRGI5b0Nl?=
 =?utf-8?B?YmV1TUVsYnBvaVllWkxPeEh3RmhYTGFPeUFGK3JxN1BKN2duVlRxWExETFNT?=
 =?utf-8?B?b21hMUlMZS9oOUlzZFk5WGdFdGgvQ09kcERiQ05VeHNCdEpyK0Z5UFl2R1lz?=
 =?utf-8?B?K1RwVm91OHowK1M2dzZzWFNhdTRDRDNtRkY0YUtpRUt0SnRUcndYMHZwcHVj?=
 =?utf-8?B?dUE0NnF2ZVNxekFJb1c5QzZ2Sk0rN2w1c0dIZWk3T3hsNkpXemhlQVJmcllD?=
 =?utf-8?B?eUUvditjU2E3OXlCaXFKYnZOM1B4L01zTExHZC9sQVhxN3htbFhvQ3gzNmxG?=
 =?utf-8?B?UUQwRzdzYjkvK2VsZlZ4c2RTT1FnZWZGWkk4N20yeGp5eTM1ZWNucUZnLzA0?=
 =?utf-8?B?ZDhGTzIxWkJVR0pGS3E1bFl5RmpCcEcvbThOTFJaSCtEV0s2NEdiMXBBdzY3?=
 =?utf-8?B?TlJXaEdsb2ZOSmVqWGowdExtNzlRajFPVWlRaDhCcGhyNVBVSXQzTDBKVnQv?=
 =?utf-8?Q?RfvmI4GwMDtBcIUfv9LO1xId+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07df1c31-c435-45a3-4fd6-08dbe46a200b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 17:01:05.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUdQjEJbtCFjxWHyiqJHyVIbzC0zz8NI9t85XMxg5gZQHBSfz0z+RYxWQzMedm3kWcvY9hW7eVUPBdBsEgBdFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821

On 11.11.2023 11:24, Oleksii wrote:
> This patch should be reworked as it fails Arm builds:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068867920

Took me a while to actually find the error. Would have been nice if you
had explained what's going wrong, supplying the link only as extra info.

> It looks like it is not possible just to #ifdef CONFIG_MEM_ACCESS.
> 
> An empty asm-generic mem_access.h will be better solution.

I remain unconvinced. The issue looks to be with p2m_mem_access_check().
One solution would be to move that declaration into the common header.
But there's no common code referencing it, so Arm's and x86's version
might as well diverge at some point. Hence from my pov it again boils
down to Arm's traps.c including asm/mem_access.h explicitly, to bring
the declaration in scope. None of the common files really have a need
to have a dependency on the arch-specific header when MEM_ACCESS=n.

Jan

