Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479691E8812
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 21:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jekur-0001Xi-E1; Fri, 29 May 2020 19:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jekup-0001Xd-K2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 19:43:39 +0000
X-Inumbo-ID: b12d405a-a1e4-11ea-9947-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b12d405a-a1e4-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 19:43:39 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:42398
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jekum-000aRg-Jw (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 20:43:36 +0100
Subject: Re: [PATCH v2 10/14] x86/extable: Adjust extable handling to be
 shadow stack compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-11-andrew.cooper3@citrix.com>
 <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
Date: Fri, 29 May 2020 20:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/05/2020 17:15, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> @@ -400,6 +400,18 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
>>      }
>>  }
>>  
>> +static unsigned long get_shstk_bottom(unsigned long sp)
>> +{
>> +    switch ( get_stack_page(sp) )
>> +    {
>> +#ifdef CONFIG_XEN_SHSTK
>> +    case 0:  return ROUNDUP(sp, IST_SHSTK_SIZE) - sizeof(unsigned long);
>> +    case 5:  return ROUNDUP(sp, PAGE_SIZE)      - sizeof(unsigned long);
> PRIMARY_SHSTK_SLOT please and, if introduced as suggested for the
> earlier patch, IST_SHSTK_SLOT in the earlier line.
>
>> @@ -763,6 +775,56 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>            trapnr, vec_name(trapnr), regs->error_code);
>>  }
>>  
>> +static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
>> +{
>> +    unsigned long ssp, *ptr, *base;
>> +
>> +    asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
>> +    if ( ssp == 1 )
>> +        return;
>> +
>> +    ptr = _p(ssp);
>> +    base = _p(get_shstk_bottom(ssp));
>> +
>> +    for ( ; ptr < base; ++ptr )
>> +    {
>> +        /*
>> +         * Search for %rip.  The shstk currently looks like this:
>> +         *
>> +         *   ...  [Likely pointed to by SSP]
>> +         *   %cs  [== regs->cs]
>> +         *   %rip [== regs->rip]
>> +         *   SSP  [Likely points to 3 slots higher, above %cs]
>> +         *   ...  [call tree to this function, likely 2/3 slots]
>> +         *
>> +         * and we want to overwrite %rip with fixup.  There are two
>> +         * complications:
>> +         *   1) We cant depend on SSP values, because they won't differ by 3
>> +         *      slots if the exception is taken on an IST stack.
>> +         *   2) There are synthetic (unrealistic but not impossible) scenarios
>> +         *      where %rip can end up in the call tree to this function, so we
>> +         *      can't check against regs->rip alone.
>> +         *
>> +         * Check for both reg->rip and regs->cs matching.
> Nit: regs->rip
>
>> +         */
>> +
>> +        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
>> +        {
>> +            asm ( "wrssq %[fix], %[stk]"
>> +                  : [stk] "=m" (*ptr)
> Could this be ptr[0], to match the if()?
>
> Considering how important it is that we don't fix up the wrong stack
> location here, I continue to wonder if we wouldn't better also
> include the SSP value on the stack in the checking, at the very
> least by way of an ASSERT() or BUG_ON().

Well no, for the reason discussed in point 1.

Its not technically an issue right now, but there is no possible way to
BUILD_BUG_ON() someone turning an exception into IST, or stopping the
use of the extable infrastructure on a #DB.

Such a check would lie in wait and either provide an unexpected tangent
to someone debugging a complicated issue (I do use #DB for a fair bit),
or become a security vulnerability.

> Since, with how the code is
> currently written, this would require a somewhat odd looking ptr[-1]
> I also wonder whether "while ( ++ptr < base )" as the loop header
> wouldn't be better. The first entry on the stack can't be the RIP
> we look for anyway, can it?

Yes it can.

>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -708,7 +708,16 @@ exception_with_ints_disabled:
>>          call  search_pre_exception_table
>>          testq %rax,%rax                 # no fixup code for faulting EIP?
>>          jz    1b
>> -        movq  %rax,UREGS_rip(%rsp)
>> +        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
>> +
>> +#ifdef CONFIG_XEN_SHSTK
>> +        mov    $1, %edi
>> +        rdsspq %rdi
>> +        cmp    $1, %edi
>> +        je     .L_exn_shstk_done
>> +        wrssq  %rax, (%rdi)             # fixup shadow stack
> According to the comment in extable_shstk_fixup(), isn't the value
> to be replaced at 8(%rdi)?

Hmm - I think you're right.  I thought I had this covered by unit tests.

~Andrew

