Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C34FF456
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 12:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304015.518517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZnS-0002fs-NQ; Wed, 13 Apr 2022 10:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304015.518517; Wed, 13 Apr 2022 10:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neZnS-0002ck-JP; Wed, 13 Apr 2022 10:00:22 +0000
Received: by outflank-mailman (input) for mailman id 304015;
 Wed, 13 Apr 2022 10:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neZnR-0002ce-MI
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 10:00:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8675d293-bb10-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 12:00:20 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-AQ0Do4-CMFWWyUUxaY1jEA-1; Wed, 13 Apr 2022 12:00:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM8PR04MB7316.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 13 Apr
 2022 10:00:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Wed, 13 Apr 2022
 10:00:15 +0000
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
X-Inumbo-ID: 8675d293-bb10-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649844019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQMIrFcPmVtolBh282r4JMvHWMIA/wsKbfYGuxCseDA=;
	b=CJ0Og0c6P/QBQe3IC0Vt+mefm9x3QmMoKBA7x08pM3V/gpJkLFnc5TQ0ruePB4Me79+UG8
	8O4XWKFw07wod+6KbuPghr4E3skY4NFEmRabzz7WaNj7oSd0CeaifRETfujVAQ5tjpeWwe
	ngz9gGx0D0/ucqKLaTEs1N8riBzTGaM=
X-MC-Unique: AQ0Do4-CMFWWyUUxaY1jEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3+8la/G5k8tnqLg3GDbwB0AdHlzGr7wDYluMoG2l5wDsMGZaYKtEDLFOV4LdhSgZ/AuPjFbtEB0oBcGhJ2qixf7PlsYEoanu6kBGkXzOFTKgskWglF/rA5Cni5J7r89AqAVDquKkpQPQDJsIC+66WXmaU5Chp47VArCYvNCadmc3b0ieq6bF3d5Frz6lPDesrT+SZ2ZY/Bt28HbynQwC2OqvlLgXsc7wyJxwGSaHMUBndj0WMfeoRjVi0m/2bnszCUf9RtNIFh/0zybzERw7//iw251Y07TlYICT9mLkNPykpTr8HdsNkUSoryQOInC8oBYzvJmWej4iQc+HYsSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQMIrFcPmVtolBh282r4JMvHWMIA/wsKbfYGuxCseDA=;
 b=L4WbSYuoTM4mjabzeH6P8yddNItiZIY5XkT40WYTxN+lW7RgaHoKMvGn5t9zYUg+wXSs2jHNU2ZUufO8lKG85WhZWjNIfTLVqRpXpiqw+dtVIu8idE1lR9Cbp5uHrYOVsbGdS5mWSOLTJ0Om86PXC9BpJBdFo+qPdLDgbEsLDt1c6qhRMaeH8ljGthZPunjpJp28BCeAWsHiktm6tcKPX6ohkAqsDcULamFRox1RPwWysSDeGVE8BAJvkEhyBMe76swUoWCd6K6eKTYdR1LmoGmVTNZ2ZB7Sxqhs+Sdbk57Ld89dDaN53xrkgMEs0AfjbI+B+88Z2Y7Y/0Li4pTDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
