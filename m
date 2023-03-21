Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7E6C2E87
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512292.792190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ3s-0007kF-ME; Tue, 21 Mar 2023 10:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512292.792190; Tue, 21 Mar 2023 10:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ3s-0007hJ-Ih; Tue, 21 Mar 2023 10:17:48 +0000
Received: by outflank-mailman (input) for mailman id 512292;
 Tue, 21 Mar 2023 10:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peZ3r-0007hD-Eh
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:17:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eca8618-c7d1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:17:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:17:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:17:43 +0000
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
X-Inumbo-ID: 9eca8618-c7d1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPscaiVsMH3w8ceA7QbPYBfVohRPc/FglKfhgEiT02Q9CbkKxubhx2XzX0GAlwon8DITnEcbHBSnjkrC7CEaG8SCsa5VWBdWiKahyvbYdH+QWHvComar30nszruo6gL1YD+qGkJimyH/jlntrtxBSa9FYw+YfqUMBGOzeaTW6YMtoNrYj5UEUdE34d61ZvyNyy2v9JNYMGblB+wD95lDf1Q9WCdwZCCZnGaMaBXzlOetFtkT8WYDdaCtAE9f3pbigr25bRulB+Ii7ireY3IyueilSL2lmyhoViO8/iMeW5O11fZqWpUcAkPD2sSoodNCbIRc76UuhDmlCC0KwV/RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYdFNzOjWtfWRDJZXDxLk/6F3Q8pA0+6+Xj+s121WLE=;
 b=WzsbyInjIpUoaijIepe98VoG5L7GEMOy4FkOtLRCfeJ5DV5I/Mi+PFozmjPY7jQNhrCFQuDtXBtdNme2Wu5UZTbJ7Mliq1BRFuWNll+jOEtku0KrfIWqh5boRRv1GAr8UsO7I0H8k8jtN75yAmnrd8sC+5IRHGTqiBSiU92eQn8vK8hKpMAG6MXnVSh+gUDL7p/SYok3aXFcUhvg6d6xvSDC01xIO7bCWD+xTjvII/SuwBJI2053c3QT5CkYOovFDf4clxYCPxMelVKg2PPXJbfPC7bA285suRAQmymh/qfs90gAESGz6m/TVcMumezyPA1NyhO+aHMFV+EE5MXAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYdFNzOjWtfWRDJZXDxLk/6F3Q8pA0+6+Xj+s121WLE=;
 b=ez+juJySpVSHbpnEryXDv1uwJew8DKPo5d8h2LtBJt6kR+oEwfHfcbhebg4Fq7ewLewg9moedDLRCjN2fKEtszBmNAnHJTs2B/aQ4sk4rgEZl0GLpAlmgDNuG5QzceYkFY8bDPfVphqb4YQxF8Faq3C2z9JHgKXOcoR//Bb7yEujPQ/+oKgT6+Qd3WvYba7IqQKdIWmuRRZomQDTjVo6F8cQdQZggcVl8YWlLOl292U9phL1Xwa9xlitBsIuDP7uHUwUCqWpKGXkhCAjpk34preqE4TLRCrS+Qa02WX3f/DiGXgLHhZHXGqLQQ2NcLEHSRQBIsXNbVcFvfAThXOdLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39365475-a6f8-3aa3-889b-0026381c8616@suse.com>
