Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF40698DD5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 08:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496363.767068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYk4-0001Xy-Nf; Thu, 16 Feb 2023 07:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496363.767068; Thu, 16 Feb 2023 07:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYk4-0001Um-KQ; Thu, 16 Feb 2023 07:31:44 +0000
Received: by outflank-mailman (input) for mailman id 496363;
 Thu, 16 Feb 2023 07:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSYk2-0001Uc-J6
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 07:31:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3fb42bd-adcb-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 08:31:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 07:31:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:31:38 +0000
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
X-Inumbo-ID: f3fb42bd-adcb-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGEWzQKziyK9Cao/KXPfVRdveZhJ3K/BSO54ZMGUldvMW4i5VKhW/Wnn08oJU09HXeojBKsI70j4G7O5/UlsuOz7ZMqXjzBcdLnVpPZh0WBpqhwz71Gcfp9MhHzyo1NUBA8iyuhMv2RSHkwL095dHxZFVrWvNeS+aoxm5CFx3gJqsKd0cvAjiQtROz2PF6CvtmWiBTDp8ELpFbxF/T78fp/idzj+lINByGwyf9TNO/dmaBhQ1mThRWLXPYaun+PuitkHE93cBv1ZOpAUYu9hynVtKzAFmc7L9IJ2v9hPeH/5AX0tGgLAw5e79LoGOHLhNhtUoPJP8WSk7WnBR3bw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFDPlnES46gaFrh3KpECNd/9vUfZejEdyF0UyGGB9KU=;
 b=QzXtOtIepZIcbLLKJYGbikZjw7fQ5cHASrufseNNhaAnlS09Jw11WBI2MD/nxlWZYIrmDU88MEOzyMovLNN05qiJaAYSwCQ+owYiawgtE3T3brln4UGx67rDb6UkcoIlg638Vj5xCkCqx4y5yjnr4FaylHKABRqaB2Md4XnbB+p925xrlnr25wZY0KfP938z8RKxZnsayjxSuuypAj3eSLz6yhJ+Wcckb4wNHAduvC5f1gA2wSG58u3sgzToT7RK5DQKqmrhZwMZDzkCxdm7Hl6E0W4yadDtznzJZWCpwtk3eZKeIbpr6Ti3PMSrebNBcBGfWXH9qBCKcfSeavM6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFDPlnES46gaFrh3KpECNd/9vUfZejEdyF0UyGGB9KU=;
 b=iqoZvxxDw91rnsGDfrZ573gD2x5yadL42tBLZldoZuu6Lpl5ehade5OUPijBj+jr8DCpxwb7P9CWbtK4YOaQBzTitZVmTOQFT6TBFfe7cP2Coic5Lzd0ta4INp+3o7128E73NQyg3vr25HgXb7n6weaCmnbXg3loPCXHxksGmGLQZeMWvsefkUofI/Sm2W7e4mX0xcnonq08jZvt8awzu164z+wd5sog57qtQjqGsTVKspyF1JzdreuuiBnpVtNc7XEcTHwKvBqn15Cfi5kUmtVyf0cO0Z6NqRhhzyx6Hu07YCU4sWTTmhgr7oo12I0QirMt0mZKwcpCArRWRvuwYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
