Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7632E702
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 12:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93633.176607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI8Hv-0000Di-Jp; Fri, 05 Mar 2021 11:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93633.176607; Fri, 05 Mar 2021 11:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI8Hv-0000DH-F9; Fri, 05 Mar 2021 11:06:31 +0000
Received: by outflank-mailman (input) for mailman id 93633;
 Fri, 05 Mar 2021 11:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI8Ht-0000DC-OA
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 11:06:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fbf8a5c-4fde-4392-af05-8784c05dde33;
 Fri, 05 Mar 2021 11:06:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CB18AE6E;
 Fri,  5 Mar 2021 11:06:28 +0000 (UTC)
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
X-Inumbo-ID: 5fbf8a5c-4fde-4392-af05-8784c05dde33
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614942388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p94vtB7FKC31ddClYAOCM9e6725Ol9Iweze/itf8DCk=;
	b=uQw/ACgnxSP7XRpuZHm9zEad3Ere7xruP3aB/DwGvnheXrM1XX4ETrgzjkQEHXAbMjsbtZ
	Ll3VQmwwCukLgpZ05+//25XloK7DPpOyCEAPssucncxowRkqudo+gomFxyN2Zr8b0Osbhp
	hG+OFWNgs2+jXgJH+LINesTGIo6HGtE=
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <fc2e724b-bada-ded3-97b4-26e9a0f3ff4a@suse.com>
Message-ID: <94338621-9068-8376-c810-0fe1a9c8f3e0@suse.com>
Date: Fri, 5 Mar 2021 12:06:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fc2e724b-bada-ded3-97b4-26e9a0f3ff4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.03.2021 11:56, Jan Beulich wrote:
> On 04.03.2021 15:47, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>      const struct domain *d = v->domain;
>>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>      const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
>> +    uint64_t tmp;
>>  
>>      switch ( msr )
>>      {
>> @@ -1965,6 +1966,11 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>          break;
>>  
>>      default:
>> +        if ( d->arch.hvm.rdmsr_relaxed && !rdmsr_safe(msr, tmp) )
>> +        {
>> +            *msr_content = 0;
>> +            break;
>> +        }
> 
> You don't really need "tmp" here, do you? You could as well read
> into *msr_content, as you're zapping the value afterwards anyway.

Actually, while perhaps indeed not strictly needed, it allows the
compiler to produce better code, as it'll be able to recognize
the value doesn't need writing to memory on any path. I guess I'll
change the logic in my related patch along these lines then.

Jan