Date: Tue, 21 Mar 2023 11:17:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map
 pirq in PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-4-ray.huang@amd.com> <ZBHq+UeK/lBj3s8l@Air-de-Roger>
 <ZBmCbORdc5+xxF9R@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBmCbORdc5+xxF9R@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad4c7a7-fd59-41bc-0b83-08db29f5821c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMirOnkZPT+N6n6ZRYOL7/Q7MOOSyOd0WyT+Ilnb6eZCeA689pZGo+sHm/7ZZiNHi756NvzdmJW9AzS575dDklULZi2zU6LgG76Ch4u14+mp4/SAEKYkVwEaxYtLLwhMuF7yHfJkxYUxITGqVTeoUOyHe4uvoLnrHe9miyFslsEVjPhJ1nc92JEi5iWyCMcHVMpdTnvj23P5FPTNQ8EYJIelHfVHXRd+di+ZP0SHt7P+aMeT5Io09nqqURfN0YKh0LvCceRt3yyj78xu2ee5CtD46FsNA3ryYunZIUupdOODkZVsGno8z0LCYRhP9XkigZHJ74Hl08nJUMMwjFbH5qFfrFpyZcg1hYwqKPcwcWjhWzEXJR90oCfxRmUww15Y34k6WmaDh9NE727WjcLVphyBJN2FHnSdl9XTGQssAjqYN1t7wE02tcnBbXqORAKfXeNQuKQTsynj6Q5e63HfH6wGP7tG3dmiRxR1663Sod1IQ1vxXwPwt3jbMlzasDFPzDzwiuPvny+WdGz3MEvDOqZZ/wLtvuqqSjtq++XDzh2MbBltE6IeNQxPYC4OFiTXfPq7KZx3uZT8v37F2EIiYEQi2/Clo/e2A+HA50Le48zn5GQknLwXd8k/giv5Pbo3I1/2A1gBim5C2JBrCY+u/PlbU2tuH8UXH3x5GMKpRak3I6O7xsWfvck9DJHvN1cabs2y8grFMjgXfnTTB3qW9ysy3h2NMREg2eOnyFDwDQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(41300700001)(8936002)(4326008)(66946007)(6916009)(8676002)(66476007)(66556008)(38100700002)(86362001)(2906002)(31696002)(36756003)(5660300002)(7416002)(31686004)(6486002)(186003)(6506007)(6512007)(26005)(53546011)(316002)(478600001)(54906003)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE96eDdtVjdsZ1gvMkc1TGhDMS9GbVFVblh2RG1CYUZsem5GV1Z5d0ZlYXov?=
 =?utf-8?B?UUNVMmQ2RUtyNDVkOHdTQm5KYUh3VzAzc0hWajZqNFR1SnIwempGS3BmOFoz?=
 =?utf-8?B?amoxZkNJQTRvWlhwcUx5QXQ5eUtOWWhGRUp1cXNZNEFUWmVFb0VDcmx0RkVy?=
 =?utf-8?B?NTU4WHdJRnNmM3lQenpWRXgrMUtaaEppR0pGcm1ZamJwd2c5NHVRaG9Yc1Jq?=
 =?utf-8?B?bUR6dW5kc2JocndqcnNycVRHbTNzRkNrRXJUbjVNVXFvclJ3Sno1OWZrK1pj?=
 =?utf-8?B?OHI5cGVqWXRXL2t5dmxoVU16NjhXcW9yMlFhTTRlWW96R21sckg4Uko3YkNu?=
 =?utf-8?B?Vjd2c0pBc3RUQnk5NEVucWlRT1g0L1lYWjJXWVdyS21icFh4eXl4QVBRMXRE?=
 =?utf-8?B?M3grSHpRVjUzR3lRMFpUNE9KUTFIMWM4Tm1Pb1FETlM4L1RWZDE3Q0N1cm9C?=
 =?utf-8?B?bVA3bzZMOEpuQ1dOR3hoUVBxVUJvS1AzZ25WYkVPY0R0WGlMVTlITXJKNFAx?=
 =?utf-8?B?eDV1bmxzZEhXVHlwcTloZnhRUWQyU0pWTFpCdkxFOXh5a085WHZGNVFDWkNZ?=
 =?utf-8?B?dG9zUjliSmRWZEh2V0tSbTJqRW5tMUxtVktlOC8rNHExd0NleHE1c3ZFdFZo?=
 =?utf-8?B?elYxTy8wVmhPZUl3NDZoWUUrOVVxaFpMckJTWWRIaGJyOUxNZmJ3NDIrTENn?=
 =?utf-8?B?ZnN3dWlxaXZSeDJEYUxmeW5mWEhEQmRBWEN4VGhvcXN0dnh5ZUdNWllCNncw?=
 =?utf-8?B?Uml5WGlrbnptVnd2SHFMMUptQStIcTNEZVJYZ1VhK1JhMGJXaVVQU1dvLzF0?=
 =?utf-8?B?TDdzSTdpUkJUMVFKOU14QWVRZmg3UUNuVnYyNjhpQ2Q1T1BSSlU2cTZsWHNh?=
 =?utf-8?B?WmNyNEdYaE1iSzdteEZsSGdlZkJONUQrMHpZUHlxZUlMOUc4TzJpT0JUdkpF?=
 =?utf-8?B?Q2xSTXlrOVhyUW9tOW1qTDdUZTdCUTZoWi9UZTFqdm5zV0JDNDNSUUZFTlc2?=
 =?utf-8?B?b3hBUlFTWm9YMDBIVjNTcTlwMENXbGNyMGs0dGtPUWZGcXZRanVNM1RqeWNN?=
 =?utf-8?B?OUxEaTFuSjdtUlNVMWh5Q1pCQUpBa0RwYm9pcGFaRmFGNzh3aFBTRUo2UUR0?=
 =?utf-8?B?Qkh6MlprbCt6NFZ5b1ZGeVB6Vzczb2h5QkNWUEtNREoxcXBSZ0g1Szl2eG5w?=
 =?utf-8?B?a1AwRkJvNjNzQklBVEZZMXdjVVpzMkhSQllqNGFSVHc2VUhPVHkxTTd0R0xh?=
 =?utf-8?B?YmYvZWNiMFNtRUlZSzAvUXFSdVFjYjhMR2tQSk1qZmhiTVdOU3hpN2ZtNm9h?=
 =?utf-8?B?c09rbnI2bTd5NE9DYnM5L3ZjSjliaUZmaVNzZ1Q3QUdIamdBREhBdjN5NzF0?=
 =?utf-8?B?dmQ2ZEpkTW9xQ1NZaXBuZ0ZFd1JTK3h5WUlBdTYzYjVWejRqUGE0dEh6bEZz?=
 =?utf-8?B?bGxTV0JXTEd6clJyYUE2NFQrcDhzekdCVTN4VW01Ump6TWdYdG1USkplWkRM?=
 =?utf-8?B?b0JtOW11OU00U1lYZ0xGZm1DMlQ1UnF2aUxxaFhMRWk4NHdoYTB3LyswY3Zr?=
 =?utf-8?B?Rm1WYkFPUXNSYThLZmp2ZW1jMURtZ1Jkek8rTzJBVXQrU2RERjFrOGRDSGR5?=
 =?utf-8?B?YndRMVp1Q3pXd29SRjdpU0FyU3hGK3RVZDk4T3ZWVjF1U3JibDUzdk5BYVpJ?=
 =?utf-8?B?RE81R1ZyUnhiSmQvdGQ0MEZ1RE9GNFZuZm43dVpnejcwbUJwY01xSnR5T29w?=
 =?utf-8?B?VG4wVStReWhiZ1p2UWp1WlE1QitUY3BWZUJ0YTliT2J2Ky9qZ1pJcnNqWkUv?=
 =?utf-8?B?aUJrTStLR0FwUWc4L1NCL1k3WE9wYmV6U0crTU1uWVByVyt0L05ueWdyY3pl?=
 =?utf-8?B?ZnJNNm5HZjJIcmJzUlF4UUpmdU5YMURqdGpjMXpFa3lNdytmS0gzWFUrNVh1?=
 =?utf-8?B?cFFNSTRXZ0ZLa2pBajRKb2U5U3VUczZidGdmWklCOUNoM0dJYXZnK0lFMU1K?=
 =?utf-8?B?dFpwSjJiR2pDalk2MXVIUXNmckNKdFlsVGFpNjJPYzV0ZlVQWUxrcUpidHlT?=
 =?utf-8?B?MjZVS2tWR3RCclAvejU5RHVUMGh6Rm9Oa0xCTlhPYm9CeHkyMDVJaFoxSUI1?=
 =?utf-8?Q?NpQgqQFRfTNqXi1NWNUaRHeAZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad4c7a7-fd59-41bc-0b83-08db29f5821c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:17:43.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wlWipdCnJB0NvBNLTys7zeCRc2y1Z+LU1K0orOTa42XO55IuLroIPtkDs9MUBBqX5OVkPpYwEwYn/OKVj0RGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898

