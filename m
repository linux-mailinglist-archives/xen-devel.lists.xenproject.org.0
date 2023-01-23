Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125B677D18
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482868.748626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxFX-0007ea-S8; Mon, 23 Jan 2023 13:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482868.748626; Mon, 23 Jan 2023 13:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxFX-0007cN-Oc; Mon, 23 Jan 2023 13:52:39 +0000
Received: by outflank-mailman (input) for mailman id 482868;
 Mon, 23 Jan 2023 13:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxFW-0007cF-4J
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:52:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30df0c2a-9b25-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 14:52:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7217.eurprd04.prod.outlook.com (2603:10a6:20b:1db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Mon, 23 Jan
 2023 13:52:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:52:19 +0000
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
X-Inumbo-ID: 30df0c2a-9b25-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzRPmFS/2z5ZrfRukGIkXifvvRYhSn7SaS31/q8FytEtKeXhUxawzA5+Wpes/Ys4tqC+jrFox4hEXrOhWMMIsyaix4BdqW4f2S+7GVVajpah//Z0QXZprr1VizV6PWXanmYGW3ijjJSfyIVCjPOQ4vAvmD+Qpd6ZcU1mfINXoX+XExNkW89sKUXlHKcs8C5q27DbwZHXvw/aXlmdbIMrct8Ea5tMDoI5CfWK5DDgXxv26XUSVPxoYZwYhzEdQkKTmJR2d4SiH8fZDtJ3PjetV7iXDwwPRnBnMeTcKF5AlysXOZMz04RLJ9Gak1ghpQLLCAr3JmMrtrVdyxdQsdyT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD5i5hhY1nZSOzoKHijR6N4P0OTNGI2TYPx9edKEDWk=;
 b=hQD10UDNfIaJ6jVTXUSGj8AZ3sNq/O0N7FdTPKtwpBZvo+mf8gAS2yg/CiNhRDQ4s2eW2X3TxHfjXInLHTPVKK4iooYL6HizGQma3qfIvu2EZEvKOgY+o5qatKJCMoo76ZETyPzK0z+J8zu1Y0jCalgcStG6OutGZvcAygunBrdjT0U6RKZPCP4TDazwemWy/VsxJOHQVosik4BLdUDgJMpQUztDH+AUh8WmZjCxddXlB740Qk+Ww4zxAkgibuLLEj4B70BlusiEZoGIGDMGEMC/WHKwMmYhQ6yFIF9lqFN9fKk+aht5cgMwxGLtlbtkGlwiKvGet+lZTEKQD9Q4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD5i5hhY1nZSOzoKHijR6N4P0OTNGI2TYPx9edKEDWk=;
 b=0+uAD5SlRjm3be5UmWM4SJIUrm3J/kTBqNkPMAtbKZzXHBoYtMoYXo9VdGaoT0JOlgUGQcEu/vifmosUA/iZY6EzrbxTR5UnbhLA9FuijE/qbxQwRTZ26KRUlV9EWtPpb7HRDek8wRbSwEyWfH8s3S+CgIGP0Cr+ATz3HfX8maep9gKWdqB3W/mNVywfJ/NibLnxpeFiz+ymwBKoXZEqicI5VsWoE4TCwCIncvSZNROCVcc/S1kiiMOra/OynbPTWTjMgrYuiv6tR/q6D8wIEjwKjjGSkJZBlnOEYfU39+Nap+lZwqPwgPksBpBidUcWsrIEWcYUk7aI7kKQl7hk/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <469c9ef3-767a-358c-5e70-a1e0d9b1a4ca@suse.com>
Date: Mon, 23 Jan 2023 14:52:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 03/14] xen/riscv: add <asm/riscv_encoding.h header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <fe153cbeffd4ba4e158271ccd2449628f4973481.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fe153cbeffd4ba4e158271ccd2449628f4973481.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3894622b-f3d3-4044-8f20-08dafd490b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EpO5tDoTY+pKLDhZANGR+X2TmIL2N8Vp5w/WdCah5ojiy3TeKx8hAVkRN18tXTCnmDgVVdGKcQ07xMjXQfQWAKNO/Za/kPYFr276qfOGrAPCv7PrgS3sStsu4y0khikrIIYMi8hUXbnnfdrfZHa9HIS/Uu7g4jGEEHyprU4thjTnZ2J4vh5VGMPkA1YjE36nNuaLb9kersSlv10PeQMFsOZYVCVJjFuKdaEqjURrPpS99u0Kid4WkiDB2YujaXTN17QnC6OK9l0qYO4RZl9Ii3ZhIJU+TELp8FAzUtdfqYGtfLTtu9YYRforxiiIfUsHDdmnRcFpESmKXkmBGRiOlKdkWn2e6fULiRHqWalHmEiTUeo01i34kQgO4IP2/PB7K3wFCu3EqqxlAIUS8VKc0oCptdRcn2aBdOjjHSQlo4p4cjKxDZHWyZ2gUUZGiYI5bUGUFYnsBroyLeFZexNKHqFGFUXCmg/H70QxUyUcr6lA1OzfnOVwC1J2mOmqw0D+gU5l3C8SYcDiW2kqHvo7+g72Az/pu+hqMI9wjDK7f1KhbDL+2rk1X1FGdi3iiyzzCmgzjejrtYV2x7GFgj3bKiEtEDeuVyIWeVhfkKfEF5NkeOkVpkq7xDHPaYH3/8A1p4HCeW/skz5AzFFe38EVLpMBUIoKtroutGxqwD9A1V+zmS7XWmw+FkSN3WA6Zm3PSCenzP4fiYJHBA7DjK4B9q+KWTSuH7CeCr1MNhS2Wz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(31696002)(66946007)(36756003)(66556008)(2906002)(66476007)(8936002)(38100700002)(5660300002)(6916009)(8676002)(2616005)(4326008)(41300700001)(6512007)(186003)(26005)(6486002)(53546011)(54906003)(478600001)(316002)(6506007)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdHZXlrR0FDUCtxL0xoYjdac01MeWxPRmxPVmpiQTJGRU5USG04TTVIZndO?=
 =?utf-8?B?OUhKbU1kTjBLMEdVZ0pUWTdSNkFsdUtKODQ4R2ErelNLVmRiNFVHMzFjMTE1?=
 =?utf-8?B?LzhWcTUzZ0VpMlJxenpIT3hOMmtGbTkwdG5zSCtUUWh1ZzhhMk55MWdjRjRK?=
 =?utf-8?B?UTYxdCtNQ1J4dHVtcUY1SjZNSmh4TVdwbkJucnQyRGxvTElycFpYM1Q1bFBy?=
 =?utf-8?B?NnBXM2NmT2xVOURHdUpsNWd0YlpaWk9PYURQaFVmUTRMK3ZydWJBNUZNUi9w?=
 =?utf-8?B?cXozYXpEWnlSZW5iZTZ3UHFyTVEyL0VFU3JqRHdCeDVodHpERlA2b0l2Q3Ur?=
 =?utf-8?B?MkVDSENpUEcxcVZ1VURmejN6dURKWFBKcDQyVU5ZVlE3amZlUTk4SE5hNHBy?=
 =?utf-8?B?MUZpdTJWTTJKWDZwQjA1NE5IaVBRRjZlckVrRXdPYjM1U2thMzdmc2x3NXBt?=
 =?utf-8?B?bDQ2R0tORkU3aTdGRDdnK1l1bUQxemM2V0g4OUJ4MWpnTUM5anBvd2dMS1F3?=
 =?utf-8?B?Ulc3Z3l0NnhCZE12eDRUYkFXdDhwajBxZlR0SGFUd3g1Z1RicS9MQUtuS0ZK?=
 =?utf-8?B?Umk4RUJIditYalNsYVFGeGNKMTd1aklmQXVIUTFGRkV2N1BYUllJRExiS1dS?=
 =?utf-8?B?UUhMT1F6Q040dEsySjlML2FFeG1Ebm82YXBZdTZuM3QzblJRTk5zbi9oL0pO?=
 =?utf-8?B?bjlhcEIzM0doakNYS1JoL2pPcEdFQTBPVDZnOS9pM1pFcnAyditRdUV1OEZ4?=
 =?utf-8?B?ei8zRTlrN1ZCK0k2aktnZFVmc2Nvakd0K0k0QUxPNWI1TFJIZTRlT0NUYXdX?=
 =?utf-8?B?cXR0cG1KNFF6TXdIbHpuc1hiUVJ4YUxGa1gybVFkbGdjcUxJamw0UUxpWmVh?=
 =?utf-8?B?MDZ0MHRDQloyWWFKZ21rdjJYa3FXcWFhcURaRUFuRGNQRS9iMnAvaDU2d3hW?=
 =?utf-8?B?VnhBQUhPQTJIejJwODRpZmxIMHhSWUNjZzNCYlNrK3Z3QVBUWHZGK0gwMjdT?=
 =?utf-8?B?VmQ1ZXpaamxsUGhlY3ZIN0tIMzZkMDF3aVQ2ZlBFaW0xcFRObG5UdjY1WFVo?=
 =?utf-8?B?cE5ZbXNJRStOc21GdUhqbFNTVzZ1V2tZbjhlOGpWNllkZGpqWXRxaExQMGlC?=
 =?utf-8?B?djJtZlhQNnQvTkdLOXJWbjFUTTl6TDNRRCtvZWdkN0VSaG5iVXJYSHFyaURW?=
 =?utf-8?B?S0pSelI1dlJOc09IUkQ0MXZ1cnlEekpnTXNCTU5NaVVPWi9saDhJVmhYU0ZT?=
 =?utf-8?B?cWZVMGZPSWQvS0Jsc01JRUQvemRKY2JzMDRLVmdrZDVZQXVuNDZYYncwR0lp?=
 =?utf-8?B?L2xKYVplYnFyclEyTmNHN2s2bmJMVzBPcVRweVlwWW5jOHY0NmcwWHBGV2xG?=
 =?utf-8?B?MVp6RXI1dzhrWVRFSVdLUWVCdmFNNmptR1dXaDkxK3JKM3UxYzFzY29ObG5Q?=
 =?utf-8?B?cC9ET2lxVDZSNXdnTW9VMHluUFBSVGovVTdsSnprTjJlQVc3WkVpaXk0K1JR?=
 =?utf-8?B?alhLbld0blBIZHFHNWs4SDZ5eDZJSkc1QnhZdFYxbjdWeXI0eTVuOUhKR3FB?=
 =?utf-8?B?L1FhU1NLSUtMYW44VnN5WDlvOWxuNkFWQXdwQ2VwNS9sT2xoWTc4bmpodXJL?=
 =?utf-8?B?aWlVRjNES0JjNVA2QnJSZ3ZNQTFMT2NvaDFpb3NwOW5GRG1IVElOdHc0K2tV?=
 =?utf-8?B?Ukx3RmR0eW5Ua1dNTk5aaFRXMFRWMzAyMnhYMkpEa2RVZFNYZTgrVmQ2Z2Vr?=
 =?utf-8?B?WjZ4TjdTN2dRS0tObGhsSXFleU1wbzZlemkwaSs4d1RuaFg5K2JETUk1dENL?=
 =?utf-8?B?YjZPa3dVKzROdkxCeUt0d0dyU2grL2cwbWkrdjArRUdkS1hpVjk3SEJ0MHFJ?=
 =?utf-8?B?dS84VE9XbDYxMzRlQ3BuanYwYkdCckNsS3NDL0QxS1Jxd2kvU2dmelhBeHlh?=
 =?utf-8?B?RHVjY1R0bHhJbGwxRk9pUkhZZEVRTm5WZ2YxV1FjY3gzUWpNdTBkcFdGNDd1?=
 =?utf-8?B?RUI1U05xaVJHVnp5bWVld1VwKzBmZUxyTE96bVczK093aHRFQXk3UkhUV0lo?=
 =?utf-8?B?Y2E5OUw5bTNtN3ViUXMxeGNiTVR6UWVyUkxTUktXTVRENW1HMUU1Y0J3Nnow?=
 =?utf-8?Q?ClaSV4lvd6uddqtrGffs92WAb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3894622b-f3d3-4044-8f20-08dafd490b2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:52:19.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mElxe53gxcCK/rvuxtBIvb0AZf7SFN20AFNsUiDHwgI1mU08vOUrcUdDHIbLdKwqkqPZkZzDSLL1G9W4EyllAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7217

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I was about to commit this, but ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -0,0 +1,945 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>

... this raises a patch authorship question: Are you missing her/his
S-o-b: and/or From:? 

> + * The source has been largely adapted from OpenSBI:
> + * include/sbi/riscv_encodnig.h

Nit: Typo.

> + * 

Nit: trailing blank.

There also look to be hard tabs in the file. This is fine if the file
is being imported (almost) verbatim from elsewhere, but then the origin
wants stating in an Origin: tag (see docs/process/sending-patches.pandoc).

>[...]
> +#define IMM_I(insn)			((s32)(insn) >> 20)
> +#define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
> +					 (s32)(((insn) >> 7) & 0x1f))

Please can you avoid introducing new instances of s<N> or u<N>? See
./CODING_STYLE.

Jan

