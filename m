Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iobLHSumO2pCawgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:40:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9596BD020
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Rl0Uato/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344712.1603751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcK6A-0002Bf-QH; Wed, 24 Jun 2026 09:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344712.1603751; Wed, 24 Jun 2026 09:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcK6A-000293-NS; Wed, 24 Jun 2026 09:40:46 +0000
Received: by outflank-mailman (input) for mailman id 1344712;
 Wed, 24 Jun 2026 09:40:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcK68-00028s-Qy
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:40:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcK68-00Eufn-7l
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:40:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3ba61b-2eae-0a2a0a5409dd-0a2a4501c236-2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:40:44 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3ba61b-e031-0a2a45010019-d1558034e1aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:40:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso5360405e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 02:40:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd1fa34sm499583865e9.5.2026.06.24.02.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 02:40:42 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294043; x=1782898843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zxh4mYqGYnCqMNftwEZN5X7lTuugzpIv4x2WO4W+C8M=;
        b=Rl0Uato//IH0bFqw4itivChfZ9X1bCpHBCLGh1ZGJNxZr4/HZ6VYJkTCAWWkVp0bt+
         gNmFpE+hqlJIJRQQ8rqctNP3K9o5QjvHDvLqd4P1wrAvVflATdVI29q9spHhPq1O3fxy
         4GiJMQvzQgBFQL7udJCNb8cMk/EYy5awLShKbA2DW9NlvUdkokQYXpgWgLq0rXUKMQzA
         RwfJ/Doy9hskDoJabK9H26tGaryfiZYlncMfrjvOIaVPheXe/1oi5SrqnOhJfDGE9iz/
         ai7zDnIqT0TxwhwlBihpoYYO4KIzhykCtfLw8wpVxNHsfqPuYSx4YLwYXFphCTzlpwGn
         RIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294043; x=1782898843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxh4mYqGYnCqMNftwEZN5X7lTuugzpIv4x2WO4W+C8M=;
        b=KdeMz2RzfkAM7CQ194OEctHo1c3+pvp32yAcP7EIcW7eNMnki1ebRtDBTG98PQhBSb
         pw4cXNE1WssFyWUWs/9cMKkt65Tu1StjIG2df16API+40cc9hOU47K0dXB0V04PKJJZR
         4tUmXG4sgjBtcIwupDh4eSA1pH5MwI16wBOd+nSlvmE2g7ry5/p9LdhP4+pVCu+4EKnG
         givB8+CGdd97HLIj+JDMFaGHLdmjPrMATzAU0d2sHrykgedRNEWmLCyZAG0RFjDEJ4lY
         Gv3hIKH49fh9SemyzHEWpjMoxxIXXNgQomDDLuMfpylaGIZxNJFzIjkO8+ZxgzdtdfdD
         3U/g==
X-Forwarded-Encrypted: i=1; AFNElJ+lxgX7tgPNCDjiwbKfC8RNPqEWd6Naus+AQsdRGjGZJ4zuGQtWPpHpJ8aJKRvdQdlLhV2CSir5CNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzR4zox11cke45HosVVcfCGAw/F7refbRAbmlHqP8jZ64Uld09T
	6Z2sP45A7wVkvZFfqTzi4TpfpugXsjC+aGbf2KmYh/6zTif3QOEUFikH
X-Gm-Gg: AfdE7cnYDkpDvQ5nQnULUko6bI+fzkUTXarawuRy0yY92YdLHPZYK9Q6Z2yl/L69mql
	xGDyQNEdoI2Kna9HcZEXawWJRRXvqEIJWRq1S0iHzkS0T5Ud/flUIR6W3GhRpEkV0cVgZWKK56p
	d04eZ3+/GZ8EHRccB/PWQit8Tqh+GCqPkVyEjpvU+GsM0I18K/pzFpxgx8UyB1Ynh3cl6+tgOou
	Tn2WuQqRu+JB+d1G2PBBc7F5L57hE/twUOnTy5ifbA6GSkkCf8lnAm3g9WuVk4wIQ+wko8X5K/I
	MSew19IdfC5h1YC4BvJC5RlPvFBwnUOZq3t9+a1HZ7ldSX8PTdrF2e02qJKhDselRz+mXtFAr75
	AvLgXMgCSpF7qI/vLR+3Q7dj7aH4BqBPVJE+aA8uH/k8tSoobGr7mvW7txQmxmirPsmfHGEKgvV
	Ye6l1WmSth8VlGolpTVB+BS30IrfAPy5aeXCq3m35Saj2UlL/c783gklCmMMv05n1P0vw=
