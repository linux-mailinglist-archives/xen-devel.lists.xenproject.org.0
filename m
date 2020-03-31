Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543B199A7D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:57:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJF4-00078w-A9; Tue, 31 Mar 2020 15:55:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJJF2-00078r-UP
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:55:52 +0000
X-Inumbo-ID: 18a54fda-7368-11ea-ba2f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18a54fda-7368-11ea-ba2f-12813bfff9fa;
 Tue, 31 Mar 2020 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585670152;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7JroELh/GWcNs+kar3hKhBiJcgxPes0AXYTzGUH2Ryw=;
 b=Lbs2qp1A1KRsBI19MdrddTBZ4kYeUt6/HCPy996t5Un+zYKckNZPjHgH
 S+PaBOFQGb7sBS1l2xeg+B5X1+GmLjz1RzhzzmK6SYcmBm6x2eiJJzDNo
 Vb4Hvs0uPCO/saEa8GhdCvG7RVyBQ3JWy4K913Ywxh4kN30fuo5ZrnxQ1 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rudUzV25gWkqoLF3akodjYfFhvrC0VQER3J/yjyUb0cnZEjoWHoiobq9SsxnrzdSlgjnjOJP1n
 YwyJGYHfLQNpYqh5wbzVm+sA939GYnk+lik6DRqnIUK9nQg6cL+rXK56tCOOL2+yLsytVJV0xX
 TLD1tQZrq+qNYlMC4sVyQvDkLboBU1cp2LO9wa8yTgsyi5peb+ZdHV0kNRQTJqGQQJ6XxgcMBO
 qD0jXcu1ByJK0wyoTA3A31Jr0lgpL97mIVEIk6iorkdqiOZuR2iZZKHAtIY0cE/iFKD6UJplon
 g5A=
X-SBRS: 2.7
X-MesageID: 15597829
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15597829"
Subject: Re: [PATCH 11/11] x86/ucode/amd: Rework parsing logic in
 cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-12-andrew.cooper3@citrix.com>
 <cbb0b2c8-d06b-4b49-f955-dffe002acdae@suse.com>
 <3bcfdf14-7785-0319-26aa-b80926eff7ed@citrix.com>
 <4e47ddba-d951-d573-1357-199207d28f43@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ae77af25-8a76-0164-ea78-5c2ea61e9bc9@citrix.com>
