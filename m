Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB762703DA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 20:21:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJL0S-00079x-ES; Fri, 18 Sep 2020 18:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJL0R-00079s-7N
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 18:21:11 +0000
X-Inumbo-ID: 9b5b16cd-412a-459e-b1c1-f772772ee8bb
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b5b16cd-412a-459e-b1c1-f772772ee8bb;
 Fri, 18 Sep 2020 18:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=pzdMVA9RZFXz953LAia/FRVrqBA5LI4UsrTQpieN5FPsYz+0x5jpbXVV2ZQV/r2H61smo9mxj7TIIHd+Hz1NMct1Uu3R/O9KTkka1iZhfjfIgPnKh7PUQqp243hwcsMIlhtcYFR1Vmolh/Ka+Ip4vG7ZXP44DDliQmv3HToF2D/cw7aHOg3dKBYHObKOvZLrnO7f+dld+IGtxf3sBXcsVtwbOHMECNonfh1uPaqDWYsV0BFYVTMUx7HSk919n6FE4F6Faxup9ZifECb1ZwKoYNB9VCY4FQFJQVdvMBkS2Y1iY120AbzI+eJFF1E2E6+ftCQs/HRbwMEXbyGM5kpVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXFnl1Ecd+7wxa32Swz94nJ7THdy3AmS0A9VZ7tgj0g=;
 b=Oz1LoV2GkmNpEZBlP+M4mG+Xw4B8q6a2CplSaqTnTnYgR7ibgvgsie/AuEbCIGmQCdN7w6cpjwPxXFQhvSqkcHrrdXkxkO6wCVZVVuJP/r08vtWSLdh+Yaol1CvRlXUti2d425cX0GgQng2OM/62/rnC79HRs9TUMH7Genij7UwXyA9RYPRVA3RH3k5eIznCUec3e256ZKSUzGb77N4J4t1RpE9R1xxjddhczvBmMKXqGbaOMqIlnT973iDRX//M/Yo8v1rkO1XqMv3I9mdJedjHXCOKPgfSi8YslcO/6PPSLSp38oQjDG6caiVNZ848UMrtG46kdDMFUiVxupmKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXFnl1Ecd+7wxa32Swz94nJ7THdy3AmS0A9VZ7tgj0g=;
 b=j+X7yj6qSoGi0vBTakr4RlYo5gpSgUPuW0+bbLSTNe+R7OdCiyJjoqVXJlc5ALJ5F7uGBeB09ph66Cg+9rPtv/w9ZcteFihw7X1lYoi5pwwjpUe1U3tp/78NBIJ/O2mVLDHKI411P4SPEE5PUmrsx7HfAx4giAnbEE7aeOSN0eG3A9mBpAnpYcCx0DRJRO354i9n6rjcPCJw3b5k0USHfyUrvbzmzTGGt9aX5cAZEwRslRqbhIlJxNUiiOrteOkFBL9GHALIhn2dmYFwM6la6omoRLLSXLhzA9ZRUtC85zbEVj6ZHuA1bWkSZqQeFPJOShABO5IdUKWUYbLBVVzMZQ==
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::9)
 by CY1P110MB0456.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 18:21:04 +0000
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b]) by CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b%4]) with mapi id 15.20.3391.019; Fri, 18 Sep 2020
 18:21:04 +0000
Subject: Re: [PATCH 4/5] sched/arinc653: Reorganize function definition order
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
 <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
 <3828f62a38d84c7fd27cfaacc0d29d428d19d55e.camel@suse.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <1aa7b79e-e1b6-2a47-b643-3f950e43aa41@dornerworks.com>
Date: Fri, 18 Sep 2020 14:21:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <3828f62a38d84c7fd27cfaacc0d29d428d19d55e.camel@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0049.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::19) To CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:401::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17 via Frontend Transport; Fri, 18 Sep 2020 18:21:03 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a8b116-18c4-4569-b020-08d85bff9abb
X-MS-TrafficTypeDiagnostic: CY1P110MB0456:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY1P110MB04560E42EF4CECFB3F10708AE93F0@CY1P110MB0456.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(44832011)(66946007)(66556008)(66476007)(8936002)(86362001)(31686004)(956004)(508600001)(6666004)(2616005)(53546011)(52116002)(186003)(36756003)(6486002)(26005)(110136005)(83380400001)(4326008)(5660300002)(31696002)(8676002)(2906002)(54906003)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a8b116-18c4-4569-b020-08d85bff9abb
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 18:21:04.4974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0456
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

On 9/17/2020 10:16 AM, Dario Faggioli wrote:
>On Thu, 2020-09-17 at 10:12 +0200, Jan Beulich wrote:
>> On 16.09.2020 20:18, Jeff Kubascik wrote:
>>> @@ -517,27 +516,35 @@ static const struct scheduler
>>> sched_arinc653_def = {
>>>      .sched_id       = XEN_SCHEDULER_ARINC653,
>>>      .sched_data     = NULL,
>>>
>>> +    .global_init    = NULL,
>>>      .init           = a653sched_init,
>>>      .deinit         = a653sched_deinit,
>>>
>>> -    .free_udata     = a653sched_free_udata,
>>> -    .alloc_udata    = a653sched_alloc_udata,
>>> +    .alloc_pdata    = NULL,
>>> +    .switch_sched   = a653sched_switch_sched,
>>> +    .deinit_pdata   = NULL,
>>> +    .free_pdata     = NULL,
>>>
>>> +    .alloc_domdata  = NULL,
>>> +    .free_domdata   = NULL,
>>> +
>>> +    .alloc_udata    = a653sched_alloc_udata,
>>>      .insert_unit    = NULL,
>>>      .remove_unit    = NULL,
>>> +    .free_udata     = a653sched_free_udata,
>>>
>>>      .sleep          = a653sched_unit_sleep,
>>>      .wake           = a653sched_unit_wake,
>>>      .yield          = NULL,
>>>      .context_saved  = NULL,
>>>
>>> -    .do_schedule    = a653sched_do_schedule,
>>> -
>>>      .pick_resource  = a653sched_pick_resource,
>>> +    .migrate        = NULL,
>>>
>>> -    .switch_sched   = a653sched_switch_sched,
>>> +    .do_schedule    = a653sched_do_schedule,
>>>
>>>      .adjust         = NULL,
>>> +    .adjust_affinity= NULL,
>>
>> Adding all these not really needed NULL initializers looks to rather
>> move
>> this scheduler away from all the others.
>>
>Agreed, no need for more "= NULL". On the contrary, the ones that are
>there should go away.

Agreed x2, I'll remove the "= NULL" lines.

>About this:
>
>>  (Oddly enough all of them
>> explicitly set .sched_data to NULL - for whatever reason.)
>>
>Yes, we decided to keep it like that, back then. I think now it would
>be ok for it to go away too.
>
>So, Jeff, feel free to zap it with this patch or series. Or I can send
>a patch to zap all of them, as you wish.

I'll remove the ".sched_data = NULL" line above, but my scope is limited to the
ARINC653 scheduler, so I won't be able to work on this.

-Jeff

