Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14D673C03
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481177.745907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVvY-0001Sy-5W; Thu, 19 Jan 2023 14:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481177.745907; Thu, 19 Jan 2023 14:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVvY-0001Oi-1i; Thu, 19 Jan 2023 14:30:04 +0000
Received: by outflank-mailman (input) for mailman id 481177;
 Thu, 19 Jan 2023 14:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIVvW-00019t-FZ
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:30:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2078.outbound.protection.outlook.com [40.107.6.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1290168-9805-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 15:30:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 14:29:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:29:58 +0000
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
X-Inumbo-ID: c1290168-9805-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRGfTNhiVEuPLLSFqQ1xmQv4QDJt4gk7FnVt2hVTSD8vgykRERtI/3eGNXkYc+VOfQcUo/utVRaTZMMoTncRY3ZSFAc+SYePgXHPxImTv3SOSxL3Ny2QcBvtsEH6DfYt3OTjFipT+YF7eWL7h4x1JGlmqtK92PAxE2zUPbHRn6KOPN+3PDqwENjl5PbwNUBPdu1CkGUNmbpCSSdKahmyA8+BSS2BiTP1SB0+M9KL/L8z9SCcN/OZdCTl8WVZ/6EU3/6Yxa7IL4IP13ngO+sinmGUnPdraSMtR7Z9DxeFTVc4yvtKSx4x0Invw18n/XEXKR1b/XjrcZxEpIYyjI5npg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFXTkixBq47cNfRB5KHH5dE8+Kohb9ygD1pQb9+/axQ=;
 b=HccJzFOLgwPnKK/WcsxQxdIppk0g5KXa+vtdGPXQw/0Qftgl0iQnlQEBWInt2SffKWYV7cr9A7/5YGxEcVxNQEqnnFCjOeY70L4jwoQegLErKQuSJVrn25L+1XjhkqfmbKGgitJ41LB4dZVLV+jnRe+t2dmIFXQobT3FKpdhjp1f8j7I3Zm9GNrc+HNZskz4DdH2PKW0dr9HKFpUuqrV9AsSA2iBm1PTehv9dk4wLmR1I/nCb0lBgVOtCftRu7XGaiAwb7Wy7qnd1pR92ASzMmhZInRAxEy1YuOqa7lNwZr6fQrvwL5awNXpaF0pE3o61iv7JM+PDe7jVFQ5b4uE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFXTkixBq47cNfRB5KHH5dE8+Kohb9ygD1pQb9+/axQ=;
 b=h/8kYbiNPTgkuIdXmtwq3C9K39ItbToGvf8v9PZmkQskuTaO4YYFNPuaEloDweLFAp8448yk3MamRZXeOZJfblWGhBLYkn8DKPleH5fhh/BcWb+Dx3rA7aoiK52py3fEveF5twfbYcd/W8x+MRGwOcVF5SJdbMPcaFiK+o280vzeMyBYB43flaWempsrNHY9LjXqT1gTgM131m1J0pRGJXCOFZk9ixsLLW9plUbzQHivTPasrGxCpZ1IuaQkILGkJMguM0k8drGR/AVbTjQfeKhpJUNGLY/OPWunP58es05wWIEkFDfJy9C0kR9EV/RqgyfqNvQ2bnzdorOY+n1q8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22992b47-bac6-d522-a8a6-c55c3c15e7a5@suse.com>
Date: Thu, 19 Jan 2023 15:29:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/5] xen/include: Change <asm/types.h> to <xen/types.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
 <916d01663e76a3a0acad93f6c234834deaa2dd72.1674131459.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <916d01663e76a3a0acad93f6c234834deaa2dd72.1674131459.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 70187d71-7c9e-4d24-de7c-08dafa29a437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ilaxrJQm8IzWnMUritKMpedmIIggNoM8TxEs0ATsF62eabuDyRR776+/BLvfDSGkHbKwI8lxggA0qz59WiwWTJRaGgYXhH57A7LHcS9CyiLkMcmpcpP6+XNAVA4raGS2fXDOAK+JsIgAP+Xrl8uCZnDUpuq6LiFjOyFE3UoKL4AsU8/gJnAWVlNQ2fa4D1aBf5LBnlQwo8nbIeBbVVZ7YJkwPTB/JrQS8+39/ZTgJ2b7r27Yh+88wJnrelRQtvQv0j+c3RrRm/LqpRkAoov+aA5uWEuv31tw0Bl90mP56Oi52kjiAO8OyCPR5dml/qoh4Vlz9DYUXkzX4MdProQL7QM0Q7BicCe4VgTs8msO+obLocn7/UB78LMPBqZG6CcBqLEVHFiI4sODZbwcFQxGkWT98GyqOsuneo0pxJkbWD9Q6cU9+6IrpDeTTHL+/AiExY79nd4V6F8yhD051njGvESQARr1+WlzOsAFbQJoTgqHR5zwyrDMzzcy2u7XpgpZwoY9IUMjZksZRxPjHSK1zTRJ2uUXDxAjd8pjCsqFR62wwmDHF6u4tL9W8ynvi5QttgiYUVVId4fgwTH1Nmy4znbib1ytNEwinAt6b/6qgy1wqVmPel/IdwF8t7fs7j3YrCsu0982GZBm0ISxATMIrL6puIRcvt3rpZOicSStJlh3jJnih7Hfm9O52v+cS3ixIgFjLoWFjT0dMssjuby8L2GEXpNyZeV+svBYUXx1UnPo4mGuuX0Q23EdfdaiKh2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199015)(478600001)(966005)(6486002)(53546011)(186003)(26005)(6506007)(6512007)(31686004)(8936002)(2616005)(41300700001)(83380400001)(66556008)(31696002)(6916009)(66476007)(4326008)(86362001)(5660300002)(54906003)(316002)(36756003)(4744005)(66946007)(8676002)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0tGMEhtNDY2ZGRNMmNFSFlwYXdzd2NCeldoWm50WnU4R25ZMXZEbm80Vkhq?=
 =?utf-8?B?bk53VUFjTjdHNk5KTXlIM2RQSUxUSG9wcVZhS1RvVS9Ua1g2bEFoeWg4WnB0?=
 =?utf-8?B?NlFsZjVtZklwSkJ5STRZcTZVK29rVnd3Ui9TSHlRQnRUUU5QZHVHVnRnU1Uw?=
 =?utf-8?B?UVJQOFlzNE9WVlB0WDE0L0k3SFZMeXZsU0VXTHVDQ0FzV3pPc1hsa21CYk5y?=
 =?utf-8?B?TFBOWjNTemNsOEE0RjV2ZVpZV3BTZDJ6U0ZGeWw0MjY1c2JzUmtMdHI0R3hE?=
 =?utf-8?B?M3A1UzlkLzJ1VmFqbTRiNzRBbDF4dkkybkdaWFpHTEZ3WUlRSkUzQitSc1pm?=
 =?utf-8?B?VmEvNTFDUTR2Nkt6QmJQaUowK0xTcmhEMHBXeHhTcllNTmd0RkUyZzVVVmhr?=
 =?utf-8?B?cEsyUG9YK015YmlJRmdSOEVacldmaEFaMGFmcTlib1NuSmNSSG9nUEtSVmpI?=
 =?utf-8?B?VDI1V1ZqcFVac3Voa3JmbXNnTzY5VDg2ZEs0Z0F3Vzg1cVl4cGd2TWdxNVBs?=
 =?utf-8?B?eTd1K3NrV21TQUlKMlZyUFZESWpDaWROdHR2bDZKcUxmQ0VvZnlpUHlYcnlB?=
 =?utf-8?B?N0M2Qkl3QTZqSU9ZSjNsclJUbitXditKOWxVaTBISERzR1NqRitaUm1UWkVh?=
 =?utf-8?B?WWhHQXJ5VmpNQ25JdXdaZmpUQnQ2RDM0c2RqZlNrTXFRUjhiUGxzT1ZmWDJu?=
 =?utf-8?B?YnNQcHYwQUc1K3FvTG41azBteTY0VEVwZG1RWDFBQWdpekVUOVFvSTJaRkIw?=
 =?utf-8?B?QVRDSGtSeWNoUUd1ZXBUTzBCV01WSm80RWphVmpwWmxOc2JVcmowSGlUN1RF?=
 =?utf-8?B?aE9TUUhRaXF3V1QzY0FicGh0NjBWVUFLT1N6bnYwTW1ZTjZjdVdEQUxkNk1i?=
 =?utf-8?B?RzhiWmh4a0dWRlh3TmZNZm02R2dxSmIwTE9qMENicUNaTUtPb01KdGFOQ2FF?=
 =?utf-8?B?anp1RjhzMW0rcVR5UVZXTk9qQVA3R0hwMWNUWmlCZE5RemlvNk5LWFY5Y0NL?=
 =?utf-8?B?S2p4OUgxZXdDR3FnNW0zQ0xueGtBeWlTQ0JtOE94cVNYb2hQaCt4NGlNZzJB?=
 =?utf-8?B?eTZOd2w5cURSWWs5ZHNXZXdSZWdmOUJpbVowTHlNMU5DNHpGZXdkdWp4L2gr?=
 =?utf-8?B?ZUxLMTlyajlTbU5XZWhXZGZUQ3oxcGZOVzNLbzdRQndSWlZ2Z1ZHM3dLamdh?=
 =?utf-8?B?Y0VFbFNpaS9XSGZvc0w5SWZGTHRqWlFGQkxzeUs3RXdSMTg2UzFRbXJjNDFR?=
 =?utf-8?B?RnRRbVlxUGZVbGRUcW5qd1JieDNSSlVvN0NQeG5nbDNVMW5YTXhURDhaZEtE?=
 =?utf-8?B?cFRWSEN1Nk9RL04wTXJDS1dUY2xZRUM4TlhxM0tqK2Z0S2RtOGZkb1lXLzBx?=
 =?utf-8?B?OC9xTVdZd3ZTNFZrbkZMV2hHSG5mNW1JL0ZvMVJUV1hRbkl5Uk5GTGY1TVBY?=
 =?utf-8?B?SU9Od2RBaVBROThnaHVrbjhqMDJka1ZzWWMzazFLeGtjSFlWR3B4QmJvbGFo?=
 =?utf-8?B?YWJyNXYrdzFsbnFEczFWMHlJVVR3TGNmby9ZZ1IyMG9KTFNEb0dqY2ozdlVZ?=
 =?utf-8?B?OHdaWXdNd0dENjF5MHdFY20wTUZyM1VlQ1pwYXRzWDFkN3QxaWluUm8vamxR?=
 =?utf-8?B?dzZWR1dlZHNUd250V2E5c0ExVmVwOUp3dEM4MkcvS3dwMElFQUgyLzVwK2pW?=
 =?utf-8?B?NTZ2alJ6UEU4RHljMjJhVkQrNjVQakdxTmgrREZqczFqeWQ2ckJVNStKYXpi?=
 =?utf-8?B?NWlTbEdjQVZhZldjUnE1ZkdVM0N0WHQ5K1E4bFRXcVJsZ0F6RFhGcGtSWjRs?=
 =?utf-8?B?SjFYQXhNdWFFN0Zicm1SQ3FIYUNmaHU3QklWc040MDh1a0ltc1Bac3lnRC80?=
 =?utf-8?B?dG9PZkl1dThmQm9HQUFwc1pnQ1kwUFVrSk9lZ3dqWU5QcUlzYVYyY0IralRS?=
 =?utf-8?B?Y2JpV3ZxRlVJYzZYODVCbUtrSFhIQ29nQnhHbU1QbmNjcGVPWThTU0xhNXlw?=
 =?utf-8?B?K3UrS1ZRWTBBWEVhcTdqbFhyQW96Y1NQRHJhZFNKMW1MOHIrL3FuWW9seEM1?=
 =?utf-8?B?TmhoNkJaL041NU5CMlVrRmJWN0YvNGJjRkpkZ0J6aEtldHg1SWlxR0FrR09h?=
 =?utf-8?Q?0qX9T+pfPoFsBQxVWOmh2JOdJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70187d71-7c9e-4d24-de7c-08dafa29a437
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:29:58.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U19KfK/vABYb/9pgPSBGo48HcRKEEPAY00IkzDpfRSOWUyXtfx0UxwBuiNIEP/ey4he+DcH92bCkjk7DnHGY4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 19.01.2023 15:07, Oleksii Kurochko wrote:
> In the patch "include/types: move stddef.h-kind types to common
> header" [1] size_t was moved from <asm/types.h> to <xen/types.h>
> so early_printk should be updated correspondingly.

Hmm, this reads a little like that patch would introduce a build
issue (on Arm), but according to my testing it doesn't. If it did,
the change here would need to be part of that (not yet committed)
change. On the assumption that it really doesn't, ...

> [1] https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com/
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


