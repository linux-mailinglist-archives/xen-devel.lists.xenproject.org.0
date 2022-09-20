Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3F5BDEDE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 09:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409185.652130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaY5k-0007i7-G8; Tue, 20 Sep 2022 07:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409185.652130; Tue, 20 Sep 2022 07:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaY5k-0007gK-DJ; Tue, 20 Sep 2022 07:54:52 +0000
Received: by outflank-mailman (input) for mailman id 409185;
 Tue, 20 Sep 2022 07:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaY5i-0007gE-Sz
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 07:54:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00064.outbound.protection.outlook.com [40.107.0.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 808a6463-38b9-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 09:54:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 07:54:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 07:54:47 +0000
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
X-Inumbo-ID: 808a6463-38b9-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4YKNw/oK8rliBYu8SC5HdMwrOTaWXxtMrJVcFUtR0DPuyfEiHV12NhHnSq7oCg+TfH1PZoEGBrnpVjolNloYzIVlpVea2/ATsVZlOb23Ooe02JqjmfiU6EpGArOOOkkLbXWYVyw6Z71x5qw96YWhNINAcdLX0U1JQj95wwpXas7p2WLKaZdJct6NIyKPX8ec+vBAj74Eix8REiHmQMJSAGsh6S+ZQdFzGRpI/29Xepj/ZK82bJxOizj+FC5LYKWi2BdMuwrDyH3zsZ2p5gRgcABebzmJclyoRH/x2z3gSXvksSlLgo90+fCBNoa5JBxlmDg+hSdMlaBf1PXKJaAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MysRIsQ17qDd1LEt6AIEzjoRbiXpSHgN+WMUcuepDKU=;
 b=IpuRPNmEHlQ8+IlOe3ThCrTs7tBeWPGhLpZlhmxniyq5y1KyIy9U5/o2l1NEFqYHO8NSVFMmLLIRH24kXXTfhmB7tBQj3k8T+53DKP+1bWKItEWfZUC8zndRPsUx06YtOYgIUx7wcJPrbQeSxj3pDMk7aIvoyhKUm2h9DFBUC//9VhUR1lVweMfLftbv40mFiCqpI4j1f7JFhEuCMipF0v+DZHlGP8BckB2SdtcZor8Idp+4pPa3fJR6v7DdEd5rghjo/ZFVq+OhTT4h81inSxhsExYT32AuXPoGXSUZP3NzXHGN36gu3xlPkyXapDpujl5antxc6zGoFM8wJarp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MysRIsQ17qDd1LEt6AIEzjoRbiXpSHgN+WMUcuepDKU=;
 b=gVQVmSA8TmfTX7Y65YH6UNnnrcsnx6ST3JXLgsVAJ1Xj8E0qgNi/ko9GXZtTLZgWpA5pW1pkVPyCdEwzdg2Ib4i9xoHfZB5rbtRik+9j+7/io42RD+XR+K0WvsFQxii3wS7AB2bhtMI62r09DdtwROAG1KV5Q7cp5YoCza8tgJlBTksDqJ9qRQjlJ49F3gt32XzJlZNKgHR9xwJ5A/QjZq4BoXPFyOZsuJHGCN9R19oDf+OPvjkPXRsIAsvhVvAeoq9iosga9/LFtiD6W3Fodu+Ue3KOWkMoJ0My+5QLQ9rd+fscPyMXQPessMWnfF+j8xrGJLoqRF0QT1dfHI0RSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdf83f96-b9c6-eca0-07b2-4cfa1002de70@suse.com>
Date: Tue, 20 Sep 2022 09:54:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, julien@xen.org, stefano.stabellini@amd.com,
 wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
 <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
 <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
 <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
 <alpine.DEB.2.22.394.2209191538240.65421@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209191538240.65421@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0200.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: e68ff8c1-87cf-4983-ab6e-08da9add634f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7CwdgKi9RTcariMVm8g4YAtvch6S33E8wbcl0hLaplOk9LKkk7btQ99fVL+ES6cpjKid95uWZTKsYdCwiQ7NPt3KD4ILBV5SK7eLadSSAU17bc6Kj5BYd81m0Duqb8vBfX+H4HlMin1Acnd/tTRavOytq11A6xV9915St3cd3/Ln0Qn2DDjlIrfG9KA3RUapsmTgTBbgSbn3LOQ84+W2c5uTV6E7cq6+X9H25hIuE9SDS05nwzMHZ1cOG8ZaHgOFxEhS0UYSBFQX+0l8837CG8KhoIwLQhvAwoIzVQuZj5VwO6KKBDOzSZTg4nEKO9DWDq89xIs4YfycCLuXVXkuPJxmoSo+cO3nJ4q+tjL79MuztZsAH3HFy/dBFhJl3RGaaJ7QDNDtieiVd/cZxWfHz5oEA+4ghMd+4juGsBgMEdgU/3pjbt8Da9yYRUbjukAwJbYOz4q80P/Pn4QosgE/HNWVXVmFFw28V2Eqht3BR2MClNeXD+RXA0bvt1e68zcsVMf3gcDdl+ErowueE7WLJSYO8tiBbq8NeR4fvJMkzMGc2lpI3OsnO1yEUf5SgVwiTqsj83jQjExfTb++d/jAsgOgZYXXQ/GzKuVkICGwKjUS8yJRWn1/5ocDJ3q9DwMIEQX6MYUJU44a22q/6VYKaeA7DgSXJTbNose+u+HvZaoDCg8oTRWv36JkNpGOnQFGDXFV8Krlk3IFnX0J7HRcPUOdoHgdNtTUFLd9ZgT7m6efhJUhRLHpF+rs7p9e7m/53UBSElrxsllCZQbhhk7zaA6Cea0yvobx/6DvkRHwFcr5qqG4q9c7uW5oS4re2OJvtXqLrs+ATX23j+tYMYoWZRzKlcyLdfulUsZ11w/3ujo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199015)(31686004)(86362001)(31696002)(36756003)(54906003)(7416002)(4326008)(316002)(6916009)(966005)(478600001)(38100700002)(6486002)(6512007)(6506007)(26005)(66556008)(41300700001)(66476007)(2616005)(66946007)(8936002)(2906002)(5660300002)(8676002)(186003)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VtU3FHdEhWSkthYTRDYTdsRlc0WXltc051ZUxvTHJqRFEwUWRGYzlHdG9Z?=
 =?utf-8?B?WTl4ekRKK1JkZVBFTlBpZHoyR3dXU3JvV0ppdG5CT1k4U0c1eDdrNDhXZDJM?=
 =?utf-8?B?L3ZoSnlhNHJ2bkliRncwVGdIaFdlT2ZSdDNEWDQ3UG5jY3dROXZEQXNMTEtX?=
 =?utf-8?B?TkVKNHhKRW9FRi9yWlNNZFVkSDgyaG1aZFF1RXJxT0o0YnYweFFub2QzR3di?=
 =?utf-8?B?K2tCRWFiTzJmcmM5T3FWazE0NnVUa3hvQlYwVHVkR0JBb1p3cDYyQmpiRGda?=
 =?utf-8?B?Uy84b0RPQy8vWmZyalBid3RBY0ZxSmFOTVVYL2xNKyszV3lPZWl2TEFhMTlt?=
 =?utf-8?B?NVZjUmp4d09DMlVnamhyQ0ZFaTZTcVZWZ3pUUEsrMTBHTXhld05RMlNGaFBV?=
 =?utf-8?B?eDNubHRpT2hmSGNHOUhUeFpsQ21qS1Z5WXRqTmxaRXVDRFQzOHNmeHJyc3Zq?=
 =?utf-8?B?cXFMV0w4OUc2dDJVcHNiTVdrZGU1RDdLUzc1RkVVbVBVRHpJRUJwVnhuR2VY?=
 =?utf-8?B?QUpEbExuRmJmR3ZuNzdDa2I3dE96bDIxbkRIVHpjeGNuZ2paMjdyZlFyZTN1?=
 =?utf-8?B?cWlETHNydFJmNmpoWTduMk8zTzV5THFXbUtqQ3NXc0dxR2c5ZnZORkM0N2hK?=
 =?utf-8?B?OFV4cXlNL3NYUVlUZjhHYW9nWU01amk5ZkNHRVc1ckdoQ0lBVG9qK2hxYSt1?=
 =?utf-8?B?Umk1MXBRNVN2dnFHTm9NSDJmZ3pyYklJR2dQOUFWS3NVOGFpV2MrSXdHWXJQ?=
 =?utf-8?B?QkxyODhoVG9sRnJlODZZOXIrZ2FpMWJhYlJGSjRrL00rOWNxOVlLVzVRK1Bk?=
 =?utf-8?B?K1MxbGZhb1VsL3liQmFjaDVNSXJ3UlJ6UFFEZTJ0NnptREZzcHYvUXcwK3Rm?=
 =?utf-8?B?Z2Z2eklscTFLWCt2S3h0MVRCWVpqQmFPRjhhR2o1NU5DQVVQcUhqZ3NjYW8v?=
 =?utf-8?B?K3lCbUVzaWZaK3BnK0tTL2ppcW5zK2N0MFhXbHZFNlB4ZnJOOFY0MXpkYlNM?=
 =?utf-8?B?dGxmTWJDZnVIcTVvU29uMGNScU0wTWlhU0ZLZ0RXSmVWWDNyQUJYWDNJNnZ5?=
 =?utf-8?B?dGc3MzBIT09vV3FhaGcrU2lpeTBiV3dHaVdMazAvS3FkUG42b3Q1VkFMS1Vi?=
 =?utf-8?B?VVhmVkpwbE8wYWpxK0J2TzY4eTliRENybHNwbVNXSjNtUzNzZ3lOalVLYUNn?=
 =?utf-8?B?VnNRYldndlNSMFRYSXU5STVZVTBmRXdVdm1ETXpkL205YnFFMkh6NERCTUsy?=
 =?utf-8?B?aXpDOXhaVEcrR3MvZ2UzeFgxcVRRMms3d1NLSm1XUWVkTXhyeXd4K3RUQ2VB?=
 =?utf-8?B?c2FDaG5HV0U3bkZpWHNncHlBU0NrSVdCUERKOFY2MHZOMDJEY09OUUw0TnZR?=
 =?utf-8?B?amJ2MzBSRDd1b0lJRWZON3k5YTY1SkhLdThVMGsrVnBUeW9aTWhVUHJ5by8r?=
 =?utf-8?B?ekk0WjBFVk5jNDZ0L3l2cHVvUWZlZ1BESVNQdFFpT1h5QXNSdHYvYjlZRmxU?=
 =?utf-8?B?TjRVY2lIVmxoL3ZPWEdiMXVIeDNERjlCaktTTi9lMHV3NTNWaFU0ZjVOWm9C?=
 =?utf-8?B?U2VGdHNyWHMwU2dxbHlXa1ZTMkg5bkhJNkw4QWNBVGZ0czdQSWx5SERTOWU4?=
 =?utf-8?B?Y0h0ZjFJUnMrT3BYejBzQ0NYS01pVEY0V2hmSngvRHFMZ2RUckxPcEpmWkVt?=
 =?utf-8?B?WUZ4TGZGWU05QWtHcDhRcDVtMmVyb09jeFIxZEVsZzZySHNHbDRjUXcveE9E?=
 =?utf-8?B?UHllVGxBd01xd0JObzNwYXdVRkEvSWNSNnQrVmJzYWZmajRpM1BwZjY5TlVy?=
 =?utf-8?B?YjhyZWJaQ29wd3FBUllidjVqVTZwQjgzQUtRSVMwdk5VK3hkM2RFVmxNTmlX?=
 =?utf-8?B?V0JHVyttekdJaGI3VzV5aXIzWCs4UzlzZDl5dnBZR3ZNOTkxYWpMRllqZ1U5?=
 =?utf-8?B?RmIwUEczWkZNS1g2d0Z1VUM2SzlYc3A1VGFUTVBuak5XUGlrUUhtTEhYMUFS?=
 =?utf-8?B?ZFh0SHh3Z0crakdwNjRXVEhuZ3FIQzJqR25laER5UDZhVGtrRDA1U2cvc2tF?=
 =?utf-8?B?RWpZa1hiYnlhNVJ4bWpIY0kxRjc1WXp4QjNBcjViTXRwUTdTUmFUbHFiOVp6?=
 =?utf-8?Q?9N0fcydvtf6Gieg8r9OtQmK3P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68ff8c1-87cf-4983-ab6e-08da9add634f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 07:54:47.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUjxsK3+G9dwLTcML958QwYA46jtSWiAP14qF9U4DycnR3uI4jT44222RYnLedziz9jeTGSPgkU6GpAqwHJkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509

