Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81960751C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427565.676761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpP9-0006RI-Mr; Fri, 21 Oct 2022 10:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427565.676761; Fri, 21 Oct 2022 10:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpP9-0006Oo-JL; Fri, 21 Oct 2022 10:37:31 +0000
Received: by outflank-mailman (input) for mailman id 427565;
 Fri, 21 Oct 2022 10:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ExZL=2W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1olpP8-0006Oe-1I
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:37:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b6639a-512c-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:36:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8424.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 21 Oct
 2022 10:37:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 10:37:26 +0000
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
X-Inumbo-ID: 38b6639a-512c-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIPnP/f78/cJ4Hx7qnFmuZcNf566S1qN6TvaazUbOoibv+KylsQn20fsuzIJOlxAr56JF1agsUd53CjpQeofA1nX8Wt4GoK3Na6kvF9ZOeGrAIlPvdHBX8NpZHYX/StynS2CRyBvzYB/LyGrOx444SXQjKaFLNh3fSBPGE2xCobiRJDnkMGFlJ33AoqbmZvpOpS8ZVQacsCGG0zch2+7wm7uB6gLQ/UGXgM1jgiGiWAZwp9CjfaIC6xGhNmfyOVIhfDVF/73wy/Wd/YNNLhlKlmWvVsUj4hPAxmfn6r84+K2XH47AWXv369wDKw1MLtfUxGenPBJv6X/ELcwIYjMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88Qep+hB+jSsnapbBIAqBKuOXczQAF8cRIZAj48FMio=;
 b=K0e0TPdqrckX5m8/4XCQ+9e4RrEAuCeE4hx96mXFT2NA39FktBlcCRw1b6CYrjH9UycYFDi6Yrz5oWUsSVtF7FhLyHW8d7sE73FPrKZnOCvSMq+ws5NMYWLVESnp8cPeCaD5Z93SbCf/jgQtHpsvpazm8Hb/QYSyAaQtbJ1TYo5aNjHC7kl0q8I3qSTWCahSheGYLfgz9xHvb+CbGQV5LAUWqTq1zh2ZV8YlVsh5EbIbVoNlBj0YRLxh4M2cuvrqT59kKIXKD9N2e8Sc5cE7OIO/6XkbUa4AY4InrhyKJKngTjVmbCFSw8bXkzZ0QZqt0XkDusnYJj6wMSQYkPrGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88Qep+hB+jSsnapbBIAqBKuOXczQAF8cRIZAj48FMio=;
 b=msWPkf7D9Jt4Qb4qzPF6UpffnLHXW7sBgz/sWRDcWGFL5u1f3/ITAZZkCxIETFddnJVxl6tWQHniiMXNGdlwBpiQTIv3mFe6BHrTWm0mhvu+gDhtr3hkfsY+2oN8py/5O4z5D2gaA2AZTysaZpsv6xFdv4DpZlcJspo+SD1e+JfwwxJcHhqGRABu/BkC03HDs+LlQV81FHHVTBEaqlTaMUaW6IWSTryNLODw6mlvGl0yTpFQcXK/8xLYbNt/zWQ8W86Jap4nEdHuu1XL8lOWGSnLN9fOR5GRwSrPSbTLzBuzCGNX+jeJ6T121KP5bdW13ZQsEy6nU8AiBP7MSJzE4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b767003-487a-d463-3a74-92d834fc8e11@suse.com>
