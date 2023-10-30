Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D098D7DBBD7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625157.974143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTKA-0007R7-Bz; Mon, 30 Oct 2023 14:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625157.974143; Mon, 30 Oct 2023 14:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTKA-0007OP-8b; Mon, 30 Oct 2023 14:33:02 +0000
Received: by outflank-mailman (input) for mailman id 625157;
 Mon, 30 Oct 2023 14:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxTK8-0007OJ-6P
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:33:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384c0c32-7731-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 15:32:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 14:32:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 14:32:55 +0000
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
X-Inumbo-ID: 384c0c32-7731-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a58/eEhrlMxragJZtAmVZ7g3Auf2CkG8KUsubo2w4sjpzREtVX7jVpd84Fcrd0hu73erY352Lg1Xp9b0qdRXFSzbZjZkPLPs2XX7mm31kihgOjbvFkTAefO6OCuh07ajImBov0zcbIymulyjdOdcZfSH1XI3My0SWINihdKEPYH0dh3LEnfIN95/d8TDj99HA8WtxZMrDsn1MOxe8zirnRNm5U9DL6ou6O2tgBTvmZzvc+9kikIh/xVA+yT/cKcs1j80/FTvvONSM3xixJInytVf1oG4GR0VDVnMIUmSAjqSLzLRJRDdty9NTjy4eWt1wHBPnua0X9mBEPXw4FzF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMvcdRPVIlX+D3a1VIhD0jPAKdHF3pYb3ClU7TEg/88=;
 b=Di2NyoAlMpODNhKnrYMOfcsjnsnwL4u950Vs1OezO98nI3bqKYramVpVZ0RLMd7JPHjiXeyUKWbnmdhezqzNw7lp+/NkU/P4dSD0+lmyPRsbODgPswpSzM7MDAIYhGheMYFs7qD8kSEwz0mu6BcmI+ECAJ0F74uVcIW3sD+IT77Ycf5WeB/mU88HaMvfzMqiNIoQVNBIGkF55uOi9voZyIkFtzgGsF9Qg74ou9AHrcSOIJWtymY/qtMGDlDRQmg/RvnKmqCOPrF6ec0cnx4k9GPqxVGdTyKfRDKu9cHbN+59XomX3VVQIG5mOUz0EccjvuA36x+nqgIuiIh6xeUoXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMvcdRPVIlX+D3a1VIhD0jPAKdHF3pYb3ClU7TEg/88=;
 b=gkn0GcX/PnqjDGlwAWCLgNWnvHDiqal2t6XB9893oSDXVfXn+XRvdMKOOw+kLsIJ2ukp/+CvTRnoP6rNpyi062nK4dIybchlPOa5Rh07d9mvzKF89xsDRa8n1+pIM38pxLElJ8fKYRjGfrZ/JiHwb7Z5pLr/6FR2Ti8ieRRLsFCBpAkPpFoerjeGsiF6F0SEEOybwlO4OyqkiziEP8ets3slu/FtI0CZD2H/yoYCoTK5n/zGOEfAFpeMIJyjlIsqx9FnbhZ8R9h1ryoXdySQYu6wYvsH4wmN2aii69GYfRk3kTsOnAIvloquN6QQx32BbWpzgrkOAt2ekJCSERg+eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6734e477-0aa5-c74c-4f64-02ca0415ae9e@suse.com>
