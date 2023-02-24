Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA76A1DF6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501130.772738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZcP-0005n3-0G; Fri, 24 Feb 2023 15:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501130.772738; Fri, 24 Feb 2023 15:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZcO-0005ke-TM; Fri, 24 Feb 2023 15:04:16 +0000
Received: by outflank-mailman (input) for mailman id 501130;
 Fri, 24 Feb 2023 15:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVZcN-0005kY-CZ
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:04:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 803da0a5-b454-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:04:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 15:04:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 15:04:12 +0000
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
X-Inumbo-ID: 803da0a5-b454-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGdWm5rEJZH3FZGgGWj1KM2T9FvJ7GFXijkmxGLGmm77NdUi6p6GvvGbnW7s2tfap1UZaqU0ljG/CPcTBsJb9mrvWmlFCMZyn4LbxUIIYdnEt9C/ipLA0vRlJ3yPmB+U5GKS+9CQcvtIrx7ZLfqr2mS75um+/5UrjglnFwp5bVGjLs9SERhuXRsYAqTq0DInCLz66GJEhLQskhPpryJB0MxSy4hHFIeo7Y9ZTFwdX6EcoVGIXW04F5TZEW2LTngyPgdH8tZ5h+y4/QENud5eo1+Zktccb0xP51iiSYlXyUGRwOwCKKxWXvwPwgc5JNfKanA4jReHj5rE3oAB9Ol7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P2JW8hT5mG4fWX+r20I6j0WMkFT8r2krlr/tKelmZY=;
 b=K7uMnE5fMHEaM52wRer5zrz7W7sGNEAews+7205+YnEaJ9NYCotVNLJJtSgSavRz5+yXh6zVy0Cus5doXuNHtNAdAqBS83PQhalnL6qDS1S7vIafe7FupNVGWBq1iO0oUH+faAiT4gKzv2T2xY4UgSpgmb+o4eErkP7n0ecfc9DERSZ6DBMtvZ0oVAhVersRkioomWaexw7kjcpdTkHop3q5wedlPnCy1NTtVYhIUkdKDi4fnm087yWILSR7ejUbk3GvxYk8zpc96d9Iqe6hptNM6ZhbPiIgRpdw3im+9jBNi9oSChynmjMR+q5esMlWFzAK3MQ81xAogHlRm1p53Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P2JW8hT5mG4fWX+r20I6j0WMkFT8r2krlr/tKelmZY=;
 b=IKvFRy+ChT4n3S9s1a/A4DhCviIaYj+ErJVKDYhjLxcpSdvdqIKRpSV/SktucY5dwjs2mqyIp0MOHK93ZgdpqqOsUvzvVKONXH+cNK45yVykVZ43nnuN5NrM7lHkqMa5bsBzhzirEflzX0F1WA8KYoufom9hr2l4ELiwrPjKss6In+dO8TgGEFavvH9LaKb1y5sFAbtaEiGwBCQDFUMu/FSlxl8kdtnb35UCAaTJxwkQc0nx6xkXQvxBpm9vsGT22c/hRijkZupJF8SS8CjMZ0PjFmO4vdS3iELYdKZxRpqMGruAGs0RJGlPdm0mix1AoeZYSpZnb1jjyF6DdxIl4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
