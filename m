Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C67578D628
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592925.925774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLIB-0004En-El; Wed, 30 Aug 2023 13:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592925.925774; Wed, 30 Aug 2023 13:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLIB-0004Bz-Bm; Wed, 30 Aug 2023 13:31:31 +0000
Received: by outflank-mailman (input) for mailman id 592925;
 Wed, 30 Aug 2023 13:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLIA-0004Bt-13
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:31:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86557051-4739-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:31:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7833.eurprd04.prod.outlook.com (2603:10a6:10:1ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:30:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:30:59 +0000
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
X-Inumbo-ID: 86557051-4739-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moO6DFhTzDO8F/em2CeMswJ0sZY87QNKFL9s0hF49jVYNYTfXquIJsVo/bQvw4xwPJJEGuJt0m6DRsNjp80IuO5TUrePH2P2ma4hYJWHZg3zMGnub9pQw4WOEJj/zeEdw18oNXzHxz7sI3QoWqHtXLe9zSi+efcUpPecjyhy8o1wyzFehpb4T/HZBECvOGEdeAlprAEmQN0ubKo255tAvvOBdzFiRubsz1mVvbM5lNgeKCrEch9pFobiyAtTH64l75P+hG1vGgkh5HK7zr5YG75Gsx3mbqoyW93gFojQcyrJrcehoKmnc40r8pBuFXMHPIemjB7W88+q75TdSF6xfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXqIK2G696FTBrTz2yHQoXEgl3saFIS6AI/J3t0xXw4=;
 b=a4vXeCecb9ZoiRiMJk2nB96nVuCCZCSL+hY7uyl1EyEEK+VdtE9SxGmdHHWSCvqxL24JQhchXiwNVklDInds8qyh9+2Xmqd40XS0tSq6/XhIBfzuF7HRe2G7x6DEg07bzEmeAGi694gtsTrW4nugI6gGAjP4OXsuIKHKLtABfpBbbDZ46hdlQH6yCbZFyLDVyLD0WHySJlbHKe1Cl32F9VV5kJ341j/cwi5/LzJafRkawzGUUhdizuZ/0ruwkds3NNcOjF/YDMjWxzyeGz8GPe+7+btVBCpwUZVsnwDT5uJmOq9j+9ofWAuhl1USFJ7BArnAQrImKzib/ZGYSyUYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXqIK2G696FTBrTz2yHQoXEgl3saFIS6AI/J3t0xXw4=;
 b=cB5AWwppcFtopmLV8N87WzaYOVlBmfg4alP5WxU2/DwFfhn7DYl/sx6TuMz7VW8ZIsG2111obmOvMTMB9+DDcc6llBjyDdESfQ4Fv5Sg3p4Y9+D5ZRGNOojOS2KB7gZjKhYALgrWzIVCJ/7bQtRoin+RTJAPqCaAMW5bQht7kWaiQpkO/W3RE5KC/c5qysHmxeBhgNvJ7Q6m3j8i1AZEZOUDkv6Yhndus+T+uGrv0OsiLZB61Nd1nQHgtP1AsaNrchPeYQ9YymsnXJOa1MXlRS3YGJ7FBOcrORNq7KMP6rbjbLWih/Jk2k+TMo3JWRT3daTgY5Dg99jS9zn1t3ks1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb9854df-67cb-8d9b-ac2d-75ff11f29367@suse.com>
Date: Wed, 30 Aug 2023 15:30:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Content-Language: en-US
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e18346-d6ae-4789-9492-08dba95d58b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zny7PfaGjJpUM2b0kF3vXtPFJ8OVtAFK7GE0owO/rNV/2unahUmWVcyxqexSc3E/cblU67LZshOXm4yxcILFen2Q8ND3JBMbcz3WTtTYEK/npbi0sTRK4zVwwYlxjbtaZ7eprPJx1nGtD5rVVJnPQTnqVpfuhvjbbmIC/vYFPG1ezeOPVswlPN8qQEvWonY04+C+tE1do5PeKLgnJEle6ukpA3sfhJcn9tBpg+MR7B4dbCTsu6jZLU5iSluzlPI3AcJW3tW4xVSLOvcf0CjGJnFASG+zAT+PJt4zn3daO65Tq8xknB8/4VSA15qlT5EjiwwQMo6k3PlUPF7QAVlqxnSh9ALDjFsOWoGGGyKOSSG8fTPXbKTytXouATIuafN26WFXFBppqQi8iJPKLPHpjLXCibkR9sviNIIYTdRPKWeuQoJryTAHg9ThZFmuIP/5fRExsNfTTFelwmGngfy0mN6CnIbksbJqIDG/dhGjam8cDFlihSwWJqQ90XU9mEVEC9/GGCuVEKxHC/6CGSxFh2vqXfEg50SgXbLYL0WW9WIGzCs1I8rEOQK6P292RGB9VQTKMYjB6breRMUvICzfo15vsgwBVCh4PzvEjMuLYRk/KwWidnDsIPoA508uznmvlys4YjmCtMQrcXIbRkiQMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(1800799009)(451199024)(186009)(6916009)(66476007)(66556008)(36756003)(66946007)(54906003)(2906002)(316002)(31686004)(5660300002)(4326008)(8676002)(8936002)(7416002)(66899024)(41300700001)(6486002)(6506007)(2616005)(6512007)(53546011)(26005)(6666004)(478600001)(86362001)(38100700002)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXNVYUlHQ1h2bGtNVHVkQlVuZGZidXQ5UUFTUXJqRjRBNWl4cml5WVZRYVFI?=
 =?utf-8?B?b1hMdVJDWGg0ajJPbVBubWFFNi9pWFpiR0hqSDgrYTlZMGhsclFUQmIzRnpT?=
 =?utf-8?B?R3c4YkF3bVcxbzNOTFFuRnhVRmVrN0ZrRDdsSVhJcWJsMUlwcFUrN0Y3eU5y?=
 =?utf-8?B?Vm1iR3NVbVpNSWZVN3RiNm0wWlhqQUx4SEdBOWljZEZKQTJSVXIva0x0b0F2?=
 =?utf-8?B?aFJEV0U5b3pTcW1rRHk0MGdBZ2FwT2djclVYanduQVdBZDlWeEV6OVlCNlV1?=
 =?utf-8?B?SHdaT2hmOXN2UTNNZFpiWXJETDVaeWtxMk5XUEZWaW9adXZJSlVQa01QRW9S?=
 =?utf-8?B?THZJZWdjQ0JSekloUlMvNUZpVmlWZW5CNms2eldIYlNDazlNVzFPdjBKSENE?=
 =?utf-8?B?K21zeGxyUjZCa3Q5RC9zbUYyZURmcW9yQ3c1R1ZHcXV5aVdkckkyVUVOWGtU?=
 =?utf-8?B?dzVGcEtTek5WVGpFRXlOemJ4bnZHZlgwdStoODkzaFZwZThRSWZWek9PMHZR?=
 =?utf-8?B?a1VFcTdFQjFmdHJCcGdmYk5rbmdZNzJXUG1lc2FhQ2UzYkpYVk1Zb0Vab20v?=
 =?utf-8?B?SUtuSVZFd0tsak9Ga0lqdlRFTVRpOUN2amlHMlBLZjNjQUJYZ01PdTlVZWdN?=
 =?utf-8?B?bC9uSXpadWFic0VVYVlsSFdiVzRRNW1tWGYwalplVy9ZSDMyUndqRDllOFNB?=
 =?utf-8?B?MUJiRUZSczh6RlFJUDBLd1JnVE00L1VYcFg1NUhxZ2MxSWxYWU84dzFicVYz?=
 =?utf-8?B?YmgvdGc2dFFmZ21pQVo3UkxpZC9MMVpXODQ3cXN6cDVTLy8rejFZaWl4ZDdw?=
 =?utf-8?B?V2NvNW9YbGJqSjR4WXNGbkd2V2J0bjRscUFTb09zcGdxQ3N0M21iSFVjM3kw?=
 =?utf-8?B?WWQzWk95ZGNoUURkZjFjQi9pTEIrQVpxN1JUaWtlRmhTWDJZRXZ2QTBNZUg2?=
 =?utf-8?B?S2ZhSGZyZHVUdEZ5M0xjTG9jZ3lRV1U4TmhLSjhwUW91Yk8raHBaeFZ6a0Fv?=
 =?utf-8?B?UDBxelpRUnQ0cGpPNTUyOUNBbXR6aGVtNlRXRDg5SFMwcnB5OHRacHNnKzRt?=
 =?utf-8?B?aGFFcUZoT3IxQnM1NnFXNUZxaGhTMU90YWYydnFxYTd3VHMvbytMejVhYXAx?=
 =?utf-8?B?SGFhcWVJMHQvYUx3ZHNNazNqSWtONWh6YzMxZ2s1cWpoVE1KRGhVUEtVRDdN?=
 =?utf-8?B?dFJjM0RTWmsvN203UUdaeENhWUxHVWE3T1BpSUwwTCtmMWxaay8wL1VOWVkw?=
 =?utf-8?B?QjQ5SDFmNUNoMFZQbGtMQ3B3c09KYXVLRmYwdmNmeWJPaVVldGhLSytodFpU?=
 =?utf-8?B?L0RrZVNLWG5HeHg2VUZuM1NwR1dIWlJicGFYdmV2TU1pYzR4a2Z1cnBOZ3dr?=
 =?utf-8?B?cFp6RkFVZXhIamtWNzhKc00zbnZ2QWxKc2d0Uk5aMDBmSmtWTTY0dFNuWkZZ?=
 =?utf-8?B?bWxYYmIwVTZXbFkzVUt3cUJjSitJSGpQemNFc0x5bFZVRXdCUUk0em42dE5o?=
 =?utf-8?B?RVFUR3BlazdESGdDOXVjWFk2YkRjd0wzYUJaUklZRzl5aXJhQkZOSFROamF1?=
 =?utf-8?B?M01SUGk4ZllmNUlYUnh4LzNhYzYxeHJpUWN1a1pSUDZDdXdZdnpoM1hjWDVS?=
 =?utf-8?B?Tk4zWGpCc2VLbVFrMHNML2hRZXE1UFhJU3ZuWU9sOG5Xbi9MS1lrMTZpckNk?=
 =?utf-8?B?ZXQ4NCtBVndwNWF5YmJORVF6STlZU2lRS3lYd213djFNRE11L3BhUXBlK0Nn?=
 =?utf-8?B?Rk5vSDhOVFJlcWZCSVZBQXdjQjBsdVE5U2NZMmFQK0VZRDdRcHlLSXltMTlx?=
 =?utf-8?B?OU5LRUVCTUtmaEx6UGY2ZXZBQ092Nm5tSmVyb0tpcmxsSnI4b3Z5d1BzMTMr?=
 =?utf-8?B?b3VxVGhadmpZT0V4MlQ4NHlxL3dKd3dwZXVKKzI0SU85bVpObFNXMFk4UURZ?=
 =?utf-8?B?OHhSN3piM1QvS0tzU3NWcDNacE5CR2s5dG9iNGh1eEcrN2ZvYzJEb29pK2lM?=
 =?utf-8?B?M3pBckJCQnd5QTAwTEw3RUpKalNhNTNBV05uS1JaMHhJTU8yZzkrc21GWnhz?=
 =?utf-8?B?THJscVRlZE5xRmE4TTRmQjYvZnQrUEZxQjNlckI0RnIrMzNxSitMMzJ0N1g4?=
 =?utf-8?Q?YxjADkm1MDPEEYHAhMF2rJr1v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e18346-d6ae-4789-9492-08dba95d58b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:30:59.0346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRS7CUndxTcR7u8Ot3ZJN3fOraZu/GwHgbWauDVRmFLpf7gICctSCJk47YrQeGbhvCwSxGdVMCvaqWtGes/XTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7833

On 24.08.2023 17:26, Jinoh Kang wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> All #DB exceptions result in an update of %dr6, but this isn't captured in
> Xen's handling.
> 
> PV guests generally work by modifying %dr6 before raising #DB, whereas HVM
> guests do nothing and have a single-step special case in the lowest levels of
> {vmx,svm}_inject_event().  All of this is buggy, but in particular, task
> switches with the trace flag never end up signalling BT in %dr6.
> 
> To begin resolving this issue, add a new pending_dbg field to x86_event
> (unioned with cr2 to avoid taking any extra space), and introduce
> {pv,hvm}_inject_debug_exn() helpers to replace the current callers using
> {pv,hvm}_inject_hw_exception().
> 
> A key property is that pending_dbg is taken with positive polarity to deal
> with RTM sensibly.  Most callers pass in a constant, but callers passing in a
> hardware %dr6 value need to xor the value with X86_DR6_DEFAULT to flip the
> polarity of RTM and reserved fields.
> 
> For PV guests, move the ad-hoc updating of %dr6 into pv_inject_event().  This
> in principle breaks the handing of RTM in do_debug(), but PV guests can't
> actually enable MSR_DEBUGCTL.RTM yet, so this doesn't matter in practice.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> [ jinoh: Rebase onto staging, forward declare struct vcpu ]
> Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> CC: Tim Deegan <tim@xen.org>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Alexandru Isaila <aisaila@bitdefender.com>
> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
> 
> v1 -> v2: [S-o-b fixes. More details below.]
> 
> - Update DR6 for gdbsx when trapped in PV guest kernel mode

I take it that this refers to ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1989,17 +1989,17 @@ void do_debug(struct cpu_user_regs *regs)
>          return;
>      }
>  
> -    /* Save debug status register where guest OS can peek at it */
> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
> -
>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>      {
> +        /* Save debug status register where gdbsx can peek at it */
> +        v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
> +        v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
> +
>          domain_pause_for_debugger();
>          return;
>      }

... this code movement. I'm afraid this should have resulted in you
dropping the earlier R-b, and I'm further afraid I'm not convinced 
this is correct, despite seeing why you would want to do this. The
issue is that this way you also alter guest-visible state, when the
intention is that such now happen via ...

> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> +    pv_inject_debug_exn(dr6 ^ X86_DR6_DEFAULT);
>  }

... this call alone. I fear I can't currently see how to get both
aspects right, other than by breaking up 

Jan

