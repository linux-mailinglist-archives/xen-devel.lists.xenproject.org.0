Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E295B82B8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 10:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406848.649235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNXs-0007iW-7x; Wed, 14 Sep 2022 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406848.649235; Wed, 14 Sep 2022 08:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYNXs-0007fl-3b; Wed, 14 Sep 2022 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 406848;
 Wed, 14 Sep 2022 08:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYNXr-0007ff-7f
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 08:14:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fc74c16-3405-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 10:14:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8752.eurprd04.prod.outlook.com (2603:10a6:102:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 08:14:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 08:14:52 +0000
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
X-Inumbo-ID: 4fc74c16-3405-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My+DdoCOmq6MTtDgtUKUhitdp0ZadFx2Q0qdtozfHFZ2hQdoVEgc0XGsxTjIbFnN3Bk/8Tc8FYcrqqeVv27aZsX/rzwwiZSXJxHEMPfLYI464dlbN//X3ASwqPulOhX1zmIJRTvp/GxopnIQ3DNrjfvH4TwmV8k8s+/uoogDpvnGXcqyqHIc9WRXS8DLggvkbuanDv3+BMXY0DDpvNf/eKH5VLX3Jjj1MXr1oSqcEa7v8yyrYLIx/GTyziE9nUTpe3C/FMghaqgozPAnfJHHh77G9aHb3uSViiSQCAjouSqubQw/VfHljocbC0NDsOIkK0sxIoSo6G0D99/Pzd7euQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbXj8ibR//i39icqs8mySCSafR59HRZF90whP0u7nws=;
 b=DKS/Tnn13r1LcObfl/2oLDgfTyFgY0p3w45ey2UJd9mSqB/i1OUydiWWZo104agw5hrHAYJndxLDmYZWFL1SJadr3n6/AmK/W1pZd6mIkTQxbl29LTBlySGvNQ4XqusjlQQ4Sh71aqW3ig71IVQ+FYIUvBEIkofDVUmXrnJwSen9m6r0BZjFFn0yr3n3uFw5tb6YB6FvteJ+MD6FBHO/+h/rpYOSsetKHXBIksbonznhLZJBFSxeeBY0CgsnCZe9qu0Z1Z5qqSaKHgZ63dffe2+njwJ/c5/Nz6AR/0RkBS4+7/7KvQTaDst/fuDxaJEQoVw+amCSEal0Fa/NsslB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbXj8ibR//i39icqs8mySCSafR59HRZF90whP0u7nws=;
 b=3PZ0l6e21i6bkjEWoNMF/hpBozDWRF+0QkLBmveOtbx47d6ZUZykq1wdGhdc13LuefAtDIxHfbcPraBiZT2Pt3dzsd3JMd7ZrTVW44b9n0YCeBhnHuI7jUKkj68Wc90CWa3XPSDHSuKdgi/x0FO1hrF/5ECU/DUXnjxQBhv7/PDhP98SRWX/zSenz2hJJKIo8viNbi42wnIv0yxM82TQ+rZJVgkoh2ev0L/nZIlLmwmP5qkVdcM/QaXPCU5dXeqI4zlfANhEnEPvvwj//eqd5Z9/gF3cJLz3+HvqZ8U7q1s/y8QMoaTsebi9vh9xM8shuaHCXkbVSzR3ct4P/4EZPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
Date: Wed, 14 Sep 2022 10:14:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0007.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: f0031182-b0b9-47cf-58cc-08da96293334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vKFpm7DinFjAlHWrZJjFj2T6UvPL65o7C61IiFFKSBk3k4bjU+BGyfon6phEc9HjEyn9C9HoYGxhpNPoW7sV2QVoSEuxu6B8RLWotrA4/mI6w6AVdfmZW9nAyz6JKH5fERC3L0R/O0HvRasa38GiCpw8vXTeXdMPYtYhwh0WZVV89Ent+B3srFiqxh/gUs/X427Yc0Dx57dyR6rDvTNPIGpjhFtV9Gpjg8LFGU1elr68x1qxxad8RBqUQ+I9EMNMvB30+11xUNTcz4bPwy8s5wIpNTWsYvaogCsuo/NUwyNYqTwDMvIazqDQLfetWV7E20XFtTl07n1NHRC6BMiaS+GA0WNQI4HAGkJS0J1g7XsgOwxehw0g/KeQcpNvKE7IibJQM0O2Fp2WWdi2JSNX7nnM+yaMNG9NRNgS2F7F7epZOxFoi76O6Z7udLPwx2QU0EK8CPxpyW+RAnhUEu7By9vB+v9I0Ime75Dwp6FItl18zouqYxd+IPJi5cW62czJGgj9b3KYhZNJLRBVhPe7OyjhdFVvebro8BBubcHPOimQw4ZnFgCVEfy6XW2jKrPl0crNFj5U2g4JchaY75fjKs8YTgBvJZd0ig+iAfcB4OX76SPirBJaiB7C4DNbKEoDApOkgAdgBi9dXXz5gL0h0RDclBStzuXrDt6zJ1qPFNbrTbvL2d69tdvBEuq2+7QXQrPp/oCgMIt5ZZDsC7d5A+pyVYFv9RdyV7erVSir3Bf84tkesl2pB0BD6RKnQCJuvz9Uy+IR5rPTyMiGTdp3ESznQE0gYQPgN3TqMVsuO9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199015)(41300700001)(66556008)(36756003)(5660300002)(8676002)(66946007)(83380400001)(54906003)(86362001)(53546011)(6486002)(316002)(6916009)(31686004)(31696002)(26005)(8936002)(2616005)(66476007)(38100700002)(6506007)(186003)(4326008)(2906002)(4744005)(6512007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpZL2d4YkQwbzdXbWh3RVdOZDRkQmtjUGRlaFF5UGRzbmdQVU5hSmltc0Z3?=
 =?utf-8?B?R203eC83UkNOZHpUUXNwZldYVzIxMnpwbVlzKzRiMFo1cWROVnJiQzg1MDdY?=
 =?utf-8?B?emFTN21FLzZBb3h4NTRMVElQQmE3MTFoa3NRUEFyRUM4T2xkYVhkWlloQU9k?=
 =?utf-8?B?V0Rmdis5YjNhRGw1RUlwMGxXL09xK0tSYk1nUHlkRGVub24rTWZYblovdDIw?=
 =?utf-8?B?Ny9zVFo1aGk5SlppM2RDTUVKMGxSWUk4OC9KWlVSa1NEWjlVOWxNTHlJNk1q?=
 =?utf-8?B?amFFZ05Mc0pUTkVaUHp1ZjBvYURpOWx2bFFaNU50WkRuaDA3Yy9Pa3B2dUNp?=
 =?utf-8?B?VGRpT1pXakpuTlJoMTJOa0NYTnl3aHUrTHEvbUx6dHUzb0dITDM5RzJjMGhu?=
 =?utf-8?B?UXNPaWg3YnhrU2M4MlRhWW5OMlIzMjNjdGNKQUVaOHZtZ3ZCdTRiQXJTZVhZ?=
 =?utf-8?B?Nk54N2tKMDJaV0c2d3hpV2svNy9tN3UrWVRGOHlHZ2F4KzJsU2NDd05GMDNU?=
 =?utf-8?B?QzhFRzErWll1TEpyUVR2M21pSzBYbStXd056cVhielRkMXYrOHFOSXFtRjJE?=
 =?utf-8?B?aVlEdDhJa3NrSTFwZE90Y3NjZWZYRHl2cUZtRXRBSzB3cVBYNUlYRmVzQXlN?=
 =?utf-8?B?dEJ4aWJoRlE0RkRnQ0RTQkV3Q1JJMkhLU0lYVkRtMmxjRU56cjEzV0I1NG1S?=
 =?utf-8?B?N205cDl1QnAxNlpOSEVNNm5YcGpLcEE1SkVoWkw3OEZDTTd4aGgwak1GamZx?=
 =?utf-8?B?RlE2WlB6cEZJQUFlZjJkeWFKSHEyczE1L1pMZ2QxYlJUY3lTajVrTVlXaS95?=
 =?utf-8?B?M003cFZySHBlTmY2eDB0dE9KWlJxdkU5RVc0bWpUMEZoa1JNdGM1WEg0a0ti?=
 =?utf-8?B?R2ZzM1NXUi83NFgyODMzRUxxSnM3cnl3V0EvSHhWN1RkSUdnSGY2S0YzZFNC?=
 =?utf-8?B?YnI0YVlEcjNuaWF5bGFKMkxqTzl6Yi9nTlpOOGlyK0VDbEVvbWsvWEU3Nlcw?=
 =?utf-8?B?L2t6ejdHbjhyQlM3NmhrUEdQZmorSlE4RnppekNuKzVMeTJvQVd0UjJkTnZB?=
 =?utf-8?B?WEVmR0dVQm1WSk0zUDFSREE4OTBsM2gxejZtWFpFUjI5aHRxNW1WYjA4Q05Y?=
 =?utf-8?B?YmFXT3FZUnY1T3NzcEhNUWJqQmxyQllIazlGdHhKS3ZrZmdBR1BsOTNqeVo0?=
 =?utf-8?B?UnNadFJNems3eU5CZlk3bDRtUG5VWHcwZGtyajc3ZzNTeHVDRllsMnA3dTdN?=
 =?utf-8?B?QW1oeGZFYW1kdm1lYnBGY2NOMk5ta2pxQ1dvUE92S2FUcTRuZEd5S1EzTndi?=
 =?utf-8?B?amVtOHZ6c3lUNTRvVS9ta2RYWjNQOWJVd0JHVEpQSFhreFE4QUdtOWNxQk8x?=
 =?utf-8?B?NjFVK1pXOGxwc2JkdWk4S0hrRnJINDl0TWw1TlZrL2tQemtXN2lra2VFMjlE?=
 =?utf-8?B?cmx6U0F4VEptc2cza2RZUitaTWo1MC9pdDRqdjBqdml5UzNTREJUSHczcVc2?=
 =?utf-8?B?ZzloWUdHQ3hydzhYRk81SG1qY2krWnNqNUdtNzNxZGtlUHhrN3dTSWZhUS9z?=
 =?utf-8?B?WkFucjMyMDRKeWcwaEZwNU9XQW4xeENMUDdRZ0hocC9VY3J6d2RFRUJ4czZK?=
 =?utf-8?B?VjZpT3ZhQXlRVXZwenVHMDhMdUlFYkQvV2dQMS91Wk1UVDBVQkRrb0RBQ0sy?=
 =?utf-8?B?VFJPMUtmUEtNM2FRYjFXdmcrdC81U21PZXdXYUFwMnNFZDU4RzY2aFl4R1F3?=
 =?utf-8?B?WkxWMzI3UHh6V3FzVllWUUFocnZ2YTFKMWtiZ01pdWdIUDRsZWVhWTh5YS9U?=
 =?utf-8?B?QjJ6THI2aE5kVi9KMm83QXk3dUYybEZDNnpVLzlWUGZGM2tCeFNmb2JDNkp4?=
 =?utf-8?B?TEFiejFUNXVGbG5NV3p0OXhsREpOUlRvL1RSSlh0MzhnRTdDajh2ODZLOStL?=
 =?utf-8?B?MExlWlZLWUpUNCtna0FrSmlWZkZJMzBsQ2xzUSsvUEhJdWFFcHZwM1FQUTcv?=
 =?utf-8?B?dUZSMXAzZE9xeWZQZVF6eW1ENWFkcTlyTzFscHBKSmZYRGhEcC8rWXFVU2Qx?=
 =?utf-8?B?d09SQUd1ems3dC94ZmFLaWZrTmdIYjRPTTh4TWNQK01lM2lYcUZCZVNiWnBG?=
 =?utf-8?Q?YIJiGJSUgds3xT8KkDXF87Y9h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0031182-b0b9-47cf-58cc-08da96293334
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:14:52.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBxbluRi8xhk+epJLKIQhBQBfb4Q++b80+3YCgc9CLnYOqpK0/s8cljfe0yJfV/dMgfmHMdD4NfU5FNmCiqU1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8752

On 13.09.2022 16:50, Roger Pau Monné wrote:
> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>> the consistency check in check_lock() for the p2m lock. To do so in
>> spurious_interrupt() requires adding reentrancy protection / handling
>> there.
> 
> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
> trigger when trying to acquire the p2m lock from spurious_interrupt()
> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
> percpu_write_lock().

s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
but yes - we could nest inside a lower priority interrupt. I'll make
local_irq_enable() depend on !in_irq().

Jan

