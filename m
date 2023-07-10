Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475F74D72B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 15:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561210.877608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIqiA-0000Yx-M0; Mon, 10 Jul 2023 13:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561210.877608; Mon, 10 Jul 2023 13:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIqiA-0000XE-J1; Mon, 10 Jul 2023 13:13:54 +0000
Received: by outflank-mailman (input) for mailman id 561210;
 Mon, 10 Jul 2023 13:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIqi8-0000X8-NA
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 13:13:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bc15345-1f23-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 15:13:49 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Mon, 10 Jul
 2023 13:13:47 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 13:13:47 +0000
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
X-Inumbo-ID: 9bc15345-1f23-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n94vPFM8ZcQKXdops7kfEeep60W9yqzcn1gsWw2NSdDFqH+R2E9BSBOA8xSdSrpzRDgvHmSEiYTrt0vdKiUjHTDbqlL0mFhQ6l91TVD/1bml7fXrwe8eABTJF8YWJzLfHpQAtlJH/7BtHNIloIzp7BUkAEfUUL74enjLpVDUaBevwB4BF2/QPkyS7PNJ0kqurn8KODUEnqhI2//c/+oVbIEy1iwM6KVjTY6CH7t0NzLP8FgfKuZOJOMF5H8epNKytlrfse2O0Ein2301VFSKTXShNDj4UQE4LCloPeNZBU/TEAXprYymrWatJmg8VEmK1Lpx8W5/o5Jb4EANvj8EOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxdJdiCEPgMDtV3+5TKaW6K4PuBqE49IsjTzpPtdLpY=;
 b=jTrQUaek+gAkOCWW/TcX/O43rbwoOdjpGHE3RFKIGogUVaJihUdbCN3CgVRznL5so0GP7P4QaGTaqkcVGscf/PxXzmWuL9woEvTQMZ5E4g6NsM6/dlgraqQOhY43spTcCEh5MnmUh/0vDNourMro7hjXygwjC7GHazDMWSguXS5PVE35qZm1TShIlIwEOR0LChwqYWRve7n7lWwlARcN5OX7ZUyj/Fp5ffMmydCNOnn34Dw+pE5Fr6Fz+U3DLamZULKRPVxhe7/Jc3ooe7EZTY5o86d7dakE+qITmqJRvG8PxysugqqWe46G1ZVOWmZub9i4Jxs9vY/LVkk+y33OsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxdJdiCEPgMDtV3+5TKaW6K4PuBqE49IsjTzpPtdLpY=;
 b=LT4dvVO0bvUgzWhdMDvPxnEZD9+tWx/uDuQR2tFYRRylmiLOiweOWbZE2g9ivE6JppvVc6Vqk0xvAVs0E5PZ6aAaueXWZbLytQSDj0dW2iBb032BpKezFcArClqQsXiUd74vqYkehpOcV6w5oQNXJSsdfBh8uShHqng3qY7N8VR224o1/mad1GjuLujRZQIlWrYnnsrwHxfdJqe9SAex9K0su3agM/QEXtBmoHAa6sqr6BTxjb2yDOBLVdG0JromN6D9a5HNj7SkgxPt4I6oXAkNMt6L1Z0QSgTAVwUuA+rD96r0rf5HYrMg+gg77BPlmmLrPAjkkW5H7PjT3okhnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