X-Received: by 2002:a05:600c:3f07:b0:490:c024:2eba with SMTP id 5b1f17b1804b1-49260872b71mr34011265e9.22.1782294042971;
        Wed, 24 Jun 2026 02:40:42 -0700 (PDT)
Message-ID: <23ab5c24-fa7d-44ac-a7ce-199bd33ebb34@gmail.com>
Date: Wed, 24 Jun 2026 11:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] xen: arm: update p2m_set_allocation() prototype
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
 <073c5ff2-5244-4e11-a9e3-e5ecd3ce31d2@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <073c5ff2-5244-4e11-a9e3-e5ecd3ce31d2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782294043-CDFB2E30-F6E4742F/10/73395122804
X-purgate-type: spam
X-purgate-size: 9549
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9596BD020



On 6/24/26 9:32 AM, Orzel, Michal wrote:
> 
> 
> On 17-Jun-26 13:17, Oleksii Kurochko wrote:
>> p2m_set_allocation() signals preemption redundantly: via a bool *preempted
>> out-argument (set to true) and via -ERESTART return code, both at the same
>> time. This led to the caller-side ASSERT(preempted == (rc == -ERESTART))
>> added solely to document their agreement.
>>
>> Drop the out-argument entirely. The return code alone is sufficient to
>> distinguish preemption (-ERESTART) from success (0) or other failures.
>> Replace the pointer with a plain bool can_preempt that controls whether
>> the preemption check is performed at all, making the previous
>> NULL-to-suppress-preemption calling convention explicit and type-safe.
> As Andrew said, this paragraph contradicts the first one i.e. we still need to
> pass whether to perform the check or not, so it's not redundant.

I suggested a rewording of the commit message in reply to Andrew's 
comment. Could you please review my response?

> 
>>
>> Since p2m_set_allocation() is called by the common dom0less build code,
>> move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - Nothing changed. Only rebase.
>> ---
>> Changes in v2:
>>   - new patch
>> ---
>> ---
>>   xen/arch/arm/include/asm/p2m.h          |  1 -
>>   xen/arch/arm/mmu/p2m.c                  | 22 ++++++++--------------
>>   xen/arch/riscv/include/asm/paging.h     |  2 +-
>>   xen/arch/riscv/p2m.c                    |  7 ++++---
>>   xen/arch/riscv/paging.c                 |  7 ++-----
>>   xen/common/device-tree/dom0less-build.c |  2 +-
>>   xen/include/xen/p2m-common.h            |  2 ++
>>   7 files changed, 18 insertions(+), 25 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>> index 4a4913716bdd..737da60dcf58 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -238,7 +238,6 @@ void p2m_restore_state(struct vcpu *n);
>>   /* Print debugging/statistial info about a domain's p2m */
>>   void p2m_dump_info(struct domain *d);
>>   
>> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
>>   int p2m_teardown_allocation(struct domain *d);
>>   
>>   static inline void p2m_write_lock(struct p2m_domain *p2m)
>> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
>> index 51abf3504fcf..e5c6be7c0890 100644
>> --- a/xen/arch/arm/mmu/p2m.c
>> +++ b/xen/arch/arm/mmu/p2m.c
>> @@ -67,10 +67,11 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>>   
>>   /*
>>    * Set the pool of pages to the required number of pages.
>> - * Returns 0 for success, non-zero for failure.
>> + * Returns 0 for success, -ERESTART if preempted, or a negative error code on
> It returns -ERESTART if preempted *AND* preemption is allowed - please clarify
> in the description.
> 

Agree, it should be updated. I'll apply your suggestion in the next 
patch version.

>> + * failure.
>>    * Call with d->arch.paging.lock held.
>>    */
>> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
>>   {
>>       struct page_info *pg;
>>   
>> @@ -112,11 +113,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>               break;
>>   
>>           /* Check to see if we need to yield and try again */
>> -        if ( preempted && general_preempt_check() )
>> -        {
>> -            *preempted = true;
>> +        if ( can_preempt && general_preempt_check() )
>>               return -ERESTART;
>> -        }
>>       }
>>   
>>       return 0;
>> @@ -125,7 +123,6 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>   int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>>   {
>>       unsigned long pages = size >> PAGE_SHIFT;
>> -    bool preempted = false;
>>       int rc;
>>   
>>       if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
>> @@ -133,27 +130,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>>           return -EINVAL;
>>   
>>       spin_lock(&d->arch.paging.lock);
>> -    rc = p2m_set_allocation(d, pages, &preempted);
>> +    rc = p2m_set_allocation(d, pages, true);
>>       spin_unlock(&d->arch.paging.lock);
>>   
>> -    ASSERT(preempted == (rc == -ERESTART));
>> -
>>       return rc;
>>   }
>>   
>>   int p2m_teardown_allocation(struct domain *d)
>>   {
>>       int ret = 0;
>> -    bool preempted = false;
>>   
>>       spin_lock(&d->arch.paging.lock);
>>       if ( d->arch.paging.p2m_total_pages != 0 )
>>       {
>> -        ret = p2m_set_allocation(d, 0, &preempted);
>> -        if ( preempted )
>> +        ret = p2m_set_allocation(d, 0, true);
>> +        if ( ret == -ERESTART )
>>           {
>>               spin_unlock(&d->arch.paging.lock);
>> -            return -ERESTART;
>> +            return ret;
>>           }
>>           ASSERT(d->arch.paging.p2m_total_pages == 0);
>>       }
>> diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
>> index e487c89a4ccd..103384723dc5 100644
>> --- a/xen/arch/riscv/include/asm/paging.h
>> +++ b/xen/arch/riscv/include/asm/paging.h
>> @@ -9,7 +9,7 @@ struct page_info;
>>   int paging_domain_init(struct domain *d);
>>   
>>   int paging_freelist_adjust(struct domain *d, unsigned long pages,
>> -                           bool *preempted);
>> +                           bool can_preempt);
>>   
>>   int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
>>   int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index 703b9f4d2540..41d6d3d5e699 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -430,15 +430,16 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
>>   
>>   /*
>>    * Set the pool of pages to the required number of pages.
>> - * Returns 0 for success, non-zero for failure.
>> + * Returns 0 for success, -ERESTART if preempted, or a negative error code on
>> + * failure.
>>    * Call with d->arch.paging.lock held.
>>    */
> Move the description where a prototype lives. This way you will avoid adding one
> at each definition (remove from here and Arm then).

