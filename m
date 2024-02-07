Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4499884CBE2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677605.1054317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiFP-0006ER-3q; Wed, 07 Feb 2024 13:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677605.1054317; Wed, 07 Feb 2024 13:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiFP-0006C5-0c; Wed, 07 Feb 2024 13:45:55 +0000
Received: by outflank-mailman (input) for mailman id 677605;
 Wed, 07 Feb 2024 13:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXiFN-0006Bz-Vu
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:45:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d76ce3-c5bf-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:45:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 547601FBEF;
 Wed,  7 Feb 2024 13:45:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 132D8139B9;
 Wed,  7 Feb 2024 13:45:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JpoXA5CJw2V8IAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 13:45:52 +0000
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
X-Inumbo-ID: 35d76ce3-c5bf-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707313552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btRrZ2d6dG4l77btXYu/GOJanzf/esV5Gu927V0bFqQ=;
	b=WVBtd10ThbwypMHzs1Jtko5BqmJ42eJZPdx68JxB1zIEwAMcMdld2cj5PQzBeCYzS4YdYc
	mZVo19TbaPOyB01O6J3xiMrI1cSX8LzVZp3gKfIuowS7o5k/35NZlF+BWN0MK+KdW2aBIc
	kWzqRqt4ZvYC89aPys7rqSnjdbyXECY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707313552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btRrZ2d6dG4l77btXYu/GOJanzf/esV5Gu927V0bFqQ=;
	b=WVBtd10ThbwypMHzs1Jtko5BqmJ42eJZPdx68JxB1zIEwAMcMdld2cj5PQzBeCYzS4YdYc
	mZVo19TbaPOyB01O6J3xiMrI1cSX8LzVZp3gKfIuowS7o5k/35NZlF+BWN0MK+KdW2aBIc
	kWzqRqt4ZvYC89aPys7rqSnjdbyXECY=
Message-ID: <fedffedf-0f0c-48f6-a1ea-5adfbf118257@suse.com>
Date: Wed, 7 Feb 2024 14:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] config: update Mini-OS commit
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240207133106.6185-1-jgross@suse.com>
 <13384e3e-c947-4cb3-a39a-b1ef801f0d12@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <13384e3e-c947-4cb3-a39a-b1ef801f0d12@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=WVBtd10T
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.39 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[43.99%];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 NEURAL_HAM_SHORT(-0.20)[-0.992];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,config.mk:url,suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(1.11)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -0.39
X-Rspamd-Queue-Id: 547601FBEF
X-Spam-Flag: NO

On 07.02.24 14:41, Julien Grall wrote:
> Hi Juergen,
> 
> On 07/02/2024 13:31, Juergen Gross wrote:
>> Update the Mini-OS upstream revision.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   Config.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Config.mk b/Config.mk
>> index f7d6d84847..077d841bb7 100644
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= 
>> https://xenbits.xen.org/git-http/qemu-xen.git
>>   QEMU_UPSTREAM_REVISION ?= master
>>   MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>> -MINIOS_UPSTREAM_REVISION ?= 090eeeb1631f00a9a41ebf66d9b4aacb97eb51e7
>> +MINIOS_UPSTREAM_REVISION ?= b119f0178fd86876d0678007dfcf435ab8bb7568
> 
> I looked at the changes and I am puzzled by one. In p9_stat(), I see a call with:
> 
>    free_stat(&stat);
> 
> 'stat' is defined as 'struct p9_stat *stat' and 'free_stat' expects a 'struct 
> p9_stat'.
> 
> Wouldn't this resuilt to a build error?

Hmm, I'm puzzled, too. I didn't see a build error when doing "make testbuild".

But I agree that this looks very suspicious.

Oh, in test builds we don't have HAVE_LIBC defined. I just verified that
9pfront.c gets compiled, while I didn't pay attention to the parts which were
compiled during the build. Shame on me!

Fixup patch coming soon...

Thanks for noticing!


Juergen

