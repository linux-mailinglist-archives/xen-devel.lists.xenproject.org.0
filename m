Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D64029B5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181034.327994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNb8i-0000Uw-VO; Tue, 07 Sep 2021 13:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181034.327994; Tue, 07 Sep 2021 13:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNb8i-0000ST-Rs; Tue, 07 Sep 2021 13:27:52 +0000
Received: by outflank-mailman (input) for mailman id 181034;
 Tue, 07 Sep 2021 13:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNb8h-0000SN-KM
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:27:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df0e0929-302e-4613-a234-1499f1b101e9;
 Tue, 07 Sep 2021 13:27:50 +0000 (UTC)
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
X-Inumbo-ID: df0e0929-302e-4613-a234-1499f1b101e9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631021270;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CmfnqghAQMqOoM1IPQVi098sHa9O0hBNYIPkFMm0Slg=;
  b=V39w2J+IFvtPtJDjCqry6ChXQAoHMqzKihZIM6px5bkBZzKIPB2JQrau
   pg8B2Ql8t0mR5iJfL1PDYke33r96lCNGewA16BQY8aN4rmzbupNRpP75d
   4UJUa1qo4QaHUoF/lHNuZMrhU6vv2CwCr8R5K5FekC91AR/9ttVp+SdQ3
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MBMbwhs+Qt/PsEDFcEedgW9L1WQkFHYIvRJ6XzlE5+EdqVBgdsQceh28n0zFOzZAzvR7PZkWvh
 wCmDq2qYH+uwhbGSrOZplbCaaHlJKjJRrfjDyKIglgUFoSGeY+/zU7Y/2eVaGYeJuwgb+tAyl5
 0hVa8zI+t2QFFB9Y6g25MVX8jWcGoXw1kIIw1aBJoxiI5/fepwoZCQB6mCotGIt7ogY0+6aH83
 r1TKVQW0EhI235a5VDUQTGCZxBBxulybwSAft5ezLa5lJsHsPCAdAfdovkt9PrOTq3fCVW9RO0
 60gMJrPgclpU5Gu3rJ4+Xnlx
X-SBRS: 5.1
X-MesageID: 52165139
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qUSAQa0UlK89prBUkz3azQqjBIEkLtp133Aq2lEZdPUCSL3gqy
 nOpoV/6feX4Ax6ZJhEo7290ca7LU80maQb3WBzB8bBYOCFgguVxdpZnO3fKlTbckWUygc678
 ldmsNFeb7N5DZB7PoTT2ODYq4dKHXsytHNuQ9+pU0dKj1XVw==
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="52165139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReJT8obGyqBoZtAvo00onIB41y5N3PnJpvki1+Iferprxd5zgPdO66QS1QH47UhQP6eGVYxIKxCkn46sTNxmqHfegMxJD/+SkHWCgRlO4FAsCr9EfRgT7zFVbzeTdea85uoh1RqJ1h2Dpvvk5HgJHs54por3fLVPnV+SGiwK41ayQe8pqQ1tTwRY/J7WN0ZYT1mGXLYdIe3jgvYfhgowasX9UUyIQkvkix7o1MEs+mTjx05iCGEKH4F+puku18qjHPIsjqsMignaP80xIk9NHqPS5S7vzAHpJeDd54nAqzyeg6sh3RAS3uWZHHqBqQ2a+d7z4ROan/iR0AwQBw8fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XZiBBNReedoay/JRiVqq7EKaNRkuz+H44YkjqwhFLpg=;
 b=TTxAnMzYVzcYhnw+diGSR0GrKhYPz6lTsR4ZSmTAAoZxUn7LRXyezDtIcD5jnG/pNh2cvzVSX/0hM16h+0DyS4NYnGU3yb6OGQbQnrniLUNRzH/VXBRAz2jA4NrnhNTH2+FVVhNp2UTrwdmq8PfSqQiYZ644jd0gZ7BXIlBbR6qUUI4wg/qN42IleflceiZVUA+LNEKCjhd3dbUb7BZdbqX2ZQdeqfGHZBoyv8625eixB8PLSngL0PHmXUA7+dUCEz3fJFFp3ZVs9ZmDgxfbBru2iTLstdSW5ehocDBVwVR4wQlo5lQ8Eg7g6JbFAvdO77ajj3N5JFPNT8hLyqcSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZiBBNReedoay/JRiVqq7EKaNRkuz+H44YkjqwhFLpg=;
 b=fd7FJCaUPFkcZR25Gn1LUZtkvrb5vLu5EnSM25EbnxBwysypAmxGw+gA0XZgjGpDHC+n8lP90WcliXFsYG5oLZhizQxuymedbOxrgt5ZZiYfTnCjeUd10nYiYKJ3te+d7jcqXq47gj9Li8E0MQ1u60SjgexzfCZTdJ1kNiZwK80=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Pu Wen <puwen@hygon.cn>, Andy Lutomirski
	<luto@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, Jane Malalane
	<jane.malalane@citrix.com>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
 <2972c71a-5fed-0813-8ec0-d179eacff14d@citrix.com>
 <70f376c6-eef2-42ce-a8eb-67c1130a41e4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
