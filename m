Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F355887F4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379599.613171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8qC-0002rV-Rv; Wed, 03 Aug 2022 07:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379599.613171; Wed, 03 Aug 2022 07:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8qC-0002oV-Oo; Wed, 03 Aug 2022 07:30:52 +0000
Received: by outflank-mailman (input) for mailman id 379599;
 Wed, 03 Aug 2022 07:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ8qB-0002oP-Fn
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:30:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325d6c84-12fe-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 09:30:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4601.eurprd04.prod.outlook.com (2603:10a6:5:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 07:30:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:30:46 +0000
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
X-Inumbo-ID: 325d6c84-12fe-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE1F1JEhn5bmeqhKDVM6IEW0wSsTY/TzjWTZ4pwRpc5cyAIoVRHxbevF7nvHCzSY+obtUbnuvvX/04dpDzg1/WX+fxGbkofAzwSD0VWAJleQPIDy/HG5lKEpGFySD5qJryppuV0m7JeljcY+Q7lr1Eoua/32lrFW+psvq3FP22JKuqDWnSI5ZLfegjF3lOVNbuXkB22tFh8HZEBMYHCSjzgW/yo8HhwKSgZrIPtJ+b2u2HgK/7qSfAJqPEIBc1Hue0hmNXIB5IsrILqWw/ZUO6Uxc2SufYB5fVF/yLUr/+5V/rN2iH4Gfc6HZBYmHf76eTm0v4V/t1PXoNyY+r+Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxWMetrTgl7p4rMg2Ly8/M/Qw47nta0kpvluMzcZjZ8=;
 b=J03rtb9ll9vIyEY1V2uJrrcXRCF9izLtJKDOM5tR3LNDaJM614BUJ8S4SXX5gZrsnTGP3sTiZHJDDCZFodeEfoeKrOWgka9GTfXY53o3H6oyTSYoD67Uf/jRuNurFlZRQ+wH6FQvWGEBYsk37RfdhwphGnCBk/1XJfmZcgyfrT9R0OkUPPRRRv3K/NEMZOfqVchdJd9a3sYv6vZaiXV6ZkP1V5ez3QfSBznE7rFSHYJ2gh3B9+mmjuKd3WTIcCwMH8sooapXNzONSS6nXqnuuI5frW52Oi90+N+55/C+tVZ/PHuMDeioEINgLXNvLYIcnny4n6RAng0wAvp4FieZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxWMetrTgl7p4rMg2Ly8/M/Qw47nta0kpvluMzcZjZ8=;
 b=LO3AZMy+OXxZajU5VQUjL0E5LONafCmkAM56bGydnEwQ93mF12yqenS/G4ZNttfYJPv+3d3ZzO5JWvvefp4RvYdeEsFECI7ZQX8rm+/kay0aflk3+zGuXXT9Nqq8Hbl1GcGhE1t0lUR+lEVD3qbPiAC5cFmzRMdSaZk390u55GPUln8XuwfgKNtFh9riYltqnniYE1YESfpWJDAEdAZ/mXBsTCdNHWL70X2sW6bQtUvay2Shsf9DwJNs7+VFWmNngdBXvn7V10tvy5HtkREaPs2TfSduTtAK9Qco+TXUcGI1AaGVypWggMV1d/1DMN3HOVoKVNkMSx6uBiUXEgSmMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2295db64-369b-b679-e74c-9aaeaa8ed801@suse.com>
Date: Wed, 3 Aug 2022 09:30:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] xen/sched: setup dom0 vCPUs affinity only once
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Olaf Hering <ohering@suse.de>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
 <165944829637.3531.11115034950872470305.stgit@tumbleweed.Wayrath>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <165944829637.3531.11115034950872470305.stgit@tumbleweed.Wayrath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bcca017-5527-42c0-eeb0-08da752214db
