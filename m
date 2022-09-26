Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26C5EA80F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411839.654932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoqB-00040q-ML; Mon, 26 Sep 2022 14:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411839.654932; Mon, 26 Sep 2022 14:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoqB-0003yB-JG; Mon, 26 Sep 2022 14:12:11 +0000
Received: by outflank-mailman (input) for mailman id 411839;
 Mon, 26 Sep 2022 14:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocoqA-0003g5-0U
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:12:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 352ece01-3da5-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:12:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 14:12:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 14:12:07 +0000
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
X-Inumbo-ID: 352ece01-3da5-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGjedAt5LvOUbUoZZWL1nrjqk1q/xovloSOD3YVRp/eVa64ydm0p8S+Z5SrVDvQLLaNndV+EsI12LntULKzJ9aSdUPvkgLp1RjjBUG5d0Vm/5S12bgMC5M2bSgJjWC0rcOtUzoiD57sMqdTFRhEJntCqrKKV/FeOz42VBZ2kjTwLg4J8L42gC1Q8WrQoh7npX+mv9IyXYN8Ozks+hSJZX7fyBkPXTit8+I51fKjD8e8Spauk1vXdLS6NiZjmrl4QFcawdRuBLyrAQyqcyrv4robe7XRtmZWyG/+CTZLLHReCaxKg1FOibuTjlzebq982OVSCk3uuj+Nlm02qwfGdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSRAV75Y5wCa+r/oerAKcadQ7Kh0D2ALzJ5y9/KYUlY=;
 b=Pl4RpAOzn2ZYcQSDfuWGE8BxtHLAT2nwxHAL/Qwt2mDaHvUI08VEeFvY0vhoLZhC58S6L4P7JFNTaMgwSiyFG4qUwJXm+yh9WAzkgajH/ylBo7S45amlWsv5v5JrV7nn+/TA+5tNCX7avuCnr7l7uYhOTH9D5eGN1I0CWnOlJhU0fZ0N29zeYKkxChhJTMe7jwQy+3K8yjTvZ+WGoliNXJblJd8CrL1v4pYipmhEZCujDP1XprF+L20Rav/uPzKu9ObYAjYLS/rLw0YczE2ZynRXHeH+adBDineiRQoyztJl34vHSyLTUaiaSyuATM7wnSBmgeSygcvAN73TUu3Zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSRAV75Y5wCa+r/oerAKcadQ7Kh0D2ALzJ5y9/KYUlY=;
 b=19ldJhXOTT3VaFXigtrbJZyMUa6XTe/n8/GGVzG7TV0e9y6LFU62w4a8ikBloV+O6KG0gsKxBZEwP38K9Pf5yY+wtNroK6Ohd5TOiOSlvgmC/1SRl5PydYwkdz37sy5WQfxnSHWMe4XqYTRKm1R/vq98qIiHOhRpt6WRPnGWpJ0JiXlHm660VaHMdYIZXacaLfj4ysfxI0dylnq+PWM38QJtjKhjFDvGtqxKarIkyCXGZX5db84H54/pMVROOZnmPUYxLY1clIj2JhNVIgdXQhbWL4sQ0BZcH3jhc+4mwYpxQLl4OhMqFXdwgNfLktuVhx3rwMrHO616b0IeT5LUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a469ef7-5ad7-5abf-2c1f-fa29496fa2a5@suse.com>
