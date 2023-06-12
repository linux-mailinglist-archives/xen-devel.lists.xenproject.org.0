Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77072B875
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546872.853953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bjD-0007Uc-A3; Mon, 12 Jun 2023 07:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546872.853953; Mon, 12 Jun 2023 07:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bjD-0007S8-72; Mon, 12 Jun 2023 07:12:39 +0000
Received: by outflank-mailman (input) for mailman id 546872;
 Mon, 12 Jun 2023 07:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8bjB-0007Rh-PY
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:12:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 821e63b0-08f0-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 09:12:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6898.eurprd04.prod.outlook.com (2603:10a6:208:185::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 07:12:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:12:33 +0000
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
X-Inumbo-ID: 821e63b0-08f0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDIYjxN/dT0VOAxxjWcfU3nkDbrHzYw5UFmUzoxJ2iVkKN3NDLS935ByHi0CHJE+6gCUiS9De6eEfQT4/8RNyvoYJOH49kq7TCFl3xrb+Wp93Uz/Fv5Slu60PU693vKFoqCB7oosoVPvTlJV2ZqRB21Ub7W80yAyOVQNtV7vZGJWhMoSofrmJ7uTfkqpeFun8IyDW8pzQ2L6tzAeT4T17CFfNGrQuBnlYzGVvpgxTM3l/X5gCVz20idRq1u6nQRZmt5gdWbWbuWHrqMnfnGFK8KV5mxRO0aLedKrSmSZh82nulk8nAN2+TdK4yeEGa+T7n0gcYXRdU5G9Pe3qkxjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZVY9mZhwQBYvAiAN649G3L5M1AD5Dt9to0VX+1Kaxc=;
 b=eQQ9lq/WofuVr/4PjxGf8RVkxmBtse8W/Gfue0t6y2eDNHlKIT+p4IX/cjqtZBI0MpKq4fLJsiWgPB6S2nRoshtt9nqKZz4cOqbgrc7I1RkalMtmWAKMNQGATCG71kKsWHGztjyDHG7eZD9g1icIjex+Ifq9lkz2Wd+hnIxKkoNFRGRWABZnGZ0GwtHL46+ufOaXEyhf38vKQovMqn0uMZ4h/nJDrGZfpuOSNqFe56TbXResEvpUCIP+kiOuBODp5CzrC2rlqXpt09Q0vc8KQmof+AKS4XHb4AtwHNXQOrEbVSm06FQJQchiqpRpAwDiEb4sUqLqNdJ3Zl6XUx4QAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZVY9mZhwQBYvAiAN649G3L5M1AD5Dt9to0VX+1Kaxc=;
 b=c+GXN+h1VqOqnItafy8wG8L2X7Kn/mOf3K/2Lncg+giRS0Ocf3qIfxt2LE86cDFKJGgMHybWpouI/opcGXQpCFnDMfSzKov5WZjrHGJpaFo/CWhVQHNo64al+7h7VUCGwRCBq9OTcAfHZYrpObx52O3+Qmtww8dbbd8Uj/JD45THbgR4H5p1w3PTEFVKaXNhnu8OfSDUoVMX58pKW2wUVpFth/Dr/vBbBVtEILNExO7tQEliAuEiePHNXP+RBF159GAwdigYuozpD1HVOxpPd3OW0Noh1NGnknvWvbPMrYbbr29LrHhOlrBP8QfELf7QZ8TZX3cp7bysKegM8vL/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
Date: Mon, 12 Jun 2023 09:12:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3c7e4f-2c13-4b95-7c78-08db6b146487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rv6y1juvaGgOqTHSsw+xy7UUc3antIOozzR2gIPV/ZfYSY4f4Fgh4mNpF6Uk6j2TL0bh5R8jeYvDJro91bEbT009IhfATqNObK1jvrz36i53OFACuWzKnx8rEe6arFGxFAAuoOB8pWGShzNF8g9ys9NA1skh9zYv8vbPzAl3cUSbr0bw8nLc6uBgOg78fi9u/lwbrJGltyEc1LZE5fSFoezaH1sWAmoSQmIHFBUiNI44OZDI1yHJRVxO069oWz2310BtdOfu/3nCoGw8TTq13D3k++ua48dgiENCBZNvnd8UtbccgWzqOCVKtPDZ6KFDq19iDA9Qr52x7lsYrVxBHjjoH200PfkgkMIv7fvDmjZD4qCwxQ2QAEu7zgyDfdkcqYf5kjsmk2cOCg18Xz5eJ2qCu3tSgKbfYX4BwsD+8zsHWVkXsIWXwPjZUysaT4R9ZwObXa4ylmcdrA5Dsyd42A6cqLA8xoVgMVOxs82pJOhyafc+bPn0VKAmY24SQ9s3mLzXI1ms9O6cQBPPVtUMnVinojz5N19OFYm6tW1BTGazKW4kfFuzzmah1Jwm/VamsTKQ09zL037gEB/sZEomCCW6BZUtwGcxuhPKo/I/OT0ivgaaPrWLFKTnuuAywRHtZTANifMAGACMw3HsZANZjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(6916009)(4326008)(66476007)(66556008)(316002)(31686004)(41300700001)(186003)(4744005)(2906002)(54906003)(478600001)(66946007)(8676002)(8936002)(5660300002)(6486002)(53546011)(6506007)(6512007)(26005)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckhzcDg1Z0tqQ1JxdXFRZjl2eW42aVV1WmdkY0w0dWRqSk1kOUdrQi9KQUNn?=
 =?utf-8?B?SUlsYUNQbkdEenI2S3pISlhzS0dJVzRiZ1pjZ3Y4T1hqT2Z6NEFubThhVkdp?=
 =?utf-8?B?U2NZcTl2SGlZODl2bkIxOFBxNWlUdHE5ZzFMSkczQnVLWnhUZEFwa3VqRG9U?=
 =?utf-8?B?aS83L0VMZGRrdzNLMGd6ZmhmM296bUpCU2FzbFRUd1R3eG9ZZEtuUVZ4TjFm?=
 =?utf-8?B?VFNtZEhoR3pJcDFZeVJ1OFNLVEM2Q2YyQmVIbE9wY0NYSXZUSVJ2RUJIUnJ1?=
 =?utf-8?B?T0wxOGwxazhFTjBBUHI3VW1jdzRsUFZxTGtzL0xrMm01NnR1NEdOVUs0UC9O?=
 =?utf-8?B?L2FDOHR2YmxHbkRRRFU3TVE1VTdOcmJwSG5FQllaSExOQ1lPNnNtK0RLeWMy?=
 =?utf-8?B?TjM5UzV0bU14a2VrRXY5R2ZVdUs1RjA1Z21BdThFVm5IN0taV0NsSGZsM29Y?=
 =?utf-8?B?L0h6YXJtTGxRa0lLNkhHcXZNRlpGMnppZDlmd3JHbkpVNnJmQk9oaDhaWDNV?=
 =?utf-8?B?cVB3ZGNMS2ZCT3VjTWE5bXkvOWVVZmtiUVVCNkZYWU5EZHBtVHIyQTVTQXZX?=
 =?utf-8?B?bktBdTRsRUcwR1piZEF6ZkJHR2VxOW1zdkNVQWhSUHg1NHpkVGwrc3JYK2cy?=
 =?utf-8?B?UlZFeExmZENseVZUajFLNDhTNDhaOVhSaUVzV3FxKytpWDYrdXQyVWdWZDlO?=
 =?utf-8?B?azJrY2VkbElZTWxuYVhiWmtOQlNpaGE1eDFJc2hSRFN4R24rSDJBVUJEUHMv?=
 =?utf-8?B?ejdPdkZYZHg3ZUk5L3JqV2Vwbi9SVW10L3pPaStiTHAybENGNmN3UmV1WUZy?=
 =?utf-8?B?cGxOa2FKbGl6MS9wT1MxL0ZTRDQrakpaZDBlTW9ZWm14cjUxUktlV2VxbUNM?=
 =?utf-8?B?cHBxTmFVaUVYQWhJQ1laTWM5T3NDNldPSWphRjJNMkNudTNRT2FZTWo2WFJ0?=
 =?utf-8?B?aGJJRjJuWFJud0lIQmlFWEptdEdFbjRwR2Q3ODlBK1U3UnBIQmNHdlNQY1M0?=
 =?utf-8?B?dnMvbmZGM0xvOWxGYkFUa1ErTzhhckIvT1FHcW5IRVhRNXlRank5QW1BUmd4?=
 =?utf-8?B?TFNvK0xzbGorK2FQNmdJQVlQbHlDc1dqclB3N1NocTRHNjkxbk1sRUhRY2NQ?=
 =?utf-8?B?aXNpWjRvaTBPRE1qOUhzcDdaNXFJaWx6NElJWFk2WncwQVRDelhzQm12OVp0?=
 =?utf-8?B?YTBjYXJaSmxVQ1RiWjRxOW40SnVLL2h0dzRkNWk5bFVMNnU4V0twWjRLaktr?=
 =?utf-8?B?ZWhtT3FwVERFYkphY2dmMlVVcHFZTVloM2NvY25iRjZYdU9DNjNjUm1qVjZJ?=
 =?utf-8?B?Y0o3enVyZjlKZmk2TnVHcjQ1ZzlGUmdlanY3N3dEWERKSVd2WUozR2F0RDFa?=
 =?utf-8?B?bk5ncjFEaWJLSU1lZlZ0NTRCK3ZodnFsV0plVnM2bndOcXlpY0lhZ1pJNktw?=
 =?utf-8?B?YVhDNWdRUVA1dFZ0bm5Ma2hacUN6Q3I4SW1zY0oxcnh0ejJpVXJtelIwKzZn?=
 =?utf-8?B?MFVsbm44dm1xb09SK2RRc2xEQ2pBeVVUQnNXOC82SDRrUE5nV0kyTFRuUmZK?=
 =?utf-8?B?ZTlQamFMbkl1RUJpTGMxLzJxUFA2d3UyTklRZGdpb1JOWHQrMWVoaEwyUDI5?=
 =?utf-8?B?MW82cXBVWXRzaklLWTVkQTJsTk1HbTdicGtHaXh2dFNaUnRvUkZwLzBXb0Ns?=
 =?utf-8?B?cWROYTlCYkQ4N0N5QTI4VVJwemE3cXpYNmd4ajhpb01yQ3Byb1JYVUJCUUNV?=
 =?utf-8?B?SWhkTzV3cUJObHhDa2F2aHRsYVY4cEQ0Q0JsWTBhOFhyRU1URndRQnh6cnZi?=
 =?utf-8?B?ckhYWXhpZzNKZnA4TXNkY2tHNDNNU3U4OVNhc1p4Z0dnRjA5OVFJdVBXekhm?=
 =?utf-8?B?VVlteXhBTzdmNXllVWtZa0kvd1l0OTFKekYzT2ZONU53Q3lnR3dvSmlGLzZP?=
 =?utf-8?B?ZjFKa0Fua0lUL2h4ZnplUTh2eWlWMEc0K3lRSWFJL3FGM1RzMGtnaC9XWml5?=
 =?utf-8?B?eG1hcDkvelhaNmRST0RTVkZ4L0RPVHRZR1VEUUpyRkNBT2taY3RGbWhJaGQ2?=
 =?utf-8?B?NTVwa3dPdVZicW1zMUlvMWVQc0NiNUxWK1hsSWkzem5sMHZ1S2R2RUFQVUpT?=
 =?utf-8?Q?QyrWNg4DS6WeiBzQBn4S5B7W2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3c7e4f-2c13-4b95-7c78-08db6b146487
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:12:33.4170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQiz7jG8IgHfBeVasfSG15fMK9Tx1BU+6SDAscbH0PDA+CGhH4vNLFchL4O5/kEeEj4WxTSgK1nu5J1kacwjzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6898

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This wants addressing the "Why?" aspect in the description. Is the present
code wrong in some perhaps subtle way? Are you meaning to re-use the code?
If so, in which way (which is relevant to determine whether the new
function may actually continue to live in .text.header)?

Jan

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -27,8 +27,14 @@ ENTRY(start)
>          add     t3, t3, __SIZEOF_POINTER__
>          bltu    t3, t4, .L_clear_bss
>  
> +        jal     reset_stack
> +
> +        tail    start_xen
> +
> +ENTRY(reset_stack)
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>  
> -        tail    start_xen
> +        ret
> +