X-MS-TrafficTypeDiagnostic: DB7PR04MB4601:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ndQWZAL4M1F6K2CvG5jn1VpsHXKloPGCFjxfXgXzNstLyLMVKwPmRX0bM3nYYqbMMtnUYlDEZ1/0/IwHmjb+AGZiz1eaDohatsMTK71C70gAfYyQTyJupwSKuqJPr4edw0BCVGjSoulvkojv9aSQM2Mfk3kjzpQJteeEGC8l/JabW/xaAy9rggRIC0EvS3KiyFI7Wt89ka/3SBIYjYk1qre0HsH1/pYBG/MAfAW57r/IQB4S8XEHj4+KuuC9fe4m8snQ87VJNYexBBzpYBNcY2SGKvsIqDTWxsDLIZSKRqnXyp/5exZ0RFz4T6HS213958sQhbbvMtsd3VAp5e3nZcHOHPresNNF+Lgmq0tgUFFBpp394TG/EZUn0/FZaEK7bp6/jXw5CgG/NfjYUdBwsbburhmx/t6JpFerUNJW56Oypvus5kNE55Yg2gbF6S6QnSYo1OtNj7S4XtojSJ9HEc600amtijo4jRVCRy14B0Cb+Synv2tYEJPlAYprIXmD1auchDqOveFDQZGWtF1p2zWDiwMxKj4swjajiOmC14ZzQXfDcEuWwu0kj7tCvv65s2VSmVaQ2c1ILHOLl7J8r+RTM+S4qFYAPmmdYncwh+EB31vytREM3AVJNsD1i/mErs+RHbA5Di/YVfMKD2lp451fWT3YkwBZO9OIsG+Cl0eYkl9Zgl36BeOtdo1e9DX6bs7yljOfIMYR/VmbTp62rlwl7YEVL67Nj5Ls8LTbD9AALtoGaiEw7MWuG3+0DrcEpI+MGn4OKI8iSVoAYs3j3+UouxyV40s1gLQ3YKS+Idu1l5EuaiOLCkotX6SmttlBa8R0jvZ4JmhGWvxMwrt4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(39860400002)(376002)(396003)(86362001)(83380400001)(31686004)(31696002)(53546011)(26005)(6506007)(2906002)(41300700001)(186003)(6512007)(38100700002)(6636002)(316002)(37006003)(6486002)(54906003)(6862004)(4326008)(2616005)(8676002)(36756003)(66476007)(8936002)(66556008)(478600001)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlRRZ1BnS0pWaUJzN0xHcUd3QlJURGx5TEE2ZVBxTnhrZVV0dE91dUxObGFm?=
 =?utf-8?B?SGgxQXpndW9SRWZRM0RyWGtqSS9xR3p5OXd6bFpWODhBOHU1cWdRK2VnVkhi?=
 =?utf-8?B?TzlhN3FtWlpOVWROb2NBRVNwUVRkZmtzbEw0TnB6ZjNIZS9WQUxxR1htSjdl?=
 =?utf-8?B?aTFRS3JsTmswSkQ5czE4RDkwVk1YZEJtUFBCN2JrRkxWT0RTYUwvamx1dWVj?=
 =?utf-8?B?UHNZTEo3a3F4MmxEMUtJaHMyMDBkZ0JSN0d2OHN2STU2NDU4cXNVdFFRVDVv?=
 =?utf-8?B?UHkzcWprMjFpcVFERWZwM2ZiNHptditQdURzUzc2elpDeUwyWWZ3NGhTZGlm?=
 =?utf-8?B?bThFZFdsRTdXZ2d5S2FjN0gxbW9JUTZuVWlZQllCNUd5a1VqeFVWVlJhN00w?=
 =?utf-8?B?a1k2SWtsWWZxNTdoQUJ6SnZjNW13RVZ6WUF0ZHRDUzJvK1pzMFR1bzlmNlRI?=
 =?utf-8?B?eW9IN1h6SlVFdXdwaGNyOHU3SGpGME1sazZaeGNoRjV5L3hmTEtnUDdrclF6?=
 =?utf-8?B?V2lJaC9CSkNrNzkreno2eFc4TWVmazNQbkR2Vm9hZkpwNUNpZDNOajk1d3Vv?=
 =?utf-8?B?TUY1TkdMR2d2NExxeU5Jdy9YTFNzVGQ4eVBzTmZxcTVWM1RnQ09LNUVPWWpH?=
 =?utf-8?B?eVpUNCtIOWU4YjVTdis2a1pZN2w2R3pldUdEMEoxaXV3eWdCR0xPckhWMzFO?=
 =?utf-8?B?eFR5YzZDNVRCaHVzdjhYYW1kV2NYVWs4ajFhbG5rOUJwb0F6S1FTWmdxZ3hZ?=
 =?utf-8?B?NEpHdFRvc1RaUnpUZHNNMWhmUEhkMFprb0x4RW83SjBhcXlraHhaakR4bHpT?=
 =?utf-8?B?dER4ei9CVEVYNDROdVlPMjFyaTM4U0lkWjQ2dVJTS09CYnI2ZlFlVXFoZGVH?=
 =?utf-8?B?VlMxWHF3Zm1NQU42UnhUcllMSlJycXVNSUdOSDdnbmhxK0Q4UjNoV2h1aFNk?=
 =?utf-8?B?Z3ZRdE5BUFFib012enIwZGZYT3VTZ2RuLzhnUkQyNEhDZWVmd1A2S1RLV3F6?=
 =?utf-8?B?eFBaMXk4SXZKWGIrYlVoZzBtZUNXOGxiOVMyM2paV01wWjZpZ2lTWGNuYXFp?=
 =?utf-8?B?cGxSU3pxWFdrcVM4aWx2QUsrQkFHVXJmcmk3ODFsUldOTjdTZ2l3NUFacW5G?=
 =?utf-8?B?Tk91dXY5SWJBRmQwUnc0QUdBeDY4Y09XbzZhN1FWcUVkQ1lsUnAzUnhBeWFJ?=
 =?utf-8?B?M1FwMTJid1lWaW5KVVVjRldWMjdkRjdDdHRxT1JNSDg0VEwxWjREbkxDeEI5?=
 =?utf-8?B?N2FKOXVTMWlSUVNzTUQrcHNNbndhM01HdWVGczVNZE1GQUJBOVV3cGF5TDhr?=
 =?utf-8?B?dkFBR3JSakNSdkhXQlJTMkFra0Jkb3pyeUxCcE51MmJEV3pQSFY5Tmg1c0JP?=
 =?utf-8?B?elcweVBiZXBsYVczNzczcWRLSFhFanhMS2VmaGlpQ1VIYk5LeG8vVGJPbGpS?=
 =?utf-8?B?cmFrTnJUSGJXbnlGYjRmRHVEUk1oa3gzY2xOZnRSSnRpdWhLeXRuN0QvVmhB?=
 =?utf-8?B?MndzeE1ZQlNONUlIT0V4Zm9EaG1Udy83Nk5NMW1pYmtLd3JKL1RQbFp3SkRK?=
 =?utf-8?B?aEVWYVRZL3I3WTc5RGFBajZrU2JDMDAzd2UwZ25IUWxFQ29CajhyeXZMOXZO?=
 =?utf-8?B?R29jTlRHeVlLdm1adHF6LzhEZXFvNjhOL2ZGQlg4ZUVIKy93U3d3QjJHcloy?=
 =?utf-8?B?VXNoNG5QT1JXdlBIaVVGVm1uWFJFb29tVnErYXZIZ2E1blA2QnlZL1BOU1h2?=
 =?utf-8?B?N2Z0RGNGZWR3TGxSNWNqelVOV2FZRjdGV2FTMU4vK0o5SGxSN2swZGNtTm00?=
 =?utf-8?B?VGZqSDFXcFVIUmMxYjdpd0tMcUpBU2JHbVRGQlBNQnFkS3l2Umkzd3ZDSlJo?=
 =?utf-8?B?b1NjOWZpMnZ5L3U0dFNoYTA1emRkZ0F0a2prQkxndkFkZDAyM3daK0xnZHB1?=
 =?utf-8?B?NzczcE1ac0ovVFNlYnFTWkdoOUhjUzFlQlpyOGhPUzFGOEdqSWZvMks0bTd6?=
 =?utf-8?B?bG0vMXdpcEJ2WW1KRzJybHpBbkZyRnM5MUI3dkdqZDM4RkVOejVCa09uOVBT?=
 =?utf-8?B?R3hUY0FyWlA5eklwRm8xODhZUmRwdSt6YUFTVGR3OWU2QkZTa3hsSVNUSGZN?=
 =?utf-8?Q?40S/C/vf/IUs+jvUTlHvJ+nr/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcca017-5527-42c0-eeb0-08da752214db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:30:46.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A56rg0sD0vErwIPPU2BF2mXUpJdrAkejWVLdpnoNXa3v7kgoZSstBsPmHWtTy2wUVCqISVCV7pSJ1P3eXhVETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4601

