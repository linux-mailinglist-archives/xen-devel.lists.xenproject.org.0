Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E6308A64
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78313.142428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Wm3-00012t-Dz; Fri, 29 Jan 2021 16:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78313.142428; Fri, 29 Jan 2021 16:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Wm3-00012U-Ai; Fri, 29 Jan 2021 16:37:31 +0000
Received: by outflank-mailman (input) for mailman id 78313;
 Fri, 29 Jan 2021 16:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Wm1-00012P-QU
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:37:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c6e23fb-a793-4d92-a99f-0cc894facf8d;
 Fri, 29 Jan 2021 16:37:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29558AECE;
 Fri, 29 Jan 2021 16:37:28 +0000 (UTC)
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
X-Inumbo-ID: 1c6e23fb-a793-4d92-a99f-0cc894facf8d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611938248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3CP644klWC+es9IOzPIKIXWACzvqS7V5u7MMMLnEOk=;
	b=RDr81gyKSjBqv42AUgp21ytnzFiLPAW5HBQooAqRRMWSXsTPHHtx3AnpJ/JqXxDDqASsBL
	cbyWzI15z5TzomLkZovvg0jPh6kSaZQB8H/cW/5rxGbKJDUMpcN8WtmRtGbh6EDImSvnWn
	0WWsnxQGJ/qi55q7jApLR+/YUlgrhZw=
Subject: Re: [PATCH v7 02/10] xen/domain: Add vmtrace_frames domain creation
 parameter
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-3-andrew.cooper3@citrix.com>
 <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
Message-ID: <fd93bd3f-66ad-a400-a5ba-df1376d52b3d@suse.com>
Date: Fri, 29 Jan 2021 17:37:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 16:08, Jan Beulich wrote:
> On 21.01.2021 22:27, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -132,6 +132,48 @@ static void vcpu_info_reset(struct vcpu *v)
>>      v->vcpu_info_mfn = INVALID_MFN;
>>  }
>>  
>> +static void vmtrace_free_buffer(struct vcpu *v)
>> +{
>> +    const struct domain *d = v->domain;
>> +    struct page_info *pg = v->vmtrace.buf;
>> +    unsigned int i;
>> +
>> +    if ( !pg )
>> +        return;
>> +
>> +    for ( i = 0; i < d->vmtrace_frames; i++ )
>> +    {
>> +        put_page_alloc_ref(&pg[i]);
>> +        put_page_and_type(&pg[i]);
>> +    }
>> +
>> +    v->vmtrace.buf = NULL;
> 
> To set a good precedent, maybe this wants moving up ahead of
> the loop and ...
> 
>> +}
>> +
>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    if ( !d->vmtrace_frames )
>> +        return 0;
>> +
>> +    pg = alloc_domheap_pages(d, get_order_from_pages(d->vmtrace_frames),
>> +                             MEMF_no_refcount);
>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    v->vmtrace.buf = pg;
> 
> ... this wants moving down past the loop, to avoid
> globally announcing something that isn't fully initialized
> yet / anymore?

So having replied on the other thread I looked back here: The
suggested change actually is not just to set a good precedent.
By recording the page(s) in v->vmtrace_buf, ...

>> +    for ( i = 0; i < d->vmtrace_frames; i++ )
>> +        /* Domain can't know about this page yet - something fishy going on. */
>> +        if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )
>> +            BUG();

... failure here (if handled better than by BUG()) will lead
vmtrace_free_buffer() to believe it needs to put references
(besides freeing the page(s), which is fine). So your claimed
bug really is just here, not everywhere else, and there is no
reason to go backwards in terms of error handling "quality",
as per the bottom of ./CODING_STYLE.

Jan