Message-ID: <dcdce06f-4a19-49c7-2225-a8e38d524dd8@citrix.com>
Date: Tue, 7 Sep 2021 14:27:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <70f376c6-eef2-42ce-a8eb-67c1130a41e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c51edc4a-7dac-4f68-772c-08d972034851
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6391:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB639166DBD1ED7E2ECEB972C4BAD39@SJ0PR03MB6391.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0Eo6sq9hIUbLzfZOrrAOCnHfqlMuWF9vFsyxmU0WrQ/3MtVmx9H7dNaT0KjfCAI4YSAo4OQ39gjQ7ZD7XVXo0ALDT/0uGGz4Ob0Oc87ge2SiejiH2JRip5bKPMmrkm8iUOKMhOIUz75sXTqbEsivfmoBzwa0oymxajpJuhfG1i+EIJraCekAsWrpn4mwJkf/crutFj3mjphr05K+aUI+vYnhA0P7gXFsBrKZDbBplIJV/bQ7ALgcTT0rDctZUZIOGvC4dEQOdcU5YCwDvwrlMavwrvpXiphqdmB7LRnsSvwYZRRwUmEc7LvhHbNExVO5m6h1lkOVvmMMG73dfEA8K2n+YHG5l9s5RgKYFXuLvOxIsiGx0itkPmUIJCvUL6a2JjKTnoY1blDtAMvo1rwyG45ILTqwO23RKzPVarP5mHF6h6Ysu9Ofa2v7S8z3ct+LFz2rSnJmHPKuRUr8VbauLQqLcympSkDwSLz7+QdAyhYjLT0G6wYMkJUQ9U8tHJNumt3xUIzxxGWnRNSeqsEQT81DNk2z5X5XYHPf/vQaHqj28lK72JObFguybuKts7Cr6h67lXiFTzh3LsQtPD3Bvbb8uw4echaS+rHljVlxxnxK6ROhMXbmxOGU289wAJW5b+Ji7HMkJA/VKANKANKDJxyYo2E341Mwkzrvilb7kL3CrlBBaUy6YYivUow5I2u0q3wZU7wcdzK8av0htPXORcpyQ1iMSYTYIwTJjb07SE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6486002)(55236004)(508600001)(316002)(83380400001)(26005)(16576012)(8676002)(6666004)(66556008)(31696002)(6916009)(66946007)(86362001)(956004)(2616005)(38100700002)(66476007)(5660300002)(8936002)(2906002)(4326008)(186003)(53546011)(107886003)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3hUUnRCMkJLNSttSFZYVTFKSmZ3bmthUCtlOUF6ei9pS0xBTVpFdHFLU1FU?=
 =?utf-8?B?czVidm01aUZCUGx0enBsSCtlakxrbjl4U2tMaUt1MnRkSjFmSytSVXg4OVNl?=
 =?utf-8?B?ODdIYWExT01NeGVOTjcybDVPbVhHbG1TR0pDS1BvYlVUYURzR0VvSnZuZ25v?=
 =?utf-8?B?VmNnaVlDMENwK0JIeTdoL2F3L1hpdktucCtTMHdWV0xDMFp1Wk13NFgyZmlk?=
 =?utf-8?B?Yld0QnZGaXc3NnE1dytETEVMNDJ3U0dSU2VmUzZuRHdhVEQxeWo2cnA0c1Q0?=
 =?utf-8?B?QmtBU3M4MC9LWS9rUGk1aC9CQStSVjhYUk5nVmFJSzRVV3FzbjREMlBjZUlU?=
 =?utf-8?B?UFR2K3A4cnprMHhYUytTcUdZbklla1dVS2ErREpCS1FYc09URzczQnVjSTZk?=
 =?utf-8?B?RHFkbCtDQzcvTGQrYTlqcXNRWjdubGtlZ0hiSWptNDZ5ZVczcS9nekFJbXJM?=
 =?utf-8?B?Z1N3NER3UGVpTkVkckMvOHplWmt1clNqQVJXd2JlaWl1cEFUNmRiWDdWbWcr?=
 =?utf-8?B?SWc1THRFZEVNdFZVcFpuNHFwd09kM1BESzYyL1gxRVQ1MDQ1eXFTUHA5YUU5?=
 =?utf-8?B?ZStQYTNOd2NoMGF5SFB6TFliLzllU1FCRXpkdmc3bHNnR2ZvaFdVcERDbmov?=
 =?utf-8?B?dGNvYkNqYW9wNHk4ZER6dFp5UjVKbmlRd2t0bXNYRUt0am0xTzdBTFB0bVhr?=
 =?utf-8?B?ZnV1TWtueU5pV1lweU92RnB3UkZIak9KdWp0RzM1d0syclo0NXh1NHkzblBD?=
 =?utf-8?B?dkNBSlV0cFI5b1VtNzc4d2d5TFREWUMvUXJXTGx4WU1JMU5oU2tXMzFWdXJm?=
 =?utf-8?B?cHBiTy95MGZBWFVkbk00K0cxQkxWZzdVOGhaLzVWT012SFdYSnZzamYrNVNU?=
 =?utf-8?B?MDcvUVF2VXhVSjJCaDI5ZmVjRldnRExZY1MzbTJBZnhPcHNDQXhPTXF5ZVBk?=
 =?utf-8?B?bERCSUMyVkhsN3p6bkNScERZeWp2TnpnUitCZ3c1SDcxbU1IS1RuamJjNnl5?=
 =?utf-8?B?RzlQVVc5QkpUdGpEU21tVFBsRm5LWDJyMTZZVDA3SzQvU1BhYU1VSWo1a08x?=
 =?utf-8?B?OWF0UkM0RWYxSkdlMy8wVFlJcmRENmZyblNOY0RFUzFocDJDTE9BMnNrUlBk?=
 =?utf-8?B?RW1MQ2RBOXpUNitVRmRhOUlmNVppNTZOMGlnb0VCQkdGSDF1WGE3U3ZmNm04?=
 =?utf-8?B?QTJxS1I0MXhJdTBjUlg4RXMyczYxMXl3Ty9QUGhkVG1WZlg0dWVaL2FQMFlY?=
 =?utf-8?B?dSs4ZmlFSWxKcWtUVHFqdWw5VW5tL241RGFRRzBvS253ZHVHb3g1b2RXMTBy?=
 =?utf-8?B?WURoU0VpTUJoZnVQNWlycld2dEl3ZEZvVGE5bmlyZ3VKSHFYR29JdnJnNWJF?=
 =?utf-8?B?UnNxV0JsYVh6U0FIeGdYRnYzZXdXak9zQXMyWDU2Nks3QXNXY2dob3FPUEhS?=
 =?utf-8?B?c29lV2tKcnVBTk1BNEk3RzNWT2I4RWNQdkQ0RmNoVzdxWWVHVTlDOTBZTVVL?=
 =?utf-8?B?NkJmUUFyS0Z5c3Z0MG5GWm5keUlZZGYxT051VHdWa2xuNkJDWjQveloxeHlh?=
 =?utf-8?B?YmlQR1RHb3VUdTk1ejBGWjV2R1lId0J4eHUyeEhUV0ppWEZDbXhIcFVJRmYz?=
 =?utf-8?B?MVBTclJNdHhlUlNsWmhhaGkxMis0dmY2bGl4bzVXNkV2MTRmZmFNZEozM1I4?=
 =?utf-8?B?MnFFcWdqcEhNQW9WcU9PT0pIbXRSWUF0T1EvT2gyUStZSmkzL3p5MEMwOXlW?=
 =?utf-8?Q?JAz8Og6l7oflZGmFVvqs1ZJs7cazRq/tqcjrPQ/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c51edc4a-7dac-4f68-772c-08d972034851
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:27:47.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qegWzUvuOVh20oKIBvHEmKo5Dpz8ZeHYDzaUgMp3v+LJ6hYaXF8tvDKXtSVhIi1LbzzuMz0PzHhAKt80bUvh5MzNWzEZv1u91cKrRcLeyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6391
X-OriginatorOrg: citrix.com

