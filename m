Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK/5MSaA12kLPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:32:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98F3C92D2
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276957.1562263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmfL-0001xe-64; Thu, 09 Apr 2026 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276957.1562263; Thu, 09 Apr 2026 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmfL-0001vW-3U; Thu, 09 Apr 2026 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1276957;
 Thu, 09 Apr 2026 10:31:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAmfJ-0001vQ-V0
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:31:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAmfF-008nNS-VZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:31:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d77fe8-2eae-0a2a0a5409dd-0a2a450be74e-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:31:11 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d77fef-bca8-0a2a450b0019-d1558033b594-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:31:11 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b150559bso5652205e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:31:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd19ea83sm99855615e9.1.2026.04.09.03.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 03:31:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775730671; x=1776335471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0B0hVhkoZ9SWr6kKvUmCz63+jV3t69Lxeyta4aoUIqU=;
        b=kKwAawPCf4lcKcH5eHApj1UWFCyZoQWvFtXeAomJJHmupcYfQrritlLzoEK0Y4f0Ls
         +ysRuG8UMB15RmMO8Kyv25uMDEvWj2I/snk+jq70gZrwgdT9aXG1xHOuPYnA4RaaMN70
         h0s67qmcfBAEtvIKX6tuqYe+/pu3OL0forbfQxG4p6IVw7mtoNv8Ebdfe4kgikRZiik7
         W25eaj/fPIC9Plbjb/d0WwgrYNcs21SPgUd0xMGDY5MCk0zlbaJNoRjiTUoIIbdKEpfL
         BnH38015EiZGgHI5nXcokrpyRJZtLLV5tQYGp3rzG3lggDSSChke+x/Z/0P4Nyxiq465
         I9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775730671; x=1776335471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B0hVhkoZ9SWr6kKvUmCz63+jV3t69Lxeyta4aoUIqU=;
        b=QBfiAzNwSgZiC04CQBmTquUC7xvG18FeGTTgN79Zq9S7hgcXfPg0ksn3TsALsJYBAN
         YQqjNEUhvhM0q8p3BmLJKi21bsrUZ+mtCeibUDuz5zlY/o/1gmHtV5FWUJjUh+aT41c9
         qGTC7frp2wkm627F7AWWenrjkwnk/dxU9NuJ+43czRGswkBa66N09Mzfpc/c+69mje9r
         PUyBYm8lvkMkZdVuhku4QYlfSQiSQdgscRsPhY+kEHYjcMCZto3yFmsFcB+ThFKyMkuO
         h+7l0a5r6kK5zee8+cOaj4xDyxdiINz3Fdv8jATdXng6RsF/fU+mVeluxCMMspXY+erL
         e9AA==
X-Forwarded-Encrypted: i=1; AJvYcCVciGzF4UnDHCtHI068DwP696vsKozSPEvNwKJsHyv9uXqD/JW8g8TyfYOcPAC5l2uvMZinLcOcNEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4l/zn5CQOLKQRKA0/VU124TsBGYHav7Bhg62nHuEVF5rwd66o
	5kLYNW5Tau6Ij94OxCmUOZQa4mAeoO9+u3qNUjza1WziEbMannbR+zhG
X-Gm-Gg: AeBDies1+CNPpuGJtBnFGeGOiWoMn+soCuygbpzPBwUEZVlFJ4nELI4909IqJpNahE9
	+JgQnzo2DLVS6EeMP8EICun+sh2tjWcgqpS0fJ+TzQQqILvq6L1nsEmV+dgKfCn154XHIobQlhY
	SrU0M1shWJ3jVV3fS9CeasuyIcs+RrWPPfZ0uMf6IW9HgRCL3PuSJxsENlRHeSBDhi++Th0p/CI
	FZJ9RxNo4fXJ3sK/wjgZoe+FGeBD8zjGsW400N3sepTYty87xs5p05LownDty6/f9wuuhsVUNAV
	VsfFNCCcey+WzRsC5CCcVjnDCVGqvvUZ7i0dvQXJheeLy6ZZGtyEMq3WNNsfr/o8ZOExpwFglmX
	N+JkXr6ymp1XjcxG5Su4MhMcJagDJ9Wnr03n9B5MEjJFEyU8dAE/nUGIfZsUuCUKj1OkzNNojeP
	pS7wwPBK96KCXEpm5dFB8mGQixmJWYPo5hi2moNZOBnPJyorHwgrLWkKlpwEjZGelfQ5KhQ5nrC
	rfdW1BnVbxijw==
X-Received: by 2002:a05:600c:5292:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-488996cd77cmr364338815e9.4.1775730670672;
        Thu, 09 Apr 2026 03:31:10 -0700 (PDT)
