Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B51B1E49
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 07:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQlgi-0005yp-IX; Tue, 21 Apr 2020 05:43:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQlgg-0005yk-SX
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 05:43:14 +0000
X-Inumbo-ID: fd431552-8392-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd431552-8392-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 05:43:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A5EFAAC7;
 Tue, 21 Apr 2020 05:43:10 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
 <92aedd0d-fcb0-2c6b-6586-5d859333575d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c449baf8-d3e0-53d4-4f9e-5552527b0701@suse.com>
Date: Tue, 21 Apr 2020 07:43:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <92aedd0d-fcb0-2c6b-6586-5d859333575d@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 22:16, Andrew Cooper wrote:
> On 14/04/2020 12:34, Jan Beulich wrote:
>> In preparation for the addition of VMASST_TYPE_runstate_update_flag
>> commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
>> the hypercall for Arm. I consider it not logical that it then isn't also
>> exposed to x86 HVM guests (with the same single feature permitted to be
>> enabled as Arm has); Linux actually tries to use it afaict.
>>
>> Rather than introducing yet another thin wrapper around vm_assist(),
>> make that function the main handler, requiring a per-arch
>> arch_vm_assist_valid() definition instead.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Re-work vm_assist() handling/layering at the same time. Also adjust
>>     arch_set_info_guest().
> 
> Much nicer.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> However, ...
> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
>>      return rc;
>>  }
>>  
>> -#ifdef VM_ASSIST_VALID
>> -long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
>> -               unsigned long valid)
>> +#ifdef arch_vm_assist_valid
>> +long do_vm_assist(unsigned int cmd, unsigned int type)
>>  {
>> +    struct domain *currd = current->domain;
>> +    const unsigned long valid = arch_vm_assist_valid(currd);
>> +
>>      if ( type >= BITS_PER_LONG || !test_bit(type, &valid) )
>>          return -EINVAL;
> 
> As a thought, would it be better to have a guest_bits_per_long()
> helper?  This type >= BITS_PER_LONG isn't terribly correct for 32bit
> guests, and it would avoid needing the truncation in the arch helper,
> which is asymmetric on the ARM side.

I'd rather not - the concept of guest bitness is already fuzzy
enough for HVM (see our 32-bit shared info latching), and
introducing a generic predicate like you suggest would invite
for use of it in places where people may forget how fuzzy the
concept is.

I also don't view the BITS_PER_LONG check here as pertaining
to a guest property - all we want is to bound the test_bit().
There's nothing wrong to, in the future, define bits beyond
possible guest bitness. It's merely a "helps for now" that on
x86 we've decided to put the 1st 64-bit only assist bit in
the high 32 bits (it may well be that this was added back
when we still had 32-bit support for Xen itself).

Jan

