Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14528351556
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104490.199885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxdL-0007UE-Ek; Thu, 01 Apr 2021 13:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104490.199885; Thu, 01 Apr 2021 13:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxdL-0007Tp-BO; Thu, 01 Apr 2021 13:45:15 +0000
Received: by outflank-mailman (input) for mailman id 104490;
 Thu, 01 Apr 2021 13:45:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRxdJ-0007Te-FQ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:45:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba5cc7f9-de0e-4828-9aea-da80d81bc17d;
 Thu, 01 Apr 2021 13:45:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C5C0AF23;
 Thu,  1 Apr 2021 13:45:11 +0000 (UTC)
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
X-Inumbo-ID: ba5cc7f9-de0e-4828-9aea-da80d81bc17d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617284711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi1iTupuL2Ht8KEZSjEM8o0HXNdVSkE57LdTRo3luNs=;
	b=Xx2nRWuP2giTPbGgg7FP823UWZakdk6IncdGxCOUL0u5RdTMWClKYBfGR/Az7Ctb69IoQG
	1kxfr+EqDa8MZ5VN0huNZlwR7YJYjMP0T49wYhGR0/Xt92P2xnhxT4Iea6vYDOMsnL1TMA
	lUMCLrw/UnCmpsAmODuJXptAzqORBV8=
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <95d8688b-2e54-ae02-09ce-45203959e08a@suse.com>
 <ac94721d-1741-5523-e70d-1eac15c23603@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4d0df58-58a3-b21d-db5f-4895a36bb917@suse.com>
Date: Thu, 1 Apr 2021 15:45:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ac94721d-1741-5523-e70d-1eac15c23603@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 15:20, Andrew Cooper wrote:
> On 31/03/2021 15:03, Jan Beulich wrote:
>> On 31.03.2021 15:31, Andrew Cooper wrote:
>>> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
>>> path from __map_domain_page_global() failing would doubly free
>>> vlapic->regs_page.
>> I'm having difficulty seeing this. What I find at present is
>>
>>     rc = vlapic_init(v);
>>     if ( rc != 0 ) /* teardown: vlapic_destroy */
>>         goto fail2;
>>
>> and then
>>
>>  fail3:
>>     vlapic_destroy(v);
>>  fail2:
>>
>> Am I missing some important aspect?
> 
> No - I'm blind.  (although I do blame the code comment for being
> actively misleading.)
> 
> I retract the patch at this point.  It needs to be part of a bigger
> series making changes like this consistently across the callers.
> 
>>> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
>>> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
>>>
>>> Rearrange vlapic_init() to group all trivial initialisation, and leave all
>>> cleanup to the caller, in line with our longer term plans.
>> Cleanup functions becoming idempotent is what I understand is the
>> longer term plan. I didn't think this necessarily included leaving
>> cleanup after failure in a function to it caller(s).
> 
> That's literally the point of the exercise.
> 
>>  At least in the
>> general case I think it would be quite a bit better if functions
>> cleaned up after themselves - perhaps (using the example here) by
>> vlapic_init() calling vlapic_destroy() in such a case.
> 
> That pattern is the cause of code duplication (not a problem per say),
> and many bugs (the problem needing solving) caused by the duplicated
> logic not being equivalent.
> 
> We've got the start of the top-level pattern in progress, with
> {domain,vcpu}_create() calling {d,v}_teardown() then {d,v}_destroy() for
> errors.

Hmm, in which case you mean to shift the responsibility not to "the
caller" (many instances) but "the top level caller" (a single
instance)?

Jan

