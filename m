Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C886B380
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686725.1069111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfM5M-0002FD-QT; Wed, 28 Feb 2024 15:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686725.1069111; Wed, 28 Feb 2024 15:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfM5M-0002Dh-Ni; Wed, 28 Feb 2024 15:43:08 +0000
Received: by outflank-mailman (input) for mailman id 686725;
 Wed, 28 Feb 2024 15:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EdaL=KF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfM5L-0002Db-Je
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:43:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1098a6d5-d650-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 16:43:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA8201F7C5;
 Wed, 28 Feb 2024 15:43:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A738B13A5D;
 Wed, 28 Feb 2024 15:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3N8iJ4lU32W6CAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 28 Feb 2024 15:43:05 +0000
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
X-Inumbo-ID: 1098a6d5-d650-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709134986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMI8Uu9+chYTcBUcNm9qfVC5FSLSs/YUdASWkUTPQqY=;
	b=tHhfoRiWdiLUhQaOfCPZYXwj2bPKgmyOU43rZrp8xKJ0/UJXzfzY2NrkjHxsTlwQXgZG1V
	vm1Be0wkOW3BCveeyywta4Y0MJlA0Kl1lpsJ2ZmCgibJs9WXqcvKAjS47LsAo0eqNuX5xe
	IybchevhopihY/VlRvQT1sDqIbd6v2M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709134985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMI8Uu9+chYTcBUcNm9qfVC5FSLSs/YUdASWkUTPQqY=;
	b=c5Xl4xiWxPRPoo0bVB1PhPXti+AHDX0q7GkJkWMG97ggp7tdQKB33Ayd4Pq9XcyEOZbHOe
	H/GywQaWKPQ40G1e90ZwhRA8LX/RNTHGLfgNhJpOvA+RTRtDPi3ujSPp/FsnEVgnB96P4p
	nFcYU2V16kILwjjbFh7xiC2u5/rX4/g=
Message-ID: <99aca5d7-87f1-4cce-a23d-3e1468ba3918@suse.com>
Date: Wed, 28 Feb 2024 16:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <b76bff63-80de-4227-bcd9-8d3aa1275858@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <b76bff63-80de-4227-bcd9-8d3aa1275858@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=c5Xl4xiW
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.79 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -3.79
X-Rspamd-Queue-Id: EA8201F7C5
X-Spam-Flag: NO

On 28.02.24 16:19, Jan Beulich wrote:
> On 12.12.2023 10:47, Juergen Gross wrote:
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
>>   static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>>       int32_t type, int32_t idx, void *par)
>>   {
>> -    struct spinlock *lock = data->lock;
>> +    unsigned int cpu;
>> +    uint32_t lockval;
> 
> Any reason for this not being unsigned int as well? The more that ...
> 
>> +    if ( data->is_rlock )
>> +    {
>> +        cpu = data->rlock->debug.cpu;
>> +        lockval = data->rlock->tickets.head_tail;
>> +    }
>> +    else
>> +    {
>> +        cpu = data->lock->debug.cpu;
>> +        lockval = data->lock->tickets.head_tail;
>> +    }

I've used the same type as tickets.head_tail.

>>   
>>       printk("%s ", lock_profile_ancs[type].name);
>>       if ( type != LOCKPROF_TYPE_GLOBAL )
>>           printk("%d ", idx);
>> -    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
>> -           lock->tickets.head_tail);
>> -    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
>> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);
> 
> ... it's then printed with plain x as the format char.

Which hasn't been changed by the patch. I can change it to PRIx32 if you want.

> 
>> +    if ( cpu == SPINLOCK_NO_CPU )
>>           printk("not locked\n");
>>       else
>> -        printk("cpu=%d\n", lock->debug.cpu);
>> -    printk("  lock:%" PRId64 "(%" PRI_stime "), block:%" PRId64 "(%" PRI_stime ")\n",
>> -           data->lock_cnt, data->time_hold, data->block_cnt, data->time_block);
>> +        printk("cpu=%u\n", cpu);
>> +    printk("  lock:%" PRIu64 "(%" PRI_stime "), block:%" PRIu64 "(%" PRI_stime ")\n",
>> +           data->lock_cnt, data->time_hold, (uint64_t)data->block_cnt,
> 
> I think I know why the cast is suddenly / unexpectedly needed, but imo
> such wants stating in the description, when generally we aim at avoiding
> casts where possible.

Okay, will add a sentence.

> 
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -76,13 +76,19 @@ union lock_debug { };
>>   */
>>   
>>   struct spinlock;
>> +/* Temporary hack until a dedicated struct rspinlock is existing. */
>> +#define rspinlock spinlock
>>   
>>   struct lock_profile {
>>       struct lock_profile *next;       /* forward link */
>>       const char          *name;       /* lock name */
>> -    struct spinlock     *lock;       /* the lock itself */
>> +    union {
>> +        struct spinlock *lock;       /* the lock itself */
>> +        struct rspinlock *rlock;     /* the recursive lock itself */
>> +    };
> 
> _LOCK_PROFILE() wants to initialize this field, unconditionally using
> .lock. While I expect that problem to be taken care of in one of the
> later patches, use of the macro won't work anymore with this union in
> use with very old gcc that formally we still support. While a road to
> generally raising the baseline requirements is still pretty unclear to
> me, an option might be to require (and document) that to enable
> DEBUG_LOCK_PROFILE somewhat newer gcc needs using.

Patch 8 is using either .lock or .rlock depending on the lock type.

What is the problem with the old gcc version? Static initializers of
anonymous union members?

> 
>>       uint64_t            lock_cnt;    /* # of complete locking ops */
>> -    uint64_t            block_cnt;   /* # of complete wait for lock */
>> +    uint64_t            block_cnt:63; /* # of complete wait for lock */
>> +    uint64_t            is_rlock:1;  /* use rlock pointer */
> 
> bool?

Yes.


Juergen

