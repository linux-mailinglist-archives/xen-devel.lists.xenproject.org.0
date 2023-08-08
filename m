Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89C773AFE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580067.908348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOfO-0001T2-Ui; Tue, 08 Aug 2023 15:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580067.908348; Tue, 08 Aug 2023 15:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOfO-0001Pv-Rk; Tue, 08 Aug 2023 15:30:38 +0000
Received: by outflank-mailman (input) for mailman id 580067;
 Tue, 08 Aug 2023 15:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTOfM-0001Pp-VY
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:30:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 850c52f2-3600-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:30:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9741.eurprd04.prod.outlook.com (2603:10a6:102:37e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:30:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 15:30:33 +0000
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
X-Inumbo-ID: 850c52f2-3600-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcPcTPG+xXurrrJTlJYv850/j9QoH3YflLGl8DB2pcbQ8gMQ615IxvI8+C3PbTAdyeFf5iTXNFP3c2BUVUHMdPvih+AATNPufBSc6iuYyJeJ9ECE5n44E38Rb/v/sOw+NMMYeFFIfrn/mMhyizHFC2DRHAPUGZeRBa8lIVYYS451sNkWP7FU6/f4kZ7x/d5SGuulMQVRWtThJ3i05vAh0Q3mtcsaB6BKaCowh+Ga6cLCQYyyLZHy8jF06lF+6bW0nbVgWLyolwk4mQK9NGcS4ikgWg3+Ac5R6Vl5rbpJSIGYNq1rvmemQymmmj6yEvT7mg9zKUOl4bGYwDEn/bmUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt2S1S0jn+nKaJ0uq97aWIlcDX7aRs+BnFNHWu+f7zU=;
 b=Tf9iYGH/3v2W6gfKboLZVTun9IaA9AmXUwjbHJJHI073E8rnuMf8SZlx2V+juaWo0IL6rNqYFwAfJBWvjH/XACBNb/UFBwx8w/n61jll9n8/qwX4BZgTAwXF+xOwvPQYwSRb1gCu3bb94nJyIOhoajy28CQgcs5VnSy46ikufLehrI4+PCRlECdYa/21oROsBmmahZgqZ7pHtJKcVoP+qYo/0wkmtTjTWG1+O9VlAPJQzz6WGh06J3f6hyy4CKPk3944stDRCra8U1scpkeqAmJpgeL2t7a1C5jKtoqwE77KUUs+yMhc22MuxIvQnwV8/nlo9yvU5RVs4ukwB62nOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt2S1S0jn+nKaJ0uq97aWIlcDX7aRs+BnFNHWu+f7zU=;
 b=gE32Oiiq+eZqSLogueGcFaF0jekvc5YjrIgeR3fXeYNvD7vo0WPegRrApCZQ8WwjyvP6dy+UZ2LrqOL2c1AEn2s7n4kqyan4Z7HqoiZyX3yFnQOrrN0sew3zEdvWHDPqjT7IOgE4xqV/3K4w+nYf5d+SuI8XKrdi9xmH186e3hEderutAd14ckYGuXvAv8drHC2+iczoyzFYdEL1wPh01haOUweImqMY9hyNModABvdWcq6UcOtO7O9pnbJ5V/asidpdpItbhn0qe4sroTmVoLeBeHzhmPuALAaltb72AvRHgorXOqTFaSy3a0aDenPNOa7wgxrQVOsAWtnwSoxEbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93750d64-07b3-2a92-4851-bcd5bda9a0a5@suse.com>
Date: Tue, 8 Aug 2023 17:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 5/6] capabilities: add dom0 cpu faulting disable
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 979ac47b-d4df-4fac-33f9-08db982467dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AyFeoiCtu2bnJuOmjzW19TQNYO/8r31DRwEFBDklVh0niMP9xVJmoDA8nh5Afh7sCFBdelwHOYGEjmuXguOjWhe1lPoPEoWa221UgP4DhlZriaugTqHApnaJGICgpyyEUWJdHz3DKmeJ8pFvSC0OplNCiDDjLOq8h731xb2ISSDk7ruImZRXwBp9CgkTQ+uwsgcmH0mq3jpOqcy0SkyZds8lg+gvUYFo7uhfgufax1yMWMievMI5akpNBiPUpYmeANP3iA1mm8lFzag7BV4pUzbe3aCl7xM/yC6FXZsmgsvVX+qVUffwq/QpFLZ5bQvLYTmGGqPrSn6PMQ+MuiWY0qEkQ6JfxV0krW73bWpO1ai3/AYJpVawB0cb9BSyqgksfZfNEtF4DIUAZxoiScGRi58FVA8jFUkIlf65JdEM34VTZvYcpAAbuOaEmwJuI7lcdJ/X0stEDCa5quOjXBclj0xl1285GIgr2474G/o/shPG6G8dAcGRRfifCPCAfkFcFcQfW3yt28CSsQ1vAjeBgNDzK2bVh4S/XZR02h/kJV5eMuOpkoSCpG8payQVYZ7ww4x4NMlcr3m3cr5U5/de4zUTwySbVcgZfTHHnZ+JyztiZQbbFCdFofJFopezgAg44C45llp6YY4+9lSItDQo4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(186006)(1800799003)(2616005)(38100700002)(6512007)(478600001)(86362001)(31696002)(6486002)(26005)(53546011)(6506007)(36756003)(41300700001)(5660300002)(8936002)(316002)(8676002)(54906003)(4326008)(6916009)(2906002)(66556008)(66476007)(66946007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QklaTk04MnV2ajZXa1RLZFRjdW9YQ3dRUWxXakNpUVdTRU5yMWZlKzlNYjJX?=
 =?utf-8?B?TmdPL2NNUzVZOG90ekVTdmNzY1FrUUpvMzF4a0pwdTRXeTNhTzQ0Nm01VFF0?=
 =?utf-8?B?a01oQkRVbytjYVFjLzBVZXBJRzVZNWdSVERVWVo0ajhaSVI5cVp2TEhuSDM2?=
 =?utf-8?B?ZlZwcFpPTmtSMFRhRUFZaU1aeHhCMzgwdXVwUWJzOEliMTVGQWlzb3hHeUVC?=
 =?utf-8?B?MGFxMlVyVnlnSjJqUEp2aUlPQVFkL1djejNZRnM3ZHYyRXBvN3hXeTFIZUJh?=
 =?utf-8?B?elA2VzIzU3JZcVVsVFJXYnpiUFZvS0dpZ2JGV3RTbXdxSG5aLzZobmJVVVNu?=
 =?utf-8?B?cXFJeStwTmtDeEcyb0oxbmFmVzZIMFE4Q0RVY0JjUjR1cjZHbEFWczA2OVcy?=
 =?utf-8?B?UStIcU1wZ0ZSRE93alltK1BZRHZKK3NPSVdWaXY4QWp2YVhIV1h6ZHgybExw?=
 =?utf-8?B?NUwyN2RCTUhEM0N6WCtGc2NnbjRGUDJkQmdYOXdlWEUrWTJuTlVHTnNsNDRy?=
 =?utf-8?B?RlNsbFRPSXp3a3QvNFBIUnRtUXFzK3JrL1daN2lTWjFnZFNBUGY2UDBLQkUr?=
 =?utf-8?B?ZXo4OWRDampoUXgwOTFtMTYySkxSL0JYZmd2RFNpOGhSa0MrYVJLY1MzdTFn?=
 =?utf-8?B?aXVucGNUbTA3QzR0c1RiUGY1MXlVQndQbEU1SzVnSkdKNGVsWlUvV0xZL0Fn?=
 =?utf-8?B?Y0N2MWhmRTMvZGJaYnkzam1WK0NnOXRLZ2dsTUpQM294S3FDbUxDN0s1bDlK?=
 =?utf-8?B?UGFsd0FnMTUzT2dDdFJYbnhxYlBteUdGK2thaUd4Z2gzYmtJU1ZNUWpGK2hM?=
 =?utf-8?B?WGNFejk3WFY5cGtSTWthQ3NrSmhRd2VWTm1JYmwrVktiY1NldXREUlB0eGlu?=
 =?utf-8?B?N1dwNkJBazNCN3gyL0QvQTZ4N3k1VEIwQmtzSnBHTms1VUROc0RPYTgyekU4?=
 =?utf-8?B?UXpPcXpEMmp3cFFkczhvdFpXY0YxakhRdGJyVTc0c0dTbGdiUXIvUDIxdTY0?=
 =?utf-8?B?Q2FtU3lwck8xdk9KM2tUOXpaL2o1L3lGTGY4cVh6THd6QzdjSmRtS3JBc0VJ?=
 =?utf-8?B?d1VOdHozVnhyRFBOcWFCNHlLY1ZvR2VwT3VOQno0ZnQrVlA5d0VlMnN3elNS?=
 =?utf-8?B?aHRDaEF3bWZRaWQ5YUhBTkVta0FSSVR5b3dZclNkY3hvS2twcU1weFp4K0JF?=
 =?utf-8?B?LzV6eEY0dFg5U1d3RjdGa0RDRHYzdkpIY01xQWJxMFV0a0tROE9SVTFFWi9M?=
 =?utf-8?B?TEpxOVlGZU5TZFBRT2paQnloY25NUC9XUTBMZHFoOExiZVczYTVGY2ZjS3Yv?=
 =?utf-8?B?ekF4MFFKVDl0Tjhyc2FKZ2VKeEJvRWh3cENxbWNDeU5YS0xlSGJxVklONGg5?=
 =?utf-8?B?MGRZQkkrNk9sZEk1c3c3NTVvYWtaWjBrUWJHUk00Q2t4UTFNYUNJOTNOYUxZ?=
 =?utf-8?B?TUZtbzc1bEdkZnR5NDlZRnErWGl0TTY0SXdQQ1lFbnkzdG00UnpNdEZ5U2Rt?=
 =?utf-8?B?d1E1Zi9uOGh4OW5NMTQrWjRWSjcvdkxMYUlZbDVmSXpLcW1QY0FUYW5VMmZN?=
 =?utf-8?B?MjZBNzV5Sy9Sd3luZEl3eFJmSTg0R2RaTDgwSWphTkdzNWdBeWhSRVZWNVhQ?=
 =?utf-8?B?ODRCRWVMWllsTXJvanN4VFY3Ym1yQVZERkFlTDEwRTJWUFp1UmFWMnlPZDhI?=
 =?utf-8?B?VWR0Ukc2em5nR0JwcGpXTUZTU1JJZk5ZWVVJb0gvaERXQTZWTDY0Y0MxZW9X?=
 =?utf-8?B?Z2pMek1XenpKWVNnZ3FhRUxQM01PVHVZUWhKbjF3R3hGY2RTQ3Y3NUtzNVpi?=
 =?utf-8?B?Tjk1eUp1dTFQeG1ubGxmMHBlZjB1NS81bzZxTGlUN25QOU1KZzQ2b29NS3Nl?=
 =?utf-8?B?UysvalBEeFZTeURHalhSMG5SQ3B3Rk0xaHYvRXZ1TVpOWHcvM1FNMmVoRld6?=
 =?utf-8?B?dC8rYWNhdFhkSnc2T0Y2blRiMjRGQTVZSGozU2N5NHZZdWdmOWNGeFpiTDg5?=
 =?utf-8?B?RWdJMnlUY1FJbmtmU3JmTStHdWduRVNjZFJQVHA0cTIxS0R0NmdzTWVhcEhZ?=
 =?utf-8?B?bCtpa21UQlk3N0JHOVUvYmtWVEhBcTUwM1hveGorUGc4aFRCa1lxYnZOUVVq?=
 =?utf-8?Q?YTU/sbExtMfz41lw0BCy7xw2L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979ac47b-d4df-4fac-33f9-08db982467dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:30:33.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO/JT6lmkSy23azeYtj2VYfw6nJYoJLUsabBOtq1oqwBlJQRmjSbtH/uD32upj4KikH3nELXdRdwh3ucbq0lbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9741

On 01.08.2023 22:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -164,48 +164,46 @@ static void set_cpuid_faulting(bool enable)
>  
>  void ctxt_switch_levelling(const struct vcpu *next)
>  {
> -	const struct domain *nextd = next ? next->domain : NULL;
> -	bool enable_cpuid_faulting;
> -
> -	if (cpu_has_cpuid_faulting ||
> -	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
> -		/*
> -		 * No need to alter the faulting setting if we are switching
> -		 * to idle; it won't affect any code running in idle context.
> -		 */
> -		if (nextd && is_idle_domain(nextd))
> -			return;
> -		/*
> -		 * We *should* be enabling faulting for PV control domains.
> -		 *
> -		 * The domain builder has now been updated to not depend on
> -		 * seeing host CPUID values.  This makes it compatible with
> -		 * PVH toolstack domains, and lets us enable faulting by
> -		 * default for all PV domains.
> -		 *
> -		 * However, as PV control domains have never had faulting
> -		 * enforced on them before, there might plausibly be other
> -		 * dependenices on host CPUID data.  Therefore, we have left
> -		 * an interim escape hatch in the form of
> -		 * `dom0=no-cpuid-faulting` to restore the older behaviour.
> -		 */
> -		enable_cpuid_faulting = nextd && (opt_dom0_cpuid_faulting ||
> -		                                  !is_control_domain(nextd) ||
> -		                                  !is_pv_domain(nextd)) &&
> -		                        (is_pv_domain(nextd) ||
> -		                         next->arch.msrs->
> -		                         misc_features_enables.cpuid_faulting);
> -
> -		if (cpu_has_cpuid_faulting)
> -			set_cpuid_faulting(enable_cpuid_faulting);
> -		else
> -			amd_set_cpuid_user_dis(enable_cpuid_faulting);
> -
> -		return;
> -	}
> -
> -	if (ctxt_switch_masking)
> -		alternative_vcall(ctxt_switch_masking, next);
> +    const struct domain *nextd = next ? next->domain : NULL;
> +    bool enable_cpuid_faulting;
> +
> +    if ( cpu_has_cpuid_faulting ||
> +         boot_cpu_has(X86_FEATURE_CPUID_USER_DIS) ) {
> +        /*
> +        * No need to alter the faulting setting if we are switching
> +        * to idle; it won't affect any code running in idle context.
> +        */
> +        if (nextd && is_idle_domain(nextd))
> +            return;
> +        /*
> +        * We *should* be enabling faulting for PV control domains.
> +        *
> +        * The domain builder has now been updated to not depend on
> +        * seeing host CPUID values.  This makes it compatible with
> +        * PVH toolstack domains, and lets us enable faulting by
> +        * default for all PV domains.
> +        *
> +        * However, as PV control domains have never had faulting
> +        * enforced on them before, there might plausibly be other
> +        * dependenices on host CPUID data.  Therefore, we have left
> +        * an interim escape hatch in the form of
> +        * `dom0=no-cpuid-faulting` to restore the older behaviour.
> +        */
> +        enable_cpuid_faulting = nextd &&
> +            domain_has_cap(nextd, CAP_DISABLE_CPU_FAULT) &&
> +            (is_pv_domain(nextd) ||
> +            next->arch.msrs->misc_features_enables.cpuid_faulting);
> +
> +        if (cpu_has_cpuid_faulting)
> +            set_cpuid_faulting(enable_cpuid_faulting);
> +        else
> +            amd_set_cpuid_user_dis(enable_cpuid_faulting);
> +
> +        return;
> +    }
> +
> +    if (ctxt_switch_masking)
> +        alternative_vcall(ctxt_switch_masking, next);
>  }

I don't think I can spot what exactly changes here. Please avoid re-
indenting the entire function.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -907,6 +907,10 @@ static struct domain *__init create_dom0(const module_t *image,
>  
>      d->role |= ROLE_UNBOUNDED_DOMAIN;
>  
> +    if ( !opt_dom0_cpuid_faulting &&
> +         !domain_set_cap(d, CAP_DISABLE_CPU_FAULT) )
> +        printk(XENLOG_WARNING "failed to set CPU faulting on Dom %pd\n", d);

No "Dom" please when you use %pd. Also I don't think you mean "set". Plus
we commonly use "%pd: xyz failed\n".

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -472,7 +472,8 @@ struct domain
>  #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>  #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>      uint8_t          role;
> -#define CAP_CONSOLE_IO  (1U<<0)
> +#define CAP_CONSOLE_IO         (1U<<0)
> +#define CAP_DISABLE_CPU_FAULT  (1U<<1)
>      uint8_t          capabilities;
>      /* Is this guest being debugged by dom0? */
>      bool             debugger_attached;
> @@ -1160,6 +1161,11 @@ static always_inline bool domain_set_cap(
>      case CAP_CONSOLE_IO:
>          d->capabilities |= cap;
>          break;
> +    case CAP_DISABLE_CPU_FAULT:
> +        /* Disabling cpu faulting is only allowed for a PV control domain. */
> +        if ( is_pv_domain(d) && is_control_domain(d) )
> +            d->capabilities |= cap;
> +        break;

How do you express the x86-ness of this? Plus shouldn't this fail when
either of the two conditions isn't met?

Jan

