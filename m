Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCD84B6C5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676944.1053312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLji-0004mS-0t; Tue, 06 Feb 2024 13:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676944.1053312; Tue, 06 Feb 2024 13:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLjh-0004kK-UG; Tue, 06 Feb 2024 13:43:41 +0000
Received: by outflank-mailman (input) for mailman id 676944;
 Tue, 06 Feb 2024 13:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z75a=JP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXLjg-0004iW-VP
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:43:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc49236a-c4f5-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 14:43:40 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4639222030;
 Tue,  6 Feb 2024 13:43:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E07B132DD;
 Tue,  6 Feb 2024 13:43:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xXpxBYs3wmVGQgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Feb 2024 13:43:39 +0000
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
X-Inumbo-ID: bc49236a-c4f5-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707227019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ktfHFMT+dUDRU7YcjswPtaU36Yaut2wQu0bdPBH468=;
	b=F5uHvTaQfC+hnSpuorNCwbz7+uMIAYuYMuHHpla1YuzZ5dOfldmANwP9PqMvfQJAdlon7n
	KRAKS1Sk9XG8KhtHAJs//hnPdpPssVqTlv2pmB7qasFnCFKhbkWIUSDl2Os6MV2WBVOyky
	WyczExRKQJHJ+TE672fyUYHcIHqLJXY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707227019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ktfHFMT+dUDRU7YcjswPtaU36Yaut2wQu0bdPBH468=;
	b=F5uHvTaQfC+hnSpuorNCwbz7+uMIAYuYMuHHpla1YuzZ5dOfldmANwP9PqMvfQJAdlon7n
	KRAKS1Sk9XG8KhtHAJs//hnPdpPssVqTlv2pmB7qasFnCFKhbkWIUSDl2Os6MV2WBVOyky
	WyczExRKQJHJ+TE672fyUYHcIHqLJXY=
Message-ID: <244f3950-b7e8-4563-8972-bd230021433a@suse.com>
Date: Tue, 6 Feb 2024 14:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/light: don't allow to stop Xenstore stubdom
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240206124345.19433-1-jgross@suse.com>
 <d420a9c2-3fa0-40cc-adf7-ffd88fcffbfe@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d420a9c2-3fa0-40cc-adf7-ffd88fcffbfe@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=F5uHvTaQ
X-Spamd-Result: default: False [-0.11 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 BAYES_HAM(-0.58)[81.36%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.77)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.11
X-Rspamd-Queue-Id: 4639222030
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On 06.02.24 14:08, Andrew Cooper wrote:
> On 06/02/2024 12:43 pm, Juergen Gross wrote:
>> A Xenstore stubdom should never be stoppable.
>>
>> Reject attempts to do so.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> I don't think this is a clever idea.  `xl destroy` is also the "please
> clean up my system when it's in a very dead state" command, and that
> also includes a dead xenstored stubdom.

I don't think xl destroy for a dead Xenstore stubdom will ever work.
xl destroy tries to read (and delete) Xenstore entries, after all.

I think you'd need a program using libxenctrl without all the xl/libxl
actions for achieving this goal. And this would work with my current
patch, too.

> If you're looking for some protection, then maybe a `--force` flag to
> override, but there must be some way of getting this to run.

A system without Xenstore is probably quite useless anyway. At least today
there is no way a new Xenstore would be able to connect to existing domains.

OTOH I'm inclined to add more hooks, e.g. for "xl pause" and "xl migrate".

And I do think that libxl is the right level for that, as I don't want users
to be able to kill/pause/migrate Xenstore stubdom via libvirt either.


Juergen

