Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EF629F12
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444021.698794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyot-0000KD-Jf; Tue, 15 Nov 2022 16:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444021.698794; Tue, 15 Nov 2022 16:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyot-0000Gu-Fx; Tue, 15 Nov 2022 16:29:55 +0000
Received: by outflank-mailman (input) for mailman id 444021;
 Tue, 15 Nov 2022 16:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouyor-0000Gn-WF
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:29:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb0a8fa0-6502-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 17:29:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7894.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 15 Nov
 2022 16:29:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 16:29:49 +0000
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
X-Inumbo-ID: bb0a8fa0-6502-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcxJuAIIMay5GurIqjnROmYhKTusSZ6lLTffaZJGOuUFnaAZYO4zjD1Yo1QiUkHn2bvynDd0czgg0RivmzlyWunxm3Cb0c/PoQutHlYz8uh2NaJordWPUyvyjWwhqIHZHtdV4xTyb9McGU08SKQwu/zHsF2/AZzzlBGvEwff3GYUW/65Z7uSThIzuL5Udue5HxFrJbj1jRG9ovaX2NIDDsOQaJF4TteW/ktyA2BDvWiPg7SFJ4IfKFvfZmAJDpz/EyEjPtJifR7XbxYhUduNsM4/zJjlTLLHZNHaFx1B/0oFATE1HHy1DE+8S2B6QbnNZZMVKCY6G9ng0afnAwb3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/ToeCBs/ctBpsv5DSunBI+ntKYk3f12ch8LB59ViBs=;
 b=cX7JuKkGB9KAxagfJ7/PFnI3349NEDOdlgsKhQSZOCM6JP0MDSf0DG6yDr69SjBvWN3bYOmZweqZVSmQtolh5cCsvKohmR/kdo1FJTjfJQ4oTO/QO4NfUd4sSHE5NJpLUsOotWZZIroeMtBb0COP9vo/ptiy/2et+D1xIhEH+jzWOJ8vvYCooK0n4JVhVB/cJTFUSU7wEjg3R33gBnRpZjWEz81dfzT9dyuvedFXORUu/gpIALtXX8iFKo5WpHHoiaWpRLEpVH9KXtupmCPIxeLaNSGzyB+VCu/a8iOtfp2cFP0HE7GIrbNBSsC4a9K6oytCBbLB2fUfeKuJ+Uo3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/ToeCBs/ctBpsv5DSunBI+ntKYk3f12ch8LB59ViBs=;
 b=jYFH4C9CYrokmtpLIcvA3OiRn44MF0svdPV/1FCudRCD86O9oaqt9Nz7cUUmncsHRC9FliItaMnsMsQXYK2aeEqwl/JMzhFffP5Hj2g5AjpRAmW8Wkat/BRySvEDdFKpCyQOK7EeLNkrB0fX1ogB13SBMlawOZWe+zumJXzHWhjrJCGSAJe3AZiybrmvcEsJNFjGWHOFcEFfD3cOURa3yh7uvXYqQjJMhX9vtOkLjKqw0ethWsiDxtEVZAHbmLfL5qpemezRo2fhfybL9oY3b3F3Zi05KpnpS8M8hFJEGGk8hFAG6O4lV/x1Y58FnvqANEeP8I7LXPMoHK7YUY6uMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ba69073-3c58-2791-9572-c5c2e433db07@suse.com>
