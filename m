Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC943F27CB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 09:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169277.309231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzD7-0006mT-Gy; Fri, 20 Aug 2021 07:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169277.309231; Fri, 20 Aug 2021 07:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzD7-0006js-Do; Fri, 20 Aug 2021 07:45:05 +0000
Received: by outflank-mailman (input) for mailman id 169277;
 Fri, 20 Aug 2021 07:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3BX=NL=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGzD6-0006jm-5e
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 07:45:04 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db80246c-b5b6-482d-9791-84bcdc292810;
 Fri, 20 Aug 2021 07:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id E5154B560099;
 Fri, 20 Aug 2021 10:45:00 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HE_G-e1vgChG; Fri, 20 Aug 2021 10:44:58 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 7906FB56009F;
 Fri, 20 Aug 2021 10:44:58 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1d6FXwsaMpCe; Fri, 20 Aug 2021 10:44:58 +0300 (EEST)
Received: from [192.168.1.35] (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 96BC4B5600A3;
 Fri, 20 Aug 2021 10:44:57 +0300 (EEST)
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
X-Inumbo-ID: db80246c-b5b6-482d-9791-84bcdc292810
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
Date: Fri, 20 Aug 2021 10:44:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

Please see inline.

On 8/20/21 9:52 AM, Jan Beulich wrote:
> On 19.08.2021 19:50, Costin Lupu wrote:
>> These changes introduce the page related definitions needed for mapping and
>> accessing guests memory. These values are intended to be used by any toolstack
>> component that needs to map guests memory. Until now, the values were defined
>> by the xenctrl.h header, therefore whenever a component had to use them it also
>> had to add a dependency for the xenctrl library.
>>
>> This patch also introduces xen_mk_long() macrodefinition for defining long
>> constants both for C and assembler code.
> 
> I'm still missing justification for the addition of a new header, especially
> as I don't see that header to gain much more contents down the road.
> 

For the first version, since it didn't need to include other headers, I
thought it would make sense to isolate the definitions in their own
headers. Now maybe it makes more sense to put the definitions in
arch-x86/xen.h, arch-arm.h and xen.h (the latter two) respectively. What
do you think? I'm open to suggestions here.

>> --- /dev/null
>> +++ b/xen/include/public/page.h
>> @@ -0,0 +1,36 @@
>> +/******************************************************************************
>> + * page.h
>> + *
>> + * Page definitions for accessing guests memory
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to
>> + * deal in the Software without restriction, including without limitation the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> + * sell copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> + * DEALINGS IN THE SOFTWARE.
>> + *
>> + * Copyright (c) 2021, Costin Lupu
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_PAGE_H__
>> +#define __XEN_PUBLIC_PAGE_H__
>> +
>> +#include "xen.h"
>> +
>> +#define XEN_PAGE_SHIFT           12
>> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
> 
> You went too far here, I'm afraid: In reply to v1 I did say "The latter
> two, being identical ..." - XEN_PAGE_SHIFT ought to continue to be a
> per-arch constant, even if right now it is the same for Arm and x86.
> 

Alright, now I got it.

> Thinking of which - with exposing this as a stable ABI (not just the
> abstraction, but the specific values and the fact that they're
> invariable become part of the stable ABI this way), what is the plan
> for supporting 64k(?) page size on Arm in the future? At that point
> you _cannot_ simply remove or replace the #define you add here. As
> the immediate need is by the tool stack, enclosing in 
> 
> #if defined(__XEN__) || defined(__XEN_TOOLS__)
> 
> might be an option, with the downside of having stable libraries
> (foreignmemory and gnttab) depend on an unstable hypervisor interface
> (again). I can't seem to be able to think of anything better ...

Here I can be only guessing because I don't know all the requirements
and I would need more input. One would have to add new values for ARM
that would be enabled by some flag and then both the toolstack and the
hypervisor would have to be rebuilt. With the current approach I don't
think there is room for anything else, but I'm curious to hear about
other ideas.

Cheers,
Costin

