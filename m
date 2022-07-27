Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFB5826EA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376163.608750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgQT-00075U-US; Wed, 27 Jul 2022 12:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376163.608750; Wed, 27 Jul 2022 12:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgQT-00072b-Ql; Wed, 27 Jul 2022 12:46:09 +0000
Received: by outflank-mailman (input) for mailman id 376163;
 Wed, 27 Jul 2022 12:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGgQS-00072V-Nf
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:46:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 146b2f16-0daa-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 14:46:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 12:46:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 12:46:04 +0000
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
X-Inumbo-ID: 146b2f16-0daa-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDRfXKRJTe6GTYhJgqRsINqQO3OKRWb7cORYqjJjh91MgfsMd1k5ywmJJ0DjnWuI0UuouwXDgaDa+czlv3yjSvVa+K+jjeNf3CWHlADTqXce9F8tHWjTHoX26kk8s6cR+U7AJQE6TTutk1Tlm0N8noLwBSu3lThe+Tns7JVU8r6y6hbHKhJ2VC9rnVLD6UxasaIeBCX261DD4RZphuEmZUpBN0Cef0RSGOLalK7p2RmbOMUDeHrdNUaIiU+6aof3n7KLv02ZN8W66093rfxIdPbhiv5IIIolN8mx0TQC3ymi96o0aUo8Ke/frc908IJ46NZ2CW4wn2szILx6DTiH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqd+48DSo0RjELBHKVqgoD0AjchervHlYUoDIDGCM84=;
 b=ciBb/WvIF+1A+ANl3+A9O+F9f+Nxkx/w/ksDR4XIb4CqBXZV5K/sJ2ArH/HREsfRoW75jfI6HqUMDUYmTRbrkEPKaEXhmNSKkuBzkqfPum+MT9HQDzMHz+dvvTgCnlm6AA10aM75OYKp0wS9FIF3ezaWcI/bYHsqykv6j7Dp2QPnNnuJ4qfYv6UQh/xmp+lvB4lOJFmKLwePGi5U4qMJs0EyomQN5HUs3TZUCrcZbeR7yFC0GWtAmrAhZ25RP51fat/SudQTk6s7NG9/154LCpd3I+pYdRD6w3YZZHUnzB00jaQe1TgiCoTX5VOmS8sgqw6JTsZhr3uodurbjNH3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqd+48DSo0RjELBHKVqgoD0AjchervHlYUoDIDGCM84=;
 b=MeEYvlS3H8zL+8CzRGtxjM1qKLXKvb6YTMz/0AWBgymFp84VcrKMrxFvZO+jVZxaJGknQqZ2fBwyXVR+Z9G9xS7FZh6oWqeVQfv1f00tpTk75LDldnvmPHe5BC5mTkM1//ezBN/8fB1D6AJp0/lamM4W6OpoM4F/cyTWoCkIH2/QgnefPcaLCuE7DZLB50Tx0B9xtOC9yyoKAWC9sKZ7uhMqfIE+L+9sbI1KiBtXeOYphimua8xqeCoBVhphckkAbZZXuFH2+UHSgonNQwYsg8h2bNQciOUaTniIZN4S5/FG3QEgKkUl+ngWI/IMKPmgzCSwRgHAZT8JXd0QBfiGAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <481ea371-df3f-287f-5952-262433342f28@suse.com>
