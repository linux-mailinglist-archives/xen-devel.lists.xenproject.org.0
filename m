Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E52DF9D9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 09:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57311.100256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGRd-0005zY-JX; Mon, 21 Dec 2020 08:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57311.100256; Mon, 21 Dec 2020 08:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGRd-0005z9-G8; Mon, 21 Dec 2020 08:21:29 +0000
Received: by outflank-mailman (input) for mailman id 57311;
 Mon, 21 Dec 2020 08:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGRb-0005z4-6m
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:21:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3be7f542-3a3b-47f8-a57e-0ca89e1bd8f6;
 Mon, 21 Dec 2020 08:21:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 471E7AD09;
 Mon, 21 Dec 2020 08:21:25 +0000 (UTC)
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
X-Inumbo-ID: 3be7f542-3a3b-47f8-a57e-0ca89e1bd8f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608538885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHHULxBeROb4X9ndbiEFbdSTahhG/Wv9UHgWmaUIokg=;
	b=sxGpf1wYjz6c0IV6UQuWiJQZpC1aF5KUP20qRa04yhy3i5+zbUoK4QqSPydtaLntj7f0+Q
	KIcVD2x2UGHaLwB0ZvVaoKIx9/BLwDB7IAQfOchw1D9rJr9+HWIJjmpCiJVB8gcBDYYezK
	OkZvhAScuEGt+hMDoOFH259dyh3skk0=
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills
 <cheyenne.wills@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
 <0430337a-6fcd-9471-4455-838390401220@citrix.com>
 <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
 <10958d4a-154f-a524-35e9-a75eaf50fe55@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90740e33-c69a-16d7-2622-fa57a1f34272@suse.com>
Date: Mon, 21 Dec 2020 09:21:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <10958d4a-154f-a524-35e9-a75eaf50fe55@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.12.2020 21:43, boris.ostrovsky@oracle.com wrote:
> On 12/17/20 12:49 PM, boris.ostrovsky@oracle.com wrote:
>> On 12/17/20 11:46 AM, Andrew Cooper wrote:
>>> On 17/12/2020 16:25, boris.ostrovsky@oracle.com wrote:
>>>> On 12/17/20 2:40 AM, Jan Beulich wrote:
>>>>> On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
>>>>> I think this is acceptable as a workaround, albeit we may want to
>>>>> consider further restricting this (at least on staging), like e.g.
>>>>> requiring a guest config setting to enable the workaround. 
>>>> Maybe, but then someone migrating from a stable release to 4.15 will have to modify guest configuration.
>>>>
>>>>
>>>>> But
>>>>> maybe this will need to be part of the MSR policy for the domain
>>>>> instead, down the road. We'll definitely want Andrew's view here.
>>>>>
>>>>> Speaking of staging - before applying anything to the stable
>>>>> branches, I think we want to have this addressed on the main
>>>>> branch. I can't see how Solaris would work there.
>>>> Indeed it won't. I'll need to do that as well (I misinterpreted the statement in the XSA about only 4.14- being vulnerable)
>>> It's hopefully obvious now why we suddenly finished the "lets turn all
>>> unknown MSRs to #GP" work at the point that we did (after dithering on
>>> the point for several years).
>>>
>>> To put it bluntly, default MSR readability was not a clever decision at all.
>>>
>>> There is a large risk that there is a similar vulnerability elsewhere,
>>> given how poorly documented the MSRs are (and one contemporary CPU I've
>>> got the manual open for has more than 6000 *documented* MSRs).  We did
>>> debate for a while whether the readability of the PPIN MSRs was a
>>> vulnerability or not, before eventually deciding not.
> 
> 
> Can we do something like KVM's ignore_msrs (but probably return 0 on reads to avoid leaks from the system)? It would allow to deal with cases when a guest is suddenly unable to boot after hypervisor update (especially from pre-4.14). It won't help in all cases since some MSRs may be expected to be non-zero but I think it will cover large number of them. (and it will certainly do what Jan is asking above but will not be specific to this particular breakage)

This would re-introduce the problem with detection (by guests) of certain
features lacking suitable CPUID bits. Guests would no longer observe the
expected #GP(0), and hence be at risk of misbehaving. Hence at the very
least such an option would need to be per-domain rather than (like for
KVM) global, and use of it should then imo be explicitly unsupported. And
along the lines of what KVM has, this may want to be a tristate so the
ignoring can be both silent and verbose.

Jan