Date: Fri, 24 Feb 2023 16:04:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/riscv: read hart_id and dtb_base passed by bootloader
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c8a045-f3e1-43d6-8fa5-08db167863a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5eXnFg90wEP1KNpaN1NnceQeRbj6HyAYdZoxN4sHMJirgSgYk0Vm7MDIZanmxyqkfBNLy/0JT9+sMAMlYs1nDHgL+8hsE8VMH18ZMd17dKvVsPZU7VVH0WB/KsQ7LYKlOxF1jt1UR1t1DmGtG4zp8Wfmb8KLCxQq3w1ROkgaYeCL+K1v9z90+F6KyYIA3Y0wmopPzXccxzMSsL3H3MxsTdE/dXDtNHobrLHD8h0HRwDd94CvvPEUOJGRiRwoS0VRdftrvUvsNqFoS3L1RqvZm7uQl4eLDGRRAro1L5XHLvOy8B8WmTWPbWDnuVfD6F51JcCnDX6A+iAlwgLBTewqHPlXe+E4jCmVPE5OFvV904Vcu4BE4RZEdG+qz0pKcQa7RpHnqlN7mP2xgLAH540ND4YvDTjkIWHF4nQQFoaVpZWrVz5KjBPCqb6DEOssdUk0eLzrEYb61EviKuYjNdQ7yTYDKExepp6UJZ8yCDr7Q4/fFMiozhJxMJEZ3XYI2kGgWQ1GKQUMbhc+EFihQHo7ifPyXaiNVsB3hYbFjUlO73vDsgwxcA1w2y0J8yoHp6McJn7XTLzVlrxSFyMVTLtr1yGxLeV9DTg7YiH/DTFfiKYJVeqK6oh4CPPhvVePPm3aFaQMpKdf6fkhDkfHtEZsDNZfRiucUUeSMm1McfkP48ZRCNENDrlnqf64t/O9JUKVCP9q6536RlvEGI1nNPH/qwLDljSYHF4ukm9WQUchaOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(2906002)(5660300002)(36756003)(478600001)(6506007)(2616005)(186003)(316002)(54906003)(86362001)(26005)(38100700002)(6916009)(66556008)(66946007)(66476007)(8676002)(4326008)(8936002)(41300700001)(6512007)(31696002)(53546011)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUY3MGYwQ2N6SWRRYUtGbVl0Q3BoOHQzaXJYcE1OTGFVb0loQmV6NXRLSGtj?=
 =?utf-8?B?K25UL1Z0aGw2alRyMDVwQ0JEMDEyVktvTm13UXBCU3Y2R2lNVUhzYlpDT2t2?=
 =?utf-8?B?NEpWczZydnp5N2RyYkdEb1RKeU11NzRkR2JnMEQ4RzFVVEVFdHViTVNBMDlG?=
 =?utf-8?B?dFdQbmo3blJQSllURVpyV3hzRGRZb0NzSlFVWVZLYUFhSS9QWnNWQlIxZlFH?=
 =?utf-8?B?N01MTXpEWjRzREkwaG0zeG9leTY3NHN3cGdGMS9uc0hGbld0cmtHMyszM1V4?=
 =?utf-8?B?WVB5ellRQnpjcDVPcHE0TDRsUGp5Q0RxQVBEVUpEZDNJblRBMGNlNDJOVkJ6?=
 =?utf-8?B?dFFWMGRrNkF5OFhaT2wvT1QvSURkTnNmUGhCVDdqK08za2l4UE9IM1ZLaFR2?=
 =?utf-8?B?anFKOEQ1aW8wQlI1QnRXZC9YR0VZUXJMM3NKelMzU1hBUFVacEdBUGJ5UEZN?=
 =?utf-8?B?UEhNU1h3NzRaQWVHQyt0amMrcU1ucmRqRXE1V2JYUjVsaVpJaHV3ZCs0WlNH?=
 =?utf-8?B?ajNkWXlmWHg4S1ZCUVN0Z3l6Rzc4OVVrZitCOVlOU0FrbktXM3hzdy8rMUlZ?=
 =?utf-8?B?UkZxclA2ZUhWS1R1MWxJazVRdTFQMWZLZHdoR2F6cVZyZ3Z1SEFQTy9DVWpG?=
 =?utf-8?B?V2RCOStGQXV1ZGtZRzhXTlgyOExWdzZ1NS9zT3ZMamZmYVpETnFEVmlzSHlX?=
 =?utf-8?B?UldSdkZNSmVxM2lrd1VtQkFoeFc5Q2NSOTdiS3IyVWZRQVZOc3htKytYNDJM?=
 =?utf-8?B?ZVFvdG5jSXNKb3pkNVN5eVppYVRDSk1oT0VpTjFJOXR1dk5hT0NlS1NEbGZW?=
 =?utf-8?B?VXdNWmZYN0U5TEdKVWdJbkllWVQxV3pjRnl6MWFHL1NLaVFEcDY4R1VuS0U2?=
 =?utf-8?B?ZUJjNWVRRk42L1cwVE0xOUJyTmJ2ei9EQTl3aC80dVNsbEo4Nk9jYkdUd0ZB?=
 =?utf-8?B?ZmxMREFPcUtyUVU5dHRGZmpzV2t0d2g0YVRJYUZXaHVlc2JHVmlqNzdPS29Q?=
 =?utf-8?B?ZnQySGQvb1lTVytaaUd5OXRNdDVnMGMyM1lSUlIzVDFHbjlNYTdnT095b04w?=
 =?utf-8?B?a29HeEQwVnFlNHlBSWxOOURQNjczaDNsYlJNSVo5UWtjRnUzalVtZnJ6Vlhh?=
 =?utf-8?B?WVN2SEF5cncwWVBmYXg4K2t3UHkxN1F4OXdrRWJHNnlneSsybmZrejFNTnlm?=
 =?utf-8?B?NkhLTElZYkRSbkgyZGJORUc2N3E2SW5jaHJNWGNrWlZBWHJKaTRndkdoRVB4?=
 =?utf-8?B?UExQSG8wOTQzSGZtR1VSYkJRMlpHNW5hbFg3ekF4T3lNUEZnY3JMNDFCYWJu?=
 =?utf-8?B?aEsyeW1kUjR1ZDZDUDVZZ21UdVp3Snd2Qm9TYlU4ald3Yk1heC80RVF6eSs1?=
 =?utf-8?B?OWhVMWI0bWpmRTFUaVl0TWtjdnIxdGpoNnZhQ3VwVE8vL0hzb0FpTzh5Zk8y?=
 =?utf-8?B?ekhla3hXSVBnQkZXeFphRWFaVXYxaHFGcXVIQ1NxVHNzd0g2RzJQclhBZWE2?=
 =?utf-8?B?eVdmdVEyTlRGU095OThoZ0RwaWlCYlhQOWRmc0I0bkVzTlpacWljblVxaEZl?=
 =?utf-8?B?TEZmQUZYL2tkQ1JsTnRYR0N4andkL3FILzlyMlo2VHZiY01Ba3FiUS84TGlI?=
 =?utf-8?B?cWZSYzV0aUtDeCtDSEVlV2E0YmtnUGgyRGFDOTVNN1cyZTUxc2UrN0ZtQnJl?=
 =?utf-8?B?OWRZL1NjNWluQWxKWEpQTnppWUcwcW03c3R6R080d3J3Vzc1anBNQmpPNjBl?=
 =?utf-8?B?alV0ckZxU0pKZkNMRGpOSVdRT0MxcnhZNFFRdFM3bTJzRjJNejNvMFRjQkQ0?=
 =?utf-8?B?ZUNzRFl5cWZXcnJGVEFkN0ZpejcwdkVINXBEbzQ0dVZsVkpMWTZ5blN1U1FV?=
 =?utf-8?B?QjhkQUpNNlByakovaEVJQnpubFJsc1FNbG01ZTVLNWpUWnNZM0c5Rk4reXcx?=
 =?utf-8?B?N1lxMW4rOXdzQ2RUYlkvRDBSMUdRNUd5NnAreUZUVUYycm40N2hudm9FZk5U?=
 =?utf-8?B?clpQdE0yQ29uSWhWaVdkaExYajBuS1pCc2F5a3N1MXYwMFhjL3VQQmFnWnFB?=
 =?utf-8?B?QzBVbmJpTHpjeXdYcUxqeVVzWUFnYXlNM0Y1bjR4LzlBb1NuSW1NWlphd2RH?=
 =?utf-8?Q?k5AZMZAy5wtTGlvzoneycsgbx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c8a045-f3e1-43d6-8fa5-08db167863a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:04:12.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIzdzJ5pXHvjwuncqN8Tn4DCDaqTGeSmDc9XRcgN8oxGj7RrqeYql1Qx9OynX8wU/VZUEpUA/aErJFEJtMPtRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