Date: Fri, 21 Oct 2022 12:37:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20221021065806.14316-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221021065806.14316-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 959b0abb-9227-4481-72e8-08dab3503efc
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ypv4O1LUWzW7RCoyePC7eimWc+kYrSaoq/gXK8GWzQmbnaCPNmw6hLhFAGJP93uRTMqOKNMNvQHPrWCn8nUaEMvKH5BWRLc9vBHlZrWQ7XIchaocisTjCcEsBqWXaeqTCIbYSarBJxePqrgecqLFacrzoqFPtksbTNGplzfxFmwgspco/uXuqkj2PSmn7nHLfXnu+acT0AH8Ku+mmHOTHdOyL+8v4L7ppXvnzoqc7M1b4+CP1vgKZmjMV9vmDnZmjjkcxsHQJLJW0JlpgpPY+2DOeNyDIPFtM5j0NPXTsFtxKd9HXN2edOQe+syfziuB8VtnRBIyrqlq1DFRkLxUi4ie9HdBqyYJY+cgVthQGzUvdcLLUJLwDIH5Lm8EHHHFozGc357gl1uSKa8XmTjFoqlW5YhDbpAnvS3mGzQmXtll25WMbrWMw9cg6ZvMp6/yt4irP9sjkheVn/ZucP+gsnRdIGBjBtlkBtmtjVTy4Wix8K5gLf2DKCuE+8sh5n4T1Zw/1zW234eCUDkMSUTTH3tebno5E7/YI1vz6DEmSJ0c1lTXRqWqYvZVZE04/1dzmMEMgu9hoLeUUEimihUhgbIkdBB2EZ2Fzl6kbqceJuXTDy3Ihnqr0tIRF3RLklJacZit1Tc/gmteLOQq1vVMi9rC29TDwKvCOKZDjBnyddIAWb8kPgwq0jPoF5eHCTvP8yWDKv0sdJ15nuYrettYBFmYKHSCcwhFIuiJ90yLymeEiUEN9oYTO/QFwnjzEw7UiiyX+vdifBwjMR1fQUT+TZo+VtbvQV3r7JpJWBYcpOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(36756003)(31696002)(86362001)(38100700002)(31686004)(83380400001)(5660300002)(6862004)(186003)(2616005)(53546011)(26005)(6512007)(6506007)(54906003)(2906002)(6486002)(478600001)(8676002)(37006003)(316002)(4326008)(6636002)(66476007)(41300700001)(66556008)(8936002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXAxMk1abHhiSGhZWno2UWNpR3RwSmdRUmxoSis5alhxNGx1UmJ2eE9WbHRJ?=
 =?utf-8?B?ZWw1ZWZtb0dtL0tFYmZsRGd6V2dKSVAyVUtDOTRrMll1ckpjRVVjVVhMNjB0?=
 =?utf-8?B?d1hDRlE1b1VQVk52Z1pqUVFPNDE3MG1Ud2JaQ0JNbkpvbDM3c0U3TFZGaFQ2?=
 =?utf-8?B?SndzTU51cWdPUzdQUFVkOS9IUG1QSjVKa1Vna0VJVENacFhiMGFUbjdaVk1y?=
 =?utf-8?B?Z1VERndibzNrU0kyWVowUWVGTGZjVmFYeXNEUVpmRzc1YkpUOUxUVVpuS3RF?=
 =?utf-8?B?MFpjcTlVcVpUOWlHTUtKb1VvclZlTURPQUl3Z1dDYTc5WGlRK3V1UVc1REtX?=
 =?utf-8?B?ZW14bVQwUFJRU2pPSFVtbDdxcXZ5Zjg4cXNTM3pueGlUdzZEUjhvS2VGbXdp?=
 =?utf-8?B?cDY0a0VzNEFIS2ppOUN2YXQxaXI0dGpreTNVV3FZRXduSEpDbnFkYVZZeWVq?=
 =?utf-8?B?UDFWdGU5RTdkclR3cHpRRE9YMkUxN2N1aytnWlp6alFuY1ZwOHk2VU5jbXhp?=
 =?utf-8?B?SllUQU02YThZckoyQkp1VVdIdkdmdW0yUjNRZ3Vhc0pkRFY2Wks3NUlUZkVP?=
 =?utf-8?B?cHlDa2tYY3BPbzlpb3UwRVlIS2N0YlZQWVhxcEFtYXZIRC9qeVBxVHpRNjd6?=
 =?utf-8?B?M1JKZmVmV2pJTENVeU0xSXVSWXpUY1ZvOVl5S0FTRjgrQm51cDY1NzlVdTM3?=
 =?utf-8?B?TUozaXVZQkRNbHJTeTFWZXlSQXU1enhFNmNwd3g5MndrTFMxejF4cktaZXNp?=
 =?utf-8?B?VWFiN1NEVWNOb2J4cTNySTRxTmE4MGxRRXdVL21vdDNWV0N2SlFjYXZHcEUr?=
 =?utf-8?B?NWxkd1RKMFIxTWx5eThIY1ViNFFrRE8rMTA2SU1JNnRnNFdIa1FxbzFYelkr?=
 =?utf-8?B?bnFvd1dBYncvY1piRTBVTGo1T3ZKa2VOTy9aM3FkZ3Zsdlk1ZzlmZHhNbVEx?=
 =?utf-8?B?MFNlOTVIbk0zZWtqbGwyUEFqMWNpWTQ5RFFGWlUwWDhSZVdRbGtQYnB6NTBC?=
 =?utf-8?B?N1lTVXBiRVVqTmVCejVyTFIvdFg4c1orNVhSS0VzMDdUYXgxNi80MzhHZE15?=
 =?utf-8?B?U29obU93RDgwWVdRcGs5c0V5WHdlUlVpbjVqdi83TFdlS1BzWkw1TnJiZitw?=
 =?utf-8?B?RForU0E0Mzg1WDAvNE5vc3JmZVE3c3l5QlRadUJOZ1hYc1hKcW9Icnp0R1hS?=
 =?utf-8?B?ZGZmYW95OTNOZG9yZVBnRW5ldStCb1FaRlFHekVrcm0xTENJeGhMaHNmWGpX?=
 =?utf-8?B?Z2dCQ2RSa1V4Rit6R3BDY05nUmxQM1RPUUxOUDVmWkU5Q1hUWVIxV0F3YmNj?=
 =?utf-8?B?NDJkQUFBSzN1dkRFT2JaOEg0a1FLSE94OExmSzhnRTk2a0E2N1R5UmVKQ2hM?=
 =?utf-8?B?UGhMd04wcEZiZmRpVThkUW1JR3Z6QXBudXZmSno1bVNOcFhSR1k0M0dFN05D?=
 =?utf-8?B?RFh0UUtwdmE2cEFITFlYdFNCbVRwWUtPMWdMNU1kVlFHOFViSnVKWWlxNmZw?=
 =?utf-8?B?OHBoM1dPZ281TGxsTmtmV0cxLzk3a3VjK0UzbmZCMVJMN1FuSTk2WmtnRkZq?=
 =?utf-8?B?WXN1dzJGSE1UMWFQeVEreFg4VTlCdWhaNVFGVFJsZ2pianlLYzUxc1NMK1Nj?=
 =?utf-8?B?c2oveDl1TURTeEpwQnJKWnRzRTI1SlBnbWpocWlTeWc0VFFuTEtFVDhlSk5T?=
 =?utf-8?B?cS80bXBzK1VFVWZHd2lRc2pxNE9abW4rUkVBYmt3ZFFOU0xkSVlzNGFNVXNk?=
 =?utf-8?B?UmdKSEdrWjVFaXZibWRabkRLMGdrZXYrS05HdlZlZFMrSElrNFNkek9WMzNo?=
 =?utf-8?B?TG4xaHBxaUNWWFVyaExhbzQ1a1crdVRpcDMxeVlIMkpLRGwrRHdzTEdBOFBz?=
 =?utf-8?B?bXlubWJsZ0hMNW5Fd3AzajNCOC9mRVR3OWpKbVEzMmVmQkxQbnpxOWNJaU04?=
 =?utf-8?B?eXhUL2lDbUZyODk0dnhaYXBlRnd6RUt0NzNuUVBTRW1IaTMyMGRzWHgxK1U5?=
 =?utf-8?B?eGh1eEpKR0F4VVpaVmRFSTJtMWhKazNrcFVaMFM3azMwT0lVemVsNXZNYzdW?=
 =?utf-8?B?MFF0Q2JXUUxpYktlejFuY29RUmY0am85MDBpL2NIMkdDaEhVZmt6aHJ1ZmNt?=
 =?utf-8?Q?X1KouO0/VEBJz2u3ZTUGqii58?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959b0abb-9227-4481-72e8-08dab3503efc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 10:37:26.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Kp8E6epVTlZVzJ+aeeEVr7gsNhA0VVbuOhNdH1izcglG/mcF+HQBZRjZ/X/oibC7rRdGep4R5dcUsDQSCZuGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8424

On 21.10.2022 08:58, Juergen Gross wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1196,76 +1196,6 @@ static void sched_reset_affinity_broken(const struct sched_unit *unit)
>          v->affinity_broken = false;
>  }

