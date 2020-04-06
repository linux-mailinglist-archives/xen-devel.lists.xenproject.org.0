Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BB19F213
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 11:08:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNjz-00071K-B5; Mon, 06 Apr 2020 09:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLNjx-00071C-WD
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 09:08:22 +0000
X-Inumbo-ID: 292a9400-77e6-11ea-bfdb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 292a9400-77e6-11ea-bfdb-12813bfff9fa;
 Mon, 06 Apr 2020 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f/czkPuAxgbvkU7yHJ3kEfADYS05yG6g7KfewQSoHO4=; b=C853642AhlLU0dHqeerZLrAmQ7
 UfLi1gFyFjlVeY8ciPLTppEixyfHR9BVYHpNSDdXSfsKrl+LYMRgth0Uyt9wQW2j3r2Vg4Mv7FLxm
 TLOIIHkixNzmcHfeEreLgIWFvDyFLbOWvJvkO4N+oPyn8z27GMclyKoRLv5kV4xQdmOQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNjt-0005Lt-PQ; Mon, 06 Apr 2020 09:08:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNjt-0006bO-IQ; Mon, 06 Apr 2020 09:08:17 +0000
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
 <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
 <001701d60bed$25606f80$70214e80$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e2e25069-36e5-b965-8f66-59a460369e88@xen.org>
Date: Mon, 6 Apr 2020 10:08:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001701d60bed$25606f80$70214e80$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 06/04/2020 09:27, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 03 April 2020 18:24
>> To: paul@xen.org; xen-devel@lists.xenproject.org
>> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>; 'Ian
>> Jackson' <ian.jackson@eu.citrix.com>; 'Jan Beulich' <jbeulich@suse.com>; 'Stefano Stabellini'
>> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
>> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for save/restore of 'domain' context
>>
>> Hi Paul,
>>
>> On 03/04/2020 16:55, Paul Durrant wrote:
>>>> -----Original Message-----
>>> [snip]
>>>>> +
>>>>> +#include <xen/save.h>
>>>>> +
>>>>> +struct domain_context {
>>>>> +    bool log;
>>>>> +    struct domain_save_descriptor desc;
>>>>> +    domain_copy_entry copy;
>>>>
>>>> As your new framework is technically an extension of existing one, it
>>>> would be good to explain why we diverge in the definitions.
>>>>
>>>
>>> I don't follow. What is diverging? I explain in the commit comment that this is a parallel
>> framework. Do I need to justify why it is not a carbon copy of the HVM one?
>>
>> Well, they are both restoring/saving guest state. The only difference is
>> the existing one is focusing on HVM state.
>>
>> So it would make sense long term to have only one hypercall and tell
>> what you want to save. In fact, some of the improvement here would
>> definitely make the HVM one nicer to use (at least in the context of LU).
>>
> 
> I guess we could move the HVM save records over to the new framework, but it works for the moment so I don't want to bring it into scope now.

And I agree, hence why I say "long term" :).

> 
>>   From the commit message, it is not clear to me why a new framework and
>> why the infrastructure is at the same time different but not.
>>
> 
> An alternative would be to move the HVM save code into common code and then try to adapt it. I think that would result in more code churn and ultimately be harder to review. The extra infrastructure introduced here is fairly minimal and, for the moment, only targeting PV state. As I said above there's nothing stopping the HVM records being ported over later once any initial issues have been shaken out.

Code churn is always going to necessary one day or another if we want to 
consolidate the two.

Having two frameworks is not without risks. There are a few unknown to 
be answered:
   * Is there any dependency between the two? If yes, what is the ordering?
   * The name of the hypercall does not say anything about "PV". So a 
contributor could think it would be fine to save/restore new HVM state 
in the new generic hypercall. Is it going to be an issue? If so, how do 
we prevent it?
   * Are we going to deprecate the existing framework?

I am not suggesting we should not go with two frameworks, but the 
reasons and implications are not clear to me. Hence, why I think the 
commit message should be expanded with some rationale.

Cheers,

-- 
Julien Grall

