Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C31999A6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:29:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJInS-0004Dw-73; Tue, 31 Mar 2020 15:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJInP-0004Dr-Pr
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:27:19 +0000
X-Inumbo-ID: 1b94929a-7364-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b94929a-7364-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 15:27:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1019ABC2;
 Tue, 31 Mar 2020 15:27:17 +0000 (UTC)
Subject: Re: [PATCH 11/11] x86/ucode/amd: Rework parsing logic in
 cpu_request_microcode()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-12-andrew.cooper3@citrix.com>
 <cbb0b2c8-d06b-4b49-f955-dffe002acdae@suse.com>
 <3bcfdf14-7785-0319-26aa-b80926eff7ed@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e47ddba-d951-d573-1357-199207d28f43@suse.com>
Date: Tue, 31 Mar 2020 17:27:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3bcfdf14-7785-0319-26aa-b80926eff7ed@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 31.03.2020 17:19, Andrew Cooper wrote:
> On 31/03/2020 16:07, Jan Beulich wrote:
>> On 31.03.2020 12:05, Andrew Cooper wrote:
>>> @@ -269,55 +265,25 @@ static int apply_microcode(const struct microcode_patch *patch)
>>>      return 0;
>>>  }
>>>  
>>> -static int scan_equiv_cpu_table(
>>> -    const void *data,
>>> -    size_t size_left,
>>> -    size_t *offset)
>>> +static int scan_equiv_cpu_table(const struct container_equiv_table *et)
>>>  {
>>>      const struct cpu_signature *sig = &this_cpu(cpu_sig);
>>> -    const struct mpbhdr *mpbuf;
>>> -    const struct equiv_cpu_entry *eq;
>>> -    unsigned int i, nr;
>>> -
>>> -    if ( size_left < (sizeof(*mpbuf) + 4) ||
>>> -         (mpbuf = data + *offset + 4,
>>> -          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )
>>> -    {
>>> -        printk(XENLOG_WARNING "microcode: No space for equivalent cpu table\n");
>>> -        return -EINVAL;
>>> -    }
>>> -
>>> -    *offset += mpbuf->len + CONT_HDR_SIZE;	/* add header length */
>>> -
>>> -    if ( mpbuf->type != UCODE_EQUIV_CPU_TABLE_TYPE )
>>> -    {
>>> -        printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table type field\n");
>>> -        return -EINVAL;
>>> -    }
>>> -
>>> -    if ( mpbuf->len == 0 || mpbuf->len % sizeof(*eq) ||
>>> -         (eq = (const void *)mpbuf->data,
>>> -          nr = mpbuf->len / sizeof(*eq),
>>> -          eq[nr - 1].installed_cpu) )
>> Did this last check get lost? I can't seem to be able to identify
>> any possible replacement.
> 
> Given the lack of a spec, I'm unsure whether to keep it or not.
> 
> It is necessary in the backport of patch 1, because find_equiv_cpu_id()
> doesn't have mpbuf->len to hand, and relies on the sentinel to find the
> end of the table.
> 
> OTOH, the new logic will cope perfectly well without a sentinel.

Okay.

>>>  static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
>>>  {
>>>      const struct microcode_patch *saved = NULL;
>>>      struct microcode_patch *patch = NULL;
>>> -    size_t offset = 0, saved_size = 0;
>>> +    size_t saved_size = 0;
>>>      int error = 0;
>>> -    unsigned int cpu = smp_processor_id();
>>> -    const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
>>>  
>>> -    if ( size < 4 ||
>>> -         *(const uint32_t *)buf != UCODE_MAGIC )
>>> +    while ( size )
>>>      {
>>> -        printk(KERN_ERR "microcode: Wrong microcode patch file magic\n");
>>> -        error = -EINVAL;
>>> -        goto out;
>>> -    }
>>> -
>>> -    /*
>>> -     * Multiple container file support:
>>> -     * 1. check if this container file has equiv_cpu_id match
>>> -     * 2. If not, fast-fwd to next container file
>>> -     */
>>> -    while ( offset < size )
>>> -    {
>>> -        error = scan_equiv_cpu_table(buf, size - offset, &offset);
>>> -
>>> -        if ( !error || error != -ESRCH )
>>> -            break;
>>> +        const struct container_equiv_table *et;
>>> +        bool skip_ucode;
>>>  
>>> -        error = container_fast_forward(buf, size - offset, &offset);
>>> -        if ( error == -ENODATA )
>>> +        if ( size < 4 || *(const uint32_t *)buf != UCODE_MAGIC )
>>>          {
>>> -            ASSERT(offset == size);
>>> +            printk(XENLOG_ERR "microcode: Wrong microcode patch file magic\n");
>>> +            error = -EINVAL;
>>>              break;
>>>          }
>>> -        if ( error )
>>> +
>>> +        /* Move over UCODE_MAGIC. */
>>> +        buf  += 4;
>>> +        size -= 4;
>>> +
>>> +        if ( size < sizeof(*et) ||
>>> +             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>>> +             size - sizeof(*et) < et->len ||
>>> +             et->len % sizeof(et->eq[0]) )
>>>          {
>>> -            printk(KERN_ERR "microcode: CPU%d incorrect or corrupt container file\n"
>>> -                   "microcode: Failed to update patch level. "
>>> -                   "Current lvl:%#x\n", cpu, sig->rev);
>>> +            printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
>>> +            error = -EINVAL;
>>>              break;
>>>          }
>>> -    }
>>>  
>>> -    if ( error )
>>> -    {
>>> -        /*
>>> -         * -ENODATA here means that the blob was parsed fine but no matching
>>> -         * ucode was found. Don't return it to the caller.
>>> -         */
>>> -        if ( error == -ENODATA )
>>> -            error = 0;
>>> -
>>> -        goto out;
>>> -    }
>>> +        /* Move over the Equiv table. */
>>> +        buf  += sizeof(*et) + et->len;
>>> +        size -= sizeof(*et) + et->len;
>>> +
>>> +        error = scan_equiv_cpu_table(et);
>>> +        if ( error && error != -ESRCH )
>>> +            break;
>> With this the only non-zero value left for error is -ESRCH.
>> Hence ...
>>
>>> +        /* -ESRCH means no applicable microcode in this container. */
>>> +        skip_ucode = error == -ESRCH;
>> ... perhaps omit the "== -ESRCH" here, moving the comment up
>> ahead of the if()?
> 
> That doesn't work, because you've got to reset error to 0 somewhere (to
> avoid it leaking out if you don't find suitable microcode), and it can't
> be before checking for errors in general.  It can't easily become a
> conditional because skip_ucode needs setting unconditionally.

I don't follow - what's wrong with

        /* -ESRCH means no applicable microcode in this container. */
        if ( error && error != -ESRCH )
           break;
        skip_ucode = error;
        error = 0;

?

> I have been debating quite heavily whether -ESRCH is best here, or using
> -ve, 0 and 1.  However, this doesn't lead to prettier code AFAICT, and
> gains an ambiguous use for a variable named "error".

I'm fine with that choice of yours.

Jan