Date: Wed, 27 Jul 2022 14:46:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 14/18] x86: generalize vcpu for domain building
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-15-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f3bf51c-4d71-428d-d45f-08da6fcdf77c
X-MS-TrafficTypeDiagnostic: PA4PR04MB9639:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVTaJ1+exDw3aFSZn0KVLcnb9goPihnNHVQ5qY+58d9AQ/rknesA1q3ftOhKeNRKEYy/vRQdF81MUqPi3abQmjnd9LpuOoCaM95XXyFQ584q4kM6CdhIw5F0LuPeFuct4ymgp+ZHQXFsIre3oJ0ef8wOg1Sn1CYcvkdWh47XBAcB7tkETVaaqK6UaYx7KTDAGDvLOFmAhGUkie/Fm5gbpcn6HAjVCvvunw+o+YsC84q3SIRYYNmgFXjqy3xzez4glwJbR68tuwq8cdRXGdJR/P15Ji8aqbYCqngROp1HmUAC7Zon0L//ITEAVS/lJ70kqLaBXzhTEbZ7VFkeHt19zEvZ+rCulKhXPs5QqQEZPUbpa2Eu3mnmjSkiKJcgeIAqN2ykk5GKaPFyYFIDZXD1mBk8BURxcOoUjOngDDyu58sswEYMX+eaz3NOgjGLS/01NstphVoY/lqaf7LPBRSs71hIJAgAH/jHIRyKp/Dha49aOuwvP1wigTSff3Dy17KjMXLlUCh/F3ZYLPJKMZ06al/V684wX+FZHl7sEfmC63U67smIIMs/sWTc+03kCOa7Lyh0WyyDLblxCOLZZWPMiGgs/3M5cHfdp/y4RX0ivSEVIVkarSntthq9zejDtM3hcTi0uMPVoBVkYHwPoDklgGE/174VxNnwugQn/cbSM0cvjGg5LB4DRoPA4UJ1a/if6+Z1W7D3de0vpFCG9agvYbWUJYx+8VYktAVQL1tXQXRSY1TspS8b84VK3c5I+1mmLIAT8Yops+rfQmoSZ09ILcQE8p/6kUpbg5Txp372tNl6bNyLP8DCj6iteqNujFgUS8k+3JaNxnO4ah2t4eEUCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(186003)(38100700002)(7416002)(31686004)(8676002)(316002)(4326008)(66556008)(6916009)(54906003)(36756003)(66476007)(26005)(53546011)(6506007)(66946007)(5660300002)(2906002)(6512007)(86362001)(31696002)(2616005)(8936002)(41300700001)(83380400001)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2h4WUt0ZTA4UnExSlZBK2M4MURjamY4QS9OZDV0MU9XOGJzSG9lajRlMDhy?=
 =?utf-8?B?TWVha09JRXRTWkhWZkFROHd6WU1rZENRb2F3RWg0dk05OE4ralZSVm5zVGxo?=
 =?utf-8?B?RnpGc1VMaUNSU2trY1lGRytDL1JGcVFiYS9naVlsbTlOM0JxZ0tQaHhxVnVR?=
 =?utf-8?B?WFdxUmhlTURraUZvbVhXRnlpcG4rQWtXV3hJdXNyZjRwdUpFcVBsTE1KcTJM?=
 =?utf-8?B?WEFIdUJPSzltY0hSbitGWWFmdStiNGI0SUNKY3VjbkYrQnhUYy92M2ZJTGVv?=
 =?utf-8?B?R1lxRGFUOXBpeDFiYyt4OGJ3ZVpYbVNJVzRqaWdkMXl1UGpuNWdKeEwvdWh5?=
 =?utf-8?B?QTB4RlNaVG5kNG5VRFBMdU9ENEFVRDMwa1VBcGhKMEFEbGlZeE0waDZGVENk?=
 =?utf-8?B?NHZzSCtiWHFMYjlaYVdKUldqNGNtZmtLNWllYVk1eVovcXBCQitpMHZHK1Zv?=
 =?utf-8?B?TUZXQXgrN1h1U2pudTh2QUtrL0R0bkc4eTd0WnVIVFhoQzZBZ2krTkVYUnpl?=
 =?utf-8?B?K2doN21pZnFVcVFlT2U5bVdPR0hQRmJWK0dQTk1DQ1RFSEJ2VmpaZ2IwOVRB?=
 =?utf-8?B?WnhYSzYvcUNhZFJWelZ1YVBvbjJla1ZIdkJPbTg1VVNZaVl4VDRUT0xSbHo2?=
 =?utf-8?B?dDRTU0ZCcGcvQ2s3TTI1dXRYRmpTSHFvNEZsWjlQbllsK3pXVndKNEFNTkV4?=
 =?utf-8?B?TzU4VFVjV2Y0bXg3TjkvZ3c2NnJkcTc5UWYvRnp1QUJnaU8zTllpRUs1U0V5?=
 =?utf-8?B?aENGNE0vWENZaTl4NWR0UnFOT05xZU1lY1d1L01sK3E3SUhmUVFMSFppRDJ6?=
 =?utf-8?B?c000UXhzS2J4cDhQcHVrSThLWmd3UE9VbnNYY3owUnJ0TjRmWUU0emJseFBG?=
 =?utf-8?B?NEErTCtURFBvSVByNUVraThtaldVZm5ZWmMzWG5PeFlPVmFlUmg5aVp6NFNF?=
 =?utf-8?B?UGFGcHZtODRsdGRTVGpyb1M1NlZRZlNlcEtjYlgzNE9MaGp0djVSR0k3OGlu?=
 =?utf-8?B?Z0ZlYnNFZGd0L2F1Z2NNbTB2WmJRSU1VbmU1L3U2cW9iR2dOb3BsNVgrL2dO?=
 =?utf-8?B?VGpVKzE5TTIzSnpFNEo4akFmZmNuTG5qSTVseSszYzU0WmVod2lPK3JaM0Ry?=
 =?utf-8?B?Mk1Zb1pMWW9ZRVdTazhqOXVQelRrbDMxSFhBVnRaVzVGNXdlUUtraE43eENt?=
 =?utf-8?B?T2JtMkVsRzM5N0hHL3ZRTWxMUFFPQUlNM0liS056QjI1UU1yQWtrSDVKU05T?=
 =?utf-8?B?cWE3dFduemVZVDcxMDdQRW8vQWFHQm1tU0lTMVNFOUtVb1gvZHR5czJtNVdV?=
 =?utf-8?B?L1ZRYytTejhBWnROR3EvekRkUjVRNGZzZERnb1NXV2VFNFhYRXVVRG85dElD?=
 =?utf-8?B?NUZudmlicUhwQ3hvZnNjY0l5TTUxZ3YrQWZIanExQi85YXBZYTltNloyRTA2?=
 =?utf-8?B?MUxxTitCVnRTWGxPZlphbCtKeDF6NGlyWTNWMmlNVmF3SEtyc3JpZDNJTGFC?=
 =?utf-8?B?YjNLODZTblJodWE4anJ3ZU4yUWxOcXUvUHZvTUN2MDA1UUpUWFV0SkZlWVFz?=
 =?utf-8?B?YVNBTXZML0NXcTk4d1lBWTl5UHk2L0htb1ZocjlRQ1R0bmVGOEFDa3NrVlZO?=
 =?utf-8?B?ZG5GdFB1amZ3bUpzV2VQdTdOd1ZqUzRUYzZTdVBNUnk4SUFscUtwMlhLbFBH?=
 =?utf-8?B?bzJWTDVSK3hhbC9FTFB1aGp0ME12YWF4bEF5VytJWlgvZ2VrME9IejNTRE5j?=
 =?utf-8?B?N2tQTVhkcHZCeXA4SlpuT2FuVzZ0OS9vOUtMMWl0dmcyYVZRZ3Ara0J0LzBp?=
 =?utf-8?B?N0YyVkRHSUR4QkR2UXdQbXBuaDJqcUNJYWRMa3JScXBRaXo3V0x1WDZ4MEd6?=
 =?utf-8?B?NWVYNnZ4QU1JQ3MwTFRQR0RGNmFjQlF3ZVl3am5LdlRtT29EUE9sL0t4VTgv?=
 =?utf-8?B?ZlpSRGQ0MUhzdE8vcyt2dUFNZTIwb2tjcUVTS1l0elRRYTV3ZitsUTdhZExS?=
 =?utf-8?B?R2xKNXh6YnE1dVhaekhhSmIzUk04bC92K1FWM0s3WjBoMUNSc1N5bkhEc3VR?=
 =?utf-8?B?ZkpYYjhkUUJjSVJsN2pvT25HTEhFWlhuM0ZTMjJvWXl0R0gvKzVUU3N2ZlVr?=
 =?utf-8?Q?XyNA6TCjKJdptMktf4grnsWUg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3bf51c-4d71-428d-d45f-08da6fcdf77c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:46:03.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSqKF66wq2qwKriFEe0mtY29Uj0IYP1qrnkF7wcjHCXvnhNwdW/DQfe+b63Nb8MHyIgeqdEqC+Lo8dV0PIvDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639

