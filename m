Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE384DC57
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 10:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678044.1055083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0Km-00066j-FU; Thu, 08 Feb 2024 09:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678044.1055083; Thu, 08 Feb 2024 09:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0Km-00065C-CQ; Thu, 08 Feb 2024 09:04:40 +0000
Received: by outflank-mailman (input) for mailman id 678044;
 Thu, 08 Feb 2024 09:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY0Kk-0005y8-P4
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 09:04:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 155d51a8-c661-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 10:04:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7855C1FCA1;
 Thu,  8 Feb 2024 09:04:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 526ED13984;
 Thu,  8 Feb 2024 09:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uJ49ESSZxGWsDwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 09:04:36 +0000
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
X-Inumbo-ID: 155d51a8-c661-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707383076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eANjPaCqnr9toahltFFLE8rScNrnblAcR5iml7qQCQ=;
	b=j20+MF2+2SFSq7UYrbOFkXcU5AP6aDBR9PC7cX3DclSbRGZhqC3nRovoDRtqzzOwmlpwou
	xWASntiTxNXfDBvA1MvuTa4ANf+KpDdfrMkF0P5QJrmvkeQqPMSkBlYZroxPT7mWP7WRO9
	Sg8gsDL0KJV1EFjDURKviVCH+77RVpk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707383076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eANjPaCqnr9toahltFFLE8rScNrnblAcR5iml7qQCQ=;
	b=j20+MF2+2SFSq7UYrbOFkXcU5AP6aDBR9PC7cX3DclSbRGZhqC3nRovoDRtqzzOwmlpwou
	xWASntiTxNXfDBvA1MvuTa4ANf+KpDdfrMkF0P5QJrmvkeQqPMSkBlYZroxPT7mWP7WRO9
	Sg8gsDL0KJV1EFjDURKviVCH+77RVpk=
Message-ID: <264ea079-35d2-44b9-962c-8e8427af7bcd@suse.com>
Date: Thu, 8 Feb 2024 10:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/32] tools/xen-9pfsd: add 9pfs read request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-15-jgross@suse.com>
 <CAKf6xpvZP-kGpPMvbVm-e=f-RQ3Czb24VnmwMzTc915O9hQJcg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <CAKf6xpvZP-kGpPMvbVm-e=f-RQ3Czb24VnmwMzTc915O9hQJcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.57 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-0.01)[47.38%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.67)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.57

On 08.02.24 02:28, Jason Andryuk wrote:
> On Mon, Feb 5, 2024 at 5:51 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> Add the read request of the 9pfs protocol.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>> V2:
>> - make error check more readable (Jason Andryuk)
>> V4:
>> - add directory read support
>> ---
>>   tools/xen-9pfsd/io.c | 90 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
>> index b763e3d8d9..cfbf3bef59 100644
>> --- a/tools/xen-9pfsd/io.c
>> +++ b/tools/xen-9pfsd/io.c
> 
>> +
>> +    len = count;
>> +    buf = ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
>> +
>> +    if ( fidp->isdir )
>> +    {
>> +        struct dirent *dirent;
>> +        struct stat st;
>> +        struct p9_stat p9s;
>> +
> 
> """
> For directories, read returns an integral number of direc- tory
> entries exactly as in stat (see stat(5)), one for each member of the
> directory. The read request message must have offset equal to zero or
> the value of offset in the previous read on the directory, plus the
> number of bytes returned in the previous read. In other words, seeking
> other than to the beginning is illegal in a directory (see seek(2)).
> """
> 
> I think you need to check `off`.  Looks like QEMU only checks for off
> == 0 and rewinds in that case.  QEMU ignores other values.

Oh, indeed. Thanks for noticing. I'll use the same approach as qemu.


Juergen