My pre-push build test failed because the function above ...

> -void restore_vcpu_affinity(struct domain *d)
> -{
> -    unsigned int cpu = smp_processor_id();
> -    struct sched_unit *unit;
> -
> -    ASSERT(system_state == SYS_STATE_resume);
> -
> -    rcu_read_lock(&sched_res_rculock);
> -
> -    for_each_sched_unit ( d, unit )
> -    {
> -        spinlock_t *lock;
> -        unsigned int old_cpu = sched_unit_master(unit);
> -        struct sched_resource *res;
> -
> -        ASSERT(!unit_runnable(unit));
> -
> -        /*
> -         * Re-assign the initial processor as after resume we have no
> -         * guarantee the old processor has come back to life again.
> -         *
> -         * Therefore, here, before actually unpausing the domains, we should
> -         * set v->processor of each of their vCPUs to something that will
> -         * make sense for the scheduler of the cpupool in which they are in.
> -         */
> -        lock = unit_schedule_lock_irq(unit);
> -
> -        cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
> -                    cpupool_domain_master_cpumask(d));
> -        if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> -        {
> -            if ( sched_check_affinity_broken(unit) )
> -            {
> -                sched_set_affinity(unit, unit->cpu_hard_affinity_saved, NULL);
> -                sched_reset_affinity_broken(unit);

... has its only use removed here. It didn't seem appropriate for me to
go and silently remove that function as well.

Jan

> -                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
> -                            cpupool_domain_master_cpumask(d));
> -            }
> -
> -            if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> -            {
> -                /* Affinity settings of one vcpu are for the complete unit. */
> -                printk(XENLOG_DEBUG "Breaking affinity for %pv\n",
> -                       unit->vcpu_list);
> -                sched_set_affinity(unit, &cpumask_all, NULL);
> -                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
> -                            cpupool_domain_master_cpumask(d));
> -            }
> -        }
> -
> -        res = get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> -        sched_set_res(unit, res);
> -
> -        spin_unlock_irq(lock);
> -
> -        /* v->processor might have changed, so reacquire the lock. */
> -        lock = unit_schedule_lock_irq(unit);
> -        res = sched_pick_resource(unit_scheduler(unit), unit);
> -        sched_set_res(unit, res);
> -        spin_unlock_irq(lock);
> -
> -        if ( old_cpu != sched_unit_master(unit) )
> -            sched_move_irqs(unit);
> -    }
> -
> -    rcu_read_unlock(&sched_res_rculock);
> -
> -    domain_update_node_affinity(d);
> -}
> -
>  /*
>   * This function is used by cpu_hotplug code via cpu notifier chain
>   * and from cpupools to switch schedulers on a cpu.
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 557b3229f6..072e4846aa 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1019,7 +1019,6 @@ void vcpu_set_periodic_timer(struct vcpu *v, s_time_t value);
>  void sched_setup_dom0_vcpus(struct domain *d);
>  int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason);
>  int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
> -void restore_vcpu_affinity(struct domain *d);
>  int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>                           struct xen_domctl_vcpuaffinity *vcpuaff);
>  


