Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193C7657C6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571203.894505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP31o-0000BH-S1; Thu, 27 Jul 2023 15:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571203.894505; Thu, 27 Jul 2023 15:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP31o-00008H-OI; Thu, 27 Jul 2023 15:35:48 +0000
Received: by outflank-mailman (input) for mailman id 571203;
 Thu, 27 Jul 2023 15:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qP31m-00007c-Qu
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:35:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4043b878-2c93-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:35:44 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A7614EE073F;
 Thu, 27 Jul 2023 17:35:43 +0200 (CEST)
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
X-Inumbo-ID: 4043b878-2c93-11ee-8613-37d641c3527e
Message-ID: <d578b45c-db4f-4176-3f8f-a8380011f668@bugseng.com>
Date: Thu, 27 Jul 2023 17:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/4] x86/emulate: move a variable declaration to
 address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <bc3a28abf9f00bf67cf5ee64bd89e7d38e321c06.1690449587.git.nicola.vetrini@bugseng.com>
 <9db05529-b4ed-89c0-a140-118c0ccf44bb@suse.com>
 <baaed0c1-2324-86ab-a6a4-6721dc67243e@bugseng.com>
 <ce404df8-eaf4-327b-e858-c5c65c13c5d0@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <ce404df8-eaf4-327b-e858-c5c65c13c5d0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/07/23 17:31, Jan Beulich wrote:
> On 27.07.2023 17:22, Nicola Vetrini wrote:
>>
>>
>> On 27/07/23 17:06, Jan Beulich wrote:
>>> On 27.07.2023 12:48, Nicola Vetrini wrote:
>>>> --- a/xen/arch/x86/hvm/emulate.c
>>>> +++ b/xen/arch/x86/hvm/emulate.c
>>>> @@ -2024,15 +2024,15 @@ static int cf_check hvmemul_rep_stos(
>>>>    
>>>>        switch ( p2mt )
>>>>        {
>>>> -        unsigned long bytes;
>>>>            char *buf;
>>>>    
>>>>        default:
>>>>            /* Allocate temporary buffer. */
>>>>            for ( ; ; )
>>>>            {
>>>> -            bytes = *reps * bytes_per_rep;
>>>> -            buf = xmalloc_bytes(bytes);
>>>> +            unsigned long bytes_tmp;
>>>> +            bytes_tmp = *reps * bytes_per_rep;
>>>> +            buf = xmalloc_bytes(bytes_tmp);
>>>>                if ( buf || *reps <= 1 )
>>>>                    break;
>>>>                *reps >>= 1;
>>>
>>> This wants dealing with differently - the outer scope variable is unused
>>> (only written to) afaics. Eliminating it will, aiui, address another
>>> violation at the same time. And then the same in hvmemul_rep_movs(), just
>>> that there the variable itself needs to survive. I guess I'll make a
>>> patch ...
>>
>> Wouldn't this code at line ~2068 be possibly affected by writing to
>> bytes, if the outer variable is used?
> 
> Which outer variable? I'm suggesting to drop that (see the patch that
> I've sent already).
> 
> Jan
> 
>> /* Adjust address for reverse store. */
>> if ( df )
>>     gpa -= bytes - bytes_per_rep;
>>
>> rc = hvm_copy_to_guest_phys(gpa, buf, bytes, curr);
>>
>> You're right about the other violation (R2.1)
>>
> 

I see, sorry for the noise.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

