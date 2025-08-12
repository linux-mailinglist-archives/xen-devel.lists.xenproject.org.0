Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC62B23C12
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 00:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079313.1440250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxtP-000101-7o; Tue, 12 Aug 2025 22:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079313.1440250; Tue, 12 Aug 2025 22:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxtP-0000xc-59; Tue, 12 Aug 2025 22:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1079313;
 Tue, 12 Aug 2025 22:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulxtN-0000xW-I0
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 22:54:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulxtH-001tjY-1r;
 Tue, 12 Aug 2025 22:54:47 +0000
Received: from [2a02:8012:3a1:0:1512:c47a:b44b:55a5]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulxtH-001mqI-1l;
 Tue, 12 Aug 2025 22:54:47 +0000
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
	bh=mavMujl29x08xmXdH6YXZUNGkQoCI7nhn/nUwfdEVIQ=; b=6RlcbJ6v8bPx0vJjB557EMkPRj
	FPVV1k2ZcKgF4PG76IBSTZnqXB/0PYYVOh8QMs5Dmiu9HvqU3bTadiXf/cJhNjp5AFnD8Y2zhaIls
	DnCpND1tIu0VS6uY/4jjUYYnm7Qj0/dCdgNmrt9O1c6bB3qVSVbzoEfX/MYjueg3fQnk=;
Message-ID: <24d8591e-f669-4142-a783-c7cfea87034c@xen.org>
Date: Tue, 12 Aug 2025 23:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
 <aba2627f-b38d-4d6c-9c5e-4bdc4f5b563f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aba2627f-b38d-4d6c-9c5e-4bdc4f5b563f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/08/2025 08:32, Jan Beulich wrote:
> On 11.08.2025 23:21, Julien Grall wrote:
>> On 11/08/2025 21:30, Dmytro Prokopchuk1 wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -330,9 +330,12 @@ shared_entry_header(struct grant_table *t, grant_ref_t ref)
>>>            /* Returned values should be independent of speculative execution */
>>>            block_speculation();
>>>            return &shared_entry_v2(t, ref).hdr;
>>> +
>>> +    default:
>>> +        ASSERT_UNREACHABLE();
>>> +        break;
>>>        }
>>>    
>>> -    ASSERT_UNREACHABLE();
>>   >       block_speculation();>
>>>        return NULL;
>>
>> I know you are trying to apply the MISRA rule. But this is odd that you
>> move the ASSERT_UNREACHABLE() but then code after is still only
>> reachable from the default. In fact, this is introducing a risk if
>> someone decides to add a new case but then forgot to return a value.
>>
>> By moving the two other lines, the compiler should be able to throw an
>> error if you forgot a return.
> 
> I think we did discuss this pattern in the past. While moving everything up
> to the "return" into the default: handling will please Eclair / Misra, we'll
> then end up with no return statement at the end of a non-void function.
> Beyond being good practice (imo) to have such a "main" return statement,
> that's actually another rule, just one we apparently didn't accept (15.5).

Reading 15.5, this seems to be about having a single return in the 
function. Unless I misunderstood something, this is different from what 
you suggest.

Anyway, my main problem with this change is that ASSERT_UNREACHABLE() is 
moved. I could possibly settle with:

default:
   break;
}

ASSERT_UNREACHABLE();
...

But at least to me, this pattern is more difficult to read because I 
have to look through the switch to understand the patch is only meant ot 
be used by the "default" case.

Cheers,

-- 
Julien Grall


