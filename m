Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA892B9863
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31186.61475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn59-000563-Cs; Thu, 19 Nov 2020 16:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31186.61475; Thu, 19 Nov 2020 16:46:51 +0000
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
	id 1kfn59-00055e-9V; Thu, 19 Nov 2020 16:46:51 +0000
Received: by outflank-mailman (input) for mailman id 31186;
 Thu, 19 Nov 2020 16:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfn57-00055V-E7
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:46:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47fb2237-f0d5-4969-93ed-b4ec2bd88bdc;
 Thu, 19 Nov 2020 16:46:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDFAFAC46;
 Thu, 19 Nov 2020 16:46:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfn57-00055V-E7
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:46:49 +0000
X-Inumbo-ID: 47fb2237-f0d5-4969-93ed-b4ec2bd88bdc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 47fb2237-f0d5-4969-93ed-b4ec2bd88bdc;
	Thu, 19 Nov 2020 16:46:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605804407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Lp8pf/Gv50jjKY3pqNKsNI1PVOJp90+DlP/KkJvffo=;
	b=YPCsmYEMxm+s06Ov2uge0eDlS7015Z8QYKZAkG7NVAG3jFSbdW26XjEQU0lc9j0LNyYMn8
	N3onIbcvWiT0zR+sqb8RyGFU4zJUnD4hSCyJ8c63twOUwB/Vz8bDVNoQ1vNurx0I1TzLZU
	oT9AUS7n/G3LRoEY1vKzglXnA7HdQY4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BDFAFAC46;
	Thu, 19 Nov 2020 16:46:47 +0000 (UTC)
Subject: Re: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and
 accessor functions...
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-4-paul@xen.org>
 <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
 <00c901d6be8d$6d7a5c10$486f1430$@xen.org>
 <0ec90042-cb19-320e-1676-409b68b73a51@suse.com>
 <b70dad84ef9e400caa023da53494dc0a@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73501e7c-9363-1fc8-9262-c4b3d9cc6347@suse.com>
Date: Thu, 19 Nov 2020 17:46:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <b70dad84ef9e400caa023da53494dc0a@EX13D32EUC003.ant.amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.11.2020 17:44, Durrant, Paul wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 19 November 2020 16:41
>> To: paul@xen.org
>> Cc: Durrant, Paul <pdurrant@amazon.co.uk>; 'Wei Liu' <wl@xen.org>; 'Andrew Cooper'
>> <andrew.cooper3@citrix.com>; 'Roger Pau Monné' <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: RE: [EXTERNAL] [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and accessor
>> functions...
>>
>> CAUTION: This email originated from outside of the organization. Do not click links or open
>> attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> On 19.11.2020 17:02, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com
>>>> Sent: 12 November 2020 08:46
>>>>
>>>> On 11.11.2020 21:07, Paul Durrant wrote:
>>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>>>> @@ -507,15 +507,41 @@ void viridian_domain_deinit(struct domain *d)
>>>>>      XFREE(d->arch.hvm.viridian);
>>>>>  }
>>>>>
>>>>> +struct hypercall_vpmask {
>>>>> +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
>>>>> +};
>>>>> +
>>>>> +static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
>>>>> +
>>>>> +static void vpmask_empty(struct hypercall_vpmask *vpmask)
>>>>
>>>> const?
>>>
>>> Yes, I suppose that's ook for all these since the outer struct is
>>> not changing... It's a bit misleading though.
>>
>> I'd be curious to learn about that "misleading" aspect.
>>
> 
> Because the function is modifying (zero-ing) the bitmap... so implying
> the mask is const is measleading.

Oh, I was mislead by the name then; should have looked at the return
type (which I was implying to be bool, when it's void). Please
disregard my request(s) in such case(s).

Jan