On 20.09.2022 00:42, Stefano Stabellini wrote:
> On Mon, 19 Sep 2022, Jan Beulich wrote:
>> On 16.09.2022 18:05, Carlo Nonato wrote:
>>> On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 26.08.2022 14:51, Carlo Nonato wrote:
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
>>>>>         colors at boot. Note that if, at any time, a color configuration with more
>>>>>         colors than the maximum will be employed an error will be produced.
>>>>>
>>>>> +config BUDDY_ALLOCATOR_SIZE
>>>>> +     string "Buddy allocator reserved memory size" if CACHE_COLORING
>>>>> +     default "64M" if CACHE_COLORING
>>>>> +     default "0M" if !CACHE_COLORING
>>>>
>>>> I don't understand the purpose of this last line, nor the two earlier
>>>> "if". Why not simply
>>>>
>>>> config BUDDY_ALLOCATOR_SIZE
>>>>         string "Buddy allocator reserved memory size"
>>>>         depend on CACHE_COLORING
>>>>         default "64M"
>>>
>>> This was just to have a value for the config option even with cache coloring
>>> disabled. All those ifs emulate the "depends on" keyword, but let the
>>> CONFIG_BUDDY_ALLOCATOR_SIZE takes "0M" when coloring is disabled. With just
>>> the "depends on" the macro isn't defined at all. I know that this can be
>>> handled with some simple #ifdef, but I found this way to be more elegant.
>>> Not an expert here so if you prefer the other way or a whole different one
>>> (more readable/better fitted) please let me know.
>>
>> As far as I saw, the sole use was already inside a suitable #ifdef. Hence
>> yes, I clearly would see "depends on" as the better fit. Please also don't
>> forget that if later cache coloring would be enabled for another
>> architecture, that default of zero (pre-recorded in a .config) would get
>> in the way; one would need to manually change it (and remember to do so).
>>
>>>> Finally - how much of this is really Arm-specific? Shouldn't this be a
>>>> common config option, perhaps merely restricted to Arm by the top level
>>>> option (CACHE_COLORING?) depending on a further HAS_CACHE_COLORING,
>>>> which only Arm would select?
>>>
>>> I'm sorry, but I don't understand your suggestion. BUDDY_ALLOCATOR_SIZE
>>> is Arm specific because CACHE_COLORING is. In fact it depends only on this
>>> last config value and not on Arm config directly. Why should someone limit
>>> the buddy allocator when coloring isn't enabled?
>>
>> My comment wasn't on this on setting alone, but on the coloring ones as a
>> set.
>>
>>> I've lost you on the HAS_CACHE_COLORING. Why should Arm config select this
>>> one? Cache coloring must remain optional. I'm probably missing something.
>>
>> HAS_* settings only express what an arch is capable of; they don't replace
>> dependent options which actually are user-selectable. (That said, we have
>> a number where there's no user selection possible, but that's not of
>> interest here.)
>>
>>>>> --- a/xen/arch/arm/coloring.c
>>>>> +++ b/xen/arch/arm/coloring.c
>>>>> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>>>>>      config->num_colors = (uint16_t)num;
>>>>>  }
>>>>>
>>>>> +unsigned int page_to_color(struct page_info *pg)
>>>>
>>>> The parameter will want to be pointer-to-const and I wonder whether ...
>>>>
>>>>> +{
>>>>> +    return addr_to_color(page_to_maddr(pg));
>>>>> +}
>>>>
>>>> ... the function as a whole wouldn't be a good candidate for being an
>>>> inline one (requiring addr_to_color() to be available in outside of
>>>> this file, of course).
>>>
>>> You mean defining it as static inline in the coloring.h header?
>>
>> That would seem preferable for a simple function like this one.
>>
>>>>> +static void color_heap_insert_page(struct page_info *pg)
>>>>> +{
>>>>> +    struct page_info *pos;
>>>>> +    struct page_list_head *head = colored_pages(page_to_color(pg));
>>>>> +
>>>>> +    pg->count_info |= PGC_colored;
>>>>
>>>> The function isn't marked __init, so runtime correctness as to the
>>>> (non-atomic) update here wants clarifying.
>>>
>>> Yes. I need to check and probably add a spin lock for the color heap.
>>
>> I'm afraid a spin lock won't help. May I suggest you look at some of
>> the staticmem discussions that had happened, including a similar
>> topic. (Sorry, I don't have a link at hand to the exact mail.)
> 
> I searched through the recent staticmem discussions to try to provide a
> helpful link for Carlo, but I don't think I managed to find what you had
> in mind. I found these two lock-related emails:
> 
> https://marc.info/?l=xen-devel&m=165476642832402
> https://marc.info/?l=xen-devel&m=165632461420257
> 
> If they are not relevant, could you please provide a few more details?

Those aren't the ones. The point is that count_info is a somewhat
odd field: It's not consistently updated under (all the same) lock,
and it's also not consistently updated atomically. Hence new
updates that appear in the code need properly justifying that the
way updates are done there doesn't conflict with any other of the
already existing updates.

Jan