Date: Mon, 10 Jul 2023 15:13:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d96753-3483-4952-78d7-08db81477e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vz+Il+L3pmB4AHlNrViZ/7y04qUPRR5u0IjWi1kEKoqJnzmse3VC+k33TEzSQOZ5JcausQzL7tzZIYf5N9EXoLVSfoAlKznjPDfMra731/zheqTiAgLgk5M66KJqNawe4I0Qh9OSOAgZKosA4ZOV/Zi+z2jKtPMfME311DHmou6rWPvc8UFjk4Bjr2X+/QNX8SqPFngZsIVpr8gLQAo73o9F87hfOHty/cppKYtIgMxFn0f3zS4alV04T0B2VDyivwgSNV5Zq9O6PzKNgBUCCY6rfvqXPrAF/QltJXjzJwqLsznahdqLGPjxsHPfexPOnooSm2ze3HQucmU1xYtk2RsbDjdNetsK/36YncVd+rimuAekza4nXJ4vroizVE+gIutqMNLNyIdrAXP48G5Mj4ek9tiSfvGuTzoNLqfr+iE9sQC27C//wigc9jbHU4PESKvwG+HFpjzmUBKU3B5Vqu81ct3mcY88qIOCCzyCVRRzriv7f65LL2CH1pywuyEmclmB+gaLUE2A/zVsFbdzEjM8LHAFQ9A748RPp/HORiPqy9Scwsc90fdgL0xcuZTeP3yS4JB79ROkwAZa66Dw1R4bbazehif+wRHwWxBZr0ifesgtf+R/UPXctiz6VF06B4oabQyobgSEHwNOO091mg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39850400004)(376002)(346002)(451199021)(6916009)(38100700002)(66556008)(66476007)(66946007)(4326008)(2616005)(6486002)(31696002)(186003)(86362001)(53546011)(36756003)(6512007)(6506007)(478600001)(26005)(54906003)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmF0SGNUOEZScFg2c1puemgxN0lnRnV3UXJLQWdNbU9KTyt3a2hUVnBsbDlZ?=
 =?utf-8?B?UFJXYy9pVjA3dkE1QjhrR0tqZXljNWgxQk5Ha2VxYjFJbHhyNEUwbXA5YnZq?=
 =?utf-8?B?Vi8yckM2dXVhQTRVZ3NUc0hISk05UmV4dEFRUFpVZm9hM2wveTZ1SDZDVkNo?=
 =?utf-8?B?TjhMVVR1Rm80cEgrSXdNUVN6M0orOWVha1NxNVNwckpabmpPTy9mYTNQZTFm?=
 =?utf-8?B?ZFkxdXh3REphK2p6Tm1la2planF1NVJmRlRuUUZIOUhYSngyMXdIbkx3NGpW?=
 =?utf-8?B?aVVDaWVPQ0RYK3RieXlMdVNJRDg3M2w3ZWppWlVkc2xEQmxEaUpqcXZIcWRv?=
 =?utf-8?B?SENRcUdyNGt5T0ZsYk1XbU1Zbm1xUnNWc2dyTUpRT2l3Z2lRVUQ5OHBsMXY4?=
 =?utf-8?B?eVBEWHdmVERNb3dqYzVzZ20zOEExK1JMa3Jkdk9tT2xtS2tXdXprR1pnZ2lk?=
 =?utf-8?B?T3o3cG44R2U0Rm54ZWg4c3NUZGd1dlNJUUpuTkNKRDdoeEltRXBKeVVsZjI3?=
 =?utf-8?B?TFBENVZ0b3NzeVBHeE9DeTgzVVlYSWFVNmhITFpZQTNRazlYZ2RKMllSb3JN?=
 =?utf-8?B?RGQ4bGVBYWk3T3Z1eHNlOGtCRW1kd2M1TWFpU0pjSlpyR0hRNWZDQ2JoTjQv?=
 =?utf-8?B?bE5kNmtaRU8vOHNtRVlpdUg3UkFJRTRTVzNpOTNtTFRXK254SWNGZnBPMG1t?=
 =?utf-8?B?UkM4QldtL2FGcDU1V0J1K1lDK2VYRnFVWU9WWlJBSkFBNjU2MVNqSno4cGlJ?=
 =?utf-8?B?SXBFSGQ0N2xITDdBcVdmMEVwakFtTXJGNmNiMjFjSS9TOHd5UTFCcWFyRW43?=
 =?utf-8?B?Tkh3cU8venJBSHVhZDVROHAvZUo4Vkttd0pIdHkwbkxBc29pTEhLVG1weWpV?=
 =?utf-8?B?N2NKayt5NGJSeHM4Q0xlSjNjZDNaOGd4WVY0L2wxVFJKVWE5d2RDcmFldFpD?=
 =?utf-8?B?Ty8xOUVmR3dyLzBhUFRRb3c4WHkyQ25CejI4dXc5eGRvQkJyb0lWN05QZ1lY?=
 =?utf-8?B?VlQ4NDI4VStKcENReURmTkpqL3RpWFBpL01KekFaSlVBazlZWFdoSi9JdjdH?=
 =?utf-8?B?ZFMyd0FHOVRodFFKQUJvZmNXL2FNa2JOK1I2TzJTWXhyTTVZS0RaRjlKWHgx?=
 =?utf-8?B?NGliVTg0RDJiSlVNRUFEdy9ndnlmK3VCV01NWHQ4NHdGMFRndzV6ZkFqcUZB?=
 =?utf-8?B?S3YvM3RkSFY2anM0UGN4SXdIekFQWWZNN3I3c1Q3NkRFYUFHNFB0OGozc2lO?=
 =?utf-8?B?TXZ6NzZhRmlVZXg3ZW44cjhLOWh6SGQzRXdKR0RUK1Q0ckxNVkJwb2lGVmxI?=
 =?utf-8?B?aytqMGh1cTBMN2QraUp3VzlQelZmWjdwakdKTkV6Nm1vaW41UklDanB5QzBl?=
 =?utf-8?B?VDRPZkZpOE1HOUJuOVlGMnpDZzh4SkRWY0E0OE1ZdjlnRGVxWnA0Z0NXQ0hJ?=
 =?utf-8?B?SzZJT2FBTSs4cXZiSk9EdndiaG9aaEcvR1VSMWU3U1FsODZvUWowc2JKZkpJ?=
 =?utf-8?B?VTFoZ0lsUVUyUU84Y3ZMT3VFZkRHQ29YZ2d1Q1AzMjhLdHhCb05FcDRrb2VY?=
 =?utf-8?B?YWo2RTVnODMwR2VPcWYveXFnMGJYQjRsN205Uk85ODM1Zm8xQTZtSU16U3dR?=
 =?utf-8?B?U2FzeVMybG9wbGpoc1ZaQWUrYWk3UGNyOEpRaTNPVS9DcTVGcXY2R1ZNc3Uy?=
 =?utf-8?B?WTZOOXNXUmQxazMwVDhKWkR1ZFkxUW11bmxqdVloTnNONmlSY24xK2lGdUt5?=
 =?utf-8?B?YisrN3M2cXZWMk5GT2RYVXBkWHBCSi9oZHlUN2NDdWk5NDM4aTh6MUN6MFQz?=
 =?utf-8?B?YXFkU1RVakVQY0VXdm83UThJZFh1OWp4OUJ4eE9oWkFRUVJMM0J2TE9qMjg0?=
 =?utf-8?B?QUhFeHhuQ2ZlOWs0T2FaK0FCeTBkL1RIWUtoaFNxVnh0bysyKzZYUGVMR0Va?=
 =?utf-8?B?N01jSUlOcERpaXFBSWx2QmFHWjJLbis2bXZRcUZpU2h3SUxxbkpVa0lzeUtz?=
 =?utf-8?B?NXZ0bzArWTFwcDF1aDdtbW85Y0VyT1RRUmhnVTg3eE56OWRGY3ppVEZIV3Ix?=
 =?utf-8?B?MHMxS0NUOWVDSVhBdDlKUkZKajRaM0FGNy9sWTNrcmNYRkREQkdKQUZUc3VJ?=
 =?utf-8?Q?k/0VzdwltkGRbxFCwLCytiyJI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d96753-3483-4952-78d7-08db81477e99
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:13:47.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWFa8wW5cbYVbRR9au78JzMDVkz7YJwf7ScKoXfuzRazlqPX3Z8QBCqKEPVN2Enai+Ix6qdnkW+wJBl4w6igxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On 06.07.2023 20:54, Jason Andryuk wrote:
> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>  * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
>    respectively.
>  * `verbose` option can be included as a string or also as `verbose=<integer>`
> +  for `xen`.  It is a boolean for `hwp`.
> +* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
> +  hardware.  HWP is a Skylake+ feature which provides better CPU power
> +  management.  The default is disabled.  If `hwp` is selected, but hardware
> +  support is not available, Xen will fallback to cpufreq=xen.
> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
> +  processor to autonomously force physical package components into idle state.
> +  The default is enabled, but the option only applies when `hwp` is enabled.
> +
> +There is also support for `;`-separated fallback options:
> +`cpufreq=hwp,verbose;xen`.  This first tries `hwp` and falls back to `xen`
> +if unavailable.

