Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B2749A6C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 13:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559860.875248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMzN-00067v-1K; Thu, 06 Jul 2023 11:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559860.875248; Thu, 06 Jul 2023 11:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMzM-00066F-Uf; Thu, 06 Jul 2023 11:17:32 +0000
Received: by outflank-mailman (input) for mailman id 559860;
 Thu, 06 Jul 2023 11:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHMzL-000669-35
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 11:17:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0a81864-1bee-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 13:17:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 11:17:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 11:17:26 +0000
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
X-Inumbo-ID: b0a81864-1bee-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQDM0a4Ra7eV6OuWXpFajAiPuolR9yrTAZLJ7zT2qiHx4cHm2xiVUi/TiW1OG3x9dKUtjF1NMjaTS/U1wlnL+eFJrh8FDH1rkuIhdxie7WSM+E7C0oPTxolHuPWkQBeSFwuC2hjFF+mNWIwHv/bMKhc5GhH00I4+5bDt6tZiJB+iBv23tiEI5VuadRMnzPh51iaplC9Ca5/ztagxZZaK5SFhtyCkBHMWecEmyp77POpLybNPP0hpMZzRBVQd4KFYJjyTO0EycW0Ux4KSXshTpKkIakXtdAKpYLh1FBOC1Mwf/NNsl9smHZKB4pn0GdW72Ph0fYW37mCbmltJ3NqbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4dy5ESI3AgHnzlzCu9+1b+Pp2FyvKSQvyxwkQkZn/I=;
 b=VD28/lGBkoUQv2mDc0+pGW7KckdkqXa+eUEtDWVmdvIkostK6pUBAyAsisbFWMNE3udFKxoVuxU3sjA4Ccd/kdiFvFLda2tFTzoMP5D60h8tMJp5pp/USQnuaAOeXaQqLlEYfM3Tvk7HSwi1iTJKMK0ttrTaQ3UkKKypOkHFqxo1t0eXZ5ek5QIR8JMbl5NyL/RTHKNJyZeEtXFRX2JTQ2vKNusYjVoRHYn0ixgsI9j7LDamnrgVqPnRi7DqLAq1oV4ew8Z3wF3WGSnS6PxHOwAGtCserrtmEwLzsr8YGngG70tZoGbBbJu0CnIBZlmmcqQkBuEyX4WlUBF5oGQ45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4dy5ESI3AgHnzlzCu9+1b+Pp2FyvKSQvyxwkQkZn/I=;
 b=dbLennHOjQKA/L6N6GvH/czsiMnKpuSazpd7QougxwSz4aYgA7bZin9p3Es9FuQFvIwYJknEIaKRsBZ9agcrstEL2brX5rAYHhse5VhuOWGPJ1Wps0RL5TND/MnrDrKi/v259gGTfGvb97hNH8mWrQVSwyk27sB84ricNBeAbcK3tFeU23gyC+it2WtLP8pQEMLcjePVtjR1geAmJU6sIKsF3uMkJCpmpzdeeggU05SzwX8QdEvNBokOO746UMB8OJAGRYN248ymO83NM7xOO/NGSwE4c/zJPsacuY8t99Jg0vgiKbuceCYzz7MzXgK/3OlAuDa6g7Oh/qbrM/Fpsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98f1cb38-673a-c66f-96be-ba2cb6ff242f@suse.com>
