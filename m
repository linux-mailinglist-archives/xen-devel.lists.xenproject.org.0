Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853752E09E0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:55:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57792.101286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgGI-0001rb-Ah; Tue, 22 Dec 2020 11:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57792.101286; Tue, 22 Dec 2020 11:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krgGI-0001rC-7L; Tue, 22 Dec 2020 11:55:30 +0000
Received: by outflank-mailman (input) for mailman id 57792;
 Tue, 22 Dec 2020 11:55:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krgGH-0001r7-20
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:55:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05dcea81-18cf-4a05-97d8-1245155ad82f;
 Tue, 22 Dec 2020 11:55:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 610BDACF9;
 Tue, 22 Dec 2020 11:55:27 +0000 (UTC)
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
X-Inumbo-ID: 05dcea81-18cf-4a05-97d8-1245155ad82f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608638127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4x5NnSKa3GHmGh/u3YbUsIngcrZNDOYXe5Jaxt7bmE=;
	b=qo/C/79joJ3eDMolrY3SZG47C9jo1UifXAftbr/3BqSN3UpYy3OzGvW0bekHYcUO5L1GgA
	XpuWGxCYeLON9EVM9TtzP8hiXGV5+zjOHRqlaOByuM/BXb/RkDaqXghlWy+fQU66TW/cTk
	6MVsDeuLod+YUY2kQHY0taQIt8Rx328=
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <b3d1cb55-2793-f37e-13d1-b9e8de2057da@suse.com>
 <49d46056-2b99-3ec6-cf93-3f40be259330@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dca168c-93e4-8852-9649-f3713aaa180c@suse.com>
Date: Tue, 22 Dec 2020 12:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <49d46056-2b99-3ec6-cf93-3f40be259330@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.12.2020 12:46, Andrew Cooper wrote:
> On 22/12/2020 10:35, Jan Beulich wrote:
>> On 21.12.2020 19:14, Andrew Cooper wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -273,6 +273,59 @@ static int __init parse_extra_guest_irqs(const char *s)
>>>  custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>>>  
>>>  /*
>>> + * Release resources held by a domain.  There may or may not be live
>>> + * references to the domain, and it may or may not be fully constructed.
>>> + *
>>> + * d->is_dying differing between DOMDYING_dying and DOMDYING_dead can be used
>>> + * to determine if live references to the domain exist, and also whether
>>> + * continuations are permitted.
>>> + *
>>> + * If d->is_dying is DOMDYING_dead, this must not return non-zero.
>>> + */
>>> +static int domain_teardown(struct domain *d)
>>> +{
>>> +    BUG_ON(!d->is_dying);
>>> +
>>> +    /*
>>> +     * This hypercall can take minutes of wallclock time to complete.  This
>>> +     * logic implements a co-routine, stashing state in struct domain across
>>> +     * hypercall continuation boundaries.
>>> +     */
>>> +    switch ( d->teardown.val )
>>> +    {
>>> +        /*
>>> +         * Record the current progress.  Subsequent hypercall continuations
>>> +         * will logically restart work from this point.
>>> +         *
>>> +         * PROGRESS() markers must not be in the middle of loops.  The loop
>>> +         * variable isn't preserved across a continuation.
>>> +         *
>>> +         * To avoid redundant work, there should be a marker before each
>>> +         * function which may return -ERESTART.
>>> +         */
>>> +#define PROGRESS(x)                             \
>>> +        d->teardown.val = PROG_ ## x;           \
>>> +        /* Fallthrough */                       \
>>> +    case PROG_ ## x
>>> +
>>> +        enum {
>>> +            PROG_done = 1,
>>> +        };
>>> +
>>> +    case 0:
>>> +    PROGRESS(done):
>>> +        break;
>>> +
>>> +#undef PROGRESS
>>> +
>>> +    default:
>>> +        BUG();
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> While as an initial step this may be okay, I envision ordering issues
>> with domain_relinquish_resources() - there may be per-arch things that
>> want doing before certain common ones, and others which should only
>> be done when certain common teardown was already performed. Therefore
>> rather than this being a "common equivalent of
>> domain_relinquish_resources()", I'd rather see (and call) it a
>> (designated) replacement, where individual per-arch functions would
>> get called at appropriate times.
> 
> Over time, I do expect it to replace domain_relinquish_resources().  I'm
> not sure if that will take the form of a specific arch_domain_teardown()
> call (and reserving some space in teardown.val for arch use), or whether
> it will be a load of possibly-CONFIG'd stubs.

I'd consider helpful if you could slightly re-word the description then.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

