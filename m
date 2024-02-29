Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA286CB4C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687171.1070179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhF6-0000Wa-BX; Thu, 29 Feb 2024 14:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687171.1070179; Thu, 29 Feb 2024 14:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhF6-0000Uy-8M; Thu, 29 Feb 2024 14:18:36 +0000
Received: by outflank-mailman (input) for mailman id 687171;
 Thu, 29 Feb 2024 14:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfhF4-0000Sl-B6
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:18:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b40fab7-d70d-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:18:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 816F72236C;
 Thu, 29 Feb 2024 14:18:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10DB213503;
 Thu, 29 Feb 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bh2hATiS4GUxHgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 14:18:32 +0000
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
X-Inumbo-ID: 6b40fab7-d70d-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709216312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwFpXNyFH3FHcysLv87lCl1U+yDO/aQTyRzGoVPXfk0=;
	b=LXHHPEpeRIX7Jjc7n2+skF3WJ90LfFrf27VWd6Klmmc+Igh/hwuU4/QACuzB3zG7KGFRfx
	OQs3FDBzTBZBWVKmAHmz2aqWIyLUB9dcSFF/sOr1FKqJzZWYCspwi1kF0vR7TO0CS750Q2
	W1dcVeXNWB45aGgDkmL0Jk1oJUU6/GI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709216312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwFpXNyFH3FHcysLv87lCl1U+yDO/aQTyRzGoVPXfk0=;
	b=LXHHPEpeRIX7Jjc7n2+skF3WJ90LfFrf27VWd6Klmmc+Igh/hwuU4/QACuzB3zG7KGFRfx
	OQs3FDBzTBZBWVKmAHmz2aqWIyLUB9dcSFF/sOr1FKqJzZWYCspwi1kF0vR7TO0CS750Q2
	W1dcVeXNWB45aGgDkmL0Jk1oJUU6/GI=
Message-ID: <b9865ed2-694a-4c88-963c-c9bb41727f1d@suse.com>
Date: Thu, 29 Feb 2024 15:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-10-jgross@suse.com>
 <1517146f-8bd9-4c8c-95d6-10b754e85d75@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <1517146f-8bd9-4c8c-95d6-10b754e85d75@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LXHHPEpe
X-Spamd-Result: default: False [-1.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.90)[86.07%];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 816F72236C
X-Spam-Level: 
X-Spam-Score: -1.49
X-Spam-Flag: NO

On 29.02.24 15:14, Jan Beulich wrote:
> On 12.12.2023 10:47, Juergen Gross wrote:
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -458,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
>>       spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>>   }
>>   
>> +int rspin_is_locked(const rspinlock_t *lock)
>> +{
>> +    /*
>> +     * Recursive locks may be locked by another CPU, yet we return
>> +     * "false" here, making this function suitable only for use in
>> +     * ASSERT()s and alike.
>> +     */
>> +    return lock->recurse_cpu == SPINLOCK_NO_CPU
>> +           ? spin_is_locked_common(&lock->tickets)
>> +           : lock->recurse_cpu == smp_processor_id();
>> +}
>> +
>> +void rspin_barrier(rspinlock_t *lock)
>> +{
>> +    spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>> +}
> 
> Ah, here we go. Looks all okay to me, but needs re-ordering such that the
> earlier patch won't transiently introduce a regression.

Yes, just wanted to answer something similar to your remark on patch 8.


Juergen

