Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A506E3F5EDA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171372.312723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWLV-00020V-T6; Tue, 24 Aug 2021 13:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171372.312723; Tue, 24 Aug 2021 13:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWLV-0001wh-Pj; Tue, 24 Aug 2021 13:20:05 +0000
Received: by outflank-mailman (input) for mailman id 171372;
 Tue, 24 Aug 2021 13:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIWLT-0001ds-TI
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:20:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 892c81ab-35d5-4eac-ac99-8f24c587a831;
 Tue, 24 Aug 2021 13:20:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-iBIqGOqTMym2Avy70yKiHg-1; Tue, 24 Aug 2021 15:20:00 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 13:19:58 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 13:19:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 13:19:57 +0000
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
X-Inumbo-ID: 892c81ab-35d5-4eac-ac99-8f24c587a831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629811201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72fSE2riRzC2mTvnEAY8SWvXOMu4y6ybOSZpkV7XJmI=;
	b=G1Yx+eD6911Mx4ZiqsNwq2TvGiCPUtcROPvawTKHroyK2GSveyS2ckZgG7AKpti6tSXju0
	lyOcfsMzMsGlqt0iMDJErzDX1IuUuLR0/779IJYQHD8q+oDYMlXupBQqhNVHpoENuubWFd
	D7sQKcKoOxmAMGyLYEMv0uueFRDHA6A=
X-MC-Unique: iBIqGOqTMym2Avy70yKiHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwSvbqMby9bM0/abIgpPrQh4bpjgF8aM7YUWrc50XZucPK1vKVCUF3DsvdTQ1f6HedwGqGULK85UM1fZi/oqvoQEq6vHMNDRXaZseEwSm+rHz6XHZmhaNMGBtq1nJL9zzdcdTnhNVfEFDHnqek++Dofouk59Vv4ZYiX2CVocZyIkwMp0jUWqjELfm8RD9XB6uVz8k7JMXCkfuKBSJyGMugoLUjSbzyajm3ul4tmCx2K58snCPwnj+oZBd1qm+OwSYOuZgi48BAvHLDdQwtk70/QaglANzoVyptZhNBxy08+AB1anoa3jg9lq2fnC8uKlKbgIZChmRvz5W2/QlmuPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRLToQW/y+xHhGTlC9LfAh1+0Gu4EgU8PNO/vHKLXqs=;
 b=HxvBDxeAB5CeVdx7P/z2FPKlhPY02CjUwwwjaIDcbb1o/vzNGxaOPQhNkx4enb3MzetcA9LS8on4TmWG2rfaLUIw7CsXySyae/8D4mbjtvjg/2YEPZpqHmSlbun+kqMYhycl7w1sQzqLVSMS1q8mcflZVRtARZ4uDBhYkCxfKjBRSQ2w7Oik0aO8sooU07OYprYpvH/AcRXSOv70NLS2AzJ2O+rZdxF550J2Hd28YfQL9Oe/VssbZ7Jnqn1e8uwMKcEDU06B1Tj/YFJe5daaDMACCbMcGTDW/raZwnXc2HHiCTxzQ9jUiAVkbC/+idqjdlYikNnDHYlhZr47XT4JCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
 <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
 <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
 <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
 <99049e35-3b74-f094-dca9-465126abf5ed@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17f9e226-8b0c-dc0d-bf7f-717993695634@suse.com>
