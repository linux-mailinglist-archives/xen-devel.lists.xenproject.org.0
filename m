Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26127698AD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573082.897430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTO5-0005A6-AD; Mon, 31 Jul 2023 13:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573082.897430; Mon, 31 Jul 2023 13:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTO5-00057Z-7O; Mon, 31 Jul 2023 13:56:41 +0000
Received: by outflank-mailman (input) for mailman id 573082;
 Mon, 31 Jul 2023 13:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTO4-00057R-2u
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:56:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11150e37-2faa-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:56:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Mon, 31 Jul
 2023 13:56:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:56:35 +0000
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
X-Inumbo-ID: 11150e37-2faa-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpTCySQ2wtQO+jVRCJr4NKdlBfFjKztK8dc5mhb2ZglL2b/salFjSHcQ9as3IZFsBIMGqyTRwWeQ590EzHrOOX6xA9QqZiOrBdtewo4IzqEP1C0RGxnv8SNTy6FbJcGXEoGjKJpUmn6OiQxWMbeNotEUY/TnFZ3Q2jmGQpOumgwPqH/7h2PI1FNb3HBanT+bt7rF6EkbM5Mcm40YmVT+xoGB0Q1E1zmMqsNFa5qo8xssg7RalE3Ki4GbCQ2LFLhgMzZYKgVaiD3ieg3RH4Y4AXTgGMyht56BxJTyH+uqMnwcIeQXGnWh1NNMOoWevo6YOPfFcES6MZf1uG+/my58KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2InilYaptwCoVS5K1nDOd3A8y9sVLBW++/dx+G+cKg=;
 b=UL1zlYszSQ+CN7HU8QLGkvVIzvMOpK+9fBcX6PCTZdK7zLxC9MgoH3hKrecsrWQzc4uPgM+Q+1F3icFt3ZAP9N/j61CO6ghfIIet0UVW0uyWaoCsUXTo2DWEFbxIaV3rs8Jis84iQ+qWCOB0oUAgjkYyLRVICxY6AL60VrXKGnnV3AvgCEB+6VZs/bBGSudcZ393a2SyfUm8sfqskzWtUr5kY2Cp2bfp/UIV8qsbHsGh+LEVO8RvAn1paVrw0NozoBRDlGnYJEIp1K8gOJv7w15oRc30ot0hS02nR22NC+XviPmEke8KesuJuPcS+XUyjRs28mH+CJ3KmkGJO4iT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2InilYaptwCoVS5K1nDOd3A8y9sVLBW++/dx+G+cKg=;
 b=Vn1jl8j3zdmMCivxUQeWhjnYEyaFhB80Vxr8WhVccKIkhxyc1c+tPJpzPIzD/QzxfEl2s6dftVIYbqPxJy+zkPD1zZBZ49lOj4UwMUVblt6htenGcgyCcLKZIDxcKpFJqqlUW1wde+pE5Dg+MrmJ4K8UytkNKarwyqHVv9quOrTANBtwXbCjbDD1nTQeYSru525S4/IKDvEANpTmGZGgF9v+z5LKK44kWjE2oXONpqi8G/ctaEzr2NThDYq0lskkzWpMhAuolVIn9qYcP0e52hvFeURw42r1nXv8MyPqBx48nTW8LS7cerP2VOPz+cDoVpGypPwT64f0/nB0yLCndQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df17e20c-1d11-bc01-eb07-c0234752b079@suse.com>
