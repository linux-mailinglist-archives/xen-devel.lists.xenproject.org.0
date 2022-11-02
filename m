Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF43616203
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435832.689655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCFG-0007Tb-Uk; Wed, 02 Nov 2022 11:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435832.689655; Wed, 02 Nov 2022 11:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqCFG-0007Rs-NU; Wed, 02 Nov 2022 11:49:22 +0000
Received: by outflank-mailman (input) for mailman id 435832;
 Wed, 02 Nov 2022 11:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqCFF-0007Rm-0u
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:49:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62020c41-5aa4-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 12:49:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8180.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 11:49:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 11:49:17 +0000
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
X-Inumbo-ID: 62020c41-5aa4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaJFsM4e3L/K4+b/Fh8kPXvxCmm0ZuIZzIhbhHR3uKpeLqkQF5ByQ2tjjJYav8/18/YuIqPuQ7lM1pkv+Xg20j2Vt6yJtXbbTpbpSzLnkeaYVOTfhHP1f2YiGQHqzEKWY1H+b6ahWE8IOvto8zNVZkO8vbPM4iWaDzRUHVRq73Jb60SZkcjRr8rc+1YQKDGa10EtjwlKm+EQbPDQ8iHik3Rq5OFy/Z/Fg7nbpELSGaxG9YaF96RuD23JkvVvufKAnd76Y+qf450+ABdnalfRA/Kbcib6N6WCUfcUNj5w9xgl4tVbaKDPQB8YYGeYu5N/q+OFbn/7d2cAAbvaEYi9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOU5Dky2cwCRpHacYiYggxCYvslZlCxBQUq8SWKcpbA=;
 b=QUqvS1cHGcODVFVFoMEE3OdIvQRgiyY3KPcqrQR3NJaAJJBgZBxf7B6O9MfL7TB13Enji57Xu1qYDge9H64WI7sX4MldV9Z+8ntTsnpCGfLpOSNUttG72fHq6t2PF72L6867EYpN5lF4OYLEQUtMSqG4Hq0ka3s9KIJSiuKRwrBP7og/YI7ZJvpdeS2L1Y/ss3KKud5gD+9yjlJ53Lv9zgkacNAOa9NtPSPjGzxlarB+djiz3ntKmRvHURYP5WgeV8zRqh1evKix+/Mtjfo/YohtZdQ/5+KGI43v9vkQxYTZ2u2uDNY04yQJRAEYl3SCq9bCl9qQq+0rVZcHRoXlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOU5Dky2cwCRpHacYiYggxCYvslZlCxBQUq8SWKcpbA=;
 b=ZBv7tvkkPTvgIYQhCRgAoHp8TLLxCckIDlzuq5HItpZAREGtGumY9H+uy7Hj8lFgN0vHZwdlh4QLaYAy+d3T/akDLgcuYQA+PCHwuPgtjMq2t4Yp4ZpMtpQwzaL3GmdaREtIXxqum684vpuGPmGVkFqK/tD44ETJ0UE+AgPIL/W0AIxr34YB/Zl1F5VHGqMWriQFZQQuMq9ZSIXo8/qoTpLF7IedfNb4gWXuTkrNXv0ouBQJGwBqvceN6kUVuhFAb0XW3gqkk/NyXiun3+alOlmJhJBG1x67UP20z00dN4aASxiZ5r3Djbnm4vNzMeBlZpRuz/sJkbJsIJsWKNRYwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
