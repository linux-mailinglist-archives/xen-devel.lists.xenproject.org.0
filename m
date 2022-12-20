Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31E651C78
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466566.725463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YB9-0007WI-0t; Tue, 20 Dec 2022 08:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466566.725463; Tue, 20 Dec 2022 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YB8-0007Tu-Tw; Tue, 20 Dec 2022 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 466566;
 Tue, 20 Dec 2022 08:40:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7YB7-0007To-Rw
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:40:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YB4-0002Ru-Sj; Tue, 20 Dec 2022 08:40:46 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YB4-0005zP-MN; Tue, 20 Dec 2022 08:40:46 +0000
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
	bh=LwdRhtJPCv0NtfSpg+oV81PEDNotIuVqHPNl77YCrlo=; b=n1ja3uJnnxDinCOfROZWv6Vwli
	Q5pfun+4bXKuMjkiLtD1zafhs+ZfDLO+5u1a9VVae6q1hpmT8QM+8NT6Y62MCzZ0BISla1Q4Kjan9
	5V4WBSCyHbfS/NvLsR/czRj119ElPryZZhYOr5EKWOB7SPi2gB4SnGXZdMW3naWKQ89Q=;
Message-ID: <45781a58-61cb-bc8c-c18d-35d054b4b06c@xen.org>
Date: Tue, 20 Dec 2022 08:40:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
 <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
 <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/12/2022 12:48, Jan Beulich wrote:
> On 16.12.2022 13:26, Julien Grall wrote:
>> On 19/10/2022 08:41, Jan Beulich wrote:
>>> Before adding a new vCPU operation to register the runstate area by
>>> guest-physical address, add code to actually keep such areas up-to-date.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> RFC: Pages aren't marked dirty when written to (matching the handling of
>>>        space mapped by map_vcpu_info() afaict), on the basis that the
>>>        registrations are lost anyway across migration.
>>
>> So I agree for the existing migration. But I wonder whether we would
>> need to dirty those pages if we live-migrated a guest without its help
>> (IOW the registrations would still be present).
> 
> Even then I'd expect the area to be re-populated at the target, so the
> page contents would need moving over (perhaps multiple times) only if
> any other parts of such a page were written to.
You are right. I had another look how this was implemented and we indeed 
create a record for each vcpu_info/runstate to transfer the content.

> 
>> Anyway, nothing to worry about yet as this is not supported upstream.
> 
> I assume you've taken note of this for the transparent migration work.

Yes.

> One question after all is how you'd make handling of the area at the
> new target transparent, i.e. without any anomalies in the values the
> guest gets to see. It may very well be that every such area needs
> special treatment in the course of migrating, such that the most up-
> to-date values are reported as part of the migration stream, but
> separate from all the pages' contents.

AFAIK, vcpu_info doesn't need special treatment but the runstate needs 
because it contains a field 'state_entry_time' that is a system time in 
nanoseconds.

This could be solved by never exposing the system time to the guest and 
instead a relative value from when it starts.

> 
>>> Plus the contents
>>>        of the areas in question have to be deemed volatile in the first
>>>        place (so saving a "most recent" value is pretty meaningless even
>>>        for e.g. snapshotting).
>>>
>>> RFC: Can we perhaps avoid the VM-assist conditionals, assuming the more
>>>        modern behavior to apply uniformly for gaddr-based registrations?
>>
>> It is not clear why someone would want to use the old behavior with the
>> new gaddr-based registrations. So I would say yes.
> 
> Okay, will do.
> 
>>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>>        and alignment) of the runstate area. I don't think it is an option
>>>        to require 32-bit code to pass a range such that even the 64-bit
>>>        layout wouldn't cross a page boundary (and be suitably aligned). I
>>>        also don't see any other good solution, so for now a crude approach
>>>        with an extra boolean is used (using has_32bit_shinfo() isn't race
>>>        free and could hence lead to overrunning the mapped space).
>>
>> I think the extra check for 32-bit code to pass the check for 64-bit
>> layout would be better.
> 
> I'm afraid I can't derive from your reply what it is you actually want.

I think for 32-bit call, we also want to check the address provide will 
also pass the 64-bit check (i.e. if used as a 64-bit layout, the area 
would not cross a page boundary and be suitably aligned).

Cheers,

-- 
Julien Grall

