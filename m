Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2AC63EFEA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450625.707996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0i70-0004Wq-MS; Thu, 01 Dec 2022 11:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450625.707996; Thu, 01 Dec 2022 11:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0i70-0004U4-JJ; Thu, 01 Dec 2022 11:52:18 +0000
Received: by outflank-mailman (input) for mailman id 450625;
 Thu, 01 Dec 2022 11:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0i6y-0004K6-Nm
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:52:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9379c9b-716d-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 12:45:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8339.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Thu, 1 Dec
 2022 11:52:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:52:13 +0000
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
X-Inumbo-ID: b9379c9b-716d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/QnbpN8nvSsCThcV8ajzBlTqA3HVXSwViJyUwfzJ/25rj1iI0LRBnldWh4fbtnnwiGojsQhhdJ0fFOaRyptwmWQQqQw0repKAwaL0EfMNQ8PUeSQdDvzb7bcXWmkbcvy5CDlZpyQxfKhj1v2QPFOMypOosMdOBHAD5nWhwPG4j9LQIyFTOklJQIohKH50eapDLosyzDCGkr1vDm8E757dGK2JW+eHoqW+NeWObSV4f08ir3jzixPYHqiCLqLyWqUmKCsbPVLphawBC/6R/tuxR4sjF7SGOthPhMznAvtBzX9aa2+BS+9VmPtSa0LAug1u6L/uJy291kMC4fiIECow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g/ul4qbhNIp+YifkeZmyCzfUjU1gLa6XUqRzHUN97I=;
 b=ckQ/3yDT+MbkJnv4MHE1PK8g1WvdqId7CpSVfJrIFpzf6ycy77vfLdgIt6tPkGbVZIO+dyvLzzand5sziVO34G1r6XhAN55hA0MKeIAnJTkLdoMw9WyUFQ1ali0ijfa9fcxKIUjZ3ceSHotns/jbviD1fdwkEBkDXVhpyfGxuoDgX2os8cUQY7IuQ6M1oOqB21g5rgOIck7TdPW/9MFie+Fx2E8pOzkD0wcojI3RQ7Pfg+/a4siCiuXNyhZv7c4eB1PkQNCtN7/vqNKpr3u++Fdo4JV6hbL07gT52vp9P7xOG7C4Cm2QMfhZnyHv7yLgQypT/FkbVV/jNzKMsrxAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g/ul4qbhNIp+YifkeZmyCzfUjU1gLa6XUqRzHUN97I=;
 b=SprqwPUXMPPK344t+jtXanhxG8zYipft0qgoMUNwW+fZL+K8xpDkyHOUSK7Pf46oy8SWWVuGZTK3N4NaOEkL7fY89wuryAr+7sisUwQv32yxk+pHVWF6SW2+k7Upx3IEr/LaCTTu8ixMmRgXpVQb1r0hfzEYS9/m0Qw/TwxwqCloPTV+9crkwW6+3ZvjeQGxmeS76JhXWOKhPgQ/f3ergU9dpk+kxDs1039uRvUlHy8V06W1oujjbTv/dRLJpo+M2N39kbNhsSgDFyjB0mDoeVicj63jlQhrL0ITpyrATmuyoJlJVj03HoB9F69ygI6I7AmC7vbfF+r1AiQF/8o0SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f66fe5a0-a918-78d0-7314-39f420dda283@suse.com>
