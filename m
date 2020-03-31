Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E935B199A6C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:55:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJCJ-0006zb-QL; Tue, 31 Mar 2020 15:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJJCI-0006zW-CE
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:53:02 +0000
X-Inumbo-ID: b2a6c272-7367-11ea-ba2f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2a6c272-7367-11ea-ba2f-12813bfff9fa;
 Tue, 31 Mar 2020 15:53:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B76DBAC11;
 Tue, 31 Mar 2020 15:52:59 +0000 (UTC)
Subject: Re: [PATCH 09/11] x86/ucode/amd: Remove gratuitous memory allocations
 from cpu_request_microcode()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-10-andrew.cooper3@citrix.com>
 <a3a577ab-9470-2a6b-1e2c-b8d762b35d57@suse.com>
 <e1d54f14-9e2c-3f0b-61a4-2cbf220d1f54@citrix.com>
 <304e008b-6483-9a9a-d4e5-8dcd844ed7c7@suse.com>
 <3bc2b672-c950-8e66-e953-bea944ff84ba@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <895662e6-0667-b195-cec4-e7290ee0f697@suse.com>
Date: Tue, 31 Mar 2020 17:52:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3bc2b672-c950-8e66-e953-bea944ff84ba@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 17:47, Andrew Cooper wrote:
> On 31/03/2020 16:13, Jan Beulich wrote:
>> On 31.03.2020 16:55, Andrew Cooper wrote:
>>> On 31/03/2020 15:51, Jan Beulich wrote:
>>>> On 31.03.2020 12:05, Andrew Cooper wrote:
>>>>> @@ -497,57 +456,54 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>>>>>       * It's possible the data file has multiple matching ucode,
>>>>>       * lets keep searching till the latest version
>>>>>       */
>>>>> -    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, size,
>>>>> -                                               &offset)) == 0 )
>>>>> +    buf  += offset;
>>>>> +    size -= offset;
>>>>>      {
>>>>> -        /*
>>>>> -         * If the new ucode covers current CPU, compare ucodes and store the
>>>>> -         * one with higher revision.
>>>>> -         */
>>>>> -        if ( (microcode_fits(mc_amd->mpb) != MIS_UCODE) &&
>>>>> -             (!saved || (compare_header(mc_amd->mpb, saved) == NEW_UCODE)) )
>>>>> +        while ( size )
>>>>>          {
>>>>> -            xfree(saved);
>>>>> -            saved = mc_amd->mpb;
>>>>> -        }
>>>>> -        else
>>>>> -        {
>>>>> -            xfree(mc_amd->mpb);
>>>>> -            mc_amd->mpb = NULL;
>>>>> -        }
>>>>> +            const struct container_microcode *mc;
>>>>> +
>>>>> +            if ( size < sizeof(*mc) ||
>>>>> +                 (mc = buf)->type != UCODE_UCODE_TYPE ||
>>>>> +                 size - sizeof(*mc) < mc->len ||
>>>>> +                 !verify_patch_size(mc->len) )
>>>>> +            {
>>>>> +                printk(XENLOG_ERR "microcode: Bad microcode data\n");
>>>>> +                error = -EINVAL;
>>>>> +                break;
>>>>> +            }
>>>>>  
>>>>> -        if ( offset >= size )
>>>>> -            break;
>>>>> +            /*
>>>>> +             * If the new ucode covers current CPU, compare ucodes and store the
>>>>> +             * one with higher revision.
>>>>> +             */
>>>>> +            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
>>>>> +                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
>>>>> +            {
>>>>> +                saved = mc->patch;
>>>>> +                saved_size = mc->len;
>>>>> +            }
>>>>>  
>>>>> -        /*
>>>>> -         * 1. Given a situation where multiple containers exist and correct
>>>>> -         *    patch lives on a container that is not the last container.
>>>>> -         * 2. We match equivalent ids using find_equiv_cpu_id() from the
>>>>> -         *    earlier while() (On this case, matches on earlier container
>>>>> -         *    file and we break)
>>>>> -         * 3. Proceed to while ( (error = get_ucode_from_buffer_amd(mc_amd,
>>>>> -         *                                  buf, size, &offset)) == 0 )
>>>>> -         * 4. Find correct patch using microcode_fits() and apply the patch
>>>>> -         *    (Assume: apply_microcode() is successful)
>>>>> -         * 5. The while() loop from (3) continues to parse the binary as
>>>>> -         *    there is a subsequent container file, but...
>>>>> -         * 6. ...a correct patch can only be on one container and not on any
>>>>> -         *    subsequent ones. (Refer docs for more info) Therefore, we
>>>>> -         *    don't have to parse a subsequent container. So, we can abort
>>>>> -         *    the process here.
>>>>> -         * 7. This ensures that we retain a success value (= 0) to 'error'
>>>>> -         *    before if ( mpbuf->type != UCODE_UCODE_TYPE ) evaluates to
>>>>> -         *    false and returns -EINVAL.
>>>>> -         */
>>>>> -        if ( offset + SECTION_HDR_SIZE <= size &&
>>>>> -             *(const uint32_t *)(buf + offset) == UCODE_MAGIC )
>>>>> -            break;
>>>>> +            /* Move over the microcode blob. */
>>>>> +            buf  += sizeof(*mc) + mc->len;
>>>>> +            size -= sizeof(*mc) + mc->len;
>>>>> +
>>>>> +            /*
>>>>> +             * Peek ahead.  If we see the start of another container, we've
>>>>> +             * exhaused all microcode blobs in this container.  Exit cleanly.
>>>>> +             */
>>>>> +            if ( size >= 4 && *(const uint32_t *)buf == UCODE_MAGIC )
>>>>> +                break;
>>>> While, as already indicated, I agree with shrinking the big comment,
>>>> I think point 6 is what wants retaining in some form - it's not
>>>> obvious at all why a subsequent container couldn't contain a higher
>>>> rev ucode than what we've found. That comment refers us to docs, but
>>>> I couldn't find anything to this effect in PM Vol 2. Assuming this
>>>> indeed documented and true, with the comment extended accordingly
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> I think it is referring to the internal PPR, which isn't even the one we
>>> have access to.
>>>
>>> As to the multiple containers aspect, I've deliberately "fixed" that in
>>> patch 11 so we do scan all the way to the end.
>> Right, meanwhile I've seen this. But shouldn't patch 11 then adjust at
>> least the "Exit cleanly" part of the comment? You're merely breaking
>> the inner loop then ...
> 
> I'd still argue that "exit cleanly" is fine in context.

Maybe; to me "exit" suggests more like being done with all processing /
looping. I'm not going to insist - you're the native speaker.

> Without it, the end of buffer case happens fine as size becomes 0 and
> terminates both loops, but in the case that there is a following
> container, without it we fail because of the "!= UCODE_UCODE_TYPE" check.

Of course.

Jan