Date: Mon, 26 Sep 2022 16:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/vpmu: Fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: c940f4fc-7e9c-4253-2a1c-08da9fc91847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wUo5C84Uqx3UvZv6tY+E+7ukbcdOgEmjhtkMgILmSBLkOcaJkGgkoE5TajhFs428l39er9o+F44lRUHdDM+01Oxzff8pZW/xBx4Y76QgyLwGuaNxUioLxWQmMaYJJp2/2oRl6dagTKmvcsbpZoOzl/YMonfsehQ/GH+JhTTiPmBYpXfpqmFuk6DED98Ai8xPKhjrv1hyAN+R0cgOkHMkI5mWfvM/WicjG8N/F54thVgbcgpzbb/zU+Zq1z27gwk2oLn/7gyEExoFuvT5Xbxk/uxziWgttNBSevJgB6XiCux55r4A/U9YDfeT2hWqW08Dshu1cc0DEOQ1Kyv/0NgFyvoe3CeiF9Xvtm7rDKIYb9JVMs8wRYTRqxdnqi6p9Wo2oLpSyaIkHkaoqOsDCWrZb97gpCwGfdvThx04Ayd9cjTgrJisX65YfjQ/xAdj0YflqZwvGqQRp9SNK2I82m5jlJuIZtA1LCYEDw395vBhxgU+Wjx1QeXX8PFgery/5S7WwDKhzVftkrlFMvQP2nqHTxWiJgVMtSeurR5WPod7qK7Xy5d5z2KSj94rHTevtqs0TCCckUxkqYpKgVVcBfEbvRb9j8HyWqMZTw440svuBnXtUb6wxqxQ8NeQPK3xy+SzEul4PdngB6mlU16/Ee7ER2ft8Dz+da1xH3tvV62EiqpVAmUJeA+saE2qlBsTL+ywrBxWzO5YwM25KWiBgKL7MJF+eWWuYxTjIi6sbf5+rgyHKJ6FOR9589vEdEzFQz5h27D0nrtF7Rct6RpBErQ/icVvLu7nVbkKyuUBAi3nQa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(2616005)(5660300002)(478600001)(66476007)(2906002)(4326008)(8936002)(66946007)(36756003)(83380400001)(66556008)(186003)(8676002)(86362001)(38100700002)(6506007)(53546011)(6512007)(26005)(31696002)(31686004)(6486002)(6916009)(54906003)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZabG9mYzFVVm5aaitaQU9MYnpyUHJ2NFlUZmVOaG44bjdjNEd3WFRnemlD?=
 =?utf-8?B?c0dqaWptWk5uMkhRcWp0RHBmNityWEtSWmU5b2srcHhXYXBXd2REQ1JWbFdX?=
 =?utf-8?B?VFQ3MGxRYmZLSHBPZ3hsZTRkSVViSVYxVk44bmdNUDUzWk56bnFaZXRzUDNW?=
 =?utf-8?B?Q1FOaHp1MEpZTWJNL3BldFFUcnhTeEw3Y3JrckdlVEE3ZnJjckc1Y01XYmVy?=
 =?utf-8?B?OTRrZEo1N3NrZTNDR2JqYnVaaS8rU0VYaS9xTnRoanNhakV4RnlkY01rdkJB?=
 =?utf-8?B?d1paVkd0TVA2UHVKOG9ObjBnMU91ZTRucmZ5QzJqeEwyNUdqenNqRi81dGNx?=
 =?utf-8?B?emxLa2NnSDJOdXhVV1UvTU5ZM2lLMkdrdlArb0lISjhLbjdZZXUzbDNaVEtM?=
 =?utf-8?B?UW9pUDNNUGIrb0w3TnZWK1lVY2V0WjVjRzVJZE1OanlVVG5hRFM4V292emtV?=
 =?utf-8?B?ak45Uy8waXhFZU9yZ0tDSGMyMnNYQzJ2c3I4b3RMcTBHVkdSL2NXVk5JM3JH?=
 =?utf-8?B?enVNVUs2ZThlS1liN0hGcWp3SE5nVjBFOFRyK3BaSTkrZEpxZlVZNEhKd3Uz?=
 =?utf-8?B?MGZUdE9GcXNBWTdqWFlpRndzNUVmWWIwNmpSejNWVjVVdlYzMTJvRmRMSkor?=
 =?utf-8?B?MmNIOFI1OHNHZmxGd2R3bVQxLzB6dkJ2MnRPNjZUaWpXbjRpUHJuSHJ3SmI2?=
 =?utf-8?B?Ym0wa2tTSjFyVTFWYU9TVlNqV0FKUytXMkdkWjV6aDR2UlV1akxrT1lEL0Ey?=
 =?utf-8?B?OXpwK0lCVDZiTVhWbU9sdVNRZy92WncwaEZKNGJmL3haRjVMQVhNSFh1eDN3?=
 =?utf-8?B?enNlcEo2dDM2Z093V2F6K0orQVVuVWp5VlpOOGVxUXFCRXRkQmxqTTBBTllq?=
 =?utf-8?B?QXhENFY1QllCay9WL1VjTlZzYTExRTlLRk5nWStTeCtXNzFmQ2ViblZobVNa?=
 =?utf-8?B?TnZGdTJsbHBwSVpEV2Rja3lja25mLzlYVXc3dGFGTi9IZHRpaGVsQjVnRUla?=
 =?utf-8?B?Z2hxckNOTk53OWNsOGRnVUxnMGxJenZBZi96eG9nUFpleWlMSi9BT1EwZ2Nv?=
 =?utf-8?B?K3FZTmRaemphMGg2ZHZlSUVXdm1aQzE5cHd5NGgvODdVWElZNkY0ZDZleEMr?=
 =?utf-8?B?NFBjSmNXdXJ2dWpGQkt6SFJLVGp1WHFwZFE4L3pmYm90K3hkTndZUzFtZXRM?=
 =?utf-8?B?T3RjZGZRUkxzRlIzTXFFMDhRdWxmdGtackUvck5PVWtkUDd5ekJDdXorZGZ6?=
 =?utf-8?B?VklqU1Z1Z24reUpURllHNXBxb0F1QjZickVCcFFrS3ZMZnFIK1ZnT0pCaG9j?=
 =?utf-8?B?SCtIV0lURzIvbGdUL0tBc0kvZEZtbVpyNkZIc1hKWG9vN1RuZVFwcFBpeU9X?=
 =?utf-8?B?YVZaNTJ4YldyK1hSaXgvTG9qOVg3SzdVVXBZZTYrMHI1UWlKcDNWWmhQS1Rm?=
 =?utf-8?B?cFpGL1VDNzJHSXJMczllYkZXR2tiZytqNmdoK3RzRDdSWUlGQStxdVduWEJ4?=
 =?utf-8?B?UEEyZmp2NHJqQi8yMUNaYnBrQUh2c1ZJc3ZzMExCRkJMK0NKNWV0dWIxdUJy?=
 =?utf-8?B?QjNMNmJMWmswUHFrNUFWMEJ2UG5EVU4xNDJtZGVUank5b054L3llRndFcVBI?=
 =?utf-8?B?d3o2emZlY1dwckdycWNvRDFycStHNGtoNkN5cnY4UldWTUowaXowWExjZEpM?=
 =?utf-8?B?NmNyaFlVTFlvRUlaK2dRYVc1R0E0eFhXZWdaazNYK0xwWXMxT0NtTFRRb2Yw?=
 =?utf-8?B?N2p6K3Vaa2ptZFowVlZPdFdocm9EekYzYWRvWCtJNDFxc3ljLzFKOXBKQ3JF?=
 =?utf-8?B?aVpMdmYxRGZlSjVGRWVXRjNPeTAzOWc3ckNyS2JVUXpZRnozZ0NrUElpOWJK?=
 =?utf-8?B?eVlQaHRtVHBwR2hsVGtoUnRLaWp2WTdCYTdOM0prdVczMzIwZ1FMZDRSQTd1?=
 =?utf-8?B?V0hGQTRycXA1bTFBWDkvT3FPd015ODFaVXlOSFRKQzF4a2dHRStaWHdpZWxs?=
 =?utf-8?B?VVdhMUJDK0hNT2RjWGM4SW81YTliQkUxR0YyR3Y4ZzNoYjdud1RweWl4cmZP?=
 =?utf-8?B?bzlXK0g2U2d0VnVsWkVFU2xDU2c2bzVtaTlkK0kvQXhkV2ppdjZoOFV0bU41?=
 =?utf-8?Q?zRPKGAQH8NKjvIkAhCqH1EYqg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c940f4fc-7e9c-4253-2a1c-08da9fc91847
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:12:07.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjqyatdaPz8+aEHcXEm+/v1LqYGai2Z2rBpn+Q7Ndm35qjrwqLa7n4HJlv3+tu+BFaqiIQ/0qJx3dx2RzNhm/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606

