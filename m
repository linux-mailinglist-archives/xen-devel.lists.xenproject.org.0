Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1343680722
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486620.754009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPGC-0000n8-SA; Mon, 30 Jan 2023 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486620.754009; Mon, 30 Jan 2023 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPGC-0000kW-PR; Mon, 30 Jan 2023 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 486620;
 Mon, 30 Jan 2023 08:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMPGB-0000kQ-CG
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:11:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b04839fe-a075-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 09:11:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:11:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 08:11:22 +0000
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
X-Inumbo-ID: b04839fe-a075-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inXnDK9gWOhxeL3W7EgTIcjJxHtdVmKr0K79BjATXFOFjVTilTI/Gnbpexol2Qg2HyNkCPoEZJLZCwfqKTn+UaRyKZKS5OOK/I775F+CXWbrXChv6Ybr8JrNz1vSawLJLpF8u+KeV7hbLyvItQ6JLcrOtPOxUh//L5HQDn0Fyqw5+Rv+xsXGx7ZyJhx5E0DH5uXBB7SjQ+94OJ31W4tnsrTEzU6KZmuME8dGbtsegdSWTflBRacb0vpNj2Z6jcuB6kZN0NcMmBM0n+znSJDNnBTdTU+8D3ATEs97pafLlHaNGM64EaNT2hB/S/l+sZAY2ZqOD2j/AYKHafP4vL3lEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYG/MPUoOhkYDW4nIF++KsWNArgHFC3Xi/Ub/Kx07fA=;
 b=SHw2OjJkxzx4B33KyZDgvUOM4a4I02y/dWd0CiHs1CADDNWxf13VZwvBs6AXScByz76ENXB0NHjqMVOeFX2pmTuZtkWHIpdzqur1e5DexgL4lTgakBQAhcjs9Tiwxf1ECB9XJMR2iTuMPjFkV7aPM3x9gKbPJAAiBXP8uQN52cqEa2oe2YZ+6ecQSv3KlxG4uH7xK19Hqfifl5362esUfYv72yUqQ4ktf1iqu2KO8/ZfO2f8KOlmOAdymI8bKGS1bFvsAGjTEpwwm0opC1nWJeeB1Z6dR27G+9rlEfGLcFpjwJJNawhrncBvBz+8vAresVfYCHSalhi0I4Spa1I/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYG/MPUoOhkYDW4nIF++KsWNArgHFC3Xi/Ub/Kx07fA=;
 b=JKdMGg8crSbZ6gPVF1K2Q15m3fAC31xzvIOzXtkcydLVYZ3vhqzLxrz6+usIZhsKf9Z0UVeyAPWJoMnjSu9Mngpw8Phf8atlsbsPzinsy3DWtvgd1kRz4MpQv6geJKDZnvuGPINsdR4sDW+/AMqZc2TvX35tQyUjmfrwDWmJMV5a+Wgy5S9FQ1rI44qjud9h53c8siMqli4Ivy6N+xYO+mbZy9XZQg14gUqGw5xsN1ZI5CjVVgNrBquDCJOGQcdMpM9c0Tdo7SiBsP4OEXuoFni2YlKqZ0JuoxL69OKAyL8/dd/ajG4zzc4h1UOZBokDIb/FiPkM0+zsOJAg7RqdWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eddf2879-1914-9401-d715-b711aaa7ed6c@suse.com>
