Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2925F6C7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 11:43:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFDgO-0007Ob-Qo; Mon, 07 Sep 2020 09:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFDgN-0007OW-La
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 09:43:27 +0000
X-Inumbo-ID: 0683b9d3-48df-4088-b8e6-89eca4de28fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0683b9d3-48df-4088-b8e6-89eca4de28fa;
 Mon, 07 Sep 2020 09:43:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC3DDAC3C;
 Mon,  7 Sep 2020 09:43:26 +0000 (UTC)
Subject: Re: [PATCH v3] x86/HVM: more consistently set I/O completion
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'George Dunlap' <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
 <003301d682d6$d4b5ba20$7e212e60$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7efe7de4-bde4-a769-5817-b64b0e757a3f@suse.com>
Date: Mon, 7 Sep 2020 11:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <003301d682d6$d4b5ba20$7e212e60$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.09.2020 18:17, Paul Durrant wrote:
>> @@ -2610,8 +2612,13 @@ static const struct x86_emulate_ops hvm_
>>      .vmfunc        = hvmemul_vmfunc,
>>  };
>>
>> +/*
>> + * Note that passing HVMIO_no_completion into this function serves as kind
>> + * of (but not fully) an "auto select completion" indicator.
>> + */
>>  static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>> -    const struct x86_emulate_ops *ops)
>> +    const struct x86_emulate_ops *ops,
>> +    enum hvm_io_completion completion)
>>  {
>>      const struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
>>      struct vcpu *curr = current;
>> @@ -2642,16 +2649,31 @@ static int _hvm_emulate_one(struct hvm_e
>>          rc = X86EMUL_RETRY;
>>
>>      if ( !hvm_ioreq_needs_completion(&vio->io_req) )
>> +        completion = HVMIO_no_completion;
> 
> The comment doesn't mention that passing in something other than
> HVMIO_no_completion could get overridden. Is that intentional?

Well, it was, but since you seem to be asking for it I've added
"When there's no completion needed, the passed in value will be
 ignored in any case."

>> +    else if ( completion == HVMIO_no_completion )
>> +        completion = (vio->io_req.type != IOREQ_TYPE_PIO ||
>> +                      hvmemul_ctxt->is_mem_access) ? HVMIO_mmio_completion
>> +                                                   : HVMIO_pio_completion;
>> +
>> +    switch ( vio->io_completion = completion )
> 
> I thought we tended to avoid assignments in control flow statements.

In if() we do, because of the ambiguity whether == might have
been meant instead. But in switch() there's imo no such
ambiguity - if == was really meant, if() would better be used
anyway. We have quite a few cases of this elsewhere, and I think
some of them are reasonably recent introductions. As you're the
maintainer of the file, if you strongly think I shouldn't do so,
I'll switch of course.

>> @@ -2727,8 +2752,8 @@ int hvm_emulate_one_mmio(unsigned long m
>>      hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
>>                            guest_cpu_user_regs());
>>      ctxt.ctxt.data = &mmio_ro_ctxt;
>> -    rc = _hvm_emulate_one(&ctxt, ops);
>> -    switch ( rc )
>> +
>> +    switch ( rc = _hvm_emulate_one(&ctxt, ops, HVMIO_no_completion) )
> 
> Again, why move the assignment into the switch statement?

For consistency with the other cases where this gets introduced
in this patch, at least. I for one consider this the more concise
way of writing such code.

>> --- a/xen/arch/x86/hvm/vmx/realmode.c
>> +++ b/xen/arch/x86/hvm/vmx/realmode.c
>> @@ -97,15 +97,11 @@ static void realmode_deliver_exception(
>>  void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
>>  {
>>      struct vcpu *curr = current;
>> -    struct hvm_vcpu_io *vio = &curr->arch.hvm.hvm_io;
>>      int rc;
>>
>>      perfc_incr(realmode_emulations);
>>
>> -    rc = hvm_emulate_one(hvmemul_ctxt);
>> -
>> -    if ( hvm_ioreq_needs_completion(&vio->io_req) )
>> -        vio->io_completion = HVMIO_realmode_completion;
>> +    rc = hvm_emulate_one(hvmemul_ctxt, HVMIO_realmode_completion);
> 
> Ok, I guess the override of completion is intentional to deal with
> this case. Perhaps expand the comment above _hvm_emulate_one() then.

Right, done as per above. Let me know whether the text still isn't
sufficient.

>> --- a/xen/include/asm-x86/hvm/emulate.h
>> +++ b/xen/include/asm-x86/hvm/emulate.h
>> @@ -48,6 +48,8 @@ struct hvm_emulate_ctxt {
>>
>>      uint32_t intr_shadow;
>>
>> +    bool is_mem_access;
>> +
> 
> Whilst you mention in the commit comment why this is added, I don't
> see any consumer if it in this patch. Will the come later?

hvmemul_validate() sets the field, and _hvm_emulate_one() consumes
it.

Jan

