Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2936FBFA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120549.227971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcTwY-00082C-EN; Fri, 30 Apr 2021 14:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120549.227971; Fri, 30 Apr 2021 14:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcTwY-00081n-BF; Fri, 30 Apr 2021 14:16:34 +0000
Received: by outflank-mailman (input) for mailman id 120549;
 Fri, 30 Apr 2021 14:16:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcTwW-00081i-Aa
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:16:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93a7280f-54a6-424b-a909-c40bd9515a44;
 Fri, 30 Apr 2021 14:16:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D416B2E6;
 Fri, 30 Apr 2021 14:16:29 +0000 (UTC)
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
X-Inumbo-ID: 93a7280f-54a6-424b-a909-c40bd9515a44
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619792190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnQVtQjBqJUlKQCYrowT+qW7Ri3Viohkvu4QRHqvtJc=;
	b=kyWcGUdEfpRI1F4rzgbEZl/BKGwW/aSbd1Yb1fQXTaF5NsnzReMKymFNDK7ANbfLIcaSuA
	RMs0afHjuZCTn+Ana4ipr1v9i513Xx3O+PL5EbySBbaNTlaDVgaFnmph39QSeHCFB7CHLq
	50FQhZunt/6BayE95GDnlQKkPm8tuWE=
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
 <YIvUJqtdsOLia8nc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <143b84c7-84dd-6b36-997e-a38718651723@suse.com>
Date: Fri, 30 Apr 2021 16:16:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIvUJqtdsOLia8nc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 11:55, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 04:12:41PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_64/compat/mm.c
>> +++ b/xen/arch/x86/x86_64/compat/mm.c
>> @@ -155,8 +155,10 @@ int compat_arch_memory_op(unsigned long
>>      case XENMEM_get_sharing_shared_pages:
>>          return mem_sharing_get_nr_shared_mfns();
>>  
>> +#ifdef CONFIG_MEM_PAGING
>>      case XENMEM_paging_op:
>>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
>> +#endif
>>  
>>  #ifdef CONFIG_MEM_SHARING
>>      case XENMEM_sharing_op:
>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -994,8 +994,10 @@ long subarch_memory_op(unsigned long cmd
>>      case XENMEM_get_sharing_shared_pages:
>>          return mem_sharing_get_nr_shared_mfns();
>>  
>> +#ifdef CONFIG_MEM_PAGING
>>      case XENMEM_paging_op:
>>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
>> +#endif
> 
> I would create a dummy handler when !CONFIG_MEM_PAGING in
> asm-x86/mem_paging.h.

I was simply following the neighboring mem-sharing approach,
which you've stripped here, but which is still visible in the
xen/arch/x86/x86_64/compat/mm.c change above. I think the two
are helpful to be similar in such aspects.

>> --- a/xen/include/asm-x86/p2m.h
>> +++ b/xen/include/asm-x86/p2m.h
>> @@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
>>  #define P2M_PAGEABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
>>                              | p2m_to_mask(p2m_ram_logdirty) )
>>  
>> +#ifdef CONFIG_MEM_PAGING
>>  #define P2M_PAGING_TYPES (p2m_to_mask(p2m_ram_paging_out)        \
>>                            | p2m_to_mask(p2m_ram_paged)           \
>>                            | p2m_to_mask(p2m_ram_paging_in))
>>  
>>  #define P2M_PAGED_TYPES (p2m_to_mask(p2m_ram_paged))
>> +#else
>> +#define P2M_PAGING_TYPES 0
>> +#define P2M_PAGED_TYPES 0
>> +#endif
> 
> Since you don't guard the p2m related paged types in p2m_type_t is it
> worth having diverging P2M_{PAGING/PAGED}_TYPES?
> 
> I guess it might be required in order to force the compiler to DCE
> without having to add yet more CONFIG_MEM_PAGING guards?

Indeed, this is the reason.

> I don't really have a strong opinion on whether the code should be
> removed, IMO it's best to start by making it off by default at build
> time and remove it in a later release?

Matches my way of thinking. I also wouldn't want to be the one to
delete code completely out of the blue.

Jan