Date: Thu, 16 Feb 2023 08:31:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1e4a1c-b136-48c5-f720-08db0fefd6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U5ZM/w6P6LtqFl+zXuXFIYptJ2i56X4FOzVddeOFtO5SqgDdz6FWzNl1pyKlFuzdL4xvqz0XLHx4q3AGE6vRAGSg3eQ6rIMMqnpi+IJrDRb3P/XLb21sdxmrk+hyM07MYkuDe13eBvvuXtJo5/xtzcphBRKTd18w8lOHQDeaS5S54S4Erqj/lQPSOIjXEsRrO7uTnJ/wA44f3i9JvZg0Pe+Ugc2SW1kv+imZU2Ac6iFHLPbY/CIKDQc3NewWrlR1Epjfg585iFJlJLLSwpmNql988E4ZzW0GBxJqYcqXW0Z1+lHc5Ilef7E0lnQCifEdRwiAzZdCe7rirEd0uGRqXIlcq6CNET1YRxQtiKrjh2Oyoms6XigHVtTO4+YTIrqaMV9qgDp1syqUAZNBHf+43cJpn34IDaV/8QCgiAhdFEs9Tgt+nO8GRFJLaZJA4T66SF1zNvscuevk3OhLxPjeAh8grxKkykxJNwFW1WhJW53nYL+gp0Al4yUuCIJv125wGgo8myGZxit2REXwZZHdhQ0p76QUNhzjpCjxHJ5XQkSzKYgjTiUgUFHBfz3AKNvPTE5dEeSX1U5RYDSmZcUlUH8lyr2lzC7p644QnvUe2wkW7XXhczPqeXegtXXzNnWafhZpWayxdUKDKLlKMMZxLrEDqTxmIyglVBUD06qJkmlFXqd/uBK5gScS9TrSlGrCYJLRTWDgaDcAgRhpmubg0cMSTlCdRVcvjzfn+qk0wKMyuYeLV6H69JEqSDE9uZ9P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(396003)(136003)(39850400004)(451199018)(36756003)(5660300002)(86362001)(6666004)(478600001)(2616005)(6486002)(6506007)(26005)(6512007)(186003)(53546011)(8676002)(66476007)(4326008)(6916009)(8936002)(41300700001)(31696002)(66946007)(54906003)(316002)(66556008)(38100700002)(2906002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZYSVFOblI3b1M1K1dsYVRvUUsxQ05obFdRdi8zQVhITWlYcGlBWjNlT3N0?=
 =?utf-8?B?VzFYS0RXeXFiNDQ4cjRmRzQ3WWRjdDhBQnRJVHRwajlqTC9DU2g2Q1IwNUx3?=
 =?utf-8?B?anFoK0kySXc2ck5RSnRhM2V1bkd2WkU2djZEQXFYTUdOd3o1SFNJQTNQZjRK?=
 =?utf-8?B?YnhhbnZhZVp0YUxSZUU0MEZNb2VydS8vL2plS1NoUUNSM3lDU3RoYWc0VmZ0?=
 =?utf-8?B?dmF2cFUyeUZZcysxcDFXMXc1d0JwK3dNSWQwWnN2amFqeGZ2SDZ2a0l6VnZp?=
 =?utf-8?B?V1FaSUxXMUhSNVdUd0NKQlYvRlBkbTlBcTNXVWpBOG1wV1JFbjJVVlVKR3pX?=
 =?utf-8?B?amgyK2o2SUZESU5uRTloYzNpVjdpay9GRFlacndzRXBLazJVdnVNRldwR1Ro?=
 =?utf-8?B?OVdxQm5nOUR2a2tMa2JsM2hUcHZhamFrc2FXdXovN05QTTNWMW82QTVJRHh2?=
 =?utf-8?B?aUlzNGxXKzdmVDVhQmxTNXQ1RC95TkxZZ2hhbnRoQnJYMllRcGFDY0FzMXZx?=
 =?utf-8?B?b0gzQ3NGaGxqSE5QU0M3bWhIbUhrcHM3NmNSSlhBZnpyRG1wNFVENG1wb0VB?=
 =?utf-8?B?ZnZjSE1qL3BicGIrV3ptdVhWTXNZVlNaZUp4cG13SmZLbDNQaHVoSU10WnFp?=
 =?utf-8?B?SkJMZGdhOVkxZkx0d1hqaHZsMFZNb0ZxLzBHSy9zMTErbGxQMXFkRk9sSTBl?=
 =?utf-8?B?YVJUS29HbFJtM1FXQ0NJZlozcHJCWTNreFlVTjJMeXFiVWNwSkV3eUZvNmNu?=
 =?utf-8?B?ZXZzKy8yd0F3S2JQWFZ3OGFCM0F1cUFrOGM1ZnlsOXIxa3ZjbmkyZGs1eWRV?=
 =?utf-8?B?WG9rcGx0bnI2S3NHRlpqb2c0WDVkZnJQR1NzSHFmVXRXOS9xVnNXMGxYYU90?=
 =?utf-8?B?blFtZUhBM1RncVF5OHRGVUxxL0JkYzRhcjNFQ0FLY3RBSFRuMHZKYm1uelh3?=
 =?utf-8?B?di9XcVEyWE9NdjhuS05Lc2dLMThuZ3pGWktRakhIdWMxZEJ3NXFWODZodjhw?=
 =?utf-8?B?L3Z2ZHR2UUt0TDhxSVFUVGJzRG9VUVRubnAwODhDZDdJUDFRK28yVTBaZUhZ?=
 =?utf-8?B?L2QxMmkzZkoxZEVWL0RGcHgvTThmWXRocE5HZk9qalUvR3pHQVE3VXl2Ry9U?=
 =?utf-8?B?Ty81UHY3dnpjdk9FOWRTcnBUdlE2MmRGVW5mL3lUS0VBa2c3NmpSTXhlczlw?=
 =?utf-8?B?REF0UU1jVGwwbGFpeE02T1J6VittWGlsRzJHU2hrdG1mTkd3ZG85SUVhVjRD?=
 =?utf-8?B?eHVKTkpXZ2hIZGdaR2YxbWJsNGtYNFRDK2hQeUNMQ1NjdDBvMkVzdkhaT1Zp?=
 =?utf-8?B?VHpHMkpwc3NMVHlEcm1WRXJpdGNCalh2cXljcCt0aytvVUE1U3pzUXJiWmZO?=
 =?utf-8?B?NmxNd1ZqRm0zYWhxS2hUdkliL0hETXpjYnFYWmpldlVPRnNyQlJXaFZJZG84?=
 =?utf-8?B?cW90NDB2a0svS1M4OXNJUW5pdUkwWXNBYkZQUXJDY2pHOHEzSlhJSjl1bWlN?=
 =?utf-8?B?QVpqdWlFNDcrdVdRaEM4YlpTc2VlWGtNM0c0S0svUzltS3JiWG1peCtvL3hr?=
 =?utf-8?B?YnYwc05Bd3crdDRkcW8wR0p5VzUyU1VBdHgzUWZZaVNPeDA2b1dZTzdJZkgz?=
 =?utf-8?B?VDVZNVFkdTV2WFZxVk1VMVl1R2NVdnZ0cTl3d1B3Z0FFYXkrRHMzVUVQWmpv?=
 =?utf-8?B?Rjc0aGdvOUxrY0grZEIyNjg3OXRiYzZuMnNGNldTemVTaHV6cWMydTh6ZXNG?=
 =?utf-8?B?RGxuVlJwS1lCUXl1dW9kR1dGNFJ3MmFXdDhwMUR5N0xvTm1ROEljczkxZkN6?=
 =?utf-8?B?aUs3d2ZDRWZuNy9JbEpWMk93cit0UUI0TmJpMzZuZjJXdFk0MW5LNWt1VUNJ?=
 =?utf-8?B?dkt4QS9oZzVUREk0V2dkTmtRdVUrZVVMWk11QWs3M3QyQTlwTURQbEZiZDMv?=
 =?utf-8?B?R1RZa2VKVkVmUFdBTWViOUVqQ2xtdHdPTi9velBleXJaMkFmSENpdEdUYTZC?=
 =?utf-8?B?bXM5UDVMdXkzMWFyWFQvNkVnRm5UVlJoTk8xaVZZeGhkajQ0Uk9jUUhxV0xM?=
 =?utf-8?B?Vzk5ZXpBaW8vWGdXNGZpZktGMkpQb1VFNlhJMHNaVE8zQjg2TEo3WDc4TnY4?=
 =?utf-8?Q?2cI9ChTC0wADXU8YpivjQXA2m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1e4a1c-b136-48c5-f720-08db0fefd6b2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 07:31:37.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OClVvmj2IOhzyW0knYH4mtKdZ8qTejIddpKid/ZPYqtqQZnGrWERgbHzxU+a60aioUdzZv5zc0tvNJ6ZP/gQ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064

On 15.02.2023 18:59, Oleksii wrote:
> Hello Jan and community,
> 
> I experimented and switched RISC-V to x86 implementation. All that I
> changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT. Other
> things are the same as for x86.
> 
> For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT will
> look like:
> 
> #define _ASM_BUGFRAME_TEXT(second_frame) \
>     ".Lbug%=: ebreak\n"   
>     ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
>     ".p2align 2\n"
>     ".Lfrm%=:\n"
>     ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"
>     ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"
>     ".if " #second_frame "\n"
>     ".long 0, %[bf_msg] - .Lfrm%=\n"
>     ".endif\n"
>     ".popsection\n"

I expect this could be further abstracted such that only the actual
instruction is arch-specific.

> The only thing I am worried about is:
> 
> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>   [bf_type] "i" (type), ...
> because as I understand it can be an issue with 'i' modifier in case of
> PIE. I am not sure that Xen enables PIE somewhere but still...
> If it is not an issue then we can use x86 implementation as a generic
> one.

"i" is not generally an issue with PIE, it only is when the value is the
address of a symbol. Here "type" is a constant in all cases. (Or else
how would you express an immediate operand of an instruction in an
asm()?)

Jan