On 21.03.2023 11:09, Huang Rui wrote:
> On Wed, Mar 15, 2023 at 11:57:45PM +0800, Roger Pau Monné wrote:
>> On Sun, Mar 12, 2023 at 03:54:52PM +0800, Huang Rui wrote:
>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>>>
>>> PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
>>> flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
>>> will fail at check has_pirq();
>>>
>>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>  xen/arch/x86/hvm/hypercall.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
>>> index 405d0a95af..16a2f5c0b3 100644
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      case PHYSDEVOP_eoi:
>>>      case PHYSDEVOP_irq_status_query:
>>>      case PHYSDEVOP_get_free_pirq:
>>> -        if ( !has_pirq(currd) )
>>> -            return -ENOSYS;
>>
>> Since I've taken a look at the Linux side of this, it seems like you
>> need PHYSDEVOP_map_pirq and PHYSDEVOP_setup_gsi, but the later is not
>> in this list because has never been available to HVM type guests.
> 
> Do you mean HVM guest only support MSI(-X)?

I don't think that was meant. Instead, as per discussion elsewhere, we
may need to make PHYSDEVOP_setup_gsi available to PVH Dom0. (DomU-s
wouldn't be allowed to use this sub-op, so the statement Roger made
simply doesn't apply to "HVM guest".)

>> I would like to better understand the usage by PVH dom0 for GSI
>> passthrough before deciding on what to do here.  IIRC QEMU also uses
>> PHYSDEVOP_{un,}map_pirq in order to allocate MSI(-X) interrupts.
>>
> 
> The MSI(-X) interrupt doesn't work even on the passthrough device at domU
> even the dom0 is PV domain. It seems a common problem, I remember Christian
> encountered the similar issue as well. So we fallback to use the GSI
> interrupt instead.

Looks like this wants figuring out properly as well then. MSI(-X)
generally works for pass-through devices, from all I know.

Jan

