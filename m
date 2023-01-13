Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C6669160
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476847.739237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFdG-0003SU-LH; Fri, 13 Jan 2023 08:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476847.739237; Fri, 13 Jan 2023 08:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFdG-0003P3-HQ; Fri, 13 Jan 2023 08:41:50 +0000
Received: by outflank-mailman (input) for mailman id 476847;
 Fri, 13 Jan 2023 08:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFdF-0003Ov-0p
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:41:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cd22357-931e-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 09:41:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8965.eurprd04.prod.outlook.com (2603:10a6:10:2e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 08:41:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:41:42 +0000
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
X-Inumbo-ID: 1cd22357-931e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBzUvhJ/cTh5erRbmioa7r3g3z58OW4XuRMnKQIsqydkLnUnJY0ZRZfg9n9P73CfNLOIqKenAW/Fgwns2kBYi/loHwnVxbFkRmhkQzlEgkbUvg+rSpfvonNJzAAMUjnJERRE/Y/uaA6IdXuQnBx6WMKGSMryfvOvQvh3r1cZPGoMM4uWel7REc8wgsaxMHieDZ0OePZCMAKNMFhiCgG+DvbsNIPoGLD/AxvyPo9ti34XPHf6LPTVbs6tB3xSmKXZYi1STOYjHm1kMRA6yuY4VzUELdoYSuNJ1/OyI+XptFcdfTWzY3kAsIL2IPKtUZo7c1QOwF3eenJcDhCRw3cmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9UyZXk1/Uh5BjNg7NaKvy6tFD19k2rx/NbURI4rtbI=;
 b=d5WA9enZNoY1hrGVcRU46kk5NXXVqRattLUdqWknT2vob8Ko2/KAOkNyLKwDZ3dNiXQ+YdZy/61UtPW2FmZ9cg1lpGEnL9Mp5L7+UXL6oS0oInyDSFmbc6AEy2JlYar1O2qvrBgc2W801EWCLwc2HwncpZHX77/2i55I93vZSMjQT71RHKoH8gZ1WoDXzsJR3OD1qwj8mSUJ4XBqM+PhdxAKJ8ap0buK78JzybI9b7ALyRBV3SZj7sEXiyLKmK+flVKE6c1Sr8yupSggNgfZHkXKYNLE/XP7VFECKi9ZpJFaXccfDGd5aQ9ihFg51TQhfs+pGYpNDJ9GBLKSOrfusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9UyZXk1/Uh5BjNg7NaKvy6tFD19k2rx/NbURI4rtbI=;
 b=R58EMZvqB51j2bzU7qz1WqSsraeyR+f/CyuHoPNnZFf1y2ZgAFHJSYF3+1FlWZbDJQROwWFiyO4pyLDrP+KSWdpk09CT1kKCOoLlliR0ymBSlBdjcdoNrobpRxIXuQqxXlgdH3fbrBtlGmDfdn8AqzhMJrfhAkBVsk6y/eivqDX3Pq1NY2JwAh28FMMBPWGBo5uJpIaAQYjX+mQ4futIv3xk4sZR8wywmpTyNSzJ3q6qPBPrmg399z3ZsCLxU9gn/h2+WTBW6zfh1e2lYiWcfPF2LXLC4T0mAZB0Efl2QH+RUgPYvi3RfjMgLgrAB0RIME09E/xwAqJj90+bk0hCVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <749f6412-ff36-c5bf-8b5d-c866aa47cc39@suse.com>
Date: Fri, 13 Jan 2023 09:41:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
 <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
 <0e21b24e-d715-bd04-f98c-4cdd53f129ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0e21b24e-d715-bd04-f98c-4cdd53f129ee@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d6305a-a99d-4686-faf0-08daf541fed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZC6sUcKlP1TdNfPrC4+mhzy1tJllYARZaL/46RH5W/z5eSPqvbZvNoICam3NSDF5ZckmK1X1cAm45aR0+2MVJOMtdion4JB5AtjwG2K19QtAiI1v0kyCs8qEY3xZ0960AT5iN7Q7JjP2DaP2nKUb42sXJrtlPYMigPSSrEmvvk4R+gtqANC2p30+ZjSbqrPGTlKAO9ILF29BWbz81iMXsZcKOEEBO9zanaoBTtY3JKM1W7H4MHwIAYzsLHq4G43if0SS2LbT7GpSalmVTXIEMS92TwWRQ8wGgt6JNVccF2Z+az4u9+wmdRJ/lWE+t/Y7LeECx0K6RJpzZsG9a0Ld3nV4qy9qHtIBvXVmCQJb18WkJgX4ygBjcw6pxntfdUn0uDD1rK6eOWRvd2Zgyfmeqk36VuuQHfmFOK5AxjEtMmeC/KO0s0Z31C4vIpB50L/xBowI5S8T7O0It35EiHHPSm5rT7yua0L2jkKem210kQbghEu3G3c5+nJvgSYqo+k9S/VGfF9ENFSsYzPjof4GkatNye6Z1enckSkc+igY6FhqthzdCmqMRryBZtwSXh/DlcHqGWVI2UfKpwoDHlUtiBcZOejtCRUwSKLBHRy/O7QeyHygGVcML999hY2EAc7QZzvwpCDVIgbRu+mHdsA5HrmdEgkfdiLhbyoGbTUpgjEqbeWsg8IJiGdnQXGvbl1BJSLc1yo84nEBU08b0jfw1KRwzhL1QRL5CId29vVRZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(83380400001)(38100700002)(86362001)(54906003)(31696002)(6916009)(66946007)(66556008)(4326008)(8676002)(41300700001)(316002)(66476007)(8936002)(2906002)(186003)(6512007)(66899015)(26005)(2616005)(6486002)(5660300002)(478600001)(53546011)(6506007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJIMEhXQm1RUmlFcDVaWmJxMDljblVCUXBja2RhVXNDZWpxQjB5SmNjdUlh?=
 =?utf-8?B?aGVaRmROWUhYVFB5Z2FLckJsK3JySmRBNnliVEpaT01vblRMNGZwWU5oRjA3?=
 =?utf-8?B?bGdiQ1lJTzZNVHB2YnJyZlEzd01DbGlGbXVkNWJFV2F2NjNVU0pvOVV2bUk3?=
 =?utf-8?B?RmxQdWpDVGwyQUE5NDZTbEljd1dyMjZuNGtWWkRTYUF3UXZNWEZUMit5b1NM?=
 =?utf-8?B?ZjgvemNXQUcvY2kwWkI1UTAvV3RQSWJHcFBUdFJneGJwZFByWlVNYmdVblBv?=
 =?utf-8?B?bHpWeEtIVDFIRHZLanhPNzlkTDhzZmxpTUUrWWdsS0hXUzg5ckNMVzFmWXk5?=
 =?utf-8?B?aW1VZy9OeENZVkFKeXJub1hsYk1ETlJOcFdsN1ZaUkJXazhDZEd6TGhFVXVn?=
 =?utf-8?B?ZnZXT3FVaFdGbEh0T280eG9qbTJIWUwwVEdKMHhzMERkVHV2RDVUaHZnd2NF?=
 =?utf-8?B?MHlxeFNJWjVORnR0WU5adkkxMVBPTVQ4NGhjSWFRU3c0YkFoSUZJT1BWSTBO?=
 =?utf-8?B?dnk1RGxUTzV3L2hFcWJ6NDlnanNwN1F1QjduWW5qbERIV2tWZFFOc3d3OWh1?=
 =?utf-8?B?dC9WTVQ2RHlBTWF1TWN4K2NKU1pDUHVuaE8zNmYvYWlJY1dEeFpyYkNnWnFN?=
 =?utf-8?B?eGZMcUZhcEI5VTRmMWlqVXovS1FmeGN0Vk0xTDlvZzkvN0ZzUGxlcFphQ251?=
 =?utf-8?B?elBUYk1wOXhHeHR4aHB4dlp4NTlKNUlVeWp3dWpjeERYb3lRdGt4ZmZvbXcr?=
 =?utf-8?B?emVYM282dzlyK0JRZytjRUwyVFowTzQzSDluYmxrNWZDY2srMmF6R3FTSnZR?=
 =?utf-8?B?dlNKTUhOYVhVaENVajl4TWdlUm83OU5QMjRnVGVkdkpZVndUM3lMY1lGRFY2?=
 =?utf-8?B?bjI4L1V2elUwYWpIbkZMMklEcUJFK3YyT2NQUk5FRThOODZkdUlZaXNPeXlE?=
 =?utf-8?B?RWVsL2lwY2o3N3pEdWxTQStSOU1laWNsdmJ0WWJtelo3bi9GM3A4MnkrUFJj?=
 =?utf-8?B?Q2tTWnYzZ1l3VUxzSTRURm5pc1JCTHVHRGZFcjZoZDVQRjM0cldxWTJHejht?=
 =?utf-8?B?cnVVRE5zdlkyS2tPeVNEOU5TMnBZSGtXWXVnOGw4MTM1cWdtcWR3eElsakJy?=
 =?utf-8?B?UU0wQUhBelNEM0lXcEFQLzdmQ29BNXRtVXJYRmwxaENWa2o4dWlFRVRTNEow?=
 =?utf-8?B?bnpLcTZHWU8zZTlDVkViSGI2YkZocGRhY3NsTElpRTNKMmpYNXl1dlBOYW0r?=
 =?utf-8?B?aFV4TTAwSkJPRVEyWGYyTTlscFVRRUIvaDM1ZlZuYXlhM1BGN2RLZVdPYzNO?=
 =?utf-8?B?SkpRSnBqMXlSNDBKRFVZdTlCVitkYWpyKzNEZ2ZHQS9mcmZzUEZWT3hFQ1Rp?=
 =?utf-8?B?ZnQ4ZUUwbHM0QnBJYjhkT0UrbzgzNWFHNXZpa0dicnA3YXByNzRZejNUZHI4?=
 =?utf-8?B?K1ZyTERqQi9mR0xyNWVGczRRMmtHcFNmVWtXZXdLSmJ4SzRNaG5BTlE4TEdT?=
 =?utf-8?B?MUw1OWkyWjJpcjV3ZUZHbEV1dTlyQTNnYitsVGFWazA4SnpJa3RuTHBVbUdX?=
 =?utf-8?B?bE9YNHdvY0YwdUZJaWJqSjd1MzRibVl2aGJrdzNKaEk5N1FsL0hjc1pINXpQ?=
 =?utf-8?B?UklEV3ZDTDVKYzlYNy8wZ0NEenEzM0VYeXBETUhrRFFPd1R0U3o4amI1cHov?=
 =?utf-8?B?eTEzcTZVcnRyQjVacThuYXpnQlowTmhCRTVJTnJsNGFKVjBBMGYya3JDemxU?=
 =?utf-8?B?UjVHR0Q5bFdQNndsUlRvZjlTeDJBanhhd2Y1cTFoRUhqeVhmMkd4b0htdFBs?=
 =?utf-8?B?aDlxdTBveStaZ25mbVZrMUlRMFhISDNzOUNGSDNnRmNsY05GUGJnM1V5SzdW?=
 =?utf-8?B?S056RDZEME00aFNlLzl2bnV0MGZzYTQ0ODV3OE5uQ2k3Um1jMi9DcC9KMmhP?=
 =?utf-8?B?SzhMdVgrZmdzT1hPTWtmYndSa0R0TzhZa3FDd0VIS0ZxSCtsRTJ2WWZnSmZR?=
 =?utf-8?B?dm5tT2tGNFZZVVJtU2VFcUZBaURyOURxcFY0aDlGYStqRU5sZXh6ZWJWcU1L?=
 =?utf-8?B?UjdMWjkzdFJNaGdaV1NibXVKY2VYczV1VkNFenorZnh2OExZZFIwSW5OQjht?=
 =?utf-8?Q?e3JmLD22F0VF4ZqtVPi4k6x39?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d6305a-a99d-4686-faf0-08daf541fed0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:41:42.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq3ZskQWbN+tgZLeTuxmJjkZBMprfMGzMcLHJE4VH/izqAVckF1fHWgxUplVGxhqOerYZ8Z4ckd51PJRvCKhVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8965

On 12.01.2023 19:24, Andrew Cooper wrote:
> On 12/01/2023 3:43 pm, Xenia Ragiadakou wrote:
>>
>> On 1/12/23 13:49, Xenia Ragiadakou wrote:
>>>
>>> On 1/12/23 13:31, Jan Beulich wrote:
>>>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>>>
>>>>> --- a/xen/include/xen/iommu.h
>>>>> +++ b/xen/include/xen/iommu.h
>>>>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>>>>      iommu_intremap_restricted,
>>>>>      iommu_intremap_full,
>>>>>   } iommu_intremap;
>>>>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>>   #else
>>>>>   # define iommu_intremap false
>>>>> +#endif
>>>>> +
>>>>> +#ifdef CONFIG_INTEL_IOMMU
>>>>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>> +#else
>>>>>   # define iommu_snoop false
>>>>>   #endif
>>>>
>>>> Do these declarations really need touching? In patch 2 you didn't move
>>>> amd_iommu_perdev_intremap's either.
>>>
>>> Ok, I will revert this change (as I did in v2 of patch 2) since it is
>>> not needed.
>>
>> Actually, my patch was altering the current behavior by defining
>> iommu_snoop as false when !INTEL_IOMMU.
>>
>> IIUC, there is no control over snoop behavior when using the AMD
>> iommu. Hence, iommu_snoop should evaluate to true for AMD iommu.
>> However, when using the INTEL iommu the user can disable it via the
>> "iommu" param, right?
>>
>> If that's the case then iommu_snoop needs to be moved from vtd/iommu.c
>> to x86/iommu.c and iommu_snoop assignment via iommu param needs to be
>> guarded by CONFIG_INTEL_IOMMU.
>>
> 
> Pretty much everything Xen thinks it knows about iommu_snoop is broken.
> 
> AMD IOMMUs have had this capability since the outset, but it's the FC
> bit (Force Coherent).  On Intel, the capability is optional, and
> typically differs between IOMMUs in the same system.
> 
> Treating iommu_snoop as a single global is buggy, because (when
> available) it's always a per-SBDF control.  It is used to take a TLP and
> force it to be coherent even when the device was trying to issue a
> non-coherent access.
> 
> Intel systems typically have a dedicated IOMMU for the IGD, which always
> issues coherent accesses (its memory access happens as an adjunct to the
> LLC, not as something that communicates with the memory controller
> directly), so the IOMMU doesn't offer snoop control, and Xen "levels"
> this down to "the system can't do snoop control".
> 
> 
> Xen is very confused when it comes to cacheability correctness.  I still
> have a pile of post-XSA-402 work pending, and it needs to start with
> splitting Xen's idea of "domain can use reduced cacheability" from
> "domain has a device", and work incrementally from there.
> 
> But in terms of snoop_control, it's strictly necessary for the cases
> where the guest kernel thinks it is using reduced cacheability, but it
> isn't because of something the hypervisor has done.  But beyond that,
> forcing snoop behind the back of a guest which is using reduced
> cacheability is just a waste of performance.

I guess I agree with most/all you say, but that's all orthogonal to
Xenia's work (and also to the patch I'm about to send to address the
one issue that I've spotted while reviewing Xenia's patch).

Jan

