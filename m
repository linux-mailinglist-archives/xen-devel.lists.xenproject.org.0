Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4F294B59
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9995.26348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBW8-0006ms-GW; Wed, 21 Oct 2020 10:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9995.26348; Wed, 21 Oct 2020 10:38:52 +0000
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
	id 1kVBW8-0006mT-Cr; Wed, 21 Oct 2020 10:38:52 +0000
Received: by outflank-mailman (input) for mailman id 9995;
 Wed, 21 Oct 2020 10:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVBW6-0006mO-9T
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:38:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7628a35e-a96c-4fc0-ac80-7b6528cfb389;
 Wed, 21 Oct 2020 10:38:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 935A3B2D9;
 Wed, 21 Oct 2020 10:38:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVBW6-0006mO-9T
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:38:50 +0000
X-Inumbo-ID: 7628a35e-a96c-4fc0-ac80-7b6528cfb389
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7628a35e-a96c-4fc0-ac80-7b6528cfb389;
	Wed, 21 Oct 2020 10:38:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603276728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgubHRqIfP0cibpTbKfPdLKpJXoVZgrOsEZpWcsiIO8=;
	b=R7jsosuKkk62/+XRaS84e0U/6Pc4tIDvC6SgwCJgQ78aFgW6eC6ZeuakNqFv0StgoWILwx
	E8PItOIN247TBrx+fyJBhypYupwxIuaXiFkXmiJ5WvOg9hUZ6NhqyPoJs19K9Eai7iFstM
	IpKZDBcceQc9kiIvEvc8EoHM5RlEr90=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 935A3B2D9;
	Wed, 21 Oct 2020 10:38:48 +0000 (UTC)
Subject: Re: [PATCH] x86: XENMAPSPACE_gmfn{,_batch,_range} want to special
 case idx == gpfn
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
 <20201021093958.e4kopykalddam7pk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a979d21d-efed-9493-efd1-2643bddbbdd9@suse.com>
Date: Wed, 21 Oct 2020 12:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021093958.e4kopykalddam7pk@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 11:39, Roger Pau Monné wrote:
> On Fri, Oct 16, 2020 at 08:44:10AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4555,7 +4555,7 @@ int xenmem_add_to_physmap_one(
>>          if ( is_special_page(mfn_to_page(prev_mfn)) )
>>              /* Special pages are simply unhooked from this phys slot. */
>>              rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
>> -        else
>> +        else if ( !mfn_eq(mfn, prev_mfn) )
>>              /* Normal domain memory is freed, to avoid leaking memory. */
>>              rc = guest_remove_page(d, gfn_x(gpfn));
> 
> What about the access differing between the old and the new entries,
> while pointing to the same mfn, would Xen install the new entry
> successfully?

Yes - guest_physmap_add_page() doesn't get bypassed.

> Seems easier to me to use guest_physmap_remove_page in that case to
> remove the entry from the p2m without freeing the page.

Why do any removal when none is really needed? I also don't see
this fit the "special pages" clause and comment very well. I'd
question the other way around whether guest_physmap_remove_page()
needs calling at all (the instance above; the other one of course
is needed).

Jan

