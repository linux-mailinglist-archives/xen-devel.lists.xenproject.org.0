Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4E28CF37
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6208.16482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKSI-0004Bz-UM; Tue, 13 Oct 2020 13:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6208.16482; Tue, 13 Oct 2020 13:35:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKSI-0004Ba-R0; Tue, 13 Oct 2020 13:35:06 +0000
Received: by outflank-mailman (input) for mailman id 6208;
 Tue, 13 Oct 2020 13:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKSH-0004BV-C8
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:35:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b006341c-e05b-4fcc-8d15-39edf9cdd484;
 Tue, 13 Oct 2020 13:35:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 481F0B319;
 Tue, 13 Oct 2020 13:35:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKSH-0004BV-C8
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:35:05 +0000
X-Inumbo-ID: b006341c-e05b-4fcc-8d15-39edf9cdd484
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b006341c-e05b-4fcc-8d15-39edf9cdd484;
	Tue, 13 Oct 2020 13:35:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602596102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1F9x9j8/3cvMphQwdgDEndglZUMVLyn3LmK/kAdiQm4=;
	b=nhS117TDZMG6VUfH9IBM8pQ4yiTHgeBDRO9YGi8FaqIWunqxVVXyEcseJb0E+7q6w4/s2w
	I/7LnIXP/xk+TwPJUlSZY5kKIOX4KtU6N75siVC59koE+VKntXA6vD1vx7QKMFLLmqwXmX
	OIrPFuZxifJs7oJSVz4Q52cM/8fdMb0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 481F0B319;
	Tue, 13 Oct 2020 13:35:01 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] x86: guard against straight-line speculation past
 RET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
 <447525bc-662d-ff52-6b73-e6e1a61767ec@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5be4c67-95ad-dd98-cd24-b925da3ef519@suse.com>
Date: Tue, 13 Oct 2020 15:34:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <447525bc-662d-ff52-6b73-e6e1a61767ec@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 14:00, Andrew Cooper wrote:
> On 28/09/2020 13:31, Jan Beulich wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -145,7 +145,15 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/i
>>  # https://bugs.llvm.org/show_bug.cgi?id=36110
>>  t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
>>  
>> -CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
>> +# Check whether \(text) escaping in macro bodies is supported.
>> +t4 = $(call as-insn,$(CC),".macro m ret:req; \\(ret) $$\\ret; .endm; m 8",,-no-integrated-as)
>> +
>> +# Check whether macros can override insn mnemonics in inline assembly.
>> +t5 = $(call as-insn,$(CC),".macro ret; .error; .endm; .macro retq; .error; .endm",-no-integrated-as)
>> +
>> +acc1 := $(call or,$(t1),$(t2),$(t3),$(t4))
>> +
>> +CLANG_FLAGS += $(call or,$(acc1),$(t5))
> 
> I'm not happy taking this until there is toolchain support visible in
> the future.
> 
> We *cannot* rule out the use of IAS forever more, because there are
> features far more important than ret speculation which depend on it.

So what do you suggest? We can't have both, afaics, so we need to
pick either being able to use the integrated assembler or being
able to guard RET.

>> --- a/xen/include/asm-x86/asm-defns.h
>> +++ b/xen/include/asm-x86/asm-defns.h
>> @@ -50,3 +50,22 @@
>>  .macro INDIRECT_JMP arg:req
>>      INDIRECT_BRANCH jmp \arg
>>  .endm
>> +
>> +/*
>> + * To guard against speculation past RET, insert a breakpoint insn
>> + * immediately after them.
>> + */
>> +.macro ret operand:vararg
>> +    ret$ \operand
>> +.endm
>> +.macro retq operand:vararg
>> +    ret$ \operand
>> +.endm
>> +.macro ret$ operand:vararg
>> +    .purgem ret
>> +    ret \operand
> 
> You're substituting retq for ret, which defeats the purpose of unwrapping.

I'm afraid I don't understand the "defeats" aspect.

> I will repeat my previous feedback.  Do away with this
> wrapping/unwrapping and just use a raw .byte.  Its simpler and faster.

Well, I could now also repeat my prior response to your prior
feedback, but since iirc you didn't reply back then I don't
expect you would now. Instead I'll - once again - give in despite
my believe that this is the cleaner approach, and that in cases
like this one - when there are pros and cons to either approach -
it should be the author's choice rather than the reviewer's.

Jan