Date: Mon, 31 Jul 2023 15:56:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v7 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726170945.34961-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c5ad1c-6211-4112-5a85-08db91cdf421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	epQNjL3WRTqdGKGbXl55ak0y1wRaZFZwhTj93KIsQQDrVw4IHYpgL8B3Rfv4E/ZI+Kh0gTLbwPr66vocnHbtn2PmyQpFFyUsoXInPHcF34D5G/+dOFszmT+Fhg4MSGOVHuTEaQz9jR5c7qdMYEb24JcGn0FQz76cDHkkv+CGOXUyMY0fFDal9rYcSfGOEY+vufP7myAySPAmNFgQk25Q/HFch0xCInxDd1IwHVKhe3cfgstO9bxu55sWi10d6JkAT4ejFcEn9SZTyMfEqpYdMKNWqgzhgpXPcO/iK/PpPCEBrcyqkpl0iUE39rY5lfs/gS3lKOEcnaCraEX/XzKz/FegtuW2A7qFPJw1k4aH3cLbMQw6wsudIFYKoDwDHysNYQfNkQeQEJPmYOsmS6hqIFHJID5QIS/36FR/AqAiwMY5MSyRY+9ilFJeneM7LufF8dCh5KWOYRM9Xl86zx09BVX5fhnn6eobgBSGAEZdK7co67cpayz8Nf60MxfvxGYA016jrYxbbVgctqAAfGLkUDB3i55j0B/ce/wllKFGfRtx/QpEu8CHYiq5L+QYTus9rts64Tm/UcRH1o9AJRERDJY3K81GrD73ht3QG4rnc0yXh7U2SSkQGos5GraQFfF07t1zYGclxr+WaOnfJP70pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(316002)(31686004)(4326008)(8676002)(8936002)(5660300002)(41300700001)(2906002)(6916009)(54906003)(66476007)(6486002)(66556008)(66946007)(53546011)(6506007)(186003)(26005)(478600001)(86362001)(36756003)(31696002)(83380400001)(6512007)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJSNWY3U0hOSmNlaFRwR3d5dmxIcVpzN1N5c3VlY3QwQ1AxS3EvdkdGV2Rs?=
 =?utf-8?B?eStnejJkdWVhdkYzT0JrRE9VZVJRa1Nud0ovV1JvN1dOTFRhWWEycFdKV0c3?=
 =?utf-8?B?ZGRiYmtmeFhjNlJpUm9GSldaN001Mkh3MFlvYU1SQXFiQ0hId0Z5dHBKYnVR?=
 =?utf-8?B?ZEJWNDRmYkNoRjk4SDFyYUIrUWVRMmdKaHNhenlnN1k3Zm16bmg5ZG9xL3hB?=
 =?utf-8?B?b0xKYzhDMXBNdDdWcjlCbGhab25vSERDNjd6cmJhWDhlNERKVXZIWnRwcm9Z?=
 =?utf-8?B?aVBpSWxiUWZFaG1LeG5hS0NMakw2UEJLSXlCcXJnc3RQVCtUaVpCc2dNNmwz?=
 =?utf-8?B?bVFXMWpPUjltdnNvbkFuUUtka1labEZEeHFjVEl3TTBHc05La3hOUUhQK2lH?=
 =?utf-8?B?bXRZS0QyYjFXMXBTNWpNS1JIenNQT0dtRGM1ZFNpSWIxTmNyaHpPZkQ1MWZF?=
 =?utf-8?B?Y1RGMXQyU2dMbkpEWDN5eTIyTXV3K1c3a0xlWVQ4d1FXUExldUxMcnBHQmNP?=
 =?utf-8?B?OVFFMElscVNlOTRLZElVbjRtTHdlY1laY1J3TzlrZGh6RVBPaHYwbUhPVFBx?=
 =?utf-8?B?Nm1HeUxXU2RTTVR2NmMyR3BDN3lXOXdTNCs1SUJ5VXg3S0FBbjlqV3FHSEp1?=
 =?utf-8?B?cSthcjBXRmpTeUt4a1B0RVV4SFg0S1gyWFgwVWRQWmVEb3Z1TzkvODN4aWVK?=
 =?utf-8?B?Y2ZNSzQyUmx3aHZscWYyTHhjcExwby8xTnRSd2hoRG5Gc09HeHdCTHZIUmsz?=
 =?utf-8?B?ZmlJWDE4RGE3aWwyUVI1MXVGMlAyUmUrUDF3TjJKaFBTWXVQUk9zMlV6Wk4z?=
 =?utf-8?B?cGV3SUlxQ29aTFBmRGlPVXgwczVRZ1dzR1l3U1NFN29XdUJzVVptVGlTMVRB?=
 =?utf-8?B?d043ckE0cTFSSnc1Z2lMSTFqZTFHL3NOYzNlcm0rZGcxSlBqV0h5MDdyZWdn?=
 =?utf-8?B?VUE1akN0UDBGQUtVcVB6NzhTSW5qd2VDY25wOUVDelVYQmkvQUVvMHB5bllH?=
 =?utf-8?B?cjQwWkNoN3UwSW1VZ2xCQjE0MndsQUlZSjlHdVl0UitCNXVOS3Q4NXJKenpT?=
 =?utf-8?B?UUxqamJNayt3TzZNTmNJU2gwKzFwV1JHNmZmb1d1V00wQitWZm1ROERyTnFV?=
 =?utf-8?B?NEJ5TmM3aEZ5NlBZcUVMVUExK0toblN2NnNFK2VxTURlOXBWV2pvTjl6WUtK?=
 =?utf-8?B?eVBPYUF6NEhNTkR4aStxY1RTUEQydzZxRE5LTDJ6OW9pWEZ2bDlxVXpDdWpo?=
 =?utf-8?B?bUl3Nlk0ZGVLS1IwanVTYVVZNTVJT29ENkJqWi9UVHFobWNMbzNYNm9Ea0dK?=
 =?utf-8?B?TnJOUThzTk5kU2s1UkE0amE2MDhIV1lQbHlvcThhaDI1MVNkMDcxNFE5L3Z4?=
 =?utf-8?B?KytaVkRKVTlLdmozVXNaK0JYS0tRZ1I4eUlVWWozSHNVSEJWYWZjeVB0ZFRk?=
 =?utf-8?B?dHd1bzc1UlVERGJCMHV2bk1Gc1JVbzhWZXZycFlqbHVPZk9OQllicmdZTk9Q?=
 =?utf-8?B?dS9udGFIUDA0OVp3b1hHazU2bFh0WTB2TTVzbnlVU3QrWVBkZFBEQ24zN0tD?=
 =?utf-8?B?c1lDWHhRTjB6SWdmTkNSTDJNS0VlOFMyR1k1M0VxSjhEQ2c0WmNpUXU0eVY2?=
 =?utf-8?B?SU1ZVUFWSkQ0aXJzcUJzOXBKQ0E5bW8xeVpQVS9sVitnZUNwejNqNHdjYWpr?=
 =?utf-8?B?ek43RzB6ZW1Damt0UEx0OVlnK1ZXK09ROW16ZHpJaGR5Tyt2MXphWnFoWXFx?=
 =?utf-8?B?bjBwYlNOaXZKdGZiejM2OVAvVHE3SzBOaGw4eFptblRSNVlzZGdraXJLK0dx?=
 =?utf-8?B?elg2MitxaUFBS2tsUXBmQmMrMzR4UDhhUnh0b1dkR1Bqak9tWWZoY3VQVDZP?=
 =?utf-8?B?NzhGZDg2RE0xNmF5MkNzOGFIWlc3MFRmQkJmU2pFc09pNVU3ZFJaaXJtcDc0?=
 =?utf-8?B?WmduV1FzSmdGbG0raW9lOElFa1IvWU1lM3RZaXdpSWNDN0Q1cUZKNDZnVjhS?=
 =?utf-8?B?WkpJKzVTelY3Rk16WUlBbGRBaEVTWkRFSkZIVWlKNE9XbVNMWm5OWUV6L29Q?=
 =?utf-8?B?NnlxN1BIZ0lkLzE2RlNhQWw4VlE5QmhRNHM5TEJNdEFjMFJ4YzlIdHBpV1lY?=
 =?utf-8?Q?Wf7d4OtQvzednwhDF1BouAy9k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c5ad1c-6211-4112-5a85-08db91cdf421
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:56:35.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JM6F+jZIIk06p3A6cq+ah10c3oYaoZbpsdXVDK6jiL0FeC02n0hZYcm/TS2OHcDrUdnRcePrNicSNNXcb6V0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