Date: Tue, 15 Nov 2022 17:29:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] x86/irq: do not release irq until all cleanup is done
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221115123500.97114-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221115123500.97114-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 741cd933-73c3-4a7d-e6fa-08dac7269d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iaGlWdkUn9tJYwsgkntsjrsMCFeSjKiCURdMKuMuVT3YCc+RwdStFraHIur/B65XlunZC2oT+dTZEiz4s6WT1kB9Ok79jvb8pDlEyioNoX85bvnPgJPjLA2bto/YNAg1ExQSi7qz8v8SEkl+rORkML+Y/cooL35sfEZajl2It0Sh4tEDyJWfDWqlLTKWrNUICkltI05JjGcUB+oa+lqCowNWNti0NrjxbpNxOMPWHRBeHxI8OZHgmSI60H/UKIvUtAM2SNKz3sdYMCiji1JiKtPk7xW1Q0oUa5Ri9kd9b84+F0lVOm2pQBcOSCo/NGBM8aIxb8DtNEsrkVyZyvXF34jxorCdGpD0/iAf8vZ/uQHfoTCd/l19AvuEIxDeelBnKtRy7pJVWTiuhVsVkgCx5bQN8wCXL7NB5zL6bQD7RyBRlI7BIihl4zDAcYCe+V60BZOXMGDfpwSgmyCF4MUPqgVHjY2Spn/W9fuELLbzVUPzajVWBEwu6do1/PdMXokWCC6CYz6+Qm9YuBKCkBFvNVTqr4W8+VJtZW+8L+eF3Sbtk1v50nMcGKCfQKjGzIAWEqb1mBuIbFKJGRWBiXEaggqA2N6LOIZxbz/Ujrfr5cRhVYWdjKRY5Ii/eEzMTiXBDS4xPNZQLN68XzfKvNxvtUP8lSUs3qH8u8u5b/9uJMaYHly8QRV8tJiQBLwT8SxSy7x/f4tSdJld/zoSGILL3R5IWd73YeImJ6E7EiE47kDg2CHLcfM4moeGTUZXnIJR7nArxRrc/VzZQLoCqHLEtxp8uhC5rPdZS4E2CfvLKYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(8676002)(316002)(41300700001)(31686004)(6916009)(66476007)(4326008)(38100700002)(66946007)(54906003)(66556008)(36756003)(2906002)(26005)(186003)(31696002)(478600001)(5660300002)(2616005)(53546011)(6512007)(6506007)(6486002)(86362001)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0J3QWpOTXc2eEg1S0lIZkkrMEtkUjlRMEVibGRzUkIyK0lCcldkdFRYd0xk?=
 =?utf-8?B?cnVleEE1Z21NcUwzZ29Sc0ZzNWZkNzdaTktJQTkyMzJwOHNVamxheHArdXd2?=
 =?utf-8?B?QVp1aWUvVGVNYWx3c2pZTEVJZmxHMmVjRUJGSmNQRmtzM2dqZFR6V2VDT3dP?=
 =?utf-8?B?TCs2c0NJVzg3VHQxNU12VDVhV25DNjhRUVd0bDM3S2VwTUVuWDVuR3UxQW9J?=
 =?utf-8?B?U1h4dEw2aHdEMHNUa1RuVkpOY2pMOEN3RVg4ZFdGU05vTzhLYlBSU0NPU2pX?=
 =?utf-8?B?VTJldXlwQU1YUjUzcHp5UlV0WEtpUWR1elplNnAxdVppSW9telpZdXd6d2xL?=
 =?utf-8?B?YTRYSmUrYXZSdjkycXhBUFZZZXdHWHp1Q2VCUG9QbXdkRURBOE5pTGE4Z3pa?=
 =?utf-8?B?R3dsT3YxYmljMG9BcGsyMTZzY2RHTnFlQjRXZlgrUkFnSXVlc25idWs2T0tv?=
 =?utf-8?B?Q0lMTCtnMFpobHUvQnNWdk95MnhsZWd6czkzZXFIbERmcEpQREtYMTMxSHBW?=
 =?utf-8?B?TTNCRUM1Q0xKV3E0bml0NVNLRVUxZFQ0dXU5cVJDaGxRVkhKeE0wellhRFhR?=
 =?utf-8?B?MjJ0eThuT01oK2xycG82bmswWUpSZmZTY05xTXVxK1Y0R0V4UVYrNWVXeE9S?=
 =?utf-8?B?cW9veHg1NmhOUFRZcTMrSExCb2tVa2VRbU05RzdGVVlSUEtaTXZFblNveU5t?=
 =?utf-8?B?MU5VNnpQWitCVHNDZlRSWFpwcU1rNFhheGhYYm1HbWE5ZUpXUkdCRXNmYUxN?=
 =?utf-8?B?ZDQwMzMwcG5Da1N6N0hvMUFSZFZybXM3eEh5NE9yeENCT1F5YkpMWWJVMkdP?=
 =?utf-8?B?bjlyODhiV2xlMUpaME1tdy80VHU2V0x1V0VaNzlmQjNhajhYQVMrR1c2TU8y?=
 =?utf-8?B?VDh6eTZVVlQ0VXppU0wyVW1raDh4S2RUNEZvVGMxbmZSWjFROHp1TmhDQ3Fa?=
 =?utf-8?B?d0E2MU5sWVpBVzJBaUM1ak1VRk9pZEkxQ3dqT2czMGNmaGlEZWxRUkNqTDJ0?=
 =?utf-8?B?STNZM1lQR01PcjdCNmRudG1Va2JBVkkrblJNUGNVWE50Ry9GNnJ2UEJsbVRT?=
 =?utf-8?B?VXBtTlA2ZlFORXpjMVdMQnhKeW8ra1U5VjZXTkp1U3BFMGprbUliNkZoZXhu?=
 =?utf-8?B?TmZIbzIwUHpSYXI1cEVzbkk3Y2N1Wm53bVhubGU5am1TenY4bEJPVUVaMVpy?=
 =?utf-8?B?b2lyeHF3eFhNcEl5bWQ2cWp2TnJuRkhlRDY4UllNeWtuRnpQYjBDZG9SaTBn?=
 =?utf-8?B?akNkVDFKcEdYZFE3aGRKUWlQMUJ3ak5MOTNLZlBYaUIweWprcGVwVkkyNlpy?=
 =?utf-8?B?OWgreWl5RnhOa0tOQVpKWm42Qk1Gc2xZT0I3dGluS05vZTJ2K1dsZks1S3h4?=
 =?utf-8?B?WGJHYXliUmFMUmZKL3Fsem9VYXlIaURPQUlNVS9lT1Y4NXBHTDBXUXNEN21y?=
 =?utf-8?B?Q1JSNVFPbkJKbXJjcm5NdVcvVzBKamN5ZTNoa2R2R3BreVRnc2QxS1l0SWEy?=
 =?utf-8?B?WkQwWEhwbHNZQ3h3Z2ZzZ2IzZ2FsbXZramJ3R01WZitGSzZoSUJNUTU2Yjdr?=
 =?utf-8?B?cFI3aEZWYlMzTUtKdnZjTU96aHZtSTM5ZGFGN1lUOVNyYWJpYXc2UWV5KzYx?=
 =?utf-8?B?ZTZidWpWblY1c0dvNFZoZll0RWFxQUhjZlpkTG5sSzlWNUsybUs2MVgvbGhS?=
 =?utf-8?B?bXV0Z2w5c2d3T1pqQm9XUk9BVUhxZWwxWWNTM0R3KzhZc2tpVDk4a3JpWEY2?=
 =?utf-8?B?aGFpYy9ZaVZxQ3B5akJDeS80cmNmSXR1ZExWWU1QcmJ4L0dXZDhQcnNvMzMr?=
 =?utf-8?B?ekpLNW0zM2I5SlJ3NWErYlUxSS9iTlBZOSs2aFppWDdSQVpBa21vS3haSnlL?=
 =?utf-8?B?NTBoRUswS3ppUEVlQ0hIc2dIZUs1WE0wUDgxQ0dBRWV4NUVicGxRWWJsNVJt?=
 =?utf-8?B?SVRNY2phZkMydkU2dThPMEFZb1JWRklZc1BWZjJnenVQcEw3SGdLeS9mMmpY?=
 =?utf-8?B?Tk1jbWo5Z3JuK3o2TUMwUGV2YmRobjJOaEQvVkJXZ0Y4UWovd3BzdWpCbEo1?=
 =?utf-8?B?T0ZGbU1xWXpCM3J3Zkt1d2s4MGppQXJaeTBmS08zL205SEJxVHZqSjVQRmo3?=
 =?utf-8?Q?vcQuriLgPf/3gLlirmeIDxcsZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741cd933-73c3-4a7d-e6fa-08dac7269d82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:29:49.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz1sb1+AoHvu51Ugbk6vQMt99kly12gp8h1mqyAA5p/RN0edFnNnQUowUbsy0Zeg2KMkm1uCXbIk8Uet4jmG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7894

