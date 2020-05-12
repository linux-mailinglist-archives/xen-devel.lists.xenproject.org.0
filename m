Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5631CF64E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 15:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVQp-0006bQ-3b; Tue, 12 May 2020 13:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYVQn-0006bK-Mx
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 13:58:49 +0000
X-Inumbo-ID: b410fac6-9458-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b410fac6-9458-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 13:58:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03A5EAE56;
 Tue, 12 May 2020 13:58:50 +0000 (UTC)
Subject: Re: [PATCH 06/16] x86/traps: Implement #CP handler and extend #PF for
 shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-7-andrew.cooper3@citrix.com>
 <561914ce-d076-8f1a-e74b-7c37567480a1@suse.com>
 <b7cbee0d-2215-e600-e755-48a329e0786d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bab5512-2bcb-7b92-f4ac-d21e89b748d8@suse.com>
Date: Tue, 12 May 2020 15:58:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b7cbee0d-2215-e600-e755-48a329e0786d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 19:20, Andrew Cooper wrote:
> On 04/05/2020 15:10, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> @@ -1457,6 +1451,10 @@ void do_page_fault(struct cpu_user_regs *regs)
>>>      {
>>>          enum pf_type pf_type = spurious_page_fault(addr, regs);
>>>  
>>> +        /* Any fault on a shadow stack access is a bug in Xen. */
>>> +        if ( error_code & PFEC_shstk )
>>> +            goto fatal;
>> Not going through the full spurious_page_fault() in this case
>> would seem desirable, as would be at least a respective
>> adjustment to __page_fault_type(). Perhaps such an adjustment
>> could then avoid the change (and the need for goto) here?
> 
> This seems to do a lot of things which have little/nothing to do with
> spurious faults.
> 
> In particular, we don't need to disable interrupts to look at
> PFEC_shstk, or RSVD for that matter.

Perhaps even more so a reason to make spurious_page_fault()
return a new enum pf_type enumerator? In any event your reply
looks more like a "yes" to my suggestion than an objection,
but I may be getting it entirely wrong ...

Jan