On 24.02.2023 15:48, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/setup.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index b3f8b10f71..154bf3a0bc 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
>  
>  void __init noreturn start_xen(void)
>  {
> +    /*
> +     * The following things are passed by bootloader:
> +     *   a0 -> hart_id
> +     *   a1 -> dtb_base
> +    */
> +    register unsigned long hart_id  asm("a0");
> +    register unsigned long dtb_base asm("a1");
> +
> +    asm volatile( "mv %0, a0" : "=r" (hart_id) );
> +
> +    asm volatile( "mv %0, a1" : "=r" (dtb_base) );

Are you sure this (a) works and (b) is what you want? You're inserting
"mov a0, a0" and "mov a1, a1". I suppose as long as the two local
variables aren't used further down in the function, the compiler will
be able to recognize both registers as dead, and hence use them for
argument passing to later functions that you call. But I would expect
that to break once you actually consume either of the variables.

Fundamentally I think this is the kind of thing you want do to in
assembly. However, in the specific case here, can't you simply have

void __init noreturn start_xen(unsigned long hard_id,
                               unsigned long dtb_base)
{
    ...

and all is going to be fine, without any asm()?

Otherwise again a style nit: In the asm statements (not the register
declarations) there is a missing blank each before the opening
parenthesis.

Jan