On 22.09.2022 22:48, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
>      vpmu->last_pcpu = pcpu;
>      per_cpu(last_vcpu, pcpu) = v;
>  
> +    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
> +
>      if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
>          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>  
> +    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
> +
>      apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
>  }
>  
>  int vpmu_load(struct vcpu *v, bool_t from_guest)
>  {
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -    int pcpu = smp_processor_id(), ret;
> -    struct vcpu *prev = NULL;
> +    int ret;
>  
>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
>          return 0;
>  
> -    /* First time this VCPU is running here */
> -    if ( vpmu->last_pcpu != pcpu )
> -    {
> -        /*
> -         * Get the context from last pcpu that we ran on. Note that if another
> -         * VCPU is running there it must have saved this VPCU's context before
> -         * startig to run (see below).
> -         * There should be no race since remote pcpu will disable interrupts
> -         * before saving the context.
> -         */
> -        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
> -        {
> -            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
> -                             vpmu_save_force, (void *)v, 1);
> -            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> -        }
> -    } 
> -
> -    /* Prevent forced context save from remote CPU */
> -    local_irq_disable();
> -
> -    prev = per_cpu(last_vcpu, pcpu);
> -
> -    if ( prev != v && prev )
> -    {
> -        vpmu = vcpu_vpmu(prev);
> -
> -        /* Someone ran here before us */
> -        vpmu_save_force(prev);
> -        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> -
> -        vpmu = vcpu_vpmu(v);
> -    }
> -
> -    local_irq_enable();
> -
>      /* Only when PMU is counting, we load PMU context immediately. */
>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
>           (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&

What about the other two uses of vpmu_save_force() in this file? I looks
to me as if only the use in mem_sharing.c needs to be retained.

Also, going forward, please Cc Boris right on new iterations of this fix
(if any; I'm not going to exclude I'm wrong with the above and all is
fine with this version).

Jan

