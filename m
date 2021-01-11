Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810672F0D64
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 08:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64622.114186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrw0-0000GP-9v; Mon, 11 Jan 2021 07:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64622.114186; Mon, 11 Jan 2021 07:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrw0-0000Fx-6k; Mon, 11 Jan 2021 07:48:16 +0000
Received: by outflank-mailman (input) for mailman id 64622;
 Mon, 11 Jan 2021 07:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyrvz-0000Fs-6Z
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 07:48:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88db10e6-16d1-4d43-8391-a5cd2e93c4fc;
 Mon, 11 Jan 2021 07:48:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 712DFAD6A;
 Mon, 11 Jan 2021 07:48:13 +0000 (UTC)
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
X-Inumbo-ID: 88db10e6-16d1-4d43-8391-a5cd2e93c4fc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610351293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y/BuqncvOzki/Xc5Tx4EIy60Lr8ieOGJUrp99ZQHzw=;
	b=JB6tirM1t4znOldObAFlZCulmObqvJxLfEGOtbaGIBjzrWtP35q1q3i4bHwc4P8Xa1epjW
	VF5Hlq0b89+UubyxtnOld0q17rv8HAhghJY8yuvyUT88deayrPwvqiGawJo32GUCQfhklw
	TIU43zTnWXWolmvS4wLVNYeutR6R3Ts=
Subject: Re: [PATCH 3/4] x86: Allow non-faulting accesses to non-emulated MSRs
 if policy permits this
To: boris.ostrovsky@oracle.com
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-4-git-send-email-boris.ostrovsky@oracle.com>
 <0e5c0b85-5e3c-676c-e402-fa06e09cf5cb@suse.com>
 <b2de26e9-24b2-efdb-4bfb-627055f008a1@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9896a1af-e4cc-b171-f7a9-e6b74976770c@suse.com>
Date: Mon, 11 Jan 2021 08:48:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b2de26e9-24b2-efdb-4bfb-627055f008a1@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 21:39, boris.ostrovsky@oracle.com wrote:
> On 1/8/21 10:18 AM, Jan Beulich wrote:
>> On 07.01.2021 21:34, Boris Ostrovsky wrote:
>>> Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
>>> accesses to unhandled MSRs result in #GP sent to the guest. This caused a
>>> regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,
>> Nit: One c too many.
>>
>>> for example, Linux) does not catch exceptions when accessing MSRs that
>>> potentially may not be present.
>> Just to re-raise the question raised by Andrew already earlier
>> on: Has Solaris been fixed in the meantime, or is this at least
>> firmly planned to happen?
> 
> I was told they will open a bug.

"Will", not "did"?

>> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>               is_last_branch_msr(msr) )
>>              break;
>>  
>> -        gdprintk(XENLOG_WARNING,
>> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>> -                 msr, msr_content);
>> -        goto gp_fault;
>> +        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
>> +            goto gp_fault;
>>      }
>>  
>>      return X86EMUL_OKAY;
>> These functions also get used from the insn emulator, when it
>> needs to fetch an MSR value (not necessarily in the context of
>> emulating RDMSR or WRMSR). I wonder whether applying this
>> behavior in that case is actually correct. It would only be if
>> we would settle on it being a requirement that any such MSRs
>> have to have emulation present in one of the handlers.
> 
> 
> Hmm.. Yes, I did not consider this. I am not convinced this will
> always result in correct behavior for the emulator so I will
> need to pass down a parameter. Unless there is a way to figure
> out whether we are running in the emulator (which I don't
> immediately see)

Passing a parameter for this is sort of ugly, but I presume
unavoidable. The more that what you need to know is not "running
in emulator", but "guest RDMSR/WRMSR" - this can also happen
through the emulator.

Jan

