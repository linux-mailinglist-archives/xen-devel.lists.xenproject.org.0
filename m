Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367BA3690DA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 13:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116218.221875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtff-0006Wi-Tr; Fri, 23 Apr 2021 11:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116218.221875; Fri, 23 Apr 2021 11:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtff-0006WJ-QU; Fri, 23 Apr 2021 11:08:27 +0000
Received: by outflank-mailman (input) for mailman id 116218;
 Fri, 23 Apr 2021 11:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtfe-0006WE-88
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:08:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ebea252-91e6-4e6a-ad85-553790eb5166;
 Fri, 23 Apr 2021 11:08:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82DBBB113;
 Fri, 23 Apr 2021 11:08:24 +0000 (UTC)
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
X-Inumbo-ID: 4ebea252-91e6-4e6a-ad85-553790eb5166
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619176104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luVPk/KJynSlFpcA3TQTLGHH5Ntcm/8OQtNYX4o0yNQ=;
	b=go04YATnAmROQ3gX/6LgS7MFw3BVD6oISlVC1JomgVB3vWic5NcHVslgdds8lWd1ZOuClv
	XCPG+qKwUF0XGuYVVE1IfwQo2AIAIhLwpUpkwPOTC9vUFybYYV/nZUMVBDn91MFbORY3f3
	qsYnie4VyDXAM1eTO91bd2Gfqa2IWXw=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
 <YIKYaCr13TiwxqRq@Air-de-Roger>
 <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
 <135f8bc2-d07c-c531-e498-9f0e15207cca@suse.com>
 <e386f7eb-8ae8-2f18-b9e8-30a319354ec0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d03bbe0f-6ba3-8383-82cd-be340483f09f@suse.com>
Date: Fri, 23 Apr 2021 13:08:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e386f7eb-8ae8-2f18-b9e8-30a319354ec0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 13:04, Andrew Cooper wrote:
> On 23/04/2021 11:58, Jan Beulich wrote:
>> On 23.04.2021 12:51, Andrew Cooper wrote:
>>> On 23/04/2021 10:50, Roger Pau Monné wrote:
>>>> On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
>>>>> On 16.04.2021 15:41, Andrew Cooper wrote:
>>>>>> On 16/04/2021 09:16, Jan Beulich wrote:
>>>>>>> clang, at the very least, doesn't like unused inline functions, unless
>>>>>>> their definitions live in a header.
>>>>>>>
>>>>>>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> I agree this will fix the build.  However, looking at the code, I'm not
>>>>>> sure the original CONFIG_COMPAT was correct.  In particular, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/oprofile/backtrace.c
>>>>>>> +++ b/xen/arch/x86/oprofile/backtrace.c
>>>>>>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>>>>>>      return head->ebp;
>>>>>>>  }
>>>>>>>  
>>>>>>> +#ifdef CONFIG_COMPAT
>>>>>>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>>>>>  {
>>>>>>>      if (is_hvm_vcpu(vcpu))
>>>>>> ... this chunk of logic demonstrates that what oprofile is doing isn't
>>>>>> related to the Xen ABI in the slightest.
>>>>>>
>>>>>> I think OProfile is misusing the guest handle infrastructure, and
>>>>>> shouldn't be using it for this task.
>>>>> I'm afraid I consider this something for another day. Both the
>>>>> original #ifdef and the one getting added here are merely
>>>>> measures to get things to build.
>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Without entering on the debate whether CONFIG_COMPAT is the correct
>>>> conditional to use it's not making the issue any worse, and it will
>>>> allow to unblock the build. We can discuss about the CONFIG_COMPAT
>>>> stuff later.
>>> I disagree.  Fixing this less effort than the time wasted arguing about
>>> fixing it.
>>>
>>> But if you are going to insist on not fixing it, and putting in a patch
>>> like this, then at a minimum, it needs to include a TODO comment stating
>>> that the use of CONFIG_COMPAT is bogus and needs fixing.
>> I disagree: It is (for now) just you saying this is bogus. The (ab)use
>> of the handle infrastructure was there before. You could have sent a
>> fix long ago, therefore, if you were thinking this needs fixing.
> 
> I only know it needed fixing because you didn't build test your change
> in CI.  Don't make it out to be my fault I didn't spot this 6 months ago.
> 
>> I can
>> see that you have good intentions, but orthogonal issues shouldn't be
>> used to block necessary adjustments (and this applies to other pending
>> build fixes as well).
> 
> You genuinely regressed things for 32bit HVM guests, with the
> CONFIG_COMPAT change.
> 
> The code may have been using inappropriate interfaces to perform its job
> before, but its actually broken now.

In which way? COMPAT gets selected by both PV32 and HVM.

Jan