Date: Mon, 30 Oct 2023 15:32:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024135150.49232-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231024135150.49232-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fad240-9f7f-4bcd-d86a-08dbd9551ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	niNvIqELogBuB3FRMvUFcJXlPJBlZRiCq4BbMkfodLhFiI3R1k8v1vTObzKv8Y/NeHn5PcIvX40atE1PhMGZ5Y31NHXbqARqEwMGIn89Snq+M6R3l0Q3Aqzmz26CrMFRRiqsOIZb/y5RYUhBnxI0mE0vLq9zlH2zOpLaKdUVXVsn/RALJBupmw7/8b487suFrgElknd+PR/PbfEr4ALD3aQdNmFgPYGkkdEE1l7xr5AJ3QjuQQBTw5jld8c4BCUcLRODxPC0MUw6ZUAJLbJFjo+c49Vrplp0npDxltBgz+6mPN+Q06SwQS0g3ku8xwMv/3NFsQi6FiFABYZAPgBB5BWOUDIYUelSQInKw5J+H/RDgtwiOpZinWzmoRFVxFPvqY6ijf2LD1k/bY7APUA2V8guOdGK8dpQFkbK9EQqaOjIEGMJYz+Zjh5bQw3C3VASaKgLTF/TqSZ2C1lHrK/LNvZ90FhlBZJ36kSGvU76Wcxxv2q/siGyx3d0uaTYkPJBvLx2Li1yjmW8zZvQlcxo7dw4694ub66zE1MUAjNF0TR3hJduz27WVWUJjIrFqtx2WRgYRhqKHaoWjuTISZmg5D1L02dhoepMszwRTNlk0AFpjki8AD8jeIZVzHWEPUv4p6rvW9Ow0oCCkK8Cul6D1geMqbl2vehFwEYAD6A2MR272EYxw+8K+DvN/9+TcmIu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(54906003)(66476007)(66556008)(66946007)(41300700001)(38100700002)(53546011)(31696002)(5660300002)(6486002)(86362001)(36756003)(478600001)(6506007)(26005)(83380400001)(6916009)(2616005)(316002)(6512007)(8936002)(31686004)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzJXeTZMSTY2Sk1QVk1xQzladE00ekZ1YlBsMmNZSnN2RWw1Q1VySnZMRHZu?=
 =?utf-8?B?NWVuaHpIcGwyZ2dHQ3V3Q0RsbXREbWRhYlhiaVU0UnJEWndtWGYrMUcwMVMz?=
 =?utf-8?B?dUxWOGRIL0x6K2xkZFNZc3VjVFYyVTljdVJ1c0hmT2sweDZIcWVabjlUWnV0?=
 =?utf-8?B?ZWZkbldOSjFVU0JwRHI1WVJSb3pHOVdGMks0UnlsMmovQURwc29RK01hVWtx?=
 =?utf-8?B?SjhuWFAvbThwRUd6U1hrUTEwWFVnY0FXZjJTY2h4WDdueUNxVDlHOWRiU3BV?=
 =?utf-8?B?SzB3S2NsdmRFWE45S2tYcWh4R1RHYWNYZnZFSVVKTmNFa1VoUjQrYXVxTy9h?=
 =?utf-8?B?RW9mTWErVEpVQXl1MUtqSHhXcDVEM2tvQlBWWi9CVi83M0REcDM1ajNxczkr?=
 =?utf-8?B?a2dsUWt3MlJsYW03NERlUG4xRGhvdkxaVzZaMitFcS9ZKytSRE5MaWFjUVlU?=
 =?utf-8?B?eTdGajNKSVNJNldqcys4MTB1VTcxNWR6TXFaczR1SHRhMC9pZyt2YVFDeWF6?=
 =?utf-8?B?ZTg0cGVKL01OcGtKMjh1UEdkbTA0U09pTFhQaEdGcFUyakhwWk45T2VxZE13?=
 =?utf-8?B?YU1UMUZTQWZ2V0dMNUlNRUE4MENlWmtaMzVFUTR3aUNlZEVaOVRua1IzTjNi?=
 =?utf-8?B?S2pVMG9nUVA3L0JHWUFYOG5qQTQxanRiZG5EaUNqc3Y3VmRyWGJybm16T0k5?=
 =?utf-8?B?N1NDbVhXRW1aNUFjRU5sMFhGQnRWVXBaa3hsS0JmREZiL2pJM0RLU2hRdUpD?=
 =?utf-8?B?Qy9yb2pPckE0ejgydkEvazdpWDN4Wmp3b0ZlSUZkZlU1cjFvczlYZ1VrMzRG?=
 =?utf-8?B?bDdSbXhhVlJEYnY1a0huVG5vNUlueWRMS2NpUnN3U3hTUnMrWXBzUFV4M0lR?=
 =?utf-8?B?bnU0UmpPdW9VVGZ1QlJnNmtFZzFncDVjTUFLOHFaeTJpM3lqdHRvSU1tT2I1?=
 =?utf-8?B?QjFyTXJ6YlE4azdhMm9aYktGellib3J2bGhJR0tpa051dCsxZUhtQ29TQlp3?=
 =?utf-8?B?TTVJTWNIcWFOZTY5NkpEVEl2MzFDZnpONC9hS3BtaEtFOGhwNWVhR0VkSlZq?=
 =?utf-8?B?SEsvMGlnL0Y3ODFqSHR0RmpnQ0hkc0pXelh0dmpHRGdNNExBS255d250NUh6?=
 =?utf-8?B?MS9jRjlDYmhqcXJMMnkyQzY4S1pidUk0c1NiRUhjdW1pb0RiTUJuT0pkdHVL?=
 =?utf-8?B?NjZ5ZFlJTjdRRzFJc3FaTjZOR1IzeUpxeHVNb056WDB1NWFKSU1oemFIL1FJ?=
 =?utf-8?B?MXdnRlpTanhKTEh0bWVxd0RYSGw0dGVKU3RsNlBVeFpCUXB2WkJJT0xBRGxX?=
 =?utf-8?B?MG01amQ2Z3JsYVNqNlhhWEJhMnZIUEZUVU9JTEs2ckJNeTlFZ3prd0RGeGhS?=
 =?utf-8?B?TVc1V1VCUytwRlpMQ2lMTDQ0T2V0byt2RlRUemR4aTg0UU85YkxoczNycmt3?=
 =?utf-8?B?bWR4SWRjdzNGQTJjVllIdDlqU1B2blR2Q1dLQnVxQjgzc3UxbGJudmd1UTRm?=
 =?utf-8?B?OVl5Q0psSHBkVzgvM3FsUHhacjZpRU1BaUUzdWdzUWRNM05MQjBHODNUZzFG?=
 =?utf-8?B?d2o4cVo3T1VPb2c0M2FlRWVtU3RJUVNIc0pTUjIrVEFIRGFxYXZDMjFiQWJL?=
 =?utf-8?B?cUg0YUxVc0h6aUduMWxYbTlweG9ONXV0V013VDdSSHNERG54dnJXYWJxanVX?=
 =?utf-8?B?UUpRRTZpcDFIRXIvLzJZL3g2QjFsNU9kR0tZRG9LMllOY3A4cDdBSmFsQlZk?=
 =?utf-8?B?NDFEWTVXQVlaTjZBVjVtZGhpRUs2cE1BeTdxc3Vic29vWUtWMEQxMmZvL25X?=
 =?utf-8?B?cThJVkVqYmVyL2d0OFY4OThvNlJVdmhaaGQ1dHh3OWh5blF0ajQvVG95NkRn?=
 =?utf-8?B?ZkZwcnc5Y0Jrd1dKcno0K3RreUVJY3hzY0FtZFJobHpTQ1A2ZDF3RlQxMDhC?=
 =?utf-8?B?Zlh6UHlFOWFzNmZDemRlU0ZYYmRxN0QzV25lZjZiYk4yWC9CdFcyakRoTGNS?=
 =?utf-8?B?Sk1LRzdnZ1crT3g2Z09PdzZOOEY1NVRmVWs4a2RybWs3cVU1aWhZVzU3ZCtp?=
 =?utf-8?B?bFFkODJIQld0TGpoMTZSUVJDZFp4TXlOeWo2cXNsU3o4MDRVaUtFTUw1OVpa?=
 =?utf-8?Q?2uEVBnvu1vq/+T+31DS+61PYo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fad240-9f7f-4bcd-d86a-08dbd9551ae5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 14:32:55.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpZoLeIdW1BKjt4MctHw/Voav8Ya8SNdviEAiXEo0Zw4UYKnFB7aX47DOxIku3Bw2dXAshHV5YjlxOEXRrt8Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