On 02.08.2022 15:51, Dario Faggioli wrote:
> Right now, affinity for dom0 vCPUs is setup in two steps. This is a
> problem as, at least in Credit2, unit_insert() sees and uses the
> "intermediate" affinity, and place the vCPUs on CPUs where they cannot
> be run. And this in turn results in boot hangs, if the "dom0_nodes"
> parameter is used.
> 
> Fix this by setting up the affinity properly once and for all, in
> sched_init_vcpu() called by create_vcpu().
> 
> Note that, unless a soft-affinity is explicitly specified for dom0 (by
> using the relaxed mode of "dom0_nodes") we set it to the default, which
> is all CPUs, instead of computing it basing on hard affinity (if any).
> This is because hard and soft affinity should be considered as
> independent user controlled properties. In fact, if we dor derive dom0's
> soft-affinity from its boot-time hard-affinity, such computed value will
> continue to be used even if later the user changes the hard-affinity.
> And this could result in the vCPUs behaving differently than what the
> user wanted and expects.
> 
> Fixes: dafd936ddd ("Make credit2 the default scheduler")

Nit: Please specify the first 12 digits of the hash here, as per
docs/process/sending-patches.pandoc.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -571,12 +571,46 @@ int sched_init_vcpu(struct vcpu *v)
>          return 1;
>      }
>  
> -    /*
> -     * Initialize affinity settings. The idler, and potentially
> -     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
> -     */
> -    if ( is_idle_domain(d) || (is_control_domain(d) && opt_dom0_vcpus_pin) )
> +    if ( is_idle_domain(d) )
> +    {
> +        /* Idle vCPUs are always pinned onto their respective pCPUs */
> +        sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
> +    }
> +    else if ( pv_shim && v->vcpu_id == 0 )
> +    {
> +        /*
> +         * PV-shim: vcpus are pinned 1:1. Initially only 1 cpu is online,
> +         * others will be dealt with when onlining them. This avoids pinning
> +         * a vcpu to a not yet online cpu here.
> +         */
> +        sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
> +    }
> +    else if ( is_control_domain(d) && opt_dom0_vcpus_pin )

Like with patch one: d->domain_id == 0?

> +    {
> +        /*
> +         * If dom0_vcpus_pin is specified, dom0 vCPUs are pinned 1:1 to
> +         * their respective pCPUs too.
> +         */
>          sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
> +    }
> +#ifdef CONFIG_X86
> +    else if ( is_control_domain(d) )

Same here then. With this and with the hard tabs taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