On 06.07.2022 23:04, Daniel P. Smith wrote:
> Here, the vcpu initialization code for dom0 creation is generalized for use for
> other domains.

Yet with "other domains" still only ones created during boot, aiui.
Imo such details want spelling out.

The title also is too generic / imprecise.

> --- a/xen/arch/x86/domain_builder.c
> +++ b/xen/arch/x86/domain_builder.c
> @@ -28,6 +28,18 @@ static unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>          return bd->ncpus;
>  }
>  
> +struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)

domain_alloc_vcpu0()?

> +{
> +    if ( bd->functions & BUILD_FUNCTION_INITIAL_DOM )
> +        return alloc_dom0_vcpu0(bd->domain);
> +
> +    bd->domain->node_affinity = node_online_map;
> +    bd->domain->auto_node_affinity = true;

I can spot neither consumers of nor code being replaced by this.

> +    return vcpu_create(bd->domain, 0);
> +}
> +
> +
>  void __init arch_create_dom(

No double blank lines please.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -14,6 +14,8 @@
>   */
>  
>  #ifndef COMPAT
> +#include <xen/bootdomain.h>
> +#include <xen/domain_builder.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/param.h>
> @@ -3399,13 +3401,13 @@ void wait(void)
>  }
>  
>  #ifdef CONFIG_X86
> -void __init sched_setup_dom0_vcpus(struct domain *d)
> +void __init sched_setup_dom_vcpus(struct boot_domain *bd)

