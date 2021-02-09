Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AD315498
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83344.154846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WQR-0001t1-LU; Tue, 09 Feb 2021 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83344.154846; Tue, 09 Feb 2021 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WQR-0001sc-I3; Tue, 09 Feb 2021 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 83344;
 Tue, 09 Feb 2021 17:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9WQQ-0001sX-Gr
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:03:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f011f3cf-8369-4f15-b73f-d07e73f5e6a4;
 Tue, 09 Feb 2021 17:03:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99756AD2E;
 Tue,  9 Feb 2021 17:03:40 +0000 (UTC)
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
X-Inumbo-ID: f011f3cf-8369-4f15-b73f-d07e73f5e6a4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612890220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytnzvGDPdmShFgyZyfaeZFXwCVssEFRt0dlXx43VwYI=;
	b=tqEBteWQtBOoDDF6nfnG6D0Sdph6+crW+TU1jSBpAypuC4H1bC+exI1IZXWIGdXTSVPozY
	5vZpBjp8mLA+SSqDLkFQCXt4139Uh8UdesAfOFS1GT7/6LPLdHBCpzpMHVq0RdFeokzwHy
	I2gXq3kUJo+QPnwJ0m0rRhMmanL4ZqM=
Subject: Re: [PATCH 03/17] x86: split __copy_{from,to}_user() into "guest" and
 "unsafe" variants
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <b8112628-a2e3-2fdc-9847-1fa684283135@suse.com>
 <YCKy8lwh2YVWYChc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <566262ba-d45e-d2fa-69ae-2e1549cd6a94@suse.com>
Date: Tue, 9 Feb 2021 18:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCKy8lwh2YVWYChc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.02.2021 17:06, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 04:04:32PM +0100, Jan Beulich wrote:
>> The "guest" variants are intended to work with (potentially) fully guest
>> controlled addresses, while the "unsafe" variants are not. Subsequently
>> we will want them to have different behavior, so as first step identify
>> which one is which. For now, both groups of constructs alias one another.
>>
>> Double underscore prefixes are retained only on
>> __copy_{from,to}_guest_pv(), to allow still distinguishing them from
>> their "checking" counterparts once they also get renamed (to
>> copy_{from,to}_guest_pv()).
>>
>> Add previously missing __user at some call sites.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Instead of __copy_{from,to}_guest_pv(), perhaps name them just
>> __copy_{from,to}_pv()?
>>
>> --- a/xen/arch/x86/gdbstub.c
>> +++ b/xen/arch/x86/gdbstub.c
>> @@ -33,13 +33,13 @@ gdb_arch_signal_num(struct cpu_user_regs
>>  unsigned int
>>  gdb_arch_copy_from_user(void *dest, const void *src, unsigned len)
>>  {
>> -    return __copy_from_user(dest, src, len);
>> +    return copy_from_unsafe(dest, src, len);
>>  }
>>  
>>  unsigned int 
>>  gdb_arch_copy_to_user(void *dest, const void *src, unsigned len)
>>  {
>> -    return __copy_to_user(dest, src, len);
>> +    return copy_to_unsafe(dest, src, len);
> 
> I assume we need to use the unsafe variants here, because the input
> addresses are fully controlled by gdb, and hence not suitable as
> speculation vectors?

Speculation doesn't matter when it comes to debugging, I
think. We were using the variants without access_ok()
checks already anyway to allow access to Xen addresses.
In fact it is my understanding ...

> Also could point to addresses belonging to both Xen or the guest
> address space AFAICT.

... that the primary goal here is to access Xen
addresses, and guest space only falls into the "may also
happen to be accessed" category.

>> --- a/xen/include/asm-x86/uaccess.h
>> +++ b/xen/include/asm-x86/uaccess.h
> 
> At some point we should also rename this to pvaccess.h maybe?

We could, but I'd rather not - this isn't about PV only.
Instead I would simply re-interpret 'u' from standing for
"user" (which didn't make much sense in Xen anyway, and
was only attributed to the Linux origin) to standing for
"unsafe" (both meanings - guest and in-Xen-but-unsafe).

>> @@ -197,21 +197,20 @@ do {
>>  #define get_guest_size get_unsafe_size
>>  
>>  /**
>> - * __copy_to_user: - Copy a block of data into user space, with less checking
>> - * @to:   Destination address, in user space.
>> - * @from: Source address, in kernel space.
>> + * __copy_to_guest_pv: - Copy a block of data into guest space, with less
>> + *                       checking
> 
> I would have preferred pv to be a prefix rather than a suffix, but we
> already have the hvm accessors using that nomenclature.

Right, I wanted to match that naming model. Later we can
think about renaming to copy_{to,from}_{hvm,pv}() or
whatever else naming scheme we like. I have to admit though
I'm not convinced the longer {hvm,pv}_copy_{from,to}_guest()
would really be better.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

Jan

