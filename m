Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877D4C40BF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278896.476316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWNv-0002f7-BP; Fri, 25 Feb 2022 08:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278896.476316; Fri, 25 Feb 2022 08:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWNv-0002cD-7m; Fri, 25 Feb 2022 08:55:31 +0000
Received: by outflank-mailman (input) for mailman id 278896;
 Fri, 25 Feb 2022 08:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNWNt-0002c5-TH
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:55:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae40d307-9618-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:55:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 984271F380;
 Fri, 25 Feb 2022 08:55:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51E0513B65;
 Fri, 25 Feb 2022 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bGQNEoCZGGKKSAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 08:55:28 +0000
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
X-Inumbo-ID: ae40d307-9618-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645779328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pyth/fAzjgx6z8/eOEJWgQls/CMVJkmukQkaSOGGi3s=;
	b=Ygu6aVVD1EK7Emvssq3ZYnY1lnFzRUarWcaMIg+RoZODEjb+lukIQpUlaDdEYv7vo1QaTe
	V3Ko3M7/oiyC9ZohMED8qAmEUobTjw1gUvVM2jWIwH2aIrO2+nXjSSpfuknNsokv434FNM
	MgH8HUZUVSZhaG7kL6fA2BZeXJW2lio=
Message-ID: <bb003355-1a2c-8145-e227-3799f782a099@suse.com>
Date: Fri, 25 Feb 2022 09:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
 <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
In-Reply-To: <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.02.22 09:36, Juergen Gross wrote:
> On 24.02.22 17:11, Jan Beulich wrote:
>> On 24.02.2022 11:54, Juergen Gross wrote:
>>> --- a/xen/arch/x86/mm/mm-locks.h
>>> +++ b/xen/arch/x86/mm/mm-locks.h
>>> @@ -42,7 +42,7 @@ static inline void mm_lock_init(mm_lock_t *l)
>>>   static inline bool mm_locked_by_me(const mm_lock_t *l)
>>>   {
>>> -    return (l->lock.recurse_cpu == current->processor);
>>> +    return (l->lock.data.cpu == current->processor);
>>>   }
>>
>> I see a fair risk with this: Behavior will now differ between debug and
>> non-debug builds. E.g. a livelock because of trying to acquire the same
>> lock again would not be noticed in a debug build if the acquire is
>> conditional upon this function's return value. I think this is the main
>> reason behind having two separate field, despite the apparent redundancy.
> 
> You are aware that mm_locked_by_me() is used for recursive spinlocks
> only?

BTW, it might make sense to add another bool for the debug case to mark
recursive lock usage. I don't think anything good can come from using a
lock in both modes (recursive and non-recursive).


Juergen

