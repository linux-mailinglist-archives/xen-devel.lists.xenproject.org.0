Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DD751BD1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 10:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563016.879888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJrqY-0004rZ-AT; Thu, 13 Jul 2023 08:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563016.879888; Thu, 13 Jul 2023 08:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJrqY-0004oE-7K; Thu, 13 Jul 2023 08:38:46 +0000
Received: by outflank-mailman (input) for mailman id 563016;
 Thu, 13 Jul 2023 08:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJrqW-0004o8-UR
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 08:38:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac34d0cf-2158-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 10:38:43 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 08:38:39 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 08:38:39 +0000
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
X-Inumbo-ID: ac34d0cf-2158-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPSd28T5I4jQEPF70PG1O5xRo1M0dogj22OU5YfTMtOjSGhNuRW1ltXTPoXx6YTbogy04O43c2zvxEfM2mBzIyeDSu3xEVMzAcUnWwrhgwsiUfoTtJ6iN9UTVLWH24dXBny5WD7jpWmuidk2NJsp/hNnC4QxIxTmyEjyWuYRHnqE7TLu6WjFDw9OWPvt14oSBKksRHGrDbEC1vvjm0GFPD1id6Dwbf13E3Vh5ZrrfGchQBIaSz/jhRpgXP1RAeObliRG9Jasmwa/HhkEi+wIeAzJlnvK+wU6kfpxEdHZp8VUSZqjitOa6IM337FegHUCYLidxwCNMJLjC72OOon7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNuaswZ2BjWORMItjz7/biMTYirV+bHvKdZ1wkJ92zY=;
 b=J6PqiBc0h9aLTqoWV+Y2M/Al4c5hfFCuyMdaLoVLbi1tMqLQr3mS3AG+u+WIVZtVRef8YyRNc6dbsx+WgDJhmLyRsKiYG+yKU2q2dttVAfafd9/bQGu96g0ytP77SrlrqQCBqqsvISs4SUSTWWxR0fNEd/nSzwaWAqHRLsbbjIIGIkF/htHIZXUu6CiH9+13Es6tECdpr4XdQEKsyy8IitFAvzzJpek5imm5x76HdifZjsjZBivaEzaRKhPE9RL3E7XcxKkYoGvw9DMarpFdFPv6iGYTuMoe6b5xWhFthBo+wwafAggSFs6qvHiB45ofnfvgCDO+GF5SDR9L8KxQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNuaswZ2BjWORMItjz7/biMTYirV+bHvKdZ1wkJ92zY=;
 b=a+JjTcn+GLzHRyMDv+gYO6JeKhbQ05WBOVNDpTt+MxGUzyfrXvZJ/hemGDTnAAstKVTlziTi22dreVzzcFlPrE7uZP/J7sB1Fkzxxr5icMV0oLJB+uaDju83UKy8NsuD8crCmishiPYTS2tQQbjPuLMclQ/L6qKzHKWghzbxU0B1qOxwgzMxGpx0zq2goykQSxCfPrVW18G9//TEQDNbyEzw1+g+Opal6YkUXW5BgP0HdD8D6YcYg9qlz4E8FEleaG6LUSlQm51dSNvtvSNGCdS+g95hGZhHs0/CbzJ7z1vYnEqDr/WWucLC/Qxff4WD/pzkLnim7+SuMOwdRSj9/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47f21cdf-5aa3-5f19-b967-6b217890e706@suse.com>
