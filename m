Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD976E33F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576084.901827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRToN-0007EV-KL; Thu, 03 Aug 2023 08:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576084.901827; Thu, 03 Aug 2023 08:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRToN-0007CK-GX; Thu, 03 Aug 2023 08:35:59 +0000
Received: by outflank-mailman (input) for mailman id 576084;
 Thu, 03 Aug 2023 08:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRToM-0007CE-L0
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:35:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4596aed-31d8-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 10:35:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:35:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:35:55 +0000
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
X-Inumbo-ID: c4596aed-31d8-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfS2pyDu4D+hup8GbXVmHu5UjvgtCjTFodVNFTAe5+HsPVC4f9lCIzYSTpmk/pcQJJf9QA8hwKmZlnQEhFr/gBzmT/wmAt/Y6e3tbJhRsjkNJLQz/m0FpeeAsjuw/r0xsEFYWVNSR+UVSUstWgNuj/wzQDiXxGoBTihiNb775xwo+PGK2gZP85KDcQByk34LSz+x2byYaNT+fn2DeXiHdm8p4vekEwD4CwUQVNWhGTX/4801B+RxLcoxzVcnl8rVmJaF+nO/bwTgSc6+sNf7D4mW4buJMnkP4MfSFULZR8y7OtFJCjlkeQvQnwDkyYfWZshtGHzVhG3/1kbaFoI6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQNgGyCcg1CmsUg3fNOMBUw3IOBCWjocZRi19DmmcMM=;
 b=cucbzQTgvdkXzajVfGzn61kfTu02dz4a+LcZ9LGztSU2Jpz9uY4FM//l6UpCMk8oMkR8Dv7ttDg6PrAaWUxL1LMGt7qmVPllE0JQ2R3QPX8+ZQdPkpgM1UGTrrNZrzJUEUD/ZLfHayBylOc74euOlB5m/xAZ6g6qpu+9+BPODOZaIsua5dkd0cmnvXhpJQJQ0lLWl3oSdswPqmxS4eEPwfW9Xs2DsC0eFZITxwre10s+vKsLa8Jb7HtA0lluQ83Om4MqPkRMbUWcc7lA5eBCjxIZRagw+X2R8/ubzeHhVJMS2vWubxKzC87cjFLC8bcelDVrTiTJLxLZpeW8LxVyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQNgGyCcg1CmsUg3fNOMBUw3IOBCWjocZRi19DmmcMM=;
 b=xo7DPPz1JDdIaLTE9+sapSR7h3p9FK/FOy6Vqv/OxSNBMJuNcISJ+PtNvLeZ9Ajo1I39YtceM3wVl8L6of1JuRrZKmS6LUXghayGYaP3krJcEVmCvpFCJTyiPK9oFakG0NonafD3lo6BjNUXoyR6RY3TyhJp5tJFT02b/7PjPPnzvPeR653Yv+VzLDd6IUxtaXimfHYrBeMRZOXG3crFJmxfKKUikF2rkvhC+rAddAbE2tipav1+Og88bYhazHdu2nyDoA0873F/No53dzBLfysEfUIS0rIzWV6/lzeP7TYiNvjUWtgaBmMmDxaYMTWYNwyIJyxTz8WOT336pEbfbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
