Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D711D321BF2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 16:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88186.165710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDYA-0002pb-IC; Mon, 22 Feb 2021 15:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88186.165710; Mon, 22 Feb 2021 15:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDYA-0002pC-Et; Mon, 22 Feb 2021 15:55:06 +0000
Received: by outflank-mailman (input) for mailman id 88186;
 Mon, 22 Feb 2021 15:55:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEDY9-0002p7-Oq
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 15:55:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d14eee94-2277-422d-8177-66635144beb6;
 Mon, 22 Feb 2021 15:55:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB3AAAE14;
 Mon, 22 Feb 2021 15:55:03 +0000 (UTC)
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
X-Inumbo-ID: d14eee94-2277-422d-8177-66635144beb6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614009304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyhG2GllmGX07OFwwz/Psem5L1OWxxuGL2g1ZmtXgSo=;
	b=Fn3q8x3iph/inl9I/wFBv1r+oIukguo8N/SiRh4yC3gbLzDLXdNjNBv36wwbgsRZH1OcVo
	VP/k/f8v9A+eojnRMak+J16p+tgK8k2mv49izWaJtKJVxvgzAzkwvDKRbd1iHBzYSTpuW0
	XN8BGM0MqPXFcEDviv3bSzoehnSxNVk=
Subject: Re: [PATCH v2 5/8] x86/gdbsx: convert "user" to "guest" accesses
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <d1a1b9eb-33b4-4d07-9465-189699f88323@suse.com>
 <YDPOOpC6/wGZaAkA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa96faaf-478a-bfb0-1def-e79efb399668@suse.com>
Date: Mon, 22 Feb 2021 16:55:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDPOOpC6/wGZaAkA@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 16:31, Roger Pau Monné wrote:
> On Wed, Feb 17, 2021 at 09:21:36AM +0100, Jan Beulich wrote:
>> Using copy_{from,to}_user(), this code was assuming to be called only by
>> PV guests. Use copy_{from,to}_guest() instead, transforming the incoming
>> structure field into a guest handle (the field should really have been
>> one in the first place). Also do not transform the debuggee address into
>> a pointer.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> One minor comment below that can be taken care of when committing I
> think.
> 
>> ---
>> v2: Re-base (bug fix side effect was taken care of already).
>>
>> --- a/xen/arch/x86/debug.c
>> +++ b/xen/arch/x86/debug.c
>> @@ -108,12 +108,11 @@ dbg_pv_va2mfn(dbgva_t vaddr, struct doma
>>  }
>>  
>>  /* Returns: number of bytes remaining to be copied */
>> -static unsigned int dbg_rw_guest_mem(struct domain *dp, void * __user gaddr,
>> -                                     void * __user buf, unsigned int len,
>> -                                     bool toaddr, uint64_t pgd3)
>> +static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
>> +                                     XEN_GUEST_HANDLE_PARAM(void) buf,
>> +                                     unsigned int len, bool toaddr,
>> +                                     uint64_t pgd3)
>>  {
>> -    unsigned long addr = (unsigned long)gaddr;
>> -
>>      while ( len > 0 )
>>      {
>>          char *va;
>> @@ -134,20 +133,18 @@ static unsigned int dbg_rw_guest_mem(str
>>  
>>          if ( toaddr )
>>          {
>> -            copy_from_user(va, buf, pagecnt);    /* va = buf */
>> +            copy_from_guest(va, buf, pagecnt);
>>              paging_mark_dirty(dp, mfn);
>>          }
>>          else
>> -        {
>> -            copy_to_user(buf, va, pagecnt);    /* buf = va */
>> -        }
>> +            copy_to_guest(buf, va, pagecnt);
>>  
>>          unmap_domain_page(va);
>>          if ( !gfn_eq(gfn, INVALID_GFN) )
>>              put_gfn(dp, gfn_x(gfn));
>>  
>>          addr += pagecnt;
>> -        buf += pagecnt;
>> +        guest_handle_add_offset(buf, pagecnt);
>>          len -= pagecnt;
>>      }
>>  
>> @@ -161,7 +158,7 @@ static unsigned int dbg_rw_guest_mem(str
>>   * pgd3: value of init_mm.pgd[3] in guest. see above.
>>   * Returns: number of bytes remaining to be copied.
>>   */
>> -unsigned int dbg_rw_mem(void * __user addr, void * __user buf,
>> +unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
>>                          unsigned int len, domid_t domid, bool toaddr,
>>                          uint64_t pgd3)
> 
> You change the prototype below to make pgd3 unsigned long, so you
> should change the type here also? (and likely in dbg_rw_guest_mem?)

I'd rather undo the change to the prototype, or else further
changes would be needed for consistency. I'll take it that
you're fine either way, and hence your ack stands.

Thanks for noticing, Jan

