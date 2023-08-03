Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107376F498
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 23:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576621.902959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfo0-00046z-V0; Thu, 03 Aug 2023 21:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576621.902959; Thu, 03 Aug 2023 21:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfo0-00045I-Qz; Thu, 03 Aug 2023 21:24:24 +0000
Received: by outflank-mailman (input) for mailman id 576621;
 Thu, 03 Aug 2023 21:24:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRfnz-00045C-DH
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 21:24:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfnw-0002OG-Ki; Thu, 03 Aug 2023 21:24:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfnw-0008FT-Ap; Thu, 03 Aug 2023 21:24:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=b8ACP4rpO5B7yWigDdIUg8+cSQszFkSW9ZgxUJLoQH0=; b=vcF5VNsrNRhz1R51C8SN4Ml8+9
	PJlFcNJpcTLEdx/ijQLiRYoM6UAAsloQgprRpFtM2yyxHiSSoZbqbaw1CUvI5GF2vL7trNwRgoqjF
	HFRlJemGr6hxtnkOzSj6jQRH/6lgsT6S5u/Kd3FAXhDioLm6N6T/PbtBfscu0ulVNNPw=;
Message-ID: <423f86e7-10ee-134e-7683-e15f7e2c64ed@xen.org>
Date: Thu, 3 Aug 2023 22:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011757400.2127516@ubuntu-linux-20-04-desktop>
 <14346689-8276-3c26-91e1-59bc2328518e@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <14346689-8276-3c26-91e1-59bc2328518e@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 03/08/2023 16:41, Daniel P. Smith wrote:
> On 8/1/23 21:01, Stefano Stabellini wrote:
>> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>>> patch the field is renamed to capabilities to encapsulate the 
>>> capabilities a
>>> domain has been granted. The first capability being the ability to 
>>> read/write
>>> the Xen console.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> Patch looks fine to me aside the two minor nits. I am not sure I
>> understand 100% the difference between capabilities and roles but I am
>> OK with the patch. I'd like to hear Julien's feedback on this as well.
> 
> This might be worth a section in the hypervisor-guide. As mentioned in 
> the cover letter, this was originally proposed as being under XSM. A 
> challenge I ran into is that, depending on your view, the 
> `is_privileged` field and `hardware_domain` global were either abused as 
> a function check and a non-resource privilege check or are just 
> multifaceted variables. This is why the concept of the role was struck 
> upon, it is more intuitive (for me at least) that have a role is 
> something that imparts accesses (privilege checks) and dictates 
> hypervisor behaviors when handling the domain (function checks). This 
> then brings us to an access or behavior that may be inherent to some 
> role(s) but may want to grant on an individually to a guest. A prime 
> example of this is console_io, for which it is inherent that the 
> hardware domain role will have access but may want to grant to a guest 
> without granting it an entire role. This is why I provided for 
> identifying these capabilities so that they may be assigned individually 
> to a domain.

Thanks for the explanation. Just to confirm my understanding, what you 
are suggesting is that for a given role, a domain will at least have the 
matching capabilities (more could be granted). Is that correct?

If so, this wouldn't this mean we can remove d->role and simply use 
d->capabilities?

> 
> While the role/capability is a natural progression from how the 
> hypervisor currently operates. Another approach that could be consider 
> to deliver a similar experience would be to break down every access and 
> function into a capability and then define the standard roles as a 
> conglomeration of certain capabilities.

At least from the explanation above, I think it would make sense to 
break down role to multiple capabilities.

Cheers,

-- 
Julien Grall

