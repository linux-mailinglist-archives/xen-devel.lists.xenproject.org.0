Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CFD1E89D9
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 23:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jemNv-0002DO-4s; Fri, 29 May 2020 21:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jemNt-0002DH-R1
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 21:17:45 +0000
X-Inumbo-ID: d61b307c-a1f1-11ea-8993-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d61b307c-a1f1-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 21:17:44 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:45194
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jemNp-000MWN-M8 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 22:17:41 +0100
Subject: Re: [PATCH v2 10/14] x86/extable: Adjust extable handling to be
 shadow stack compatible
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-11-andrew.cooper3@citrix.com>
 <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
 <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
Message-ID: <9d86ecf8-eaaa-7c2c-a3cc-b832d013a225@citrix.com>
Date: Fri, 29 May 2020 22:17:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0c7f425a-996f-8840-f1e2-79381edb6456@citrix.com>
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

On 29/05/2020 20:43, Andrew Cooper wrote:
> On 28/05/2020 17:15, Jan Beulich wrote:
>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>> +
>>> +        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
>>> +        {
>>> +            asm ( "wrssq %[fix], %[stk]"
>>> +                  : [stk] "=m" (*ptr)
>> Could this be ptr[0], to match the if()?
>>
>> Considering how important it is that we don't fix up the wrong stack
>> location here, I continue to wonder if we wouldn't better also
>> include the SSP value on the stack in the checking, at the very
>> least by way of an ASSERT() or BUG_ON().
> Well no, for the reason discussed in point 1.
>
> Its not technically an issue right now, but there is no possible way to
> BUILD_BUG_ON() someone turning an exception into IST, or stopping the
> use of the extable infrastructure on a #DB.
>
> Such a check would lie in wait and either provide an unexpected tangent
> to someone debugging a complicated issue (I do use #DB for a fair bit),
> or become a security vulnerability.

Also (which I forgot first time around),

The ptr[1] == regs->cs check is 64 bits wide, and the way to get that on
the shadow stack would be to execute a call instruction ending at at
0xe008 linear, or from a bad WRSSQ edit, both of which are serious
errors and worthy of hitting the BUG().

>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -708,7 +708,16 @@ exception_with_ints_disabled:
>>>          call  search_pre_exception_table
>>>          testq %rax,%rax                 # no fixup code for faulting EIP?
>>>          jz    1b
>>> -        movq  %rax,UREGS_rip(%rsp)
>>> +        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
>>> +
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +        mov    $1, %edi
>>> +        rdsspq %rdi
>>> +        cmp    $1, %edi
>>> +        je     .L_exn_shstk_done
>>> +        wrssq  %rax, (%rdi)             # fixup shadow stack
>> According to the comment in extable_shstk_fixup(), isn't the value
>> to be replaced at 8(%rdi)?
> Hmm - I think you're right.  I thought I had this covered by unit tests.

The unit test has been fixed, and so has this code.

~Andrew