In the given example, does "verbose" also apply to the fallback case? If so,
perhaps better "cpufreq=hwp;xen,verbose", to eliminate that ambiguity?

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -642,7 +642,24 @@ static int __init cf_check cpufreq_driver_init(void)
>          switch ( boot_cpu_data.x86_vendor )
>          {
>          case X86_VENDOR_INTEL:
> -            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +            unsigned int i;

At the moment we still don't mix declarations and statements, i.e. all
declarations have to be at the top of a block/scope. What iirc we do use
in a couple of places (and what hence you may want to do here as well) is
...

> +            ret = -ENOENT;
> +
> +            for ( i = 0; i < cpufreq_xen_cnt; i++ )

... declare the induction variable inside the loop header.

> +            {
> +                switch ( cpufreq_xen_opts[i] )
> +                {
> +                case CPUFREQ_xen:
> +                    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +                    break;
> +                case CPUFREQ_hwp:
> +                    ret = hwp_register_driver();
> +                    break;
> +                }
> +
> +                if ( ret == 0 )
> +                    break;
> +            }
>              break;

In this model any kind of failure results in the fallback to be tried
(and the fallback's error to be returned to the caller rather than
the primary one). This may or may not be what we actually want;
personally I would have expected

                if ( ret != -ENODEV )
                    break;

or some such instead.

> +static bool hwp_handle_option(const char *s, const char *end)
> +{
> +    int ret;
> +
> +    ret = parse_boolean("verbose", s, end);
> +    if ( ret >= 0 ) {

Nit: Style (brace placement).

> +        cpufreq_verbose = ret;
> +        return true;
> +    }
> +
> +    ret = parse_boolean("hdc", s, end);
> +    if ( ret >= 0 ) {

Same here.

> +        opt_cpufreq_hdc = ret;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int __init hwp_cmdline_parse(const char *s, const char *e)
> +{
> +    do
> +    {
> +        const char *end = strpbrk(s, ",;");
> +
> +        if ( s && !hwp_handle_option(s, end) )

This check of s not being NULL comes too late, as strpbrk() would have
de-referenced it already. Considering ...

> +        {
> +            printk(XENLOG_WARNING "cpufreq/hwp: option '%s' not recognized\n",
> +                   s);
> +
> +            return -1;
> +        }
> +
> +        s = end ? ++end : end;
> +    } while ( s && s < e );

... this it probably wants to move even ahead of the loop.

> +static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err(cpu, "rdmsr_safe(MSR_PKG_HDC_CTL)\n");
> +        return -1;
> +    }
> +
> +    if ( val )
> +        msr |= PKG_HDC_CTL_HDC_PKG_ENABLE;
> +    else
> +        msr &= ~PKG_HDC_CTL_HDC_PKG_ENABLE;
> +
> +    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err(cpu, "wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", msr);
> +        return -1;
> +    }
> +
> +    return 0;
> +}

Please can you use either boolean return values or proper 0 / -errno
ones? (Same again then in the subsequent function.)

> +static void cf_check hwp_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    uint64_t val;
> +
> +    /*
> +     * Package level MSR, but we don't have a good idea of packages here, so
> +     * just do it everytime.
> +     */
> +    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_PM_ENABLE)\n");
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    /* Ensure we don't generate interrupts */
> +    if ( feature_hwp_notification )
> +        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> +
> +    hwp_verbose("CPU%u: MSR_PM_ENABLE: %016lx\n", policy->cpu, val);
> +    if ( !(val & PM_ENABLE_HWP_ENABLE) )
> +    {
> +        val |= PM_ENABLE_HWP_ENABLE;
> +        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> +        {
> +            hwp_err(policy->cpu, "wrmsr_safe(MSR_PM_ENABLE, %lx)\n", val);
> +            data->curr_req.raw = -1;
> +            return;
> +        }
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_CAPABILITIES)\n");
> +        goto error;
> +    }
> +
> +    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
> +    {
> +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");
> +        goto error;
> +    }
> +
> +    /*
> +     * Check for APERF/MPERF support in hardware
> +     * also check for boost/turbo support
> +     */
> +    intel_feature_detect(policy);
> +
> +    if ( feature_hdc )
> +    {
> +        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) ||
> +             hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) ) {

Please can these two if()s be joined and the well-placed brace be
retained?

> +            hwp_err(policy->cpu, "Disabling HDC support\n");
> +            feature_hdc = false;
> +            goto error;

Why? Can't you continue just with HDC turned off?

> +static void cf_check hwp_write_request(void *info)
> +{
> +    const struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    union hwp_request hwp_req = data->curr_req;
> +
> +    data->ret = 0;
> +
> +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(hwp_req.raw));

You changed only the right side to not be sizeof(<type>).

> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data;
> +
> +    data = xzalloc(struct hwp_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    policy->governor = &cpufreq_gov_hwp;
> +
> +    per_cpu(hwp_drv_data, cpu) = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);

Could I talk you into moving the helper function immediately ahead of
this (sole) one using it, much like you have it for hwp_cpufreq_target()
and hwp_write_request()?

> +    if ( data->curr_req.raw == -1 )
> +    {
> +        hwp_err(cpu, "Could not initialize HWP properly\n");
> +        per_cpu(hwp_drv_data, cpu) = NULL;
> +        xfree(data);
> +        return -ENODEV;
> +    }
> +
> +    data->minimum = data->curr_req.min_perf;
> +    data->maximum = data->curr_req.max_perf;
> +    data->desired = data->curr_req.desired;
> +    data->energy_perf = data->curr_req.energy_perf;
> +    data->activity_window = data->curr_req.activity_window;
> +
> +    if ( cpu == 0 )
> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);

While I'm fine with this (perhaps apart from you using "cpu == 0",
which is an idiom we're trying to get rid of), ...

> +    hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu, data->curr_req.raw);

... this once-per-CPU message still looks to verbose to me. Perhaps
for both:
- print for the BSP,
- print when AP value differs from BSP (albeit I don't know how
[un]likely that is)?

> +static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
> +    per_cpu(hwp_drv_data, policy->cpu) = NULL;
> +    xfree(data);

Nit: Style (blank line between declaration(s) and statement(s) please.
(Also at least once again below.)

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -63,12 +63,18 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
>  /* set xen as default cpufreq */
>  enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
>  
> -static int __init cpufreq_cmdline_parse(const char *s);
> +enum cpufreq_xen_opt cpufreq_xen_opts[2] = { CPUFREQ_xen, };
> +unsigned int cpufreq_xen_cnt = 1;

Looks like both can be __initdata?

As to the array initializer: For one Misra won't like the 2nd slot not
initialized. Plus the implicit 0 there is nothing else than CPUFREQ_xen,
which also ends up a little fragile. Perhaps 0 wants to stand for
CPUFREQ_none (or whatever name you deem appropriate)?

Jan