Date: Thu, 3 Aug 2023 10:35:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 506f03ac-5127-4b18-a8e0-08db93fca745
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MsEnmZe0mgSq/NkB+jwCAUhLTj/oDFugU+RgFdm+SPxiFlTRuuMpyQKi0rQGvQpdJAHrTv8lSdmO5H8flZk+Vcpq2RGeXfVt1nzkdaJtCtT/WMKZmT9AyWb6op0BBx0SI8S6rFvZgujmfIJUt5F1sI+JGFeFmeiKTPZlHznMURYjzFE6QsaQIyrAZ1G4ztYy1+LOEYBr2SRJ+4W1CuSTzq6fFqVCEKxnW8hVx7b7xQiJkliJfPY+/q8PYWV+GwqzcDsnRXRZvhXhNNr5dVlzb2x/rvYBUOoll0pB6bWCNuSfvZX4c1jwhKxUb9sW9kNsZZVmFqYcMC7tUQlfaqGqgY2R34x43MbW2moAspAOqXkhAPs/LJ/KsJniKXFYWZ2znNKg7qjX4vPwX+ZZwK6XvBvVOFNsknDDVFJPJ7YDV19rUrEEXdVXCXgqZySluuGNS8jY63PAiMgqhzYNA46YNdth4Pc1MnK7gixSPZljAet+E0zlnz/DUTuyrAAl1RewGKn8x5jPH8qN78ue7f9tZgyX8HNCqmNv5XyLlhqZAlnLbSj4EAejcu+igRO/A7mhc/aZVudmXM5DSCrEyFJ1ZzbrE3A+T0zNwhSp06bWKInHVhhqUlwJrqndTvfnVRf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(36756003)(31696002)(86362001)(31686004)(54906003)(478600001)(38100700002)(2616005)(6506007)(186003)(26005)(83380400001)(53546011)(8676002)(8936002)(41300700001)(966005)(6512007)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXU2ZVRsSEFsblVtSytMdHBUNGErYWlxeGNPQ1lVR2xrbmI0bGVXekpHZnVh?=
 =?utf-8?B?c1pkdGxuQ2x0NWM5bGQwSExvNVM2dUgxOTd2NXJDZ0hqQ3BOMXZ3THlVeFBl?=
 =?utf-8?B?TE5NY2YyeDhNYlNEU3A4UllRdEVWdDZ1SHc1VEhEZXVXaWlwVlh6cWJ5Q1JN?=
 =?utf-8?B?NTRoM3R1K2wwSVBqejZrRVp3UWtIKzZCUGVkNllNQm9oamJYL3M4aFkvRzRJ?=
 =?utf-8?B?WThKYzhVbEpJdS9tL1pELzI5QW5lQ3ZWMmowcEpMdWZjaGI4SE5GbnNLZXVw?=
 =?utf-8?B?eEtoUmZQWTk1bEJ1N1lEV0w4eWNreWc4L0hsdmdkQmZTVGI3RVpteEYxN3Nn?=
 =?utf-8?B?eG54M2ZVVThsN01vYnluSEJxTFE1K0V4bCtJYS9YSG13UEs1bCtKT3lka3Nu?=
 =?utf-8?B?cjJ6WmJ1QS9PdHNwamFLUG0xaThJZnJaNDcxRXhoUFFldmdLS2RTTW81azlj?=
 =?utf-8?B?TzRtSU4yWE9DeVpDaWRhRFhCVmU4NGRHRDhYcktMcmN6QjY3bm1uSCtNQlpS?=
 =?utf-8?B?aStqTFZ3NC93UlJHeW8zWkF2cGQ1V0lDZHRHYWNEdTNZLzNLRS9wS0VrWG9N?=
 =?utf-8?B?VEhLbWJVLzlzaWZpZDVoTFQxVnpEZUxqbEFjQktPN1NoS3JkOStQalhuTXRK?=
 =?utf-8?B?SEdjSFFTcnhPdTA4RERPRmlQalp6UWgrL2M2b0RIUm9hd0svL1lXaExHems4?=
 =?utf-8?B?aXpMUFBORUYwYXdrdUF1d0xaSDZyMFhLM2RrTG02aU5LZU11WW9ZeTUzSHA4?=
 =?utf-8?B?ajd5VmFETE9OeUlKdGN5bUJvVEV2dTVQTmxJQ09yZ3VTdkRIRFIyVkl6dVlm?=
 =?utf-8?B?WWVEWGNjS016bVZDNzFsSk5jSWdwL3hlTUtvaHZ5TFNGcXVLczd0MktUK1FT?=
 =?utf-8?B?SkNXdGdmNVRWbVFYRkE2V0xhWmtaem54YWJEYzZZSUZ3VmxWY01UekRwdEV0?=
 =?utf-8?B?cDh4VFBNVTJHb0kzTVoySU11Q3NzZytzbGFRbzk5MURucUVLczVJV1hXUmgw?=
 =?utf-8?B?MVBGcFRFc2QrVzNyeEJxdEZMQUh6dm1ONG1UNVRUOXh3NDVaOXRKdnNya2pZ?=
 =?utf-8?B?dUtkZFFDUHVja0Nmei9TSTFsSUZuTjVGOVR4czJvUnZDc0hHemx1QXkzZUJi?=
 =?utf-8?B?aWJPdFBvS2JQMWZZZEdEeXd3aWt2Rkd0bTJIMnJXMzIyb3Z3WUtTemtIeFNj?=
 =?utf-8?B?bC80dHYrOUJLOEo0bE1BeE5iNzNybUNVZ0dwT3I3Z056QWNWMEhxb0k4RzJI?=
 =?utf-8?B?NWVMMFdSVlEwTG45T2hQcDgrb3Y3SmZ1eTRkdWFSUUlBOWUvOHVsSXovbkJ2?=
 =?utf-8?B?QzYxb2FDc0hjM04wQW9FSkdhK0hoWCtrNzhsakJpRys1QUF0dEQxcnVkN0k0?=
 =?utf-8?B?WjJJMXRzZzFDekc2eWk1czBlYkJodnJsWU1LVVpXT21XZ2EwQUtWK0p5QThx?=
 =?utf-8?B?UW9kWUNHN2x0Q1U5UkxIN1ZxNUhrdTBFL2VPSWFCM2tKV0g2VGhUd0VYN0du?=
 =?utf-8?B?TmpoYzZydHRCQnE1OGxFNzJOZjV0R0J5YUlYTlhmb2VWd0ZDMmFoV05Hck84?=
 =?utf-8?B?eGNHTzdkYVdVUnQ2VVZkcjBHdys5TnBuazR1YVdDWklHaEhBWHVmOW9nSXZj?=
 =?utf-8?B?WElDMStHY0xmc29OVnJhYWU3SXhuS3VGOW81dHhQYk1OYmVkeForb2lCOHVq?=
 =?utf-8?B?cWlrVm5QOWhLaVVaaEtLSFloSG5WSmx4NWVDUUFqZWpiTjlKakZJSlp0YXl3?=
 =?utf-8?B?Y0pVWnM3bnB1ZyttUTVObTBaWEI1YVhCVlV3Z2dHd2ZhUEpqR1MyRWtkVWsy?=
 =?utf-8?B?VjRtYllRRVZYbTM1bmVLRjZySE4rZUthYzVqalRpajdFT0QyajJnd1N4TW5H?=
 =?utf-8?B?THQ4KzVuOFp0a0d0WXRkQ2FaOW5EenIyRlo1Nm5YYzljM2s0MTdNdzRQQmhX?=
 =?utf-8?B?NThYbVhjQ2U1NXRPMVVmcFIxRUZIUWVxb3ZYb1VvTitGMW5QZ2hrcDZOL1g2?=
 =?utf-8?B?eDhvYm14OHRhQi9EaWZaZ0JscStWVmNsUk0vSHpwY0NKa0RUak43ZzFYbG1B?=
 =?utf-8?B?aEkwYzgxVnJGaTJqYUNFY1NSelN0RzdnY3VKQmE4blhXdzVaeFZIK085WTlY?=
 =?utf-8?Q?+DUyijx04hJQRGlC+kXcb2jRb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506f03ac-5127-4b18-a8e0-08db93fca745
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:35:55.1995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9eS/4o/mYaCizWOoRtURy/3V97m3Yueww5ba9vgAu9+kH7pmI8uarBUcugHVWsPkOeYVipI8AZsCY8EsDyb5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

