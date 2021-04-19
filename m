Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69D36407C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112834.215148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYS1u-0007kx-5a; Mon, 19 Apr 2021 11:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112834.215148; Mon, 19 Apr 2021 11:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYS1u-0007kY-2G; Mon, 19 Apr 2021 11:25:26 +0000
Received: by outflank-mailman (input) for mailman id 112834;
 Mon, 19 Apr 2021 11:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYS1t-0007kT-E9
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:25:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dad37287-4a49-4c8c-a024-569cd7487eba;
 Mon, 19 Apr 2021 11:25:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE60DABF6;
 Mon, 19 Apr 2021 11:25:23 +0000 (UTC)
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
X-Inumbo-ID: dad37287-4a49-4c8c-a024-569cd7487eba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618831523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5jL5WB1SrCrFB7x/v5N03v5tJ1qpdpNOObKsdvfKDY=;
	b=dqf4YctOQCa7xDaSG6rGx5NdgBd512RNmd/O993+XYSlr4U4RSfxtmMurHS7tHR6jNzU3W
	/x3t65Vpinc9u0ccNsnPHLtSgO96mk+2VWQKBG86lr0ck0mLq3n4CfcsZEbRe0wKuhKrXy
	zM1luZabvuyoBhWIAvJa7/xeqt5O3/E=
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHs2AJ6pqrAw7uew@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d698a29e-fb4e-a650-9e48-ad209e64c800@suse.com>
Date: Mon, 19 Apr 2021 13:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHs2AJ6pqrAw7uew@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.04.2021 21:24, Tim Deegan wrote:
> At 12:40 +0200 on 12 Apr (1618231248), Jan Beulich wrote:
>> The address of this page is used by the CPU only to recognize when to
>> access the virtual APIC page instead. No accesses would ever go to this
>> page. It only needs to be present in the (CPU) page tables so that
>> address translation will produce its address as result for respective
>> accesses.
>>
>> By making this page global, we also eliminate the need to refcount it,
>> or to assign it to any domain in the first place.
> 
> What is the aim here?  To save 4k per domain?  It seems to come out
> about even for adding and removing code. 

True, but still it looks wrong to me to use a page per guest when one
her host suffices. Think about many tiny, short-lived VMs (as in
Tamas'es VM forking).

>> --- a/xen/arch/x86/mm/shadow/set.c
>> +++ b/xen/arch/x86/mm/shadow/set.c
>> @@ -94,6 +94,22 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>>      ASSERT(!sh_l1e_is_magic(sl1e));
>>      ASSERT(shadow_mode_refcounts(d));
>>  
>> +    /*
>> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
>> +     * get accessed, and hence there's no need to refcount it (and refcounting
>> +     * would fail, due to the page having no owner).
>> +     */
>> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )
> 
> Would it be better to check specifically for mfn == apic_access_mfn
> (and apic_access_mfn != 0, I guess)?

Roger did ask about the same - I neither want to expose apic_access_mfn
outside its CU, nor do I want to introduce an accessor function. Both
feel like layering violations to me.

>  If we want this behaviour for
> for all un-owned PGC_extra MFNs it would be good to explain that in the
> comments.

This is hard to tell without knowing which (or even if) further such
PGC_extra pages will appear. Hence any comment to that effect would be
guesswork at best. Of course I can add e.g. "Other pages with the same
properties would be treated the same", if that's what you're after?

Jan

