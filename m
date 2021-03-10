Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8417333F79
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 14:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96076.181552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJz6K-0005ES-4R; Wed, 10 Mar 2021 13:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96076.181552; Wed, 10 Mar 2021 13:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJz6K-0005E3-14; Wed, 10 Mar 2021 13:42:12 +0000
Received: by outflank-mailman (input) for mailman id 96076;
 Wed, 10 Mar 2021 13:42:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJz6J-0005Dy-02
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:42:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fd63768-11b3-436f-9a39-d5bc95c731e5;
 Wed, 10 Mar 2021 13:42:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACEE4AE84;
 Wed, 10 Mar 2021 13:42:07 +0000 (UTC)
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
X-Inumbo-ID: 7fd63768-11b3-436f-9a39-d5bc95c731e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615383727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbhOMnJC00CNpFucJ2JfplBWXP/4qYu6TB/QlW+p6UM=;
	b=N+pT7dXGeGUUe9/SQ8qKhXYNeBTuNNZ2FUieCZdEgDPi2qaxfJk75eteWSoSR6buaZicsb
	CKVbPBbQ0nu9IEMzFa8CUo1jdVcYRhLS9fQUkbhunsxo0BKcMZvywpz51XmhWE/K8nK7Id
	gAAVo1mGlqyy2seAUmlxJeOxeMd7hA0=
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
 <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50685b4a-7f29-8b52-aaa6-f3aeceb66beb@suse.com>
Date: Wed, 10 Mar 2021 14:42:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 20:57, Andrew Cooper wrote:
> On 09/03/2021 11:36, Jan Beulich wrote:
>> On 09.03.2021 11:56, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>>      const struct domain *d = v->domain;
>>>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>>      const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
>>> +    uint64_t tmp;
>>>  
>>>      switch ( msr )
>>>      {
>> While to some degree a matter of taste, I think such variables needed
>> only inside a switch() and not needing an initializer would better
>> live in the respective switch()'s scope.
> 
> Actually, I was hoping to make a CODING_SYTLE change removing this as a
> permitted construct.
> 
> Recent compilers have hardening features to automatically initialise all
> stack variables, because even if your code isn't architecturally buggy,
> an attacker can launch speculative attacks the stack rubble.
> 
> However, because of the way the compiler transform works, it cannot
> tolerate this specific construct in a switch statement, as there is no
> available execution to cope with the implicit "=0" or "=POISON".

While an entirely orthogonal issue, since you bring this up here
I'd like to point out that this then is a compiler implementation
issue, not something one ought to change source code for. The
compiler can very well put its initialization at a suitable place,
which - for internal handling purposes - could go as far as
introducing and artificial block and hence making code structure
as if it was

    {
        int tmp;

        switch ( ... )
        {
        case ...: ...
        }
    }

Trying to limit variable scope as much as possible shouldn't be
crippled by incompletely thought through new hardening options.

>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>> @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>>      const struct domain *currd = curr->domain;
>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>>>      bool vpmu_msr = false;
>>> +    uint64_t tmp;
>>>      int ret;
>>>  
>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>>> @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
>>>          }
>>>          /* fall through */
>>>      default:
>>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
>>> +        {
>>> +            *val = 0;
>>> +            return X86EMUL_OKAY;
>>> +        }
>>> +
>>>          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>>>          break;
>>>  
>>> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
>>>          }
>>>          /* fall through */
>>>      default:
>>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
>>> +            return X86EMUL_OKAY;
>>> +
>>>          gdprintk(XENLOG_WARNING,
>>>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>>>                   reg, val);
>> So what are your thoughts wrt my change to this file? Drop it
>> altogether and require people to use this new option? Or do you
>> see both coexist? In the latter case, since you had suggested
>> that I drop the write side of my change - does your changing of
>> the write path indicate you've changed your mind?
> 
> I don't think we should legitimise buggy PV behaviour, either by
> codifying in the ABI, or providing a knob beyond this one.
> 
> A guest blindly stumbling forward with a missed #GP could very well
> worse than crashing hard.

There's a fundamental missing piece in your reply here: Do you
mean this just as an argument against extending my change to the
write side, or as one against my change as a whole? In the
latter case, if instead one had to use Roger's new option, the
same missing #GP would cause the same possible problems, plus -
once the guest has installed a handler - further #GP-s may end
up getting suppressed.

Jan

> Case in point - the 4.15 behaviour spotted a very serious bug in NetBSD
> where it tried writing MSR_PAT with its own choice (which wasn't the
> same as Xen's choice).  The consequence of this bug is getting cache
> attributes in pagetables wrong.
> 
> It is unfortunate that multiple bugs have combined to make this mess,
> but every instance needs investigating and fixing.  Continuing to paper
> over the hole doesn't help anyone in the long run.
> 
> ~Andrew
> 