Date: Wed, 13 Apr 2022 12:00:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f89781-78b6-479c-9db4-08da1d34682a
X-MS-TrafficTypeDiagnostic: AM8PR04MB7316:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7316C0E3E1C516AF358C00DBB3EC9@AM8PR04MB7316.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6jww2sYmBPQRl2zxDsr3qqarkl8M5uGXc515uAGFOnWSKDoOjJrEPN/dwp41CWFqJuVR2HG6cnt/bUATfaRKsBybRuHKUUh0DFU+cb7ooHA4yA6hsRDgoNwZZafJV9eA0sr3Sn5eu9yX4uHoM9AdwDez2O6ML5VAyhVUwlfjpjuAxBeK2BlbAzl5HggO/CWOh+7W6Wp2tQzLcCvBZdR3W69EPjWUvkyM/UPSC2qTxpzGK2YIlyZ20UKDk+SiQeSxAUUsd7HhFlv3W0+5nZbxsewMjG+wOsGwH5Ta9YdnkeOQKpMhVmQBVdE4HS4kIm1Nw83eC4BMx8y+FuGQFkOyRj8fGNtFv/5EfV3wA6Q2VBR5y+KTOvHIljgzfHvj7v9AUJMmAAx2F1aozlvzPOWbEmXFLgndnfC7GUvzGgsNjZ75GnF8nVNp2p1JiBXZipleUGkh0iH0kGy39FSfZ+xKR2jLHQiBBmM/Sa1qGZTYdkHdnBLd7U/sZyQ1KFSzY+gKSWhVNujPuL3q7SYsZHp+6/r25eV+/CKxEmuwb579VLS4i4WjuiW73z1d1qw/gHbLYQPy/alwPsTzVlAPZehKEGc0GtoFokkkVgikyktEau2pNcesPlYf1zGjIlUvQrE4V1TBGHyBdVfhKJn6//fzJlTXXujz2ISyLtlJealGeRI2gjhfLGMS/xS0HGYoR6RpXsB3on1sRr9kVFE5UQv+nvJR61ovavslAaLBdS/LX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66946007)(66556008)(6486002)(83380400001)(26005)(36756003)(508600001)(2906002)(6506007)(31686004)(186003)(8676002)(31696002)(6862004)(4326008)(8936002)(316002)(54906003)(6512007)(37006003)(86362001)(6636002)(5660300002)(53546011)(6666004)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnE0cUl5T0lNSUlvM2RWMjlVU1pPMzlRRkR0WWY3djlIWWlXZmhUSG5obnFJ?=
 =?utf-8?B?anVvb2dxZnpPdlVYYUVFdi8vSmkyR3UwRDJyc1IyS2hacnpVZm9MblJ5ZlRh?=
 =?utf-8?B?R3JNSWhseEZSV1EzUEtoS1JYbTFnUXRGeGR4aDBRQmhic3A2ejFHbkRyQ2dk?=
 =?utf-8?B?Y0ZQbnRqRFlHdG9CZEMzb1Q1WE1YRTBmVTZHRkwzczNuL1R1dkZNdk1wYlBE?=
 =?utf-8?B?NTRrYkNaQjVkR003L05WMUFaOG9kYlZjQmNvdGZaRzMyQ21NZ3hYRzBETThB?=
 =?utf-8?B?S1VmNnlCcG9JY1ZBWnc5azdwSjAzKzlsVzc5QjhKalFUMFMxU2pzSFNyakdq?=
 =?utf-8?B?OGFnMStJaHg5NjkvYTVWYU1FWnlaQ3VIajVXZU1EaWV3dlBESmVjOVZaNytw?=
 =?utf-8?B?L1B5SFVOQzRyT0RtcmNjVFV5Nm8yeFVzc0FXcXdkVnVJblh2SjdCRE5YMk5Z?=
 =?utf-8?B?NzgrWEVwVlFIWlQwb3dWclRucXVPOE83c3NlQzBKWkZQUUY3anM2dmxpYWFq?=
 =?utf-8?B?TUJhOUx3eFdYTmZsVVNqaG5HWi8ya3pseDI5K1lRQWJXc2ltOEJQZmtkZ3dT?=
 =?utf-8?B?SEZjZnNwU1J0M0VFajduQWhLV1hrTnVIZ09lOGtpa3VHNFdkQ2VUcDg2eVJr?=
 =?utf-8?B?MXFYaXRXT0xvT1dEVjZGamQzZnBLc0VOKzFLejJ3N0oza3MzUStmOUNXd2Zu?=
 =?utf-8?B?RHhqUk1tdHNHU25hY2dWMlF4OHBFVURNaEw5M01mZTQ3bWs3aEh6OUN1Q042?=
 =?utf-8?B?V3hHMitWbkRLSHVsTDAvdFRSZ2pCeHFOOGFzdFBMVlp5WU4ySjNOK0c1L0ZW?=
 =?utf-8?B?bzFMK2dSQi9aYnJVUXY1NHRjMTJBOERWbWxqRVQ3S00wSDZaNFRQOU91WW9O?=
 =?utf-8?B?UkFCSy8zUXJDUE5YaWJpZ0RmZ3h6Nkl2WkdyQlhMTlBDRnBRUXcxYjk0L0M4?=
 =?utf-8?B?MG4vQlREVzFTdmdITkhETHFLd0NkTnpaZllMaDRvTVZTR21DYzZSYmg4dFlZ?=
 =?utf-8?B?TXpRQnBTQ1VXRkQvUVNCSWIwY2Z5UHIybVpEV1Z2cWp0RzdxS01HYmRvcmt4?=
 =?utf-8?B?dkw5ekxtWlpNckdTRTk4TG1HdU8zOXVVZzlVN2xpTS85SFZ0U2kwUm1iVjNa?=
 =?utf-8?B?ZTBGTVR4azNHZEZBczdpRENrWjBGcmFSOUVKNmxYaW5RRFBTaVYzVGdTc2Jn?=
 =?utf-8?B?eTQ3Uk9RWG1mZWtWZ0xIVjArTzZxMnpnVTBWNnpYZFVaN0g1NjlqNkRZY0Yv?=
 =?utf-8?B?OFg0cGprZkdxMG1vSFluYWw1MUJrd1VVSzd6bXdKM05sVmFwRHhnRmN5Q0cw?=
 =?utf-8?B?RXJ6M0ZnQ3M1ZW1za1NPTDZ6bW51QjNyZjEwTURGSGtvS29FSnBLbEpTd3R1?=
 =?utf-8?B?SkR2ZW0yKzRhL0FWUTFtMEpkcXN1UDRaanJTSnlZZFFjYjBaQjBhbGxaK0wz?=
 =?utf-8?B?cnJXVHR0UVhzRGRWMHhPT05DQUduYytQMTBHeDBXcDJsallFaFVXMTBVVkxT?=
 =?utf-8?B?UDNHNStXL0VwYXdvRlMzT1MvYUFZMnZ4aHcxV3FKQmtHVUs2TmdKZ2FlVjZK?=
 =?utf-8?B?WElQWDlqY2JyWDB0K1AzWFJRV3ZCWC9oQy8zY3FUWjJObUVWN3dQSm84eXNa?=
 =?utf-8?B?TytBZ3FDSmEwNFdjL0phOTVScEZlRHl1UURiKzJwZldhWWZjWW5icytDRTVa?=
 =?utf-8?B?YjBUUnZDbGhrQmMvbjZ5Z1Q2V0x1d1laSmNmQWJoZWFINk9qUzIrMTZrSEhI?=
 =?utf-8?B?QTRCSWYrZ05RUElNYmI0L1czVUtuYzNUQThaejVZam1ZM2pIaG96cWdXNHZY?=
 =?utf-8?B?alppT290akg4SWt6QnJVaTZXUm0wZEFzT1Y4SE5MU2pVMWFpTEJEenpoOVFw?=
 =?utf-8?B?NlhyVWlrcmQydkNIVlhIL3NNOWJjc1BRclNuTzBMNzZ3WVovQ3U5VnpYdEVO?=
 =?utf-8?B?NkV6ZUVzOGxVcElvWDNjcnh4ZnVoNXVsSk5YQ0xJQjR1cC8wcmFVVm1EaGZY?=
 =?utf-8?B?UzJ1MDRJVXdUTGhoTDNLVG8wY0U3b3lvTnlnNnAwZStGbFhxMnp1V1FhUWJ1?=
 =?utf-8?B?a2Yxb1NQVkYrbHZ0Zi9SaTZXTStRZ3V0cDl0YVpEZUYxTU1KelhnVmVNd2lV?=
 =?utf-8?B?RU9LQnVIU09BcjNmNytaeERyR3dObGc4ZFZmREp3TXA5NEJsVTFNSTd4WkZH?=
 =?utf-8?B?YnFNNTR6UTNUQkVMUnBjeG13MGYwT3N4T3RhdEhaMisycFpreW01SXNKV0lh?=
 =?utf-8?B?eU4rR2UwaklkRldvelZxU0J3azFYRHlCbVo1b2hKc2JHdkp6bEJSRU41VlRL?=
 =?utf-8?B?a2grd2U0eGZWUGVnNUdNa1FWNzZvM3I1UnJRakRSZlVlQUxUOTVmUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f89781-78b6-479c-9db4-08da1d34682a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:00:15.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDEdjtmcaTsxgOujygb+QiuXRv+xCBOPAdnD5lg9G8E5fRK2VV9lf2vgrg+VPEgd7FDAvSrjsAyV9uM8Zm5GEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7316

