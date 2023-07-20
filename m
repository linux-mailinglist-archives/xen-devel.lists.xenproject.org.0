Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3275B3B8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 18:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566688.885854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW5g-00005U-59; Thu, 20 Jul 2023 16:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566688.885854; Thu, 20 Jul 2023 16:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW5g-0008U9-2V; Thu, 20 Jul 2023 16:01:20 +0000
Received: by outflank-mailman (input) for mailman id 566688;
 Thu, 20 Jul 2023 16:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BeWc=DG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMW5e-0008Tz-75
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 16:01:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8bd3296-2716-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 18:01:17 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id A0A244EE0C89;
 Thu, 20 Jul 2023 18:01:14 +0200 (CEST)
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
X-Inumbo-ID: a8bd3296-2716-11ee-b23a-6b7b168915f2
Message-ID: <b5373244-d1e9-f90d-9b56-15897caa87f2@bugseng.com>
Date: Thu, 20 Jul 2023 18:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally
 uninitialized variables
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
 <97d8a796-f790-8efc-1d89-def1f1193e61@xen.org>
 <5da7ae40-35c7-7f93-824f-42a0712cdcf1@bugseng.com>
 <9cac9bc5-ad55-3bcd-b645-a30a5b863b3f@xen.org>
 <26008624-b00c-ecd2-77e0-3f1cad63db66@bugseng.com>
 <9a646bac-6355-7ccd-6e09-e10f942f44af@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <9a646bac-6355-7ccd-6e09-e10f942f44af@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>>> If the value is always initialized in the callee, then there's no 
>>>> problem configuring ECLAIR so that it knows that this parameter is 
>>>> always written, and therefore any subsequent use in the caller is ok.
>>>>
>>>> Another possibility is stating that a function never reads the 
>>>> pointee before writing to it (it may or may not write it, but if it 
>>>> doesn't, then the pointee is not read either). The 'strncmp' after 
>>>> 'fdt_get_path' does get in the way, though, because this property is 
>>>> not strong enough to ensure that we can use 'path' after returning 
>>>> from the function.
>>>
>>> I am not sure I fully understand what you wrote. Can you provide a C 
>>> example?
>>>
>>
>> void f(int *x) {
>>    if(x) {
>>      *x = 10;
>>      int y =*x; // read the pointee after it's initialized
>>    } else {
>>      int z; // in this branch the pointee is not read nor written
>>    }
>>    // we can say that f never reads *x before (possibly) writing to it.
>> }
> 
> I am having trouble to understand it in the context of fdt_get_path(). 
> Is 'f' meant to be fdt_get_path()?
> 

Yes, exactly. The point is that 'fdt_get_path' surely ensures not to 
read uninitialized addresses from the path array, therefore if the 
strcmp can be somehow incorporated in a function or macro e.g.

int fdt_compare_path(fdt, node, path, str) {
     /* Check that the node is under "/chosen" (first 7 chars of path) */
     ret = fdt_get_path(fdt, node, path, sizeof (path));
     if ( ret != 0 || strncmp(path, "/chosen", 7) )
         return ret;
     return 0;
}

called in bootfdt as fdt_compare_path(fdt, node, path, "/chosen");

then 'fdt_compare_path' has the, shall we say, "no read before write" 
property and because path isn't used anywhere else in 
'process_multiboot_node' that is enough to make ECLAIR happy.

>>
>> This should be probably discussed after deciding on the refactoring 
>> 'dt_property_read_string'
> 
> FAOD, I think we should refactor dt_property_read_string(). I am happy 
> to write a patch if you want.
> 

That would be perfect, I'll ll test it when I see it, so that I can give 
you feedback on that patch directly.

> 
>>>> The analysis here could use some more precision, but the modified 
>>>> construct is entirely equivalent.
>>>
>>> I agree that they are equivalent. But in general, we don't change the 
>>> style of the construct without explaining why.
>>>
>>> In this case, the first step would be to improve Eclair.
>>>
>>
>> The changes needed for this kind of analysis are not trivial: we've 
>> looked into this, but there's no easy way to support this in a timely 
>> manner. I understand that this is an estabilished pattern, but what 
>> would you think of an initializer using designators?
>>
>> uint64_t cmd[4] = {
>>          .[0] = GITS_CMD_MAPC;
>>          .[1] = 0x00;
>>          .[2] = encode_rdbase(its, cpu, collection_id) | GITS_VALID_BIT;
>>          .[3] = 0x00;
>> }
> 
> The reability is Ok here. But this may not be the case here. In 
> particular...
> 
>>
>>>>
>>>>>>       cmd[3] = 0x00;
>>>>>>       return its_send_command(its, cmd);
>>>>>> @@ -215,9 +214,7 @@ static int its_send_cmd_mapd(struct host_its 
>>>>>> *its, uint32_t deviceid,
>>>>>>       }
>>>>>>       cmd[0] = GITS_CMD_MAPD | ((uint64_t)deviceid << 32);
>>>>>>       cmd[1] = size_bits;
>>>>>> -    cmd[2] = itt_addr;
>>>>>> -    if ( valid )
>>>>>> -        cmd[2] |= GITS_VALID_BIT;
>>>>>> +    cmd[2] = itt_addr | (valid ? GITS_VALID_BIT : 0x00);
>>>>>
>>>>> Same here.
> 
> here... I much prefer the existing version.
> 

Well, that if can be kept as well. Like this:

cmd = { .[0] = .., .[2] = itt_addr, ... };
if(valid)
   cmd[2] |= GITS_VALID_BIT;

>>>>
>>>> Considering all of the replies above, a first draft of a 
>>>> strategy/policy I can think of is having:
>>>>
>>>> - Initializer functions that always write their parameter, so that 
>>>> the strongest "pointee always written" property can be stated. This 
>>>> causes all further uses to be marked safe.
>>>>
>>>> - Initialize the variable when there exists a known safe value that 
>>>> does not alter the semantics of the function. The initialization 
>>>> does not need to be at the declaration, but doing so simplifies the 
>>>> code.
>>>
>>> As I mentionned in private there are two risks with that:
>>>   1. You silence compiler to spot other issues
>>>   2. You may now get warning from Coverity if it spots you set a 
>>> value that get overwritten before its first use.
>>>
>>> So I think such approach should be used with parcimony. Instead, we 
>>> should look at reworking the code when possible.
>>>
>>
>> Do you think it would help if you look directly at actual cautions to 
>> spot possible functions that can be refactored?
> 
> I have already looked at some. Can we focus on them and see how much it 
> helps?
> 

Yes. It would reduce the noise for me too

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

