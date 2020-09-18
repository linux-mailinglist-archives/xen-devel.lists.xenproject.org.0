Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52B270511
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 21:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJLxy-0004CS-FT; Fri, 18 Sep 2020 19:22:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJLxw-0004CN-NY
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 19:22:40 +0000
X-Inumbo-ID: 7b791ed7-d22e-40fc-ab0c-421aa1835b6f
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b791ed7-d22e-40fc-ab0c-421aa1835b6f;
 Fri, 18 Sep 2020 19:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=FZOYqOXF8it8tpe+Ty/NQ1z150TcHVK8Be1Z3P9tGarqoBIzfozRbUCX4DG25KTXSmAKjXtX1Mv8RHN4DjCJ42/N+sGoEfY09cI06v2GPDAuJNeRaS72k4xyG9UGjoBgBhAuyZ1Fk6ber72u/PKgm+3BBfICFRdVuf5YS27z78qDrSHufahgfvLSoaga9h36xwxTEgAebZM5rHw73yShsrXsvTS0ASYS8WCDrD8gAwGF7Xt03uJSHUGs6kcy2qb6fQA9+k+Tqk7K4xvpx/KuzyuINNC0qmAmgBWGfFMNoHUhR9Oz+dP+/+WrKk4IKdg1PDTJ+kO3VBDp6Xww9UXp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtVRp5Z471FxHdyJuNzjcFstsmTeN96BIYCy23sLvVU=;
 b=ejnnkTNFlKBIzn5aktISeH2N3VkcsVkSwzmSny/7dYlic74wlXjot6kI2kHsET0lei8SZXyIQWMh/ezx34iolLE3rxzM/7Kb2o0P5AhAGJynGncDnR71hymUjoHO9zxFFdGUGFqbb7DEcK9ec5inguTNmR8YRsKebfgrLUARpUsF5MCfJLT7R+X34kyBI3mB/oHzaF5bREYdps7zXllxIA2DwdYV59e8eSgPWzJNyaxmrtIZkwRU8JctJxljN7Ypm1oAZBavGXa1/fplKWqPDqUbAVFMMXlvXODIwjHHwjzRg4cS9gNV2kWjnRDdCw06EY4KLSD2qyuDoIH2MJCJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtVRp5Z471FxHdyJuNzjcFstsmTeN96BIYCy23sLvVU=;
 b=bkkZ5qBBCpuHJc0pVABIv1LRuN/Rr/xsVV8SZ2gKnAuN1FAH/jG3xNw7Zl6K5N718ICE9uc4aBBqY101OLgro3kYG3NP5atKZpCMLI4b22qf95i8tKwzpT5tHcUxcXeFXxf+Is+EIJbcram6o3880+PVYVff8r7/KCquBpoQ0ccFEqTOw1YWszYCFWLCahcmf0HEDOh45XBcJLChOSCPs2OfYRhQUjk4SNBqCNRTPHqEzywK59EpdHznwFWmxo6R4ZhYf8voZn5IdBby1YHYtClxegf+Yo3XCE6PCUsi4aUkV9qxkkzqSaM+kC7h+V3PmkR1WHb3Xw02IC2pZltANg==
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=dornerworks.com;
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::9)
 by CY1P110MB0344.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Fri, 18 Sep
 2020 19:22:33 +0000
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b]) by CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b%4]) with mapi id 15.20.3391.019; Fri, 18 Sep 2020
 19:22:33 +0000
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>,
 Josh Whitehead <Josh.Whitehead@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
 <CY1P110MB05519EEB1C9F879D54ECF6F58C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <f8345a86-1a00-9ec9-036b-853a15484777@citrix.com>
 <CY1P110MB05510EEDEF3E1AB5967496398C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <7f3eb6c9-4e56-f5b1-c6d6-f4823b34e82c@dornerworks.com>
Date: Fri, 18 Sep 2020 15:22:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <CY1P110MB05510EEDEF3E1AB5967496398C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0060.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::30) To CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:401::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0060.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 19:22:32 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c048b5d-02af-4315-98f1-08d85c083138
X-MS-TrafficTypeDiagnostic: CY1P110MB0344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY1P110MB0344FAF4469066F33D5A0982E93F0@CY1P110MB0344.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(31696002)(44832011)(6666004)(5660300002)(54906003)(2616005)(956004)(110136005)(16576012)(508600001)(52116002)(26005)(186003)(53546011)(4326008)(6486002)(2906002)(31686004)(8676002)(66556008)(66476007)(66946007)(8936002)(86362001)(36756003)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c048b5d-02af-4315-98f1-08d85c083138
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 19:22:33.0120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0344
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/17/2020 1:57 PM, Stewart Hildebrand wrote:
> On Thursday, September 17, 2020 12:19 PM, Andrew Cooper wrote:
>> On 17/09/2020 15:57, Stewart Hildebrand wrote:
>>> On Thursday, September 17, 2020 10:43 AM, Andrew Cooper wrote:
>>>> On 16/09/2020 19:18, Jeff Kubascik wrote:
>>>>> +/*
>>>>> + * A handle with all zeros represents domain 0 if present, otherwise idle UNIT
>>>>> + */
>>>>> +#define DOM0_HANDLE ((const xen_domain_handle_t){0})
>>>> This isn't accurate.
>>>>
>>>> There are systems where dom0 doesn't have a zero UUID (XenServer for
>>>> one), and its easy to create domU's which have a zero UUID.  They are
>>>> not unique, and can be changed at any time during the running of the VM.
>>>>
>>>> If you need a unique identifier, then use domid's.
>>>>
>>>> I can't see any legitimate need for the scheduler to handle the UUID at all.
>>> We tried switching it to domid at one point in the past, but the problem was that when a domU reboots (destroy/create) the domid
>> increments, so the schedule would have to be reinstantiated.
>>
>> How are settings specified?  If they're manually while the domain is
>> running, then I'd argue that is a user bug.
> 
> It could be either prior to domain creation or after. The user needs to know the UUID (or domid, if we were to switch to domid) of the domain(s) to be scheduled.
> 
> We typically use this utility [2] which relies on tools/libxc/xc_arinc653.c
> 
> [2] https://github.com/dornerworks/a653_sched
> 
>>
>> If the settings are specified in the VM's configuration file, and they
>> aren't reapplied on reboot, then that is a toolstack bug.
>>
>>> At least that was the case before a recent patch series allowing to specify domid [1], but Jeff developed this CAST-32A series prior to
>> that. The UUID can be specified in the .cfg file, allowing domUs to reboot and come back up with the same UUID.
>>
>> The UUID can and does change at runtime in some cases, when you get into
>> more complicated lifecycle scenarios such as localhost live migration,
>> and/or VM Fork/CoW.
>>
>>
>> Having scheduler settings remembered by UUID, in the lower layers of the
>> hypervisor, feels like a layering violation.  It might work for your
>> specific usecase, but it feels like it is papering over the underlying
>> bug, and it is incompatible with other usage scenarios within Xen.
> 
> These are all good points. I'd welcome a switch to domid, but I feel it should be a separate patch or series.

Is there a configuration file or xl create option to specify the domid? I'm
unable to find the mentioned patch series, or anything in the documentation.

And agreed. The current implementation of the scheduler uses the UUID approach.
Switching to a domid approach would be better suited for a separate series.

-Jeff