On 07/09/2021 07:09, Jan Beulich wrote:
> On 06.09.2021 20:07, Andrew Cooper wrote:
>> On 06/09/2021 16:17, Jan Beulich wrote:
>>> On 06.09.2021 14:00, Jane Malalane wrote:
>>>> --- a/xen/arch/x86/cpu/amd.c
>>>> +++ b/xen/arch/x86/cpu/amd.c
>>>> @@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>>>>  			  c->x86_capability);
>>>>  }
>>>> =20
>>>> +void detect_zen2_null_seg_behaviour(void)
>>> This can in principle be marked __init.
>>>
>>>> +{
>>>> +	uint64_t base;
>>>> +
>>>> +	wrmsrl(MSR_FS_BASE, 1);
>>>> +	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
>>> While I don't strictly mind the "m" part of the constraint to remain
>>> there (in the hope for compilers actually to support this), iirc it's
>>> not useful to have when the value is a constant: Last time I checked,
>>> the compiler would not instantiate an anonymous (stack) variable to
>>> fulfill this constraint (as can be seen when dropping the "r" part of
>>> the constraint).
>> This is "rm" because it is what we use elsewhere in Xen for selectors,
>> and because it is the correct constraints based on the legal instruction
>> encodings.
> grep-ing for "%%[defgs]s" reveals:
>
> efi_arch_post_exit_boot(), svm_ctxt_switch_to(),

These are writing multiple selectors in one go, and a register
constraint is the only sane option.

> and do_set_segment_base() all use just "r".

I had missed this one.

>  This grep has not produced
> any use of "rm". What are you talking about?

TRY_LOAD_SEG(), pv_emul_read_descriptor() for both lar and lsl,
do_double_fault() for another lsl, lldt(), ltr().

So ok - not everything, but most.

>
>> If you want to work around what you perceive to be bugs in compilers
>> then submit a independent change yourself.
> I don't perceive this as a bug; perhaps a desirable feature. I also
> did start my response with "While I don't strictly mind the "m"
> part ..." - was this not careful enough to indicate I'm not going
> to insist on the change, but I'd prefer it to be made?

No, because a maintainer saying "I'd prefer this to be changed" is still
an instruction to the submitter to make the change.

But the request is inappropriate.=C2=A0 "Last time I checked, the compiler
would" presumably means you've checked GCC and not Clang, and therefore
any conclusions about the behaviour are incomplete.

Unless there is a real concrete compiler bug to work around, "rm" is the
appropriate constraint to use, all other things being equal.=C2=A0 If the
complier is merely doing something dumb with the flexibility it has been
permitted, then fix the compiler and the problem will resolve itself the
proper way.

>
>>>> @@ -731,6 +744,11 @@ static void init_amd(struct cpuinfo_x86 *c)
>>>>  	else /* Implicily "=3D=3D 0x10 || >=3D 0x12" by being 64bit. */
>>>>  		amd_init_lfence(c);
>>>> =20
>>>> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
>>>> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c =3D=3D &boot_cpu_data =
&&
>>>> +	    c->x86 =3D=3D 0x17 && c->x86_model >=3D 30 && c->x86_model <=3D =
0x5f)
>>> DYM 0x30 here?
>> 0x30, although it turns out that some of the mobile Zen2 CPUs exceed
>> 0x60 in terms of model number.
>>
>> As Zen3 changes the family number to 0x19, I'd just drop the upper bound=
.
> Minor note: Even if it didn't, the !cpu_has_nscb would also be enough
> to avoid the probing there.

There is actually a problem.=C2=A0 From a non-AMD source, I've found the
Sucor Z+ CPU which is a Fam17h Model 0x50 Zen1.

So instead I'm going to recommend dropping all model checks and just
keeping the family checks.=C2=A0 This will extend the probe function to Zen=
1
too, but it is once on boot, trivial in terms of complexity, and really
not worth the time/effort it has taken to discover that the model list
wasn't correct to start with.

~Andrew


