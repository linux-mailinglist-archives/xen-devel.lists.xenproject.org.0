Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8086CD54
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687231.1070349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiaz-0000z8-H1; Thu, 29 Feb 2024 15:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687231.1070349; Thu, 29 Feb 2024 15:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiaz-0000wa-EL; Thu, 29 Feb 2024 15:45:17 +0000
Received: by outflank-mailman (input) for mailman id 687231;
 Thu, 29 Feb 2024 15:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfiay-0000wS-9t
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:45:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87bdf8c1-d719-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:45:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E03C1F7E9;
 Thu, 29 Feb 2024 15:45:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7A8613503;
 Thu, 29 Feb 2024 15:45:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Tx85M4mm4GX+MwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 15:45:13 +0000
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
X-Inumbo-ID: 87bdf8c1-d719-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709221514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8SfY5jVnFw4kZflsv6bRIFUWCtymoR6L22v1i1XNxM=;
	b=hmZjsJa2y8K2UkiwOz92Zu7CVi9X7WL89xGgl+jg3c0s+0b2xXzDa8uOCB2Y5tFywnME6/
	3e9NDIsppA7G4XYQNrh5lUESO1bzuM/TQdd5yoaEvy+PCogiyOJsS6sDF+lIYct1GsvlVQ
	USPxgHoEAHS4XN/pZGcPzqKiF5v84Og=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709221514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8SfY5jVnFw4kZflsv6bRIFUWCtymoR6L22v1i1XNxM=;
	b=hmZjsJa2y8K2UkiwOz92Zu7CVi9X7WL89xGgl+jg3c0s+0b2xXzDa8uOCB2Y5tFywnME6/
	3e9NDIsppA7G4XYQNrh5lUESO1bzuM/TQdd5yoaEvy+PCogiyOJsS6sDF+lIYct1GsvlVQ
	USPxgHoEAHS4XN/pZGcPzqKiF5v84Og=
Message-ID: <d8f15460-8d58-4096-9e4f-b6ac307863db@suse.com>
Date: Thu, 29 Feb 2024 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-11-jgross@suse.com>
 <a037facf-c4d9-491f-b39f-56ed4221abf1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a037facf-c4d9-491f-b39f-56ed4221abf1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=hmZjsJa2
X-Spamd-Result: default: False [-3.13 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.com:dkim];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.67)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1E03C1F7E9
X-Spam-Level: 
X-Spam-Score: -3.13
X-Spam-Flag: NO

On 29.02.24 16:32, Jan Beulich wrote:
> On 12.12.2023 10:47, Juergen Gross wrote:
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -541,6 +541,55 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
>>       local_irq_restore(flags);
>>   }
>>   
>> +int nrspin_trylock(rspinlock_t *lock)
>> +{
>> +    check_lock(&lock->debug, true);
>> +
>> +    if ( unlikely(lock->recurse_cpu != SPINLOCK_NO_CPU) )
>> +        return 0;
>> +
>> +    return spin_trylock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>> +}
> 
> I wonder if we shouldn't take the opportunity and stop having trylock
> functions have "int" return type. Perhaps already spin_trylock_common()
> when introduced could use "bool" instead, then here following suit.

Fine with me.

> 
>> +void nrspin_lock(rspinlock_t *lock)
>> +{
>> +    spin_lock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR, NULL,
>> +                     NULL);
>> +}
>> +
>> +void nrspin_unlock(rspinlock_t *lock)
>> +{
>> +    spin_unlock_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>> +}
>> +
>> +void nrspin_lock_irq(rspinlock_t *lock)
>> +{
>> +    ASSERT(local_irq_is_enabled());
>> +    local_irq_disable();
>> +    nrspin_lock(lock);
>> +}
>> +
>> +void nrspin_unlock_irq(rspinlock_t *lock)
>> +{
>> +    nrspin_unlock(lock);
>> +    local_irq_enable();
>> +}
>> +
>> +unsigned long __nrspin_lock_irqsave(rspinlock_t *lock)
>> +{
>> +    unsigned long flags;
>> +
>> +    local_irq_save(flags);
>> +    nrspin_lock(lock);
>> +    return flags;
> 
> Nit: Strictly speaking we want a blank line ahead of this "return".

Okay, will add it.

> 
>> @@ -166,11 +172,15 @@ struct lock_profile_qhead { };
>>   struct lock_profile { };
>>   
>>   #define SPIN_LOCK_UNLOCKED {                                                  \
>> +    .debug =_LOCK_DEBUG,                                                      \
>> +}
>> +#define RSPIN_LOCK_UNLOCKED {                                                 \
>> +    .debug =_LOCK_DEBUG,                                                      \
>>       .recurse_cpu = SPINLOCK_NO_CPU,                                           \
>>       .debug =_LOCK_DEBUG,                                                      \
>>   }
> 
> Initializing .debug twice?

Oh, right. Will drop one.

> 
>> @@ -180,7 +190,6 @@ struct lock_profile { };
>>   
>>   #endif
>>   
>> -
>>   typedef union {
>>       uint32_t head_tail;
>>       struct {
> 
> Looks like this might be undoing what the earlier patch isn't going to
> do anymore?

Yes, seen it already.

> 
>> @@ -242,6 +257,19 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
>>   int rspin_is_locked(const rspinlock_t *lock);
>>   void rspin_barrier(rspinlock_t *lock);
>>   
>> +int nrspin_trylock(rspinlock_t *lock);
>> +void nrspin_lock(rspinlock_t *lock);
>> +void nrspin_unlock(rspinlock_t *lock);
>> +void nrspin_lock_irq(rspinlock_t *lock);
>> +void nrspin_unlock_irq(rspinlock_t *lock);
>> +#define nrspin_lock_irqsave(l, f)                               \
>> +    ({                                                          \
>> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
>> +        ((f) = __nrspin_lock_irqsave(l));                       \
> 
> I don't think the outer pair of parentheses is needed here. As to the
> leading double underscores, see comments elsewhere.

Okay.


Juergen

