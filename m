Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F62C40B2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37760.70249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khuMJ-0003tr-OA; Wed, 25 Nov 2020 12:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37760.70249; Wed, 25 Nov 2020 12:57:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khuMJ-0003tS-LB; Wed, 25 Nov 2020 12:57:19 +0000
Received: by outflank-mailman (input) for mailman id 37760;
 Wed, 25 Nov 2020 12:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khuMH-0003tN-Gf
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:57:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8167b2b9-92e1-4563-8697-7f51a70fad6b;
 Wed, 25 Nov 2020 12:57:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75156AC22;
 Wed, 25 Nov 2020 12:57:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khuMH-0003tN-Gf
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:57:17 +0000
X-Inumbo-ID: 8167b2b9-92e1-4563-8697-7f51a70fad6b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8167b2b9-92e1-4563-8697-7f51a70fad6b;
	Wed, 25 Nov 2020 12:57:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606309035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCm9hKYHAvVicsIzEYXUoyHakHZMRSC+kkIexzP2VEU=;
	b=S5wb+uKEMEOQsfCYyBx4XbSmHki5Gb1h5HS73J2J3VLyBPsRJPB8xPsVG1sVgpsxlcjowr
	761gYfEKX5w9Ek81GzjCD/WO4i+6BN70aW9Dd0Dupsm9qGf4GQAwb8Ch5tDoE8Q7ycBUWF
	rS2hwSXit1EIykHe8If7HFbW72E8zho=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 75156AC22;
	Wed, 25 Nov 2020 12:57:15 +0000 (UTC)
Subject: Re: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
 <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a752cdb9-4609-2a61-b657-c17cbe4febb8@suse.com>
Date: Wed, 25 Nov 2020 13:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 13:15, Julien Grall wrote:
> On 23/11/2020 14:23, Jan Beulich wrote:
>> All of the array allocations in grant_table_init() can exceed a page's
>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>> for after boot. We also don't need any of these allocations to be
>> physically contiguous.. Introduce interfaces dynamically switching
>> between xmalloc() et al and vmalloc() et al, based on requested size,
>> and use them instead.
>>
>> All the wrappers in the new header get cloned mostly verbatim from
>> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
>> for sizes and to unsigned int for alignments.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
>>      meant to be edited from the beginning.
>> ---
>> I'm unconvinced of the mentioning of "physically contiguous" in the
>> comment at the top of the new header: I don't think xmalloc() provides
>> such a guarantee. Any use assuming so would look (latently) broken to
>> me.
> 
> I haven't had the chance to reply to the first version about this. So I 
> will reply here to avoid confusion.
> 
> I can at least spot one user in Arm that would use xmalloc() that way 
> (see the allocation of itt_addr in arch/arm/gic-v3-its.c).

And I surely wouldn't have spotted this, even if I had tried
to find "offenders", i.e. as said before not wanting to alter
the behavior of existing code (beyond the explicit changes
done here) was ...

> AFAIK, the memory is for the sole purpose of the ITS and should not be 
> accessed by Xen. So I think we can replace by a new version of 
> alloc_domheap_pages().
> 
> However, I still question the usefulness of introducing yet another way 
> to allocate memory (we already have alloc_xenheap_pages(), xmalloc(), 
> alloc_domheap_pages(), vmap()) if you think users cannot rely on 
> xmalloc() to allocate memory physically contiguous.

... the reason to introduce a separate new interface. Plus of
course this parallels what Linux has.

> It definitely makes more difficult to figure out when to use xmalloc() 
> vs xvalloc().

I don't see the difficulty:
- if you need physically contiguous memory, use alloc_xen*_pages(),
- if you know the allocation size is always no more than a page,
  use xmalloc(),
- if you know the allocation size is always more than a page, use
  vmalloc(),
- otherwise use xvmalloc(). Exceptions may of course apply, i.e.
this is just a rule of thumb.

> I would like to hear an opinion from the other maintainers.

Let's hope at least one will voice theirs.

Jan