Makes sense. Also, it will address the issue that, based on your comment 
above, the comment should be updated here and before the prototype.

> 
>> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
>>   {
>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>       int rc;
>>   
>> -    if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
>> +    if ( (rc = paging_freelist_adjust(d, pages, can_preempt)) )
>>           return rc;
>>   
>>       /*
>> diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
>> index 76a203edbb0c..35f572689a7c 100644
>> --- a/xen/arch/riscv/paging.c
>> +++ b/xen/arch/riscv/paging.c
>> @@ -47,7 +47,7 @@ static int _paging_add_to_freelist(struct domain *d)
>>   }
>>   
>>   int paging_freelist_adjust(struct domain *d, unsigned long pages,
>> -                           bool *preempted)
>> +                           bool can_preempt)
>>   {
>>       ASSERT(spin_is_locked(&d->arch.paging.lock));
>>   
>> @@ -66,11 +66,8 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>>               return rc;
>>   
>>           /* Check to see if we need to yield and try again */
>> -        if ( preempted && general_preempt_check() )
>> -        {
>> -            *preempted = true;
>> +        if ( can_preempt && general_preempt_check() )
>>               return -ERESTART;
>> -        }
>>       }
>>   
>>       return 0;
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index eacfd93087ae..c3818ffed45f 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>>                   domain_p2m_pages(mem, d->max_vcpus);
>>   
>>       spin_lock(&d->arch.paging.lock);
>> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
>> +    rc = p2m_set_allocation(d, p2m_pages, false);
>>       spin_unlock(&d->arch.paging.lock);
>>   
>>       return rc;
>> diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
>> index f0bd9a6b9896..1b44ec8ce36c 100644
>> --- a/xen/include/xen/p2m-common.h
>> +++ b/xen/include/xen/p2m-common.h
>> @@ -43,5 +43,7 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
>>                                            bool readonly, p2m_type_t *p2mt_p,
>>                                            struct page_info **page_p);
>>   
>> +int p2m_set_allocation(struct domain *d, unsigned long pages,
> I think it's worth adding __must_check given that rc is now the only preemption
> status checker.

I will add __must_check.

Thanks.

~ Oleksii

