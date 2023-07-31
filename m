Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906E769340
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572883.896970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQHB-000275-53; Mon, 31 Jul 2023 10:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572883.896970; Mon, 31 Jul 2023 10:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQHB-00023r-2H; Mon, 31 Jul 2023 10:37:21 +0000
Received: by outflank-mailman (input) for mailman id 572883;
 Mon, 31 Jul 2023 10:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQH9-00023A-LH
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:37:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e497cd-2f8e-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 12:37:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 10:37:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:37:15 +0000
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
X-Inumbo-ID: 38e497cd-2f8e-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO1w7LW19R2Z7lPSZ6ntbvR69i1X8VfsvfZf/CNDq7Eo+/eNP3073ccvR2ffGCXGgxo7p73vQYtKfzRvOHUHJJTwGs6d8zrIwzrgSFdemqfj2crqYvvp9Gi/U1M+wgyE0whUICRVIZFdJdHQJbT9fEQP7zZCQIc3hsbKltHCAP4+KwaDTFPWwhSO2KBndKdK1fWJxBBlfPTL4MQiDP2T49pYhjE94LZkpE0GueAcRRRD+JixV0m3wtbmPZ1+P3pOXuUF2kZywoIR1Cdc3Jj802PA0Cbg4tkXKBBbbvPmInEa80m8l9tRul+2ou4i/QKcXNtWPe65ECFjO8aKwlDpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJpp6qr5ls6DFsVwk71i7NZrucn024HOf3H9y8hTnqs=;
 b=NvJwzo4ARtSvR55hLLiryMkvDvmH0W6ykUW/G5UbhLHgxa/pv0y9qHK/BN6HlsUK8i4OoaIpy/Mn7USMkK/zvVHuA9T4GZPKlU24oI2ya4AyGffs/JinJywXApnT/QW+jUQwtNV5p+9dF4wo3wyu2W94G+OuyEFUV5wZ7T3JX1LMSZ1/LjJvLubdaGwEBQa6t+oXX8AS2BQympS0+WtflOeGfqtMlU3K8ytU0PQOcH5cxkBsz1irJiCSNlka3zPTutZ0X1HSnNl4jzL1GBGCtaVCA3mysTMBg5IJzTvKaCVypgnyujiBH0oAZfL6glmy4VkCD83RvivazLgUA/jcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJpp6qr5ls6DFsVwk71i7NZrucn024HOf3H9y8hTnqs=;
 b=fmy0UvvIXdhXLZBYhz9WOZtnQ4zlyfZUM7XcQzYcSMKcvTCj87t0PVn7Ow8DeoBVCmmEE+h3UBlA8JYhO99eEvP4C3GN4K9zGIrwT6CvOTazYIPzVB7kr3dmn1XbYG6wkKEGRAEWdS1We6+BkPfPihbrkOmeMAjvicF+Ghi9BEbdlFYvk/GqM2dT5Y0Qu1SVqlOfOxjUrn08nOP46rDBECPXBSYDzNPmb05aWU1rYePy/bgXEdk8rHUEflWf6bhWzw8D33gkMYGKUiZ6WGmpVOYTitGiXX8ZYqEsYteGHxehUSdLeA8rQn70GZn62W34Yh2aHEdAPAuA6+7KYPJkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <894c5f35-c41c-e27a-a11a-aa777ba7329e@suse.com>
