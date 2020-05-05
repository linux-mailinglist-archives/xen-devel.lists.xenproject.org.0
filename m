Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F871C5A29
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:56:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyzC-0006fu-7a; Tue, 05 May 2020 14:55:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVyzB-0006fl-0J
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:55:53 +0000
X-Inumbo-ID: 83999448-8ee0-11ea-9dc6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83999448-8ee0-11ea-9dc6-12813bfff9fa;
 Tue, 05 May 2020 14:55:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D783EABD1;
 Tue,  5 May 2020 14:55:53 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: fix an off-by-one error
To: Hongyan Xia <hx242@xen.org>
References: <37b7ec049ff82f92cc6724a743867e1cd9365f5b.1588676790.git.hongyxia@amazon.com>
 <8c3d6a2c-316c-f7fc-a2b0-3ea12721867d@suse.com>
 <45b6e79141e638c2930ccdfbc26a0de54034c525.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac455651-b8d2-7fe5-ff4f-d9c24eb10be1@suse.com>
Date: Tue, 5 May 2020 16:55:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <45b6e79141e638c2930ccdfbc26a0de54034c525.camel@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 16:01, Hongyan Xia wrote:
> On Tue, 2020-05-05 at 15:38 +0200, Jan Beulich wrote:
>> On 05.05.2020 13:06, Hongyan Xia wrote:
>>> @@ -358,7 +359,7 @@ static void show_guest_stack(struct vcpu *v,
>>> const struct cpu_user_regs *regs)
>>>      if ( mask == PAGE_SIZE )
>>>      {
>>>          BUILD_BUG_ON(PAGE_SIZE == STACK_SIZE);
>>> -        unmap_domain_page(stack);
>>> +        unmap_domain_page(stack_page);
>>>      }
>>
>> With this I think you want to change the whole construct here to
>>
>>     if ( stack_page )
>>         unmap_domain_page(stack_page);
>>
>> i.e. with the then no longer relevant BUILD_BUG_ON() also dropped.
> 
> I wonder if such a construct is better with UNMAP_DOMAIN_PAGE(), since
> it deals with NULL and will nullify it to prevent misuse.

In the case here I think I agree. For the future may I ask that
you wait with sending a new version until the discussion on the
previous one has settled?

Jan