On 15.11.2022 13:35, Roger Pau Monne wrote:
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -220,27 +220,27 @@ static void _clear_irq_vector(struct irq_desc *desc)
>          clear_bit(vector, desc->arch.used_vectors);
>      }
>  
> -    desc->arch.used = IRQ_UNUSED;
> -
> -    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);

The use of tmp_mask here was ...

> +    if ( unlikely(desc->arch.move_in_progress) )
> +    {
> +        /* If we were in motion, also clear desc->arch.old_vector */
> +        old_vector = desc->arch.old_vector;
> +        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);

.. before the variable was updated here. Now you move it past this
update (to the very end of the function). I wonder whether, to keep
things simple in this change, it would be tolerable to leave the
trace_irq_mask() invocation where it was, despite cleanup not having
completed yet at that point. (The alternative would look to be to
act directly on desc->arch.old_cpu_mask in the code you re-indent,
leaving tmp_mask alone. I think that ought to be okay since nothing
else should access that mask anymore. We could even avoid altering
the field, by going from cpumask_and() to a cpu_online() check in
the for_each_cpu() body.)

>  
> -    if ( likely(!desc->arch.move_in_progress) )
> -        return;
> +        for_each_cpu(cpu, tmp_mask)
> +        {
> +            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> +            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> +            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> +        }
>  
> -    /* If we were in motion, also clear desc->arch.old_vector */
> -    old_vector = desc->arch.old_vector;
> -    cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
> +        release_old_vec(desc);
>  
> -    for_each_cpu(cpu, tmp_mask)
> -    {
> -        ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> -        TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> -        per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> +        desc->arch.move_in_progress = 0;
>      }
>  
> -    release_old_vec(desc);
> +    write_atomic(&desc->arch.used, IRQ_UNUSED);

Now that there is an ordering requirement between these last two writes,
I think you want to add smp_wmb() after the first one (still inside the
inner scope). write_atomic() is only a volatile asm() (which the compiler
may move under certain conditions) and an access through a volatile
pointer (which isn't ordered with non-volatile memory accesses), but it
is specifically not a memory barrier.

Jan

> -    desc->arch.move_in_progress = 0;
> +    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
>  }
>  
>  void __init clear_irq_vector(int irq)


