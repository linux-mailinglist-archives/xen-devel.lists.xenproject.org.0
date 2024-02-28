Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C886B4AD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 17:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686741.1069152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMhj-00047e-F0; Wed, 28 Feb 2024 16:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686741.1069152; Wed, 28 Feb 2024 16:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfMhj-00045X-BY; Wed, 28 Feb 2024 16:22:47 +0000
Received: by outflank-mailman (input) for mailman id 686741;
 Wed, 28 Feb 2024 16:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EdaL=KF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfMhh-000444-Ry
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 16:22:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a1adc8c-d655-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 17:22:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BB421F796;
 Wed, 28 Feb 2024 16:22:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E092513A58;
 Wed, 28 Feb 2024 16:22:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HEg/NdNd32UIEgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 28 Feb 2024 16:22:43 +0000
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
X-Inumbo-ID: 9a1adc8c-d655-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709137364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pasyg7Lr8XSdWfcKR2Tf73gW2fkWyLHtMJIArEbeWac=;
	b=ICqeFfEEp8iC1NByTOzdUmMN2tSf1EhwDT0Daj01lLsKfcTVd/ydT+OTQNj7U/UdRrWJJP
	CYjJb8AgDZEoHJdxTSGykw7+/b+Q+pTYkFQuXVpUBWAxAsIUnl13AjRP3mn5A8AMtdHJ5P
	ClyikKu0wVzemWGhGBP7aFCDDw7LLEY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709137364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pasyg7Lr8XSdWfcKR2Tf73gW2fkWyLHtMJIArEbeWac=;
	b=ICqeFfEEp8iC1NByTOzdUmMN2tSf1EhwDT0Daj01lLsKfcTVd/ydT+OTQNj7U/UdRrWJJP
	CYjJb8AgDZEoHJdxTSGykw7+/b+Q+pTYkFQuXVpUBWAxAsIUnl13AjRP3mn5A8AMtdHJ5P
	ClyikKu0wVzemWGhGBP7aFCDDw7LLEY=
Message-ID: <9256b285-22b5-4c0c-8577-2b8832fb6e19@suse.com>
Date: Wed, 28 Feb 2024 17:22:43 +0100
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
 <99aca5d7-87f1-4cce-a23d-3e1468ba3918@suse.com>
 <8a0397c8-4ce6-4f4b-8a50-b0deaa30f291@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <8a0397c8-4ce6-4f4b-8a50-b0deaa30f291@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.58
X-Spamd-Result: default: False [-3.58 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 28.02.24 17:02, Jan Beulich wrote:
> On 28.02.2024 16:43, Jürgen Groß wrote:
>> On 28.02.24 16:19, Jan Beulich wrote:
>>> On 12.12.2023 10:47, Juergen Gross wrote:
>>>> --- a/xen/common/spinlock.c
>>>> +++ b/xen/common/spinlock.c
>>>> @@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
>>>>    static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>>>>        int32_t type, int32_t idx, void *par)
>>>>    {
>>>> -    struct spinlock *lock = data->lock;
>>>> +    unsigned int cpu;
>>>> +    uint32_t lockval;
>>>
>>> Any reason for this not being unsigned int as well? The more that ...
>>>
>>>> +    if ( data->is_rlock )
>>>> +    {
>>>> +        cpu = data->rlock->debug.cpu;
>>>> +        lockval = data->rlock->tickets.head_tail;
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        cpu = data->lock->debug.cpu;
>>>> +        lockval = data->lock->tickets.head_tail;
>>>> +    }
>>
>> I've used the same type as tickets.head_tail.
>>
>>>>    
>>>>        printk("%s ", lock_profile_ancs[type].name);
>>>>        if ( type != LOCKPROF_TYPE_GLOBAL )
>>>>            printk("%d ", idx);
>>>> -    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
>>>> -           lock->tickets.head_tail);
>>>> -    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
>>>> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);
>>>
>>> ... it's then printed with plain x as the format char.
>>
>> Which hasn't been changed by the patch. I can change it to PRIx32 if you want.
> 
> As per ./CODING_STYLE unsigned int is preferred.

Okay, I'll switch to unsigned int then.

> 
>>>> --- a/xen/include/xen/spinlock.h
>>>> +++ b/xen/include/xen/spinlock.h
>>>> @@ -76,13 +76,19 @@ union lock_debug { };
>>>>    */
>>>>    
>>>>    struct spinlock;
>>>> +/* Temporary hack until a dedicated struct rspinlock is existing. */
>>>> +#define rspinlock spinlock
>>>>    
>>>>    struct lock_profile {
>>>>        struct lock_profile *next;       /* forward link */
>>>>        const char          *name;       /* lock name */
>>>> -    struct spinlock     *lock;       /* the lock itself */
>>>> +    union {
>>>> +        struct spinlock *lock;       /* the lock itself */
>>>> +        struct rspinlock *rlock;     /* the recursive lock itself */
>>>> +    };
>>>
>>> _LOCK_PROFILE() wants to initialize this field, unconditionally using
>>> .lock. While I expect that problem to be taken care of in one of the
>>> later patches, use of the macro won't work anymore with this union in
>>> use with very old gcc that formally we still support. While a road to
>>> generally raising the baseline requirements is still pretty unclear to
>>> me, an option might be to require (and document) that to enable
>>> DEBUG_LOCK_PROFILE somewhat newer gcc needs using.
>>
>> Patch 8 is using either .lock or .rlock depending on the lock type.
>>
>> What is the problem with the old gcc version? Static initializers of
>> anonymous union members?
> 
> Yes.

The easiest solution might then be to give the union a name.


Juergen


