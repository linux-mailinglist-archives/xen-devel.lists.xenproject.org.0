Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33F572E13
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 08:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366203.596891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBVkh-00034S-EL; Wed, 13 Jul 2022 06:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366203.596891; Wed, 13 Jul 2022 06:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBVkh-00031c-Au; Wed, 13 Jul 2022 06:21:39 +0000
Received: by outflank-mailman (input) for mailman id 366203;
 Wed, 13 Jul 2022 06:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBVkg-00031W-3p
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 06:21:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c71d48f-0274-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 08:21:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4892.eurprd04.prod.outlook.com (2603:10a6:10:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 06:21:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 06:21:35 +0000
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
X-Inumbo-ID: 0c71d48f-0274-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOCbbF91D/V0UlY5lK8o6shZQNRH7Lnn7vHd4jRlsr5q2wI8VCCSjCZ0/QExZnSjnP2u+Vm10Oram2x38sAEY4YY1tpSwUJtZNfjbtFZA8qFI8Pn0dJH6KvXTsIxiyj72SB9v3V+SMGbEyc4jwC8fBJQJEVZYkWKxCmldlI0ZxAmWOTNzvK9L2imLvitvh7kVHczbwz3hvgMxWLdI7CmfgWu/nrBc+F0tFIMkLXFZRcAQUkZet48uK88UdYFRSxvgBDTGp1WSrsPEwR/q1WrZQcueNDJvXt/8Da0Jd2K8yYlzw9ha6YYWy//m5f7p2wcI87e8ptUSIy+G1MHIGMgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEe2o8N71L3Bkw30NpqHygABlyv6r6jVEhL8AhcxjeA=;
 b=PtqSQST/BNEM14Duk7Fh/aVZuBmFGC8l7b6PYyVWFTFzYX3bl34qLGqCl3HvZMHNsOmCNio6TGsNhSdQCNUqmyYUv9gGvPV2PCHOFW2Jp1dI54Hnb9GVSBcZ4RfhR8fJjhtup2NXMlikGTP7Skaw3+a4h9NdNGylAIdQu7vnmAMdB0m1C7ARIemK13YR0cBKQKuAhKnP5IZ3fk7o/ki6xu+/Clov2IfE9pq/bcl3nKl46W1cR3pKbwFa811uxyY//rmvaryin1DkSO7Ke0VEkNLTtXXxPEF0xjBHLj+SN4wDWPqFKGYBGeUpD2LhqtT9/mVz6de1m7XL/KF73Gddhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEe2o8N71L3Bkw30NpqHygABlyv6r6jVEhL8AhcxjeA=;
 b=sycSJo401dobQzyd2TpKm5On+9XhGyMdyKtiAcra7gjjpSENVc5XTG3nc0qW8eUfTMivZKL0VFX6D/eD2mC4VIRsPV9SNHIb252s1HQ2OI5LIDo1GUPKDBB+lWrHsF32GmtB/SHVWTatMTBtmdcZEBLdmXPRIP4wYPEj8+X7gxF8KTCKp6DAcbhWJAwirhSQXvWPe3dgUwitAEy5P6tKT748w1j9H1y4OJT0c5oZ5zdPPh8jxZKtkxZq0zqdb8IlG3R5+HqpJejgLlXhak+68aimU4g4bxsbLWFrphBOlL/ygukTuKjfdzKiIaogvGzL3cSNQW6U9+lhQW4w6g/k9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
Date: Wed, 13 Jul 2022 08:21:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251dfbb1-c6ae-4564-974f-08da6497efb5
X-MS-TrafficTypeDiagnostic: DB7PR04MB4892:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5QLoVgQyXsATJ2kCyCmM0YWLjxLeXK37WvW3wEaNsBBQFi4s9qwpXNTBy6QfKGB39wOYUNorSW66B8su92OkgdrnE9SrieIs9enPxPLcKxyHn2YxVCPl8bi/S3lGNKdkb+PiCmB9qoMOHtl+RSvreQj/QX6/RPbtbu+5H0fHU7LH7W7Q4ZXR9WPqlsQ8VPZxzPY6p3PFCV1GsZBXVJqn8ZsaknuSFpNXy63Jsx5tvsOcfUlvzz3If/0ZBPcWVwjSCUzXjxJOaiekKCffD1IjGSAPgXcXW3rKu/ipA6sLONacHPNGOMI7n0fTgaWcc0sVLbv9/gj1U2BP/9GWmsqm3F1pInHd0+7YcDhSmhIaTsbJZt24xurP9DPTyQ3mzHTVmKWa1cI5WA0P2oJdWL10rvoyrWndnz1aUNFDQLK8GlE+voJKZIRooc7nwWY+MvC5bnPjmkvyQLwpl4ZkjESglZcGoARjvNla9QdGvVpLunKNhPl6FiL0QF8nuaPRhRcTRNPrlXj1XRwMP2lKs1nd2KMM7NlPHaSwl4nCvBTIRLI9zmpNyKuzOX9R6zlxIoehsdTafEP+xWLDmgFe8XKiIRsjncACMLv6yzzH8Erng5TUhimuoquefTIqTDfNvakEyFBP/iW7yeiw9wsGlj0UhZY+cM48t9N/D66yj4bB+fo82P9S0MomK23zI0etqZJg4iJ0sUv/YTY+Yb8ZTv4jF39WgUNDI6DhkDUWyCH57JS6X8KdpeRAOOzbCA9YnwSKh81jLRNZlKBplxl0JSbGWiR6KjKN/AjXDyE1Tq3JhbCMSbULbYNT7VSoC1RingeXUbkOhetBXKUUEOOJrOL5V6GrTV+UGKSefPKagaFIbDfJFGA8FgOjVHJT3lbqqOBx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(39860400002)(136003)(376002)(41300700001)(6512007)(5660300002)(8936002)(31686004)(2906002)(83380400001)(53546011)(4326008)(478600001)(38100700002)(6486002)(110136005)(36756003)(966005)(186003)(2616005)(86362001)(66946007)(8676002)(66556008)(66476007)(316002)(6506007)(26005)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUhXU0xSUFdPMUo0cm85Nnp1d0wxbnd2c2hsUUd1bzB5Uk9KdTdFTDQ1NlUr?=
 =?utf-8?B?OWtDRUtseW94UXJoTnZCS0VWa0trY0RTNERSK0w2S2NTTkJUbmpUdm1aTFh5?=
 =?utf-8?B?Q05TU3M3dDJIcUFmYWxQSEJhN05CR2swZEw1U2VTUno2UHZQZVdFVW8yUytT?=
 =?utf-8?B?bDZvWXNWQTJaREtZYmhGZnFFNXErZjh3S25uUUhuM3BWcTkwejFhUmVXTjFK?=
 =?utf-8?B?VmhZNkdzeTlqaE41ZkxVakZOZU13TGJ4NTR1UFR6b01adkV3Y3NUMW1TcGVE?=
 =?utf-8?B?cWRQSzZDempEeEFHeFBMazFQWTViOW8wc3ZLVGdjU3NWb2hSNzZVYWZRb3NT?=
 =?utf-8?B?aXN0NlRLU0tWRGI2SkxoU2o5ckI0MFp5aUo1UGYwZGxZdUJkeTl6S0FGWXRz?=
 =?utf-8?B?dk9SRUlvQktHR0hFY3Z6cTZZUnhaWG02OHZzckFDbXNWZmpsVnMzczE3V1VB?=
 =?utf-8?B?ZllvTEp4R0xLM0p4NHlUYisvWXNWc0hIY2xNNHRIVzdyQ0FRMzZZZnNOSXhK?=
 =?utf-8?B?R09udnBZdEhWWUNaQThTOWRmdjBUdmZoRXVuczhiNzZqbExndzV4TDYranEx?=
 =?utf-8?B?V0crZXVsTkVzZjFOME5saW5PZDZnS2tIOCtvL0U4T3pTeGtodFJGU3o3ZEs1?=
 =?utf-8?B?WFNxVXdUbGp0U3RCbngyY3ZicVA5Rll4UlFhcmN0NW1wbzdNM0thNTBORlpz?=
 =?utf-8?B?OHBVVSs1aE1CMHBYQmpYTkl5ODRMaTZXSFllWlQ5WlY1ZmoybGxvL2dsM1Vr?=
 =?utf-8?B?MHVhY2orRHF0Mk5Zc0MxTmk3ZUZWRUxlSkR0TVQxaVhwRWxNeUZyU1FqOU94?=
 =?utf-8?B?SngxSEhnbkRlOHZUcHplRFQvTTdFaWNqR3FLYU9ORTdyVVpxMmx5V29GeG4z?=
 =?utf-8?B?YTdzOEVsWFlHZ1hmdUtrVXJYS21adEYrcERaMmg0aUZXb1lKcDY1TFNlNkVk?=
 =?utf-8?B?NENmMXpGVUZTYjdabjc4VXMrcno0dDZRQUNvb0lMejZhRWxpTitHbklFYSs0?=
 =?utf-8?B?NCtpcFA1cHcvRUl0OHZLUm5LbW0xRU5vdCtreEh3TEJQUkhscHV5Nzk5YlRN?=
 =?utf-8?B?NVhvS3pTc0N3UXVkeXcyYVVIeFJxdHVQRGpDaFJBTmlzTys0SGVZcVJlWWRP?=
 =?utf-8?B?eG0xdy85RC9VVHJ0a1QvbmZyeHl0elZSQ0ZnMFBrVWZnQjg5UndTdy9iOE5Z?=
 =?utf-8?B?WkF6a0d1SDExbVZSbWRRT1RsVVM5SkJ4MXl6eUdodTB6STlXZWV0THM4YnhY?=
 =?utf-8?B?T0NVU0JFa3lkWHkrb2oxR2hJckFTdlJrcmM1cE9GRGtGV0RhWDBFU1dQWTZt?=
 =?utf-8?B?NDZucTR6YjBJQ281eDg3UWNOOGZRUktLU2pXMEwzaE5EVW5iSjV6MTZDSnVF?=
 =?utf-8?B?VTlsS2JzOExONTJrOEt6VFBYZk9ENVRjSjZzc2kyd1FRTkcwNlVpVkxyZDFK?=
 =?utf-8?B?eWV2a1E1Q2Z6a2JZTVNSVk14aUZ4ck16bnRldlFGaGVIbVdZS2hUVmZiUW43?=
 =?utf-8?B?K0hHY2VSdzRET0NjNFp2MUFhNWUyTTZFUVl5QlZ0OVh6MTBJV1BxVHAxYW9Q?=
 =?utf-8?B?U2NnVFpadmIzeFZWV284dENMU0M0R2RlSVAzMkFXL2x1SFZ1L2x4ZHJDZkJQ?=
 =?utf-8?B?enk5ZDVFenplMm9rNVRNSDNabVVtRk1scHNvNmtxcEJwalFWa3AzdGo3SGU0?=
 =?utf-8?B?SktZOTN2SGdQYitJeUo2VFpXUjlmcjJDUWt6VTJIdFVzOVRLZFliUkM3dUJr?=
 =?utf-8?B?WHBzblRUNUdzMGI1c1R0QXFlRzNwS1Vsemdrb252VVkwOGxUclM5dzdXVDZS?=
 =?utf-8?B?eGVvSDBHVzBQVSszNmxORXJYSGp4S1F3WC84VXgyZFgwYVFkYjUvTXhTazZC?=
 =?utf-8?B?NlBKVmQ3MXoyT0tleTNxRnAyOWhWaTVlRzV2d210eTYxeHByOCtXUEZFSHQ2?=
 =?utf-8?B?QUJENm05TitnSkYwVFcwT1ZOWmpacjdSc2pwdUpXL2M1REpEZjYxRnBvQm1k?=
 =?utf-8?B?UC94V0J3bTl5d1NWTW0wRFpENy9IQUtyeDFlSDBNcU0zdnNmaVJhVDRWUW9n?=
 =?utf-8?B?c284aE1lU0JCMmd3RGs1RVp4Q0N1d01YczFYajB3Tjl4ZnQxdjFHdmJ2ams0?=
 =?utf-8?Q?F3kcrN9sdqGRBbBzrLfs3VPfK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251dfbb1-c6ae-4564-974f-08da6497efb5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 06:21:35.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Dj5JaTexwmb6z8cMVnu8hEDMe8dIlukX8ePvKst8EfHB8J228fvHdpnlw5m+Mt2NGMKd6hwMwhAtal5BzyvEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4892

On 12.07.2022 19:28, Julien Grall wrote:
> On 11/07/2022 17:08, Rahul Singh wrote:
>>> On 22 Jun 2022, at 3:51 pm, Julien Grall <julien@xen.org> wrote:
>>> On 22/06/2022 15:37, Rahul Singh wrote:
>>>> evtchn_alloc_unbound() always allocates the next available port. Static
>>>> event channel support for dom0less domains requires allocating a
>>>> specified port.
>>>> Modify the evtchn_alloc_unbound() to accept the port number as an
>>>> argument and allocate the specified port if available. If the port
>>>> number argument is zero, the next available port will be allocated.
>>>
>>> I haven't yet fully reviewed this series. But I would like to point out that this opening a security hole (which I thought I had mention before) that could be exploited by a guest at runtime.
>>>
>>> You would need [1] or similar in order to fix the issue. I am wrote "similar" because the patch could potentially be a problem if you allow a guest to use FIFO (you may need to allocate a lot of memory to fill the hole).
>>>
>>> Cheers,
>>>
>>> [1] https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=2d89486fcf11216331e58a21b367b8a9be1af725
>>
>> Thanks for sharing the patch.  If you are okay I can use this patch in next version to fix the security hole.
> 
> I am fine with that.
> 
>>
>> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
>> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
>> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
>> In this way, we can avoid allocating a lot of memory to fill the hole.
>>
>> Let me know your view on this.
>>
>> config MAX_STATIC_PORT
>>      int "Maximum number of static ports”
>>      range 1 4095
>>      help
>>         Controls the build-time maximum number of static port supported
> 
> The problem is not exclusive to the static event channel. So I don't 
> think this is right to introduce MAX_STATIC_PORT to mitigate the issue 
> (even though this is the only user today).
> 
> A few of alternative solutions:
>    1) Handle preemption in alloc_evtchn_bucket()
>    2) Allocate all the buckets when the domain is created (the max 
> numbers event channel is known). We may need to think about preemption
>    3) Tweak is_port_valid() to check if the bucket is valid. This would 
> introduce a couple of extra memory access (might be OK as the bucket 
> would be accessed afterwards) and we would need to update some users.
> 
> At the moment, 3) is appealing me the most. I would be interested to 
> have an opionions from the other maintainers.

Fwiw of the named alternatives I would also prefer 3. Whether things
really need generalizing at this point I'm not sure, though.

Jan

