Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C23694FE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116445.222258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZx0j-0006Lw-A3; Fri, 23 Apr 2021 14:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116445.222258; Fri, 23 Apr 2021 14:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZx0j-0006LX-6w; Fri, 23 Apr 2021 14:42:25 +0000
Received: by outflank-mailman (input) for mailman id 116445;
 Fri, 23 Apr 2021 14:42:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZx0h-0006LS-V9
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:42:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eb3a09c-0c13-4a51-a648-611fa15bfae2;
 Fri, 23 Apr 2021 14:42:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD0B1B143;
 Fri, 23 Apr 2021 14:42:21 +0000 (UTC)
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
X-Inumbo-ID: 0eb3a09c-0c13-4a51-a648-611fa15bfae2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619188941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMkx4lFZZ6aF7tICokjAPDA4xL8hlffKKBVgEcA/d5A=;
	b=BnLNp2mM4R40cYiaN22btOp+HfLeJfyfuSyfkHHhAnf9uEMo+8UhrmBwN+oL0kRQLuht34
	BpV+ZQpn1D84Skq53hM0/Mq4+62BBTtYFoiEYD6eNSIoRguSQECtn6Ucb9NOXfDhgMhAC9
	GdBGWpKg6WDODOZOgL0taVbu5c7I8rI=
Subject: Re: [PATCH v4 1/3] VMX: use a single, global APIC access page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
 <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
 <YILXDfXfR69mwfHH@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4c91967-2934-5b55-4228-e8028a5c4290@suse.com>
Date: Fri, 23 Apr 2021 16:42:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YILXDfXfR69mwfHH@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 16:17, Roger Pau Monné wrote:
> On Fri, Apr 23, 2021 at 12:52:57PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/shadow/set.c
>> +++ b/xen/arch/x86/mm/shadow/set.c
>> @@ -94,6 +94,15 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>>      ASSERT(!sh_l1e_is_magic(sl1e));
>>      ASSERT(shadow_mode_refcounts(d));
>>  
>> +    /*
>> +     * Check whether refcounting is suppressed on this page. For example,
>> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
>> +     * get accessed, and hence there's no need to refcount it.
>> +     */
>> +    mfn = shadow_l1e_get_mfn(sl1e);
>> +    if ( mfn_valid(mfn) && page_refcounting_suppressed(mfn_to_page(mfn)) )
>> +        return 0;
>> +
>>      res = get_page_from_l1e(sl1e, d, d);
>>  
>>      /*
>> --- a/xen/arch/x86/mm/shadow/types.h
>> +++ b/xen/arch/x86/mm/shadow/types.h
>> @@ -276,9 +276,16 @@ int shadow_set_l4e(struct domain *d, sha
>>  static void inline
>>  shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
>>  {
>> +    mfn_t mfn;
>> +
>>      if ( !shadow_mode_refcounts(d) )
>>          return;
>>  
>> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
> 
> Nit: I would prefer if assigned mfn outside of the condition, like
> it's done in the chunk added to shadow_get_page_from_l1e.

Well, I did it differently here because the variable really is
only needed inside the if(), whereas in "get" the subsequent
patches use it elsewhere as well. I'll wait what Tim says.

> The rest LGTM, so:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

