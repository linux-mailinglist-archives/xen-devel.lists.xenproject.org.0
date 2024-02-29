Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353D86CF26
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687296.1070561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjHP-0001v2-1j; Thu, 29 Feb 2024 16:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687296.1070561; Thu, 29 Feb 2024 16:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjHO-0001sS-UZ; Thu, 29 Feb 2024 16:29:06 +0000
Received: by outflank-mailman (input) for mailman id 687296;
 Thu, 29 Feb 2024 16:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfjHN-0001sI-Uc
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:29:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ad33fa-d71f-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:29:03 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 169191F7FB;
 Thu, 29 Feb 2024 16:29:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7A4013A4B;
 Thu, 29 Feb 2024 16:29:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y1jZLs6w4GXTPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 16:29:02 +0000
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
X-Inumbo-ID: a6ad33fa-d71f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709224143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKdLELKEgs3KqopRitC+wX3U/F20nUCJT7pBkAQ+XZ4=;
	b=NrI+tDjouDihNdoeIn2r+m/tOxVlzCx16gStSxEX8mdUYgkIYd3//IYFVJSMyo9jp2c2Br
	aa0pDe7G8d7KR/7LDJZ+BwdosKbX/199JAiA7twvLs45bEQSgAXCe9zizA7hyieAcUndvP
	Dddlh+efRi1Z84ZeEUg/bd2MwtcZc7I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709224143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKdLELKEgs3KqopRitC+wX3U/F20nUCJT7pBkAQ+XZ4=;
	b=NrI+tDjouDihNdoeIn2r+m/tOxVlzCx16gStSxEX8mdUYgkIYd3//IYFVJSMyo9jp2c2Br
	aa0pDe7G8d7KR/7LDJZ+BwdosKbX/199JAiA7twvLs45bEQSgAXCe9zizA7hyieAcUndvP
	Dddlh+efRi1Z84ZeEUg/bd2MwtcZc7I=
Message-ID: <f6658df0-13f2-4129-afcd-0f122c87132b@suse.com>
Date: Thu, 29 Feb 2024 17:29:02 +0100
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <c96542eb-daf4-4ce2-915e-86ca8e1848b5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.59
X-Spamd-Result: default: False [-0.59 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.01)[51.54%];
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

On 29.02.24 16:46, Jan Beulich wrote:
> On 12.12.2023 10:47, Juergen Gross wrote:
>> Allow 16 bits per cpu number, which is the limit imposed by
>> spinlock_tickets_t.
>>
>> This will allow up to 65535 cpus, while increasing only the size of
>> recursive spinlocks in debug builds from 8 to 12 bytes.
> 
> I think we want to be more conservative here, for the case of there
> being bugs: The CPU holding a lock may wrongly try to acquire it a
> 2nd time. That's the 65536th ticket then, wrapping the value.

Is this really a problem? There will be no other cpu left seeing the lock
as "free" in this case, as all others will be waiting for the head to reach
their private tail value.

> Therefore my suggestion would be to only (mention) go(ing) up to 32k.
> 
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/common/spinlock.c      |  1 +
>>   xen/include/xen/spinlock.h | 18 +++++++++---------
>>   2 files changed, 10 insertions(+), 9 deletions(-)
> 
> Shouldn't this also bump the upper bound of the NR_CPUS range then
> in xen/arch/Kconfig?

Fine with me, I can add another patch to the series doing that.


Juergen