Date: Thu, 6 Jul 2023 13:17:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/6] xen/riscv: introduce reset_stack() function
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6a60e7-32b3-4f12-a474-08db7e1293f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gehbTRH/X4/K8mhKTCBmaiM0ZjZo/pJIQxG2HoRqldvNyRY7Hye6vQSHODW29JeGXSZoHSh4U7MEg6GIiwxblRZVndjA4+JI/yx1ErGR0X1uijfpDMgSnoV5xbzcv8W1NCTRFEQv/zPiC2AKwcB94VMxqKrzDV/unckJIwa0McBvXgbMhI1QunVznqObyATsWF2gjUu8/2s2ubE0xXruLp0nPXV7fgGbUGlH1Ily3ZZjOnMZfuJ+7HK0IeKH64GqeJ6AQW4SfI4al5ey/AFXTQjGOwN7k0TvpkyJ0gsKDc/AWCf/no9GJk/xULNP3dcHniFsPtdLoAE0ScVdn2yo5tGISAelDviJ544wLCibreru4da8UIJScRzUCxMuiKONmwPpxUnRywe53Iv7DoLhuhag6HK2VBi6+zSYUHsc0kUqwUx5UY/jZNiZ4X2ThJ9vx8tsqvoD1Qwt34BJh7KvaQUv5Jz5CafSG0Zv5ACcqXDUxtRuvhxJVznU2OJUDa//qmKY9h2Pt6HER/llDw7CwXMc+NgTJ3IzUQoGXunL0kCFBHcV9ZivyOVEMwJhAOlPnA+ADhG8NusEMguet4msHDJa6u0jrLymM22XYlmOBml1nxoo2GmmVZ7io9mVilnQXnuU6ymgxiMlkh84lPB01Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(6666004)(478600001)(186003)(6512007)(86362001)(31696002)(6486002)(66946007)(316002)(38100700002)(2616005)(66476007)(53546011)(66556008)(31686004)(6916009)(26005)(6506007)(54906003)(4326008)(8936002)(5660300002)(4744005)(8676002)(2906002)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b056YlFCTDlLRlczNkxRUzAwUnlJTTBMc0tLLzNzOHJlNmR6VUU5dDFYdnM3?=
 =?utf-8?B?MXZ6c1Z2ZUdIYkJiOWVpS0dEcmVYL0N3eFcvbGZ3TFdNNERGRUFUNzBobHJW?=
 =?utf-8?B?T3lkNDN6L2xhNURJQm1EVzd1bTJZQ2cxRFl3UTJ5UGJGMzJRQVNxK3lZYWw2?=
 =?utf-8?B?WkhtK09YQmoxYTdWdVdwVWR5b1dqL2tVRkpXNStvcWFjUHdKQ1gzY0wxZlc3?=
 =?utf-8?B?YXVEN2JwZDRtZWtUdFQxQ0dXKzBOcFpQayszNitLd1RMck5oSE4wOTFRU2xY?=
 =?utf-8?B?a0VObDJ6U0VDcndlcnRZbVBFNUF0S0tld1k3ekxoYm9WN09paWx4L094Njhp?=
 =?utf-8?B?UnBPVHRnRGl4UVdZRzE5c3hodkhod2M2aENWN1VTS2tEa21QaC85SjFPVm44?=
 =?utf-8?B?SjlpQ2JMSzQyTzdyc0xOcDhPRk44bWhQVWNjZUZlYVlyRFNkZU5GUU1XVjUr?=
 =?utf-8?B?RnpEbGQ1SFFidHZ2cUlPZzNadVRPYk1Qd3VmM1ZveDBaMnR1NG5kMjhBTEdl?=
 =?utf-8?B?VFEvcFNYVm4ybU1XSURZS1NuTHVuaHhQU1dxaWpmOURnQk9zUE96ODI5a3Nn?=
 =?utf-8?B?VVo0ZUtOa0FNcnFRNnpsV2FwdzRFb3VDSnlYeDZmTmlYUG9WM0t4MDVvdFNq?=
 =?utf-8?B?ZEsybHNxdmhtdzByaEN5MTBhRzRkb1BkZFp4SUNqZXY4cEdlZVpYdjh6dFJB?=
 =?utf-8?B?cUVNTjVqRCt6RnFMTVVzV0V6Q0g0TGt4d1NjVHpOSVVDYU9BNmpGRThFTmNi?=
 =?utf-8?B?aFZ4emFyd3lXVGJaelk0TjYyd1I1Mml5dXJBR1JWazdJelFJcHVaRVRwOXhO?=
 =?utf-8?B?cHJFWTl3NkFRSnROZUxleGZiQm4zZ3lZT3dSdnYwcG05UW1uQXRCclZPbFRM?=
 =?utf-8?B?dDVxYUc4eDU4Z2VpZWxHbDBxTDNDQUNGaytNNEtrS25ySmNBUCsvdldMRXE3?=
 =?utf-8?B?cE5lcFlOOHRkR01iMytEVEFFMHFINEM3U3dkY2JyeUsyVDZJdzl5TStIcktx?=
 =?utf-8?B?MzUzRVIvVFRuZXFERzUybDFmYzZDOXlQUlNRdkJGMXl3a2pPcHowT2pRRitY?=
 =?utf-8?B?SVhkT1N2cVFwRzM5Nkt6dkQvSEU2VlB2clEzV2hXSjZnMk1PeDBmTEFaazJE?=
 =?utf-8?B?c1JWVXoxa2tmajBHeDlCQXZURktZMUNsOTNHdVV4WEpwbDA3VCsrdlZvR2VP?=
 =?utf-8?B?aFNoalNxV0hTSmNUS3JTWG4wTnQrelo5cVlvYXlodlF0M3hReDVlS1pBQzc1?=
 =?utf-8?B?SFJUNHlkU3V5a1ZyallYb25QRmNsSUl3Q01FNGY1Qk9KMytRTWRRUGpIeW56?=
 =?utf-8?B?ZkF5SUZZUEZldlZSMWlCLytEOVRaUy9qVXlFNW5CZTZTemlMT3VvejErYjRp?=
 =?utf-8?B?QXdtOVhRVTc3M0VuR25rR0JzSXA0Qk1QdEZLWU9BYzl1WE5pcmJ1dysxd2NG?=
 =?utf-8?B?NTRPNDJUdW1BMzlqVGxTWDhqRUN2MVdJenFkTnJHSFVUSnUzeE9iOUhWRi9T?=
 =?utf-8?B?WURNRERodWRuakdUR3B1QndicnBwcFJ4VDFYU2tpd0JDL2xmVWxFaThwT0NC?=
 =?utf-8?B?Mm1KU1VtRVovUHBpQjgzTjRZRVpydklDbUZRSW1HblBjZnh5REZnWHlZMzZ0?=
 =?utf-8?B?dnlaV3YzQ3d4ZmNHYkx1WnNFcFN6dlo4YWRoV3c1MVQ0Ykk4SXR0KzFOL01E?=
 =?utf-8?B?SHNmNDhoVXlSMlQvT1R4bmd2SUphb3NmN0EzTVpPeVRWN1FxRzFveFg5L3Jh?=
 =?utf-8?B?bThXcXJtQWs3UlVHaGlzUkowbzlDazdpT3RVOERwZkRLV0NaUm5EN0VZRDhl?=
 =?utf-8?B?ekFOc3pieVhSd2VZdk1OdG5INE4wMXpwUCtHcC9JQ0NqYStNVjBxOS9vMDl2?=
 =?utf-8?B?K25xRjIwbkhOdFNNN1A0dGF0ODFRK0JHcGxIcjM2OFJHOHVYb1YzVVNEb3hS?=
 =?utf-8?B?WEZWYlZLWkd4dklPeTROR1pRTnZ6SERNcE10ZDU0RWo2U1p6TkpTVDVDUjdU?=
 =?utf-8?B?MGljSEorZmlwOHZIYi9aM1hhQzRhaHVSV0I0cEZlL2p3NGVkRHZUcDViaXNi?=
 =?utf-8?B?WUIrdVB4QkcwVEtnV1duekRYbW80SzBPOGxoK1I5VnZzNEdLZmdtTkZ3QVc2?=
 =?utf-8?Q?6BG0m/HmsMvIOvhaDP1uwxa4o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6a60e7-32b3-4f12-a474-08db7e1293f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:17:26.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HO630aYrwLuBuoLizkMIxiG6M4fC1cgG7iKSNX13incNDFVkSHMYqfkZqMlMzxLGJzSTzbmR3+lZrWm/J38Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

On 19.06.2023 15:34, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -27,8 +27,16 @@ ENTRY(start)
>          add     t3, t3, __SIZEOF_POINTER__
>          bltu    t3, t4, .L_clear_bss
>  
> +        jal     reset_stack
> +
> +        tail    start_xen
> +
> +        .section .text, "ax", %progbits
> +
> +ENTRY(reset_stack)
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>  
> -        tail    start_xen
> +        ret
> +

Looking at patch 4 you will want to add a comment here to emphasize
that a0 and a1 have to remain unclobbered.

Jan