Date: Tue, 31 Mar 2020 16:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4e47ddba-d951-d573-1357-199207d28f43@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 31/03/2020 16:27, Jan Beulich wrote:
> On 31.03.2020 17:19, Andrew Cooper wrote:
>> On 31/03/2020 16:07, Jan Beulich wrote:
>>> On 31.03.2020 12:05, Andrew Cooper wrote:
>>>> @@ -269,55 +265,25 @@ static int apply_microcode(const struct microcode_patch *patch)
>>>>      return 0;
>>>>  }
>>>>  
>>>> -static int scan_equiv_cpu_table(
>>>> -    const void *data,
>>>> -    size_t size_left,
>>>> -    size_t *offset)
>>>> +static int scan_equiv_cpu_table(const struct container_equiv_table *et)
>>>>  {
>>>>      const struct cpu_signature *sig = &this_cpu(cpu_sig);
>>>> -    const struct mpbhdr *mpbuf;
>>>> -    const struct equiv_cpu_entry *eq;
>>>> -    unsigned int i, nr;
>>>> -
>>>> -    if ( size_left < (sizeof(*mpbuf) + 4) ||
>>>> -         (mpbuf = data + *offset + 4,
>>>> -          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )
>>>> -    {
>>>> -        printk(XENLOG_WARNING "microcode: No space for equivalent cpu table\n");
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    *offset += mpbuf->len + CONT_HDR_SIZE;	/* add header length */
>>>> -
>>>> -    if ( mpbuf->type != UCODE_EQUIV_CPU_TABLE_TYPE )
>>>> -    {
>>>> -        printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table type field\n");
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    if ( mpbuf->len == 0 || mpbuf->len % sizeof(*eq) ||
>>>> -         (eq = (const void *)mpbuf->data,
>>>> -          nr = mpbuf->len / sizeof(*eq),
>>>> -          eq[nr - 1].installed_cpu) )
>>> Did this last check get lost? I can't seem to be able to identify
>>> any possible replacement.
>> Given the lack of a spec, I'm unsure whether to keep it or not.
>>
>> It is necessary in the backport of patch 1, because find_equiv_cpu_id()
>> doesn't have mpbuf->len to hand, and relies on the sentinel to find the
>> end of the table.
>>
>> OTOH, the new logic will cope perfectly well without a sentinel.
> Okay.
>
>>>>  static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
>>>>  {
>>>>      const struct microcode_patch *saved = NULL;
>>>>      struct microcode_patch *patch = NULL;
>>>> -    size_t offset = 0, saved_size = 0;
>>>> +    size_t saved_size = 0;
>>>>      int error = 0;
>>>> -    unsigned int cpu = smp_processor_id();
>>>> -    const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
>>>>  
>>>> -    if ( size < 4 ||
>>>> -         *(const uint32_t *)buf != UCODE_MAGIC )
>>>> +    while ( size )
>>>>      {
>>>> -        printk(KERN_ERR "microcode: Wrong microcode patch file magic\n");
>>>> -        error = -EINVAL;
>>>> -        goto out;
>>>> -    }
>>>> -
>>>> -    /*
>>>> -     * Multiple container file support:
>>>> -     * 1. check if this container file has equiv_cpu_id match
>>>> -     * 2. If not, fast-fwd to next container file
>>>> -     */
>>>> -    while ( offset < size )
>>>> -    {
>>>> -        error = scan_equiv_cpu_table(buf, size - offset, &offset);
>>>> -
>>>> -        if ( !error || error != -ESRCH )
>>>> -            break;
>>>> +        const struct container_equiv_table *et;
>>>> +        bool skip_ucode;
>>>>  
>>>> -        error = container_fast_forward(buf, size - offset, &offset);
>>>> -        if ( error == -ENODATA )
>>>> +        if ( size < 4 || *(const uint32_t *)buf != UCODE_MAGIC )
>>>>          {
>>>> -            ASSERT(offset == size);
>>>> +            printk(XENLOG_ERR "microcode: Wrong microcode patch file magic\n");
>>>> +            error = -EINVAL;
>>>>              break;
>>>>          }
>>>> -        if ( error )
>>>> +
>>>> +        /* Move over UCODE_MAGIC. */
>>>> +        buf  += 4;
>>>> +        size -= 4;
>>>> +
>>>> +        if ( size < sizeof(*et) ||
>>>> +             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>>>> +             size - sizeof(*et) < et->len ||
>>>> +             et->len % sizeof(et->eq[0]) )
>>>>          {
>>>> -            printk(KERN_ERR "microcode: CPU%d incorrect or corrupt container file\n"
>>>> -                   "microcode: Failed to update patch level. "
>>>> -                   "Current lvl:%#x\n", cpu, sig->rev);
>>>> +            printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
>>>> +            error = -EINVAL;
>>>>              break;
>>>>          }
>>>> -    }
>>>>  
>>>> -    if ( error )
>>>> -    {
>>>> -        /*
>>>> -         * -ENODATA here means that the blob was parsed fine but no matching
>>>> -         * ucode was found. Don't return it to the caller.
>>>> -         */
>>>> -        if ( error == -ENODATA )
>>>> -            error = 0;
>>>> -
>>>> -        goto out;
>>>> -    }
>>>> +        /* Move over the Equiv table. */
>>>> +        buf  += sizeof(*et) + et->len;
>>>> +        size -= sizeof(*et) + et->len;
>>>> +
>>>> +        error = scan_equiv_cpu_table(et);
>>>> +        if ( error && error != -ESRCH )
>>>> +            break;
>>> With this the only non-zero value left for error is -ESRCH.
>>> Hence ...
>>>
>>>> +        /* -ESRCH means no applicable microcode in this container. */
>>>> +        skip_ucode = error == -ESRCH;
>>> ... perhaps omit the "== -ESRCH" here, moving the comment up
>>> ahead of the if()?
>> That doesn't work, because you've got to reset error to 0 somewhere (to
>> avoid it leaking out if you don't find suitable microcode), and it can't
>> be before checking for errors in general.  It can't easily become a
>> conditional because skip_ucode needs setting unconditionally.
> I don't follow - what's wrong with
>
>         /* -ESRCH means no applicable microcode in this container. */
>         if ( error && error != -ESRCH )
>            break;
>         skip_ucode = error;
>         error = 0;
>
> ?

Oh - I misinterpreted your suggestion.  That looks ok.

Are you happy overall with this change?

~Andrew

