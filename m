Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756186ADF37
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 13:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507357.780742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWpy-0000To-TD; Tue, 07 Mar 2023 12:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507357.780742; Tue, 07 Mar 2023 12:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWpy-0000Ql-Pq; Tue, 07 Mar 2023 12:54:38 +0000
Received: by outflank-mailman (input) for mailman id 507357;
 Tue, 07 Mar 2023 12:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZWpx-0000Qf-DP
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 12:54:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36c09203-bce7-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 13:54:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9625.eurprd04.prod.outlook.com (2603:10a6:10:308::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 12:54:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 12:54:34 +0000
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
X-Inumbo-ID: 36c09203-bce7-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWTQ01oKAwrWmPk/tS3GMeV02HPa60IJ50gpN/PEg11rD7/73ZVBfxi2JN80BmikhSmQKwuWsn/GpeMn3idVhi0B7li0ljcOU3u8uNxTmg6hy2atkNfABXxoNnhnxK9WOXIevDGjCtoUNp44LbAWe748+ftpg9s+7bvATFTDSH/Dt5MaGt+QdjVOPsi5J8YC5M46NfcoQL6OGKNkB6/DhCOr7/5S7f2syaa4FttAZw1aP48+WHnt/nNp76DNTAFypCMYeYGU5BAwhuJKeZliOv57FL84j+QEZlBwD7W9woT7TXI/MHDTBt3fMK9P7p9EwQhDF9jw/kqfeuqSDgxjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCX7c+lGQ+RX+tEajWGSKXGtIOVDs9CjYwcvTudugio=;
 b=oVNQprjEFCv4d2OvTk8A07LXxvLqRWn2IY4O+YSj2CjRL36xZcBbqvpOT3tJqWqKjBl45RiP3EfqyXoAs6lZKyCxGf6hMEou9ixa71jIfSmj/EgkAI+eXpEt1qE/WIdE39yjnIAnj5/ueBn7D9SlmRt7gtgmO/J5MoHQ3retXXN9pLkCsyAakG8AeEse+U5V6EvOWHE8sVDzR2f5UrMzkYmAUAmuqVc90LWIukjl460WdeAotpoXLj2JZm4WrEeCq/h2f5ukvYFQEjXj72+xCxUVeFfg8X8rU+KkV5upWnRReHjHsrlWoaRreWJdxIqblqzd9w2kmbIoolUGpITD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCX7c+lGQ+RX+tEajWGSKXGtIOVDs9CjYwcvTudugio=;
 b=2eAKGlxxPp+/oR7ki/zpse3IUJmlajzdabzK9KKcB/xO+xVZPyPz7sxzgjCmoz6k99hObeTG2VczfrlWKkMVky5tstD9dcfQLVKNFlfc0v2yha3F5FlufqieC2TwySimvKVKLYnceSb7BGERHrUjdWu8F9EFWn4FsBv3oQ7w7Snh8tzmw/IddsyOe8wG0zL0Wvb2wRdYM17h8XTf7RDT8YxzOU4M6OAhlB3N2M9vWEpgXD3UfnKY6/6jb4o4LZOuVIS1dB5wNYD6E66W9rZoeCknHfa6pYzmK4+q735JfpCr4XdRDEd7aeNiCRQPhUEPTFBJLNFhgBdwwpDjIDEJGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3876c439-a249-973c-b91f-ec78443a5fc0@suse.com>
Date: Tue, 7 Mar 2023 13:54:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
 <91343570-3532-521f-9bfe-3a68902426d0@suse.com>
 <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1485c4-9644-41e8-3557-08db1f0b19ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PRu0nW3ea5ZrUsqnUJoNkSeD45Ia48M+2hwTogqRgP3udwGAAuF/wIile15q1jaXDPOGegfdFH1ejXNC7nbAdoPsVOxuzXksscmqabKzKjCTvKXqa7J/1WKKXnwN8dU9rUEThPjq0bsucQdtBqur3ahvMToNN5Dw/qYe7HSNMIvYQXiygKyDVcfn+r/dybKA+F6HFKgO59JxasxnlXUj4cDgERZfIs3wnZxEMzZc0GTd2O//dlB7KMFyKlCLQ2O3Qp9zZALfok4VV1c0X0ttc2RPgTZQhSB5s4mxnK2wuY5cNPSizKDicH48jkpjfa81Ju2qztgFkkGJJ82wxD8PfRvtrwa/Ygz5rWvqMEAj4rKtG1SD/v3dmdHRkWSlYmLDFNuB2TEhmDvwuj28TdKEyNqJF10c0ZWQrlFMjGaL6340lfhNzkllXoLDqx5Fmd1ceMH4nHiKbi96k7av9a3Owkr8KPviVCUJ5GkbB8cFEjcrL3s3FXW0gTOMEwmSQ8Vr3s2VIoRr0kfOv48E3arSQUMFJphdI+LbKsrOsXTVAq7nqqyRVQ6ZqvEyIiiknVQY3H7VGnec4Hv68olZr5j3vBtyxSHxduwfIsdFgkqpmkPmyWMi75Xk09Qg8lR1LNyQq2nqPqViZ1jCS+thhcEC1aoEoOL1vEbmRiptUvBVScr7tTNVHJtzEuT1j/NyK6eyL7v4UYRnqYhFiOFUTRphSjAom2zif6ePbTo64dnco9owCSHg9TXhCKwcE+qcJLIT15JuEmLOrLasI77lZV0X1eOi3V+76gsQzSnZIACAMrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199018)(38100700002)(86362001)(31696002)(66556008)(66476007)(36756003)(8676002)(5660300002)(6506007)(2906002)(4326008)(8936002)(66946007)(6916009)(41300700001)(186003)(2616005)(53546011)(83380400001)(316002)(478600001)(6512007)(26005)(6486002)(54906003)(31686004)(41533002)(69594002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHkvVVdZNzIvUDU1T2dvV0hYa1ozV3RYdmlaRlMyNElQVEJTRXY2djRiSDdW?=
 =?utf-8?B?WTVKeWF2UzBsOEtOMXlXcktyUXpQYk5PSWRucGN0ZTNyRmVvZnBJWlhqT201?=
 =?utf-8?B?bG1mMUx4NE13TnNXb2RNaGFGck5xWldZTXBOcSs2T1VZbzhmUXNJdi9uWXZh?=
 =?utf-8?B?UkM3Q1Z2b2tzUDFYbG1qN3o1UTR4VUR3eUVIS0ZYZFN5OWp2WXBwdVR1dTFO?=
 =?utf-8?B?REdIS2E3cGU0ejJacjlOUnVvNlJLZGREenZvelpieHBjZVg1Yk9WMklORkVR?=
 =?utf-8?B?Y3VTdXNnSDBXR1IvSFhyK3prc0VPVVB0TG1ZWDVPT2E2RVMwK0JnRVd2b1VN?=
 =?utf-8?B?N2RKaGxRT3pTTmdsTEpxQ21hTklpTlZ5dDg2UldMNjB4b0dweVNOdldwVW1j?=
 =?utf-8?B?NGZRbWg4WG1WZEFTcndYWU5WUHVPMmsxVSt5eG5jU3dOdHNyb24vTm5MZWNU?=
 =?utf-8?B?Wm42cm1HWVdOUE54dytYL3JKcGNaaEFZa2lpZG1HWGpHeWxjbExpZldjRjVl?=
 =?utf-8?B?a0VVWkhQUDFnR2hjYk1pakRlYXA3ZFY0NUd1V3I4NXJOT1E4Z1FTSm56N0dV?=
 =?utf-8?B?UFNBekNmRkJ0V3k4dmRGWER4dWZoNFdzMmhwdU0welpDdFVCRSt3Skd0Tjhm?=
 =?utf-8?B?MFJwNXZOZ0hpNmI1SWN6bmdDcmJPZ1M2Sm5IRm1aR0VOZTF2MFRFUTlPeXBa?=
 =?utf-8?B?VFM0YWgrL3lIRUFPSHc0Y1N5ckg4bkZIcUpoY2JTcXNTc0p2Sll2SUNnbVdp?=
 =?utf-8?B?Qnppa0hrVlNPRHdFVm9ZT05Lc2NEL0ZCT1BIVkhDUWtGeDhqTkFhSXAwUGRz?=
 =?utf-8?B?NkcyN0ZMOHk3Wm1XS3BQdG5jN2V6YnlKYzEzQ0gwc2oxT3IvZFVkaGNPTXNW?=
 =?utf-8?B?Slp5S2d1MGpPMmV4Zm4rME5mY0k0QmkrWnhqNzdBWVk2YnVaQlBCSENSMVdo?=
 =?utf-8?B?d2pmZG1ZSmVEc0FXa2V4R25zdmRMMEt3Z093ZUFwalB3ZVNETUdTSFhyY1BL?=
 =?utf-8?B?V1JZYUtoNVBGMndwdVIzUVUwTXdkUkEwWWNLQVllY3MyTEpkYk5TUCtFU2I5?=
 =?utf-8?B?SXNzVmZUaDJnWWtGWlBCQnlYWnRUZVRRaGc4ZmtXalhmV3p0a09yOVRpekg2?=
 =?utf-8?B?djR4LzNmRzYwQUx1TVdkcUxWV3pIUWo2NUNNR1NSRVVkV01BNElkZzZVZ0dw?=
 =?utf-8?B?c05EZERHWnlHWHFCSkZhaUlXYUl1SXBMU3lvcndyMmpYY3RKT25TVnMwcVB4?=
 =?utf-8?B?anM3YytkK2Y0aDRSanlGZlBBZHJrRjdQWTFiTi9NdWJpVVRPbzVkdW05MSsx?=
 =?utf-8?B?dXNKT1NJUVZJL3Y2Rkp3UlNvRnkxYk5POStxSFFKWE9DY2F0RHU1V0lMRUo5?=
 =?utf-8?B?a1F6UzRyR1VBYzdGQTRjMEdNSXdrMkpjLzVKT2NuT04zTitseTN6UzNBTk5p?=
 =?utf-8?B?TTI5REhQN3F4dHFiNk4wRWErblJQTWgwRmVONERxQjFyVmdrWXlOZmMxSlRi?=
 =?utf-8?B?dzEwQmdGdndKTHJ0NEhWRGZvWGJGN3QyNVc4TTVJcjZSRXo1K28rQnNtVXo2?=
 =?utf-8?B?eTlPUGFuaWlnVURKaWtDQkk1ME1iWWc0UVFOb0pkZGdTNUJ1ZEw5bXVyWjJs?=
 =?utf-8?B?RWdKYzQwd0U2d2w3NFF3dDg1YjdJbnRYeC9kaE14NTF5Wk95TUZIT3RGOWZY?=
 =?utf-8?B?UE54anlFamt5VzRpVVIrVFd1RmZPSzNvMk12cDdMNzdCY0lLcjFVdTE3SnNM?=
 =?utf-8?B?MVE4TUkzMUhPVVFSaEx1SjF2MDM4Q3FWaU8yek1uYVdoOThld3djaGoxTW9q?=
 =?utf-8?B?VUlqQVhjYjJqd0J6NEdESkFQTEUrNDJ3UG1WTkRNY0FTYk5IZlJIYXc3djlY?=
 =?utf-8?B?UjJ4ZjVqdDN1enhnakZIYURwdS9renlCYk1ybHFZWmVob29qT1VydGEzNmcv?=
 =?utf-8?B?QU5NNzdiTXFVbXg0ZnUwTnUwSyswZFRZRCtKY1F5MGlXamJLc3dCUnVIY3By?=
 =?utf-8?B?Ni9EVmhnN1FTcVA2dVRJZmNvaDVJNllLQnJhUUFRQXVVSmJCZG9DbW13aDNr?=
 =?utf-8?B?aXBkMWpSQTQ0b2VxMHcyMVRZeElnN25teVM1TER1Zi9TdUxrcE9LU3RTRDU2?=
 =?utf-8?Q?OBlWIHR1Ayhvnf58pCv2TFtiR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1485c4-9644-41e8-3557-08db1f0b19ec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 12:54:34.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NDnEHcvWK/Bbt4adWXartiueVwkWsc+s2PZYEFdDGUDZenEVwX42fPnM1qShJY1icLzg5AhqnSfHaLDFWMaqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9625

On 07.03.2023 12:32, Oleksii wrote:
> On Mon, 2023-03-06 at 11:17 +0100, Jan Beulich wrote:
>>> On 03.03.2023 11:38, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -28,6 +28,9 @@ config ALTERNATIVE_CALL
>>>>>  config ARCH_MAP_DOMAIN_PAGE
>>>>>         bool
>>>>>  
>>>>> +config GENERIC_BUG_FRAME
>>>>> +       bool
>>>
>>> With Arm now also going to use the generic logic, do we actually
>>> need
>>> this
>>> control anymore (provided things have been proven to work on Arm
>>> for
>>> the
>>> compiler range we support there)? It looks like because of the way
>>> the
>>> series is partitioned it may be necessary transiently, but it
>>> should
>>> be
>>> possible to drop it again in a new 5th patch.
> We still need it because RISC-V doesn't ready yet to use do_bug_frame()
> from xen/common/bug.c as it requires find_text_region(),
> virtual_region() and panic().
> The mentioned functionality isn't ready now for RISC-V so RISC-V will
> use only generic things from <xen/bug.h> only for some time.

Oh, right. So let's leave it for the time being, but consider dropping
it once RISC-V is more complete.

>>>>> --- /dev/null
>>>>> +++ b/xen/include/xen/bug.h
>>>>> @@ -0,0 +1,158 @@
>>>>> +#ifndef __XEN_BUG_H__
>>>>> +#define __XEN_BUG_H__
>>>>> +
>>>>> +#define BUGFRAME_run_fn 0
>>>>> +#define BUGFRAME_warn   1
>>>>> +#define BUGFRAME_bug    2
>>>>> +#define BUGFRAME_assert 3
>>>>> +
>>>>> +#define BUGFRAME_NR     4
>>>>> +
>>>>> +#ifndef BUG_FRAME_STRUCT
>>>
>>> This check won't help when it comes ahead of ...
>>>
>>>>> +#define BUG_DISP_WIDTH    24
>>>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>>>> +#endif
>>>>> +
>>>>> +#include <asm/bug.h>
>>>
>>> ... this. But is the #ifdef actually necessary? Or can the #define-
>>> s
>>> be moved ...
>>>
>>>>> +#ifndef BUG_DEBUGGER_TRAP_FATAL
>>>>> +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
>>>>> +#endif
>>>>> +
>>>>> +#ifndef __ASSEMBLY__
>>>>> +
>>>>> +#include <xen/lib.h>
>>>>> +
>>>>> +#ifndef BUG_FRAME_STRUCT
>>>
>>> ... here? (I guess having them defined early, but unconditionally
>>> is
>>> better. If an arch wants to override them, they can #undef and then
>>> #define.)
> We can't move it to #indef __ASSEMBLY__ because in this case x86
> compilation will fail as in x86's <asm/bug.h> BUG_DISP_WIDTH,
> BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH are used in case when the header
> is included in assembly code.

Oh, of course.

> I agree that there is no any sense to have the defines under "#ifndef
> BUG_FRAME_STUCT" before <asm/bug.h> but it is necessary to define them
> before <asm/bug.h>. The defines were put under "#ifndef
> BUG_FRAME_STUCT" because it seems to me that logically the defines
> should go only with definition of 'struct bug_frame'.
> 
> So it looks like the only one way we have. It is define them
> unconditionally before <asm/bug.h> and #undef if it will be necessary
> for specific architecture.
> As an option we can move the defines to #ifndef BUG_FRAME_STRUCT under
> #ifndef __ASSEMBLY__ and then define them explicitly in x86's
> <asm/bug.h> for case when the header is included some where in assembly
> code. But this option looks really weird.

Indeed.

>>>>> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do
>>>>> {                   \
>>>>> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
>>>>> BUG_LINE_HI_WIDTH));         \
>>>>> +    BUILD_BUG_ON((type) >=
>>>>> BUGFRAME_NR);                                     \
>>>>> +    asm volatile (
>>>>> _ASM_BUGFRAME_TEXT(second_frame)                          \
>>>>> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg)
>>>>> );            \
>>>>> +} while (0)
>>>
>>> Isn't this tied to BUG_FRAME_STRUCT being defined (or not)? At
>>> least
>>> the 1st BUILD_BUG_ON() looks problematic if an arch wasn't to use
>>> the generic struct: With how you have things right now
>>> BUG_LINE_{LO,HI}_WIDTH may not be defined, and the check would also
>>> be at risk of causing false positives. Perhaps it's appropriate to
>>> have a separate #ifdef (incl the distinct identifier used), but
>>> that
>>> first BUILD_BUG_ON() needs abstracting out.
> Missed that. Thanks.
> I'll introduce that a separate #ifdef before BUG_FRAME:
> 
> #ifndef BUILD_BUG_ON_LINE_WIDTH
> #define BUILD_BUG_ON_LINE_WIDTH \
>         BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
> #endif

But then please make this a function-like macro.

I'm also not convinced of the #ifndef - an arch using an entirely
different layout should have no need for this check. So I'd rather
attach the #define to what's inside #ifndef BUG_FRAME_STRUCT and
have an #else there to supply a #define to <empty> alternatively.

Jan

