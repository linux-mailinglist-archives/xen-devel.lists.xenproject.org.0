Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F9774F5A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 01:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580582.908911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWCG-0001xd-Nv; Tue, 08 Aug 2023 23:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580582.908911; Tue, 08 Aug 2023 23:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWCG-0001vy-Kb; Tue, 08 Aug 2023 23:33:04 +0000
Received: by outflank-mailman (input) for mailman id 580582;
 Tue, 08 Aug 2023 23:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTWCF-0001vZ-9K
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 23:33:03 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e861f0c6-3643-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 01:33:00 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691537573501190.40765713349026;
 Tue, 8 Aug 2023 16:32:53 -0700 (PDT)
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
X-Inumbo-ID: e861f0c6-3643-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691537576; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EBSJmbzn2Rkk06O6cgqX3DQB0dg1wY/I/sp1NglCIifjRAmxqSlHqBPMnQzuS+hcxhqVOZ+GiSAyUNSqKykOpoh1DXWJ87R7W+NRaXtrrTRonA0xnaXSSrgCZU8TH+WSldYliBErJwAEpJw9W4sBxTt8Jnar3j6JWFShTlDDaSc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691537576; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=yIJghSW8omd3M8TJsuo41CcpbjM/paoBCzdM07Hk/Ik=; 
	b=HNm2K1Qq2wZIb+QE5Os6paD26kL8WvBj16PcQlGTaRB3/bqCBN4ml3LUXMaQPZRTK3O+BQeybRgHRYu/KKxhqSDzyXJWh72bSSRrczdFPEW0AlRE1LwIv5dC3IcKAXMPZWPz9JEgkLR4Kpw3kMy63NoFvWlk/pyTCyrpHNiVndA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691537576;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yIJghSW8omd3M8TJsuo41CcpbjM/paoBCzdM07Hk/Ik=;
	b=oJ5g9bh1gcw8AsvQJ29qm60SfQb/mxgjGO3jufa9BIWawDI2PSq0qf0vkExbSBm7
	W22onsRHSGxpj1TkD7kHdeDzz00P8hGeak9IEAKkDIDgWQcY0He3UqOQ2GnBJaGSo9h
	A/1ICT4yKs7jrvVpb57p79ZOV+rn4tbQeGxAuJfA=
Message-ID: <810a7e96-9175-aea1-e01f-4f6ae1cbf690@apertussolutions.com>
Date: Tue, 8 Aug 2023 19:32:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <72f6cdbb-44a0-d821-1b7a-607e031cde99@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <72f6cdbb-44a0-d821-1b7a-607e031cde99@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/8/23 11:24, Jan Beulich wrote:
> On 01.08.2023 22:20, Daniel P. Smith wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -472,8 +472,8 @@ struct domain
>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>       uint8_t          role;
>> -    /* Can this guest access the Xen console? */
>> -    bool             is_console;
>> +#define CAP_CONSOLE_IO  (1U<<0)
>> +    uint8_t          capabilities;
>>       /* Is this guest being debugged by dom0? */
>>       bool             debugger_attached;
>>       /*
>> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>>       return is_hvm_domain(v->domain);
>>   }
>>   
>> +static always_inline bool domain_has_cap(
>> +    const struct domain *d, uint8_t cap)
>> +{
>> +    return d->capabilities & cap;
>> +}
> 
> What you implement here is effectively domain_has_any_cap(), which I
> don't think is of much use. At the very least you want to assert that
> cap is a power of two. But perhaps you rather want the caller to pass
> in a bit number, not a mask, such that it's obvious that only one
> thing can be checked at a time.

I did this thinking I was going to save keystrokes and encapsulate the 
check, but I just double checked and it would have only saved one. I 
will drop this and put the explicit bit checks at all the check sites.

>> +static always_inline bool domain_set_cap(
>> +    struct domain *d, uint8_t cap)
>> +{
>> +    switch ( cap )
>> +    {
>> +    case CAP_CONSOLE_IO:
>> +        d->capabilities |= cap;
>> +        break;
>> +    default:
>> +        return false;
>> +    }
>> +
>> +    return domain_has_cap(d, cap);
>> +}
> 
> The "set" operation doesn't need to be an inline function, does it?

I guess not, I can move into common/domain.c.

v/r,
dps

