Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD451C5A41
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVz2H-00076D-Gs; Tue, 05 May 2020 14:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVz2G-000768-Hc
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:59:04 +0000
X-Inumbo-ID: f5ceee5a-8ee0-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ceee5a-8ee0-11ea-9887-bc764e2007e4;
 Tue, 05 May 2020 14:59:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6199DABB2;
 Tue,  5 May 2020 14:59:05 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-2-roger.pau@citrix.com>
 <20332b18-960c-a180-8150-55fae60bdc6e@suse.com>
 <20200505141138.GC1353@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26ec20bb-411f-c16a-40ff-417c8c5ce777@suse.com>
Date: Tue, 5 May 2020 16:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505141138.GC1353@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 16:11, Roger Pau Monné wrote:
> On Tue, May 05, 2020 at 03:47:43PM +0200, Jan Beulich wrote:
>> On 05.05.2020 11:24, Roger Pau Monne wrote:
>>> Remove the conversion of _PAGE_GNTTAB to a boolean, since the and
>>> operation performed afterwards will already return false if the value
>>> of the macro is 0.
>>
>> I'm sorry, but no. The expression was put there on purpose by
>> 0932210ac095 ("x86: Address "Bitwise-and with zero
>> CONSTANT_EXPRESSION_RESULT" Coverity issues"), and the
>> description there is clearly telling us that this wants to stay
>> unless Coverity changed in the meantime. Otherwise I'm afraid
>> a more elaborate solution will be needed to please both.
> 
> Clang is fine with changing this to _PAGE_GNTTAB != 0. Would you be
> OK with this approach?

I'd be okay with it, but then I guess I'd prefer ...

>> Or a
>> more simplistic one, like using "#if _PAGE_GNTTAB" around the
>> construct.
> 
> Yes, that's the other solution I had in mind.

.... this one. Let's see if Andrew has a clear opinion either
way - it was him to address the original Coverity issue after
all.

Jan