Date: Tue, 24 Aug 2021 15:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <99049e35-3b74-f094-dca9-465126abf5ed@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8109cdd-61da-46ee-a44b-08d96701dee9
X-MS-TrafficTypeDiagnostic: AM8PR04MB7969:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB79696ADB269C8AB7A18ABC02B3C59@AM8PR04MB7969.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YC6s3id7HSE0l94+9T5rJ9DLUu+rzV21iBTzBb/z/0fsvx1CsHm0oFI59cPdD1qB02sQBWcnuVbRlMon7FeGnM+85X694SDpmFvy6uSfl+uxsydNi2dOKcqOIyMP6L91D0Ea0uObQ61EghYWYvu3ztmpYjBi7BYuczWhokBDBEZqYdCg61DZD2P4pmLGx8lvgTHZB21CjGY3dTBtzsK00djFpim51jkru/n67sH6RNNuBsae3Ufk7QjlgQjOm1spF75DJc5Wyl4OMSBol1WBztM5XdYJIEb4Fvns7LJ8/W28RldwFBnr5nKUFtsObVNI/B+iSe0dqdhHRNcUFy6LLVK/1BsAanzByRe3kSUm/aThDltraaDJ4rHKAbpA1kDwoWR9u90wPiqV37AKUPMtFQQRD2pmwswFjr0kHvtNVK1Ble+2K2L328Zra4Z7lDJhx86hft8KjZF9a9+SU3JAZYqyRWYZ94b1dGwxKEjScIWv7YuyKhh/whw2l11R3ql40JbFWjk0/mY+0QpJ9FDkl+vWVGKzKfInEsEoOL3UIHiVWTcpVFHP6A15B7u1j4e9RzRAnWyiz0iTFl3elpwSZ/K1Pq5UNtGbhDAhsc06vjuzYbPZVHd7FJ6eYAz4qjHM802HyifyWeFULnuRp3EFAmMqY/2gCtGjWftq9TE0vsb+YL4F9nGHMPdsora+iLsP3ab72eY59LI9r3W5knridwC2hNCKfe0XudkQdzxzu+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(8676002)(956004)(6916009)(36756003)(2616005)(4326008)(38100700002)(86362001)(31696002)(83380400001)(478600001)(8936002)(31686004)(66556008)(66476007)(26005)(316002)(5660300002)(54906003)(16576012)(6486002)(186003)(53546011)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Minzye4pXzbb9R5b/3epHkhiGBnPVgN8hj3SeD95QQvG3afjLMPD89kWmkDE?=
 =?us-ascii?Q?5UkdCshfz1ltrUPl22n20Hted4IbIpjX0U+lKVG7nWwUk/tatHsjxknHWxdi?=
 =?us-ascii?Q?cdwMHCk5Dq7f6q4NKggONBvakrt4Uqlq0QfnMz0z4Vc/yugtkwZRG5c74VwV?=
 =?us-ascii?Q?kZuwhVJ/YUbnlBknrZR9D1KYdSfVeCbudUFdZbSX8t4mYSRIZhBTC8+f92r3?=
 =?us-ascii?Q?apkWLoKWB5/JoDzRM7aOdd/znJAZQfr8qeKA1wV0axM5CBrF/W4lKWS7RiJ9?=
 =?us-ascii?Q?tcMJBXrmgkXEv6FNdTHnkvW1NWII9ms0fJPQ+PvGpW7/GTcX37lDPfnYb3se?=
 =?us-ascii?Q?KEemYnmooMWtgliQxnOjvGGR9Y0YBtDPZLsYLnbwxQIIHzcjlXECQdWu5fZ7?=
 =?us-ascii?Q?absHq4hBRn8WJsBrBucwIL48I08CMQKa5B5C/TEAoUgvZE+sXr+hR6t0PG1m?=
 =?us-ascii?Q?FBHLulVBLFDk6YmwsRobw7eLKNfmlmTWL2WLgtDJ5o4Tv8rb/d2G9gUGZulb?=
 =?us-ascii?Q?2qDcxqRhTcldRxslBqywMDzSW+6muruDLReW573dmeVikQSY/gfortSO7sNl?=
 =?us-ascii?Q?YPh1Ue+YIFioDLqzRRpVI2WkvzXVFr6/ZjWzPKjId3se4yUmc507Q3kkaZ/j?=
 =?us-ascii?Q?H+kAGLFXIMmxZHaCx2VS2q0vfWrTMJZxDA9fFc2Jv9teV5IaWjM49bj7CVfF?=
 =?us-ascii?Q?FLtDVGulhXrxAAGhfnGemJPnhm7skBqGXCAwiX/rdiBcRLb/+Xjq3i3puXXo?=
 =?us-ascii?Q?W6rRvSt1jqR2g0oTQ99pmhAa9bqVt9wAxPqU8RVGrNTfvL2mX/6tEWkK1u5R?=
 =?us-ascii?Q?GceiqtkUgovmBWOGdBDTA8q36vg89IOISB0X3SjGw3JwSwX3V2xJydH9hHOR?=
 =?us-ascii?Q?Tm3OcHlJM7NzXiRDeP8WMzU9giIYT/ONMvKlQ8xQmFqLxskreutLU+ctHZAR?=
 =?us-ascii?Q?XM0E0yESQFBTIR8BmIQ/aNXv/aHe1dAWeJ8HGWkzgHanwAt20Gou6AeWj1XA?=
 =?us-ascii?Q?JpYJumA5KNjRAXI6K4sArVLaX8sxDVSOMWZbfQSBLVzQWAFq2/w5QTDv7L8P?=
 =?us-ascii?Q?SYKQILUi3RS1+qTKH0rnbFtcuZy3UWWx8NQ1DzQ0qxoFTOV/FrbUDgQ+P2m8?=
 =?us-ascii?Q?Rl0THR8tvDMCQdw79WxcfekSpPeAkRjxBSxQbfNenTmJ2FlZ51BcTn789nMh?=
 =?us-ascii?Q?lHVY6/31CL8dAE2xtQeIjdCVq69oLzTyP6gbY8W9ALQbIOkWOclGbc3hYA1v?=
 =?us-ascii?Q?/RmlqMwKDuwOzYB3R8UuM/8koOTxCz60pKRWbPw017pmPm150V6XVv7ZCvv6?=
 =?us-ascii?Q?7epIufCymSAhssSmHuLThoeC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8109cdd-61da-46ee-a44b-08d96701dee9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:19:58.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGGHCBm6gJWPhydsnDSOqpK0mszXrtqOpVJvczkXIuT9FFC4tZz0h/JcHGWggLsKa+bl1h4+IGj444OGNVyioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On 24.08.2021 15:03, Costin Lupu wrote:
