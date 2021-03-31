Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D752A3501B5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103943.198277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbH2-0007ER-J3; Wed, 31 Mar 2021 13:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103943.198277; Wed, 31 Mar 2021 13:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbH2-0007Dz-G4; Wed, 31 Mar 2021 13:52:44 +0000
Received: by outflank-mailman (input) for mailman id 103943;
 Wed, 31 Mar 2021 13:52:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRbH1-0007Dq-9A
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:52:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24f7b25-4a52-4318-a3fc-ea577d4bd3cf;
 Wed, 31 Mar 2021 13:52:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 662F2B288;
 Wed, 31 Mar 2021 13:52:41 +0000 (UTC)
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
X-Inumbo-ID: d24f7b25-4a52-4318-a3fc-ea577d4bd3cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617198761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKknCWV6+9pJC7xqpVlz2vjQm1QbRp0EQF62y/4fyuw=;
	b=JJMUgnCENn62x+WwJQ57GVFhsFzqtthfcoo3BqPj8emLHIzwLHzs0I1u+V0SIWy3BtTgH3
	0+uG05wuudRUClA5x2knRiqFU7z9gaE/wunXLqxlS3KPTJg9R/IhdQjjWsirTpmH0+TCX6
	jOqhbms24jzBkPk2swGenWbZRkw8/OE=
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <YGR9+is03vAZgtd0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4679a1fb-2935-1cda-acb6-429e783248d4@suse.com>
Date: Wed, 31 Mar 2021 15:52:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGR9+is03vAZgtd0@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 15:49, Roger Pau Monné wrote:
> On Wed, Mar 31, 2021 at 02:31:25PM +0100, Andrew Cooper wrote:
>> @@ -1645,8 +1642,8 @@ void vlapic_destroy(struct vcpu *v)
>>      tasklet_kill(&vlapic->init_sipi.tasklet);
>>      TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
>>      destroy_periodic_time(&vlapic->pt);
>> -    unmap_domain_page_global(vlapic->regs);
>> -    free_domheap_page(vlapic->regs_page);
>> +    UNMAP_DOMAIN_PAGE_GLOBAL(vlapic->regs);
> 
> I think you need to check whether vlapic->regs_page is NULL here...
> 
>> +    FREE_DOMHEAP_PAGE(vlapic->regs_page);
>>  }
>>  
>>  /*
>> diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
>> index a182d33b67..0cb7f2aad3 100644
>> --- a/xen/include/xen/domain_page.h
>> +++ b/xen/include/xen/domain_page.h
>> @@ -77,4 +77,9 @@ static inline void unmap_domain_page_global(const void *va) {};
>>      (p) = NULL;                     \
>>  } while ( false )
>>  
>> +#define UNMAP_DOMAIN_PAGE_GLOBAL(p) do {   \
>> +    unmap_domain_page_global(p);           \
>> +    (p) = NULL;                            \
>> +} while ( false )
>> +
>>  #endif /* __XEN_DOMAIN_PAGE_H__ */
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 667f9dac83..c274e2eac4 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>>  } while ( false )
>>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>>  
>> +#define FREE_DOMHEAP_PAGES(p, o) do { \
>> +    free_domheap_pages(p, o);         \
> 
> ...as both unmap_domain_page_global and free_domheap_pages don't
> support being passed a NULL pointer.

Except that such checking would better go into the new macros,
alongside their clearing the pointers afterwards.

Jan