On 26.07.2023 19:09, Jason Andryuk wrote:
> From the Intel SDM: "Hardware-Controlled Performance States (HWP), which
> autonomously selects performance states while utilizing OS supplied
> performance guidance hints."
> 
> Enable HWP to run in autonomous mode by poking the correct MSRs.  HWP is
> disabled by default, and cpufreq=hwp enables it.
> 
> cpufreq= parsing is expanded to allow cpufreq=hwp;xen.  This allows
> trying HWP and falling back to xen if not available.  Only hwp and xen
> are supported for this fallback feature.  hdc is a sub-option under hwp
> (i.e.  cpufreq=hwp,hdc=0) as is verbose.
> 
> There is no interface to configure - xen_sysctl_pm_op/xenpm will
> be extended to configure in subsequent patches.  It will run with the
> default values, which should be the default 0x80 (out of 0x0-0xff)
> energy/performance preference.
> 
> Unscientific powertop measurement of an mostly idle, customized OpenXT
> install:
> A 10th gen 6-core laptop showed battery discharge drop from ~9.x to
> ~7.x watts.
> A 8th gen 4-core laptop dropped from ~10 to ~9
> 
> Power usage depends on many factors, especially display brightness, but
> this does show a power saving in balanced mode when CPU utilization is
> low.
> 
> HWP isn't compatible with an external governor - it doesn't take
> explicit frequency requests.  Therefore a minimal internal governor,
> hwp, is also added as a placeholder.
> 
> While adding to the xen-command-line.pandoc entry, un-nest verbose from
> minfreq.  They are independent.
> 
> With cpufreq=hwp,verbose, HWP prints processor capabilities that are not
> used by the code, like HW_FEEDBACK.  This is done because otherwise
> there isn't a convenient way to query the information.
> 
> Xen doesn't use the HWP interrupt, so it is disabled like in the Linux
> pstate driver.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    static union hwp_request initial_req;
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data;
> +    static bool first_run = true;

This would probably better be __read_mostly. Iirc there were some small
adjustments requested elsewhere, so I guess I'll wait for v8 before
checking to see how much of this series is ready to go in.

Jan

