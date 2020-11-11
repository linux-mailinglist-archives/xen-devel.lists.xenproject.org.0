Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0B2AF236
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24803.52232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqFq-0003OF-6b; Wed, 11 Nov 2020 13:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24803.52232; Wed, 11 Nov 2020 13:33:42 +0000
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
	id 1kcqFq-0003Nq-3I; Wed, 11 Nov 2020 13:33:42 +0000
Received: by outflank-mailman (input) for mailman id 24803;
 Wed, 11 Nov 2020 13:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcqFo-0003Nl-UP
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:33:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c45bd74-1b41-4a82-8308-a1db739d048a;
 Wed, 11 Nov 2020 13:33:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C96A1AD77;
 Wed, 11 Nov 2020 13:33:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcqFo-0003Nl-UP
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:33:40 +0000
X-Inumbo-ID: 2c45bd74-1b41-4a82-8308-a1db739d048a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2c45bd74-1b41-4a82-8308-a1db739d048a;
	Wed, 11 Nov 2020 13:33:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605101614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTyaMP2eYC4AgPHdAHAXnPBqQiD7GG97cXDLyIP2Sps=;
	b=pPB/FynxFuKpSytfRaAudrr5MvhFKk402DBXEkIZKxTmDvmrE5ui+JucUfT8FIRJMqrFiA
	Pq7M75bF0IcnLaWLTL1Ew436M2ri3NtqPsxWhVfriSiUwZSly0iZab4AliRsayQsoxFV1P
	6Z2gGWyYLNk+cGxOKI9z4fx19TMOWrg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C96A1AD77;
	Wed, 11 Nov 2020 13:33:34 +0000 (UTC)
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201111111504.r4k7a53spsy7pzjq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ab3658f-8b69-455e-74b3-462f89f1cfe4@suse.com>
Date: Wed, 11 Nov 2020 14:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111111504.r4k7a53spsy7pzjq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 12:15, Roger Pau Monné wrote:
> On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
>> Under certain conditions CPUs can speculate into the instruction stream
>> past a RET instruction. Guard against this just like 3b7dab93f240
>> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
>> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
>> achieve this that differ: A set of macros gets introduced to post-
>> process RET insns issued by the compiler (or living in assembly files).
>>
>> Unfortunately for clang this requires further features their built-in
>> assembler doesn't support: We need to be able to override insn mnemonics
>> produced by the compiler (which may be impossible, if internally
>> assembly mnemonics never get generated), and we want to use \(text)
>> escaping / quoting in the auxiliary macro.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> TBD: Would be nice to avoid the additions in .init.text, but a query to
>>      the binutils folks regarding the ability to identify the section
>>      stuff is in (by Peter Zijlstra over a year ago:
>>      https://sourceware.org/pipermail/binutils/2019-July/107528.html)
>>      has been left without helpful replies.
>> ---
>> v3: Use .byte 0xc[23] instead of the nested macros.
>> v2: Fix build with newer clang. Use int3 mnemonic. Also override retq.
>>
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
> 
> I was going over this to post a bug report to LLVM, but it seems like
> gcc also doesn't overwrite ret when using the above snippet:
> 
> https://godbolt.org/z/oqsPTv

I can't see what's different from

void test(void) {
	asm volatile (".macro ret; .error; .endm; .macro retq; .error; .endm");
}

but this one produces "Error: .error directive invoked in source file"
for me with both old and new gcc.

Jan