Date: Wed, 2 Nov 2022 12:49:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221029131258.95811-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0065.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c24fbe-617b-4ef3-5b78-08dabcc84584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kFkDrMx0yfAwuU3a1zk/IOHptL+PTNEnK14rAugfOEpYdWT5sanEGyZ7GGigLDFmaEJOkOMH1QwIwnn8Y/NqkxSAGOVv5jHseWHzZZnvAPeCivCmjR2w9ulZviONLGGw+gJ7lteoMTwE52Fh0yPTOPe+smcD+sWJpkiBtZAOQS2etXNsrdDvGvy3R8qCyD90dJ4VwVNHKE1QaEcaBHpG4X1vz9NImgjNf4XGQSmCAzdj5CUcMYmLMKRF/J4lsZn0pnraCOxRGB++DYaMSgjEVwhDM+ps7zBQ/smYP5NmOnBTUZlg0usisQi41rsqpk/QNaFo297YpyY4nDOkhB9HM2bK6skMlSjCJFAH4kqGPESSiE6f521AkMmPTzRXBltRCn4TWf0KmPCPcyYGtK9VW7x3iWIe130bvHfOQ5jHc15OqwaTs9QX6fU8VsyfoC5P3wSp+6yVaNMaQii+vL+KDPUYwwm3gEdZCZ6FT+n4eZxLDSL1IgP5butDWooJDo8/O36A02LyCQMV7yzs1onjCsZx4QswK8mcVAeF6Mmt3xjnw0ZqLG5Em+vHh3jGQuzIrMop3lUZV3g6Jok0nrAfd80CeFdLK38YR01HBWR/apb5+nEhidr4R6OejT5aU9kYMqhLFJTLjMDbW8G3Ba6I/d+H0sWvm2Pofskcyx7VWKPlSEceT3otPOA3yyDlcg26UWuBeTHfdoV7JHDzpoYWiHh+42ZS84mWP/w8MYklwe/ALsfeRIWODlxNPYNV2XUPF3Q61hdsXdTnU+ScNJMsn7CxcZfxWS0a21EMIHmyiv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(31686004)(36756003)(8936002)(5660300002)(38100700002)(2906002)(86362001)(31696002)(316002)(26005)(6512007)(6916009)(54906003)(186003)(2616005)(478600001)(6486002)(41300700001)(66946007)(4326008)(66556008)(66476007)(6506007)(8676002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNwSm4zMnF4MEJpRUhNMzhCU1hwRHl2eXdnTnNiY3dycENzbTRKRGU0aEp3?=
 =?utf-8?B?Qk0weHE0Z2VNVUZxaDFzRWk1cXl2OVRVRktCb0RNZVFXUHJOSzdjejA2U0dL?=
 =?utf-8?B?UllxSG9KUjhaV1h3MG5xN1dFcGtsemFFVVcxS1F0VnBFc05SZUxtaWJxNGt5?=
 =?utf-8?B?YXo3QVpudkVzMmV0alFudDZCUU02TWs2RnZrREJDYVJpQTZMVjFRQUZyZnRH?=
 =?utf-8?B?TkE0RVhNUHNzZUVFYktQaWtXS2ZCVGErbm5UU3k3ODFSdHUyR1B4ck0wNncr?=
 =?utf-8?B?UC9nU204QlJlL3RuM3lZQ0dKTVRyN3dFL2dBUk1tMXRWK0h6dDVLd3pGZkZU?=
 =?utf-8?B?dExQcTV5SW9iVnFGNEgyVlpUVkNYd1ZySldyNkpGdncrR3dGQVExZytwWjRj?=
 =?utf-8?B?UUdJSjE4N2krK05BSnJWNzRCWjJoUm8ya24yUFUzM2FyZjh4WmVHZjhITndL?=
 =?utf-8?B?eXNtOHM2dHJyQWVWYTdUdjZpdHh5djZRQThkVnFzNXc1RDliWlBlTXRTK0xP?=
 =?utf-8?B?bnJyTUhKQlFjWXJKMURPMVV3cGd4V0RuTldVSlNzSGs2cDZkRmxpaVVnNmpY?=
 =?utf-8?B?cnhLaW9CUEEyY3JlaGV3TkNMY2Z4aEp0U1lnajNuNTBUaHRYRzJZU0ZyOTZ2?=
 =?utf-8?B?QVpjcjFaM3hEMjR2K2s2TTBpNkdXRGhoK2N2VVhaMGV1K0E4OWYvWnpFS0c1?=
 =?utf-8?B?SS84ckxZQ0VLYjZYUE93L1VXVmJQZXJROXJab3J0akZGaXIzbURmeVg3eEZB?=
 =?utf-8?B?dGxaczFnVC9vaWdPaTUrdCtCVUw3dm1rVVNsb0o3dnFGd2dQMVRsN2FVNW9k?=
 =?utf-8?B?VjJoL0pvL05PL3VVMlQ4ZnEvQmxoMzdEeWJyWERPSURlUXE1ZFppNEwrL0FP?=
 =?utf-8?B?VndtUWlPZW1LTW1DbUVzODY2cnhNVXJkTDQ1K0NZQjVZdmJHU2pSdm81azF3?=
 =?utf-8?B?ZDNHdUkxSFdOTFZkb0pCMDJDOFRuWkVxMmY5MG5uL1IvcnJnUGQ3RnJBVlpl?=
 =?utf-8?B?eFh6aWxLS25qdWUzbEF4NWdWRVVXY2U2RWZpQ29hV1VmMXNBejN5WVF1SGNz?=
 =?utf-8?B?bS9tUnZ6YTIwNzVVS1V5UExPL2pvYXJRNmVlR3VjNGZEa0VIVjkybzZtWWti?=
 =?utf-8?B?SmNvaTlJZk1OcUVlUmNBRlpkZ0lYT29hS3RZOHFLaVdhSW4vcS9kMitGZE93?=
 =?utf-8?B?WTJISUJMUDA1a2dSOGNhei9WeUFVUk4wcEdpMGxwazZtVnJpdExVVjBvVGFz?=
 =?utf-8?B?YjFOK2hrb1dvcW91YmVOdG9PdEdaVWsxYTRqZlh0UWU3alhBNHd1Vlo5ajZX?=
 =?utf-8?B?SHVnZG1mYnp4YUhzZHFQWGtUais4djFwV0dpaXlBVDhmZkNMRThpWkI0eFFB?=
 =?utf-8?B?VFdBOVViMlFxQzR4UEtQTGFhWHhDdWJGWk8xQlhGZ2dCYmFodTZDd0NhUy9i?=
 =?utf-8?B?SGs4TGI1Qi8rVHg0djZqWnVCd3NnOVFjNjhFVkZibFp0d3BURys2SkJBM0px?=
 =?utf-8?B?Qm44OFUwSXZlaVFNRk1yM2MwcjJGZVNjbnRrNlFNb2o0LzNlU2xCeWVXcTM5?=
 =?utf-8?B?WU9jRnNFczNicmhHZndVWkd6R01zNGladTI4ZnRvcFIySG1kRTVIOVRZU2Z2?=
 =?utf-8?B?cWFSakVWaXJYM0xQRjVCSng2M0tYdzBLS0ExU211b3BTVU41ZEJzWHdubFNm?=
 =?utf-8?B?OFpVa3NpMVNTbmkzczhvSUFTTG1ZUzZrMFJVRXJPRThwdFJtNjd5aVpRY01E?=
 =?utf-8?B?WXp0NXRGWWttVFF3aFI4V2ZGWkUzbnNJWTVJcVJlMHFNL3cyR0RuOUNuRlNm?=
 =?utf-8?B?elpjTDY2eHhFZnY0SVgyak02ckhZUTFhWHhSa0x5eXpuMndzVnE2WGk1SEl6?=
 =?utf-8?B?T0pyM00xeWF2bWdiek43emx3TnliTHZudFRJSWJCVzd4ZzU3dzNuZ3FmbVRn?=
 =?utf-8?B?VUxBeFZxMy9mN09POVdXSCtKN0VYcVd0dXd1SmR4RklGdERxY0w1OS9uVFRk?=
 =?utf-8?B?RVd5R1pLKy9ORGRLeUU1Ym9XcE1ENXVleXdrQnhRNUJFZEdCc05keWp3U0Nu?=
 =?utf-8?B?c3lvTEF4b1BVdkV2WHdFQlozZ2Z4R2lZWHpqYlFTWVROREptd1FHZGtPSkJS?=
 =?utf-8?Q?sj6kExx3RTnbN09nKsmXqckTb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c24fbe-617b-4ef3-5b78-08dabcc84584
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 11:49:17.3067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFJw4CZRccX4L2q208WZRtF+5OiNUIXZMVXR8k40gxhwybnYMurWQuSYkHwtSaDmTltly2Y+VyANSER8Q2M//w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8180

On 29.10.2022 15:12, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>  
>      /* Resume use of ISTs now that the host TR is reinstated. */
>      enable_each_ist(idt_tables[cpu]);
> +
> +    /*
> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> +     * is already cleared by svm_vmexit_spec_ctrl.
> +     */
> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> +    {
> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> +        amd_set_ssbd(false);
> +    }
>  }

Aren't you potentially turning off SSBD here just to ...

> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>  
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    /* Load SSBD if set by the guest. */
> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> +    {
> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> +        amd_set_ssbd(true);
> +    }
>  }

... turn it on here again? IOW wouldn't switching better be isolated to
just svm_ctxt_switch_to(), doing nothing if already in the intended mode?

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -697,7 +697,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>                  msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
>          }
>          else
> +        {
>              msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
> +            if ( v == curr )
> +                /*
> +                 * Propagate the value to hardware, as it won't be context
> +                 * switched on vmentry.
> +                 */

I have to admit that I find "on vmentry" in the comment misleading: Reading
it I first thought you're still alluding to the old model. Plus I also find
the combination of "context switched" and "on vmentry" problematic, as we
generally mean something else when we say "context switch".

> +                goto set_reg;

It's not clear why you want to use hvm_set_reg() in the first place - the
comment says "propagate to hardware", which would mean wrmsrl() in the
usual case. Here it would mean a direct call to amd_set_ssbd() imo. That
would then also be in line with all other "v == curr" conditionals, none
of which apply to any "goto set_reg". ..._set_reg(), aiui, is meant only
for use in cases where vCPU state needs updating such that proper state
would be loaded later (e.g. during VM entry).

Jan