> On 8/23/21 8:16 PM, Julien Grall wrote:
>> On 20/08/2021 10:26, Jan Beulich wrote:
>>> On 20.08.2021 11:08, Julien Grall wrote:
>>>> On 20/08/2021 08:44, Costin Lupu wrote:
>>>>> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/include/public/page.h
>>>>>>> @@ -0,0 +1,36 @@
>>>>>>> +/*****************************************************************=
*************
>>>>>>>
>>>>>>> + * page.h
>>>>>>> + *
>>>>>>> + * Page definitions for accessing guests memory
>>>>>>> + *
>>>>>>> + * Permission is hereby granted, free of charge, to any person
>>>>>>> obtaining a copy
>>>>>>> + * of this software and associated documentation files (the
>>>>>>> "Software"), to
>>>>>>> + * deal in the Software without restriction, including without
>>>>>>> limitation the
>>>>>>> + * rights to use, copy, modify, merge, publish, distribute,
>>>>>>> sublicense, and/or
>>>>>>> + * sell copies of the Software, and to permit persons to whom the
>>>>>>> Software is
>>>>>>> + * furnished to do so, subject to the following conditions:
>>>>>>> + *
>>>>>>> + * The above copyright notice and this permission notice shall be
>>>>>>> included in
>>>>>>> + * all copies or substantial portions of the Software.
>>>>>>> + *
>>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>>>>> KIND, EXPRESS OR
>>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>>>> MERCHANTABILITY,
>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>>>>>>> EVENT SHALL THE
>>>>>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>>>>>>> OR OTHER
>>>>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>>>>> OTHERWISE, ARISING
>>>>>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>>>>> OTHER
>>>>>>> + * DEALINGS IN THE SOFTWARE.
>>>>>>> + *
>>>>>>> + * Copyright (c) 2021, Costin Lupu
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>>>>>> +#define __XEN_PUBLIC_PAGE_H__
>>>>>>> +
>>>>>>> +#include "xen.h"
>>>>>>> +
>>>>>>> +#define XEN_PAGE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 12
>>>>>>> +#define XEN_PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (xen_mk_long(1) << XEN_PAGE_SHIFT)
>>>>
>>>> This will use UL whereas on Arm a page frame should always be 64-bit
>>>> regardless the bitness. Shouldn't this be converted to use xen_ulong_t
>>>> instead?
>>>
>>> As pointed out on v1, XEN_PAGE_SIZE would better not end up as a
>>> value of signed type, for ...
>>
>> Did you mean "not end up as a value of **unsigned** type"...
>>
>>>
>>>>>>> +#define XEN_PAGE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (~(XEN_PAGE_SIZE - 1))
>>>
>>> ... this to suitably sign-extend to wider types is necessary.
>>
>> ... because, if I am not mistaken, the sign-extension wouldn't happen
>> with unsigned type. But then on v1 you wrote:
>>
>> "Imo the smallest type this should evaluate to is xen_ulong_t"
>>
>> Which I interpreted as this value should be 64-bit on Arm32. If this not
>> what you meant then I am lost.
>>
>>>
>>> Also unless you expect someone to use typeof(XEN_PAGE_SIZE) I'm
>>> afraid I don't see where the constant being long vs xen_long_t
>>> (if such existed) might matter.
>>> Otoh perhaps xen_mk_ulong() would
>>> better have produced a xen_ulong_t typed values in the first
>>> place, but I'm afraid we can't alter the existing macro.
>>
>> We can create a new one.
>>
>>>> Our stable ABI has not been designed with multiple page granularity in
>>>> mind. We could introduce a hypercall to query the page size used by th=
e
>>>> ABI. But then, I don't think we have the full picture of how this is
>>>> going to pan out (I haven't try to use another page size on Xen yet).
>>>>
>>>> I think we have three choices here:
>>>> =C2=A0=C2=A0=C2=A0 1) Stick with the existing definition in the tools
>>>> =C2=A0=C2=A0=C2=A0 2) Move the definition in the public headers and on=
ly expose them to
>>>> the tools.
>>>> =C2=A0=C2=A0=C2=A0 3) Query the page size via a new hypervisor
>>>>
>>>> As I wrote above, 3) is going to take some time to get it right. So th=
e
>>>> question here is whether 2) is temporarily better than 1).
>>>
>>> Because I understand 3) is some way out, and because I think 2) is
>>> better than 1), I wrote "might be an option" for what you call 2).
>>> But I could see people (Andrew for example) to take a different
>>> position and object to such a temporary measure.
>>
>> I think we need to make a decision so Costin doesn't keep sending
>> version on something that can't be merged. What does the others thinks?
>=20
> From what I understood, in his last reply to 'stubdom: foreignmemory:
> Fix build after 0dbb4be739c5' thread, Andrew was OK with solution 2).

I agree it can be read this way.=20

Jan


