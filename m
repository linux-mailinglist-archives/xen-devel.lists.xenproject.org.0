Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00F1A7F7D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:21:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMR0-0006V0-5Z; Tue, 14 Apr 2020 14:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOMQy-0006Uv-Nj
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:21:04 +0000
X-Inumbo-ID: 2c2b85e4-7e5b-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c2b85e4-7e5b-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 14:21:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6601EABEC;
 Tue, 14 Apr 2020 14:21:02 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Don't use vmcb->tlb_control as if it is a boolean
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200414121429.10196-1-andrew.cooper3@citrix.com>
 <9c4e293d-1425-846f-1c52-91906f4e0d72@suse.com>
 <223c8116-4faf-2264-bc19-0e0de8b9ec9a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39604bee-40f1-6a7a-f089-8cecd4e914b9@suse.com>
Date: Tue, 14 Apr 2020 16:21:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <223c8116-4faf-2264-bc19-0e0de8b9ec9a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 14.04.2020 16:15, Andrew Cooper wrote:
> On 14/04/2020 14:57, Jan Beulich wrote:
>> On 14.04.2020 14:14, Andrew Cooper wrote:
>>> @@ -44,19 +41,20 @@ void svm_asid_handle_vmrun(void)
>>>      struct hvm_vcpu_asid *p_asid =
>>>          nestedhvm_vcpu_in_guestmode(curr)
>>>          ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
>>> -    bool_t need_flush = hvm_asid_handle_vmenter(p_asid);
>>> +    bool need_flush = hvm_asid_handle_vmenter(p_asid);
>>>  
>>>      /* ASID 0 indicates that ASIDs are disabled. */
>>>      if ( p_asid->asid == 0 )
>>>      {
>>>          vmcb_set_guest_asid(vmcb, 1);
>>> -        vmcb->tlb_control = 1;
>>> +        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
>> While there ought to be no difference in behavior, use of
>> TLB_CTRL_FLUSH_ASID would seem more logical to me here. Other
>> than below we're no after flushing all ASIDs in this case
>> afaict.
>>
>> Question of course is - did early CPUs treat this as boolean,
>> accepting any non-zero value to mean "flush all"?
> 
> The spec states "When the VMM sets the TLB_CONTROL field to 1, ...",
> which is fairly clear on the matter.

Well, it is a clear statement without it being clear how close to
truth it is. Consider the spec also saying "Should only be used by
legacy hypervisors" for the value of 1.

>> Preferably with such an adjustment
> 
> I'd prefer not to.  There is a good chance that your suggestion will
> suffer a vmentry failure, or not flush anything on old hardware.

Okay then. Could I talk you into adding at least a respective
comment there? Or one indicating that we should stop using the
value of 1 altogether (which of course is a bigger change)?

Jan