Date: Mon, 30 Jan 2023 09:11:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230127190516.52994-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230127190516.52994-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: e00c7e18-d71c-4001-3737-08db029992dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrCCPy+j21OLnCkDAav8efZpdmmFXmkx3gArSB8uJaPPHKopvn0n8ySLQqVWEugp/ZSXJjL/mUOkx4h0a2yqlgpKtA0bC2Q3q23LEar+tELtsT/z304fVdRyZmUwxXuZv43Ub3PAReGft5rdDvgQGNMEj5dAPRK4C8lxfok3AXoXzqW3eIGrQV9iOoj/Q1NyAG0hcmh9sOQAYvbqQTwCi1rHRWmZyPCCmYk0TAAp4+14OACjfM4K7xtirBjj/I+VGl4OVF3e4DMeeuFbSQanPCTQKCfpJ7lUouFvst6prK30ndYuSJeCgPqoYJLT/E+D7yd7wxLSktwEamRgcZEg7sLxJtfGhnNGW9L+7As1EInf+x107qqanlgkTaUEFX5+a+Pd1QIzLqexWrFkJtcpp75PhfAo2+6x3TYlCe19SgYDQd8zxqlJZN6w7JuD/5nEUgRVaTFdJ82bUtsNnAGL1ioi1dNLcyLFKR4xMzmMU7c6a4JgdPaglu5GSHIAeifZ1BOZXMHTlFz+eAeVvYzJz82rj0cVtNMVA5IAaZO4vJ9hKS7jnxthPsatoCID60t5U83YtwpK7GDrO5Af4PSaT3yqTat98w7jIU0KRQQIH78UQZ6O6fTBjKyUH6WVihvbKzyJoASfLK/C5F8QvdNPsPARZ8njJhqSTfReqcuZIxUqLnJta6UAEOboEOLyGZ0Ir7hJwQMrSmHbqaTf/E4dkT5m6lzidI8K01JyZ1xAeI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(31686004)(83380400001)(31696002)(86362001)(36756003)(66946007)(66556008)(66476007)(6916009)(8676002)(2906002)(4744005)(4326008)(41300700001)(6486002)(478600001)(316002)(54906003)(5660300002)(38100700002)(53546011)(6506007)(2616005)(26005)(6512007)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhQQkpBcXVIVTlpbVNVSzAxcm4wWkZ2RldtMWFPQVFSOXZIYldyZStMY0t3?=
 =?utf-8?B?NkFSa3JFZERjUmxQWFE0QXhjV1dnM0JPRWowbEV5eFJLcm45WDI5VnpiTS9Y?=
 =?utf-8?B?Qm44VGxCWWh3OXhIVU9uRGw4SXhyMDAySjBXTFVoazI5WGQyTHhKa1ltZnNo?=
 =?utf-8?B?QStNamZ3UTJPZEVLemlrVWU0aHlIWDJNWENobTUzTHM5SEtJOEFJWGd0aUNq?=
 =?utf-8?B?ZGJMTU80M21HVzB4RXV0MVdoRUNtQlVzRnNuaGYxTzBLUlFiNTIyN0liTFlq?=
 =?utf-8?B?QS81SXlqNkZ3SmZVa0hOa1VMR2hZVjVsei9hRW9hTUZJa2dXeEo0aFhlRllL?=
 =?utf-8?B?THRsTWRQbDNXL2g1dEwwd3hsWUI5aEowYnM2VU9PSUVPZU04OHZmQVdHTy8v?=
 =?utf-8?B?dmd4dUdVQU00VHp1THBTeHArSEQ3Vzc3VXdBUlhWT2U2ckQwZkNWQy9jVVRs?=
 =?utf-8?B?eE96SU54UjlPVHdURE5QZjVBUHRyZnNHeXp4bjlrZFJRVElBei9HRngzU0Ux?=
 =?utf-8?B?MHBiakJ5ZWVzaEZKZU1tT1hZQWtWRzd4TXJGckt4NER1S1N6SzI1Y2ZoSVVP?=
 =?utf-8?B?SCtZdE50RU9FSllkUFo0eDg5TDJDc1FzUUxDblF4V21BS0REYyszRUxzdWpJ?=
 =?utf-8?B?WGNBbCtMYU1WRVFiMHFJcy9wRm9WS3NVOVBRbHg5c1d3SGx2TFZtYnU2L2lZ?=
 =?utf-8?B?V0ZrOWVHMVFkdlBMNnpoOU1OZW5xOXlYeVcvZG5DeHI3b0VxRXMvUkowR1VM?=
 =?utf-8?B?bEJQbzc1OUZZbjJLNklzUTNjK2xKQ0V0OUxSeGcvOXdFNFdsVWtuQmFPRzli?=
 =?utf-8?B?YmdwRGRMSDlFVGZEZlhEM01xUGNKOTdsOFhBdEl0Mmo3VStabjB3T1p4QnNG?=
 =?utf-8?B?MDg2WFNmOEZhRW0vZmhzN3RraGlUZHRBcGp6ZXllRUxSRzMySE5VMVF1RFE3?=
 =?utf-8?B?MEttbFZmMEFqR3NSRUtOZlVzUHNrVkliN1gyYkI1citOS3RxR1NXeW94eGxm?=
 =?utf-8?B?a0VYRDdlRG5mWm5rSWZkY2N0K2phVzVvaW53MmI3TWIxOWdOYThsSFh4MkN5?=
 =?utf-8?B?OXhUbVYydXloZjVUd25pVE12bUxFSkcrbVBxV0FhM2JKaXNaVzZydVpJNitz?=
 =?utf-8?B?VmxSaDltVGNBVmg2cW5HV0pkU3ZtalBnUW1LQi94RXg3bE1qRzdhZDhEQ2Rq?=
 =?utf-8?B?bHFTZ2ZDREQ4ZkVZVm9ZazZSZEVrcENUNEhoeG9udVpwcDNtYi9nODRHblly?=
 =?utf-8?B?RnhGdEdPUGVqU3o5RVhFMWhTelJ4M0U5dFJkeHJ6SGJJZUUyUUhpS3JEcFEv?=
 =?utf-8?B?R3ZsOUxnUW9tZXV6ZDd0K25va1FHUDhsaHhSbEdlZlNuejNJSmVWMndRSVFy?=
 =?utf-8?B?SUJNdzc1Qll3TWhvWDIwZHZld2F4WG9JbUJEdjcydFlPcGlWM2xyMWFLWEg0?=
 =?utf-8?B?Yy9UakpCTTFocko4QmZQb1hVL3dpMEFFRmt2WGVHelJCZ2NxUWJyVjNvck1U?=
 =?utf-8?B?L2k3SVhTZ01YZ2hhanVGekhMTkpwS2FPWlljTkNjWmRFMWhOOFlWRWlWeTJ6?=
 =?utf-8?B?YWhWelZZSFhnV3hsSHViZkFQdCtKaDNKcEJtaVpXZThCSFQ0TjRQNTZzNktZ?=
 =?utf-8?B?L1VSR2ZhWTlSeGhwbXRBeVdtNGkybmIyM3FTV0JmSmVhS3locjBaNVBnMm1L?=
 =?utf-8?B?a1A4eGVnVEFYVmV3MFpyc3RacU91S1hQanhhUG5UZGJQMGVQQmRTRHRKN2Zo?=
 =?utf-8?B?dTM4UUx2WHdyZDY0ZGthWHo0K01rVHgxRXVQNWMxa1JJdnpnNGl0M1RJMDY5?=
 =?utf-8?B?SndLb2tRVytiMGJ1VkVabytWZUJZZzQ3ZWVVOU1jWmN4MTJyQkQrNmR0blZj?=
 =?utf-8?B?bFhxWkIzRWoxZWgvakhkYXBiOXA2eDR5ckU5bGNKM1E3UTZlYlZaUGVqRGts?=
 =?utf-8?B?UmN4dkVmOUFSTEFvclBDRXgxL0oxYkpmVDNVc0c0ZXpvTFRMaHd5S2Jtb3dr?=
 =?utf-8?B?Um5BaG9ZaUk0SHA5TThHcGEwQlhCbnlBZ1h0RU1sTDRiRkVNeGhFc0N6aEk2?=
 =?utf-8?B?SGovK29iTkZwSUZja2FBaUtlM05LNENMWXV3N0kwajNDU3RWUjlVWGl4OHg4?=
 =?utf-8?Q?/4uJhdyMcCwjiS/btneKkA4Lv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00c7e18-d71c-4001-3737-08db029992dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:11:22.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUAxSfeydHjJcS7zNGqly+IZBmv/O4U52zvQ1D9zvDnXWvQW1SzFaAY5EOPAp1+Blo9VTkTwQsB9RVLvJ2IeYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

On 27.01.2023 20:05, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The lock is not meant to be modified by _spin_is_locked(). So constify
> it.
> 
> This is helpful to be able to assert the locked is taken when the
> underlying structure is const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

But: Could I talk you into doing the same for _rw_is{,_write}_locked() for
consistency?

Jan