Message-ID: <3b3325ea-b811-4ab2-b1ba-9808a5a4b7c5@gmail.com>
Date: Thu, 9 Apr 2026 12:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/27] xen/riscv: Implement ARCH_PAGING_MEMPOOL
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <887d914aa0ddb1884c19c9567d4633ecaf810066.1773157782.git.oleksii.kurochko@gmail.com>
 <7340581a-51a3-43b2-b180-c2de37bda4b1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7340581a-51a3-43b2-b180-c2de37bda4b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775730671-F4DC92A1-7322B07A/10/73395122804
X-purgate-type: spam
X-purgate-size: 4103
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C98F3C92D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/26 9:18 AM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> The p2m_freelist is used to allocate pages for the P2M, but to initialize
>> this list, domain_p2m_set_allocation() might be called.
>> This function is invoked in construct_domU() within the common Dom0less
>> code, and providing an implementation of domain_p2m_set_allocation() when
>> CONFIG_ARCH_PAGING_MEMPOOL=y is appropriate for RISC-V.
> 
> With this wording it is odd to see ...
> 
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -1,5 +1,6 @@
>>   config RISCV
>>   	def_bool y
>> +	select ARCH_PAGING_MEMPOOL
> 
> ... this. You really want to settle on whether it is selected unconditionally
> or not. Also for the code below, where ...
> 
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -10,7 +10,7 @@ obj-y += irq.o
>>   obj-y += kernel.o
>>   obj-y += mm.o
>>   obj-y += p2m.o
>> -obj-y += paging.o
>> +obj-$(CONFIG_ARCH_PAGING_MEMPOOL) += paging.o
>>   obj-y += pt.o
>>   obj-$(CONFIG_RISCV_64) += riscv64/
>>   obj-y += sbi.o
> 
> ... this change and any #ifdef-ary further down aren't needed unless the
> select became conditional. (Plus with the change above things likely wouldn't
> even build if ARCH_PAGING_MEMPOOL could be off under certain conditions.)

I missed if ARCH_PAGING_MEMPOOL=n then p2m.c, at least, will fail to 
compile so much more things would be needed to be #ifdef-ed.

Just for simplicity then I will set CONFIG_ARCH_PAGING_MEMPOOL=y 
unconditionally and drop all the #ifdef-s related to this config I've 
added in this patch.

> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1568,3 +1568,34 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>>   
>>       return page;
>>   }
>> +
>> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
>> +
>> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>> +{
>> +    unsigned long pages = PFN_DOWN(size);
>> +    bool preempted = false;
>> +    int rc;
>> +
>> +    if ( (size & ~PAGE_MASK) || /* Non page-sized request? */
>> +         pages != PFN_DOWN(size) ) /* 32-bit overflow? */
>> +        return -EINVAL;
> 
> Can't this be had with just
> 
>      if ( ((paddr_t)pages << PAGE_SHIFT) != size )
>          return -EINVAL;
> 
> (and perhaps utilizing pfn_to_paddr(), even if it's not a PFN we're dealing
> with here)?

It makes sense, I will apply that for RISC-V.

Then for Arm and x86 could be done the same, I can send a separate patch 
for them.

> 
>> +    spin_lock(&d->arch.paging.lock);
>> +    rc = p2m_set_allocation(d, pages, &preempted);
>> +    spin_unlock(&d->arch.paging.lock);
>> +
>> +    ASSERT(preempted == (rc == -ERESTART));
> 
> This actually suggests that (once again) Arm code perhaps shouldn't have been
> copied verbatim: There shouldn't be a need for the "preempted" state to be
> returned back in two distinct ways.

Agree.

The preempted argument of p2m_set_allocation() could be switched to a 
plain 'bool could_preempt', preemption would then be signaled solely via 
return -ERESTART, and the caller would just check rc, so no local bool 
preempted in this function and no ASSERT.

I'm also thinking that the preempted argument could be dropped entirely, 
as it seems to exist only to conditionally enable the 
general_preempt_check() call inside the function. It is skipped only 
during domain_p2m_set_allocation(), which won't be a significant penalty 
if general_preempt_check() is called every time. All other callers pass 
a non-NULL preempted, so general_preempt_check() would always be 
executed regardless.

> 
>> +    return rc;
>> +}
>> +
>> +/* Return the size of the pool, in bytes. */
>> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>> +{
>> +    *size = (uint64_t)ACCESS_ONCE(d->arch.paging.total_pages) << PAGE_SHIFT;
> 
> As per above, maybe use pfn_to_paddr()?

Yes, it could be used to be in sync with a code above.

Thanks.

~ Oleksii