Date: Thu, 13 Jul 2023 10:38:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/3] Fixing ACPI error reporting display
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1689191941.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1689191941.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 252da8dd-f533-4eb5-22a5-08db837c8e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8z04Zv5IA+4qOuu044WKqSLSJRbs6lqxfWNNBD20iF/eb3jXSC/a1LmFBYruUFnW7WNdP5J/xBbotuhGxtXKITc29V/9lD5+ekLJ5Bj5x+J+uKkt6mdnshIKyd1/m1uyS4i09HUzBCrhDLhXcBvwdwAkod7X5loVPyDVQq5KAP6sb0s7cI+k8bxVSDW4Ca7+6KHgzlxwjzs1jAc9L4E5etzz6KlKabCE5wIgnmqeKWb5z7RsnqdroUvPlXNIc1tkoTaTKqRrcM97mRQJFVdMNk6LLsBYdvFAFr4LxQ44SnEGrysjs2KiQsHyp0OblLl4HWKblykIo8OeJ6UJWe6tEKEXN6CzXOSlpafK4Mg2Jd4ZGYGf5lcnlNW9Ej1/FsczuW3wOOTfS1xn3Or7N6ShxITNht19br+qr5xJ1Ktjjm8oglOfRtwtxajMPjG+QoB8yQwwRJnpHiflmke+F7KRJ9svj11qe0Hmadexk7lSPoARENLpAz0s4HjNdJifA4bo9f+IO8eSo/sNRuwptpSUv4WYrnevHCyI6whD68teLVLrS0llVSmyz+kJt6EiIfRnfGXT9Qp/s7Yk/VhcziriDlS+DBZUjqFJxKZpRHmmwiyCRAZI+JtQUP4fucLNN8M0cWdMxTrnhw6lUZUzS6+y8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(2906002)(6512007)(38100700002)(83380400001)(2616005)(53546011)(26005)(186003)(31696002)(6506007)(86362001)(5660300002)(8676002)(36756003)(8936002)(478600001)(54906003)(66556008)(66946007)(41300700001)(4326008)(316002)(66476007)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VENmOTZKcCtpY0ErMjhuY3BEb3M0Wm5KUm1HaEUxVkxuWmpRTlRQam84Rkw4?=
 =?utf-8?B?M3pLWHliZWZRdDNsZWUrb3dzMVNHazdmaCt6UlltU29ETEduT08weUpFSUNt?=
 =?utf-8?B?UDZtL1AwUlJXaDdSKzgxSTZDYVY2dlJ5amZjOS9jRE51cnlSZ2hablRLTFV5?=
 =?utf-8?B?U2FFUGJQRjU4WG90d0J0ZWwyQjRpQUFVdFFJMWVWck9oaTdFdFdwU01jaHJM?=
 =?utf-8?B?T0pycXdJMy9QVGwxNDY3c0VrMDA2c212MmRDVCtZZFZKS1dFalc5MU9PWTFn?=
 =?utf-8?B?VUxWdjhGODliMURleDRweDZneFJ1TGREeWdTTDl6aFBubU9LM1VreWNoVUJk?=
 =?utf-8?B?UXMrTU1JZXhLYnpXRXJBNkJEVGhmMlBkTTdaQ1pNcjdjMlBKSklsRGdzWXlO?=
 =?utf-8?B?TmExS0puMWQvemt3dEJTc3dxaGJOL1VZeU1XdWRhV3J2UDR4MGxHWG5sd0NN?=
 =?utf-8?B?WjFjbWJaYm5McHp0Nk4xbVE3eUYxdVdRZVkrRlhYaCsrMmZzWGx5cHh3dFFD?=
 =?utf-8?B?K1BWVUliTlFQL2JrOFF4bkVVcHlSZittaVJFY0xwajhoeS9Sb1JVWjI3RnlZ?=
 =?utf-8?B?WlNiK0w1YVdmcWovVGp3R1QwSDBtWWxyUUYyL3JOTVBUa1ppNGY1WktGeDVl?=
 =?utf-8?B?ZktCQXRyNUF0M3kwWVdQQ1BOd0RxY2Q0eFNvVHhXUE5XWTI0U2lkMXFMeEZP?=
 =?utf-8?B?aTRnblNBVUVTbE5aNTlDV3RsVTE2TmNJZ1hJRE5rLy96UXhyRk4ybDVRNHRG?=
 =?utf-8?B?bzU5U29nUGhqVXBqMytlSXpuYnRHTEpyMHNnd1ppWXhGb1EybE5WUEh3cHFZ?=
 =?utf-8?B?cnRDNWZWZHMrdTZ0T2tCZkNFc3k0QzF4V3RGREY4N2ZqVTRVREZsR3lHZHg0?=
 =?utf-8?B?ZERBcVlaWFQ1TXA2YTd4M1d2RDU0YzhQL3lkMlNmbE1laTVxMlF2UjRtNUdT?=
 =?utf-8?B?TGVIOUJlK2QwRkNjMjAwLy9nQ0Eyck5tMFdiZXNWb1VncFpkOU9LVkpZYTc3?=
 =?utf-8?B?Szd4dnJEV1cyekJMWFkxOVhHWVZLZ0hGcTFFT2hnQUdJeVd1MWFSV3dVV0Zt?=
 =?utf-8?B?UDdUbUhjdFRXeU9Ldm9YYXhQd2xTOXkraG1SdlhROEltdFdvQjk2OFd4WGEx?=
 =?utf-8?B?dEdGZTh3WU5BczdBM1h3OG1EbWI3aGJQU2pJVmNxTFRkaVRUbWpoa2tOVld3?=
 =?utf-8?B?bDFhaUJkVU1ZbzBuSVo2cVVSTmhPczY3a0RGeC9PTURFOE0rdXdQalRPaXV1?=
 =?utf-8?B?dHMzTk14bnJEM25qTjcyYnlqSWxvdThPcXlrNEJnUkp6aE9CNnJ4OVVWQk1E?=
 =?utf-8?B?Y2haY0ZHVFpFZVo2OStCemJIRm4zYWdrY0xUUk9XeWVwR25DTUIwSU9ja0ZW?=
 =?utf-8?B?OUdXaFBNdFpBdEtTeVNPOEZGbkRkdTZvc3JBUmZtSVpjQktOdmY0SnN1NFpT?=
 =?utf-8?B?dkJRZlNSeXpUbU1WNVQ0dnEvRFJlb1hSYkk5RG44TnpRWFVNUEhYdnU0d0dN?=
 =?utf-8?B?b2cyYjVDaCtWYmNlbzMzNmlkMHlYcDF0VStnWFpMZkhXQW9RRjRPUjUyY1px?=
 =?utf-8?B?Qk1hZjc2M2tyeTVNSVRCOTZqOFNJMUYzQlRiZkFuWVZ2VTQ0dTk3LzNJZGIx?=
 =?utf-8?B?N3JGU2JtYWVBU2RyQXdwa3E5SFNyekhVcy93ZHFWUG9lTTdTYlNwRGNWSHJv?=
 =?utf-8?B?RjJadjZ5UW9sb25ENG9XOFJnQmovcmRKdytWVkJnUXJOc0N2SFpmckxKTDl6?=
 =?utf-8?B?dVBaZXlzdC9iNWx6Z1VKYlNFaTUyRzBsd0l0cC94SUJTd3ppYThtSDh2NzJm?=
 =?utf-8?B?TlE5K3IyVUJRRmtBVzNmbFp6K0dkTjJCZTQrMEFic2ZuSld6NkVNZnMvSEhD?=
 =?utf-8?B?UUppYmEvdVY2RFJWUzJzdFBvaU1NZXR1ZytYS3FDZGJhVlZadENxdkV5cmJP?=
 =?utf-8?B?ZU5QdTl0dlRCQ0lNNDNvazdBaFlTdWtDKyt4SWpPdFM2NHZhQ2laSU1NcFQ0?=
 =?utf-8?B?S2RnTldiNDJJSEFhNzhRRXhwMm43R0NiNmVZVHBqMGJoY2FrQ2R4Y2xod25q?=
 =?utf-8?B?MWxBektNUURKTEg2blYxSFBmWjZuUVJRQSs2WXl5NmdYRkFtRWFpcktTaDJ5?=
 =?utf-8?Q?s2VMRmMTMm8aJ4F0aG3UMS5Lf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252da8dd-f533-4eb5-22a5-08db837c8e71
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 08:38:39.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUmGnYSwUpL9QGFi/5VjqQ5fVnDocXW1iuFZACHpRwbUlXNQX8UQiLDCI6Dgkz1OHbA2TwBUVgbvhgLAPkpDJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

On 12.07.2023 21:59, Elliott Mitchell wrote:
> This series has been seen previously.  The issue is pretty simple, if
> ACPI errors occur there is a high probability they will occur on multiple
> cores at once.

Nit: Both here and in the title s/ACPI/APIC/, to not misguide people about
the area the series touches (just in case a v4 might be needed).

Jan

>  Since there is no locking for `printk()` there is a need
> to emit the entire error with a single `printk()`.
> 
> I believe this is roughly where things left off.  The loop adjustment had
> been requested to be broken into a separate step.  I had also goofed when
> adjusting the handling and the string order had gotten reversed.
> 
> I'm unsure how best to make the `printk()` more maintainable.  Yet more
> "%s" and entries[#] will be needed if additional bits get defined.  I'm
> inclined to keep the string broken apart to hint as to how it matches
> the entry list.  I'm okay with everything being fully concatenated if
> that is felt best.
> 
> 
> Elliott Mitchell (3):
>   x86/APIC: include full string with error_interrupt() error messages
>   x86/APIC: modify error_interrupt() to output using single printk()
>   x86/APIC: adjustments to error_interrupt() loop
> 
>  xen/arch/x86/apic.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 


