Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065A122B065
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jybB9-0007zk-Bp; Thu, 23 Jul 2020 13:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1OPV=BC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jybB7-0007za-H6
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:22:29 +0000
X-Inumbo-ID: 8df58aec-cce7-11ea-a294-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8df58aec-cce7-11ea-a294-12813bfff9fa;
 Thu, 23 Jul 2020 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFAxGj7t0naFq8V00wiOTIEgSTg9FjQdClBP/9y0MLA=; b=ledAvmMe5HcHyt7CasvjnvTK/o
 VMHBNaqvcyBPNGlq/d0ou4c00X2b1pUrx9IoZ3vq9D52WBGiWGh8n6eV9h/POTPpq0G0nFSYFyGzu
 lPdQSy5m3+JilZDdfwQOq76uqvNgrzRU5YkXeB9HXHd1w4qmWMIxZSkIwBJk4l5OGRsU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jybB4-0008Ca-Mi; Thu, 23 Jul 2020 13:22:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jybB4-0007JB-F3; Thu, 23 Jul 2020 13:22:26 +0000
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
Date: Thu, 23 Jul 2020 14:22:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 23/07/2020 12:23, Jan Beulich wrote:
> On 22.07.2020 18:53, Julien Grall wrote:
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>   
>>       for ( ; ; )
>>       {
>> -        int irq = pirq->arch.irq;
>> +        int irq = read_atomic(&pirq->arch.irq);
> 
> There we go - I'd be fine this way, but I'm pretty sure Andrew
> would want this to be ACCESS_ONCE(). So I guess now is the time
> to settle which one to prefer in new code (or which criteria
> there are to prefer one over the other).

I would prefer if we have a single way to force the compiler to do a 
single access (read/write).

The existing implementation of ACCESS_ONCE() can only work on scalar 
type. The implementation is based on a Linux, although we have an extra 
check. Looking through the Linux history, it looks like it is not 
possible to make ACCESS_ONCE() work with non-scalar types:

     ACCESS_ONCE does not work reliably on non-scalar types. For
     example gcc 4.6 and 4.7 might remove the volatile tag for such
     accesses during the SRA (scalar replacement of aggregates) step
     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145)

I understand that our implementation of read_atomic(), write_atomic() 
would lead to less optimized code. So maybe we want to import 
READ_ONCE() and WRITE_ONCE() from Linux?

As a side note, I have seen suggestion only (see [1]) which suggest that 
they those helpers wouldn't be portable:

"One relatively unimportant misunderstanding is due to the fact that the 
standard only talks about accesses to volatile objects. It does not talk 
about accesses via volatile qualified pointers. Some programmers believe 
that using a pointer-to-volatile should be handled as though it pointed 
to a volatile object. That is not guaranteed by the standard and is 
therefore not portable. However, this is relatively unimportant because 
gcc does in fact treat a pointer-to-volatile as though it pointed to a 
volatile object."

I would assume that the use is OK on CLang and GCC given that Linux has 
been using it.


> And this is of course besides the fact that I think we have many
> more instances where guaranteeing a single access would be
> needed, if we're afraid of the described permitted compiler
> behavior. Which then makes me wonder if this is really something
> we should fix one by one, rather than by at least larger scope
> audits (in order to not suggest "throughout the code base").

It depends how much the contributor can invest on chasing the rest of 
the issues. The larger the scope is, the less likely you will find 
someone that has bandwith to allocate for fixing it completely.

If the scope is "a field", then I think it is a reasonable suggesting.

In this case, I had a look at arch.irq and wasn't able to spot other 
potential issue.

> As a minor remark, unless you've observed problematic behavior,
> would you mind adding "potential" or "theoretical" to the title?

I am not aware of any issues with compiler so far. So I can add 
"potential" in the title.

Cheers,

[1] https://www.airs.com/blog/archives/154

-- 
Julien Grall