On 24.10.2023 15:51, Roger Pau Monne wrote:
> The current implementation of x2APIC requires to either use Cluster Logical or
> Physical mode for all interrupts.  However the selection of Physical vs Logical
> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> destination modes concurrently.
> 
> Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
> IPIs, and Physical mode for external interrupts, thus attempting to use the
> best method for each interrupt type.
> 
> Using Physical mode for external interrupts allows more vectors to be used, and
> interrupt balancing to be more accurate.
> 
> Using Logical Cluster mode for IPIs allows less accesses to the ICR register
> when sending those, as multiple CPUs can be targeted with a single ICR register
> write.
> 
> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> box gives the following average figures:
> 
> Physical mode: 26617931ns
> Mixed mode:    23865337ns
> 
> So ~10% improvement versus plain Physical mode.

Nice.

>  Note that Xen uses Cluster
> mode by default, and hence is already using the fastest way for IPI delivery at
> the cost of reducing the amount of vectors available system-wide.
> 
> Make the newly introduced mode the default one.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Do we want to keep a full Logical Cluster mode available?  I don't see a reason
> to target external interrupts in Logical Cluster mode, but maybe there's
> something I'm missing.
> 
> It's not clear to me whether the ACPI FADT flags are meant to apply only to
> external interrupt delivery mode, or also to IPI delivery.  If
> ACPI_FADT_APIC_PHYSICAL is only meant to apply to external interrupts and not
> IPIs then we could possibly get rid of physical mode IPI delivery.
> 
> Still need to put this under XenServer extensive testing, but wanted to get
> some feedback before in case approach greatly changes.