On 12.04.2022 18:11, Dario Faggioli wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -572,11 +572,41 @@ int sched_init_vcpu(struct vcpu *v)
>      }
>  
>      /*
> -     * Initialize affinity settings. The idler, and potentially
> -     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
> +     * Initialize affinity settings. By doing this before the unit is
> +     * inserted in the scheduler runqueues (by the call to sched_insert_unit(),
> +     * at the end of the function, we are sure that it will be put on an
> +     * appropriate CPU.
>       */
> -    if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin) )
> +    if ( pv_shim && v->vcpu_id == 0 )

I don't think you can handle the shim case first, as then you'd also have
its CPU0 idle vCPU take this path. The difference _may_ only be cosmetic,
but I think it would be odd for CPU0's idle vCPU to have a soft affinity
of just CPU0, while all others use cpumask_all.

> +    {
> +        /*
> +         * PV-shim: vcpus are pinned 1:1. Initially only 1 cpu is online,
> +         * others will be dealt with when onlining them. This avoids pinning
> +         * a vcpu to a not yet online cpu here.
> +         */
> +        sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
> +    }
> +    else if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin) )

Here (pre-existing) as well as ...

> +    {
> +        /*
> +         * The idler, and potentially domain-0 VCPUs, are pinned onto their
> +         * respective physical CPUs.
> +         */
>          sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
> +    }
> +    else if ( is_hardware_domain(d) )

