Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383B1BF6D6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 13:30:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU7OH-0003t2-6B; Thu, 30 Apr 2020 11:30:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU7OF-0003iO-6g
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:30:03 +0000
X-Inumbo-ID: ed73165a-8ad5-11ea-9a28-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed73165a-8ad5-11ea-9a28-12813bfff9fa;
 Thu, 30 Apr 2020 11:30:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE5F5AF9F;
 Thu, 30 Apr 2020 11:29:58 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] common/domain: add a domain context record for
 shared_info...
To: paul@xen.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-5-paul@xen.org>
 <7f0821ed-34e8-2a63-aaab-bf781fdfb9e7@xen.org>
 <001601d61d72$efb23840$cf16a8c0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66028521-6b46-2aa8-1ba9-2ce703bbbfd8@suse.com>
Date: Thu, 30 Apr 2020 13:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <001601d61d72$efb23840$cf16a8c0$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.2020 17:37, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 20 April 2020 18:35
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich
>> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>
>> Subject: Re: [PATCH v2 4/5] common/domain: add a domain context record for shared_info...
>>
>> Hi Paul,
>>
>> On 07/04/2020 18:38, Paul Durrant wrote:
>>> ... and update xen-domctx to dump some information describing the record.
>>>
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>> ---
>>> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
>>> Cc: Wei Liu <wl@xen.org>
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Cc: George Dunlap <george.dunlap@citrix.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>> v2:
>>>   - Drop the header change to define a 'Xen' page size and instead use a
>>>     variable length struct now that the framework makes this is feasible
>>>   - Guard use of 'has_32bit_shinfo' in common code with CONFIG_COMPAT
>>> ---
>>>   tools/misc/xen-domctx.c   | 11 ++++++
>>>   xen/common/domain.c       | 81 +++++++++++++++++++++++++++++++++++++++
>>>   xen/include/public/save.h | 10 ++++-
>>>   3 files changed, 101 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
>>> index d663522a8b..a8d3922321 100644
>>> --- a/tools/misc/xen-domctx.c
>>> +++ b/tools/misc/xen-domctx.c
>>> @@ -59,6 +59,16 @@ static void dump_header(struct domain_save_descriptor *desc)
>>>       off += desc->length;
>>>   }
>>>
>>> +static void dump_shared_info(struct domain_save_descriptor *desc)
>>> +{
>>> +    DOMAIN_SAVE_TYPE(SHARED_INFO) s;
>>> +    READ(s);
>>> +    printf("    SHARED_INFO: field_width %u buffer size: %lu\n",
>>> +           s.field_width, desc->length - sizeof(s));
>>> +
>>> +    off += desc->length;
>>> +}
>>> +
>>>   static void dump_end(struct domain_save_descriptor *desc)
>>>   {
>>>       DOMAIN_SAVE_TYPE(END) e;
>>> @@ -125,6 +135,7 @@ int main(int argc, char **argv)
>>>           switch (desc.typecode)
>>>           {
>>>           case DOMAIN_SAVE_CODE(HEADER): dump_header(&desc); break;
>>> +        case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(&desc); break;
>>>           case DOMAIN_SAVE_CODE(END): dump_end(&desc); return 0;
>>>           default:
>>>               printf("Unknown type %u: skipping\n", desc.typecode);
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 3dcd73f67c..8b72462e07 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -33,6 +33,7 @@
>>>   #include <xen/xenoprof.h>
>>>   #include <xen/irq.h>
>>>   #include <xen/argo.h>
>>> +#include <xen/save.h>
>>>   #include <asm/debugger.h>
>>>   #include <asm/p2m.h>
>>>   #include <asm/processor.h>
>>> @@ -1646,6 +1647,86 @@ int continue_hypercall_on_cpu(
>>>       return 0;
>>>   }
>>>
>>> +static int save_shared_info(const struct vcpu *v, struct domain_context *c,
>>> +                            bool dry_run)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    struct domain_shared_info_context ctxt = {};
>>> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
>>> +    size_t size = hdr_size + PAGE_SIZE;
>>> +    int rc;
>>> +
>>> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, v, size);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    if ( !dry_run )
>>
>> NIT: I think the if is not necessary here as you don't skip that much code.
>>
> 
> I know, but it is illustrative so I'd rather keep it.

While I agree with the "illustrative", I'd really see this be part
of the struct initializer. Plus its use here made me wonder ...

>>> +        ctxt.field_width =
>>> +#ifdef CONFIG_COMPAT
>>> +            has_32bit_shinfo(d) ? 4 :
>>> +#endif
>>> +            8;
>>> +
>>> +    rc = domain_save_data(c, &ctxt, hdr_size);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    rc = domain_save_data(c, d->shared_info, PAGE_SIZE);
>>> +    if ( rc )
>>> +        return rc;

... why these don't get skipped. It took me going back through
earlier patches to find that there's effectively redundancy in
the passed arguments in that the write callback chosen varies with
whether "dry_run" is true or false.

Jan

