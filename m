Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469863F5815
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 08:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170692.311567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPlS-0001a8-Gw; Tue, 24 Aug 2021 06:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170692.311567; Tue, 24 Aug 2021 06:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIPlS-0001XD-DN; Tue, 24 Aug 2021 06:18:26 +0000
Received: by outflank-mailman (input) for mailman id 170692;
 Tue, 24 Aug 2021 06:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIPlR-0001X7-1e
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 06:18:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 153f71ea-04a3-11ec-a8ab-12813bfff9fa;
 Tue, 24 Aug 2021 06:18:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-GDu2f5Z3OjihrBHcZXN9BQ-1; Tue, 24 Aug 2021 08:18:21 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7732.eurprd04.prod.outlook.com (2603:10a6:20b:237::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 06:18:19 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 06:18:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 06:18:19 +0000
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
X-Inumbo-ID: 153f71ea-04a3-11ec-a8ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629785902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZH1b1WONHeUppUmcrKdr4F4XzN3c8Xjs8z3MgFm2jFc=;
	b=MgBEunKSgfGUzmM1cG4MHrYiAottFm8yhobLT5mTdrHEEjS7Ynpbr6wv7oHaO+o5Ts+Oio
	7xgQipkuD6PtbnUv9fLJH5K05yf4WgYWUOYXhNO/PVQ3UVI3NQP9TmdnXXgPr5KmZvuMCW
	w1qRsz8uKJgyQ1VBfzCHmBuy/buAYwY=
X-MC-Unique: GDu2f5Z3OjihrBHcZXN9BQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kg8Usbm2T1z4xXlQCD52YXGffxov/abtmdRYKWwtVXT0r03zyJi9I9yYTttKb1adoFuIQ4KuhGQ2M/3/liIa8NapEhBOQtinyaEYVbXNuTEG9U2ClClxoX6uaPcU+UuhzyBx91JThQtB3+0ZNQOazcnYB5WMcBQUddPtmdQrdFlRQb/7oaCzKZk4RxBDV2QEMgSjYZ/EUbTbefgAAtc73IhPFnw4SlgodPK65m+9Akl92DmRTckoXOFezu0KOqJTZN+Ly+pFge51xLSDJuSiKMghzsCMBEgvQS7aWX1U9romKTFx8R7ZSs00Plio+U6BbiMdMGUjPhGdO4AUYHOq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH1b1WONHeUppUmcrKdr4F4XzN3c8Xjs8z3MgFm2jFc=;
 b=YpnYucDEF8f2pbbpwd/s4zdvbydGW+tOUSeOh9zFGEhBjCwPeoO+pE2DHSHMZxQQJyeKzhMWrvRp8832IQsWSQQc3HBOFYhwYTEE2YzXFNPdSVeOCwK/v1KUWf8dabIO7cVpfXFHZTa9xBe+Fo4rgiH2BPs2IQSYQjUFVOqGhQElaOgogqEF7loOnt6J7QurLAhkVN0GI5POCvTyGoELZbl6zpbtUfeE6Lh4zx+YmF8y1J46XqeONlzyA/POMcVH2pI7belv+5hvekzIemh/ulDI3KQ292/+/afqFpZYkos3uYxFfud4FPGUZS9/KhrrBMIGnH8prquiaViRzZvEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: cs.pub.ro; dkim=none (message not signed)
 header.d=none;cs.pub.ro; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Costin Lupu <costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
 <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
 <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
 <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <addff815-987d-4ffa-3ed5-fcd9bba83cc5@suse.com>
Date: Tue, 24 Aug 2021 08:18:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2897589-c04c-4fec-dff5-08d966c6f7bd
X-MS-TrafficTypeDiagnostic: AM8PR04MB7732:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7732DC81D9E4A8DEEE621169B3C59@AM8PR04MB7732.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+IgulUlE5dDdhlcdhDkYD90TlNiodqWB8C9Ng85vTtY8VZZTm9Tq/doO0D7vmFkfG2/p3lVi2qdd2zI4Q9Y1Q+kJVRX6qNxthbRZjlR2Yk0XX85psRbdA4LPkGiVKPczZtSW70K1hqsZMIZaC9toBzMceNkEnE3zn5IkmzAjbnv5HP2qpv1HwEeMtyk1bQMfF9ZOwR6XS7/qiNF0hVIKHtvm0W1MOXgaPLZDxQerMNW9ybtwlSq4uiApoj1QHGO/rN1xk64nKE3iMeN7dKH8wds5Cz4kI7XEZkJXs61hl04Qm+MSfHtns/Jue0eSjEQbrKEbfSL9Ht5BQpOLuxfoavcdD8SUM9gHW7OC5NkDNi04/XOWeXKidJdpHaDUNtZfVi+izfea/BYqucaJdc/dlYt1K4czD5Ro1OJXLjcKJhvZeYptR+gPzt/QE5qveVCSgf6rdik4zCg7nzwpLkX2ErHaPGaKeL8+ruJsVzruz4OB0wjl/Xn7tjM2i/Ty1lUQT9lZJM4IGJ6C4rKjHcj85eJeSwTfoCtuJ2JA20FiaYvHBUy7zQBg/pBemzIAgvNGz4Bcie1UoZHhsQdHDZuXoxxoFaLzl963FElf3jiKOmGA733uysQ7r8hG2xSMnkb5AZmqYLCI9UEJH2qQDrMHoTHasLzNqzAgS/OS/YDXR7YOd2i+F5QdVNZoI1LWye5I7eOuFqNbjuj6bUngSqcdDz0Gy2xndUtrC4SDCIByN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(6486002)(31696002)(83380400001)(66556008)(2616005)(26005)(956004)(2906002)(186003)(53546011)(36756003)(8676002)(54906003)(86362001)(6916009)(31686004)(4326008)(316002)(508600001)(66946007)(8936002)(66476007)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpoTzFoQ1JWa29JK0NWTmg2elQxVkptZFp6aTl0a3FtTVNmSitvMzBCbEIv?=
 =?utf-8?B?SU43WTBwUEluL2hVQUlxRTRrWjRGeHhQU29ITHdxdENDVnFsM01DRFl4dXFU?=
 =?utf-8?B?S1N6T3FOeTVGSURPRzl1ankzV2x0TGFZelZEZ1ZFOWRPbmF4Y0V3QlZSajk4?=
 =?utf-8?B?ZTEwYW4wRmRtNUM3blkwTEFwMzNZaVRncGFWdEtFSkQvSmJ1enF6OGU1Y2xp?=
 =?utf-8?B?T2JQaTNJak53eG1haVFKdG1qUFI3TkZ6Qll5Z0s3QmhEMEdIWEZxVnp3UnNt?=
 =?utf-8?B?UUp6bi8rdWppb2RWMFdxZlQySDcvV3cxKytiNjdmdkhYcHI3TnZXSlJzNGRm?=
 =?utf-8?B?S0FtYlF0Y3NQUmw0T3Nlb1JnaW52Y2RjWUI1ajVTYXJYMVhrRzB3anNVMnhL?=
 =?utf-8?B?VjE2TGd1eVJaWFZQKytGV3dxODdvV0lldXRzSm5Celd3R1JlQlc3V0lQaHpY?=
 =?utf-8?B?aGd0aEo4OGNnK1p2TWRGaXV0UG1Rdzl6RGFIRWM2cXB1ZWNOQ1IxSnR6emVB?=
 =?utf-8?B?NzRxRHZFV2dhRWcrNlBtek0zU1VBMDhWeXFzRENwMjA4Z0J3YllyV01XM1RB?=
 =?utf-8?B?QnQ3SUhwU0JVUkpITmtSSGNMV0twUGJDVE9VUjBIclhtanZWemdPTWJTM3Ji?=
 =?utf-8?B?M1h2SkF3azNPcG4vNlRibjFLZGtla0NTUU9JR3YyYytjYUNYOEtYU3NuS1Fm?=
 =?utf-8?B?KzlxUVBnOTJ6eGVtWjJjaEZRc0lsNStrMmRDZHBSUmVLYUFuUmhDYmJQeFJB?=
 =?utf-8?B?NUtCR09TTFpNTDFKTHhmaXl3amJIRHB1QVFJSE8wWUJPYTEvK3FZWVpNYnhD?=
 =?utf-8?B?REczc2tmQXVGTWV1d2pocHBVMjViWEpibXpoWlIwK2NndEZXUCtwbVRQVWlo?=
 =?utf-8?B?ejJFV29LaGNUNjdlYmpTVEtaemtHdW9nRnNJRGJpWG5nQ1BDTUVvRkdHMGZ1?=
 =?utf-8?B?UmlSdmtuZkthYTRTQlRSdmk4bmdGTGxvNm05OE9FaVF6NzBmV0VOZzgxcGpW?=
 =?utf-8?B?RXRKMFJwK21udERpaHhjMklTWDN2SE5EeDhMaWxZZWJwR1hjNThEUXJYc0Ir?=
 =?utf-8?B?eTFQZURHSUtkcHB6b1hPempJNVgxOWJVRnVwbHYrSkplVDIvMmNWYXlkRnpH?=
 =?utf-8?B?VHYvNE5vby8wNnJPOXlDWFFoc1VTTEpVczQ5WTJ2V3ZoMllaUithejJzOVpY?=
 =?utf-8?B?NkM0Uk5DK2YrNklKRk0zeTNpTGpRWmlQd0I3aDR5V3NhSi9jYWJDVFJiNkpF?=
 =?utf-8?B?ajkwbUVFZ2hvcUhUczM1K1ZhZVVhbHpUYi8yMHlGamVoeXlEYk9SRjcwSHh4?=
 =?utf-8?B?aEcwY0cwK1ljNW53VThwZTFraVVxMUhmYkh5cXpvOXVQQ0daLzhncWVrVG1t?=
 =?utf-8?B?OVNsRkFSeUtOMDB2YkJlTDNMQXRzV0xxQWxyNjVlSEJZVVJrTDZxRW03UVNv?=
 =?utf-8?B?NVN0T2UreUVDekcvdU9CN25MUElKYm5mY00yYVFwRHl1ZStiSkJWdFZDZnU3?=
 =?utf-8?B?b0lCQzVVVUlwdEFOem8zS0lvRXdzd0FlK3M0dDRZWGxXUzEvM2h4cVBUdFdB?=
 =?utf-8?B?TkE4ZFVwVEZuSmFPOTA2R3J1OWJoUVJqSTducnI0Sk5BeldzZjNWRDlRcFZG?=
 =?utf-8?B?RTdLV2cvMUtmRExReGV1Vis1L1Q4b092cDMrZjRpcWV0YkJEalZ0dGRZWUxY?=
 =?utf-8?B?allRZGwyY1dkSUhQbVVJYjAvU1lrVEFwaUV6cjlqYXd3cUNYeS9kZFA4ZmRy?=
 =?utf-8?Q?5u3Mffq/mC7tug7I8YR7Gp9tAEm7KHAMbqzZrfS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2897589-c04c-4fec-dff5-08d966c6f7bd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 06:18:19.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCWkl1vIbO2dhwJmiowrugDUqTTXn2pHVook4qO3Y57c8xFGUMqGUGA99UxSbSXHxK9ooVOyAQlOlyrZgQQUZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732

On 23.08.2021 19:16, Julien Grall wrote:
> Hi Jan,
> 
> On 20/08/2021 10:26, Jan Beulich wrote:
>> On 20.08.2021 11:08, Julien Grall wrote:
>>> On 20/08/2021 08:44, Costin Lupu wrote:
>>>> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/include/public/page.h
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +/******************************************************************************
>>>>>> + * page.h
>>>>>> + *
>>>>>> + * Page definitions for accessing guests memory
>>>>>> + *
>>>>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>>>>> + * of this software and associated documentation files (the "Software"), to
>>>>>> + * deal in the Software without restriction, including without limitation the
>>>>>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>>>>> + * sell copies of the Software, and to permit persons to whom the Software is
>>>>>> + * furnished to do so, subject to the following conditions:
>>>>>> + *
>>>>>> + * The above copyright notice and this permission notice shall be included in
>>>>>> + * all copies or substantial portions of the Software.
>>>>>> + *
>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>>>>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>>>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>>>> + * DEALINGS IN THE SOFTWARE.
>>>>>> + *
>>>>>> + * Copyright (c) 2021, Costin Lupu
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>>>>> +#define __XEN_PUBLIC_PAGE_H__
>>>>>> +
>>>>>> +#include "xen.h"
>>>>>> +
>>>>>> +#define XEN_PAGE_SHIFT           12
>>>>>> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
>>>
>>> This will use UL whereas on Arm a page frame should always be 64-bit
>>> regardless the bitness. Shouldn't this be converted to use xen_ulong_t
>>> instead?
>>
>> As pointed out on v1, XEN_PAGE_SIZE would better not end up as a
>> value of signed type, for ...
> 
> Did you mean "not end up as a value of **unsigned** type"...

Oh, of course I did. I'm sorry for the confusion caused.

>>>>>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
>>
>> ... this to suitably sign-extend to wider types is necessary.
> 
> ... because, if I am not mistaken, the sign-extension wouldn't happen 
> with unsigned type. But then on v1 you wrote:
> 
> "Imo the smallest type this should evaluate to is xen_ulong_t"
> 
> Which I interpreted as this value should be 64-bit on Arm32. If this not 
> what you meant then I am lost.

And there I would better have said "If indeed unsigned for whatever
reason, the smallest type this should evaluate to is xen_ulong_t."

>> Also unless you expect someone to use typeof(XEN_PAGE_SIZE) I'm
>> afraid I don't see where the constant being long vs xen_long_t
>> (if such existed) might matter.
>> Otoh perhaps xen_mk_ulong() would
>> better have produced a xen_ulong_t typed values in the first
>> place, but I'm afraid we can't alter the existing macro.
> 
> We can create a new one.

But we shouldn't carelessly add stuff, as we can't later remove it.

Jan