... here I wonder: Shouldn't this be limited to Dom0 (for the purposes here
!= hwdom)? Any special affinity for a late hwdom ought to be specified by
the logic creating that domain imo, not by command line options concerning
Dom0 only.

This then also determines where the involved variables (opt_dom0_vcpus_pin,
dom0_affinity_relaxed, and dom0_cpus) are to be placed (answering your
question in a subsequent reply): If it's strictly Dom0 only (and knowing
there's no way to add vCPU-s to a domain post-construction), then
__initdata is fine for all of them. If late hwdom was to also be covered,
__hwdom_initdata would need to be used.

> +    {
> +        /*
> +         * In absence of dom0_vcpus_pin, the hard and soft affinity of
> +         * domain-0 is controlled by the dom0_nodes parameter. At this point
> +         * it has been parsed and decoded, and we have the result of that
> +         * in the dom0_cpus mask.
> +         */
> +        if ( !dom0_affinity_relaxed )
> +            sched_set_affinity(unit, &dom0_cpus, &cpumask_all);
> +        else
> +            sched_set_affinity(unit, &cpumask_all, &dom0_cpus);

I guess by referencing dom0_affinity_relaxed and dom0_cpus outside of
CONFIG_X86 section you're breaking the Arm build.

I also have a more general question here: sched.h says "Bitmask of CPUs
on which this VCPU may run" for hard affinity and "Bitmask of CPUs on
which this VCPU prefers to run" for soft affinity. Additionally there's
soft_aff_effective. Does it make sense in the first place for one to be
a proper subset of the of the other in _both_ directions? Is that mainly
to have a way to record preferences even when all preferred CPUs are
offline, to be able to go back to the preferences once CPUs come back
online?

Then a follow-on question is: Why do you use cpumask_all for soft
affinity in the first of the two calls above? Is this to cover for the
case where all CPUs in dom0_cpus would go offline?

> +    }
>      else
>          sched_set_affinity(unit, &cpumask_all, &cpumask_all);

