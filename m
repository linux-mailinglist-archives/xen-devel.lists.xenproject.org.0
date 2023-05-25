Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C7710C5B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539574.840600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AOy-0003Nc-F2; Thu, 25 May 2023 12:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539574.840600; Thu, 25 May 2023 12:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2AOy-0003LP-CF; Thu, 25 May 2023 12:49:08 +0000
Received: by outflank-mailman (input) for mailman id 539574;
 Thu, 25 May 2023 12:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2AOx-0002yP-3o
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:49:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883dd781-fafa-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:49:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7307.eurprd04.prod.outlook.com (2603:10a6:102:84::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:48:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:48:36 +0000
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
X-Inumbo-ID: 883dd781-fafa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaWTopFuOrzF8y7FA2XjuWV5BlzOC0P9fbohT6b6//I2bmYLuVtZ8hJ/sx7MWbxhOYBVlAhEKTh7ksw8Yq2yk8wurtDgCLSEI9SVm4AjU6+6G5sCgWataJ4NHeA/Zng2U3pJIo3mv56KGbxqKcCyvkM8eySZcINjYd3qc3H+HKgHLof106A9yB2sb66NshqGWvhvNllB/CohVhDwETwF+3DdmCLkaMi1tlAiKNMi5E3GSQdZCqRnTQwxYtgMOwccJlwyi6OqYcTRCu0RfEeBybg4Fq4glCHXItkk3MZsPSnaakHN2Ev46nrbqmuQyoGtys6gAYZbwD23/xarkJZc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0vGmsTjxn+2fgr6wE3651FgBj6ujZMA+pLxHCcRnUo=;
 b=b8rplEC1HTyAc0y3oFPK80kCQcNJlHWRHuJ03yVQAB2w1BThlRyK8iHgPqTER2MjqN7JN+wvmr5ahfr2644NbLnguu41mqbpSMjT3Y6H/zGCCWLbsCapPOXoesynVCqEHA+EaxglUW4YDvuAQUuftvjimIkGjbAbCOk/slXxixINEPmTpZ84cPXlEzPxz2bpi91i0ifcTy5YMTIzN2sj4GbuHHU895sZJut3cJZgb2/Z2ZnDpGI3S214F8GPzjKeu1VWl4nSIzczB8iblvX1cGWHU70JjpZ5T/Ig9LAtLReNJDdTzAp+P7h1E0mX4AkI9h5L+nqIQA399T2Pd0xG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0vGmsTjxn+2fgr6wE3651FgBj6ujZMA+pLxHCcRnUo=;
 b=qk85TDNnUO6xhwf2rK982tfBHIBdXtfxCWxoH/aJcCt6yB+8aUabEThC57gkhFSpmP349rsOF/Kx0N1jNxY8dKjYEJSJaMddggOerqOvQ5Wq8Gwv+45/NPOlIwiXKygErRTAu5/a4JBlEr/WFIN0vbZHbM5BdfwKH36dA4bIcLWxPMwtEGG1n7KojLOYesMKRrWm9j0pK2ImbLJKxcc6+2HRcHyLe79NnzekiZhhP7hJyazvc4hmmWEcQ3QDwEkIsyA9uAMD59z78T1x1f4PppWXaq5T2kNDcHtkJLpc3TSsg0jQLo8TkMUz8jzVKnQvWBVWaMevbysohW7oR8UdlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d36011b-1815-6e02-0c05-b2b7cf35a722@suse.com>
Date: Thu, 25 May 2023 14:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
 <f04c4e98-84b1-acde-5acd-2f5e18f591d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f04c4e98-84b1-acde-5acd-2f5e18f591d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: fae0504f-b88b-4539-bd67-08db5d1e5afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnAF+cz0+xyPvt5vn2NusEloC74hHoUb9ghu+3yCKxqQFGLqYg17T27tX/NDwEUmzpzi7+Vwiz1EuQSaQ5Yfqh4NmRPXrwWr1VnQeEP2kHsC6Rz8JNyUf6XChMjps6Ffkkeu0rADxr9Vkl4r2gYYfQ+U1RWXNXDKyi1OgcIn84pF2jY1U2pBXG6tye80zUrROhFWqVjUFZB9t6/u26mkW4SIb/xR4e/y57cnWrEUPx4lAICbu96EnstGEM1K10BuH811epIVzLUonXE3QYbBcCO7zEgL5O0u4MhdfgQF/DOIgjmjc6Um4wsshfpnXEvL9oDGxpbdoOida4F8WAyHchyrzQk5SI2TInMY8xXF7CB4reDrG6LYQHZoE/M8ZnBmINRsBDpR8l75DaKly9mXYy9kMmqNZRFsRliKhmm7j9YYV+G4CbbiSwHIhIhQsvsXzvocjLnYcPjdf8uYV3joA7d7HUewL3BV0qmnjp8e2BYvHMvOOT07wKBR4o+Ujc+YN7v/ecao6Lvstf76rxeDR2mEScjcFzgohW/snnf1I6Uui9kcPDrcD6jULjLDOSuJLBRMiTz3isw5y3Qy+MXy2WlVsU4q3y66j1xIwfwVVN9VWHYcsiH9jIkpMJHXewc5XUZFRYz3FfFbjRLV7qf6sQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(6486002)(41300700001)(26005)(6506007)(6512007)(8676002)(8936002)(36756003)(38100700002)(5660300002)(2616005)(31696002)(2906002)(4744005)(53546011)(186003)(86362001)(6916009)(66476007)(4326008)(66946007)(66556008)(31686004)(54906003)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEEzYjRkaTMyK1dSYTFhNzZCSWpVKzlUL3lnL3RYS3U5ekpRYlJHZGpXc3pn?=
 =?utf-8?B?cytkMXM0RFFnb1NreGxtRm5YWmh2ZHZscUYyTjZkUE1NMzVsemtwaytTVVhW?=
 =?utf-8?B?eDdueks1M21XNzJ6Z3NRWVN6eHB6dDFBaXoydS9aNTI5OUl0SGQzT2ZDMkN3?=
 =?utf-8?B?UmcyVHArYVRzTVVkQUIyN0NqMXM4YXNjR3E2N2ZxUEhvWFJ3dVVMZVpBZVVK?=
 =?utf-8?B?MXBwSmg5bzRhcWd6cEpFc2dnbkFxNitIekRqODExajNGU3B0ZUozYUJnYUht?=
 =?utf-8?B?bDhXYnRQMnlaTXJ3RlNFbGNuVWhvUWtWTlEvcmFnZHRTSXZVZVVocUxNZFJq?=
 =?utf-8?B?a3ExVVJMYmVUUUtsWTcwY25zRHdsZDlRY09ldzFQcXhjVXNmakREdUdHaHk4?=
 =?utf-8?B?MlF6Ym5sTVphTGlTK0pKSHNpZHptaVo2RGtEUmFwRXZtTkZEYWxYaktTUTAv?=
 =?utf-8?B?Tk1neTNPd3Y5Z0RFOEJtSm5iSDdyRDNhemx5dzZRWnp2aW4vc0JVSEtCTElK?=
 =?utf-8?B?VkFBSkRRRmRJTkVYUGxLU3JNUUtSb0NDcGovTEltbDd6R1NrS0p1OCswM285?=
 =?utf-8?B?SCtkZjJ6U2dheGt0dkMrbFRuRDVaM0hQSndXZ25CQTdnRUtoTUxVZEh4YnBV?=
 =?utf-8?B?VDNmdjBMSVNLR1R4VTU3VFAzc0FmcGJkNEZXQU8vbGYyRS9QWGkvM214OEdS?=
 =?utf-8?B?dnQvM0ZyNGVMeHFlME1aN2h2Z08zckdjMmhpanVyOHluTW5Mc0I4QzVjUVBv?=
 =?utf-8?B?TXFOVWRoaGNBaW1NcWZFbDBGd0VwcExDdklEZ2ZnajJud0g3MGRVUHFNb3ds?=
 =?utf-8?B?YUs0Tm5rc2o5a0dqYW1UUWU3OG95RFlpT1JUVC9YbFo1aVlKand3UzU3cGg2?=
 =?utf-8?B?bFV0UGRrUC9BYnlSTVJWRDlOOVJPcU91eFlYZlBMV2Y4WnNJVUMxMFBuVWti?=
 =?utf-8?B?a2Z2UUJwQ3BRTEhIMFhyUS9VRURpYkgrbXkxVFROODJDVUJyRVgzeHh3UUxI?=
 =?utf-8?B?eHdnNzZaVFBQazhzY3NHMDRZcmZwVkVnK3hJVHgxTEh1eXc1dW5EKzlzMDZi?=
 =?utf-8?B?a3FXQ2hoTDlBUmxPT3NkMDkrWmVjQjZSR0NORU1hdHdxTXBtdXhmaVFGc0ZD?=
 =?utf-8?B?NTJrMkVCQlZxV3EwRDBVTWgvUXlTajNaVXYvU1FiSTlLdjR1dmlFckJZWnE0?=
 =?utf-8?B?UG9XSkVaYzZZby9kaW9OUjZObUZ6azc2aXVQTEhidzE5N3AwQXJQb2NWdmZQ?=
 =?utf-8?B?TGk4em1JNWhrTjAzUUllR2VnTGhWODQ3QUthZm8xTndUUW9Sa3pSSWhkQXBI?=
 =?utf-8?B?bXFUOTVJRThKNGVmYmU3Rm5TU0JpR2V3STJZaGhNWUcwNDBiL2IvT3hJRTg0?=
 =?utf-8?B?RXRCV1dSN2xWQWM0ZDJjc092eityUnBaNmdld08zUmFTWUVZMUV3eEZrTHVs?=
 =?utf-8?B?K1h6M2hlOUFqRFM0cWp1ZWc1S05xMTVhTHJpa3gxWXhzcW5PT054VjJHbkVu?=
 =?utf-8?B?K3RiZkoxZ3JTcVVjR1lQSnF2cDN6QzNpcW5JZmYvZ0RpeHVjU0tmTi80WW1u?=
 =?utf-8?B?Mno1enBkMis0MnN5ME5wb2Rtc3l1ZGFXc1FyendvdmkvNUxKc3FNRWtWUUxD?=
 =?utf-8?B?UkpEOXlHbURIWG5NUEhRbERNeEZEaFcwYVYvRHNzZHNKaStyckdwbXM5eVNo?=
 =?utf-8?B?dCtraE04Z1FMbDhGRTh3Uko5ZVZEVm9aTUVLQ0VOWndYbE1ndFFCTHRkRkRX?=
 =?utf-8?B?NjFvQTNUR0k0cTMvWlhvMHYrZUw0dm5QeFdLajFpSnBURWx4ZlFkbi92VGFa?=
 =?utf-8?B?TGJoVzlpeW5nVDFVVC80ZHhXV1c0bFBuTTYyRHdoZlA4Vm9ScUZndHMzaHVr?=
 =?utf-8?B?MWRBYU9ZQmcrUXdYOG1Vc05tWTZ6aXM0bm5HTE5WVG1IMXZVSHRxT0FKbnln?=
 =?utf-8?B?RVh2VUxwUzZ3T3pJUmpCOGJsNTZJakpRZk1NdVRpTmEydHZxaExvb2NqWWtK?=
 =?utf-8?B?cmkrVG1hTzJ0TGdMZTl6N0xySElLa2ZvM0FwaUYwd0dPNlp1eXR4QlkwaDBq?=
 =?utf-8?B?bUx6dHNOZng4bmlkUk5kYm91bE1STnExWVRrOFQxWFY4WjRBVXExUGg5eHh2?=
 =?utf-8?Q?h7+nyNGs6RdL71IFpXoZTOvns?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae0504f-b88b-4539-bd67-08db5d1e5afe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:48:36.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt0KfU3uSHb5e3ok2SGpT4v2jnuExqHS01fK/zE8vuTxCe3NpUVej3fA0K8HT+cmFIst5hcthT41JwyOoJMg4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7307

On 23.05.2023 20:14, Andrew Cooper wrote:
> On 23/05/2023 5:38 pm, Anthony PERARD wrote:
>> CFLAGS is just from Config.mk, instead use the flags used to build
>> Xen.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>
>> Notes:
>>     I don't know if CFLAGS is even useful there, just --version without the
>>     flags might produce the same result.
> 
> I can't think of any legitimate reason for CFLAGS to be here.
> 
> Any compiler which does differ its output based on CLFAGS is probably
> one we don't want to be using...

Well, I wouldn't go quite as far in general, but I agree for the --version
case. Actually at least with gcc it's even "better": I've tried a couple
of 32-bit compilers with "-m64 --version", which would normally choke on
the -m64. But that options is ignored altogether when --version is there.
(Which has up- and downsides of course; the command failing might also be
useful, in telling us that the compiler isn't usable in the first place.)

Jan

