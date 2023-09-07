Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CDF79704E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 08:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597107.931292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8ik-0004Rr-Me; Thu, 07 Sep 2023 06:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597107.931292; Thu, 07 Sep 2023 06:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8ik-0004Ou-Jw; Thu, 07 Sep 2023 06:42:30 +0000
Received: by outflank-mailman (input) for mailman id 597107;
 Thu, 07 Sep 2023 06:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe8ij-0004Oo-9a
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 06:42:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3922dcc-4d49-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 08:42:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 06:42:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:42:21 +0000
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
X-Inumbo-ID: b3922dcc-4d49-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO17tm5klP6aPxn2iKhXIVFysuju7a/QKBXPZih5OIcKWht969bhwRrVzT1f/6JfMehe5OAqOyjM0B6SZPhiVQvKN+4GQfGkNctPZr+FlrxhmGgJ6kG53HUKD294KyRFce0JgvELvDjBDI23MhksVEEwc2p7HKzdaREkvA77RCsTk9W4Jfd6ZFy1yhJoQ4+XP0bzUZaFzVs8UTEZEEH8Qw3aDmhMxpXspYkE2GBgdonT8WPD6HGT9t9fJ8RFXItUENd38EJ3Avds/LXUw7GsrOwiszdlJ2+AZHgTvDTY0su4TdVK7kR1pCJGorMNqILau6qAeQ4CYvhxzp8expP7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYZKU87k2diPn8QGJhTIWvvXQxgix/khM6Vr0PYXo9w=;
 b=iMoX3U0Z90BXHaomecXEAsmKjnCnatfkg2pvRig2khS+JeNqWQ+TovPJfn8Tyis68WDrVEkG3BTzNAoLQgOvRYp3Ov5uZc1u0siVpQlCNtpo/76oW6AbpVpu/jhCKshA261QRXt+SYda8UcegcX8MVo9FSWAOswZutuawc6d5yQKmYE3fGrh0uQ1uUJoX99iHebbe4TuxNPiBwm1C6K4l+huA1g+AB9D733I1gAxX7mBheF1KUXAUd9r3LeQBwwLiB8/vdleNUskwJvwENn9aDZ5Sg/xeiyMqqEBrC1QCh1d9iP/jXxc2hOsp8omo3vaRhULbv6+jOdD+YPF1FZrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYZKU87k2diPn8QGJhTIWvvXQxgix/khM6Vr0PYXo9w=;
 b=rTvd73RMP4QpdewlbeBRLOk4QGi+jqOhv/C4uSpYCiyiRkZyzLx0lSE0S+FX22Qvk50SYAYXQOMlL8xKulk205QkNb/UljWrRGXHs8zSF1TB1TQvW8NqwAzocloWgaB2dBsBMmIDXRpKoWhl3AShP/jXA2a5ba09w7xd5aX9sl+kKDnSCRRUYoUksSoRWpcfya6oI6dx2ihGWlDqBMNFs5xvndoYxTX4tvP7sUeQ5W6ulNxiUxNqgZceHkzuFeDw8hEWyNO67lxUZqFO8mDOboiBCXD3fKZ4oop6YHlnHn8Hqu763r9LSr0lZk43uGwsIcHpItmM+7Vyk0u/BBTPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09287ad4-693f-4652-1d2a-a235c444b69d@suse.com>