On 02.08.2023 17:33, Elliott Mitchell wrote:
> Is there a freeze on that I'm unaware of?  Is there so much traffic from
> other developers that smaller output ones are being missed?  I'm
> wondering about the initial revision of this series not getting any
> feedback:
> https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01264.html
> 
> 
> Due to the lack of news on the first thread, I've done some looking to
> assess the feasibility.  The xl.cfg parser looks a bit jumbled.  Too many
> things are visible to too many places.  In general some pieces have
> really needed some TLC for a long time.
> 
> Note, some portions of this are semi-WIP.  The first 5 patches are simply
> overdue maintenance.  Not particularly urgent, but should probably be
> done.
> 
> Patch #06 is rather more urgent maintenance.  While it might not explode
> soon, that is a landmine.
> 
> Patch #07 is the first big issue.  The roles of the various headers had
> never been sorted out.  The underlying issue was more the contents of
> "libxlu_cfg_i.h" needed to be merged into "libxlu_cfg_y.h".  Bison 2.3
> may not have had the ability to embedded things into its header in 2010,
> but the functionality appears to have been present in Bison 3.3.
> 
> There is an issue of what level of indentation should be used in
> libxlu_cfg_y.y?  Normally the sections being added wouldn't be indented,
> but normally they would be directly in headers.  I'm unsure of which
> direction to go here.
> 
> Patch #08 seemed best to leave after #07 due to overlap and difficulty
> with reordering.  I'm a bit worried about the interfacing with flex.
> 
> 
> Then comes the issue of moving things out of libxlu_internal.h which
> should never have been there.  The XLU_Config* values should have been
> placed in libxlu_cfg_i.h instead.  Since I'm doing a thorough job,
> they're instead moving to libxlu_cfg.c.
> 
> I'm unsure splitting libxlu_cfg.c is worthwhile.  The resultant reusable
> libxlu_cfg.c is rather small.  Yet avoiding the need to reimplement the
> small portion is handy.
> 
> 
> Is the decision to keep in-tree copies of current Flex/Bison output still
> valid?  I would be awful tempted to remove them from main/master, even
> if copies are maintained on release branches.
> 
> 
> Elliott Mitchell (22):
>   tools/utils: cleanup formatting of libxlutil.h
>   tools/utils: rename "n" arguments to "key"
>   tools/utils: remove old declaration of xlu__cfg_yyparse()
>   tools/utils: enable all Bison warnings
>   tools/utils: update Bison parser directives
>   tools/utils: remove libxlu_cfg_i.h from libxlu_disk.c
>   tools/utils: merge contents of libxlu_cfg_i.h to libxlu_cfg_y.y
>   tools/utils: Bison: switch from name-prefix to api.prefix
>   tools/utils: move CfgParseContext to top of libxlu_cfg_y.y
>   tools/utils: move XLU_ConfigSetting to libxl_cfg.c
>   tools/utils: move XLU_ConfigValue to libxl_cfg.c
>   tools/utils: remove YYLTYPE definition from libxlu_internal.h
>   tools/utils: move XLU_ConfigList to libxl_cfg.c
>   tools/utils: introduce xlu_cfg_printf() function
>   tools/utils: move XLU_Config to libxlu_cfg.c
>   tools/utils: move XLU_Operation to libxlu_cfg_y.h
>   tools/utils: move setting free loop to xlu__cfg_set_free()
>   tools/utils: spread xlu_cfg_printf() over libxlu_cfg.c
>   tools/utils: add pointer to in-progress settings to CfgParseContext
>   tools/utils: add wrapper for readfile()/readdata() functions
>   tools/utils: add settings get function
>   tools/utils: break flex/bison parser away from main config file

Some of the patches looks to have been posted previously as a 7-patch
series. It would have been nice if therefore this one was marked as
v2, indicating in a revision log what the differences are. It appears
as if at least one out of those 7 earlier patches was dropped (or
maybe assimilated into another one).

Jan