Perhaps simply drop the original _dom0 infix?

>  {
>      unsigned int i;
>      struct sched_unit *unit;
>  
> -    for ( i = 1; i < d->max_vcpus; i++ )
> -        vcpu_create(d, i);
> +    for ( i = 1; i < bd->domain->max_vcpus; i++ )
> +        vcpu_create(bd->domain, i);

Seeing the further uses below, perhaps better introduce a local variable
"d", like you do elsewhere?

> @@ -3413,19 +3415,24 @@ void __init sched_setup_dom0_vcpus(struct domain *d)
>       * onlining them. This avoids pinning a vcpu to a not yet online cpu here.
>       */
>      if ( pv_shim )
> -        sched_set_affinity(d->vcpu[0]->sched_unit,
> +        sched_set_affinity(bd->domain->vcpu[0]->sched_unit,
>                             cpumask_of(0), cpumask_of(0));
>      else
>      {
> -        for_each_sched_unit ( d, unit )
> +        for_each_sched_unit ( bd->domain, unit )
>          {
> -            if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
> -                sched_set_affinity(unit, &dom0_cpus, NULL);
> -            sched_set_affinity(unit, NULL, &dom0_cpus);
> +            if ( builder_is_initdom(bd) )
> +            {
> +                if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
> +                    sched_set_affinity(unit, &dom0_cpus, NULL);
> +                sched_set_affinity(unit, NULL, &dom0_cpus);
> +            }
> +            else
> +                sched_set_affinity(unit, NULL, cpupool_valid_cpus(cpupool0));

Hard-coded cpupool0?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -2,6 +2,7 @@
>  #ifndef __SCHED_H__
>  #define __SCHED_H__
>  
> +#include <xen/bootdomain.h>

Please don't - this header has already too many dependencies. All you really
need ...

> @@ -1003,7 +1004,7 @@ static inline bool sched_has_urgent_vcpu(void)
>  }
>  
>  void vcpu_set_periodic_timer(struct vcpu *v, s_time_t value);
> -void sched_setup_dom0_vcpus(struct domain *d);
> +void sched_setup_dom_vcpus(struct boot_domain *d);

... for this is a forward declaration of struct boot_domain.

Jan