Date: Thu, 7 Sep 2023 08:42:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c71339-bf1a-47ec-d096-08dbaf6d9669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9VkGyJXbjiZZeZ9MOly4U6S4MP6VA1MASu+Rxu6MCmMCyXfQW1qlZrzdbMamQK/H/kVvJC9HQxHxnQJvO6YvuDYBs4E2G7RqMVARTtTQJ6vUNQx9JkFyUII556gNe+myjx30K1W1sSJ5eTjECJyNKOPtY/DQYqomh2BAAkvCKNBaYcQxLCWVY+lHIsrhNFVX2Txo+bJyiP+1LxRvJLR+ZfMi3xC+0+AleC3aKketnVx4d99UouYzWhe7ULiOXWrGMQI0V9zDqFZYOQCA2C0x/1ji1AYrXzkRJk9sKiB+1IDRFv/7hwFFKBE3HoxQCsdvJH6KErKvAQBdfeOIXP6ziYhQ2dQQfbuL15jvxb/f0Gn1m1W0H+Tb377adX+W32xkWNLgXFlVu9H41LE7sWb4gUnorE8Pwdb1WQ6eMEMQPFS7Bg5UIYCdH/uGDjSNHH06FuB0djtJMTz8iXEDw7kc+4LnxMVMtVpW1E5BjQru2t2r7Db+fekZlxI90WRQS4zmUfdhak/bC8I66fy8D+m3qmeQU/z8f0oSeJ5ItTmIfficupzYbQfD75XKJjxNFHjAJuWp8/z27g2ljLhaNlDf+qkH7FRyhSdRuVads/f3FlSj3SEAPnkDK/0JwW0ygB8kSGLukAALZSaOnTGYLr+nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(1800799009)(186009)(451199024)(38100700002)(36756003)(86362001)(31696002)(478600001)(2906002)(6512007)(53546011)(6666004)(6506007)(4326008)(6486002)(8936002)(8676002)(5660300002)(31686004)(66946007)(6916009)(316002)(54906003)(66556008)(66476007)(41300700001)(7416002)(83380400001)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmdCalNmNHFDY0ZVZnpkRWdGZ2JTZEJSelk5M2hyMnZGSmJKWFJSYkp4MnVN?=
 =?utf-8?B?T0FxOGROSllrMlN3TlQ0aEIyUUhkYzNiR2wwNTFFVkRZY1NEcDVzdFRjZlRT?=
 =?utf-8?B?TzFycHRwUDhEemY4SC9lUEJUb3lPSVBseEtHaXhOYVViOXhVNnFXWE9GVDhF?=
 =?utf-8?B?U2J0WlNENTBRY1RYOHQrOXM3R1pXUnVnWkxGc1JuWWF3aDJiZVFzelBWQk4z?=
 =?utf-8?B?aS80dVI5TlFFUSs5RS81MENiSmUvS0hiSnB2Z0lRWFB1UnptYmlkemdWbys4?=
 =?utf-8?B?dnM4akNibFM2MXNQamduQ0swd3h0UHVHZkxYSXlWZnVWdkkzYWtlTXFWd0FZ?=
 =?utf-8?B?U3A1QmlaZDl1QnVFUERSaklrbzk5NkR2elh1RGtNNGI1WkxES29jeDNwVENz?=
 =?utf-8?B?c0dsN0ZLTFljQ0kwNU5FUlEzbzZMMHo1bTZkZmJUaUhWeStkZkVOWHJEbGVH?=
 =?utf-8?B?MEx0OVc2RWVkUXRReEtlYUtibTF2TEVEc1V4YmFXVk5hcDVIM0xoTXVKZk5W?=
 =?utf-8?B?S01TVHNYeGVFU0tpbE5Kc1pBT3R4ajRzM3NyWmpqbGJ5Nzg3WkkzZ2FqMGFu?=
 =?utf-8?B?ZjNZcnBYeUFmVU1GWHVqdW5NSDFiM3puSmN6YVNzR0RKSjE0ZDF2bVN2dUI0?=
 =?utf-8?B?eU9NdXVmcndMMlFpUUF3SFR4SWtURFZ3S2hhVUNTL2NRY05IL3NJQWZGL2da?=
 =?utf-8?B?dXVHZDRvelYzVjJicXIyeWljVndoVGNXUjhUREVhQ2UwS0k3RnNNNkF6UGNF?=
 =?utf-8?B?bDV6WWVYUkpZUXNwZlVZVU5OUHd1RGZxR1RMQld4dGtnMDNnNGh0SllmbGhC?=
 =?utf-8?B?MytuVGxGTTFrWERMMWx5YkIrbWxMU3RSTk80Z0tsTmgwN0ZTRjRTTzlVaXBs?=
 =?utf-8?B?SEh2bko4WnU3ZFpFV2c4QTVEZEc5RjJRNC9yeDV6RFdSbFBKREl5WURSbk5X?=
 =?utf-8?B?WmFpMjJnWTcyTnlpTE1QOE45RC9EZlBvcFJlQjFqbFh3MFBGaTdzVW1kUTlk?=
 =?utf-8?B?RnFTUzZPbUdLWHY4V1JHT3l0T055TkhLUTJvQloyeFdHZEtSRU5pV3dUQWtR?=
 =?utf-8?B?cEdOQ3lEdlI3Tlp3UDE2WEpqVGhtWXF6TjBlUnJHTjNJcytmWnYwWEhONjlj?=
 =?utf-8?B?NWN4bnRidG5qTjE3cmUvd0IxVkFLZW9BYUQzN21ySWFVSVZXcXVIbFdGaUtt?=
 =?utf-8?B?amt3QnQva0xWSGFoclNPTlRMZFpyMERvRGp4T2hua3RBTmJqOGNiUzNFU1NE?=
 =?utf-8?B?d3pGVUJ2MmpYOFRKVDlpdXVCbk40VjNKV2ZLa0JBazVVZlFWTVdHMlRNNHlI?=
 =?utf-8?B?a1hITXlncU9kU2xQaE9MQmFqM0xGTmlhNEhZVjBpS3FPTnZLL1RVcWdkL1RD?=
 =?utf-8?B?bE1TNmVDdHNxRXFudjlIamFEUE1CTytRdFNSaUxFTmxwMFdlbnJVUkw4a2Rk?=
 =?utf-8?B?MGQrbkdXcXk2d1BFakNtRFhPaUNvb3p5UVg1M3BjV0VIajRGK1VjM1A3c3VH?=
 =?utf-8?B?YWh6V2RiYXhHejcvS3I3QlBPZHY5b3JPdUpiak9GWnVXczY2SHNhU3Z6WjVO?=
 =?utf-8?B?RTc4VWtJc2loQnRnMHF1L0kzWUZCcm1xY2l5OFZHeEg2UTBGVzR6WGRLaURu?=
 =?utf-8?B?SDlacEVKdnBqbVBBTGx3NmlWVllwRUNNeGY0QVN4MFB0TVBqeVorcjNjaHFM?=
 =?utf-8?B?T0VRbXRWTnFYOU9id3RZNHdCQnEwWlBSaTZlVytsL0R1UXB6bWVJL3QzbHEr?=
 =?utf-8?B?Q3Bidzl2amw4L2tFbUFNdlFGb2hGUFl6QkE5MlJQbjdsbjJ1RmNJMnM3cEpM?=
 =?utf-8?B?TmErQW9KQ0t5NlMwN2FpNDdmT0JIMWpVWFJyL0krZGhZcytaaVZZcll5YTlN?=
 =?utf-8?B?ai8xYlkwMXYyRzJpWFpWdXdTWEc2OUNPc1RBdXo1Rm1VVUVCN3phWmlaN2xP?=
 =?utf-8?B?eWM5OUw4ZUIzL3VNaHBEMWZ4dHpSbVV5RkR5eHloMVhqdnRENEdKT1dCK0x5?=
 =?utf-8?B?emJmWGJ3cTFDUzBsRERqZ3RjcTVkQkZkZjFKNkJuYXpmSjFOdzdtUmZqeUxZ?=
 =?utf-8?B?blJYajN2TEhydEY4WXR2Y0tjTjZubk9wcE1HeG9CelNDK1I2TUFxQnNoNDZ0?=
 =?utf-8?Q?FFNmnzNKRCBrHpelDoLHMV9Qi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c71339-bf1a-47ec-d096-08dbaf6d9669
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:42:21.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21pKo7cT0DSznkNbD5t4HtgPcuMLDfCn94rviLfkXNdSsfbf+v5VO9iibrIBcQQTlxOLMKdoNBLNXXL5u+l5JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On 07.09.2023 03:33, Stefano Stabellini wrote:
> On Wed, 6 Sep 2023, Jan Beulich wrote:
>> On 06.09.2023 17:57, Nicola Vetrini wrote:
>>> On 05/09/2023 10:33, Jan Beulich wrote:
>>>> On 05.09.2023 10:20, Nicola Vetrini wrote:
>>>>> On 05/09/2023 09:46, Jan Beulich wrote:
>>>>>> On 05.09.2023 09:31, Nicola Vetrini wrote:
>>>>>>> Given its use in the declaration
>>>>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>>>>>> 'bits' has essential type 'enum iommu_feature', which is not
>>>>>>> allowed by the Rule as an operand to the addition operator.
>>>>>>> Given that its value can be represented by a signed integer,
>>>>>>> the explicit cast resolves the violation.
>>>>>>
>>>>>> Wait - why would this lead to a change to BITS_TO_LONGS()? And if 
>>>>>> that
>>>>>> was to be changed, why plain int? I don't think negative input makes
>>>>>> sense there, and in principle I'd expect values beyond 4 billion to
>>>>>> also be permissible (even if likely no such use will ever appear in a
>>>>>> DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
>>>>>> "unsigned long" may be too limiting ...
>>>>>>
>>>>>
>>>>> You have a point. I can think of doing it like this:
>>>>> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
> 
> I think this is a good solution for this case (even more so if we can't
> find a better implementation of BITS_TO_LONGS)
> 
> 
>>>>> on the grounds that the enum constant is representable in an int, and 
>>>>> it
>>>>> does not seem likely
>>>>> to get much bigger.
>>>>> Having an unsigned cast requires making the whole expression
>>>>> essentially unsigned, otherwise Rule 10.4 is violated because
>>>>> BITS_PER_LONG is
>>>>> essentially signed. This can be done, but it depends on how
>>>>> BITS_TO_LONGS will be/is used.
>>>>
>>>> It'll need looking closely, yes, but I expect that actually wants to be 
>>>> an
>>>> unsigned constant. I wouldn't be surprised if some use of 
>>>> DECLARE_BITMAP()
>>>> appeared (or already existed) where the 2nd argument involves sizeof() 
>>>> in
>>>> some way.
>>>>
>>>
>>> I think there's one with ARRAY_SIZE. In my opinion this can be resolved 
>>> as follows:
>>>
>>> #define BYTES_PER_LONG (1U << LONG_BYTEORDER) // the essential type gets 
>>> from signed to unsigned
>>>
>>> #define BITS_TO_LONGS(bits) \
>>>          (((unsigned long long)(bits)+BITS_PER_LONG-1U)/BITS_PER_LONG) // 
>>> same here
>>
>> Except, as said before, I consider any kind of cast on "bits" latently
>> problematic.
> 
> Can't we just do this (same but without the cast):
> 
> #define BYTES_PER_LONG (1U << LONG_BYTEORDER)
> #define BITS_TO_LONGS(bits) \
>          (((bits)+BITS_PER_LONG-1U)/BITS_PER_LONG)

Right, that's what I was expecting we'd use (with blanks suitably added of
course).

Jan

> Then we just need to make sure to pass an unsigned to BITS_TO_LONGS. In
> the case above we would do:
> 
> DECLARE_BITMAP(features, (unsigned int)IOMMU_FEAT_count)
> 