Hmm, you leave this alone. Wouldn't it be better to further generalize
things, in case domain affinity was set already? I was referring to
the mask calculated by sched_select_initial_cpu() also in this regard.
And when I did suggest to re-use the result, I did mean this literally.

> @@ -3386,29 +3416,18 @@ void wait(void)
>  void __init sched_setup_dom0_vcpus(struct domain *d)
>  {
>      unsigned int i;
> -    struct sched_unit *unit;
>  
>      for ( i = 1; i < d->max_vcpus; i++ )
>          vcpu_create(d, i);
>  
>      /*
> -     * PV-shim: vcpus are pinned 1:1.
> -     * Initially only 1 cpu is online, others will be dealt with when
> -     * onlining them. This avoids pinning a vcpu to a not yet online cpu here.
> +     * sched_vcpu_init(), called by vcpu_create(), will setup the hard and
> +     * soft affinity of all the vCPUs, by calling sched_set_affinity() on each
> +     * one of them. We can now make sure that the domain's node affinity is
> +     * also updated accordingly, and we can do that here, once and for all
> +     * (which is more efficient than calling domain_update_node_affinity()
> +     * on all the vCPUs).
>       */
> -    if ( pv_shim )
> -        sched_set_affinity(d->vcpu[0]->sched_unit,
> -                           cpumask_of(0), cpumask_of(0));
> -    else
> -    {
> -        for_each_sched_unit ( d, unit )
> -        {
> -            if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
> -                sched_set_affinity(unit, &dom0_cpus, NULL);
> -            sched_set_affinity(unit, NULL, &dom0_cpus);
> -        }
> -    }
> -
>      domain_update_node_affinity(d);
>  }

I consider the comment somewhat misleading, and hence I wonder if a comment
is needed here in the first place. domain_update_node_affinity() acts on a
domain, not on individual vCPU-s. Hence it's not clear what "calling
domain_update_node_affinity() on all the vCPUs" would be referring to. I
don't think anyone would consider calling vcpu_set_affinity() here just for
the purpose of updating domain affinity, with all other (vCPU) affinity
setting now happening elsewhere.

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -749,10 +749,12 @@ static int get_fallback_cpu(struct csched2_unit *svc)
>  
>          /*
>           * This is cases 2 or 4 (depending on bs): v->processor isn't there
> -         * any longer, check if we at least can stay in our current runq.
> +         * any longer, check if we at least can stay in our current runq,
> +	 * if we have any (e.g., we don't yet, if we get here when a unit
> +	 * is inserted for the very first time).
>           */
> -        if ( likely(cpumask_intersects(cpumask_scratch_cpu(cpu),
> -                                       &svc->rqd->active)) )
> +        if ( likely(svc->rqd && cpumask_intersects(cpumask_scratch_cpu(cpu),
> +                                                   &svc->rqd->active)) )
>          {
>              cpumask_and(cpumask_scratch_cpu(cpu), cpumask_scratch_cpu(cpu),
>                          &svc->rqd->active);

This change is not covered by anything in the description, and I wonder why
you're making the code adjustment. If svc->rqd was NULL, wouldn't Xen have
crashed prior to the adjustment? I can't spot how it being NULL here could
be the effect of any of the other changes you're making.

If the comment adjustment is to be retained, please take care of the hard
tabs which have slipped in.

Jan