Looks quite okay, just a couple of minor remarks:

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2802,6 +2802,14 @@ the watchdog.
>  
>  Permit use of x2apic setup for SMP environments.
>  
> +### x2apic-mode (x86)
> +> `= physical | cluster | mixed`
> +
> +> Default: `physical` if **FADT** mandates physical mode, `mixed` otherwise.
> +
> +In the case that x2apic is in use, this option switches between modes to
> +address APICs in the system as interrupt destinations.
> +
>  ### x2apic_phys (x86)
>  > `= <boolean>`
>  
> @@ -2812,6 +2820,9 @@ In the case that x2apic is in use, this option switches between physical and
>  clustered mode.  The default, given no hint from the **FADT**, is cluster
>  mode.
>  
> +**WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
> +The later takes precedence if both are set.**

s/later/latter/ ?

This may further want a CHANGELOG.md entry.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -228,11 +228,18 @@ config XEN_ALIGN_2M
>  
>  endchoice
>  
> -config X2APIC_PHYSICAL
> -	bool "x2APIC Physical Destination mode"
> -	help
> -	  Use x2APIC Physical Destination mode by default when available.
> +choice
> +	prompt "x2APIC Destination mode"
> +	default X2APIC_MIXED
> +	---help---

No new ---help--- please (also below); it ought to be just help going forward.

> +	  Select APIC addressing when x2APIC is enabled.
>  
> +	  The default mode is mixed which should provide the best aspects
> +	  of both physical and cluster modes.
> +
> +config X2APIC_PHYSICAL
> +       tristate "Physical Destination mode"
> +	---help---

Something's odd with indentation here. But first of all - why tristate? We
don't have modules in Xen.

> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -180,6 +180,25 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>      .send_IPI_self = send_IPI_self_x2apic
>  };
>  
> +/*
> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> + * cluster for inter processor interrupt.  Such mode has the benefits of not
> + * sharing the vector space with all CPUs on the cluster, while still allows
> + * IPIs to be more efficiently delivered by not having to perform an ICR
> + * write for each target CPU.
> + */
> +static const struct genapic __initconstrel apic_x2apic_mixed = {
> +    APIC_INIT("x2apic_mixed", NULL),
> +    /* NB: int_{delivery,dest}_mode are only used by non-IPI callers. */
> +    .int_delivery_mode = dest_Fixed,
> +    .int_dest_mode = 0 /* physical delivery */,
> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,

You have a non-IPI-only comment further up, but that - if in fact 
applicable here - would need to extend to these two hook functions as
well.

Jan

