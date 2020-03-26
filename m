Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDD194386
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:50:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUjA-0000p9-Ix; Thu, 26 Mar 2020 15:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHUj8-0000p0-Cz
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:47:26 +0000
X-Inumbo-ID: 166bad4c-6f79-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 166bad4c-6f79-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 15:47:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2713BACCE;
 Thu, 26 Mar 2020 15:47:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
 <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
 <fcff0161-3e77-c4cd-be58-f522b3269142@suse.com>
 <f95b8d56-5f62-b3f2-4ec3-46f1b47ddb48@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <85555ad1-4def-c4c5-a9fb-0cace3a13166@suse.com>
Date: Thu, 26 Mar 2020 16:47:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f95b8d56-5f62-b3f2-4ec3-46f1b47ddb48@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 16:38, Andrew Cooper wrote:
> On 23/03/2020 08:38, Jan Beulich wrote:
>> On 21.03.2020 23:19, Julien Grall wrote:
>>> On Fri, 20 Mar 2020 at 21:26, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> --- a/xen/include/xen/xmalloc.h
>>>> +++ b/xen/include/xen/xmalloc.h
>>>> @@ -51,6 +51,17 @@
>>>>  #define xmalloc_bytes(_bytes) _xmalloc(_bytes, SMP_CACHE_BYTES)
>>>>  #define xzalloc_bytes(_bytes) _xzalloc(_bytes, SMP_CACHE_BYTES)
>>>>
>>>> +/* Allocate untyped storage and copying an existing instance. */
>>>> +#define xmemdup_bytes(_src, _nr)                \
>>>> +    ({                                          \
>>>> +        unsigned long nr_ = (_nr);              \
>>>> +        void *dst_ = xmalloc_bytes(nr_);        \
>>> The nr_ vs _nr is really confusing to read. Could you re-implement the
>>> function as a static inline?
>> And even if that wouldn't work out - what's the point of having
>> macro argument names with leading underscores?
> 
> Consistency with all the other code in this file.

I value consistency quite high, but then please consistent with
something that properly follows other rules.

>>  This isn't any
>> better standard-wise (afaict) than other uses of leading
>> underscores for identifiers which aren't CU-scope.
> 
> It is a parameter describing textural replacement within the body. 
> There is 0 interaction with external namespacing standards.

Please forgive me saying so, but a typical reply I might get back
from you would be: And?

I'm not going to insist nor nak the patch, but I don't welcome
widening existing issues we have.

Jan