Date: Mon, 31 Jul 2023 12:37:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3] amd: disable C6 after 1000 days on Zen2
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230728144729.17446-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728144729.17446-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a402f9-291f-4bfc-f9a5-08db91b21ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nMrGaa8XOeF0PnaT4BS2Lz5jMIYVP3NQmsl9PgVMkmd9C9GU10EC3QWC7nAhBXkXRezuDe+gaJ5hactn5lMRlG9jZgIYfFLBED7SUtlxP/GEAoXLeB4cP022vlcHWtAFIUok/ikQ3ZwLioj4X+fhZUws0L8rJEP8HDLZNL7qbUpIz5eoMaavzRhrwTtp7jtUaqUYPN8cOn5ZaISAFG3zvq4D7kflOKGLUmOOaw3YXvztMnSmAdj4iaQIS2UdrbXqxrRQpyjqb+rn0KqnZ0iqTO0qbr/PndX7T5o0diUSyX4eARmaudGhFPBLe3e5g2706lLger+aFwpXrNR6Dg1IEHj3IlpOfNFSZKrLSrE/5iBFpc9PI4En2Qlxt3luRcb0yQyJ1XPFY6OY2sO4O14GJnsXv7BwCXkSH4H5NzdjKYbeAp4QqXhtX4haEI3Y+44o6jCfm2pBLI1iB4FGak0DwKggqOD2TMg2/5hGwcGcEURE45L3r00IHxumCn3peseLVSDJdRpHKxUtx7k5j8oRrI7BFOgklMjrPV53eN9j1qBeVVPZ2vxeaPADG3Kry8Rw16BRF1roxzvZI2pFIJrM74djnJHXpr3YXJ4OMvhtoBgSOHwip0i7rbYYAnfnKrFfeAl47BFaJvSJteETZUC3J1n5NX086MvhwLpSvvK3nYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(86362001)(66476007)(31696002)(41300700001)(8936002)(31686004)(8676002)(316002)(6916009)(5660300002)(4326008)(66946007)(66556008)(54906003)(478600001)(2906002)(38100700002)(36756003)(6512007)(6486002)(6506007)(26005)(83380400001)(186003)(53546011)(2616005)(221023011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QSs4TWtENFdNalorSTBzeDhsVlpOM0djT3YxY201RlZMZkoyUkthcm5US0x2?=
 =?utf-8?B?K0lCcHRFZUdzNnlXVzJuL1JmRmFWTmsvUkwvL05hTTVEbXhpRXZaai9jMFpp?=
 =?utf-8?B?OFFlMlNxUGtOMlJrN1R1U0Y3c1NQV05PNXhydHZhVFQ4ZEU5RmpBeldtMWhv?=
 =?utf-8?B?MXdEenA1K29ubTQ0azRsM1l3M3hwNVBWN3kvbFlTSmw2MGRkbjRPdU92T2pN?=
 =?utf-8?B?akFQWVRwUGtnS1pnNVpCTk1vcTNtcEgzeGJKVG9QWDRNRE1VaEJFSmM1VUVk?=
 =?utf-8?B?OWlWNTdid25JQVJ6M0d2bFdtSnJwSVRLNkdEMmxJc3RuME5xNUNFSFh5ZGJW?=
 =?utf-8?B?aXh6OVRpRXBnK25QeHN0TU5tdjZ0VEtpQ3ZONnJUdlh2alFvTENKalo2RDRD?=
 =?utf-8?B?VTdZOFExYmJRTDhsRzNEQlRlU1NCQXVmRWhsWXBNNkpUeFpnWCticXBpalF3?=
 =?utf-8?B?OU1sWE55TnJMQkJlYjd2bXdyQStnUExzY1N2MDZ6S0hOZWV6a2JBZ3pJYllj?=
 =?utf-8?B?ZEQzYWpCQS80SXBEM1F4UlorNk80VjZVQUhGaWREY2ZTYXpWaTZjNldlYzhz?=
 =?utf-8?B?ZzZoNjJsZ1B4L2tYajcxRmpkdkNMUk5USE5CdW9ZUGpGK25GQmxCLzdjVEI0?=
 =?utf-8?B?MHJ0c3BQR0VWdE9GY1MyMXQvalRLUmRDcTFYcUppQngwdDkwQU9WYVRodGtC?=
 =?utf-8?B?c3pPbkc0NExaVW12TUMrU3o3b25pd3BCSWcvUWJBa0JERjBNUzA4amJSUmV2?=
 =?utf-8?B?Q0Y5dzBGUjFuK0xxa0lUcWdPVGhlT0kwWDJZMXIrb251SEFqWnp0Z3RKcUsz?=
 =?utf-8?B?Wlduby9QUEpVZGViL2lUQlA4NmwvL1NSSnlEdERja0dpdUpyMmRadTlwdUlI?=
 =?utf-8?B?TjhKMUFlTmkzWTd3RXJNWXk5dEVZL2E0Qm9BRGlHQ3hramM4LzlIRjUySnlE?=
 =?utf-8?B?dko2YjRnR1hQd0hBckZIWDBseXhTRS9DaDVCWmdLZkdpVlJCRm1nT2FqVWgz?=
 =?utf-8?B?bXp5bXZ2N0NaR1VaYUVQQ1JhT21SbXM2Q3ZpMVJyaGE3N09VdHBNa3YvSUVp?=
 =?utf-8?B?eitJZ1MxQ3ZhUTlZWUkzZTdMWkRkT3hBQjJBK2xzMFIyR2ZsMTQ0VS8xQTZC?=
 =?utf-8?B?Mnh5ZGEvVTZxcXhjcXFzaklFUm9FU2ozV2x5Vlo5dXJ2RkhOYnJNR0R6N3JP?=
 =?utf-8?B?U292aGtuUFU2d0R0cVBOUGxyazhNd29YMVNVRlpxQkR3ZGFzR3BLbEVsb3pu?=
 =?utf-8?B?V3FnWVJUUW9BaTZ0S2JuSWpaTitDZWp3SWJabnlRZ1JvOW16bmZBUTNVVUJ6?=
 =?utf-8?B?VmkyY0VwZFZVZ29GK0piQXVJcDVXM3J6dnQ1UVoyVDA2ZmR3cldnZis0UlFO?=
 =?utf-8?B?ZElXckk1Ujl4UExBalFQb1BmbjRHU3pHSUVHU2VHTVNkYk9QSVhRU0M5RUxj?=
 =?utf-8?B?VG1EL2k1eXhETzFvbDE3UVBtMXdiempGSlhZOXlsNkNTdERTMHNrRlcwY2o4?=
 =?utf-8?B?YVpIM1IrZ3E3dkF0MGlZcCtaLzJXeTdUSXh2N2QyNkNkN0RoNG9xMkI5TGdm?=
 =?utf-8?B?b3FxSDFKNTRLcS9RRGdwNjJyTkNBSksyRWRXV1ZpeDdESlZlZ05BNFIveUlV?=
 =?utf-8?B?aFNoelFibTcyRko1SlpZb2dJRHJyaWN4UkxWMG1EL3R1NGRkd29iWis5b090?=
 =?utf-8?B?dVhvcm1yNXQxRGgrc3Y4aVphOXhHSkVrNTRRWW5Ma0FtcGs1NkVGMlZ3ZURD?=
 =?utf-8?B?cWMwUUErRVZCTEZxMGI3azc2b3Nxb29mVFBaR2hrYVliOHltcGtCYS9vNi9S?=
 =?utf-8?B?RXROWVFhcWdUYkIxWDFocEdqVFJIb05vRGJNSVFzQ2dOVE9DaE1Bc2J0M0do?=
 =?utf-8?B?YjkvS2RrWmhuUDJFRndIUWZkdDFwdVorT1RVSFVoVWM3WHZSSnZJc2hsZ3Rr?=
 =?utf-8?B?TkpZM1hSTDR5Mk0xemw2emVjZHVMOW9HM3Z2bkhMeEd0TGx2Q2cvMFNsVWQr?=
 =?utf-8?B?dkNXVVRQWDRwcFkwbisxeGVUM1JUK1Juc0crUDdTV3B3WWxtKy8wR2lRQTFZ?=
 =?utf-8?B?WkNlK3hqZ1l4VDRDazUraGY2MzFoZFdvcVg0V1lwRk1DdjBBWUE4KzR6Skta?=
 =?utf-8?Q?wshdB0HOS0XPj6KDgeF4TbnuE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a402f9-291f-4bfc-f9a5-08db91b21ba9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:37:15.8777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJVA3erkbDbwSZetjQRorWLTilxJ8Y1tx544H6KZbzfP/HLvdifagSYLtnKG/3MR52B3FoYIRXp6XkQk4q6V7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243

On 28.07.2023 16:47, Roger Pau Monne wrote:
> As specified on Errata 1474:
> 
> "A core will fail to exit CC6 after about 1044 days after the last
> system reset. The time of failure may vary depending on the spread
> spectrum and REFCLK frequency."
> 
> Detect when running on AMD Zen2 and setup a timer to prevent entering
> C6 after 1000 days of uptime.  Take into account the TSC value at boot
> in order to account for any time elapsed before Xen has been booted.
> Worst case we end up disabling C6 before strictly necessary, but that
> would still be safe, and it's better than not taking the TSC value
> into account and hanging.
> 
> Disable C6 by updating the MSR listed in the revision guide, this
> avoids applying workarounds in the CPU idle drivers, as the processor
> won't be allowed to enter C6 by the hardware itself.
> 
> Print a message once C6 is disabled in order to let the user know.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> @@ -1249,3 +1282,44 @@ const struct cpu_dev amd_cpu_dev = {
>  	.c_early_init	= early_init_amd,
>  	.c_init		= init_amd,
>  };
> +
> +static int __init cf_check zen2_c6_errata_check(void)
> +{
> +	/*
> +	 * Errata #1474: A Core May Hang After About 1044 Days
> +	 * Set up a timer to disable C6 after 1000 days uptime.
> +	 */
> +	s_time_t delta;
> +
> +	/*
> +	 * Zen1 vs Zen2 isn't a simple model number comparison, so use STIBP as
> +	 * a heuristic to separate the two uarches in Fam17h.
> +	 */
> +	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 ||
> +	    !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +		return 0;
> +
> +	/*
> +	 * Deduct current TSC value, this would be relevant if kexec'ed for
> +	 * example.  Might not be accurate, but worst case we end up disabling
> +	 * C6 before strictly required, which would still be safe.

I'm not really convinced of this being the worst case. TSC can be
written, and hence it could also have been altered in a way making
things look as if system wasn't running for a long time when really
it has been. But I'm okay to leave that special case aside right
now.

> +	 * NB: all affected models (Zen2) have invariant TSC and TSC adjust
> +	 * MSR, so early_time_init() will have already cleared any TSC offset.
> +	 */
> +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
> +	if (delta > 0) {
> +		static struct timer errata_c6;
> +
> +		init_timer(&errata_c6, zen2_disable_c6, NULL, 0);
> +		set_timer(&errata_c6, NOW() + delta);
> +	} else
> +		zen2_disable_c6(NULL);

Strictly speaking you don't need the if/else here, since timers set
in the past will simply have their handlers executed right away (and
if that wasn't the case, there would be a race here).

Jan