Date: Thu, 1 Dec 2022 12:52:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Edwin Torok <edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
 <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
 <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
 <6a5af398-270b-f57c-091c-78ebea8630ec@xen.org>
 <3eb81135-0cd5-1788-3569-0db7d68541b8@suse.com>
 <b47efecd-c2cf-8fe9-7e47-7fb22231be8d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b47efecd-c2cf-8fe9-7e47-7fb22231be8d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fb05db-709b-4ea4-40be-08dad3927c5e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8jI6qWy4O2oDdXDR64rDbrmUH/4o7xlIbKcjAWExyp1duVN7wgC9bARGV0F2gp8jlO46/VotSdM/v8r7JaAaXfNU0N9xZkQxViStU5EgJASGgfq7Q66mA4RQp1BxFcb06b07s9wDUd2yoOXIMWKGB1aTOiOM1Gaitp/wc6JQW5NksL8Y0FQXNVFf1MF5vr/T8qW+JTHn4E7SGQ4hOEDs6MK4PWrKlvva2EZaN/c3dwdvRiaSQsbLNIHx6VfzxG8r2ZomHcxJ8FRPC8nDIQgyvaXYfR6L6FbUyPVZSred54Axn1CNZ2Swe/st2irBYx8Foxe/MNKniveSVnQFdisnX8swgQ4zony3I4w8ROt9UyDOANLvbXYxTlvkr5GAtPB1QIRvp9iYFrOnEkTc/VPVFYW/88kkBr9vQb4CpHHUQBwinV0gxjxM2jnvWyJCi1yS9kc99JtUUeA/Tw3bvD7n1AqTb8rQ8OAXuviPui+DJQQeG6PtjYC8qkaQ+8YAV9qDFdkWciEzpbLisYA5b0o9JMhWDGuzEEw9yqytx3Y8z+sGc7LqFeMdJ4lE3e0PfHKwDNBJmJoMUv2kLETupigI6u73Sx8nE5pnF95GXg0pYTtEllWeK24+Hoi1zNQJ2YqwC8FENzi2LkOfGHVWx88JFFXVyUU/f8/1aI6kOLJkEoUUZD7GfMTY21fo/GAjwOuNxjBQHoTiYTpWt/2v/Wka7fzsWoEvbo8qOm613azZFmWGY3msfwRWc+bLbWD6squl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(2906002)(83380400001)(31686004)(41300700001)(2616005)(186003)(36756003)(31696002)(86362001)(8936002)(6916009)(38100700002)(26005)(54906003)(53546011)(6512007)(5660300002)(4326008)(7416002)(8676002)(66556008)(66946007)(66476007)(478600001)(6486002)(316002)(6506007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhCNWUzaE1NUU9vQ0NIUWQ0bGtsTW9vdkRoMnVMQUZaZGswUldudXUxRVNR?=
 =?utf-8?B?NmFPVndPeG5OQktONUtXSVR6QldMclRyTDU0cEhFaU9jdFQ4dFhlemRnOUgv?=
 =?utf-8?B?TmFpTkZYNnBvMGpUMTl4dHVnZ2NUem9VTm45N3dTeTBEMTM1M2lCN3gxeHZ4?=
 =?utf-8?B?YS9xOVdKNjhETGFnWUVzeitIc3Y1dDBBd016bExhMjhiYTNhcWpjb29DTStJ?=
 =?utf-8?B?ZGRnWU5NeVV5ekh5YVdxenlLUGFTdU9FV0ZocTkrWU9JVU4ycWtsODVjbmkw?=
 =?utf-8?B?dVI5SVNzNTAyVHBoZ24rUjBqc0xLZy81MmlDV2R1ZjJSOFQwMHRScXR5VjNM?=
 =?utf-8?B?Nkp6MEh0WmhFcDhwM3ZXV3ZhQTN0QzlpcHlDMUtaTDhRaGNWcXk2eU9KZ1k1?=
 =?utf-8?B?ZXZNSC8raXVQeDlHWTFObC84UXhoVWNWak5MMWMzbjh1Z080RHlBRDc1ZXhi?=
 =?utf-8?B?UkR1d2VSZkdtaEZQbEJUeGwxVGdPbUhuSW5hN2t1MDlpbkRYSnNmbFdFUGtr?=
 =?utf-8?B?WmlFbjFDMnNUcklINWEycDlXZ0FhN1MrNXFLZW9reDFZMGFjUmlRcG9tbytl?=
 =?utf-8?B?aEw3RzVVQmwxTnVqTjhIL0V4b2xzUUlmNGlTQmc3c2dQOW50bGRaWFMvbmtV?=
 =?utf-8?B?SWFrRXZjMmNGZ2VVeUs4SS9vT1ZVdys4bE9jL2JhZXNYQVhJNmZGTEh2V1cz?=
 =?utf-8?B?M2EyaDVpeXhhWXVLMEVRRHdsdFhKZVhhSVNXdWdqYnJFTlRDZjJmQVdudWYx?=
 =?utf-8?B?WklWY2tsL2dzM2lhWWFCVk5FVmVTOTNwVThEZmtCL05rN0JNM2x2YVN3ZHRn?=
 =?utf-8?B?MXdpSWc5N3dBVWdnUy9QKzY4Q0t4Snpvb2VScTA0aDFENGlIMU5qUmh5ajJY?=
 =?utf-8?B?M3NxSEZUdGhHR3c5STZoNDk4K0FCTGRYMEkwQjl1bUZvMnR4MXR1ZTZTZnRX?=
 =?utf-8?B?RGVRc0lQbVJmSFJkekh6ZFlyY3JZTzY5Z0YrT0hSSkUva0NuVmU4RE0vNUlW?=
 =?utf-8?B?QVNYdjNNTmE1MUcxcnF6b3dFUHNyRktqZ1FQdEltYWRad1JzYzVJTktMV2NR?=
 =?utf-8?B?QkxneVdTeWRaeFNZb3MxYWZOT0YxYVRvcUVGdFFKcGE3aklONXJFY0ZTY1NT?=
 =?utf-8?B?NzNGSFMyWmpxVG1EVkx0eWhVREFLMzZJeDZGVmRidzNzNk9yd01hMTU1OFMx?=
 =?utf-8?B?eVlENVQ0VlZ1YnpROW1GWmlLbDBreFFxSXlBaWlTYzc2WlBIRU4rMGhnSWZF?=
 =?utf-8?B?NzVUSWpidHhyRGREeGZTMy9uV2g5am53eURFd0J4dDZuOU9CZ3pRUzkxMG9C?=
 =?utf-8?B?MWpPM3NXanB6QVh1TWdaeFZGOVdNK1ZOMkF3YTk2VHFwVzBOWXhEUzdQd2Qr?=
 =?utf-8?B?ZXJYMjliZ0lvUWRWNmtUQ2xiY0crYlJGWjRIaHV4TFk0dDAxdjNmM2lwc29D?=
 =?utf-8?B?ZTl3M2l2Vk50SUpZckg0R3MzMnRlRXNUWnI2dGw1S3NUNlZ0ZjB4ZFRLd3o4?=
 =?utf-8?B?RVdSUElBZXYwZ3A0NlF5Q2Q1QTJqSCtQamJzcGNkeWJ6ZXB1SXlwem9Cd283?=
 =?utf-8?B?ZGNZNWI3TzF2VTlIbTFiZXYrdjFVMXJLOEQwK1FDbko3L0VNMmV3SDc4N21a?=
 =?utf-8?B?TWxNYnZJT2lqd2xOeEc1STVQYnlQaWpOS240R2QyUE0xbXgyVTEyL3VYN28x?=
 =?utf-8?B?ekZWQUdFSDJtTkZvNFhFeDJPNFFuMGcwNmQ1eXV2eUpkUFVFTDRuWHlEcXFn?=
 =?utf-8?B?WHM0UE5Bd3pkNWFieTFoaXpIbXZVYlRlVnVFazU3cjk2SmIzakQzYlc2RHlr?=
 =?utf-8?B?SjVmVHExbHZzWVhLbEdRQ1A0VkNDVVlJcFYyN0NieVlhOWJ2SDdMaUNpcGll?=
 =?utf-8?B?NHdRb0JaTWtnZFh1bjcvRnhsNU13ODk5eStURm1uSUN2aHJ0alZZdTNKaTUv?=
 =?utf-8?B?QlloYkZwaTBhN0p2c3JjNExyRVhnTWNNdzdUOHBsZnhDaHc1b0NvMnhIemhw?=
 =?utf-8?B?R0k2bnF1RnlqN3orNURJWkRsNEpnNjMvRldReE1VcWMxa053S0FYRDMyd3d1?=
 =?utf-8?B?ZjdodjVaN1dTYmdIaDdGZzlZTXlnZnVnM1dUMy90M3Z5RGY5dlVKUkUzcGZ5?=
 =?utf-8?Q?8SVfS8LhRRBZ/aNYujTxAdeqB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fb05db-709b-4ea4-40be-08dad3927c5e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 11:52:13.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS2e6aswT7PVaeF0KEnRRE/qXOPhWt4yDZRItyCtzEVQmCYti1jktTbQnbzAysE5RMeRKOPyafnKKwQRfsiDyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

On 01.12.2022 12:35, Julien Grall wrote:
> On 01/12/2022 11:30, Jan Beulich wrote:
>> On 01.12.2022 11:47, Julien Grall wrote:
>>> On 01/12/2022 10:44, Juergen Gross wrote:
>>>> On 01.12.22 11:12, Julien Grall wrote:
>>>>>> We might want to add a comment to xs_wire.h like the one in ring.h in
>>>>>> order to
>>>>>> document the requirement of the type definition of uint32_t.
>>>>>
>>>>> The problem with this approach is you made more difficult for any
>>>>> userspace application to use the headers. So I would argue that the
>>>>> Linux copy can remove "stdint.h" if needed.
>>>>
>>>> Today there is exactly one public header including stdint.h, and I'd argue
>>>> that this was a mistake.
>>
>> I think so, too.
>>
>>>> xs_wire.h is especially rather uninteresting for any user space application
>>>> but a Xenstore implementation. All consumers of xs_wire.h are probably
>>>> either in the Xen tree, or operating system kernels. User space
>>>> applications
>>>> should use libxenstore for accessing the Xenstore, so I don't see an
>>>> advantage in breaking the usual philosophy of the Xen public headers NOT
>>>> including external headers like stdint.h.
>>>
>>> I think Edwin example is a pretty good justification for including
>>> stdint.h.
>>
>> I disagree. The intention has always been for consumers to provide the
>> basic C99 types by whatever suitable means they have. Note that in Xen
>> we also have no stdint.h.
> 
> I really dislike when I have to find the dependency of an header. This 
> is really a waste of time...

I can see your point, but for Xen's public headers it has always been
that way. Plus, as said, adding (unguarded) #include <stdint.h> would
even break the building of Xen itself.

> If other disagree with that, then the strict minimum would be for this 
> dependency to be recorded if it hasn't been done (I couldn't find anywhere).

It is kind of recorded in xen/include/Makefile, with the three
"-include stdint.h" that are used there (of which one probably really
ought to be -include cstdint). But I agree this can't really count as
documentation.

>>> If you have a coding style requiring to order header alphabetically,
>>> then the developer may not even be able to include stdint.h without any
>>> hackery (e.g. introducing a header that will always be before the Xen
>>> public headers).
>>
>> Just to indicate that commonly style requirements may be weaker than
>> "fully alphabetic" - we don't request full ordering. What we request is
>> that groups (xen/, asm/, public/) be ordered within any group, but we
>> do not (afaia) demand ordering across groups (and indeed commonly we
>> have asm/ after xen/).
> Right, but that's **our** coding style. You don't know what's going to 
> be the coding style for other project.

Sure, hence me having said "may be" in my reply.

Jan

