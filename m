Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6472939A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 10:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545660.852161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Xlx-0001nL-Vr; Fri, 09 Jun 2023 08:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545660.852161; Fri, 09 Jun 2023 08:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Xlx-0001lc-Re; Fri, 09 Jun 2023 08:47:05 +0000
Received: by outflank-mailman (input) for mailman id 545660;
 Fri, 09 Jun 2023 08:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7Xlw-0001lW-8Q
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 08:47:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33013df1-06a2-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 10:47:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7890.eurprd04.prod.outlook.com (2603:10a6:20b:24e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 08:46:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 08:46:57 +0000
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
X-Inumbo-ID: 33013df1-06a2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXoFrJZTsbhYe0/9NSH+0/Aq4egnRVW7JO8lA/YTFoXQf7qWocbnnQ4+NkI/cdPzzGJczE9cdx0FmDwyGX02SYdux8obgYvOBV2FuQ9+aGIl6N+VAMDhMhCCtS3/FLZT9k95PNR/1SSkKOURM2+IpALt767X0oQ9N823ohLmeBNM2ZqTIxqzok0B0NIRMl0lAXrBKujYxLXgwwiqWy7Q6cwYc6SwmZ6D0K3U4xdOH94sqqH4CtEz+zYIWVC6P3I8t4IWHAs3GOEfSZdo1vGkqHBD9lLBou0py3jnu1OYQB9/d2+8iVKGosTItlrFH49BoyvO0Jf4j6MdT0jia90srQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3Z4MVVfumThxoDxqxipl3niLROoLu8PrxF0ZfFefZ4=;
 b=I2JNe3amJwgRUOD4VOXmzQr6tALwXLuKeOQRR7pwgMVSF9DIA+Rd3qH1vY0WqDqy0X7efAGG2tGcH2vNExK83Yhpz+lZ2yEswqiZ1bkgy4J7KqSAjGYc7QGwikeLpoCRHDCjyUnOfjjZCtvNSZSxpXrAv3b605EmtkrzuKWV6JLSmt/GbdfXbf9wcO3FiQIwBUzauvHnkaBcxwLGtPn3Sq8CgTL/GWD1wQVqpWkmqVaVRIWLxZKiJQSG/gYQ7Jk3pmGderezF+jAixdN07U94oEfP/OTdRAgjYk0Snwfz6GiQ9ITLQqn/wZCyIrflqdzZ6Hotclvo3IkROLiJOTyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3Z4MVVfumThxoDxqxipl3niLROoLu8PrxF0ZfFefZ4=;
 b=avfhfu4Dixmub39I9NQET8a4iizhfgG1gb2WcYgtSPPQ5uTyAiCa+QGCtny0Tvd8x5F+VJjLqqKPuIWecyT6Uf3mVj+lecOepERoF7d6SZYBD67sgQaV9C/hnWqlw+NeS+7Dd95B4bE6I7wkRTHpp3/ztnVa40I34yzf576HNpNgZvzWQd5T0pcDrUQGhvY7JUtreOJdACnIu6WYyFcENPgs3k2j6hh+5cvTS5IoxJoZQpt5XvVab80gYsrQdGGwD2wyNpUJPEqVc1uOKS4+Am77Enwl7U9m5RHOY+UPsiurjd9uZqT706IdZ9jKh2LqpxlQc9Ex0hgrbKZp30WTeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
Date: Fri, 9 Jun 2023 10:46:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/misra: new rules addition
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20230607013810.3385316-1-sstabellini@kernel.org>
 <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
 <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
 <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe2852a-e042-438d-7475-08db68c61544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TdwIC5nGdE8r4JEJWCZhi3UmjjfldbyHF2Hgyl0IlY5I8CJLDHKMqEFPfWFcLCawh79xpOm8SOd/0qd3WFaHsWIyV9DyczlK8lgkPXJ6HFgfcOcrIq6osYveHh6iuVa1tV2KRLMG6ljrQYIGUi40Ch2O2zpNvCxeV2pvpphVzm6XMib4s862a+TNntpZw69gCk4huXdB8vVT0Wn1YuI5Bdrj+HBnISwL9Ff0c3Q81bSdriTY6/rO97Q+7/zx4zZPAQ0SDhJu4u3f3JTXZ48CEc6A5Oj6lv2gprNfEsSVqDZEdxD16vUcs2+nqFUmFRmYFq7f5XonOnto4V8JFFS14TJy3/WlIE7ap5gVd/6aRzwE1ubm7aHnJI2o0tSQvUMNYqCB/9V/Ho8b3Ycm0V5l8mebOYPd5RbETXQ05Vh84UJWY2+CzDsh96jRuSHJmZsj026YEGxUi/gHTdMv34YkKowoumPSLizzRKCP9h3G4wSWWr06X2IVzXSPy/Y5iCYWwN5MO+F26ZtoRvDOTBzJMddLlI8D7040KDH+QjD1QF6sGhneMxOBS2nZLlBVuKb5uf+vPJ7eu7CbpMa5rSAgE8rQuPdhbjH3cTicZ3kbEKGwYZhf8rpxb9ihwf6ZwimTHXTUuRvCfIjeyKIgE6cmLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(6512007)(6506007)(53546011)(26005)(31686004)(186003)(2616005)(83380400001)(66899021)(66556008)(2906002)(66946007)(66476007)(6486002)(5660300002)(8936002)(8676002)(86362001)(31696002)(38100700002)(36756003)(54906003)(41300700001)(478600001)(316002)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXdwUHBscVZ2bnY5NzNNQzV5Rm5OMGxJaDEzdlRRV1RoSEMvZG1ldFgwRTlK?=
 =?utf-8?B?WnM2eTBDTHdsMmtZUjdMYUtsWkJGZ0pMTmVONjBxWXN0cndvM3FaU0o2Zi9D?=
 =?utf-8?B?RjZxajgyNUdoeXZka0M3b0RVU25XSGxEeS9uRStRcnR1aks4M0E3dERJS0Yw?=
 =?utf-8?B?VGNWRnJ6ek9jVXFSTkVNTTJXUFlRclpmVFdZQ1hxN1dGK1QxR1NKVTR2c3VR?=
 =?utf-8?B?QTBJUndDNHNSQUZEUGFhNTNoZjJCUENyL3VlejRMUkxBSFpKRnIxM2puSU54?=
 =?utf-8?B?OHo3Q0FtNEVSL1JWc2d4TTJuN2IyOHlYRHRVUU1Ca1dFNUFwamRhcnpEdXo1?=
 =?utf-8?B?UGltWmx0UGpDaHpGMHhjVFNQcmRqRzVVMG5iTXhybkhXVHpWSndNcVhUa25V?=
 =?utf-8?B?Rzh4bDBRZmRpSlViVU9vc0V6ZUxaWnpyVGhzQnVVeWljQ1ZheWtJT3BTSE4r?=
 =?utf-8?B?cnBXMXdKRTdEbUhWUkxFdXN5d25CNkIyNGwyZXZreHkzNjEwRVk4bTFTMXhy?=
 =?utf-8?B?ODV4RDFtZUxnVFIrVE5FbkJBVENocWpTanI1OFBoQ012dXc5RFJtY1p2emhm?=
 =?utf-8?B?ZUJhc2FDVFpzb3BRU2pBNUEvN1FXTzVNR2ZyT3RiaFI3enN5K2phaHE4NzZ6?=
 =?utf-8?B?b25IWjIxeDJ2QWk3WnZMUlI0QlJwQ3pWTE5qbXJ2SDJKRkt1L0doK0ZpSmt0?=
 =?utf-8?B?bEk2VWR0OTFYSkdGRjFRek96eGlxVVIwYUJPTU43Y0VZRXhIVHhNRGFoNHJN?=
 =?utf-8?B?dTM2UkhDNktWSlg3SUc4Z2dSeTd1TEY5ZWwrSWZpbG9tVXNQMGRXM29sdkJl?=
 =?utf-8?B?UjkrQ3pFdFRnamNjOHR1clNldzh2Slp3UUk5cnYxWmlad0xMUUtZbndNY1U1?=
 =?utf-8?B?TmNrSlZLOWovQ1EvcWJYZnlzNmtzQ2RHOGp0KzRDcmY2aUhtaEV6U1FNTjdW?=
 =?utf-8?B?K2lodE5uS1NtTkt1ZlRpOEJraG5WVGlDS1RZc0hlMnRrdlN4QzVVZlN2ZEUr?=
 =?utf-8?B?dm1kSzU1N05jL3JINUF2MTVkazlQMTl4dHoydVlDMXhSbmJTMTRwTFE1VGZH?=
 =?utf-8?B?L2VNUm9TOSt1eG4vUUREUlpaak96ODhEdGtUSm9uM0oxMW55S2xyNW9VRU50?=
 =?utf-8?B?MnpISHV2TXNiUjBWMFczTytuZm5sZHVISjlDbXlVK1ZDdmRLdmdra3VGK0x4?=
 =?utf-8?B?cDlIYlJCTDJuSldTYjZycXBURFBZZ0E0c2JsRzJTOVZVWnRnM3lGRy9iajVy?=
 =?utf-8?B?c25rUW5KWExTczJNd2tTbVErT3FYWS9QZVNmb29GMlU3YTM3SmF3Tlo1Tnhr?=
 =?utf-8?B?YVM1cHY2eGtiRWVReHk0djFSTzlWOHBhTGZUakVwaWlDOEdDanFWQk9jZEl2?=
 =?utf-8?B?WWR0YzJIUWg0L3Y3R0VOcHlBZ25xTXR4M01Gdlk3SGNSdDRyZkh1ZmM0SVdx?=
 =?utf-8?B?V0FNM2NlTXB1elpPZFZkcFNzclhoMC91dFFLN2o5OHlJRUdZUTg0QUNxWnQy?=
 =?utf-8?B?bUlFL1ZnSmpJUjJubDBLd0gwaHNORDIremtkazNoRDYvaTJoNDhHZTNXaU9t?=
 =?utf-8?B?MkFtNHdOU09LdHN1dmhoN3JNMmNTSm5ZNHpYRWRKSGtGYXd6WFNzQmlrTW5j?=
 =?utf-8?B?dnJZcmx5d1JGZU52cEtUWmxxVndJMWVrMEZBcDREQzJNdkJsRmdPbTViaWFy?=
 =?utf-8?B?S2xaR3JLTmE0QWkxL09ydmI2N1FyMzM4WE0vcWVPYjZBL1VFY28wdG9IY25n?=
 =?utf-8?B?UlNtRDRkQWdvejUvYXlDWkVSU1NWdXBOQ3VGeVRRZTFWcGZPZVRrRFBpTUgw?=
 =?utf-8?B?bkJSYzhFeU90L2d0blFPbmJvZnZzYlNmczdobWxsV25uUWJQbEhYRTdIMXdF?=
 =?utf-8?B?R2hXQW9xQXFhdVU4WjdWK1ptMWxaVXVpdnV4ZTdxaUZJdFVYWEpWa3VDdEMv?=
 =?utf-8?B?M1kxWU5YTllsL0RjMXNJL3RTTGVnTlZGcnNxUDJicmRENk1qZkRlNm5PTWVR?=
 =?utf-8?B?WTU2ZndwVTcwMW5mVDNYQzRBVzJ6TjlKSG1NakhSSVJwelNUbFRVTTN2TkN4?=
 =?utf-8?B?QXJrY2NuT1JDSkZoZjg3SDcySFY0OFBzbzhDR1Q3QlhjVTRFd00rSk5VZlNl?=
 =?utf-8?Q?p2wOLhZqLXw2OinPUec7F05gk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe2852a-e042-438d-7475-08db68c61544
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 08:46:57.4353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm3hwZ8CH5L/zT/VNHWRI8ZKf0MpvnqPADwhqaRHKV0mnbWCeKPLj5n8n4mB4MXn7w7F/jGJ2eaXqi+33N2bxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7890

On 08.06.2023 13:02, Roberto Bagnara wrote:
> On 07/06/23 23:53, Stefano Stabellini wrote:
>> On Wed, 7 Jun 2023, Jan Beulich wrote:
>>>> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>>>> +     - Required
>>>> +     - A typedef name shall be a unique identifier
>>>> +     -
>>>
>>> Considering that the rule requires uniqueness across the entire code
>>> base (and hence precludes e.g. two functions having identically named
>>> local typedefs), I'm a little puzzled this was adopted. I for one
>>> question that a use like the one mentioned is really at risk of being
>>> confusing. Instead I think that the need to change at least one of
>>> the names is at risk of making the code less readable then, even if
>>> ever so slightly. (All of this said - I don't know if we have any
>>> violations of this rule.)
>>
>> I don't think we have many local typedefs and I think we have only few
>> violations if I remember right. I'll let Roberto confirm how many. This
>> rule was considered not a difficult rule (some difficult rules were
>> found, namely 2.1, 5.5 and 7.4.)
> 
> There currently are 30 violations for ARM64:
> 
> - some involve a typedef module_name (in the call it was said this should
>    be renamed module_name_t, which will solve the issue);
> - most concern repeated typedefs (UINT64 and similar) which are repeated
>    in xen/arch/arm/include/asm/arm64/efibind.h
>    and xen/include/acpi/actypes.h
> - ret_t and phys_addr_t are also redefined in a couple of places.
> 
> There are 90 violations for X86_64, for the same reasons, plus
> 
> - another set of typedefs for basic types (such as u8);
> - repeated typedefs for things like guest_l1e_t in the same header file:
> 
> xen/arch/x86/include/asm/guest_pt.h:60.39-60.49:
> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
> xen/arch/x86/include/asm/guest_pt.h:128.22-128.32:
> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
> 
> The indicated lines read as follows:
> 
> typedef struct { guest_intpte_t l1; } guest_l1e_t;
> typedef l1_pgentry_t guest_l1e_t;

So this is an example where I don't think we can sensibly do away with the
re-use of the same typedef name: We use it so we can build the same source
files multiple ways, dealing with different paging modes guests may be in.

Jan

