Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64386CFFF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 18:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687361.1070730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjpU-00037y-H0; Thu, 29 Feb 2024 17:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687361.1070730; Thu, 29 Feb 2024 17:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjpU-00036D-Ds; Thu, 29 Feb 2024 17:04:20 +0000
Received: by outflank-mailman (input) for mailman id 687361;
 Thu, 29 Feb 2024 17:04:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfjpT-000362-Ek
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 17:04:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92bc3eca-d724-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 18:04:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D94611F7FB;
 Thu, 29 Feb 2024 17:04:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB0413A4B;
 Thu, 29 Feb 2024 17:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h8m9JBC54GWuRwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 17:04:16 +0000
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
X-Inumbo-ID: 92bc3eca-d724-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709226256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CpIhu/fNvYnfU69bJy54gkBsvNjkEKe9ROl0WvT9ts8=;
	b=A3D+twB/qA4CJ/Jy5isozdiOBE2GrHUj0OfSrBG+tY8luFOc3WZCE8Jpy8dD2nJxu6r39H
	w9JQ0hdtS/1NR3IGxQyJQA9XZs6eyaWmhcXi/e3hVU0d0g6Iu0eZTlci6uoQr8EtBuBb8J
	O+g5JRYGxpMd5JioUbWhuUZNiRZnplY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709226256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CpIhu/fNvYnfU69bJy54gkBsvNjkEKe9ROl0WvT9ts8=;
	b=A3D+twB/qA4CJ/Jy5isozdiOBE2GrHUj0OfSrBG+tY8luFOc3WZCE8Jpy8dD2nJxu6r39H
	w9JQ0hdtS/1NR3IGxQyJQA9XZs6eyaWmhcXi/e3hVU0d0g6Iu0eZTlci6uoQr8EtBuBb8J
	O+g5JRYGxpMd5JioUbWhuUZNiRZnplY=
Message-ID: <84f700a6-1a98-41a9-bb29-4da2c2f802b0@suse.com>
Date: Thu, 29 Feb 2024 18:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <c96542eb-daf4-4ce2-915e-86ca8e1848b5@suse.com>
 <f6658df0-13f2-4129-afcd-0f122c87132b@suse.com>
 <f2d107a1-0bcf-4d71-89e8-819ee38e0651@suse.com>
 <58241a32-6671-41e5-8403-5d1b1c4236d2@suse.com>
 <305dcff3-b37b-4f19-bd79-6e8c71c6d850@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <305dcff3-b37b-4f19-bd79-6e8c71c6d850@suse.com>
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
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 29.02.24 17:54, Jan Beulich wrote:
> On 29.02.2024 17:45, Juergen Gross wrote:
>> On 29.02.24 17:31, Jan Beulich wrote:
>>> On 29.02.2024 17:29, Jürgen Groß wrote:
>>>> On 29.02.24 16:46, Jan Beulich wrote:
>>>>> On 12.12.2023 10:47, Juergen Gross wrote:
>>>>>> Allow 16 bits per cpu number, which is the limit imposed by
>>>>>> spinlock_tickets_t.
>>>>>>
>>>>>> This will allow up to 65535 cpus, while increasing only the size of
>>>>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>>>>
>>>>> I think we want to be more conservative here, for the case of there
>>>>> being bugs: The CPU holding a lock may wrongly try to acquire it a
>>>>> 2nd time. That's the 65536th ticket then, wrapping the value.
>>>>
>>>> Is this really a problem? There will be no other cpu left seeing the lock
>>>> as "free" in this case, as all others will be waiting for the head to reach
>>>> their private tail value.
>>>
>>> But isn't said CPU then going to make progress, rather than indefinitely
>>> spinning on the lock?
>>
>> No, I don't think so.
> 
> Hmm. If CPU0 takes a pristine lock, it'll get ticket 0x0000. All other
> CPUs will get tickets 0x0001 ... 0xffff. Then CPU0 trying to take the lock

No, they'll get 0x0001 ... 0xfffe (only 65535 cpus are supported).

> again will get ticket 0x0000 again, which equals what .head still has (no

And the first cpu will get 0xffff when trying to get the lock again.

> unlocks so far), thus signalling the lock to be free when it isn't.
> 
>> The limit isn't 65535 because of the ticket mechanism, but because of the
>> rspin mechanism, where we need a "no cpu is owning the lock" value. Without
>> the recursive locks the limit would be 65536 (or 4096 today).
> 
> I think this rather belongs ...

No, that was meant to tell you that without programming bug 65536 cpus would
be perfectly fine for the ticket mechanism, and with bug 65535 cpus are fine.

> 
>>>>> Therefore my suggestion would be to only (mention) go(ing) up to 32k.
>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>> ---
>>>>>>     xen/common/spinlock.c      |  1 +
>>>>>>     xen/include/xen/spinlock.h | 18 +++++++++---------
>>>>>>     2 files changed, 10 insertions(+), 9 deletions(-)
>>>>>
>>>>> Shouldn't this also bump the upper bound of the NR_CPUS range then
>>>>> in xen/arch/Kconfig?
>>>>
>>>> Fine with me, I can add another patch to the series doing that.
>>>
>>> Why not do it right here? The upper bound there is like it is only
>>> because of the restriction that's lifted here.
> 
> ... here (for having nothing to do with the supposed lack of hanging
> that I'm seeing)?
> 
>> I'd prefer splitting the two instances, but if you prefer it to be in a
>> single patch, so be it.
> 
> I'm not going to insist - if want to do it separately, please do.
> Perhaps others would actually prefer it that way ...

Okay. I'll do it in another patch.


Juergen

