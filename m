Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3432915FE5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747294.1154666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0Uk-0005Yp-M2; Tue, 25 Jun 2024 07:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747294.1154666; Tue, 25 Jun 2024 07:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0Uk-0005XL-JD; Tue, 25 Jun 2024 07:21:38 +0000
Received: by outflank-mailman (input) for mailman id 747294;
 Tue, 25 Jun 2024 07:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sM0Uj-0005XF-Rp
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:21:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5240a2-32c3-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:21:36 +0200 (CEST)
Received: from [172.20.10.8] (unknown [37.161.81.3])
 by support.bugseng.com (Postfix) with ESMTPSA id D3E4B4EE0738;
 Tue, 25 Jun 2024 09:21:34 +0200 (CEST)
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
X-Inumbo-ID: 8e5240a2-32c3-11ef-90a3-e314d9c70b13
Message-ID: <d1d6fda5-c619-4578-9a21-7da1a9810044@bugseng.com>
Date: Tue, 25 Jun 2024 09:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/13] x86/hvm: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
 <087eb879-b3f6-4d1a-a52e-1e27337620c9@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <087eb879-b3f6-4d1a-a52e-1e27337620c9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/24 17:32, Jan Beulich wrote:
> On 24.06.2024 11:04, Federico Serafini wrote:
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -339,7 +339,7 @@ static int hvmemul_do_io(
>>       }
>>       case X86EMUL_UNIMPLEMENTED:
>>           ASSERT_UNREACHABLE();
>> -        /* Fall-through */
>> +        fallthrough;
>>       default:
>>           BUG();
>>       }
> 
> This or very similar comment are replaced elsewhere in this patch. I'm
> sure we have more of them. Hence an alternative would be to deviate those
> variations of what we already deviate. I recall there was a mail from
> Julien asking to avoid extending the set, unless some forms are used
> pretty frequently. Sadly nothing towards judgement between the
> alternatives is said in the description.

I found few occurrences of the hypened fallthrough,
It doesn't seem like a very used form to me,
and most of them are in emulate.c, a file I needed to touch anyway.

The fact that the pseudo keyword is the one preferred is mentioned
in deviations.rst, but I can mention this also in the description.

>> @@ -2674,6 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>>   
>>       default:
>>           ASSERT_UNREACHABLE();
>> +        break;
>>       }
>>   
>>       if ( hvmemul_ctxt->ctxt.retire.singlestep )
>> @@ -2764,6 +2765,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>>           /* fallthrough */
> 
> What about this? It doesn't match anything I see in deviations.rst.

The last item for R16.3 in deviations.rst explicitly says that
existing comment of this form are considered as safe (i.e., deviated)
but deprecated, meaning that the pseudo keyword should be used for new
cases. We can consider a rephrasing if it is not clear enough.

> 
>>       default:
>>           hvm_emulate_writeback(&ctxt);
>> +        break;
>>       }
>>   
>>       return rc;
>> @@ -2799,10 +2801,11 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>>           memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>>                  hvio->mmio_insn_bytes);
>>       }
>> -    /* Fall-through */
>> +    fallthrough;
>>       default:
>>           ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
>>           rc = hvm_emulate_one(&ctx, VIO_no_completion);
>> +        break;
>>       }
> 
> While not as much of a problem for the comment, I view a statement like
> this as mis-indented.
> 
>> @@ -5283,6 +5287,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
>>            * %cs and %tr are unconditionally present.  SVM ignores these present
>>            * bits and will happily run without them set.
>>            */
>> +        fallthrough;
>> +
>>       case x86_seg_cs:
>>           reg->p = 1;
>>           break;
> 
> Why the extra blank line here, ...
> 
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>       case 8:
>>           eax = regs->rax;
>>           /* Fallthrough to permission check. */
>> +        fallthrough;
>>       case 4:
>>       case 2:
>>           if ( currd->arch.monitor.guest_request_userspace_enabled &&
> 
> ... when e.g. here there's none? I'm afraid this goes back to an
> unfinished discussion as to whether to have blank lines between blocks
> in fall-through situations. My view is that not having them in these
> cases is helping to make the falling through visually noticeable.

I looked ad the context to preserve the style
of the existing cases.

What do you think about:
-keep the existing style when a break needs to be inserted;
-no blank line if a fallthrough needs to inserted.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

